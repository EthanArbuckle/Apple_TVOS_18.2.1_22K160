void *sub_28EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *result;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  __int128 v98;
  void v99[3];
  __int128 v100;
  uint64_t v101;
  void v102[3];
  __int128 v103;
  uint64_t v104;
  void v105[3];
  __int128 v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  uint64_t v111;
  void v112[3];
  __int128 v113;
  uint64_t v114;
  void v115[3];
  __int128 v116;
  uint64_t v117;
  void v118[3];
  _BYTE v119[24];
  uint64_t v120;
  char v121[8];
  _BYTE v122[16];
  sub_39C4(&qword_14628);
  __chkstk_darwin();
  v91 = (char *)&v88 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v5 = type metadata accessor for IntentType(0LL);
  v96 = *(void **)(v5 - 8);
  v97 = v5;
  __chkstk_darwin();
  v7 = (uint64_t *)((char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v8 = *(void *)(a1 + 24);
  v98 = *(_OWORD *)(a1 + 32);
  sub_3AE8((void *)a1, v8);
  v9 = *(void *)(a2 + 48);
  *(void *)v119 = v8;
  *(_OWORD *)&v119[8] = v98;
  sub_3A04(v118);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)(v9, v8, v98);
  v10 = *(void *)&v119[16];
  v98 = *(_OWORD *)v119;
  v11 = *(void *)v119;
  sub_3AE8(v118, *(uint64_t *)v119);
  v12 = *(void *)(a2 + 32);
  v116 = v98;
  v117 = v10;
  sub_3A04(v115);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)(v12, v11, v10);
  v13 = v117;
  v98 = v116;
  v14 = v116;
  sub_3AE8(v115, v116);
  v15 = *(void *)(a2 + 40);
  v113 = v98;
  v114 = v13;
  sub_3A04(v112);
  dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)(v15, v14, v13);
  v16 = v114;
  v98 = v113;
  v17 = v113;
  sub_3AE8(v112, v113);
  v18 = *(void *)(a2 + 56);
  v19 = *(void *)(a2 + 64);
  v110 = v98;
  v111 = v16;
  sub_3A04(&v108);
  dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)(v18, v19, v17, v16);
  v20 = v111;
  v98 = v110;
  v21 = v110;
  sub_3AE8(&v108, v110);
  v22 = *(void *)(a2 + 16);
  v23 = *(void *)(a2 + 24);
  v106 = v98;
  v107 = v20;
  sub_3A04(v105);
  dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)(v22, v23, v21, v20);
  v24 = v107;
  v98 = v106;
  v25 = v106;
  sub_3AE8(v105, v106);
  v26 = *(void *)(a2 + 72);
  v27 = *(void *)(a2 + 80);
  v103 = v98;
  v104 = v24;
  sub_3A04(v102);
  dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)(v26, v27, v25, v24);
  v28 = v104;
  v98 = v103;
  v29 = v103;
  sub_3AE8(v102, v103);
  v30 = sub_832C(*(_BYTE *)(a2 + 88));
  v32 = v31;
  v100 = v98;
  v101 = v28;
  sub_3A04(v99);
  dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)(v30, v32, v29, v28);
  swift_bridgeObjectRelease(v32);
  sub_3A40(v99);
  sub_3A40(v102);
  sub_3A40(v105);
  sub_3A40(&v108);
  sub_3A40(v112);
  sub_3A40(v115);
  sub_3A40(v118);
  sub_3A60(a2 + 120, (uint64_t)v122, &qword_14630);
  sub_3A60((uint64_t)v122, (uint64_t)v99, &qword_14630);
  v33 = v99[0];
  if (v99[0])
  {
    v34 = *(void *)(a1 + 40);
    v98 = *(_OWORD *)(a1 + 24);
    v35 = v98;
    sub_3AE8((void *)a1, v98);
    *(_OWORD *)v119 = v98;
    *(void *)&v119[16] = v34;
    sub_3A04(v118);
    dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)(v33, v35, v34);
    sub_3A40(v118);
  }

  sub_3A60(a2 + 128, (uint64_t)v121, &qword_14638);
  sub_3A60((uint64_t)v121, (uint64_t)v102, &qword_14638);
  v36 = v102[0];
  if (v102[0])
  {
    v37 = *(void *)(a1 + 40);
    v98 = *(_OWORD *)(a1 + 24);
    v38 = v98;
    sub_3AE8((void *)a1, v98);
    *(_OWORD *)v119 = v98;
    *(void *)&v119[16] = v37;
    sub_3A04(v118);
    dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)(v36, v38, v37);
    sub_3A40(v118);
  }

  sub_3A60(a2 + 96, (uint64_t)v105, &qword_14640);
  sub_3A60((uint64_t)v105, (uint64_t)&v108, &qword_14640);
  v39 = v109;
  if (v109)
  {
    v40 = v108;
    v41 = *(void *)(a1 + 24);
    v98 = *(_OWORD *)(a1 + 32);
    sub_3AE8((void *)a1, v41);
    *(void *)v119 = v41;
    *(_OWORD *)&v119[8] = v98;
    sub_3A04(v118);
    dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.enableThirdPartyIntents(_:)(v40, v39, v41, v98);
    sub_3A40(v118);
  }

  if ((*(_BYTE *)(a2 + 89) & 1) != 0)
  {
    v42 = *(void *)(a1 + 40);
    v98 = *(_OWORD *)(a1 + 24);
    v43 = v98;
    sub_3AE8((void *)a1, v98);
    *(_OWORD *)v119 = v98;
    *(void *)&v119[16] = v42;
    sub_3A04(v118);
    dispatch thunk of SuggestionDetailsBuilder.requiresNetworkConnection()(v43, v42);
    sub_3A40(v118);
  }

  v45 = *(void *)(a2 + 152);
  v44 = *(void *)(a2 + 160);
  v89 = a2;
  if ((v45 || v44 != 0xE000000000000000LL)
    && (_stringCompareWithSmolCheck(_:_:expecting:)(v45, v44, 0LL, 0xE000000000000000LL, 0LL) & 1) == 0)
  {
    v46 = *(void *)(a1 + 40);
    v98 = *(_OWORD *)(a1 + 24);
    v47 = v98;
    sub_3AE8((void *)a1, v98);
    *v7 = v45;
    v7[1] = v44;
    v48 = v7;
    v50 = v96;
    v49 = v97;
    ((void (*)(void *, void, uint64_t))v96[13])(v48, enum case for IntentType.inIntent(_:), v97);
    *(_OWORD *)v119 = v98;
    *(void *)&v119[16] = v46;
    sub_3A04(v118);
    swift_bridgeObjectRetain(v44);
    dispatch thunk of SuggestionDetailsBuilder.intentIdentifier(_:)(v48, v47, v46);
    ((void (*)(void *, uint64_t))v50[1])(v48, v49);
    sub_3A40(v118);
  }

  v51 = v89;
  v52 = *(void *)(v89 + 168);
  v120 = v52;
  v53 = *(void *)(v52 + 16);
  if (v53)
  {
    v90 = type metadata accessor for ResolvableParameter(0LL);
    v54 = v52 + 32;
    swift_bridgeObjectRetain(v52);
    v55 = v91;
    do
    {
      *(void *)&v98 = v53;
      sub_3AA4(v54, (uint64_t)v115);
      v95 = *(void *)(a1 + 40);
      v94 = *(_OWORD *)(a1 + 24);
      v97 = v94;
      v96 = sub_3AE8((void *)a1, v94);
      v56 = v116;
      sub_3AE8(v115, v116);
      v57 = 8LL * (*(char (**)(void, void))(*((void *)&v56 + 1) + 8LL))(v56, *((void *)&v56 + 1));
      v58 = *(void *)&aSongnameartist[v57];
      v92 = *(void *)&aSongnameartist[v57 + 40];
      v93 = v58;
      v59 = *((void *)&v116 + 1);
      v60 = v116;
      sub_3AE8(v115, v116);
      v61 = 8LL * (*(char (**)(uint64_t, uint64_t))(v59 + 8))(v60, v59);
      v62 = *(void *)&aSongnameartist[v61];
      v63 = *(void *)&aSongnameartist[v61 + 40];
      v64 = type metadata accessor for AudioSuggestionResolver();
      v65 = swift_allocObject(v64, 32LL, 7LL);
      *(void *)(v65 + 16) = v62;
      *(void *)(v65 + 24) = v63;
      swift_bridgeObjectRelease(0xE000000000000000LL);
      *(void *)&v113 = v64;
      *((void *)&v113 + 1) = sub_3B0C( &qword_14648,  v66,  (uint64_t (*)(uint64_t))type metadata accessor for AudioSuggestionResolver,  (uint64_t)&unk_D8FC);
      v112[0] = v65;
      v68 = *((void *)&v116 + 1);
      v67 = v116;
      sub_3AE8(v115, v116);
      v69 = 8LL * (*(char (**)(uint64_t, uint64_t))(v68 + 8))(v67, v68);
      v70 = *(void *)&aSongnameartist[v69];
      v71 = *(void *)&aSongnameartist[v69 + 40];
      v72 = a1;
      v73 = *((void *)&v116 + 1);
      v74 = v116;
      sub_3AE8(v115, v116);
      LOBYTE(v73) = (*(uint64_t (**)(uint64_t, uint64_t))(v73 + 16))(v74, v73);
      v75 = *((void *)&v116 + 1);
      v76 = v116;
      sub_3AE8(v115, v116);
      v77 = v76;
      a1 = v72;
      (*(void (**)(uint64_t, uint64_t))(v75 + 32))(v77, v75);
      v78 = ResolvableParameter.__allocating_init(typeIdentifier:required:intentTransformer:)(v70, v71, v73 & 1, v55);
      *(_OWORD *)v119 = v94;
      v79 = v95;
      *(void *)&v119[16] = v95;
      sub_3A04(v118);
      v80 = v92;
      SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)(v93, v92, v112, v78, v97, v79);
      v81 = v78;
      v82 = v98;
      swift_release(v81);
      swift_bridgeObjectRelease(v80);
      sub_3D1C((uint64_t)v112, &qword_14650);
      sub_3A40(v118);
      sub_3A40(v115);
      v54 += 40LL;
      v53 = v82 - 1;
    }

    while (v53);
    sub_3B4C(&v120);
    v51 = v89;
  }

  result = *(void **)(v51 + 176);
  v115[0] = result;
  v84 = result[2];
  if (v84)
  {
    v85 = result + 4;
    swift_bridgeObjectRetain(result);
    do
    {
      v86 = *(void *)(a1 + 40);
      v98 = *(_OWORD *)(a1 + 24);
      v87 = v98;
      sub_3AE8((void *)a1, v98);
      *(_OWORD *)v119 = v98;
      *(void *)&v119[16] = v86;
      sub_3A04(v118);
      dispatch thunk of SuggestionDetailsBuilder.filter(_:)(v85, v87, v86);
      sub_3A40(v118);
      v85 += 5;
      --v84;
    }

    while (v84);
    return sub_3B4C(v115);
  }

  return result;
}

uint64_t sub_31AC()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_31C0(uint64_t a1, uint64_t a2)
{
  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_14608 + dword_14608);
  v5 = (void *)swift_task_alloc(unk_1460C);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_3D68;
  return v7(a1, a2);
}

uint64_t sub_322C()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t sub_3250()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16LL);
  swift_bridgeObjectRetain(*(void *)(*(void *)v0 + 24LL));
  return v1;
}

uint64_t sub_3280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_14658 + dword_14658);
  v8 = (void *)swift_task_alloc(unk_1465C);
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_3300;
  return v10(a2, a3, a4);
}

uint64_t sub_3300(uint64_t a1)
{
  uint64_t v6 = *v1;
  uint64_t v3 = *(void *)(v6 + 16);
  uint64_t v4 = *v1;
  uint64_t v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t variable initialization expression of ArtistNameParameterBuilder.parameterName()
{
  return 1LL;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.queueIsPlayingShuffled()
{
  return 2LL;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.mediaItemType()
{
  return 0LL;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.supportsAffinityIntent()
{
  return 0LL;
}

uint64_t type metadata accessor for AudioSuggestionsPluginOwnerDefinitionFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC22AudioSuggestionsPlugin44AudioSuggestionsPluginOwnerDefinitionFactory);
}

uint64_t type metadata accessor for AudioSuggestionResolver()
{
  return objc_opt_self(&OBJC_CLASS____TtC22AudioSuggestionsPlugin23AudioSuggestionResolver);
}

void type metadata accessor for INMediaItemType()
{
  if (!qword_145E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_10A30);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_145E0);
    }
  }
}

void *sub_340C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_341C(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_3428(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_343C(uint64_t a1, uint64_t a2)
{
  return sub_3B0C( (unint64_t *)&unk_145E8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for AudioSuggestionResolver,  (uint64_t)&unk_D89C);
}

uint64_t sub_3468(uint64_t a1, uint64_t a2)
{
  return sub_3B0C( (unint64_t *)&unk_145F8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for AudioSuggestionResolver,  (uint64_t)&unk_D8C4);
}

uint64_t sub_3494(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 280) = a1;
  *(void *)(v2 + 288) = a2;
  return swift_task_switch(sub_34AC, 0LL, 0LL);
}

uint64_t sub_34AC()
{
  if (qword_143D8 != -1) {
    swift_once(&qword_143D8, sub_7E5C);
  }
  uint64_t v1 = (int *)v0[35];
  uint64_t v2 = qword_15200;
  v0[28] = type metadata accessor for DomainOwner(0LL);
  v0[29] = sub_3B0C( &qword_14610,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for DomainOwner,  (uint64_t)&protocol conformance descriptor for DomainOwner);
  v0[25] = v2;
  uint64_t v3 = v1[1];
  uint64_t v6 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain(v2);
  uint64_t v4 = (void *)swift_task_alloc(v3);
  v0[37] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_3588;
  return v6(v0 + 25);
}

uint64_t sub_3588(uint64_t a1)
{
  uint64_t v2 = (void *)(*(void *)v1 + 200LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 296LL);
  *(void *)(*(void *)v1 + 304LL) = a1;
  swift_task_dealloc(v3);
  sub_3A40(v2);
  return swift_task_switch(sub_35F0, 0LL, 0LL);
}

uint64_t sub_35F0()
{
  uint64_t v27 = sub_C1A8();
  uint64_t v1 = *(void *)(v27 + 16);
  if (v1)
  {
    uint64_t v2 = (_OWORD *)(v0 + 16);
    swift_bridgeObjectRetain(v27);
    uint64_t v3 = 32LL;
    do
    {
      __int128 v4 = *(_OWORD *)(v27 + v3 + 64);
      __int128 v5 = *(_OWORD *)(v27 + v3 + 80);
      __int128 v6 = *(_OWORD *)(v27 + v3 + 112);
      *(_OWORD *)(v0 + 112) = *(_OWORD *)(v27 + v3 + 96);
      *(_OWORD *)(v0 + 128) = v6;
      *(_OWORD *)(v0 + 96) = v5;
      __int128 v8 = *(_OWORD *)(v27 + v3 + 144);
      __int128 v7 = *(_OWORD *)(v27 + v3 + 160);
      __int128 v9 = *(_OWORD *)(v27 + v3 + 128);
      *(void *)(v0 + 192) = *(void *)(v27 + v3 + 176);
      *(_OWORD *)(v0 + 160) = v8;
      *(_OWORD *)(v0 + 176) = v7;
      *(_OWORD *)(v0 + 144) = v9;
      __int128 v10 = *(_OWORD *)(v27 + v3 + 48);
      __int128 v12 = *(_OWORD *)(v27 + v3);
      __int128 v11 = *(_OWORD *)(v27 + v3 + 16);
      *(_OWORD *)(v0 + 48) = *(_OWORD *)(v27 + v3 + 32);
      *(_OWORD *)(v0 + 64) = v10;
      *uint64_t v2 = v12;
      *(_OWORD *)(v0 + 32) = v11;
      *(_OWORD *)(v0 + 80) = v4;
      uint64_t v13 = sub_832C(*(_BYTE *)(v0 + 104));
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)(v0 + 16);
      uint64_t v17 = *(void *)(v0 + 24);
      uint64_t v18 = swift_task_alloc(32LL);
      *(void *)(v18 + 16) = v2;
      sub_37D8((void *)(v0 + 16));
      uint64_t v19 = dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)( v13,  v15,  v16,  v17,  sub_37D0,  v18);
      swift_bridgeObjectRelease(v15);
      swift_release(v19);
      sub_38CC((void *)(v0 + 16));
      swift_task_dealloc(v18);
      v3 += 184LL;
      --v1;
    }

    while (v1);
    swift_bridgeObjectRelease(v27);
  }

  uint64_t v20 = *(void *)(v0 + 304);
  swift_bridgeObjectRelease(v27);
  uint64_t v21 = type metadata accessor for AudioHintsGenerator();
  uint64_t v22 = swift_allocObject(v21, 16LL, 7LL);
  *(void *)(v0 + 264) = v21;
  *(void *)(v0 + 272) = sub_3B0C( &qword_14618,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for AudioHintsGenerator,  (uint64_t)&unk_DABC);
  *(void *)(v0 + 240) = v22;
  uint64_t v23 = dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)(v0 + 240);
  swift_release(v23);
  sub_3A40((void *)(v0 + 240));
  uint64_t v24 = sub_39C4(&qword_14620);
  uint64_t v25 = swift_allocObject(v24, 72LL, 7LL);
  *(_OWORD *)(v25 + 16) = xmmword_D790;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
  swift_release(v20);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v25);
}

void *sub_37D0(uint64_t a1)
{
  return sub_28EC(a1, *(void *)(v1 + 16));
}

void *sub_37D8(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v12 = a1[8];
  uint64_t v13 = a1[10];
  uint64_t v14 = a1[13];
  uint64_t v15 = a1[14];
  uint64_t v16 = a1[15];
  uint64_t v7 = a1[18];
  uint64_t v8 = a1[20];
  uint64_t v9 = a1[21];
  uint64_t v10 = a1[22];
  swift_bridgeObjectRetain(a1[16]);
  swift_retain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  return a1;
}

void *sub_38CC(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[10];
  uint64_t v12 = a1[13];
  uint64_t v13 = a1[14];
  uint64_t v14 = a1[1];
  uint64_t v15 = a1[15];
  uint64_t v16 = a1[16];
  uint64_t v8 = a1[18];
  uint64_t v10 = a1[20];
  uint64_t v9 = a1[21];
  swift_bridgeObjectRelease(a1[22]);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);
  swift_release(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
  return a1;
}

uint64_t sub_39C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_3A04(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_3A40(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_3A60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_39C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_3AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_3AE8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_3B0C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

void *sub_3B4C(void *a1)
{
  return a1;
}

uint64_t sub_3B74(uint64_t a1)
{
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = v1;
  return swift_task_switch(sub_3B8C, 0LL, 0LL);
}

uint64_t sub_3B8C()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  sub_3AE8(v1, v3);
  uint64_t v5 = dispatch thunk of CandidateSuggestion.context.getter(v3, v4);
  uint64_t v7 = v6;
  v0[12] = v5;
  v0[13] = v6;
  uint64_t ObjectType = swift_getObjectType();
  v0[14] = ObjectType;
  v0[15] = *(void *)(v2 + 16);
  uint64_t v9 = *(void *)(v2 + 24);
  v0[16] = v9;
  uint64_t v10 = *(void *)(*(void *)(v7 + 8) + 8LL);
  swift_bridgeObjectRetain(v9);
  uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
  return swift_task_switch(sub_3C30, v11, v12);
}

uint64_t sub_3C30()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[12];
  Context.getIntentParameter(name:)(v0[15], v1, v0[14], v0[13]);
  swift_unknownObjectRelease(v2);
  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_3C8C, 0LL, 0LL);
}

uint64_t sub_3C8C()
{
  uint64_t v1 = (_OWORD *)(v0 + 48);
  if (*(void *)(v0 + 72))
  {
    sub_3D58(v1, (_OWORD *)(v0 + 16));
    uint64_t v2 = sub_39C4(&qword_14668);
    uint64_t v3 = (_OWORD *)swift_allocObject(v2, 64LL, 7LL);
    v3[1] = xmmword_D790;
    sub_3D58((_OWORD *)(v0 + 16), v3 + 2);
  }

  else
  {
    sub_3D1C((uint64_t)v1, &qword_14660);
    uint64_t v3 = &_swiftEmptyArrayStorage;
  }

  return (*(uint64_t (**)(_OWORD *))(v0 + 8))(v3);
}

uint64_t sub_3D1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_39C4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

_OWORD *sub_3D58(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_WORD *initializeBufferWithCopyOfBuffer for SongNameParameterBuilder(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SongNameParameterBuilder(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }

    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }

LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SongNameParameterBuilder(_WORD *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    return ((uint64_t (*)(void))((char *)&loc_3E6C + 4 * byte_D9B5[v4]))();
  }
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_3EA0 + 4 * byte_D9B0[v4]))();
}

uint64_t sub_3EA0(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_3EA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2) {
    JUMPOUT(0x3EB0LL);
  }
  return result;
}

uint64_t sub_3EBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2) {
    JUMPOUT(0x3EC4LL);
  }
  *(_BYTE *)(result + 1) = a2 + 1;
  return result;
}

uint64_t sub_3EC8(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_3ED0(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SongNameParameterBuilder()
{
  return &type metadata for SongNameParameterBuilder;
}

void sub_3EEC(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___INPlayMediaIntent);
  uint64_t v5 = swift_dynamicCastObjCClass(a1, v4);
  if (!v5)
  {
    uint64_t v14 = enum case for IntentParameter.ignore(_:);
LABEL_32:
    uint64_t v29 = type metadata accessor for IntentParameter(0LL);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 104LL))(a2, v14, v29);
    return;
  }

  unsigned int v6 = (void *)v5;
  id v7 = a1;
  id v8 = [v6 mediaItems];
  if (!v8)
  {
LABEL_15:
    id v13 = [v6 mediaContainer];
    if (!v13) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }

  uint64_t v9 = v8;
  uint64_t v10 = sub_41C8(0LL, &qword_14678, &OBJC_CLASS___INMediaItem_ptr);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  if (!((unint64_t)v11 >> 62))
  {
    goto LABEL_14;
  }

  if (v11 < 0) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = v11 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v11);
  uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v15);
  swift_bridgeObjectRelease(v11);
  if (!v16)
  {
LABEL_14:
    swift_bridgeObjectRelease(v11);
    goto LABEL_15;
  }

LABEL_5:
  if ((v11 & 0xC000000000000001LL) != 0)
  {
    id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v11);
    goto LABEL_8;
  }

  if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8LL)))
  {
    id v12 = *(id *)(v11 + 32);
LABEL_8:
    id v13 = v12;
    swift_bridgeObjectRelease(v11);
LABEL_16:
    if ([v13 type] == (char *)&dword_0 + 1)
    {
      id v17 = [v13 title];
      uint64_t v18 = v17;
      if (v17)
      {
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
        unint64_t v21 = v20;

        uint64_t v18 = (void *)(v19 & 0xFFFFFFFFFFFFLL);
      }

      else
      {
        unint64_t v21 = 0xE000000000000000LL;
      }

      swift_bridgeObjectRelease(v21);
      uint64_t v22 = HIBYTE(v21) & 0xF;
      if ((v21 & 0x2000000000000000LL) == 0) {
        uint64_t v22 = (uint64_t)v18;
      }
      if (v22)
      {
        id v23 = [v13 title];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
          unint64_t v27 = v26;

          a2[3] = (uint64_t)&type metadata for String;
          if (v27)
          {

LABEL_30:
            *a2 = v25;
            a2[1] = v27;
            v28 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
            goto LABEL_31;
          }
        }

        else
        {
          a2[3] = (uint64_t)&type metadata for String;
        }

        uint64_t v25 = 0LL;
        unint64_t v27 = 0xE000000000000000LL;
        goto LABEL_30;
      }
    }

LABEL_27:
    v28 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
LABEL_31:
    uint64_t v14 = *v28;
    goto LABEL_32;
  }

  __break(1u);
}

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

  if ((v11 & 0xC000000000000001LL) != 0)
  {
    id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v11);
    goto LABEL_8;
  }

  if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8LL)))
  {
    id v12 = *(id *)(v11 + 32);
LABEL_8:
    id v13 = v12;
    swift_bridgeObjectRelease(v11);
LABEL_16:
    if ([v13 type] == (char *)&dword_0 + 1)
    {
      id v17 = [v13 artist];
      uint64_t v18 = v17;
      if (v17)
      {
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
        unint64_t v21 = v20;

        uint64_t v18 = (void *)(v19 & 0xFFFFFFFFFFFFLL);
      }

      else
      {
        unint64_t v21 = 0xE000000000000000LL;
      }

      swift_bridgeObjectRelease(v21);
      uint64_t v22 = HIBYTE(v21) & 0xF;
      if ((v21 & 0x2000000000000000LL) == 0) {
        uint64_t v22 = (uint64_t)v18;
      }
      if (v22) {
        goto LABEL_30;
      }
    }

    if ([v13 type] == (char *)&dword_0 + 3)
    {
      id v23 = [v13 title];
      uint64_t v24 = v23;
      if (v23)
      {
        uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
        unint64_t v27 = v26;

        uint64_t v24 = (void *)(v25 & 0xFFFFFFFFFFFFLL);
      }

      else
      {
        unint64_t v27 = 0xE000000000000000LL;
      }

      swift_bridgeObjectRelease(v27);
      v28 = HIBYTE(v27) & 0xF;
      if ((v27 & 0x2000000000000000LL) == 0) {
        v28 = (uint64_t)v24;
      }
      if (v28)
      {
LABEL_30:
        uint64_t v29 = [v13 artist];
        if (v29)
        {
LABEL_31:
          v30 = v29;
          v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
          v33 = v32;

LABEL_43:
          a2[3] = sub_39C4(&qword_14640);

          *a2 = v31;
          a2[1] = v33;
          v46 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
LABEL_46:
          uint64_t v14 = *v46;
          goto LABEL_47;
        }

  if ((v11 & 0xC000000000000001LL) != 0)
  {
    id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v11);
    goto LABEL_8;
  }

  if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8LL)))
  {
    id v12 = *(id *)(v11 + 32);
LABEL_8:
    id v13 = v12;
    swift_bridgeObjectRelease(v11);
LABEL_16:
    if ([v13 type] == &dword_10)
    {
      id v17 = [v13 title];
      uint64_t v18 = v17;
      if (v17)
      {
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
        unint64_t v21 = v20;

        uint64_t v18 = (void *)(v19 & 0xFFFFFFFFFFFFLL);
      }

      else
      {
        unint64_t v21 = 0xE000000000000000LL;
      }

      swift_bridgeObjectRelease(v21);
      uint64_t v22 = HIBYTE(v21) & 0xF;
      if ((v21 & 0x2000000000000000LL) == 0) {
        uint64_t v22 = (uint64_t)v18;
      }
      if (v22)
      {
        id v23 = [v13 title];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
          unint64_t v27 = v26;

          a2[3] = (uint64_t)&type metadata for String;
          if (v27)
          {

LABEL_30:
            *a2 = v25;
            a2[1] = v27;
            v28 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
            goto LABEL_31;
          }
        }

        else
        {
          a2[3] = (uint64_t)&type metadata for String;
        }

        uint64_t v25 = 0LL;
        unint64_t v27 = 0xE000000000000000LL;
        goto LABEL_30;
      }
    }

LABEL_27:
    v28 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
LABEL_31:
    uint64_t v14 = *v28;
    goto LABEL_32;
  }

  __break(1u);
}

uint64_t sub_4170()
{
  return *v0;
}

uint64_t sub_4178()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_4180()
{
  uint64_t v0 = sub_41C8(0LL, &qword_14670, &OBJC_CLASS___INIntent_ptr);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_3EEC, 0LL, v0);
}

uint64_t sub_41C8(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_4200@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  v16[1] = a3;
  uint64_t v5 = type metadata accessor for Objective(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a2[3];
  uint64_t v10 = a2[4];
  LOBYTE(a1) = *(_BYTE *)(a1 + 88);
  sub_3AE8(a2, v9);
  uint64_t v11 = sub_832C(a1);
  uint64_t v13 = v12;
  unint64_t v14 = sub_87B4((uint64_t)&_swiftEmptyArrayStorage);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Objective.discoverability(_:), v5);
  CandidateSuggestionFactory.create(suggestionId:params:objective:)(v11, v13, v14, v8, v9, v10);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v14);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

char *sub_4320(void (*a1)(__int128 *__return_ptr, __int128 *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain(a3);
  __int128 v7 = *(_OWORD *)(a3 + 176);
  __int128 v45 = *(_OWORD *)(a3 + 160);
  __int128 v46 = v7;
  __int128 v47 = *(_OWORD *)(a3 + 192);
  uint64_t v48 = *(void *)(a3 + 208);
  __int128 v8 = *(_OWORD *)(a3 + 112);
  __int128 v41 = *(_OWORD *)(a3 + 96);
  __int128 v42 = v8;
  __int128 v9 = *(_OWORD *)(a3 + 144);
  __int128 v43 = *(_OWORD *)(a3 + 128);
  __int128 v44 = v9;
  __int128 v10 = *(_OWORD *)(a3 + 48);
  __int128 v37 = *(_OWORD *)(a3 + 32);
  __int128 v38 = v10;
  __int128 v11 = *(_OWORD *)(a3 + 80);
  __int128 v39 = *(_OWORD *)(a3 + 64);
  __int128 v40 = v11;
  __int128 v33 = v45;
  __int128 v34 = v46;
  __int128 v35 = v47;
  uint64_t v36 = v48;
  __int128 v29 = v41;
  __int128 v30 = v42;
  __int128 v31 = v43;
  __int128 v32 = v44;
  __int128 v25 = v37;
  __int128 v26 = v38;
  __int128 v27 = v39;
  __int128 v28 = v11;
  sub_37D8(&v37);
  a1(&v22, &v25);
  uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
  if (!v3)
  {
    for (uint64_t i = 216LL; ; i += 184LL)
    {
      sub_38CC(&v37);
      if (v23)
      {
        sub_58BC(&v22, (uint64_t)v24);
        sub_58BC(v24, (uint64_t)&v22);
        if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0) {
          uint64_t v12 = sub_46C8(0LL, *((void *)v12 + 2) + 1LL, 1, v12);
        }
        unint64_t v15 = *((void *)v12 + 2);
        unint64_t v14 = *((void *)v12 + 3);
        if (v15 >= v14 >> 1) {
          uint64_t v12 = sub_46C8((char *)(v14 > 1), v15 + 1, 1, v12);
        }
        *((void *)v12 + 2) = v15 + 1;
        sub_58BC(&v22, (uint64_t)&v12[40 * v15 + 32]);
        if (!--v4)
        {
LABEL_15:
          swift_bridgeObjectRelease(a3);
          return v12;
        }
      }

      else
      {
        sub_587C((uint64_t)&v22);
        if (!--v4) {
          goto LABEL_15;
        }
      }

      __int128 v16 = *(_OWORD *)(a3 + i + 144);
      __int128 v45 = *(_OWORD *)(a3 + i + 128);
      __int128 v46 = v16;
      __int128 v47 = *(_OWORD *)(a3 + i + 160);
      uint64_t v48 = *(void *)(a3 + i + 176);
      __int128 v17 = *(_OWORD *)(a3 + i + 80);
      __int128 v41 = *(_OWORD *)(a3 + i + 64);
      __int128 v42 = v17;
      __int128 v18 = *(_OWORD *)(a3 + i + 112);
      __int128 v43 = *(_OWORD *)(a3 + i + 96);
      __int128 v44 = v18;
      __int128 v19 = *(_OWORD *)(a3 + i + 16);
      __int128 v37 = *(_OWORD *)(a3 + i);
      __int128 v38 = v19;
      __int128 v20 = *(_OWORD *)(a3 + i + 48);
      __int128 v39 = *(_OWORD *)(a3 + i + 32);
      __int128 v40 = v20;
      __int128 v33 = v45;
      __int128 v34 = v46;
      __int128 v35 = v47;
      uint64_t v36 = v48;
      __int128 v29 = v41;
      __int128 v30 = v42;
      __int128 v31 = v43;
      __int128 v32 = v44;
      __int128 v25 = v37;
      __int128 v26 = v38;
      __int128 v27 = v39;
      __int128 v28 = v20;
      sub_37D8(&v37);
      a1(&v22, &v25);
    }
  }

  sub_38CC(&v37);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(a3);
  return v12;
}

uint64_t type metadata accessor for AudioHintsGenerator()
{
  return objc_opt_self(&OBJC_CLASS____TtC22AudioSuggestionsPlugin19AudioHintsGenerator);
}

uint64_t sub_45CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_14730 + dword_14730);
  __int128 v7 = (void *)swift_task_alloc(unk_14734);
  *(void *)(v3 + 16) = v7;
  *__int128 v7 = v3;
  v7[1] = sub_3300;
  return v9(a1, a2, a3);
}

uint64_t sub_4644()
{
  return sub_468C((unint64_t *)&unk_14718, (uint64_t)&unk_DA64);
}

uint64_t sub_4668()
{
  return sub_468C(&qword_14728, (uint64_t)&unk_DA8C);
}

uint64_t sub_468C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for AudioHintsGenerator();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

char *sub_46C8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_39C4(&qword_14760);
      __int128 v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
      uint64_t v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[40 * v8 + 32]) {
          memmove(v13, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      __int128 v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
    }

    sub_4FCC(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_47E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_48B8(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_583C((uint64_t)v12, *a3);
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
      sub_583C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_3A40(v12);
  return v7;
}

uint64_t sub_48B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_4A70(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

uint64_t sub_4A70(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_4B04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_4CDC(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_4CDC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_4B04(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      char v5 = sub_4C78(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_4C78(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_39C4(&qword_14748);
  char v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_4CDC(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_39C4(&qword_14748);
    __int128 v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    __int128 v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_4E28(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_4E44(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_4E44(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_39C4(&qword_14750);
    __int128 v11 = (char *)swift_allocObject(v10, 184 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 184);
  }

  else
  {
    __int128 v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[184 * v8]) {
      memmove(v13, v14, 184 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[184 * v8] || v13 >= &v14[184 * v8])
  {
    swift_arrayInitWithCopy(v13, v14, v8, &type metadata for AudioSuggestion);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_4FCC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    uint64_t v9 = sub_39C4(&qword_14768);
    swift_arrayInitWithCopy(a3, v6, v4, v9);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_50D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 272) = a1;
  *(void *)(v3 + 280) = a3;
  return swift_task_switch(sub_50F0, 0LL, 0LL);
}

uint64_t sub_50F0()
{
  __int16 v1 = *(void **)(v0 + 272);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_3AE8(v1, v2);
  uint64_t v4 = dispatch thunk of Interaction.verb.getter(v2, v3);
  if (!v5)
  {
LABEL_7:
    if (qword_143B8 != -1) {
      swift_once(&qword_143B8, sub_62F0);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    uint64_t v10 = sub_57C4(v9, (uint64_t)static Logger.audio);
    __int128 v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v11, v12)) {
      goto LABEL_20;
    }
    uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v13 = 0;
    int v14 = "AudioHintsGenerator#generateCandidateSuggestions Received an Interaction which was not PlayMedia interaction. "
          "Not returning any suggestions.";
    goto LABEL_19;
  }

  uint64_t v6 = v5;
  if (v4 == 0x6964654D79616C50LL && v5 == 0xE900000000000061LL)
  {
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, 0x6964654D79616C50LL, 0xE900000000000061LL, 0LL);
    swift_bridgeObjectRelease(v6);
    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
  }

  uint64_t v16 = v1[3];
  uint64_t v15 = v1[4];
  sub_3AE8(*(void **)(v0 + 272), v16);
  uint64_t v17 = dispatch thunk of Interaction.executionParameters.getter(v16, v15);
  sub_68C8(v17, v0 + 200);
  if (qword_143B8 != -1) {
    swift_once(&qword_143B8, sub_62F0);
  }
  __int128 v18 = (__int128 *)(v0 + 16);
  __int128 v19 = (uint64_t *)(v0 + 240);
  uint64_t v20 = type metadata accessor for Logger(0LL);
  sub_57C4(v20, (uint64_t)static Logger.audio);
  unint64_t v21 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
  os_log_type_t v22 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v21, v22))
  {
    os_log_type_t type = v22;
    uint64_t v23 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v71 = swift_slowAlloc(32LL, -1LL);
    v73 = (void *)v71;
    *(_DWORD *)uint64_t v23 = 136315138;
    unint64_t v24 = sub_6510();
    uint64_t v25 = sub_39C4(&qword_14740);
    uint64_t v26 = Dictionary.description.getter(v24, &type metadata for String, v25, &protocol witness table for String);
    unint64_t v28 = v27;
    swift_bridgeObjectRelease(v24);
    *(void *)(v0 + 16) = sub_47E8(v26, v28, (uint64_t *)&v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v23 + 4, v23 + 12);
    unint64_t v29 = v28;
    __int128 v19 = (uint64_t *)(v0 + 240);
    swift_bridgeObjectRelease(v29);
    _os_log_impl( &dword_0,  v21,  type,  "AudioHintsGenerator#generateCandidateSuggestions Received execution parameters:%s",  v23,  0xCu);
    swift_arrayDestroy(v71, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v71, -1LL, -1LL);
    swift_slowDealloc(v23, -1LL, -1LL);
  }

  sub_57DC(v0 + 208, v0 + 256);
  uint64_t v30 = sub_57DC(v0 + 256, (uint64_t)v19);
  if ((*(_BYTE *)(v0 + 248) & 1) != 0)
  {
    __int128 v11 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v11, v12))
    {
LABEL_20:

      return (*(uint64_t (**)(void *))(v0 + 8))(&_swiftEmptyArrayStorage);
    }

    uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v13 = 0;
    int v14 = "AudioHintsGenerator#generateCandidateSuggestions Failed to resolve a MediaItemType on the interaction. Not ret"
          "urning any suggestions.";
LABEL_19:
    _os_log_impl(&dword_0, v11, v12, v14, v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
    goto LABEL_20;
  }

  uint64_t v32 = *v19;
  __int128 v33 = sub_CCA8(v32);
  __int128 v34 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
  os_log_type_t v35 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = swift_slowAlloc(22LL, -1LL);
    *(_DWORD *)uint64_t v36 = 134218240;
    *(void *)(v0 + 16) = v33[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v36 + 4, v36 + 12);
    *(_WORD *)(v36 + 12) = 2048;
    *(void *)(v0 + 16) = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v36 + 14, v36 + 22);
    _os_log_impl( &dword_0,  v34,  v35,  "AudioHintsGenerator#generateCandidateSuggestions Found %ld candidates which are enabled for INMediaItemType: %ld",  (uint8_t *)v36,  0x16u);
    swift_slowDealloc(v36, -1LL, -1LL);
  }

  uint64_t v37 = v33[2];
  if (v37)
  {
    uint64_t v38 = v37 - 1;
    __int128 v39 = &_swiftEmptyArrayStorage;
    for (uint64_t i = 4LL; ; i += 23LL)
    {
      __int128 v41 = *(_OWORD *)&v33[i];
      __int128 v42 = *(_OWORD *)&v33[i + 2];
      __int128 v43 = *(_OWORD *)&v33[i + 6];
      *(_OWORD *)(v0 + 48) = *(_OWORD *)&v33[i + 4];
      *(_OWORD *)(v0 + 64) = v43;
      *__int128 v18 = v41;
      *(_OWORD *)(v0 + 32) = v42;
      __int128 v44 = *(_OWORD *)&v33[i + 8];
      __int128 v45 = *(_OWORD *)&v33[i + 10];
      __int128 v46 = *(_OWORD *)&v33[i + 14];
      *(_OWORD *)(v0 + 112) = *(_OWORD *)&v33[i + 12];
      *(_OWORD *)(v0 + 128) = v46;
      *(_OWORD *)(v0 + 80) = v44;
      *(_OWORD *)(v0 + 96) = v45;
      __int128 v47 = *(_OWORD *)&v33[i + 16];
      __int128 v48 = *(_OWORD *)&v33[i + 18];
      __int128 v49 = *(_OWORD *)&v33[i + 20];
      *(void *)(v0 + 192) = v33[i + 22];
      *(_OWORD *)(v0 + 160) = v48;
      *(_OWORD *)(v0 + 176) = v49;
      *(_OWORD *)(v0 + 144) = v47;
      v50 = *(uint64_t (**)(uint64_t))(v0 + 152);
      sub_37D8((void *)(v0 + 16));
      if ((v50(v0 + 200) & 1) != 0)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v39);
        v73 = v39;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_4E28(0, v39[2] + 1LL, 1);
          __int128 v39 = v73;
        }

        unint64_t v53 = v39[2];
        unint64_t v52 = v39[3];
        if (v53 >= v52 >> 1)
        {
          sub_4E28(v52 > 1, v53 + 1, 1);
          __int128 v39 = v73;
        }

        v39[2] = v53 + 1;
        v54 = (char *)&v39[23 * v53];
        __int128 v55 = *v18;
        __int128 v56 = *(_OWORD *)(v0 + 32);
        __int128 v57 = *(_OWORD *)(v0 + 64);
        *((_OWORD *)v54 + 4) = *(_OWORD *)(v0 + 48);
        *((_OWORD *)v54 + 5) = v57;
        *((_OWORD *)v54 + 2) = v55;
        *((_OWORD *)v54 + 3) = v56;
        __int128 v58 = *(_OWORD *)(v0 + 80);
        __int128 v59 = *(_OWORD *)(v0 + 96);
        __int128 v60 = *(_OWORD *)(v0 + 128);
        *((_OWORD *)v54 + 8) = *(_OWORD *)(v0 + 112);
        *((_OWORD *)v54 + 9) = v60;
        *((_OWORD *)v54 + 6) = v58;
        *((_OWORD *)v54 + 7) = v59;
        __int128 v61 = *(_OWORD *)(v0 + 144);
        __int128 v62 = *(_OWORD *)(v0 + 160);
        __int128 v63 = *(_OWORD *)(v0 + 176);
        *((void *)v54 + 26) = *(void *)(v0 + 192);
        *((_OWORD *)v54 + 11) = v62;
        *((_OWORD *)v54 + 12) = v63;
        *((_OWORD *)v54 + 10) = v61;
        if (!v38)
        {
LABEL_34:
          swift_bridgeObjectRelease(v33);
          goto LABEL_36;
        }
      }

      else
      {
        sub_38CC((void *)(v0 + 16));
        if (!v38) {
          goto LABEL_34;
        }
      }

      --v38;
    }
  }

  swift_bridgeObjectRelease(v33);
  __int128 v39 = &_swiftEmptyArrayStorage;
LABEL_36:
  uint64_t v64 = swift_retain(v39);
  v65 = (os_log_s *)Logger.logObject.getter(v64);
  os_log_type_t v66 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)v67 = 134217984;
    *(void *)(v0 + 16) = v39[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v67 + 4, v67 + 12);
    swift_release(v39);
    _os_log_impl( &dword_0,  v65,  v66,  "AudioHintsGenerator#generateCandidateSuggestions Returning %ld candidates which are qualified for the current interaction.",  v67,  0xCu);
    swift_slowDealloc(v67, -1LL, -1LL);
  }

  else
  {
    swift_release(v39);
  }

  uint64_t v68 = *(void *)(v0 + 280);
  uint64_t v69 = swift_task_alloc(32LL);
  *(void *)(v69 + 16) = v68;
  v70 = sub_4320((void (*)(__int128 *__return_ptr, __int128 *))sub_5824, v69, (uint64_t)v39);
  swift_release(v39);
  swift_task_dealloc(v69);
  return (*(uint64_t (**)(char *))(v0 + 8))(v70);
}

uint64_t sub_57C4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_57DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_39C4(&qword_14738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_4200(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_583C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_587C(uint64_t a1)
{
  uint64_t v2 = sub_39C4(&qword_14758);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_58BC(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t storeEnumTagSinglePayload for PodcastNameParameterBuilder( _WORD *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    return ((uint64_t (*)(void))((char *)&loc_5920 + 4 * byte_DB45[v4]))();
  }
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_5954 + 4 * asc_DB40[v4]))();
}

uint64_t sub_5954(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_595C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2) {
    JUMPOUT(0x5964LL);
  }
  return result;
}

uint64_t sub_5970(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2) {
    JUMPOUT(0x5978LL);
  }
  *(_BYTE *)(result + 1) = a2 + 1;
  return result;
}

uint64_t sub_597C(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_5984(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PodcastNameParameterBuilder()
{
  return &type metadata for PodcastNameParameterBuilder;
}

void sub_59A0(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___INPlayMediaIntent);
  uint64_t v5 = swift_dynamicCastObjCClass(a1, v4);
  if (!v5)
  {
    uint64_t v15 = enum case for IntentParameter.ignore(_:);
LABEL_47:
    uint64_t v40 = type metadata accessor for IntentParameter(0LL);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 104LL))(a2, v15, v40);
    return;
  }

  uint64_t v6 = (void *)v5;
  id v7 = a1;
  id v8 = [v6 mediaContainer];
  if (v8)
  {
    uint64_t v9 = v8;
    if ([v8 type] == (char *)&dword_4 + 2)
    {
      id v10 = [v9 title];
      if (v10)
      {
        __int128 v11 = v10;
        uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
        unint64_t v14 = v13;
      }

      else
      {
        uint64_t v12 = 0LL;
        unint64_t v14 = 0xE000000000000000LL;
      }

      swift_bridgeObjectRelease(v14);
      uint64_t v16 = HIBYTE(v14) & 0xF;
      if ((v14 & 0x2000000000000000LL) == 0) {
        uint64_t v16 = v12 & 0xFFFFFFFFFFFFLL;
      }
      if (v16)
      {
        id v17 = [v9 title];
        if (v17)
        {
          __int128 v18 = v17;
          uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
          unint64_t v21 = v20;

          a2[3] = (uint64_t)&type metadata for String;
          if (v21)
          {

LABEL_39:
            *a2 = v19;
            a2[1] = v21;
            uint64_t v37 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
LABEL_46:
            uint64_t v15 = *v37;
            goto LABEL_47;
          }
        }

        else
        {
          a2[3] = (uint64_t)&type metadata for String;
        }

        goto LABEL_38;
      }
    }
  }

  id v22 = [v6 mediaItems];
  if (!v22) {
    goto LABEL_33;
  }
  uint64_t v23 = v22;
  uint64_t v24 = sub_41C8(0LL, &qword_14678, &OBJC_CLASS___INMediaItem_ptr);
  uint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

  if (!((unint64_t)v25 >> 62))
  {
LABEL_44:

    swift_bridgeObjectRelease(v25);
    goto LABEL_45;
  }

  if (v25 < 0) {
    uint64_t v38 = v25;
  }
  else {
    uint64_t v38 = v25 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v25);
  uint64_t v39 = _CocoaArrayWrapper.endIndex.getter(v38);
  swift_bridgeObjectRelease(v25);
  if (!v39) {
    goto LABEL_44;
  }
LABEL_18:
  if ((v25 & 0xC000000000000001LL) != 0)
  {
    id v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v25);
    goto LABEL_21;
  }

  if (*(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFF8LL)))
  {
    id v26 = *(id *)(v25 + 32);
LABEL_21:
    unint64_t v27 = v26;
    swift_bridgeObjectRelease(v25);
    if ([v27 type] == (char *)&dword_4 + 3 || objc_msgSend(v27, "type") == (char *)&dword_4 + 2)
    {
      id v28 = [v27 artist];
      unint64_t v29 = v28;
      if (v28)
      {
        uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
        unint64_t v32 = v31;

        unint64_t v29 = (void *)(v30 & 0xFFFFFFFFFFFFLL);
      }

      else
      {
        unint64_t v32 = 0xE000000000000000LL;
      }

      swift_bridgeObjectRelease(v32);
      uint64_t v33 = HIBYTE(v32) & 0xF;
      if ((v32 & 0x2000000000000000LL) == 0) {
        uint64_t v33 = (uint64_t)v29;
      }
      if (v33)
      {
        id v34 = [v27 artist];
        if (v34)
        {
          os_log_type_t v35 = v34;
          uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
          unint64_t v21 = v36;

          a2[3] = (uint64_t)&type metadata for String;
          if (v21)
          {

            goto LABEL_39;
          }
        }

        else
        {
          a2[3] = (uint64_t)&type metadata for String;
        }

LABEL_38:
        uint64_t v19 = 0LL;
        unint64_t v21 = 0xE000000000000000LL;
        goto LABEL_39;
      }
    }

LABEL_33:
LABEL_45:
    uint64_t v37 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
    goto LABEL_46;
  }

  __break(1u);
}

uint64_t sub_5D14()
{
  uint64_t v0 = sub_41C8(0LL, &qword_14670, &OBJC_CLASS___INIntent_ptr);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_59A0, 0LL, v0);
}

void sub_5D5C(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___INPlayMediaIntent);
  uint64_t v5 = swift_dynamicCastObjCClass(a1, v4);
  if (!v5)
  {
    uint64_t v14 = enum case for IntentParameter.ignore(_:);
LABEL_47:
    uint64_t v47 = type metadata accessor for IntentParameter(0LL);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104LL))(a2, v14, v47);
    return;
  }

  uint64_t v6 = (void *)v5;
  id v7 = a1;
  id v8 = [v6 mediaItems];
  if (!v8)
  {
LABEL_15:
    id v13 = [v6 mediaContainer];
    if (!v13) {
      goto LABEL_45;
    }
    goto LABEL_16;
  }

  uint64_t v9 = v8;
  uint64_t v10 = sub_41C8(0LL, &qword_14678, &OBJC_CLASS___INMediaItem_ptr);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  if (!((unint64_t)v11 >> 62))
  {
    goto LABEL_14;
  }

  if (v11 < 0) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = v11 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v11);
  uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v15);
  swift_bridgeObjectRelease(v11);
  if (!v16)
  {
LABEL_14:
    swift_bridgeObjectRelease(v11);
    goto LABEL_15;
  }

LABEL_42:
        uint64_t v31 = 0LL;
        uint64_t v33 = 0LL;
        goto LABEL_43;
      }
    }

    if ([v13 type] == &dword_10)
    {
      id v34 = [v13 title];
      os_log_type_t v35 = v34;
      if (v34)
      {
        uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
        unint64_t v38 = v37;

        os_log_type_t v35 = (void *)(v36 & 0xFFFFFFFFFFFFLL);
      }

      else
      {
        unint64_t v38 = 0xE000000000000000LL;
      }

      swift_bridgeObjectRelease(v38);
      uint64_t v39 = HIBYTE(v38) & 0xF;
      if ((v38 & 0x2000000000000000LL) == 0) {
        uint64_t v39 = (uint64_t)v35;
      }
      if (v39)
      {
        id v40 = [v13 identifier];
        if (v40)
        {
          __int128 v41 = v40;
          uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
          uint64_t v44 = v43;

          uint64_t v50 = v42;
          uint64_t v51 = v44;
          unint64_t v48 = 0xD000000000000018LL;
          unint64_t v49 = 0x800000000000E510LL;
          unint64_t v45 = sub_6264();
          LOBYTE(v41) = StringProtocol.contains<A>(_:)( &v48,  &type metadata for String,  &type metadata for String,  v45,  v45);
          swift_bridgeObjectRelease(v44);
          if ((v41 & 1) != 0)
          {
            id v29 = objc_msgSend(v13, "title", v48, v49, v50, v51);
            if (v29) {
              goto LABEL_31;
            }
            goto LABEL_42;
          }
        }
      }
    }

LABEL_45:
    __int128 v46 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
    goto LABEL_46;
  }

  __break(1u);
}

uint64_t sub_6150()
{
  uint64_t v0 = sub_41C8(0LL, &qword_14670, &OBJC_CLASS___INIntent_ptr);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_5D5C, 0LL, v0);
}

uint64_t storeEnumTagSinglePayload for ArtistNameParameterBuilder( _WORD *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    return ((uint64_t (*)(void))((char *)&loc_61E4 + 4 * byte_DBA5[v4]))();
  }
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_6218 + 4 * byte_DBA0[v4]))();
}

uint64_t sub_6218(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_6220(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2) {
    JUMPOUT(0x6228LL);
  }
  return result;
}

uint64_t sub_6234(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2) {
    JUMPOUT(0x623CLL);
  }
  *(_BYTE *)(result + 1) = a2 + 1;
  return result;
}

uint64_t sub_6240(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_6248(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ArtistNameParameterBuilder()
{
  return &type metadata for ArtistNameParameterBuilder;
}

unint64_t sub_6264()
{
  unint64_t result = qword_14770;
  if (!qword_14770)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_14770);
  }

  return result;
}

uint64_t Logger.audio.unsafeMutableAddressor()
{
  if (qword_143B8 != -1) {
    swift_once(&qword_143B8, sub_62F0);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_57C4(v0, (uint64_t)static Logger.audio);
}

uint64_t sub_62F0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_63E0(v0, static Logger.audio);
  sub_57C4(v0, (uint64_t)static Logger.audio);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x800000000000E530LL,  0x6775536F69647541LL,  0xEF6E6F6974736567LL);
}

uint64_t static Logger.audio.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_143B8 != -1) {
    swift_once(&qword_143B8, sub_62F0);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_57C4(v2, (uint64_t)static Logger.audio);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t *sub_63E0(uint64_t a1, uint64_t *a2)
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

uint64_t initializeBufferWithCopyOfBuffer for AudioSuggestionsExecutionParameters(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 initializeWithCopy for AudioSuggestionsExecutionParameters(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioSuggestionsExecutionParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 34)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 33);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestionsExecutionParameters( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(_WORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 34) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 34) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 33) = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestionsExecutionParameters()
{
  return &type metadata for AudioSuggestionsExecutionParameters;
}

unint64_t sub_6510()
{
  uint64_t v1 = sub_39C4(&qword_14778);
  uint64_t inited = swift_initStackObject(v1, v13);
  *(_OWORD *)(inited + 16) = xmmword_DC00;
  strcpy((char *)(inited + 32), "songIsDisliked");
  *(_BYTE *)(inited + 47) = -18;
  sub_3A60(v0, (uint64_t)&v18, &qword_14780);
  uint64_t v3 = sub_39C4(&qword_14780);
  *(void *)(inited + 72) = v3;
  uint64_t v4 = sub_686C( &qword_14788,  &qword_14780,  (uint64_t)&protocol witness table for Bool,  (uint64_t)&protocol conformance descriptor for <A> A?);
  *(void *)(inited + 80) = v4;
  uint64_t v5 = sub_686C( &qword_14790,  &qword_14780,  (uint64_t)&protocol witness table for Bool,  (uint64_t)&protocol conformance descriptor for <A> A?);
  *(void *)(inited + 88) = v5;
  sub_3A60((uint64_t)&v18, inited + 48, &qword_14780);
  *(void *)(inited + 96) = 0x694C7349676E6F73LL;
  *(void *)(inited + 104) = 0xEB0000000064656BLL;
  sub_3A60(v0 + 1, (uint64_t)&v17, &qword_14780);
  *(void *)(inited + 136) = v3;
  *(void *)(inited + 144) = v4;
  *(void *)(inited + 152) = v5;
  sub_3A60((uint64_t)&v17, inited + 112, &qword_14780);
  strcpy((char *)(inited + 160), "mediaItemType");
  *(_WORD *)(inited + 174) = -4864;
  uint64_t v6 = sub_39C4(&qword_14798);
  *(void *)(inited + 200) = v6;
  uint64_t v7 = sub_686C( &qword_147A0,  &qword_14798,  (uint64_t)&protocol witness table for Int,  (uint64_t)&protocol conformance descriptor for <A> A?);
  *(void *)(inited + 208) = v7;
  uint64_t v8 = sub_686C( &qword_147A8,  &qword_14798,  (uint64_t)&protocol witness table for Int,  (uint64_t)&protocol conformance descriptor for <A> A?);
  *(void *)(inited + 216) = v8;
  sub_3A60(v0 + 8, (uint64_t)v16, &qword_14738);
  sub_3A60((uint64_t)v16, (uint64_t)&v19, &qword_14738);
  char v9 = v20;
  uint64_t v10 = v19;
  if (v20) {
    uint64_t v10 = 0LL;
  }
  *(void *)(inited + 176) = v10;
  *(_BYTE *)(inited + 184) = v9;
  *(void *)(inited + 224) = 0xD000000000000016LL;
  *(void *)(inited + 232) = 0x800000000000E550LL;
  sub_3A60(v0 + 17, (uint64_t)&v15, &qword_14780);
  *(void *)(inited + 264) = v3;
  *(void *)(inited + 272) = v4;
  *(void *)(inited + 280) = v5;
  sub_3A60((uint64_t)&v15, inited + 240, &qword_14780);
  *(void *)(inited + 288) = 0x6E654C6575657571LL;
  *(void *)(inited + 296) = 0xEB00000000687467LL;
  sub_3A60(v0 + 24, (uint64_t)v14, &qword_14798);
  *(void *)(inited + 328) = v6;
  *(void *)(inited + 336) = v7;
  *(void *)(inited + 344) = v8;
  sub_3A60((uint64_t)v14, inited + 304, &qword_14798);
  *(void *)(inited + 352) = 0xD000000000000016LL;
  *(void *)(inited + 360) = 0x800000000000E570LL;
  char v11 = *(_BYTE *)(v0 + 33);
  *(void *)(inited + 392) = &type metadata for Bool;
  *(void *)(inited + 400) = &protocol witness table for Bool;
  *(void *)(inited + 408) = &protocol witness table for Bool;
  *(_BYTE *)(inited + 368) = v11;
  return sub_8674(inited);
}

uint64_t sub_6828(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_686C(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_6828(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_68C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!*(void *)(a1 + 16))
  {
    char v5 = 2;
    goto LABEL_19;
  }

  unint64_t v4 = sub_BC00(0x69447349676E6F73LL, 0xEE0064656B696C73LL);
  char v5 = 2;
  if ((v6 & 1) != 0)
  {
    sub_6CB0(*(void *)(a1 + 56) + 48 * v4, (uint64_t)&v33);
    uint64_t v7 = sub_39C4(&qword_14740);
    else {
      char v5 = 2;
    }
  }

  if (!*(void *)(a1 + 16))
  {
LABEL_19:
    char v9 = 2;
    char v13 = 2;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }

  unint64_t v8 = sub_BC00(0x694C7349676E6F73LL, 0xEB0000000064656BLL);
  char v9 = 2;
  if ((v10 & 1) != 0)
  {
    sub_6CB0(*(void *)(a1 + 56) + 48 * v8, (uint64_t)&v33);
    uint64_t v11 = sub_39C4(&qword_14740);
    else {
      char v9 = 2;
    }
  }

  if (!*(void *)(a1 + 16))
  {
    char v13 = 2;
    goto LABEL_25;
  }

  unint64_t v12 = sub_BC00(0xD000000000000016LL, 0x800000000000E550LL);
  char v13 = 2;
  if ((v14 & 1) != 0)
  {
    sub_6CB0(*(void *)(a1 + 56) + 48 * v12, (uint64_t)&v33);
    uint64_t v15 = sub_39C4(&qword_14740);
    else {
      char v13 = 2;
    }
  }

  if (!*(void *)(a1 + 16))
  {
LABEL_25:
    uint64_t v20 = 0LL;
    char v19 = 1;
    if (*(void *)(a1 + 16)) {
      goto LABEL_26;
    }
LABEL_23:
    uint64_t v21 = 0LL;
    char v22 = 1;
    goto LABEL_35;
  }

LABEL_20:
  unint64_t v16 = sub_BC00(0x657449616964656DLL, 0xED0000657079546DLL);
  if ((v17 & 1) == 0) {
    goto LABEL_25;
  }
  sub_6CB0(*(void *)(a1 + 56) + 48 * v16, (uint64_t)&v33);
  uint64_t v18 = sub_39C4(&qword_14740);
  if ((swift_dynamicCast(&v32, &v33, v18, &type metadata for Int, 6LL) & 1) == 0) {
    goto LABEL_25;
  }
  char v19 = 0;
  uint64_t v20 = v32;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_23;
  }
LABEL_26:
  unint64_t v23 = sub_BC00(0x6E654C6575657571LL, 0xEB00000000687467LL);
  if ((v24 & 1) != 0)
  {
    sub_6CB0(*(void *)(a1 + 56) + 48 * v23, (uint64_t)&v33);
    uint64_t v25 = sub_39C4(&qword_14740);
    int v26 = swift_dynamicCast(&v32, &v33, v25, &type metadata for Int, 6LL);
    if (v26) {
      uint64_t v21 = v32;
    }
    else {
      uint64_t v21 = 0LL;
    }
    char v22 = v26 ^ 1;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_35;
    }
  }

  else
  {
    uint64_t v21 = 0LL;
    char v22 = 1;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_35;
    }
  }

  unint64_t v27 = sub_BC00(0xD000000000000016LL, 0x800000000000E570LL);
  if ((v28 & 1) != 0)
  {
    sub_6CB0(*(void *)(a1 + 56) + 48 * v27, (uint64_t)&v33);
    goto LABEL_36;
  }

LABEL_35:
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v33 = 0u;
LABEL_36:
  swift_bridgeObjectRelease(a1);
  if (!*((void *)&v34 + 1))
  {
    uint64_t result = sub_6C70((uint64_t)&v33);
    goto LABEL_40;
  }

  uint64_t v29 = sub_39C4(&qword_14740);
  uint64_t result = swift_dynamicCast(&v32, &v33, v29, &type metadata for Bool, 6LL);
  if (!(_DWORD)result)
  {
LABEL_40:
    char v31 = 0;
    goto LABEL_41;
  }

  char v31 = v32;
LABEL_41:
  *(_BYTE *)a2 = v5;
  *(_BYTE *)(a2 + 1) = v9;
  *(void *)(a2 + 8) = v20;
  *(_BYTE *)(a2 + 16) = v19;
  *(_BYTE *)(a2 + 17) = v13;
  *(void *)(a2 + 24) = v21;
  *(_BYTE *)(a2 + 32) = v22;
  *(_BYTE *)(a2 + 33) = v31;
  return result;
}

uint64_t sub_6C70(uint64_t a1)
{
  uint64_t v2 = sub_39C4(&qword_147B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_6CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t storeEnumTagSinglePayload for PlaylistNameParameterBuilder( _WORD *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    return ((uint64_t (*)(void))((char *)&loc_6D40 + 4 * byte_DC65[v4]))();
  }
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_6D74 + 4 * asc_DC60[v4]))();
}

uint64_t sub_6D74(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_6D7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2) {
    JUMPOUT(0x6D84LL);
  }
  return result;
}

uint64_t sub_6D90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2) {
    JUMPOUT(0x6D98LL);
  }
  *(_BYTE *)(result + 1) = a2 + 1;
  return result;
}

uint64_t sub_6D9C(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_6DA4(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlaylistNameParameterBuilder()
{
  return &type metadata for PlaylistNameParameterBuilder;
}

void sub_6DC0(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___INPlayMediaIntent);
  uint64_t v5 = swift_dynamicCastObjCClass(a1, v4);
  if (!v5) {
    goto LABEL_59;
  }
  char v6 = (void *)v5;
  id v7 = a1;
  id v8 = [v6 mediaContainer];
  if (v8) {
    goto LABEL_3;
  }
  id v14 = [v6 mediaItems];
  if (!v14)
  {

    goto LABEL_59;
  }

  uint64_t v15 = v14;
  uint64_t v16 = sub_41C8(0LL, &qword_14678, &OBJC_CLASS___INMediaItem_ptr);
  uint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, v16);

  if (!((unint64_t)v17 >> 62))
  {
LABEL_58:

    swift_bridgeObjectRelease(v17);
    goto LABEL_59;
  }

  if (v17 < 0) {
    uint64_t v61 = v17;
  }
  else {
    uint64_t v61 = v17 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v17);
  uint64_t v62 = _CocoaArrayWrapper.endIndex.getter(v61);
  swift_bridgeObjectRelease(v17);
  if (!v62) {
    goto LABEL_58;
  }
LABEL_9:
  if ((v17 & 0xC000000000000001LL) != 0)
  {
    id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v17);
    goto LABEL_12;
  }

  if (*(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFF8LL)))
  {
    id v18 = *(id *)(v17 + 32);
LABEL_12:
    id v8 = v18;
    swift_bridgeObjectRelease(v17);
LABEL_3:
    id v9 = [v8 title];
    char v10 = v9;
    if (v9)
    {
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
      unint64_t v13 = v12;

      char v10 = (void *)(v11 & 0xFFFFFFFFFFFFLL);
    }

    else
    {
      unint64_t v13 = 0xE000000000000000LL;
    }

    swift_bridgeObjectRelease(v13);
    uint64_t v19 = HIBYTE(v13) & 0xF;
    if ((v13 & 0x2000000000000000LL) == 0) {
      uint64_t v19 = (uint64_t)v10;
    }
    if (v19)
    {
      id v20 = [v8 title];
      if (v20)
      {
        uint64_t v21 = v20;
        v65._uint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
        unint64_t v69 = v22;
      }

      else
      {
        v65._uint64_t countAndFlagsBits = 0LL;
        unint64_t v69 = 0xE000000000000000LL;
      }

      id v23 = [v8 identifier];
      if (v23)
      {
        char v24 = v23;
        uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
        unint64_t v27 = v26;

        uint64_t v67 = v25;
        unint64_t v68 = v27;
        v65._object = (void *)0xD000000000000016LL;
        unint64_t v66 = 0x800000000000E5F0LL;
        unint64_t v28 = sub_6264();
        LOBYTE(v24) = StringProtocol.contains<A>(_:)( &v65._object,  &type metadata for String,  &type metadata for String,  v28,  v28);
        swift_bridgeObjectRelease(v27);
        if ((v24 & 1) != 0)
        {
          uint64_t v29 = (void *)v69;
          if (v65._countAndFlagsBits == 0x657469726F766146LL && v69 == 0xED000078694D2073LL
            || (_stringCompareWithSmolCheck(_:_:expecting:)( 0x657469726F766146LL,  0xED000078694D2073LL,  v65._countAndFlagsBits,  v69,  0LL) & 1) != 0)
          {
            uint64_t v67 = 2128237LL;
            unint64_t v68 = 0xE300000000000000LL;
            uint64_t countAndFlagsBits = v65._countAndFlagsBits;
            unint64_t v31 = (unint64_t)v29;
LABEL_36:
            String.append(_:)(*(Swift::String *)&countAndFlagsBits);
            swift_bridgeObjectRelease(v29);
            uint64_t v53 = v67;
            uint64_t v29 = (void *)v68;
            a2[3] = (uint64_t)&type metadata for String;

            *a2 = v53;
LABEL_37:
            a2[1] = (uint64_t)v29;
            v54 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
LABEL_60:
            uint64_t v63 = *v54;
            uint64_t v64 = type metadata accessor for IntentParameter(0LL);
            (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v64 - 8) + 104LL))(a2, v63, v64);
            return;
          }

          unint64_t v55 = *(void *)"x";
          if (*(void *)"Chill MiGet Up! FavoriteNew Musix" != v65._countAndFlagsBits || *(void **)"x" != v29)
          {
            char v56 = _stringCompareWithSmolCheck(_:_:expecting:)( *(void *)"Chill MiGet Up! FavoriteNew Musix",  *(void *)"x",  v65._countAndFlagsBits,  v29,  0LL);
            swift_bridgeObjectRelease(*(void *)"x");
            if ((v56 & 1) != 0) {
              goto LABEL_45;
            }
            unint64_t v55 = 0xEB0000000078694DLL;
            if (*(void *)"Get Up! FavoriteNew Musix" != v65._countAndFlagsBits || v29 != (void *)0xEB0000000078694DLL)
            {
              char v57 = _stringCompareWithSmolCheck(_:_:expecting:)( *(void *)"Get Up! FavoriteNew Musix",  0xEB0000000078694DLL,  v65._countAndFlagsBits,  v29,  0LL);
              swift_bridgeObjectRelease(0xEB0000000078694DLL);
              if ((v57 & 1) != 0) {
                goto LABEL_45;
              }
              unint64_t v55 = 0xED000078694D2073LL;
              if (*(void *)"FavoriteNew Musix" != v65._countAndFlagsBits || v29 != (void *)0xED000078694D2073LL)
              {
                char v58 = _stringCompareWithSmolCheck(_:_:expecting:)( *(void *)"FavoriteNew Musix",  0xED000078694D2073LL,  v65._countAndFlagsBits,  v29,  0LL);
                swift_bridgeObjectRelease(0xED000078694D2073LL);
                if ((v58 & 1) != 0) {
                  goto LABEL_45;
                }
                unint64_t v55 = 0xED000078694D2063LL;
                if (*(void *)"New Musix" != v65._countAndFlagsBits || v29 != (void *)0xED000078694D2063LL)
                {
                  char v59 = _stringCompareWithSmolCheck(_:_:expecting:)( *(void *)"New Musix",  0xED000078694D2063LL,  v65._countAndFlagsBits,  v29,  0LL);
                  swift_bridgeObjectRelease(0xED000078694D2063LL);
                  if ((v59 & 1) == 0)
                  {
                    uint64_t v67 = 543516788LL;
                    unint64_t v68 = 0xE400000000000000LL;
                    v60._uint64_t countAndFlagsBits = v65._countAndFlagsBits;
                    v60._object = v29;
                    String.append(_:)(v60);
                    swift_bridgeObjectRelease(v29);
                    uint64_t v29 = (void *)v68;
                    swift_bridgeObjectRetain(v68);
                    uint64_t countAndFlagsBits = 0x73696C79616C7020LL;
                    unint64_t v31 = 0xE900000000000074LL;
                    goto LABEL_36;
                  }

LABEL_45:
                  a2[3] = (uint64_t)&type metadata for String;
                  *a2 = v65._countAndFlagsBits;
                  goto LABEL_37;
                }
              }
            }
          }

          swift_bridgeObjectRelease(v55);
          goto LABEL_45;
        }
      }

      id v32 = [v8 identifier];
      if (v32)
      {
        __int128 v33 = v32;
        uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
        unint64_t v36 = v35;

        uint64_t v67 = v34;
        unint64_t v68 = v36;
        v65._object = (void *)0xD000000000000019LL;
        unint64_t v66 = 0x800000000000E5D0LL;
        unint64_t v37 = sub_6264();
        LOBYTE(v33) = StringProtocol.contains<A>(_:)( &v65._object,  &type metadata for String,  &type metadata for String,  v37,  v37);
        swift_bridgeObjectRelease(v36);
      }

      id v38 = [v8 identifier];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
        unint64_t v42 = v41;

        uint64_t v67 = v40;
        unint64_t v68 = v42;
        v65._object = (void *)0xD000000000000019LL;
        unint64_t v66 = 0x800000000000E5B0LL;
        unint64_t v43 = sub_6264();
        LOBYTE(v39) = StringProtocol.contains<A>(_:)( &v65._object,  &type metadata for String,  &type metadata for String,  v43,  v43);
        swift_bridgeObjectRelease(v42);
      }

      id v44 = [v8 identifier];
      if (v44)
      {
        unint64_t v45 = v44;
        uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
        unint64_t v48 = v47;

        uint64_t v67 = v46;
        unint64_t v68 = v48;
        v65._object = (void *)0xD000000000000017LL;
        unint64_t v66 = 0x800000000000E590LL;
        unint64_t v49 = sub_6264();
        LOBYTE(v45) = StringProtocol.contains<A>(_:)( &v65._object,  &type metadata for String,  &type metadata for String,  v49,  v49);
        swift_bridgeObjectRelease(v48);
        if ((v45 & 1) != 0)
        {
LABEL_34:
          uint64_t v29 = (void *)v69;
          object = String.lowercased()()._object;
          v51._uint64_t countAndFlagsBits = 0x7473696C79616C70LL;
          v51._object = (void *)0xE800000000000000LL;
          Swift::Bool v52 = String.hasSuffix(_:)(v51);
          swift_bridgeObjectRelease(object);
          uint64_t v67 = 2128237LL;
          unint64_t v68 = 0xE300000000000000LL;
          uint64_t countAndFlagsBits = v65._countAndFlagsBits;
          unint64_t v31 = (unint64_t)v29;
          if (!v52)
          {
            String.append(_:)(*(Swift::String *)&countAndFlagsBits);
            swift_bridgeObjectRelease(v29);
            uint64_t v29 = (void *)v68;
            swift_bridgeObjectRetain(v68);
            uint64_t countAndFlagsBits = 0x73696C79616C7020LL;
            unint64_t v31 = 0xE900000000000074LL;
          }

          goto LABEL_36;
        }
      }

      swift_bridgeObjectRelease(v69);
    }

    else
    {
LABEL_19:
    }

LABEL_59:
    v54 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
    goto LABEL_60;
  }

  __break(1u);
}

uint64_t sub_759C()
{
  uint64_t v0 = sub_41C8(0LL, &qword_14670, &OBJC_CLASS___INIntent_ptr);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_6DC0, 0LL, v0);
}

uint64_t sub_75E4(char a1)
{
  return *(void *)&aChillMigetUpFa_0[8 * a1];
}

uint64_t sub_7604()
{
  uint64_t v0 = sub_39C4(&qword_148F0);
  uint64_t v1 = type metadata accessor for Locale(0LL);
  uint64_t v2 = swift_allocObject( v0,  ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL))
       + 13LL * *(void *)(*(void *)(v1 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_DD10;
  Locale.init(identifier:)(0x45442D6564LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x55412D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x41432D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x42472D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4E492D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x53552D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x53452D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x584D2D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x53552D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x52462D7266LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x504A2D616ALL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4E432D687ALL, 0xE500000000000000LL);
  uint64_t result = Locale.init(identifier:)(0x4B482D687ALL, 0xE500000000000000LL);
  qword_151E8 = v2;
  return result;
}

uint64_t sub_77F0()
{
  uint64_t v0 = sub_39C4(&qword_148F0);
  uint64_t v1 = *(void *)(type metadata accessor for Locale(0LL) - 8);
  uint64_t v2 = swift_allocObject( v0,  ((*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
       + 41LL * *(void *)(v1 + 72),
         *(unsigned __int8 *)(v1 + 80) | 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_DD20;
  Locale.init(identifier:)(0x53552D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4E432D687ALL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x42472D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x55412D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x41432D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4E492D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45442D6564LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x504A2D616ALL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x52462D7266LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x584D2D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x53452D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x53552D7365LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4B482D687ALL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x57542D687ALL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4E432D657579LL, 0xE600000000000000LL);
  Locale.init(identifier:)(0x524B2D6F6BLL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x55522D7572LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x54492D7469LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x52542D7274LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x41532D7261LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x47532D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x41432D7266LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x54412D6564LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45492D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x5A4E2D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45422D7266LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45422D6C6ELL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x48432D6564LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x48432D7266LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x48432D7469LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4C4E2D6C6ELL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x45532D7673LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4F4E2D626ELL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4B442D6164LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x49462D6966LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4C492D6568LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x52422D7470LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x48542D6874LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x415A2D6E65LL, 0xE500000000000000LL);
  Locale.init(identifier:)(0x4C432D7365LL, 0xE500000000000000LL);
  uint64_t result = Locale.init(identifier:)(0x594D2D736DLL, 0xE500000000000000LL);
  qword_151F0 = v2;
  return result;
}

uint64_t sub_7CF0()
{
  uint64_t v0 = sub_39C4(&qword_148E8);
  uint64_t v1 = type metadata accessor for DeviceType(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = swift_allocObject(v0, v5 + 8 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_DD30;
  uint64_t v7 = v6 + v5;
  id v8 = *(void (**)(uint64_t, void, uint64_t))(v2 + 104);
  v8(v7, enum case for DeviceType.iPhone(_:), v1);
  v8(v7 + v3, enum case for DeviceType.iPad(_:), v1);
  v8(v7 + 2 * v3, enum case for DeviceType.watch(_:), v1);
  v8(v7 + 3 * v3, enum case for DeviceType.pod(_:), v1);
  v8(v7 + 4 * v3, enum case for DeviceType.mac(_:), v1);
  v8(v7 + 5 * v3, enum case for DeviceType.homepod(_:), v1);
  v8(v7 + 6 * v3, enum case for DeviceType.appleTV(_:), v1);
  uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t))v8)(v7 + 7 * v3, enum case for DeviceType.carPlay(_:), v1);
  qword_151F8 = v6;
  return result;
}

uint64_t sub_7E5C()
{
  uint64_t v0 = type metadata accessor for DomainOwner(0LL);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  uint64_t result = DomainOwner.init(_:)(0x6964754169726953LL, 0xE90000000000006FLL);
  qword_15200 = result;
  return result;
}

uint64_t sub_7EB0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_7EE8 + 4 * byte_DD40[a1]))( 0xD000000000000012LL,  0x800000000000E6D0LL);
}

uint64_t sub_7EE8()
{
  return 0x6C7070612E6D6F63LL;
}

  ;
}

uint64_t type metadata accessor for AudioSuggestionsConstants()
{
  return objc_opt_self(&OBJC_CLASS____TtC22AudioSuggestionsPlugin25AudioSuggestionsConstants);
}

uint64_t type metadata accessor for CapellaConstants()
{
  return objc_opt_self(&OBJC_CLASS____TtC22AudioSuggestionsPlugin16CapellaConstants);
}

uint64_t storeEnumTagSinglePayload for RadioNameParameterBuilder(_WORD *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    return ((uint64_t (*)(void))((char *)&loc_7FE0 + 4 * byte_DDF5[v4]))();
  }
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_8014 + 4 * byte_DDF0[v4]))();
}

uint64_t sub_8014(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_801C(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2) {
    JUMPOUT(0x8024LL);
  }
  return result;
}

uint64_t sub_8030(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2) {
    JUMPOUT(0x8038LL);
  }
  *(_BYTE *)(result + 1) = a2 + 1;
  return result;
}

uint64_t sub_803C(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_8044(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RadioNameParameterBuilder()
{
  return &type metadata for RadioNameParameterBuilder;
}

void sub_8060(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___INPlayMediaIntent);
  uint64_t v5 = swift_dynamicCastObjCClass(a1, v4);
  if (!v5)
  {
    uint64_t v14 = enum case for IntentParameter.ignore(_:);
LABEL_32:
    uint64_t v29 = type metadata accessor for IntentParameter(0LL);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 104LL))(a2, v14, v29);
    return;
  }

  uint64_t v6 = (void *)v5;
  id v7 = a1;
  id v8 = [v6 mediaItems];
  if (!v8)
  {
LABEL_15:
    id v13 = [v6 mediaContainer];
    if (!v13) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }

  id v9 = v8;
  uint64_t v10 = sub_41C8(0LL, &qword_14678, &OBJC_CLASS___INMediaItem_ptr);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  if (!((unint64_t)v11 >> 62))
  {
    goto LABEL_14;
  }

  if (v11 < 0) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = v11 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v11);
  uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v15);
  swift_bridgeObjectRelease(v11);
  if (!v16)
  {
LABEL_14:
    swift_bridgeObjectRelease(v11);
    goto LABEL_15;
  }

uint64_t sub_82E4()
{
  uint64_t v0 = sub_41C8(0LL, &qword_14670, &OBJC_CLASS___INIntent_ptr);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_8060, 0LL, v0);
}

uint64_t sub_832C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_8364 + 4 * byte_DE50[a1]))( 0xD000000000000010LL,  0x800000000000E0F0LL);
}

uint64_t sub_8364()
{
  return 0x7974696E69666661LL;
}

uint64_t sub_837C()
{
  return 0x6E69666661736964LL;
}

uint64_t sub_839C()
{
  return 2036427888LL;
}

uint64_t sub_83AC()
{
  return 0x646F504179616C70LL;
}

uint64_t sub_83CC()
{
  return 0x6973754D79616C70LL;
}

uint64_t sub_83E8()
{
  return 0x5979425879616C70LL;
}

uint64_t sub_8400()
{
  return 0x6974724179616C70LL;
}

uint64_t sub_841C()
{
  return 0x6964615279616C70LL;
}

uint64_t sub_843C()
{
  return 0x79616C5079616C70LL;
}

uint64_t sub_8460()
{
  return 0x4E65685479616C70LL;
}

uint64_t sub_8480()
{
  return 0x6572616873LL;
}

uint64_t sub_8494()
{
  return 0x656C6666756873LL;
}

uint64_t sub_84AC()
{
  return 0x676E6F5374616877LL;
}

uint64_t sub_84D0(char a1)
{
  return *(void *)&aSongnameartist_0[8 * a1];
}

uint64_t sub_84F0(char a1, char a2)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aSongnameartist_0[v2];
  uint64_t v4 = *(void *)&aSongnameartist_0[v2 + 40];
  uint64_t v5 = 8LL * a2;
  uint64_t v6 = *(void *)&aSongnameartist_0[v5 + 40];
  if (v3 == *(void *)&aSongnameartist_0[v5] && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

unint64_t sub_8574(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_39C4(&qword_149E8);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (void *)(a1 + 40);
  while (1)
  {
    uint64_t v7 = *((unsigned __int8 *)v6 - 8);
    uint64_t v8 = *v6;
    swift_bridgeObjectRetain(*v6);
    unint64_t result = sub_BB8C(v7);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    *(_BYTE *)(v4[6] + result) = v7;
    *(void *)(v4[7] + 8 * result) = v8;
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4[2] = v13;
    v6 += 2;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_8674(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v16 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v16);
    return (unint64_t)v4;
  }

  sub_39C4(&qword_14A08);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_CC64(v7, (uint64_t)&v17, &qword_14A10);
    uint64_t v8 = v17;
    uint64_t v9 = v18;
    unint64_t result = sub_BC00(v17, v18);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    BOOL v12 = (uint64_t *)(v4[6] + 16 * result);
    *BOOL v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_CC4C(v19, (_OWORD *)(v4[7] + 48 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_12;
    }
    v4[2] = v15;
    v7 += 64LL;
    if (!--v5)
    {
      swift_release(v4);
      uint64_t v16 = a1;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_87B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_39C4(&qword_14A18);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_CC64(v7, (uint64_t)&v16, &qword_14A20);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_BC00(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    BOOL v12 = (uint64_t *)(v4[6] + 16 * result);
    *BOOL v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_3D58(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Swift::Int sub_88E8(char a1)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aSongnameartist_0[v2 + 40];
  String.hash(into:)(v5, *(void *)&aSongnameartist_0[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_8950(uint64_t a1, char a2)
{
  uint64_t v2 = 8LL * a2;
  uint64_t v3 = *(void *)&aSongnameartist_0[v2 + 40];
  String.hash(into:)(a1, *(void *)&aSongnameartist_0[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_8990(uint64_t a1, char a2)
{
  uint64_t v3 = 8LL * a2;
  uint64_t v4 = *(void *)&aSongnameartist_0[v3 + 40];
  String.hash(into:)(v6, *(void *)&aSongnameartist_0[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_89F4()
{
  unsigned __int8 v1 = *v0;
  Hasher.init(_seed:)(v6, 0LL);
  uint64_t v2 = sub_832C(v1);
  uint64_t v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_8A54(uint64_t a1)
{
  uint64_t v3 = sub_832C(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_8A94(uint64_t a1)
{
  unsigned __int8 v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  uint64_t v3 = sub_832C(v2);
  uint64_t v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t sub_8AF0@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_CF74(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_8B1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_832C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_8B44(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = sub_832C(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = sub_832C(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

Swift::Int sub_8BCC()
{
  return sub_88E8(*v0);
}

uint64_t sub_8BD4(uint64_t a1)
{
  return sub_8950(a1, *v1);
}

Swift::Int sub_8BDC(uint64_t a1)
{
  return sub_8990(a1, *v1);
}

unint64_t sub_8BE4@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_CFBC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_8C10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_84D0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_8C38(char *a1, char *a2)
{
  return sub_84F0(*a1, *a2);
}

uint64_t sub_8C44()
{
  if (qword_143C8 != -1) {
    swift_once(&qword_143C8, sub_77F0);
  }
  uint64_t v0 = qword_151F0;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151F0);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(0LL);
    if ((v6 & 1) != 0)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain(v7);
    }

    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }

  uint64_t v8 = sub_39C4(&qword_149F8);
  uint64_t v9 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
        + *(void *)(*(void *)(v9 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_D790;
  static VersionedInvocations.HintsDawnA.getter();
  uint64_t v11 = sub_39C4(&qword_14A00);
  uint64_t v12 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v16 = swift_allocObject(v11, v15 + *(void *)(v13 + 72), v14 | 7);
  *(_OWORD *)(v16 + 16) = xmmword_D790;
  uint64_t v17 = v16 + v15;
  uint64_t v18 = enum case for SiriHintsMode.display(_:);
  uint64_t v19 = type metadata accessor for SiriHintsMode(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104LL))(v17, v18, v19);
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(v13 + 104))( v17,  enum case for DeliveryVehicle.siriHints(_:),  v12);
  *(void *)&xmmword_15208 = 0xD000000000000019LL;
  *((void *)&xmmword_15208 + 1) = 0x800000000000E9A0LL;
  qword_15218 = 0xD000000000000056LL;
  unk_15220 = 0x800000000000E740LL;
  *(void *)&xmmword_15228 = v0;
  *((void *)&xmmword_15228 + 1) = v2;
  *(void *)&xmmword_15238 = v7;
  *((void *)&xmmword_15238 + 1) = 0x7974696E69666661LL;
  *(void *)&xmmword_15248 = 0xE800000000000000LL;
  *((void *)&xmmword_15248 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15258 = 0x800000000000E7A0LL;
  WORD4(xmmword_15258) = 256;
  xmmword_15268 = 0uLL;
  *(void *)&xmmword_15278 = &off_106A8;
  *((void *)&xmmword_15278 + 1) = v10;
  *(void *)&xmmword_15288 = v16;
  *((void *)&xmmword_15288 + 1) = sub_8F04;
  xmmword_15298 = 0uLL;
  *(void *)&xmmword_152A8 = 0xE000000000000000LL;
  *((void *)&xmmword_152A8 + 1) = &_swiftEmptyArrayStorage;
  qword_152B8 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_8F04(uint64_t a1)
{
  if ((v7 == 2 || (sub_CC04((uint64_t)&v6, (uint64_t)&v3), (v3 & 1) == 0))
    && ((sub_CC04(a1, (uint64_t)&v5), sub_CC04((uint64_t)&v5, (uint64_t)&v8), v8 == 2)
     || (sub_CC04((uint64_t)&v5, (uint64_t)&v4), (v4 & 1) == 0)))
  {
    return *(unsigned __int8 *)(a1 + 33);
  }

  else
  {
    return 0LL;
  }

uint64_t sub_8FA4()
{
  if (qword_143C8 != -1) {
    swift_once(&qword_143C8, sub_77F0);
  }
  uint64_t v0 = qword_151F0;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151F0);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = sub_39C4(&qword_149F8);
  uint64_t v4 = *(void *)(type metadata accessor for VersionedInvocation(0LL) - 8);
  uint64_t v5 = swift_allocObject( v3,  ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
       + *(void *)(v4 + 72),
         *(unsigned __int8 *)(v4 + 80) | 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_D790;
  uint64_t v6 = swift_bridgeObjectRetain(v2);
  static VersionedInvocations.HintsDawnA.getter(v6);
  uint64_t v7 = sub_39C4(&qword_14A00);
  uint64_t v8 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + *(void *)(v9 + 72), v10 | 7);
  *(_OWORD *)(v12 + 16) = xmmword_D790;
  uint64_t v13 = v12 + v11;
  uint64_t v14 = enum case for SiriHintsMode.display(_:);
  uint64_t v15 = type metadata accessor for SiriHintsMode(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104LL))(v13, v14, v15);
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 104))( v13,  enum case for DeliveryVehicle.siriHints(_:),  v8);
  *(void *)&xmmword_152C0 = 0xD00000000000001CLL;
  *((void *)&xmmword_152C0 + 1) = 0x800000000000E980LL;
  qword_152D0 = 0xD000000000000056LL;
  unk_152D8 = 0x800000000000E740LL;
  *(void *)&xmmword_152E0 = v0;
  *((void *)&xmmword_152E0 + 1) = v2;
  *(void *)&xmmword_152F0 = &_swiftEmptyArrayStorage;
  *((void *)&xmmword_152F0 + 1) = 0x6E69666661736964LL;
  *(void *)&xmmword_15300 = 0xEB00000000797469LL;
  *((void *)&xmmword_15300 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15310 = 0x800000000000E7A0LL;
  WORD4(xmmword_15310) = 257;
  xmmword_15320 = 0uLL;
  *(void *)&xmmword_15330 = &off_10700;
  *((void *)&xmmword_15330 + 1) = v5;
  *(void *)&xmmword_15340 = v12;
  *((void *)&xmmword_15340 + 1) = variable initialization expression of AudioSuggestionsExecutionParameters.supportsAffinityIntent;
  xmmword_15350 = 0uLL;
  *(void *)&xmmword_15360 = 0xE000000000000000LL;
  *((void *)&xmmword_15360 + 1) = &_swiftEmptyArrayStorage;
  qword_15370 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_91FC()
{
  if (qword_143C0 != -1) {
    swift_once(&qword_143C0, sub_7604);
  }
  uint64_t v0 = qword_151E8;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151E8);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(2LL);
    if ((v6 & 1) != 0) {
      uint64_t v7 = (void *)swift_bridgeObjectRetain(*(void *)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5));
    }
    else {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }

  *(void *)&xmmword_15378 = 0xD000000000000015LL;
  *((void *)&xmmword_15378 + 1) = 0x800000000000E960LL;
  qword_15388 = 0xD000000000000056LL;
  unk_15390 = 0x800000000000E740LL;
  *(void *)&xmmword_15398 = v0;
  *((void *)&xmmword_15398 + 1) = v2;
  *(void *)&xmmword_153A8 = v7;
  *((void *)&xmmword_153A8 + 1) = 2036427888LL;
  *(void *)&xmmword_153B8 = 0xE400000000000000LL;
  *((void *)&xmmword_153B8 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_153C8 = 0x800000000000E7A0LL;
  WORD4(xmmword_153C8) = 258;
  double result = 0.0;
  xmmword_153D8 = 0u;
  xmmword_153E8 = 0u;
  *(void *)&xmmword_153F8 = 0LL;
  *((void *)&xmmword_153F8 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  xmmword_15408 = 0uLL;
  *(void *)&xmmword_15418 = 0xE000000000000000LL;
  *((void *)&xmmword_15418 + 1) = &_swiftEmptyArrayStorage;
  qword_15428 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_9398()
{
  if (qword_143C0 != -1) {
    swift_once(&qword_143C0, sub_7604);
  }
  uint64_t v0 = qword_151E8;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151E8);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(3LL);
    if ((v6 & 1) != 0)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain(v7);
    }

    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }

  uint64_t v8 = sub_39C4(&qword_149D0);
  uint64_t v9 = swift_allocObject(v8, 72LL, 7LL);
  *(_OWORD *)(v9 + 16) = xmmword_D790;
  *(void *)(v9 + 56) = &type metadata for PodcastNameParameterBuilder;
  *(void *)(v9 + 64) = &off_10C38;
  *(_WORD *)(v9 + 32) = 4;
  *(void *)&xmmword_15430 = 0xD00000000000001DLL;
  *((void *)&xmmword_15430 + 1) = 0x800000000000E940LL;
  qword_15440 = 0xD000000000000056LL;
  unk_15448 = 0x800000000000E740LL;
  *(void *)&xmmword_15450 = v0;
  *((void *)&xmmword_15450 + 1) = v2;
  *(void *)&xmmword_15460 = v7;
  *((void *)&xmmword_15460 + 1) = 0x646F504179616C70LL;
  *(void *)&xmmword_15470 = 0xEC00000074736163LL;
  *((void *)&xmmword_15470 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15480 = 0x800000000000E7A0LL;
  WORD4(xmmword_15480) = 259;
  double result = 0.0;
  xmmword_15490 = 0u;
  xmmword_154A0 = 0u;
  *(void *)&xmmword_154B0 = 0LL;
  *((void *)&xmmword_154B0 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_154C0 = 0LL;
  *((void *)&xmmword_154C0 + 1) = 0xD000000000000024LL;
  *(void *)&xmmword_154D0 = 0x800000000000E7E0LL;
  *((void *)&xmmword_154D0 + 1) = v9;
  qword_154E0 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_9598()
{
  if (qword_143C8 != -1) {
    swift_once(&qword_143C8, sub_77F0);
  }
  uint64_t v0 = qword_151F0;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151F0);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = sub_39C4(&qword_149F8);
  uint64_t v4 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v5 = swift_allocObject( v3,  ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL))
       + *(void *)(*(void *)(v4 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_D790;
  uint64_t v6 = swift_bridgeObjectRetain(v2);
  static VersionedInvocations.HintsDawnA.getter(v6);
  uint64_t v7 = sub_39C4(&qword_14A00);
  uint64_t v8 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + *(void *)(v9 + 72), v10 | 7);
  *(_OWORD *)(v12 + 16) = xmmword_D790;
  uint64_t v13 = v12 + v11;
  uint64_t v14 = enum case for SiriHintsMode.display(_:);
  uint64_t v15 = type metadata accessor for SiriHintsMode(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104LL))(v13, v14, v15);
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 104))( v13,  enum case for DeliveryVehicle.siriHints(_:),  v8);
  *(void *)&xmmword_154E8 = 0xD000000000000021LL;
  *((void *)&xmmword_154E8 + 1) = 0x800000000000E910LL;
  qword_154F8 = 0xD000000000000056LL;
  unk_15500 = 0x800000000000E740LL;
  *(void *)&xmmword_15508 = v0;
  *((void *)&xmmword_15508 + 1) = v2;
  *(void *)&xmmword_15518 = &_swiftEmptyArrayStorage;
  *((void *)&xmmword_15518 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15528 = 0x800000000000E0F0LL;
  *((void *)&xmmword_15528 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15538 = 0x800000000000E7A0LL;
  WORD4(xmmword_15538) = 260;
  xmmword_15548 = 0uLL;
  *(void *)&xmmword_15558 = &off_10738;
  *((void *)&xmmword_15558 + 1) = v5;
  *(void *)&xmmword_15568 = v12;
  *((void *)&xmmword_15568 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_15578 = 0LL;
  *((void *)&xmmword_15578 + 1) = 0xD000000000000024LL;
  *(void *)&xmmword_15588 = 0x800000000000E7E0LL;
  *((void *)&xmmword_15588 + 1) = &_swiftEmptyArrayStorage;
  qword_15598 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

void *sub_97F4()
{
  if (qword_143C0 != -1) {
    swift_once(&qword_143C0, sub_7604);
  }
  uint64_t v0 = qword_151E8;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151E8);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(5LL);
    if ((v6 & 1) != 0) {
      uint64_t result = (void *)swift_bridgeObjectRetain(*(void *)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5));
    }
    else {
      uint64_t result = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t result = &_swiftEmptyArrayStorage;
  }

  *(void *)&xmmword_155A0 = 0xD00000000000001ALL;
  *((void *)&xmmword_155A0 + 1) = 0x800000000000E8F0LL;
  qword_155B0 = 0xD000000000000056LL;
  unk_155B8 = 0x800000000000E740LL;
  *(void *)&xmmword_155C0 = v0;
  *((void *)&xmmword_155C0 + 1) = v2;
  *(void *)&xmmword_155D0 = result;
  *((void *)&xmmword_155D0 + 1) = 0x6973754D79616C70LL;
  *(void *)&xmmword_155E0 = 0xE900000000000063LL;
  *((void *)&xmmword_155E0 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_155F0 = 0x800000000000E7A0LL;
  WORD4(xmmword_155F0) = 261;
  *(void *)&xmmword_15600 = 0xD000000000000011LL;
  *((void *)&xmmword_15600 + 1) = 0x800000000000E7C0LL;
  xmmword_15610 = 0uLL;
  *(void *)&xmmword_15620 = 0LL;
  *((void *)&xmmword_15620 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_15630 = 0LL;
  *((void *)&xmmword_15630 + 1) = 0xD000000000000024LL;
  *(void *)&xmmword_15640 = 0x800000000000E7E0LL;
  *((void *)&xmmword_15640 + 1) = &_swiftEmptyArrayStorage;
  qword_15650 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_99C0()
{
  if (qword_143C0 != -1) {
    swift_once(&qword_143C0, sub_7604);
  }
  uint64_t v0 = qword_151E8;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151E8);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(6LL);
    if ((v6 & 1) != 0)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain(v7);
    }

    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }

  uint64_t v8 = sub_39C4(&qword_149D0);
  uint64_t v9 = swift_allocObject(v8, 112LL, 7LL);
  *(void *)&double result = 2LL;
  *(_OWORD *)(v9 + 16) = xmmword_E090;
  *(void *)(v9 + 56) = &type metadata for SongNameParameterBuilder;
  *(void *)(v9 + 64) = &off_10B50;
  *(_WORD *)(v9 + 32) = 256;
  *(void *)(v9 + 96) = &type metadata for ArtistNameParameterBuilder;
  *(void *)(v9 + 104) = &off_10C68;
  *(_WORD *)(v9 + 72) = 1;
  *(void *)&xmmword_15658 = 0xD000000000000019LL;
  *((void *)&xmmword_15658 + 1) = 0x800000000000E850LL;
  qword_15668 = 0xD000000000000056LL;
  unk_15670 = 0x800000000000E740LL;
  *(void *)&xmmword_15678 = v0;
  *((void *)&xmmword_15678 + 1) = v2;
  *(void *)&xmmword_15688 = v7;
  *((void *)&xmmword_15688 + 1) = 0x5979425879616C70LL;
  *(void *)&xmmword_15698 = 0xE800000000000000LL;
  *((void *)&xmmword_15698 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_156A8 = 0x800000000000E7A0LL;
  WORD4(xmmword_156A8) = 262;
  *(void *)&xmmword_156B8 = 0xD000000000000011LL;
  *((void *)&xmmword_156B8 + 1) = 0x800000000000E7C0LL;
  xmmword_156C8 = 0uLL;
  *(void *)&xmmword_156D8 = 0LL;
  *((void *)&xmmword_156D8 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_156E8 = 0LL;
  *((void *)&xmmword_156E8 + 1) = 0xD000000000000024LL;
  *(void *)&xmmword_156F8 = 0x800000000000E7E0LL;
  *((void *)&xmmword_156F8 + 1) = v9;
  qword_15708 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_9BE8()
{
  if (qword_143C0 != -1) {
    swift_once(&qword_143C0, sub_7604);
  }
  uint64_t v0 = qword_151E8;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151E8);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(7LL);
    if ((v6 & 1) != 0)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain(v7);
    }

    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }

  uint64_t v8 = sub_39C4(&qword_149D0);
  uint64_t v9 = swift_allocObject(v8, 72LL, 7LL);
  *(void *)&double result = 1LL;
  *(_OWORD *)(v9 + 16) = xmmword_D790;
  *(void *)(v9 + 56) = &type metadata for ArtistNameParameterBuilder;
  *(void *)(v9 + 64) = &off_10C68;
  *(_WORD *)(v9 + 32) = 257;
  *(void *)&xmmword_15710 = 0xD00000000000001BLL;
  *((void *)&xmmword_15710 + 1) = 0x800000000000E830LL;
  qword_15720 = 0xD000000000000056LL;
  unk_15728 = 0x800000000000E740LL;
  *(void *)&xmmword_15730 = v0;
  *((void *)&xmmword_15730 + 1) = v2;
  *(void *)&xmmword_15740 = v7;
  *((void *)&xmmword_15740 + 1) = 0x6974724179616C70LL;
  *(void *)&xmmword_15750 = 0xEA00000000007473LL;
  *((void *)&xmmword_15750 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15760 = 0x800000000000E7A0LL;
  WORD4(xmmword_15760) = 263;
  *(void *)&xmmword_15770 = 0xD000000000000011LL;
  *((void *)&xmmword_15770 + 1) = 0x800000000000E7C0LL;
  xmmword_15780 = 0uLL;
  *(void *)&xmmword_15790 = 0LL;
  *((void *)&xmmword_15790 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_157A0 = 0LL;
  *((void *)&xmmword_157A0 + 1) = 0xD000000000000024LL;
  *(void *)&xmmword_157B0 = 0x800000000000E7E0LL;
  *((void *)&xmmword_157B0 + 1) = v9;
  qword_157C0 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_9DF8()
{
  if (qword_143C0 != -1) {
    swift_once(&qword_143C0, sub_7604);
  }
  uint64_t v0 = qword_151E8;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151E8);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(8LL);
    if ((v6 & 1) != 0)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain(v7);
    }

    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }

  uint64_t v8 = sub_39C4(&qword_149D0);
  uint64_t v9 = swift_allocObject(v8, 72LL, 7LL);
  *(void *)&double result = 1LL;
  *(_OWORD *)(v9 + 16) = xmmword_D790;
  *(void *)(v9 + 56) = &type metadata for RadioNameParameterBuilder;
  *(void *)(v9 + 64) = &off_10ED8;
  *(_WORD *)(v9 + 32) = 258;
  *(void *)&xmmword_157C8 = 0xD00000000000001ALL;
  *((void *)&xmmword_157C8 + 1) = 0x800000000000E810LL;
  qword_157D8 = 0xD000000000000056LL;
  unk_157E0 = 0x800000000000E740LL;
  *(void *)&xmmword_157E8 = v0;
  *((void *)&xmmword_157E8 + 1) = v2;
  *(void *)&xmmword_157F8 = v7;
  *((void *)&xmmword_157F8 + 1) = 0x6964615279616C70LL;
  *(void *)&xmmword_15808 = 0xE90000000000006FLL;
  *((void *)&xmmword_15808 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15818 = 0x800000000000E7A0LL;
  WORD4(xmmword_15818) = 264;
  *(void *)&xmmword_15828 = 0xD000000000000011LL;
  *((void *)&xmmword_15828 + 1) = 0x800000000000E7C0LL;
  xmmword_15838 = 0uLL;
  *(void *)&xmmword_15848 = 0LL;
  *((void *)&xmmword_15848 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_15858 = 0LL;
  *((void *)&xmmword_15858 + 1) = 0xD000000000000024LL;
  *(void *)&xmmword_15868 = 0x800000000000E7E0LL;
  *((void *)&xmmword_15868 + 1) = v9;
  qword_15878 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_A008()
{
  if (qword_143C0 != -1) {
    swift_once(&qword_143C0, sub_7604);
  }
  uint64_t v0 = qword_151E8;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151E8);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(9LL);
    if ((v6 & 1) != 0)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain(v7);
    }

    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }

  uint64_t v8 = sub_39C4(&qword_149D0);
  uint64_t v9 = swift_allocObject(v8, 72LL, 7LL);
  *(void *)&double result = 1LL;
  *(_OWORD *)(v9 + 16) = xmmword_D790;
  *(void *)(v9 + 56) = &type metadata for PlaylistNameParameterBuilder;
  *(void *)(v9 + 64) = &off_10E28;
  *(_WORD *)(v9 + 32) = 259;
  *(void *)&xmmword_15880 = 0xD00000000000001DLL;
  *((void *)&xmmword_15880 + 1) = 0x800000000000E720LL;
  qword_15890 = 0xD000000000000056LL;
  unk_15898 = 0x800000000000E740LL;
  *(void *)&xmmword_158A0 = v0;
  *((void *)&xmmword_158A0 + 1) = v2;
  *(void *)&xmmword_158B0 = v7;
  *((void *)&xmmword_158B0 + 1) = 0x79616C5079616C70LL;
  *(void *)&xmmword_158C0 = 0xEC0000007473696CLL;
  *((void *)&xmmword_158C0 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_158D0 = 0x800000000000E7A0LL;
  WORD4(xmmword_158D0) = 265;
  *(void *)&xmmword_158E0 = 0xD000000000000011LL;
  *((void *)&xmmword_158E0 + 1) = 0x800000000000E7C0LL;
  xmmword_158F0 = 0uLL;
  *(void *)&xmmword_15900 = 0LL;
  *((void *)&xmmword_15900 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_15910 = 0LL;
  *((void *)&xmmword_15910 + 1) = 0xD000000000000024LL;
  *(void *)&xmmword_15920 = 0x800000000000E7E0LL;
  *((void *)&xmmword_15920 + 1) = v9;
  qword_15930 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_A21C()
{
  if (qword_143C0 != -1) {
    swift_once(&qword_143C0, sub_7604);
  }
  uint64_t v0 = qword_151E8;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151E8);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(10LL);
    if ((v6 & 1) != 0) {
      uint64_t v7 = (void *)swift_bridgeObjectRetain(*(void *)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5));
    }
    else {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }

  *(void *)&xmmword_15938 = 0xD00000000000001CLL;
  *((void *)&xmmword_15938 + 1) = 0x800000000000E8D0LL;
  qword_15948 = 0xD000000000000056LL;
  unk_15950 = 0x800000000000E740LL;
  *(void *)&xmmword_15958 = v0;
  *((void *)&xmmword_15958 + 1) = v2;
  *(void *)&xmmword_15968 = v7;
  *((void *)&xmmword_15968 + 1) = 0x4E65685479616C70LL;
  *(void *)&xmmword_15978 = 0xEB00000000737765LL;
  *((void *)&xmmword_15978 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15988 = 0x800000000000E7A0LL;
  WORD4(xmmword_15988) = 266;
  double result = 0.0;
  xmmword_15998 = 0u;
  xmmword_159A8 = 0u;
  *(void *)&xmmword_159B8 = 0LL;
  *((void *)&xmmword_159B8 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_159C8 = 0LL;
  *((void *)&xmmword_159C8 + 1) = 0xD000000000000024LL;
  *(void *)&xmmword_159D8 = 0x800000000000E7E0LL;
  *((void *)&xmmword_159D8 + 1) = &_swiftEmptyArrayStorage;
  qword_159E8 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_A3D4()
{
  if (qword_143C8 != -1) {
    swift_once(&qword_143C8, sub_77F0);
  }
  uint64_t v0 = qword_151F0;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151F0);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = sub_39C4(&qword_149F8);
  uint64_t v4 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v5 = swift_allocObject( v3,  ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL))
       + *(void *)(*(void *)(v4 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_D790;
  uint64_t v6 = swift_bridgeObjectRetain(v2);
  static VersionedInvocations.HintsDawnA.getter(v6);
  uint64_t v7 = sub_39C4(&qword_14A00);
  uint64_t v8 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + *(void *)(v9 + 72), v10 | 7);
  *(_OWORD *)(v12 + 16) = xmmword_D790;
  uint64_t v13 = v12 + v11;
  uint64_t v14 = enum case for SiriHintsMode.display(_:);
  uint64_t v15 = type metadata accessor for SiriHintsMode(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104LL))(v13, v14, v15);
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 104))( v13,  enum case for DeliveryVehicle.siriHints(_:),  v8);
  *(void *)&xmmword_159F0 = 0xD000000000000016LL;
  *((void *)&xmmword_159F0 + 1) = 0x800000000000E8B0LL;
  qword_15A00 = 0xD000000000000056LL;
  unk_15A08 = 0x800000000000E740LL;
  *(void *)&xmmword_15A10 = v0;
  *((void *)&xmmword_15A10 + 1) = v2;
  *(void *)&xmmword_15A20 = &_swiftEmptyArrayStorage;
  *((void *)&xmmword_15A20 + 1) = 0x6572616873LL;
  *(void *)&xmmword_15A30 = 0xE500000000000000LL;
  *((void *)&xmmword_15A30 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15A40 = 0x800000000000E7A0LL;
  WORD4(xmmword_15A40) = 267;
  xmmword_15A50 = 0uLL;
  *(void *)&xmmword_15A60 = &off_10788;
  *((void *)&xmmword_15A60 + 1) = v5;
  *(void *)&xmmword_15A70 = v12;
  *((void *)&xmmword_15A70 + 1) = variable initialization expression of AudioSuggestionsExecutionParameters.supportsAffinityIntent;
  xmmword_15A80 = 0uLL;
  *(void *)&xmmword_15A90 = 0xE000000000000000LL;
  *((void *)&xmmword_15A90 + 1) = &_swiftEmptyArrayStorage;
  qword_15AA0 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_A620()
{
  if (qword_143C8 != -1) {
    swift_once(&qword_143C8, sub_77F0);
  }
  uint64_t v0 = qword_151F0;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151F0);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = sub_39C4(&qword_149F8);
  uint64_t v4 = type metadata accessor for VersionedInvocation(0LL);
  uint64_t v5 = swift_allocObject( v3,  ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL))
       + *(void *)(*(void *)(v4 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_D790;
  uint64_t v6 = swift_bridgeObjectRetain(v2);
  static VersionedInvocations.HintsDawnA.getter(v6);
  uint64_t v7 = sub_39C4(&qword_14A00);
  uint64_t v8 = type metadata accessor for DeliveryVehicle(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = swift_allocObject(v7, v11 + *(void *)(v9 + 72), v10 | 7);
  *(_OWORD *)(v12 + 16) = xmmword_D790;
  uint64_t v13 = v12 + v11;
  uint64_t v14 = enum case for SiriHintsMode.display(_:);
  uint64_t v15 = type metadata accessor for SiriHintsMode(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104LL))(v13, v14, v15);
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 104))( v13,  enum case for DeliveryVehicle.siriHints(_:),  v8);
  *(void *)&xmmword_15AA8 = 0xD000000000000018LL;
  *((void *)&xmmword_15AA8 + 1) = 0x800000000000E890LL;
  qword_15AB8 = 0xD000000000000056LL;
  unk_15AC0 = 0x800000000000E740LL;
  *(void *)&xmmword_15AC8 = v0;
  *((void *)&xmmword_15AC8 + 1) = v2;
  *(void *)&xmmword_15AD8 = &_swiftEmptyArrayStorage;
  *((void *)&xmmword_15AD8 + 1) = 0x656C6666756873LL;
  *(void *)&xmmword_15AE8 = 0xE700000000000000LL;
  *((void *)&xmmword_15AE8 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15AF8 = 0x800000000000E7A0LL;
  WORD4(xmmword_15AF8) = 268;
  xmmword_15B08 = 0uLL;
  *(void *)&xmmword_15B18 = &off_107C0;
  *((void *)&xmmword_15B18 + 1) = v5;
  *(void *)&xmmword_15B28 = v12;
  *((void *)&xmmword_15B28 + 1) = sub_A870;
  xmmword_15B38 = 0uLL;
  *(void *)&xmmword_15B48 = 0xE000000000000000LL;
  *((void *)&xmmword_15B48 + 1) = &_swiftEmptyArrayStorage;
  qword_15B58 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

BOOL sub_A870(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 17);
  return v1 != 2 && (v1 & 1) == 0;
}

double sub_A8A4()
{
  if (qword_143C0 != -1) {
    swift_once(&qword_143C0, sub_7604);
  }
  uint64_t v0 = qword_151E8;
  uint64_t v1 = qword_143D0;
  swift_bridgeObjectRetain(qword_151E8);
  if (v1 != -1) {
    swift_once(&qword_143D0, sub_7CF0);
  }
  uint64_t v2 = qword_151F8;
  uint64_t v3 = qword_14450;
  swift_bridgeObjectRetain(qword_151F8);
  if (v3 != -1) {
    swift_once(&qword_14450, sub_B1E4);
  }
  uint64_t v4 = off_148F8;
  if (*(void *)((char *)&dword_10 + (void)off_148F8))
  {
    uint64_t v5 = sub_BB8C(13LL);
    if ((v6 & 1) != 0) {
      uint64_t v7 = (void *)swift_bridgeObjectRetain(*(void *)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5));
    }
    else {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }

  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }

  *(void *)&xmmword_15B60 = 0xD00000000000001FLL;
  *((void *)&xmmword_15B60 + 1) = 0x800000000000E870LL;
  qword_15B70 = 0xD000000000000056LL;
  unk_15B78 = 0x800000000000E740LL;
  *(void *)&xmmword_15B80 = v0;
  *((void *)&xmmword_15B80 + 1) = v2;
  *(void *)&xmmword_15B90 = v7;
  *((void *)&xmmword_15B90 + 1) = 0x676E6F5374616877LL;
  *(void *)&xmmword_15BA0 = 0xEE00736968547349LL;
  *((void *)&xmmword_15BA0 + 1) = 0xD000000000000010LL;
  *(void *)&xmmword_15BB0 = 0x800000000000E7A0LL;
  WORD4(xmmword_15BB0) = 269;
  double result = 0.0;
  xmmword_15BC0 = 0u;
  xmmword_15BD0 = 0u;
  *(void *)&xmmword_15BE0 = 0LL;
  *((void *)&xmmword_15BE0 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_15BF0 = 0LL;
  *((void *)&xmmword_15BF0 + 1) = 0xD000000000000024LL;
  *(void *)&xmmword_15C00 = 0x800000000000E7E0LL;
  *((void *)&xmmword_15C00 + 1) = &_swiftEmptyArrayStorage;
  qword_15C10 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t type metadata accessor for AudioSuggestions()
{
  return objc_opt_self(&OBJC_CLASS____TtC22AudioSuggestionsPlugin16AudioSuggestions);
}

uint64_t destroy for AudioSuggestion(void *a1)
{
  return swift_bridgeObjectRelease(a1[22]);
}

uint64_t initializeWithCopy for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v7;
  uint64_t v10 = *(void *)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v9;
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(a1 + 80) = v11;
  *(_WORD *)(a1 + 88) = *(_WORD *)(a2 + 88);
  uint64_t v12 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v12;
  uint64_t v14 = *(void *)(a2 + 112);
  uint64_t v13 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = v14;
  *(void *)(a1 + 120) = v13;
  __int128 v17 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v17;
  uint64_t v15 = *(void *)(a2 + 152);
  uint64_t v18 = *(void *)(a2 + 144);
  *(void *)(a1 + 144) = v18;
  *(void *)(a1 + 152) = v15;
  uint64_t v19 = *(void *)(a2 + 160);
  uint64_t v20 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = v19;
  *(void *)(a1 + 168) = v20;
  uint64_t v21 = *(void *)(a2 + 176);
  *(void *)(a1 + 176) = v21;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v17);
  swift_retain(v18);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRetain(v21);
  return a1;
}

uint64_t assignWithCopy for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(void *)(a2 + 48);
  uint64_t v13 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v14 = *(void *)(a2 + 64);
  uint64_t v15 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v16 = *(void *)(a2 + 80);
  uint64_t v17 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v18 = *(void *)(a2 + 104);
  uint64_t v19 = *(void *)(a1 + 104);
  *(void *)(a1 + 104) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  uint64_t v20 = *(void *)(a1 + 112);
  uint64_t v21 = *(void *)(a2 + 112);
  *(void *)(a1 + 112) = v21;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v20);
  uint64_t v22 = *(void *)(a1 + 120);
  uint64_t v23 = *(void *)(a2 + 120);
  *(void *)(a1 + 120) = v23;
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRelease(v22);
  uint64_t v24 = *(void *)(a1 + 128);
  uint64_t v25 = *(void *)(a2 + 128);
  *(void *)(a1 + 128) = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease(v24);
  uint64_t v26 = *(void *)(a2 + 144);
  uint64_t v27 = *(void *)(a1 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v26;
  swift_retain(v26);
  swift_release(v27);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  uint64_t v28 = *(void *)(a2 + 160);
  uint64_t v29 = *(void *)(a1 + 160);
  *(void *)(a1 + 160) = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v29);
  uint64_t v30 = *(void *)(a2 + 168);
  uint64_t v31 = *(void *)(a1 + 168);
  *(void *)(a1 + 168) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v31);
  uint64_t v32 = *(void *)(a2 + 176);
  uint64_t v33 = *(void *)(a1 + 176);
  *(void *)(a1 + 176) = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  return a1;
}

__n128 initializeWithTake for AudioSuggestion(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[1];
  __int128 v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __int128 v5 = a2[4];
  __int128 v6 = a2[5];
  __int128 v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  __int128 v9 = a2[9];
  __int128 v10 = a2[10];
  *(void *)(a1 + 176) = *((void *)a2 + 22);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(*(void *)(a1 + 24));
  uint64_t v6 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(*(void *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 64);
  uint64_t v9 = *(void *)(a1 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a2 + 80);
  uint64_t v11 = *(void *)(a1 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease(*(void *)(a1 + 104));
  uint64_t v12 = *(void *)(a1 + 112);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(*(void *)(a1 + 120));
  uint64_t v13 = *(void *)(a1 + 128);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = *(void *)(a1 + 144);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release(v14);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRelease(*(void *)(a1 + 160));
  uint64_t v15 = *(void *)(a1 + 168);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = *(void *)(a1 + 176);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRelease(v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 184)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 184) = 1;
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

    *(_BYTE *)(result + 184) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion()
{
  return &type metadata for AudioSuggestion;
}

_BYTE *initializeBufferWithCopyOfBuffer for AudioSuggestion.SuggestionType(_BYTE *result, _BYTE *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion.ParameterName(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

uint64_t storeEnumTagSinglePayload for AudioSuggestion.ParameterName( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_B118 + 4 * byte_DE63[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_B14C + 4 * byte_DE5E[v4]))();
}

uint64_t sub_B14C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_B154(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xB15CLL);
  }
  return result;
}

uint64_t sub_B168(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xB170LL);
  }
  *(_BYTE *)__n128 result = a2 + 4;
  return result;
}

uint64_t sub_B174(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_B17C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion.ParameterName()
{
  return &type metadata for AudioSuggestion.ParameterName;
}

unint64_t sub_B1A0()
{
  unint64_t result = qword_149C8;
  if (!qword_149C8)
  {
    unint64_t result = swift_getWitnessTable("\t2", &type metadata for AudioSuggestion.ParameterName);
    atomic_store(result, (unint64_t *)&qword_149C8);
  }

  return result;
}

int *sub_B1E4()
{
  uint64_t v0 = sub_39C4(&qword_149D8);
  uint64_t inited = swift_initStackObject(v0, v75);
  *(_OWORD *)(inited + 16) = xmmword_E0A0;
  *(_BYTE *)(inited + 32) = 0;
  uint64_t v2 = sub_39C4(&qword_149E0);
  uint64_t v3 = swift_allocObject(v2, 40LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_E0B0;
  if (qword_14458 != -1) {
    swift_once(&qword_14458, sub_B884);
  }
  uint64_t v4 = qword_14900;
  *(void *)(v3 + 32) = qword_14900;
  ((void (*)(void))specialized Array._endMutation())();
  *(void *)(inited + 40) = v3;
  *(_BYTE *)(inited + 48) = 2;
  uint64_t v5 = qword_14480;
  swift_retain(v4);
  if (v5 != -1) {
    swift_once(&qword_14480, sub_BA7C);
  }
  uint64_t v6 = qword_14928;
  uint64_t v7 = qword_14900;
  uint64_t v67 = qword_14928;
  swift_retain_n(qword_14900, 2LL);
  uint64_t v8 = swift_bridgeObjectRetain(v6);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v8);
  unint64_t v10 = *(void *)((char *)&dword_10 + (v67 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v9 = *(void *)((char *)&dword_18 + (v67 & 0xFFFFFFFFFFFFFF8LL));
  if (v10 >= v9 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v9 > 1, v10 + 1, 1LL);
  }
  uint64_t v11 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v10, v7);
  specialized Array._endMutation()(v11);
  swift_release(v7);
  *(void *)(inited + 56) = v67;
  *(_BYTE *)(inited + 64) = 3;
  uint64_t v12 = qword_14928;
  if (qword_14460 != -1) {
    swift_once(&qword_14460, sub_B93C);
  }
  uint64_t v13 = qword_14908;
  swift_retain_n(qword_14908, 2LL);
  uint64_t v14 = swift_bridgeObjectRetain(v12);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v14);
  unint64_t v16 = *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v15 = *(void *)((char *)&dword_18 + (v12 & 0xFFFFFFFFFFFFFF8LL));
  if (v16 >= v15 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v15 > 1, v16 + 1, 1LL);
  }
  uint64_t v17 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v13);
  specialized Array._endMutation()(v17);
  swift_release(v13);
  *(void *)(inited + 72) = v12;
  *(_BYTE *)(inited + 80) = 5;
  uint64_t v18 = qword_14928;
  uint64_t v19 = qword_14900;
  uint64_t v68 = qword_14928;
  swift_retain_n(qword_14900, 2LL);
  uint64_t v20 = swift_bridgeObjectRetain(v18);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v20);
  unint64_t v22 = *(void *)((char *)&dword_10 + (v68 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v21 = *(void *)((char *)&dword_18 + (v68 & 0xFFFFFFFFFFFFFF8LL));
  if (v22 >= v21 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1LL);
  }
  uint64_t v23 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v19);
  specialized Array._endMutation()(v23);
  swift_release(v19);
  *(void *)(inited + 88) = v68;
  *(_BYTE *)(inited + 96) = 4;
  uint64_t v24 = qword_14928;
  uint64_t v25 = qword_14900;
  uint64_t v69 = qword_14928;
  swift_retain_n(qword_14900, 2LL);
  uint64_t v26 = swift_bridgeObjectRetain(v24);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v26);
  unint64_t v28 = *(void *)((char *)&dword_10 + (v69 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v27 = *(void *)((char *)&dword_18 + (v69 & 0xFFFFFFFFFFFFFF8LL));
  if (v28 >= v27 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1LL);
  }
  uint64_t v29 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v28, v25);
  specialized Array._endMutation()(v29);
  swift_release(v25);
  *(void *)(inited + 104) = v69;
  *(_BYTE *)(inited + 112) = 6;
  uint64_t v30 = qword_14928;
  uint64_t v31 = qword_14900;
  uint64_t v70 = qword_14928;
  swift_retain_n(qword_14900, 2LL);
  uint64_t v32 = swift_bridgeObjectRetain(v30);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v32);
  unint64_t v34 = *(void *)((char *)&dword_10 + (v70 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v33 = *(void *)((char *)&dword_18 + (v70 & 0xFFFFFFFFFFFFFF8LL));
  if (v34 >= v33 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1LL);
  }
  uint64_t v35 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, v31);
  specialized Array._endMutation()(v35);
  swift_release(v31);
  *(void *)(inited + 120) = v70;
  *(_BYTE *)(inited + 128) = 7;
  uint64_t v36 = qword_14928;
  uint64_t v37 = qword_14900;
  uint64_t v71 = qword_14928;
  swift_retain_n(qword_14900, 2LL);
  uint64_t v38 = swift_bridgeObjectRetain(v36);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v38);
  unint64_t v40 = *(void *)((char *)&dword_10 + (v71 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v39 = *(void *)((char *)&dword_18 + (v71 & 0xFFFFFFFFFFFFFF8LL));
  if (v40 >= v39 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1LL);
  }
  uint64_t v41 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v40, v37);
  specialized Array._endMutation()(v41);
  swift_release(v37);
  *(void *)(inited + 136) = v71;
  *(_BYTE *)(inited + 144) = 8;
  uint64_t v42 = qword_14928;
  uint64_t v43 = qword_14900;
  uint64_t v72 = qword_14928;
  swift_retain_n(qword_14900, 2LL);
  uint64_t v44 = swift_bridgeObjectRetain(v42);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v44);
  unint64_t v46 = *(void *)((char *)&dword_10 + (v72 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v45 = *(void *)((char *)&dword_18 + (v72 & 0xFFFFFFFFFFFFFF8LL));
  if (v46 >= v45 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v45 > 1, v46 + 1, 1LL);
  }
  uint64_t v47 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v46, v43);
  specialized Array._endMutation()(v47);
  swift_release(v43);
  *(void *)(inited + 152) = v72;
  *(_BYTE *)(inited + 160) = 9;
  uint64_t v48 = qword_14928;
  uint64_t v49 = qword_14900;
  uint64_t v73 = qword_14928;
  swift_retain_n(qword_14900, 2LL);
  uint64_t v50 = swift_bridgeObjectRetain(v48);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v50);
  unint64_t v52 = *(void *)((char *)&dword_10 + (v73 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v51 = *(void *)((char *)&dword_18 + (v73 & 0xFFFFFFFFFFFFFF8LL));
  if (v52 >= v51 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v51 > 1, v52 + 1, 1LL);
  }
  uint64_t v53 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v52, v49);
  specialized Array._endMutation()(v53);
  swift_release(v49);
  *(void *)(inited + 168) = v73;
  *(_BYTE *)(inited + 176) = 10;
  uint64_t v54 = qword_14928;
  *(void *)(inited + 184) = qword_14928;
  *(_BYTE *)(inited + 192) = 13;
  uint64_t v55 = qword_14900;
  swift_retain_n(qword_14900, 2LL);
  uint64_t v56 = swift_bridgeObjectRetain_n(v54, 2LL);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v56);
  unint64_t v58 = *(void *)((char *)&dword_10 + (v54 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v57 = *(void *)((char *)&dword_18 + (v54 & 0xFFFFFFFFFFFFFF8LL));
  if (v58 >= v57 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v57 > 1, v58 + 1, 1LL);
  }
  uint64_t v59 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v58, v55);
  specialized Array._endMutation()(v59);
  swift_release(v55);
  *(void *)(inited + 200) = v54;
  *(_BYTE *)(inited + 208) = 12;
  uint64_t v60 = qword_14928;
  uint64_t v61 = qword_14900;
  uint64_t v74 = qword_14928;
  swift_retain_n(qword_14900, 2LL);
  uint64_t v62 = swift_bridgeObjectRetain(v60);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v62);
  unint64_t v64 = *(void *)((char *)&dword_10 + (v74 & 0xFFFFFFFFFFFFFF8LL));
  unint64_t v63 = *(void *)((char *)&dword_18 + (v74 & 0xFFFFFFFFFFFFFF8LL));
  if (v64 >= v63 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v63 > 1, v64 + 1, 1LL);
  }
  uint64_t v65 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v64, v61);
  specialized Array._endMutation()(v65);
  swift_release(v61);
  *(void *)(inited + 216) = v74;
  unint64_t result = (int *)sub_8574(inited);
  off_148F8 = result;
  return result;
}

uint64_t sub_B884()
{
  uint64_t v0 = type metadata accessor for CoreSignalTypes(0LL);
  v3[3] = v0;
  v3[4] = sub_CF34( &qword_149F0,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreSignalTypes,  (uint64_t)&protocol conformance descriptor for CoreSignalTypes);
  __int16 v1 = sub_3A04(v3);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v0 - 8) + 104LL))( v1,  enum case for CoreSignalTypes.app(_:),  v0);
  type metadata accessor for Signal(0LL);
  uint64_t result = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)( v3,  0x6C7070612E6D6F63LL,  0xEF636973754D2E65LL,  &_swiftEmptyArrayStorage);
  qword_14900 = result;
  return result;
}

uint64_t sub_B93C()
{
  uint64_t v0 = type metadata accessor for CoreSignalTypes(0LL);
  v3[3] = v0;
  v3[4] = sub_CF34( &qword_149F0,  (uint64_t (*)(uint64_t))&type metadata accessor for CoreSignalTypes,  (uint64_t)&protocol conformance descriptor for CoreSignalTypes);
  __int16 v1 = sub_3A04(v3);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v0 - 8) + 104LL))( v1,  enum case for CoreSignalTypes.app(_:),  v0);
  uint64_t result = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)( v3,  0xD000000000000012LL,  0x800000000000E6D0LL,  &_swiftEmptyArrayStorage);
  qword_14908 = result;
  return result;
}

uint64_t sub_B9EC()
{
  uint64_t result = static Signal.DeviceLocked.getter();
  qword_14910 = result;
  return result;
}

uint64_t sub_BA1C()
{
  uint64_t result = static Signal.Fallback.getter();
  qword_14918 = result;
  return result;
}

uint64_t sub_BA4C()
{
  uint64_t result = static Signal.HomeScreen.getter();
  qword_14920 = result;
  return result;
}

uint64_t sub_BA7C()
{
  uint64_t v0 = sub_39C4(&qword_149E0);
  uint64_t v1 = swift_allocObject(v0, 56LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_E0C0;
  if (qword_14468 != -1) {
    swift_once(&qword_14468, sub_B9EC);
  }
  uint64_t v2 = qword_14910;
  *(void *)(v1 + 32) = qword_14910;
  uint64_t v3 = qword_14470;
  swift_retain(v2);
  if (v3 != -1) {
    swift_once(&qword_14470, sub_BA1C);
  }
  uint64_t v4 = qword_14918;
  *(void *)(v1 + 40) = qword_14918;
  uint64_t v5 = qword_14478;
  swift_retain(v4);
  if (v5 != -1) {
    swift_once(&qword_14478, sub_BA4C);
  }
  uint64_t v6 = qword_14920;
  *(void *)(v1 + 48) = qword_14920;
  specialized Array._endMutation()();
  qword_14928 = v1;
  return swift_retain(v6);
}

uint64_t sub_BB8C(uint64_t a1)
{
  uint64_t v3 = sub_832C(a1);
  uint64_t v5 = v4;
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v5);
  Swift::Int v6 = Hasher._finalize()();
  return sub_BC64(a1, v6);
}

unint64_t sub_BC00(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_C0C8(a1, a2, v5);
}

uint64_t sub_BC64(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a2 & ~(-1LL << *(_BYTE *)(v2 + 32));
  if (((*(void *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v3) & 1) != 0) {
    __asm { BR              X9 }
  }

  return a2 & ~(-1LL << *(_BYTE *)(v2 + 32));
}

unint64_t sub_C0C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_C1A8()
{
  uint64_t v0 = sub_39C4(&qword_14750);
  uint64_t v1 = swift_allocObject(v0, 2608LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_E0D0;
  if (qword_143E0 != -1) {
    swift_once(&qword_143E0, sub_8C44);
  }
  __int128 v2 = xmmword_15278;
  v129[8] = xmmword_15288;
  v129[9] = xmmword_15298;
  __int128 v3 = xmmword_15298;
  v129[10] = xmmword_152A8;
  __int128 v4 = xmmword_15248;
  __int128 v5 = xmmword_15238;
  v129[4] = xmmword_15248;
  v129[5] = xmmword_15258;
  __int128 v6 = xmmword_15258;
  __int128 v7 = xmmword_15268;
  v129[6] = xmmword_15268;
  v129[7] = xmmword_15278;
  v129[0] = xmmword_15208;
  v129[1] = *(_OWORD *)&qword_15218;
  __int128 v9 = xmmword_15208;
  __int128 v8 = *(_OWORD *)&qword_15218;
  __int128 v10 = xmmword_15228;
  v129[2] = xmmword_15228;
  v129[3] = xmmword_15238;
  *(_OWORD *)(v1 + 160) = xmmword_15288;
  *(_OWORD *)(v1 + 176) = v3;
  *(_OWORD *)(v1 + 192) = xmmword_152A8;
  *(_OWORD *)(v1 + 96) = v4;
  *(_OWORD *)(v1 + 112) = v6;
  *(_OWORD *)(v1 + 128) = v7;
  *(_OWORD *)(v1 + 144) = v2;
  *(_OWORD *)(v1 + 32) = v9;
  *(_OWORD *)(v1 + 48) = v8;
  uint64_t v130 = qword_152B8;
  *(void *)(v1 + 208) = qword_152B8;
  *(_OWORD *)(v1 + 64) = v10;
  *(_OWORD *)(v1 + 80) = v5;
  sub_37D8(v129);
  if (qword_143E8 != -1) {
    swift_once(&qword_143E8, sub_8FA4);
  }
  __int128 v11 = xmmword_15330;
  v131[8] = xmmword_15340;
  v131[9] = xmmword_15350;
  __int128 v12 = xmmword_15350;
  v131[10] = xmmword_15360;
  __int128 v13 = xmmword_15300;
  __int128 v14 = xmmword_152F0;
  v131[4] = xmmword_15300;
  v131[5] = xmmword_15310;
  __int128 v15 = xmmword_15310;
  __int128 v16 = xmmword_15320;
  v131[6] = xmmword_15320;
  v131[7] = xmmword_15330;
  v131[0] = xmmword_152C0;
  v131[1] = *(_OWORD *)&qword_152D0;
  __int128 v18 = xmmword_152C0;
  __int128 v17 = *(_OWORD *)&qword_152D0;
  __int128 v19 = xmmword_152E0;
  v131[2] = xmmword_152E0;
  v131[3] = xmmword_152F0;
  *(_OWORD *)(v1 + 344) = xmmword_15340;
  *(_OWORD *)(v1 + 360) = v12;
  *(_OWORD *)(v1 + 376) = xmmword_15360;
  *(_OWORD *)(v1 + 280) = v13;
  *(_OWORD *)(v1 + 296) = v15;
  *(_OWORD *)(v1 + 312) = v16;
  *(_OWORD *)(v1 + 328) = v11;
  *(_OWORD *)(v1 + 216) = v18;
  *(_OWORD *)(v1 + 232) = v17;
  uint64_t v132 = qword_15370;
  *(void *)(v1 + 392) = qword_15370;
  *(_OWORD *)(v1 + 248) = v19;
  *(_OWORD *)(v1 + 264) = v14;
  sub_37D8(v131);
  if (qword_143F0 != -1) {
    swift_once(&qword_143F0, sub_91FC);
  }
  __int128 v20 = xmmword_153E8;
  v133[8] = xmmword_153F8;
  v133[9] = xmmword_15408;
  __int128 v21 = xmmword_15408;
  v133[10] = xmmword_15418;
  __int128 v22 = xmmword_153B8;
  __int128 v23 = xmmword_153A8;
  v133[4] = xmmword_153B8;
  v133[5] = xmmword_153C8;
  __int128 v24 = xmmword_153C8;
  __int128 v25 = xmmword_153D8;
  v133[6] = xmmword_153D8;
  v133[7] = xmmword_153E8;
  v133[0] = xmmword_15378;
  v133[1] = *(_OWORD *)&qword_15388;
  __int128 v27 = xmmword_15378;
  __int128 v26 = *(_OWORD *)&qword_15388;
  __int128 v28 = xmmword_15398;
  v133[2] = xmmword_15398;
  v133[3] = xmmword_153A8;
  *(_OWORD *)(v1 + 528) = xmmword_153F8;
  *(_OWORD *)(v1 + 544) = v21;
  *(_OWORD *)(v1 + 560) = xmmword_15418;
  *(_OWORD *)(v1 + 464) = v22;
  *(_OWORD *)(v1 + 480) = v24;
  *(_OWORD *)(v1 + 496) = v25;
  *(_OWORD *)(v1 + 512) = v20;
  *(_OWORD *)(v1 + 400) = v27;
  *(_OWORD *)(v1 + 416) = v26;
  uint64_t v134 = qword_15428;
  *(void *)(v1 + 576) = qword_15428;
  *(_OWORD *)(v1 + 432) = v28;
  *(_OWORD *)(v1 + 448) = v23;
  sub_37D8(v133);
  if (qword_143F8 != -1) {
    swift_once(&qword_143F8, sub_9398);
  }
  __int128 v29 = xmmword_154A0;
  v135[8] = xmmword_154B0;
  v135[9] = xmmword_154C0;
  __int128 v30 = xmmword_154C0;
  v135[10] = xmmword_154D0;
  __int128 v31 = xmmword_15470;
  __int128 v32 = xmmword_15460;
  v135[4] = xmmword_15470;
  v135[5] = xmmword_15480;
  __int128 v33 = xmmword_15480;
  __int128 v34 = xmmword_15490;
  v135[6] = xmmword_15490;
  v135[7] = xmmword_154A0;
  v135[0] = xmmword_15430;
  v135[1] = *(_OWORD *)&qword_15440;
  __int128 v36 = xmmword_15430;
  __int128 v35 = *(_OWORD *)&qword_15440;
  __int128 v37 = xmmword_15450;
  v135[2] = xmmword_15450;
  v135[3] = xmmword_15460;
  *(_OWORD *)(v1 + 712) = xmmword_154B0;
  *(_OWORD *)(v1 + 728) = v30;
  *(_OWORD *)(v1 + 744) = xmmword_154D0;
  *(_OWORD *)(v1 + 648) = v31;
  *(_OWORD *)(v1 + 664) = v33;
  *(_OWORD *)(v1 + 680) = v34;
  *(_OWORD *)(v1 + 696) = v29;
  *(_OWORD *)(v1 + 584) = v36;
  *(_OWORD *)(v1 + 600) = v35;
  uint64_t v136 = qword_154E0;
  *(void *)(v1 + 760) = qword_154E0;
  *(_OWORD *)(v1 + 616) = v37;
  *(_OWORD *)(v1 + 632) = v32;
  sub_37D8(v135);
  if (qword_14400 != -1) {
    swift_once(&qword_14400, sub_9598);
  }
  __int128 v38 = xmmword_15558;
  v137[8] = xmmword_15568;
  v137[9] = xmmword_15578;
  __int128 v39 = xmmword_15578;
  v137[10] = xmmword_15588;
  __int128 v40 = xmmword_15528;
  __int128 v41 = xmmword_15518;
  v137[4] = xmmword_15528;
  v137[5] = xmmword_15538;
  __int128 v42 = xmmword_15538;
  __int128 v43 = xmmword_15548;
  v137[6] = xmmword_15548;
  v137[7] = xmmword_15558;
  v137[0] = xmmword_154E8;
  v137[1] = *(_OWORD *)&qword_154F8;
  __int128 v45 = xmmword_154E8;
  __int128 v44 = *(_OWORD *)&qword_154F8;
  __int128 v46 = xmmword_15508;
  v137[2] = xmmword_15508;
  v137[3] = xmmword_15518;
  *(_OWORD *)(v1 + 896) = xmmword_15568;
  *(_OWORD *)(v1 + 912) = v39;
  *(_OWORD *)(v1 + 928) = xmmword_15588;
  *(_OWORD *)(v1 + 832) = v40;
  *(_OWORD *)(v1 + 848) = v42;
  *(_OWORD *)(v1 + 864) = v43;
  *(_OWORD *)(v1 + 880) = v38;
  *(_OWORD *)(v1 + 768) = v45;
  *(_OWORD *)(v1 + 784) = v44;
  uint64_t v138 = qword_15598;
  *(void *)(v1 + 944) = qword_15598;
  *(_OWORD *)(v1 + 800) = v46;
  *(_OWORD *)(v1 + 816) = v41;
  sub_37D8(v137);
  if (qword_14408 != -1) {
    swift_once(&qword_14408, sub_97F4);
  }
  __int128 v47 = xmmword_15610;
  v139[8] = xmmword_15620;
  v139[9] = xmmword_15630;
  __int128 v48 = xmmword_15630;
  v139[10] = xmmword_15640;
  __int128 v49 = xmmword_155E0;
  __int128 v50 = xmmword_155D0;
  v139[4] = xmmword_155E0;
  v139[5] = xmmword_155F0;
  __int128 v51 = xmmword_155F0;
  __int128 v52 = xmmword_15600;
  v139[6] = xmmword_15600;
  v139[7] = xmmword_15610;
  v139[0] = xmmword_155A0;
  v139[1] = *(_OWORD *)&qword_155B0;
  __int128 v54 = xmmword_155A0;
  __int128 v53 = *(_OWORD *)&qword_155B0;
  __int128 v55 = xmmword_155C0;
  v139[2] = xmmword_155C0;
  v139[3] = xmmword_155D0;
  *(_OWORD *)(v1 + 1080) = xmmword_15620;
  *(_OWORD *)(v1 + 1096) = v48;
  *(_OWORD *)(v1 + 1112) = xmmword_15640;
  *(_OWORD *)(v1 + 1016) = v49;
  *(_OWORD *)(v1 + 1032) = v51;
  *(_OWORD *)(v1 + 1048) = v52;
  *(_OWORD *)(v1 + 1064) = v47;
  *(_OWORD *)(v1 + 952) = v54;
  *(_OWORD *)(v1 + 968) = v53;
  uint64_t v140 = qword_15650;
  *(void *)(v1 + 1128) = qword_15650;
  *(_OWORD *)(v1 + 984) = v55;
  *(_OWORD *)(v1 + 1000) = v50;
  sub_37D8(v139);
  if (qword_14430 != -1) {
    swift_once(&qword_14430, sub_A21C);
  }
  __int128 v56 = xmmword_159A8;
  v141[8] = xmmword_159B8;
  v141[9] = xmmword_159C8;
  __int128 v57 = xmmword_159C8;
  v141[10] = xmmword_159D8;
  __int128 v58 = xmmword_15978;
  __int128 v59 = xmmword_15968;
  v141[4] = xmmword_15978;
  v141[5] = xmmword_15988;
  __int128 v60 = xmmword_15988;
  __int128 v61 = xmmword_15998;
  v141[6] = xmmword_15998;
  v141[7] = xmmword_159A8;
  v141[0] = xmmword_15938;
  v141[1] = *(_OWORD *)&qword_15948;
  __int128 v63 = xmmword_15938;
  __int128 v62 = *(_OWORD *)&qword_15948;
  __int128 v64 = xmmword_15958;
  v141[2] = xmmword_15958;
  v141[3] = xmmword_15968;
  *(_OWORD *)(v1 + 1264) = xmmword_159B8;
  *(_OWORD *)(v1 + 1280) = v57;
  *(_OWORD *)(v1 + 1296) = xmmword_159D8;
  *(_OWORD *)(v1 + 1200) = v58;
  *(_OWORD *)(v1 + 1216) = v60;
  *(_OWORD *)(v1 + 1232) = v61;
  *(_OWORD *)(v1 + 1248) = v56;
  *(_OWORD *)(v1 + 1136) = v63;
  *(_OWORD *)(v1 + 1152) = v62;
  uint64_t v142 = qword_159E8;
  *(void *)(v1 + 1312) = qword_159E8;
  *(_OWORD *)(v1 + 1168) = v64;
  *(_OWORD *)(v1 + 1184) = v59;
  sub_37D8(v141);
  if (qword_14438 != -1) {
    swift_once(&qword_14438, sub_A3D4);
  }
  __int128 v65 = xmmword_15A60;
  v143[8] = xmmword_15A70;
  v143[9] = xmmword_15A80;
  __int128 v66 = xmmword_15A80;
  v143[10] = xmmword_15A90;
  __int128 v67 = xmmword_15A30;
  __int128 v68 = xmmword_15A20;
  v143[4] = xmmword_15A30;
  v143[5] = xmmword_15A40;
  __int128 v69 = xmmword_15A40;
  __int128 v70 = xmmword_15A50;
  v143[6] = xmmword_15A50;
  v143[7] = xmmword_15A60;
  v143[0] = xmmword_159F0;
  v143[1] = *(_OWORD *)&qword_15A00;
  __int128 v72 = xmmword_159F0;
  __int128 v71 = *(_OWORD *)&qword_15A00;
  __int128 v73 = xmmword_15A10;
  v143[2] = xmmword_15A10;
  v143[3] = xmmword_15A20;
  *(_OWORD *)(v1 + 1448) = xmmword_15A70;
  *(_OWORD *)(v1 + 1464) = v66;
  *(_OWORD *)(v1 + 1480) = xmmword_15A90;
  *(_OWORD *)(v1 + 1384) = v67;
  *(_OWORD *)(v1 + 1400) = v69;
  *(_OWORD *)(v1 + 1416) = v70;
  *(_OWORD *)(v1 + 1432) = v65;
  *(_OWORD *)(v1 + 1320) = v72;
  *(_OWORD *)(v1 + 1336) = v71;
  uint64_t v144 = qword_15AA0;
  *(void *)(v1 + 1496) = qword_15AA0;
  *(_OWORD *)(v1 + 1352) = v73;
  *(_OWORD *)(v1 + 1368) = v68;
  sub_37D8(v143);
  if (qword_14440 != -1) {
    swift_once(&qword_14440, sub_A620);
  }
  __int128 v74 = xmmword_15B18;
  v145[8] = xmmword_15B28;
  v145[9] = xmmword_15B38;
  __int128 v75 = xmmword_15B38;
  v145[10] = xmmword_15B48;
  __int128 v76 = xmmword_15AE8;
  __int128 v77 = xmmword_15AD8;
  v145[4] = xmmword_15AE8;
  v145[5] = xmmword_15AF8;
  __int128 v78 = xmmword_15AF8;
  __int128 v79 = xmmword_15B08;
  v145[6] = xmmword_15B08;
  v145[7] = xmmword_15B18;
  v145[0] = xmmword_15AA8;
  v145[1] = *(_OWORD *)&qword_15AB8;
  __int128 v81 = xmmword_15AA8;
  __int128 v80 = *(_OWORD *)&qword_15AB8;
  __int128 v82 = xmmword_15AC8;
  v145[2] = xmmword_15AC8;
  v145[3] = xmmword_15AD8;
  *(_OWORD *)(v1 + 1632) = xmmword_15B28;
  *(_OWORD *)(v1 + 1648) = v75;
  *(_OWORD *)(v1 + 1664) = xmmword_15B48;
  *(_OWORD *)(v1 + 1568) = v76;
  *(_OWORD *)(v1 + 1584) = v78;
  *(_OWORD *)(v1 + 1600) = v79;
  *(_OWORD *)(v1 + 1616) = v74;
  *(_OWORD *)(v1 + 1504) = v81;
  *(_OWORD *)(v1 + 1520) = v80;
  uint64_t v146 = qword_15B58;
  *(void *)(v1 + 1680) = qword_15B58;
  *(_OWORD *)(v1 + 1536) = v82;
  *(_OWORD *)(v1 + 1552) = v77;
  sub_37D8(v145);
  if (qword_14448 != -1) {
    swift_once(&qword_14448, sub_A8A4);
  }
  __int128 v83 = xmmword_15BD0;
  v147[8] = xmmword_15BE0;
  v147[9] = xmmword_15BF0;
  __int128 v84 = xmmword_15BF0;
  v147[10] = xmmword_15C00;
  __int128 v85 = xmmword_15BA0;
  __int128 v86 = xmmword_15B90;
  v147[4] = xmmword_15BA0;
  v147[5] = xmmword_15BB0;
  __int128 v87 = xmmword_15BB0;
  __int128 v88 = xmmword_15BC0;
  v147[6] = xmmword_15BC0;
  v147[7] = xmmword_15BD0;
  v147[0] = xmmword_15B60;
  v147[1] = *(_OWORD *)&qword_15B70;
  __int128 v90 = xmmword_15B60;
  __int128 v89 = *(_OWORD *)&qword_15B70;
  __int128 v91 = xmmword_15B80;
  v147[2] = xmmword_15B80;
  v147[3] = xmmword_15B90;
  *(_OWORD *)(v1 + 1816) = xmmword_15BE0;
  *(_OWORD *)(v1 + 1832) = v84;
  *(_OWORD *)(v1 + 1848) = xmmword_15C00;
  *(_OWORD *)(v1 + 1752) = v85;
  *(_OWORD *)(v1 + 1768) = v87;
  *(_OWORD *)(v1 + 1784) = v88;
  *(_OWORD *)(v1 + 1800) = v83;
  *(_OWORD *)(v1 + 1688) = v90;
  *(_OWORD *)(v1 + 1704) = v89;
  uint64_t v148 = qword_15C10;
  *(void *)(v1 + 1864) = qword_15C10;
  *(_OWORD *)(v1 + 1720) = v91;
  *(_OWORD *)(v1 + 1736) = v86;
  sub_37D8(v147);
  if (qword_14410 != -1) {
    swift_once(&qword_14410, sub_99C0);
  }
  __int128 v92 = xmmword_156C8;
  v149[8] = xmmword_156D8;
  v149[9] = xmmword_156E8;
  __int128 v93 = xmmword_156E8;
  v149[10] = xmmword_156F8;
  __int128 v94 = xmmword_15698;
  __int128 v95 = xmmword_15688;
  v149[4] = xmmword_15698;
  v149[5] = xmmword_156A8;
  __int128 v96 = xmmword_156A8;
  __int128 v97 = xmmword_156B8;
  v149[6] = xmmword_156B8;
  v149[7] = xmmword_156C8;
  v149[0] = xmmword_15658;
  v149[1] = *(_OWORD *)&qword_15668;
  __int128 v99 = xmmword_15658;
  __int128 v98 = *(_OWORD *)&qword_15668;
  __int128 v100 = xmmword_15678;
  v149[2] = xmmword_15678;
  v149[3] = xmmword_15688;
  *(_OWORD *)(v1 + 2000) = xmmword_156D8;
  *(_OWORD *)(v1 + 2016) = v93;
  *(_OWORD *)(v1 + 2032) = xmmword_156F8;
  *(_OWORD *)(v1 + 1936) = v94;
  *(_OWORD *)(v1 + 1952) = v96;
  *(_OWORD *)(v1 + 1968) = v97;
  *(_OWORD *)(v1 + 1984) = v92;
  *(_OWORD *)(v1 + 1872) = v99;
  *(_OWORD *)(v1 + 1888) = v98;
  uint64_t v150 = qword_15708;
  *(void *)(v1 + 2048) = qword_15708;
  *(_OWORD *)(v1 + 1904) = v100;
  *(_OWORD *)(v1 + 1920) = v95;
  sub_37D8(v149);
  if (qword_14418 != -1) {
    swift_once(&qword_14418, sub_9BE8);
  }
  __int128 v101 = xmmword_15780;
  v151[8] = xmmword_15790;
  v151[9] = xmmword_157A0;
  __int128 v102 = xmmword_157A0;
  v151[10] = xmmword_157B0;
  __int128 v103 = xmmword_15750;
  __int128 v104 = xmmword_15740;
  v151[4] = xmmword_15750;
  v151[5] = xmmword_15760;
  __int128 v105 = xmmword_15760;
  __int128 v106 = xmmword_15770;
  v151[6] = xmmword_15770;
  v151[7] = xmmword_15780;
  v151[0] = xmmword_15710;
  v151[1] = *(_OWORD *)&qword_15720;
  __int128 v108 = xmmword_15710;
  __int128 v107 = *(_OWORD *)&qword_15720;
  __int128 v109 = xmmword_15730;
  v151[2] = xmmword_15730;
  v151[3] = xmmword_15740;
  *(_OWORD *)(v1 + 2184) = xmmword_15790;
  *(_OWORD *)(v1 + 2200) = v102;
  *(_OWORD *)(v1 + 2216) = xmmword_157B0;
  *(_OWORD *)(v1 + 2120) = v103;
  *(_OWORD *)(v1 + 2136) = v105;
  *(_OWORD *)(v1 + 2152) = v106;
  *(_OWORD *)(v1 + 2168) = v101;
  *(_OWORD *)(v1 + 2056) = v108;
  *(_OWORD *)(v1 + 2072) = v107;
  uint64_t v152 = qword_157C0;
  *(void *)(v1 + 2232) = qword_157C0;
  *(_OWORD *)(v1 + 2088) = v109;
  *(_OWORD *)(v1 + 2104) = v104;
  sub_37D8(v151);
  if (qword_14420 != -1) {
    swift_once(&qword_14420, sub_9DF8);
  }
  __int128 v110 = xmmword_15838;
  v153[8] = xmmword_15848;
  v153[9] = xmmword_15858;
  __int128 v111 = xmmword_15858;
  v153[10] = xmmword_15868;
  __int128 v112 = xmmword_15808;
  __int128 v113 = xmmword_157F8;
  v153[4] = xmmword_15808;
  v153[5] = xmmword_15818;
  __int128 v114 = xmmword_15818;
  __int128 v115 = xmmword_15828;
  v153[6] = xmmword_15828;
  v153[7] = xmmword_15838;
  v153[0] = xmmword_157C8;
  v153[1] = *(_OWORD *)&qword_157D8;
  __int128 v117 = xmmword_157C8;
  __int128 v116 = *(_OWORD *)&qword_157D8;
  __int128 v118 = xmmword_157E8;
  v153[2] = xmmword_157E8;
  v153[3] = xmmword_157F8;
  *(_OWORD *)(v1 + 2368) = xmmword_15848;
  *(_OWORD *)(v1 + 2384) = v111;
  *(_OWORD *)(v1 + 2400) = xmmword_15868;
  *(_OWORD *)(v1 + 2304) = v112;
  *(_OWORD *)(v1 + 2320) = v114;
  *(_OWORD *)(v1 + 2336) = v115;
  *(_OWORD *)(v1 + 2352) = v110;
  *(_OWORD *)(v1 + 2240) = v117;
  *(_OWORD *)(v1 + 2256) = v116;
  uint64_t v154 = qword_15878;
  *(void *)(v1 + 2416) = qword_15878;
  *(_OWORD *)(v1 + 2272) = v118;
  *(_OWORD *)(v1 + 2288) = v113;
  sub_37D8(v153);
  if (qword_14428 != -1) {
    swift_once(&qword_14428, sub_A008);
  }
  __int128 v119 = xmmword_158F0;
  v155[8] = xmmword_15900;
  v155[9] = xmmword_15910;
  __int128 v120 = xmmword_15910;
  v155[10] = xmmword_15920;
  __int128 v121 = xmmword_158C0;
  __int128 v122 = xmmword_158B0;
  v155[4] = xmmword_158C0;
  v155[5] = xmmword_158D0;
  __int128 v123 = xmmword_158D0;
  __int128 v124 = xmmword_158E0;
  v155[6] = xmmword_158E0;
  v155[7] = xmmword_158F0;
  v155[0] = xmmword_15880;
  v155[1] = *(_OWORD *)&qword_15890;
  __int128 v126 = xmmword_15880;
  __int128 v125 = *(_OWORD *)&qword_15890;
  __int128 v127 = xmmword_158A0;
  v155[2] = xmmword_158A0;
  v155[3] = xmmword_158B0;
  *(_OWORD *)(v1 + 2552) = xmmword_15900;
  *(_OWORD *)(v1 + 2568) = v120;
  *(_OWORD *)(v1 + 2584) = xmmword_15920;
  *(_OWORD *)(v1 + 2488) = v121;
  *(_OWORD *)(v1 + 2504) = v123;
  *(_OWORD *)(v1 + 2520) = v124;
  *(_OWORD *)(v1 + 2536) = v119;
  *(_OWORD *)(v1 + 2424) = v126;
  *(_OWORD *)(v1 + 2440) = v125;
  uint64_t v156 = qword_15930;
  *(void *)(v1 + 2600) = qword_15930;
  *(_OWORD *)(v1 + 2456) = v127;
  *(_OWORD *)(v1 + 2472) = v122;
  sub_37D8(v155);
  return v1;
}

uint64_t sub_CC04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_39C4(&qword_14780);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_CC4C(__int128 *a1, _OWORD *a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_CC64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_39C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

void *sub_CCA8(uint64_t a1)
{
  uint64_t v2 = sub_C1A8();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease(v2);
    return &_swiftEmptyArrayStorage;
  }

  uint64_t v5 = v4 - 1;
  __int128 v6 = &_swiftEmptyArrayStorage;
  for (uint64_t i = 32LL; ; i += 184LL)
  {
    __int128 v8 = *(_OWORD *)(v3 + i);
    __int128 v9 = *(_OWORD *)(v3 + i + 16);
    __int128 v10 = *(_OWORD *)(v3 + i + 48);
    __int128 v41 = *(_OWORD *)(v3 + i + 32);
    __int128 v42 = v10;
    __int128 v39 = v8;
    __int128 v40 = v9;
    __int128 v11 = *(_OWORD *)(v3 + i + 64);
    __int128 v12 = *(_OWORD *)(v3 + i + 80);
    __int128 v13 = *(_OWORD *)(v3 + i + 112);
    __int128 v45 = *(_OWORD *)(v3 + i + 96);
    __int128 v46 = v13;
    __int128 v43 = v11;
    __int128 v44 = v12;
    __int128 v14 = *(_OWORD *)(v3 + i + 128);
    __int128 v15 = *(_OWORD *)(v3 + i + 144);
    __int128 v16 = *(_OWORD *)(v3 + i + 160);
    uint64_t v50 = *(void *)(v3 + i + 176);
    __int128 v48 = v15;
    __int128 v49 = v16;
    __int128 v47 = v14;
    uint64_t v17 = v13;
    if (!(void)v13) {
      goto LABEL_10;
    }
    v38[1] = v13;
    uint64_t v18 = sub_39C4(&qword_14A28);
    uint64_t v19 = swift_allocObject(v18, 40LL, 7LL);
    *(_OWORD *)(v19 + 16) = xmmword_D790;
    *(void *)(v19 + 32) = a1;
    v38[0] = v19;
    sub_37D8(&v39);
    swift_bridgeObjectRetain(v17);
    uint64_t v20 = sub_39C4(&qword_14A30);
    unint64_t v21 = sub_CEE8();
    uint64_t v22 = sub_CF34( &qword_14A40,  (uint64_t (*)(uint64_t))type metadata accessor for INMediaItemType,  (uint64_t)&unk_D834);
    char v23 = Collection<>.contains<A>(_:)(v38, v20, v20, v21, v21, v22);
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v19);
    if ((v23 & 1) == 0) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v6);
    __int128 v51 = v6;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_4E28(0, v6[2] + 1LL, 1);
      __int128 v6 = v51;
    }

    unint64_t v26 = v6[2];
    unint64_t v25 = v6[3];
    if (v26 >= v25 >> 1)
    {
      sub_4E28(v25 > 1, v26 + 1, 1);
      __int128 v6 = v51;
    }

    v6[2] = v26 + 1;
    __int128 v27 = (char *)&v6[23 * v26];
    __int128 v28 = v39;
    __int128 v29 = v40;
    __int128 v30 = v42;
    *((_OWORD *)v27 + 4) = v41;
    *((_OWORD *)v27 + 5) = v30;
    *((_OWORD *)v27 + 2) = v28;
    *((_OWORD *)v27 + 3) = v29;
    __int128 v31 = v43;
    __int128 v32 = v44;
    __int128 v33 = v46;
    *((_OWORD *)v27 + 8) = v45;
    *((_OWORD *)v27 + 9) = v33;
    *((_OWORD *)v27 + 6) = v31;
    *((_OWORD *)v27 + 7) = v32;
    __int128 v34 = v47;
    __int128 v35 = v48;
    __int128 v36 = v49;
    *((void *)v27 + 26) = v50;
    *((_OWORD *)v27 + 11) = v35;
    *((_OWORD *)v27 + 12) = v36;
    *((_OWORD *)v27 + 10) = v34;
LABEL_10:
    if (!v5) {
      goto LABEL_14;
    }
LABEL_13:
    --v5;
  }

  sub_38CC(&v39);
  if (v5) {
    goto LABEL_13;
  }
LABEL_14:
  swift_bridgeObjectRelease(v3);
  return v6;
}

unint64_t sub_CEE8()
{
  unint64_t result = qword_14A38;
  if (!qword_14A38)
  {
    uint64_t v1 = sub_6828(&qword_14A30);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_14A38);
  }

  return result;
}

uint64_t sub_CF34(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_CF74(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10818, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xE) {
    return 14LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_CFBC(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10988, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5) {
    return 5LL;
  }
  else {
    return v3;
  }
}

uint64_t getEnumTagSinglePayload for AudioSuggestion.SuggestionType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AudioSuggestion.SuggestionType( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_D0E0 + 4 * byte_DE89[v4]))();
  }
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_D114 + 4 * byte_DE84[v4]))();
}

uint64_t sub_D114(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_D11C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xD124LL);
  }
  return result;
}

uint64_t sub_D130(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xD138LL);
  }
  *(_BYTE *)uint64_t result = a2 + 13;
  return result;
}

uint64_t sub_D13C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_D144(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_D150(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_D158(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion.SuggestionType()
{
  return &type metadata for AudioSuggestion.SuggestionType;
}

unint64_t sub_D174()
{
  unint64_t result = qword_14A48;
  if (!qword_14A48)
  {
    unint64_t result = swift_getWitnessTable("Y1", &type metadata for AudioSuggestion.SuggestionType);
    atomic_store(result, (unint64_t *)&qword_14A48);
  }

  return result;
}