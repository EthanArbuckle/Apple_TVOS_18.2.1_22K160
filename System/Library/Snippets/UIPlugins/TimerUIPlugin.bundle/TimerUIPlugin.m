uint64_t sub_4838()
{
  uint64_t v0;
  v0 = type metadata accessor for Logger(0LL);
  sub_6E94(v0, qword_28168);
  sub_6D9C(v0, (uint64_t)qword_28168);
  return Logger.init(subsystem:category:)( 0xD000000000000013LL,  0x800000000001F8A0LL,  0x495572656D6974LL,  0xE700000000000000LL);
}

void sub_48AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  a19 = v20;
  a20 = v21;
  uint64_t v23 = v22;
  v25 = v24;
  sub_9100();
  sub_9030();
  __chkstk_darwin(v26);
  sub_9020();
  uint64_t v29 = v28 - v27;
  uint64_t v30 = type metadata accessor for Context(0LL);
  sub_78F8(&qword_281C0, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  void *v25 = EnvironmentObject.init()(v30, v31);
  v25[1] = v32;
  v33 = (int *)type metadata accessor for TimerSelector(0LL);
  uint64_t v34 = v33[7];
  id v35 = [objc_allocWithZone(MTTimerManager) init];
  *(void *)((char *)v25 + v34) = v35;
  uint64_t v36 = qword_28160;
  id v37 = v35;
  if (v36 != -1) {
    swift_once(&qword_28160, sub_4838);
  }
  uint64_t v38 = type metadata accessor for Logger(0LL);
  sub_6D9C(v38, (uint64_t)qword_28168);
  sub_7528(v23, v29, type metadata accessor for TimerSelectorModel);
  v40 = (os_log_s *)Logger.logObject.getter(v39);
  os_log_type_t v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)sub_91D0(12LL);
    *(_DWORD *)v42 = 134217984;
    v43 = v25;
    v44 = v33;
    uint64_t v45 = v23;
    id v46 = v37;
    uint64_t v47 = *(void *)(*(void *)v29 + 16LL);
    sub_7E54(v29, type metadata accessor for TimerSelectorModel);
    uint64_t v50 = v47;
    id v37 = v46;
    uint64_t v23 = v45;
    v33 = v44;
    v25 = v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &a9, v42 + 4, v42 + 12);
    _os_log_impl(&dword_0, v40, v41, "[TimerSelector.init] Initializing for %ld timers.", v42, 0xCu);
    sub_9128((uint64_t)v42);
  }

  else
  {
    sub_7E54(v29, type metadata accessor for TimerSelectorModel);
  }

  sub_7528(v23, (uint64_t)v25 + v33[5], type metadata accessor for TimerSelectorModel);
  uint64_t v48 = sub_6E20(v37);
  if (v48)
  {
    uint64_t v49 = v48;
    sub_7E54(v23, type metadata accessor for TimerSelectorModel);
    *(void *)((char *)v25 + v33[6]) = v49;
    sub_9008();
  }

  else
  {
    __break(1u);
  }
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_4ADC()
{
  uint64_t v46 = v0;
  uint64_t v52 = v1;
  uint64_t v2 = type metadata accessor for ComponentStackBottomSpacing(0LL);
  uint64_t v50 = *(void *)(v2 - 8);
  uint64_t v51 = v2;
  __chkstk_darwin(v2);
  sub_9040();
  uint64_t v49 = v3;
  uint64_t v4 = type metadata accessor for ColorScheme(0LL);
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  __chkstk_darwin(v4);
  sub_9040();
  uint64_t v44 = v5;
  uint64_t v6 = type metadata accessor for TimerSelector(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_6FC0(&qword_28278);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_9020();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_6FC0(&qword_28280);
  sub_9030();
  __chkstk_darwin(v16);
  sub_9020();
  uint64_t v19 = v18 - v17;
  uint64_t v45 = sub_6FC0(&qword_28288);
  sub_9030();
  __chkstk_darwin(v20);
  sub_9020();
  uint64_t v23 = v22 - v21;
  sub_7528(v46, (uint64_t)v9, type metadata accessor for TimerSelector);
  uint64_t v24 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v25 = (v24 + 16) & ~v24;
  uint64_t v26 = swift_allocObject(&unk_251F8, v25 + v8, v24 | 7);
  sub_7DD8((uint64_t)v9, v26 + v25, type metadata accessor for TimerSelector);
  uint64_t v27 = sub_6FC0(&qword_28290);
  sub_8F78(&qword_28298, &qword_28290);
  uint64_t v29 = ComponentStack.init(content:)(sub_7560, v26, v27, v28);
  uint64_t v30 = static Color.black.getter(v29);
  LOBYTE(v9) = static Edge.Set.all.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v19, v14, v10);
  uint64_t v31 = v19 + *(int *)(v15 + 36);
  *(void *)uint64_t v31 = v30;
  *(_BYTE *)(v31 + 8) = (_BYTE)v9;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  uint64_t KeyPath = swift_getKeyPath(&unk_1E320);
  uint64_t v34 = v47;
  uint64_t v33 = v48;
  uint64_t v35 = v44;
  (*(void (**)(uint64_t, void, uint64_t))(v47 + 104))(v44, enum case for ColorScheme.dark(_:), v48);
  uint64_t v36 = v45;
  id v37 = (uint64_t *)(v23 + *(int *)(v45 + 36));
  uint64_t v38 = sub_6FC0(&qword_282A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))((char *)v37 + *(int *)(v38 + 28), v35, v33);
  *id v37 = KeyPath;
  sub_75B0(v19, v23);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
  sub_7F08(v19, &qword_28280);
  uint64_t v40 = v49;
  uint64_t v39 = v50;
  uint64_t v41 = v51;
  (*(void (**)(uint64_t, void, uint64_t))(v50 + 104))( v49,  enum case for ComponentStackBottomSpacing.none(_:),  v51);
  unint64_t v42 = sub_75F8();
  View.lastComponentBottomSpacing(_:)(v40, v36, v42);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v41);
  sub_7F08(v23, &qword_28288);
  sub_9008();
}

uint64_t sub_4DF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimerSelector(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = type metadata accessor for DisambiguationTitle(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for TimerSelectorModel(0LL);
  uint64_t v8 = sub_6FC0(&qword_281D0);
  Loggable.wrappedValue.getter(v17, v8);
  v17[3] = &type metadata for String;
  v17[4] = &protocol witness table for String;
  uint64_t v16 = 0LL;
  memset(v15, 0, sizeof(v15));
  DisambiguationTitle.init(text1:thumbnail:)(v17, v15);
  sub_7528(a1, (uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL), type metadata accessor for TimerSelector);
  uint64_t v9 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = (v9 + 16) & ~v9;
  uint64_t v11 = swift_allocObject(&unk_25220, v10 + v4, v9 | 7);
  sub_7DD8((uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL), v11 + v10, type metadata accessor for TimerSelector);
  uint64_t v12 = sub_6FC0(&qword_282D8);
  unint64_t v13 = sub_7814();
  return DisambiguationView.init(title:content:)(v7, sub_77C8, v11, v12, v13);
}

uint64_t sub_4F84(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimerSelector(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = (char *)&v23[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a1 + *(int *)(__chkstk_darwin(v2) + 20));
  swift_bridgeObjectRetain(v6);
  sub_792C();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease(v6);
  uint64_t v24 = v8;
  uint64_t KeyPath = swift_getKeyPath(&unk_1E350);
  sub_7528(a1, (uint64_t)v5, type metadata accessor for TimerSelector);
  uint64_t v10 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = (v10 + 16) & ~v10;
  uint64_t v12 = swift_allocObject(&unk_25248, v11 + v4, v10 | 7);
  sub_7DD8((uint64_t)v5, v12 + v11, type metadata accessor for TimerSelector);
  uint64_t v13 = swift_allocObject(&unk_25270, 32LL, 7LL);
  *(void *)(v13 + 16) = sub_7C20;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = sub_6FC0(&qword_282F0);
  uint64_t v15 = sub_6FC0(&qword_282F8);
  sub_8F78(&qword_28300, &qword_282F0);
  uint64_t v17 = v16;
  uint64_t v18 = type metadata accessor for TimerItemView(255LL);
  sub_78F8(&qword_282E8, type metadata accessor for TimerItemView);
  v23[0] = v18;
  v23[1] = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v23,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
  return ForEach<>.init(_:id:content:)( &v24,  KeyPath,  sub_7C8C,  v13,  v14,  v15,  v17,  &protocol witness table for Int,  OpaqueTypeConformance2);
}

uint64_t sub_5154@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v42 = a3;
  uint64_t v5 = type metadata accessor for TimerSelector(0LL);
  uint64_t v36 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v37 = v6;
  uint64_t v41 = (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for SiriTimerSnippetModel(0LL);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v34 + 64);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v39 = type metadata accessor for TimerItemView(0LL);
  __chkstk_darwin(v39);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = sub_6FC0(&qword_282F8);
  uint64_t v38 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v35 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_7528(a1, (uint64_t)v12, type metadata accessor for SiriTimerSnippetModel);
  uint64_t v16 = *(void *)(a2 + *(int *)(v5 + 24));
  uint64_t v44 = a1;
  swift_bridgeObjectRetain(v16);
  uint64_t v17 = sub_5530(sub_7C94, (uint64_t)v43, v16);
  swift_bridgeObjectRelease(v16);
  uint64_t v18 = *(void **)(a2 + *(int *)(v5 + 28));
  if (*(void *)a2)
  {
    sub_5644((uint64_t)v12, v17, v18, 0LL, 0xE000000000000000LL, *(id *)a2, (uint64_t)v14);
    sub_7528(a1, (uint64_t)v10, type metadata accessor for SiriTimerSnippetModel);
    uint64_t v19 = v41;
    sub_7528(a2, v41, type metadata accessor for TimerSelector);
    uint64_t v20 = *(unsigned __int8 *)(v34 + 80);
    uint64_t v21 = (v20 + 16) & ~v20;
    uint64_t v22 = *(unsigned __int8 *)(v36 + 80);
    uint64_t v23 = (v8 + v22 + v21) & ~v22;
    uint64_t v24 = swift_allocObject(&unk_25298, v23 + v37, v20 | v22 | 7);
    sub_7DD8((uint64_t)v10, v24 + v21, type metadata accessor for SiriTimerSnippetModel);
    sub_7DD8(v19, v24 + v23, type metadata accessor for TimerSelector);
    sub_78F8(&qword_282E8, type metadata accessor for TimerItemView);
    uint64_t v25 = v35;
    View.componentTapped(isNavigation:perform:)(0LL, sub_7DF8, v24, v39, v26);
    swift_release(v24);
    sub_7E54((uint64_t)v14, type metadata accessor for TimerItemView);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v38 + 32))(v42, v25, v40);
  }

  else
  {
    uint64_t v28 = *(void *)(a2 + 8);
    uint64_t v29 = type metadata accessor for Context(0LL);
    sub_78F8(&qword_281C0, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
    uint64_t v31 = v30;
    id v32 = v18;
    uint64_t result = EnvironmentObject.error()(0LL, v28, v29, v31);
    __break(1u);
  }

  return result;
}

uint64_t sub_5498(id *a1, void *a2)
{
  id v3 = [*a1 timerIDString];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  if (v4 == *a2 && v6 == a2[1]) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6);
  }
  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

void *sub_5530(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a3);
  for (; v7; uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v14))
  {
    uint64_t v8 = 4LL;
    while (1)
    {
      id v9 = (a3 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, a3)
         : *(id *)(a3 + 8 * v8);
      uint64_t v10 = v9;
      uint64_t v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1LL)) {
        break;
      }
      id v15 = v9;
      char v12 = a1(&v15);
      if (v4)
      {
        sub_91C8();

        return v10;
      }

      if ((v12 & 1) != 0)
      {
        sub_91C8();
        return v10;
      }

      ++v8;
      if (v11 == v7) {
        goto LABEL_11;
      }
    }

    __break(1u);
LABEL_16:
    if (a3 < 0) {
      uint64_t v14 = a3;
    }
    else {
      uint64_t v14 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
  }

LABEL_11:
  sub_91C8();
  return 0LL;
}

uint64_t sub_5644@<X0>( uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>)
{
  id v90 = a6;
  id v91 = a3;
  uint64_t v87 = a4;
  uint64_t v88 = a5;
  sub_6FC0(&qword_28318);
  sub_9030();
  __chkstk_darwin(v10);
  sub_9020();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_9054();
  sub_9030();
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v82 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (uint64_t *)((char *)&v82 - v22);
  uint64_t v92 = 0LL;
  uint64_t v24 = sub_6FC0(&qword_28320);
  sub_9144(v24);
  *(_OWORD *)a7 = v94;
  sub_188D8(0.0);
  uint64_t v92 = v25;
  uint64_t v93 = v26;
  uint64_t v27 = sub_6FC0(&qword_28328);
  sub_9144(v27);
  uint64_t v28 = v95;
  *(_OWORD *)(a7 + 16) = v94;
  *(void *)(a7 + 32) = v28;
  if (qword_28160 != -1) {
    swift_once(&qword_28160, sub_4838);
  }
  uint64_t v29 = type metadata accessor for Logger(0LL);
  sub_6D9C(v29, (uint64_t)qword_28168);
  sub_7528(a1, (uint64_t)v23, type metadata accessor for SiriTimerSnippetModel);
  uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
  os_log_type_t v32 = static os_log_type_t.default.getter();
  BOOL v33 = os_log_type_enabled(v31, v32);
  v89 = v21;
  if (v33)
  {
    uint64_t v83 = v14;
    uint64_t v34 = (uint8_t *)sub_91D0(12LL);
    uint64_t v35 = sub_91D0(32LL);
    uint64_t v86 = a1;
    uint64_t v36 = v35;
    *(void *)&__int128 v94 = v35;
    v84 = a2;
    uint64_t v85 = v13;
    *(_DWORD *)uint64_t v34 = 136315138;
    v82 = v34 + 4;
    uint64_t v37 = v18;
    uint64_t v39 = *v23;
    unint64_t v38 = v23[1];
    swift_bridgeObjectRetain(v38);
    uint64_t v40 = v39;
    uint64_t v18 = v37;
    uint64_t v92 = sub_1C5A4(v40, v38, (uint64_t *)&v94);
    a2 = v84;
    uint64_t v13 = v85;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v82, v34 + 12);
    unint64_t v41 = v38;
    uint64_t v14 = v83;
    swift_bridgeObjectRelease(v41);
    sub_7E54((uint64_t)v23, type metadata accessor for SiriTimerSnippetModel);
    _os_log_impl(&dword_0, v31, v32, "[TimerItemView.init] Initializing for timer with ID %s.", v34, 0xCu);
    swift_arrayDestroy(v36, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v42 = v36;
    a1 = v86;
    sub_9128(v42);
    sub_9128((uint64_t)v34);
  }

  else
  {
    sub_7E54((uint64_t)v23, type metadata accessor for SiriTimerSnippetModel);
  }

  uint64_t v43 = (int *)sub_9164();
  sub_7528(a1, a7 + v43[7], type metadata accessor for SiriTimerSnippetModel);
  uint64_t v44 = (void *)(a7 + v43[8]);
  uint64_t v45 = v88;
  void *v44 = v87;
  v44[1] = v45;
  id v47 = v90;
  id v46 = v91;
  *(void *)(a7 + v43[10]) = v91;
  *(void *)(a7 + v43[9]) = v47;
  uint64_t v49 = *(void **)a7;
  uint64_t v48 = *(void *)(a7 + 8);
  *(void *)a7 = a2;
  *(void *)(a7 + 8) = 0LL;
  id v91 = v46;
  id v90 = v47;
  id v50 = a2;

  swift_release(v48);
  if (a2)
  {
    [v50 remainingTime];
    double v52 = v51;
  }

  else
  {
    double v52 = 0.0;
  }

  uint64_t v53 = (uint64_t)v89;
  sub_7528(a1, (uint64_t)v89, type metadata accessor for SiriTimerSnippetModel);
  if (a2)
  {
    sub_7E54(v53, type metadata accessor for SiriTimerSnippetModel);
    [v50 duration];
    double v55 = v54;
  }

  else
  {
    uint64_t v56 = v53 + *(int *)(v14 + 40);
    double v52 = *(double *)v56;
    uint64_t v57 = v53;
    int v58 = *(unsigned __int8 *)(v56 + 8);
    sub_7E54(v57, type metadata accessor for SiriTimerSnippetModel);
    double v55 = 0.0;
    if (v58) {
      double v52 = 0.0;
    }
  }

  sub_7528(a1, (uint64_t)v18, type metadata accessor for SiriTimerSnippetModel);
  if (a2)
  {
    sub_7E54((uint64_t)v18, type metadata accessor for SiriTimerSnippetModel);
    *(double *)(a7 + 40) = v52 / v55;
    *(void *)(a7 + 48) = 0LL;
    id v59 = v50;
    v60 = (char *)[v59 state];
    double v61 = 0.0;
    if (v60 != (_BYTE *)&dword_0 + 1) {
      objc_msgSend(v59, "remainingTime", 0.0);
    }
    sub_188D8(v61);
    uint64_t v63 = v62;
    a2 = v64;
  }

  else
  {
    v65 = &v18[*(int *)(v14 + 36)];
    double v66 = *(double *)v65;
    int v67 = v65[8];
    sub_7E54((uint64_t)v18, type metadata accessor for SiriTimerSnippetModel);
    uint64_t v63 = 0LL;
    double v68 = 1.0;
    if (!v67) {
      double v68 = v66;
    }
    *(double *)(a7 + 40) = v52 / v68;
    *(void *)(a7 + 48) = 0LL;
    uint64_t v69 = a1 + *(int *)(v14 + 40);
    if ((*(_BYTE *)(v69 + 8) & 1) == 0)
    {
      sub_188D8(*(double *)v69);
      uint64_t v63 = v70;
      a2 = v71;
    }
  }

  swift_bridgeObjectRelease(*(void *)(a7 + 24));
  swift_release(*(void *)(a7 + 32));
  *(void *)(a7 + 16) = v63;
  *(void *)(a7 + 24) = a2;
  *(void *)(a7 + 32) = 0LL;
  id v72 = [(id)objc_opt_self(NSRunLoop) mainRunLoop];
  sub_7ED0(0LL, (unint64_t *)&qword_28330, &OBJC_CLASS___NSTimer_ptr);
  uint64_t v73 = type metadata accessor for NSRunLoop.SchedulerOptions(0LL);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0(v13, 1LL, 1LL, v73);
  uint64_t v74 = static NSTimer.publish(every:tolerance:on:in:options:)(0LL, 1LL, v72, NSRunLoopCommonModes, v13, 0.2);
  sub_7F08(v13, &qword_28318);
  *(void *)&__int128 v94 = v74;
  uint64_t v75 = type metadata accessor for NSTimer.TimerPublisher(0LL);
  sub_78F8( (unint64_t *)&qword_28338,  (uint64_t (*)(uint64_t))&type metadata accessor for NSTimer.TimerPublisher);
  uint64_t v77 = ConnectablePublisher.autoconnect()(v75, v76);
  swift_release(v74);
  *(void *)&__int128 v94 = v77;
  uint64_t v78 = sub_6FC0(&qword_28340);
  sub_8F78(&qword_28348, &qword_28340);
  uint64_t v80 = Publisher.eraseToAnyPublisher()(v78, v79);

  sub_7E54(a1, type metadata accessor for SiriTimerSnippetModel);
  uint64_t result = swift_release(v94);
  *(void *)(a7 + v43[11]) = v80;
  return result;
}

void *sub_5C44(void *result, uint64_t a2)
{
  unint64_t v2 = result[3];
  if (v2)
  {
    uint64_t v3 = result[4];
    if (v3)
    {
      uint64_t v5 = result[2];
      if (qword_28160 != -1) {
        swift_once(&qword_28160, sub_4838);
      }
      uint64_t v6 = type metadata accessor for Logger(0LL);
      sub_6D9C(v6, (uint64_t)qword_28168);
      swift_bridgeObjectRetain_n(v2, 2LL);
      uint64_t v7 = swift_bridgeObjectRetain_n(v3, 2LL);
      uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
      os_log_type_t v9 = static os_log_type_t.default.getter();
      uint64_t v23 = v5;
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = swift_slowAlloc(22LL, -1LL);
        uint64_t v22 = swift_slowAlloc(64LL, -1LL);
        uint64_t v25 = v22;
        *(_DWORD *)uint64_t v10 = 136315394;
        swift_bridgeObjectRetain(v2);
        uint64_t v24 = sub_1C5A4(v5, v2, &v25);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v10 + 4, v10 + 12);
        swift_bridgeObjectRelease_n(v2, 3LL);
        *(_WORD *)(v10 + 12) = 2080;
        swift_bridgeObjectRetain(v3);
        uint64_t v11 = a2;
        uint64_t v12 = Dictionary.description.getter( v3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
        unint64_t v14 = v13;
        swift_bridgeObjectRelease(v3);
        uint64_t v15 = v12;
        a2 = v11;
        uint64_t v24 = sub_1C5A4(v15, v14, &v25);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v10 + 14, v10 + 22);
        swift_bridgeObjectRelease_n(v3, 2LL);
        swift_bridgeObjectRelease(v14);
        _os_log_impl( &dword_0,  v8,  v9,  "[TimerItemView.componentTapped]: Performing direct invocation with ID = %s, payload = %s",  (uint8_t *)v10,  0x16u);
        swift_arrayDestroy(v22, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v22, -1LL, -1LL);
        swift_slowDealloc(v10, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v3, 2LL);
        swift_bridgeObjectRelease_n(v2, 2LL);
      }

      if (*(void *)a2)
      {
        id v16 = *(id *)a2;
        sub_5F1C(v3);
        uint64_t v18 = v17;
        dispatch thunk of Context.perform(directInvocation:payload:)(v23, v2, v17);

        return (void *)swift_bridgeObjectRelease(v18);
      }

      else
      {
        uint64_t v19 = *(void *)(a2 + 8);
        uint64_t v20 = type metadata accessor for Context(0LL);
        sub_78F8(&qword_281C0, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
        uint64_t result = (void *)EnvironmentObject.error()(0LL, v19, v20, v21);
        __break(1u);
      }
    }
  }

  return result;
}

void sub_5F1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_6FC0(&qword_28310);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v33 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v32 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  swift_retain(v3);
  int64_t v8 = 0LL;
  if (!v6) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v19 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    sub_7E7C(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v45);
    *(void *)&__int128 v44 = v21;
    *((void *)&v44 + 1) = v20;
    v42[2] = v44;
    v43[0] = v45[0];
    v43[1] = v45[1];
    *(void *)&v42[0] = v21;
    *((void *)&v42[0] + 1) = v20;
    swift_bridgeObjectRetain(v20);
    swift_dynamicCast(&v34, v42, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_7EB8(v43, v37);
    __int128 v38 = v34;
    __int128 v39 = v35;
    uint64_t v40 = v36;
    sub_7EB8(v37, v41);
    __int128 v34 = v38;
    __int128 v35 = v39;
    uint64_t v36 = v40;
    sub_7EB8(v41, v42);
    sub_7EB8(v42, &v38);
    Swift::Int v22 = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v23 = -1LL << *((_BYTE *)v3 + 32);
    unint64_t v24 = v22 & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)&v7[8 * (v24 >> 6)]) == 0)
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      while (++v25 != v28 || (v27 & 1) == 0)
      {
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)&v7[8 * v25];
        if (v30 != -1)
        {
          unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
          goto LABEL_38;
        }
      }

      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }

    unint64_t v26 = __clz(__rbit64((-1LL << v24) & ~*(void *)&v7[8 * (v24 >> 6)])) | v24 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_38:
    *(void *)&v7[(v26 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v26;
    uint64_t v31 = v3[6] + 40 * v26;
    *(_OWORD *)uint64_t v31 = v34;
    *(_OWORD *)(v31 + 16) = v35;
    *(void *)(v31 + 32) = v36;
    sub_7EB8(&v38, (_OWORD *)(v3[7] + 32 * v26));
    ++v3[2];
    if (v6) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1LL)) {
      goto LABEL_42;
    }
    if (v11 >= v32) {
      goto LABEL_40;
    }
    unint64_t v12 = *(void *)(v33 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      sub_9188();
      if (v14 == v15) {
        goto LABEL_40;
      }
      sub_917C();
      if (!v12)
      {
        sub_9188();
        if (v14 == v15) {
          goto LABEL_40;
        }
        sub_917C();
        if (!v12)
        {
          sub_9188();
          if (v14 == v15) {
            goto LABEL_40;
          }
          sub_917C();
          if (!v12) {
            break;
          }
        }
      }
    }

LABEL_28:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }

  int64_t v17 = v16 + 4;
  if (v17 >= v32)
  {
LABEL_40:
    swift_release(v3);
    sub_7EC8(a1);
    return;
  }

  unint64_t v12 = *(void *)(v33 + 8 * v17);
  if (v12)
  {
    int64_t v13 = v17;
    goto LABEL_28;
  }

  while (!__OFADD__(v17, 1LL))
  {
    sub_9188();
    if (v14 == v15) {
      goto LABEL_40;
    }
    sub_917C();
    int64_t v17 = v18 + 1;
    if (v12) {
      goto LABEL_28;
    }
  }

LABEL_43:
  __break(1u);
}

uint64_t sub_62BC(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = sub_6FC0(&qword_28308);
  return a2(v4, &a1[*(int *)(v5 + 48)]);
}

void sub_6318()
{
}

void sub_6334(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme(0LL);
  __chkstk_darwin(v2);
  sub_9020();
  uint64_t v5 = v4 - v3;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v4 - v3, a1);
  EnvironmentValues.colorScheme.setter(v5);
  sub_90CC();
}

void sub_63AC()
{
  uint64_t v78 = v1;
  uint64_t v79 = sub_9164();
  uint64_t v72 = *(void *)(v79 - 8);
  uint64_t v2 = __chkstk_darwin(v79);
  uint64_t v73 = v3;
  uint64_t v74 = (uint64_t)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v67 - v4;
  uint64_t v6 = type metadata accessor for FactItemHeroNumberView(0LL);
  uint64_t v76 = *(void *)(v6 - 8);
  uint64_t v77 = v6;
  __chkstk_darwin(v6);
  sub_9040();
  uint64_t v75 = v7;
  uint64_t v70 = sub_6FC0(&qword_28408);
  sub_9030();
  __chkstk_darwin(v8);
  sub_9040();
  uint64_t v71 = v9;
  uint64_t v10 = *((void *)v0 + 4);
  uint64_t v80 = v0;
  __int128 v90 = v0[1];
  uint64_t v91 = v10;
  uint64_t v11 = sub_6FC0(&qword_28410);
  State.wrappedValue.getter(v89, v11);
  uint64_t v12 = v89[1];
  uint64_t v69 = v5;
  if (v89[1]) {
    uint64_t v13 = v89[0];
  }
  else {
    sub_188D8(0.0);
  }
  *(void *)&__int128 v90 = v13;
  *((void *)&v90 + 1) = v12;
  unint64_t v68 = sub_8D88();
  uint64_t v14 = Text.init<A>(_:)(&v90, &type metadata for String, v68);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19 & 1;
  uint64_t v21 = static Color.orange.getter();
  uint64_t v22 = Text.foregroundColor(_:)(v21, v14, v16, v20, v18);
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v28 = v27;
  swift_release(v21);
  sub_8DC4(v14, v16, v20);
  swift_bridgeObjectRelease(v18);
  uint64_t v92 = &type metadata for Text;
  uint64_t v93 = &protocol witness table for Text;
  uint64_t v29 = sub_91A0((uint64_t)&unk_252C0);
  *(void *)&__int128 v90 = v29;
  *(void *)(v29 + 16) = v22;
  *(void *)(v29 + 24) = v24;
  *(_BYTE *)(v29 + 32) = v26 & 1;
  *(void *)(v29 + 40) = v28;
  memset(v89, 0, 40);
  __int128 v86 = *v80;
  uint64_t v30 = sub_6FC0(&qword_28420);
  State.wrappedValue.getter(v85, v30);
  id v31 = v85[0];
  if (v85[0])
  {
    id v32 = [v85[0] displayTitle];

    uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    unint64_t v35 = v34;
  }

  else
  {
    uint64_t v33 = 0LL;
    unint64_t v35 = 0LL;
  }

  uint64_t v36 = (uint64_t)v69;
  sub_7528((uint64_t)v80, (uint64_t)v69, type metadata accessor for TimerItemView);
  if (!v35)
  {
    uint64_t v37 = *(int *)(v79 + 28);
    __int128 v38 = (uint64_t *)(v36 + v37 + *(int *)(sub_9054() + 32));
    unint64_t v35 = v38[1];
    if (v35)
    {
      uint64_t v33 = *v38;
      swift_bridgeObjectRetain(v38[1]);
    }

    else
    {
      unint64_t v35 = 0xE500000000000000LL;
      uint64_t v33 = 0x72656D6954LL;
    }
  }

  sub_7E54(v36, type metadata accessor for TimerItemView);
  *(void *)&__int128 v86 = v33;
  *((void *)&v86 + 1) = v35;
  uint64_t v39 = Text.init<A>(_:)(&v86, &type metadata for String, v68);
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44 & 1;
  uint64_t v46 = static Color.orange.getter();
  uint64_t v47 = Text.foregroundColor(_:)(v46, v39, v41, v45, v43);
  uint64_t v49 = v48;
  char v51 = v50;
  uint64_t v53 = v52;
  swift_release(v46);
  sub_8DC4(v39, v41, v45);
  swift_bridgeObjectRelease(v43);
  uint64_t v87 = &type metadata for Text;
  uint64_t v88 = &protocol witness table for Text;
  uint64_t v54 = sub_91A0((uint64_t)&unk_252C0);
  *(void *)&__int128 v86 = v54;
  *(void *)(v54 + 16) = v47;
  *(void *)(v54 + 24) = v49;
  *(_BYTE *)(v54 + 32) = v51 & 1;
  *(void *)(v54 + 40) = v53;
  memset(v85, 0, 40);
  uint64_t v84 = 0LL;
  memset(v83, 0, sizeof(v83));
  uint64_t v82 = 0LL;
  memset(v81, 0, sizeof(v81));
  uint64_t v55 = v75;
  FactItemHeroNumberView.init(number:text1:text2:text3:text4:text5:)(&v90, v89, &v86, v85, v83, v81);
  uint64_t v56 = *(void *)((char *)v80 + *(int *)(v79 + 44));
  uint64_t v57 = v74;
  sub_7528((uint64_t)v80, v74, type metadata accessor for TimerItemView);
  uint64_t v58 = *(unsigned __int8 *)(v72 + 80);
  uint64_t v59 = (v58 + 16) & ~v58;
  uint64_t v60 = swift_allocObject(&unk_252E8, v59 + v73, v58 | 7);
  sub_7DD8(v57, v60 + v59, type metadata accessor for TimerItemView);
  uint64_t v62 = v76;
  uint64_t v61 = v77;
  uint64_t v63 = v71;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 16))(v71, v55, v77);
  uint64_t v64 = v70;
  *(void *)(v63 + *(int *)(v70 + 52)) = v56;
  v65 = (void (**)())(v63 + *(int *)(v64 + 56));
  char *v65 = sub_8EFC;
  v65[1] = (void (*)())v60;
  double v66 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
  swift_retain(v56);
  v66(v55, v61);
  sub_8F20(v63, v78, &qword_28408);
  sub_9008();
}

uint64_t sub_681C()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = type metadata accessor for TimerItemView(0LL);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v44 - v6;
  uint64_t v8 = *v0;
  uint64_t v9 = v0[1];
  *(void *)&__int128 v45 = *v0;
  *((void *)&v45 + 1) = v9;
  uint64_t v10 = sub_6FC0(&qword_28420);
  State.wrappedValue.getter(v44, v10);
  id v11 = v44[0];

  if (!v11)
  {
    uint64_t v18 = v1 + *(int *)(v2 + 28);
    uint64_t v17 = 0LL;
    uint64_t v19 = v18 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 40);
    if ((*(_BYTE *)(v19 + 8) & 1) != 0) {
      goto LABEL_14;
    }
    double v20 = *(double *)v19;
    goto LABEL_13;
  }

  *(void *)&__int128 v45 = v8;
  *((void *)&v45 + 1) = v9;
  State.wrappedValue.getter(v44, v10);
  if (!v44[0])
  {
    if (qword_28160 != -1) {
      swift_once(&qword_28160, sub_4838);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    uint64_t v22 = sub_6D9C(v21, (uint64_t)qword_28168);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      char v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)char v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "TimerItemView: MTTimer missing in call for durationString(for:)", v25, 2u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    double v20 = 0.0;
LABEL_13:
    sub_188D8(v20);
    id v11 = v26;
    uint64_t v17 = v27;
    goto LABEL_14;
  }

  id v12 = v44[0];
  uint64_t v13 = (char *)[v12 state];
  double v14 = 0.0;
  if (v13 != (_BYTE *)&dword_0 + 1) {
    objc_msgSend(v12, "remainingTime", 0.0);
  }
  sub_188D8(v14);
  id v11 = v15;
  uint64_t v17 = v16;

LABEL_14:
  uint64_t v28 = *(void *)(v1 + 32);
  __int128 v45 = *(_OWORD *)(v1 + 16);
  uint64_t v46 = v28;
  v44[0] = v11;
  v44[1] = v17;
  uint64_t v29 = sub_6FC0(&qword_28410);
  State.wrappedValue.setter(v44, v29);
  if (sub_6C10() == 1)
  {
    uint64_t v30 = *(void *)(v1 + 48);
    *(void *)&__int128 v45 = *(void *)(v1 + 40);
    *((void *)&v45 + 1) = v30;
    v44[0] = 0LL;
  }

  else
  {
    *(void *)&__int128 v45 = v8;
    *((void *)&v45 + 1) = v9;
    State.wrappedValue.getter(v44, v10);
    id v31 = v44[0];
    if (v44[0])
    {
      [v44[0] remainingTime];
      double v33 = v32;
    }

    else
    {
      double v33 = 0.0;
    }

    sub_7528(v1, (uint64_t)v7, type metadata accessor for TimerItemView);
    if (v31)
    {
      sub_7E54((uint64_t)v7, type metadata accessor for TimerItemView);
    }

    else
    {
      uint64_t v34 = *(int *)(v2 + 28);
      unint64_t v35 = &v7[v34 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 40)];
      double v33 = *(double *)v35;
      LODWORD(v34) = v35[8];
      sub_7E54((uint64_t)v7, type metadata accessor for TimerItemView);
      if ((_DWORD)v34) {
        double v33 = 0.0;
      }
    }

    __int128 v45 = *(_OWORD *)v1;
    State.wrappedValue.getter(v44, v10);
    id v36 = v44[0];
    if (v44[0])
    {
      [v44[0] duration];
      double v38 = v37;
    }

    else
    {
      double v38 = 0.0;
    }

    sub_7528(v1, (uint64_t)v5, type metadata accessor for TimerItemView);
    if (v36)
    {
      sub_7E54((uint64_t)v5, type metadata accessor for TimerItemView);
    }

    else
    {
      uint64_t v39 = *(int *)(v2 + 28);
      uint64_t v40 = &v5[v39 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 36)];
      double v38 = *(double *)v40;
      LODWORD(v39) = v40[8];
      sub_7E54((uint64_t)v5, type metadata accessor for TimerItemView);
      if ((_DWORD)v39) {
        double v38 = 1.0;
      }
    }

    uint64_t v41 = *(void *)(v1 + 48);
    *(void *)&__int128 v45 = *(void *)(v1 + 40);
    *((void *)&v45 + 1) = v41;
    *(double *)char v44 = v33 / v38;
  }

  uint64_t v42 = sub_6FC0(&qword_28428);
  return State.wrappedValue.setter(v44, v42);
}

uint64_t sub_6C10()
{
  uint64_t v1 = v0;
  __int128 v10 = *v0;
  uint64_t v2 = sub_6FC0(&qword_28420);
  State.wrappedValue.getter(&v11, v2);
  id v3 = v11;
  if (v11)
  {
    id v4 = objc_msgSend(v11, "state", v10);
  }

  else
  {
    uint64_t v5 = (char *)v1 + *(int *)(type metadata accessor for TimerItemView(0LL) + 28);
    id v4 = 0LL;
    uint64_t v6 = &v5[*(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 44)];
    if ((v6[8] & 1) == 0)
    {
      uint64_t v7 = SiriTimerState.init(rawValue:)(*(void *)v6);
      if ((v8 & 1) != 0)
      {
        return 0LL;
      }

      else if (v7 == 1)
      {
        return 3LL;
      }

      else
      {
        return 2LL * (v7 == 2);
      }
    }
  }

  return (uint64_t)v4;
}

uint64_t sub_6CD4()
{
  return static View._viewListCount(inputs:)();
}

uint64_t variable initialization expression of SiriTimerSnippetModel.directInvocationPayload()
{
  return 0LL;
}

uint64_t variable initialization expression of SiriTimerSnippetModel.punchoutURL@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_91C0();
  return _s13TimerUIPlugin19SiriTimePluginModelOwst_0(a1, 1LL, 1LL, v2);
}

uint64_t _s13TimerUIPlugin19SiriTimePluginModelOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t variable initialization expression of ComposeTimerSnippet._context()
{
  uint64_t v0 = type metadata accessor for Context(0LL);
  sub_78F8(&qword_281C0, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  return EnvironmentObject.init()(v0, v1);
}

uint64_t type metadata accessor for TimerSelector(uint64_t a1)
{
  return sub_78C8(a1, qword_28230, (uint64_t)&nominal type descriptor for TimerSelector);
}

uint64_t sub_6D9C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_6DB4(uint64_t a1@<X8>)
{
  *(void *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

  ;
}

void sub_6DEC(TimerUIPlugin::TimerSnippetModel *a1@<X8>)
{
  a1->timers._rawValue = TimerSnippetModel.init(timers:)((Swift::OpaquePointer)v1->_rawValue).timers._rawValue;
  sub_905C();
}

BOOL sub_6E14(uint64_t *a1, uint64_t *a2)
{
  return sub_115F8(*a1, *a2);
}

uint64_t sub_6E20(void *a1)
{
  id v2 = [a1 timersSync];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = sub_7ED0(0LL, &qword_281C8, &OBJC_CLASS___MTTimer_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

uint64_t *sub_6E94(uint64_t a1, uint64_t *a2)
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

char *sub_6ED4(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  uint64_t v4 = *a2;
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
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8);
    *(void *)&a1[v8] = v11;
    uint64_t v12 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
    uint64_t v13 = &v9[v12];
    uint64_t v14 = v10 + v12;
    uint64_t v15 = v4;
    swift_bridgeObjectRetain(v11);
    uint64_t v16 = sub_6FC0(&qword_281D0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16LL))(v13, v14, v16);
    uint64_t v17 = a3[6];
    uint64_t v18 = a3[7];
    uint64_t v19 = *(uint64_t *)((char *)a2 + v17);
    *(void *)&v7[v17] = v19;
    double v20 = *(char **)((char *)a2 + v18);
    *(void *)&v7[v18] = v20;
    swift_bridgeObjectRetain(v19);
    id v21 = v20;
  }

  return v7;
}

uint64_t sub_6FC0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void sub_7000(id *a1, int *a2)
{
  uint64_t v4 = (id *)((char *)a1 + a2[5]);
  swift_bridgeObjectRelease(*v4);
  uint64_t v5 = (char *)v4 + *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
  uint64_t v6 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  swift_bridgeObjectRelease(*(id *)((char *)a1 + a2[6]));
}

void *sub_7084(void *a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = *(void *)(a2 + v8);
  *(void *)((char *)a1 + v8) = v11;
  uint64_t v12 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
  uint64_t v13 = &v9[v12];
  uint64_t v14 = v10 + v12;
  id v15 = v7;
  swift_bridgeObjectRetain(v11);
  uint64_t v16 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16LL))(v13, v14, v16);
  uint64_t v17 = a3[6];
  uint64_t v18 = a3[7];
  uint64_t v19 = *(void *)(a2 + v17);
  *(void *)((char *)a1 + v17) = v19;
  double v20 = *(void **)(a2 + v18);
  *(void *)((char *)a1 + v18) = v20;
  swift_bridgeObjectRetain(v19);
  id v21 = v20;
  return a1;
}

uint64_t sub_7140(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = a3[5];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = *(void *)(a2 + v9);
  uint64_t v13 = *(void *)(a1 + v9);
  *(void *)(a1 + v9) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
  uint64_t v15 = v10 + v14;
  uint64_t v16 = v11 + v14;
  uint64_t v17 = sub_6FC0(&qword_281D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 24LL))(v15, v16, v17);
  uint64_t v18 = a3[6];
  uint64_t v19 = *(void *)(a2 + v18);
  uint64_t v20 = *(void *)(a1 + v18);
  *(void *)(a1 + v18) = v19;
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRelease(v20);
  uint64_t v21 = a3[7];
  uint64_t v22 = *(void **)(a2 + v21);
  uint64_t v23 = *(void **)(a1 + v21);
  *(void *)(a1 + v21) = v22;
  id v24 = v22;

  return a1;
}

_OWORD *sub_7224(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  uint64_t v9 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
  uint64_t v13 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  return a1;
}

uint64_t sub_72C4(uint64_t a1, void *a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)((char *)a2 + v7);
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
  uint64_t v12 = v8 + v11;
  uint64_t v13 = &v9[v11];
  uint64_t v14 = sub_6FC0(&qword_281D0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 40LL))(v12, v13, v14);
  uint64_t v15 = a3[6];
  uint64_t v16 = *(void *)(a1 + v15);
  *(void *)(a1 + v15) = *(void *)((char *)a2 + v15);
  swift_bridgeObjectRelease(v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = *(void **)(a1 + v17);
  *(void *)(a1 + v17) = *(void *)((char *)a2 + v17);

  return a1;
}

uint64_t sub_7390(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_739C);
}

void sub_739C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_9100();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    sub_9070(a1 + *(int *)(a3 + 20), a2, v6);
  }

  else
  {
    sub_91AC(*(void *)(a1 + *(int *)(a3 + 24)));
    sub_90CC();
  }

uint64_t _s13TimerUIPlugin19SiriTimePluginModelOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_7404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7410);
}

void sub_7410(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_9100();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    sub_907C(a1 + *(int *)(a4 + 20), a2, a2, v8);
  }

  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
    sub_90CC();
  }

uint64_t sub_7474(uint64_t a1)
{
  v4[0] = &unk_1E290;
  uint64_t result = type metadata accessor for TimerSelectorModel(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void type metadata accessor for CFLocale(uint64_t a1)
{
}

uint64_t sub_7518(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_21EA8, 1LL);
}

void sub_7528(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_9134(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(v3, v4, v5);
  sub_905C();
}

uint64_t sub_7560()
{
  return sub_77D4(sub_4DF4);
}

uint64_t sub_756C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_75B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6FC0(&qword_28280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_75F8()
{
  unint64_t result = qword_282A8;
  if (!qword_282A8)
  {
    uint64_t v1 = sub_756C(&qword_28288);
    sub_767C();
    sub_8F78(&qword_282D0, &qword_282A0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_282A8);
  }

  return result;
}

unint64_t sub_767C()
{
  unint64_t result = qword_282B0;
  if (!qword_282B0)
  {
    uint64_t v1 = sub_756C(&qword_28280);
    sub_8F78(&qword_282B8, &qword_28278);
    sub_8F78(&qword_282C0, &qword_282C8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_282B0);
  }

  return result;
}

uint64_t sub_771C()
{
  uint64_t v1 = type metadata accessor for TimerSelector(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  sub_9174();
  uint64_t v8 = (void *)(v7 + *(int *)(v1 + 20));
  swift_bridgeObjectRelease(*v8);
  uint64_t v9 = (char *)v8 + *(int *)(sub_9100() + 20);
  uint64_t v10 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  sub_91D8();
  sub_916C(*(int *)(v1 + 28));
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_77C8()
{
  return sub_77D4(sub_4F84);
}

uint64_t sub_77D4(uint64_t (*a1)(uint64_t))
{
  return a1(v1 + v2);
}

unint64_t sub_7814()
{
  unint64_t result = qword_282E0;
  if (!qword_282E0)
  {
    uint64_t v1 = sub_756C(&qword_282D8);
    uint64_t v2 = type metadata accessor for TimerItemView(255LL);
    sub_78F8(&qword_282E8, type metadata accessor for TimerItemView);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2( v4,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_282E0);
  }

  return result;
}

uint64_t type metadata accessor for TimerItemView(uint64_t a1)
{
  return sub_78C8(a1, qword_283B8, (uint64_t)&nominal type descriptor for TimerItemView);
}

uint64_t sub_78C8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

void sub_78F8(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_9194(v3), a1);
  }

  sub_905C();
}

void sub_792C()
{
  uint64_t v53 = v0;
  uint64_t v54 = v1;
  uint64_t v3 = v2;
  uint64_t v52 = sub_6FC0(&qword_28308);
  uint64_t v4 = __chkstk_darwin();
  uint64_t v49 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v4);
  char v50 = (uint64_t *)((char *)&v43 - v7);
  ((void (*)(uint64_t))__chkstk_darwin)(v6);
  uint64_t v9 = (char *)&v43 - v8;
  uint64_t v51 = v10;
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain(v3);
  uint64_t v13 = &_swiftEmptyArrayStorage;
  uint64_t v48 = v12;
  uint64_t v43 = v3;
  if (v12)
  {
    uint64_t v45 = (v11 + 32) & ~v11;
    uint64_t v14 = (char *)&_swiftEmptyArrayStorage + v45;
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = *(void *)(sub_9054() - 8);
    uint64_t v18 = v3 + ((*(unsigned __int8 *)(v17 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    uint64_t v46 = *(void *)(v17 + 72);
    uint64_t v47 = v9;
    uint64_t v44 = v11 | 7;
    uint64_t v19 = &_swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v20 = v52;
      uint64_t v21 = (uint64_t)&v49[*(int *)(v52 + 48)];
      sub_7528(v18, v21, type metadata accessor for SiriTimerSnippetModel);
      uint64_t v22 = *(int *)(v20 + 48);
      uint64_t v23 = (uint64_t)v50;
      uint64_t v24 = (uint64_t)v50 + v22;
      *char v50 = v15;
      sub_7DD8(v21, v24, type metadata accessor for SiriTimerSnippetModel);
      sub_8F20(v23, (uint64_t)v9, &qword_28308);
      if (v16)
      {
        uint64_t v13 = v19;
      }

      else
      {
        unint64_t v25 = v19[3];
        int64_t v26 = v25 & 0xFFFFFFFFFFFFFFFELL;
        if (v26 <= 1) {
          uint64_t v27 = 1LL;
        }
        else {
          uint64_t v27 = v26;
        }
        uint64_t v28 = sub_6FC0(&qword_28350);
        uint64_t v29 = *(void *)(v51 + 72);
        uint64_t v30 = v45;
        uint64_t v13 = (void *)swift_allocObject(v28, v45 + v29 * v27, v44);
        size_t v31 = j__malloc_size(v13);
        if (!v29) {
          goto LABEL_35;
        }
        int64_t v32 = v31 - v30;
        if (v31 - v30 == 0x8000000000000000LL && v29 == -1) {
          goto LABEL_36;
        }
        uint64_t v34 = v32 / v29;
        v13[2] = v27;
        v13[3] = 2 * (v32 / v29);
        unint64_t v35 = (char *)v13 + v30;
        unint64_t v36 = v19[3];
        uint64_t v37 = (v36 >> 1) * v29;
        if (v19[2])
        {
          if (v13 < v19 || v35 >= (char *)v19 + v45 + v37)
          {
            ((void (*)(char *))swift_arrayInitWithTakeFrontToBack)(v35);
          }

          else if (v13 != v19)
          {
            ((void (*)(char *))swift_arrayInitWithTakeBackToFront)(v35);
          }

          v19[2] = 0LL;
        }

        uint64_t v14 = &v35[v37];
        uint64_t v16 = (v34 & 0x7FFFFFFFFFFFFFFFLL) - (v36 >> 1);
        swift_release(v19);
      }

      BOOL v39 = __OFSUB__(v16--, 1LL);
      if (v39) {
        break;
      }
      ++v15;
      uint64_t v9 = v47;
      sub_8F20((uint64_t)v47, (uint64_t)v14, &qword_28308);
      v14 += *(void *)(v51 + 72);
      v18 += v46;
      uint64_t v19 = v13;
      if (v48 == v15) {
        goto LABEL_29;
      }
    }

    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  uint64_t v16 = 0LL;
LABEL_29:
  swift_bridgeObjectRelease(v43);
  unint64_t v40 = v13[3];
  if (v40 >= 2)
  {
    unint64_t v41 = v40 >> 1;
    BOOL v39 = __OFSUB__(v41, v16);
    unint64_t v42 = v41 - v16;
    if (v39)
    {
LABEL_37:
      __break(1u);
      return;
    }

    v13[2] = v42;
  }

uint64_t sub_7C20@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_5154(a1, v2 + v5, a2);
}

uint64_t sub_7C68()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_7C8C(char *a1)
{
  return sub_62BC(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 16));
}

uint64_t sub_7C94(id *a1)
{
  return sub_5498(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_7CB0()
{
  uint64_t v1 = *(void *)(sub_9054() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v15 = *(void *)(v1 + 64);
  uint64_t v4 = type metadata accessor for TimerSelector(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + v3 + 8));
  swift_bridgeObjectRelease(*(void *)(v0 + v3 + 24));
  swift_bridgeObjectRelease(*(void *)(v0 + v3 + 32));
  uint64_t v8 = sub_91C0();
  uint64_t v9 = v2 | v6 | 7;
  uint64_t v10 = (v3 + v15 + v6) & ~v6;
  sub_9154();
  sub_9174();
  uint64_t v11 = (void *)(v0 + v10 + *(int *)(v4 + 20));
  swift_bridgeObjectRelease(*v11);
  uint64_t v12 = (char *)v11 + *(int *)(sub_9100() + 20);
  uint64_t v13 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8LL))(v12, v13);
  sub_91D8();
  sub_916C(*(int *)(v4 + 28));
  return swift_deallocObject(v0, v10 + v7, v9);
}

void sub_7DD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_9134(a1, a2, a3);
  sub_9088(v3);
  sub_905C();
}

void *sub_7DF8()
{
  uint64_t v1 = *(void *)(sub_9054() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for TimerSelector(0LL) - 8) + 80LL);
  return sub_5C44((void *)(v0 + v2), v0 + ((v2 + v3 + v4) & ~v4));
}

void sub_7E54(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2 = a2(0LL);
  sub_90EC(v2);
  sub_905C();
}

uint64_t sub_7E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_7EB8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_7EC8(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_7ED0(uint64_t a1, unint64_t *a2, void *a3)
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

void sub_7F08(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_6FC0(a2);
  sub_90EC(v2);
  sub_905C();
}

char *sub_7F34(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16LL) & ~(unint64_t)v3];
  }

  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[2];
    uint64_t v47 = a2[1];
    *((void *)a1 + 1) = v47;
    *((void *)a1 + 2) = v8;
    uint64_t v46 = a2[3];
    char v50 = a2[4];
    *((void *)a1 + 3) = v46;
    *((void *)a1 + 4) = v50;
    uint64_t v9 = a2[6];
    *((void *)a1 + 5) = a2[5];
    *((void *)a1 + 6) = v9;
    uint64_t v10 = a3[7];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = (uint64_t)a2 + v10;
    uint64_t v13 = *(uint64_t *)((char *)a2 + v10 + 8);
    *(void *)uint64_t v11 = *(char **)((char *)a2 + v10);
    *((void *)v11 + 1) = v13;
    uint64_t v14 = *(uint64_t *)((char *)a2 + v10 + 24);
    *((void *)v11 + 2) = *(char **)((char *)a2 + v10 + 16);
    *((void *)v11 + 3) = v14;
    uint64_t v48 = *(uint64_t *)((char *)a2 + v10 + 32);
    uint64_t v49 = v9;
    *((void *)v11 + 4) = v48;
    uint64_t v15 = (int *)type metadata accessor for SiriTimerSnippetModel(0LL);
    uint64_t v16 = v15[7];
    __dst = &v11[v16];
    uint64_t v45 = (const void *)(v12 + v16);
    uint64_t v17 = type metadata accessor for URL(0LL);
    uint64_t v18 = v4;
    swift_retain(v47);
    swift_bridgeObjectRetain(v46);
    swift_retain(v50);
    swift_retain(v49);
    swift_bridgeObjectRetain(v13);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRetain(v48);
    if (_s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v45, 1LL, v17))
    {
      uint64_t v19 = sub_6FC0(&qword_28358);
      memcpy(__dst, v45, *(void *)(*(void *)(v19 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, const void *, uint64_t))(*(void *)(v17 - 8) + 16LL))(__dst, v45, v17);
      _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)__dst, 0LL, 1LL, v17);
    }

    uint64_t v20 = v15[8];
    uint64_t v21 = &v11[v20];
    uint64_t v22 = (void *)(v12 + v20);
    uint64_t v23 = v22[1];
    *(void *)uint64_t v21 = *v22;
    *((void *)v21 + 1) = v23;
    uint64_t v24 = v15[9];
    unint64_t v25 = &v11[v24];
    uint64_t v26 = v12 + v24;
    v25[8] = *(_BYTE *)(v26 + 8);
    *(void *)unint64_t v25 = *(void *)v26;
    uint64_t v27 = v15[10];
    uint64_t v28 = &v11[v27];
    uint64_t v29 = v12 + v27;
    v28[8] = *(_BYTE *)(v29 + 8);
    *(void *)uint64_t v28 = *(void *)v29;
    uint64_t v30 = v15[11];
    size_t v31 = &v11[v30];
    uint64_t v32 = v12 + v30;
    *(void *)size_t v31 = *(void *)v32;
    v31[8] = *(_BYTE *)(v32 + 8);
    uint64_t v33 = a3[8];
    uint64_t v34 = a3[9];
    unint64_t v35 = &v7[v33];
    unint64_t v36 = (char **)((char *)a2 + v33);
    uint64_t v37 = v36[1];
    *(void *)unint64_t v35 = *v36;
    *((void *)v35 + 1) = v37;
    double v38 = *(char **)((char *)a2 + v34);
    *(void *)&v7[v34] = v38;
    uint64_t v39 = a3[10];
    uint64_t v40 = a3[11];
    unint64_t v41 = *(char **)((char *)a2 + v39);
    *(void *)&v7[v39] = v41;
    uint64_t v4 = *(char **)((char *)a2 + v40);
    *(void *)&v7[v40] = v4;
    swift_bridgeObjectRetain(v23);
    swift_bridgeObjectRetain(v37);
    id v42 = v38;
    id v43 = v41;
  }

  swift_retain(v4);
  return v7;
}

uint64_t sub_8180(uint64_t a1, int *a2)
{
  swift_release(*(void *)(a1 + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + 24));
  swift_release(*(void *)(a1 + 32));
  swift_release(*(void *)(a1 + 48));
  uint64_t v4 = (void *)(a1 + a2[7]);
  swift_bridgeObjectRelease(v4[1]);
  swift_bridgeObjectRelease(v4[3]);
  swift_bridgeObjectRelease(v4[4]);
  uint64_t v5 = type metadata accessor for SiriTimerSnippetModel(0LL);
  uint64_t v6 = (uint64_t)v4 + *(int *)(v5 + 28);
  uint64_t v7 = type metadata accessor for URL(0LL);
  swift_bridgeObjectRelease(*(void *)((char *)v4 + *(int *)(v5 + 32) + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[8] + 8));

  return swift_release(*(void *)(a1 + a2[11]));
}

void *sub_8280(void *a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v46 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v46;
  uint64_t v6 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  a1[4] = v8;
  a1[5] = v7;
  uint64_t v49 = *(void *)(a2 + 48);
  a1[6] = v49;
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = a2 + v9;
  uint64_t v12 = *(void *)(a2 + v9 + 8);
  *uint64_t v10 = *(void *)(a2 + v9);
  v10[1] = v12;
  uint64_t v13 = *(void *)(a2 + v9 + 24);
  v10[2] = *(void *)(a2 + v9 + 16);
  v10[3] = v13;
  uint64_t v47 = v8;
  uint64_t v48 = *(void *)(a2 + v9 + 32);
  v10[4] = v48;
  uint64_t v14 = (int *)type metadata accessor for SiriTimerSnippetModel(0LL);
  uint64_t v15 = v14[7];
  __dst = (char *)v10 + v15;
  uint64_t v45 = (const void *)(v11 + v15);
  uint64_t v16 = type metadata accessor for URL(0LL);
  id v17 = v5;
  swift_retain(v46);
  swift_bridgeObjectRetain(v6);
  swift_retain(v47);
  swift_retain(v49);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v48);
  if (_s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v45, 1LL, v16))
  {
    uint64_t v18 = sub_6FC0(&qword_28358);
    memcpy(__dst, v45, *(void *)(*(void *)(v18 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, const void *, uint64_t))(*(void *)(v16 - 8) + 16LL))(__dst, v45, v16);
    _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)__dst, 0LL, 1LL, v16);
  }

  uint64_t v19 = v14[8];
  uint64_t v20 = (void *)((char *)v10 + v19);
  uint64_t v21 = (void *)(v11 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = v14[9];
  uint64_t v24 = (char *)v10 + v23;
  uint64_t v25 = v11 + v23;
  v24[8] = *(_BYTE *)(v25 + 8);
  *(void *)uint64_t v24 = *(void *)v25;
  uint64_t v26 = v14[10];
  uint64_t v27 = (char *)v10 + v26;
  uint64_t v28 = v11 + v26;
  v27[8] = *(_BYTE *)(v28 + 8);
  *(void *)uint64_t v27 = *(void *)v28;
  uint64_t v29 = v14[11];
  uint64_t v30 = (char *)v10 + v29;
  uint64_t v31 = v11 + v29;
  *(void *)uint64_t v30 = *(void *)v31;
  v30[8] = *(_BYTE *)(v31 + 8);
  uint64_t v32 = a3[8];
  uint64_t v33 = a3[9];
  uint64_t v34 = (void *)((char *)a1 + v32);
  unint64_t v35 = (void *)(a2 + v32);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  uint64_t v37 = *(void **)(a2 + v33);
  *(void *)((char *)a1 + v33) = v37;
  uint64_t v38 = a3[10];
  uint64_t v39 = a3[11];
  uint64_t v40 = *(void **)(a2 + v38);
  *(void *)((char *)a1 + v38) = v40;
  uint64_t v41 = *(void *)(a2 + v39);
  *(void *)((char *)a1 + v39) = v41;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRetain(v36);
  id v42 = v37;
  id v43 = v40;
  swift_retain(v41);
  return a1;
}

uint64_t sub_84AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v10;
  swift_retain(v10);
  swift_release(v9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v11 = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v14;
  swift_retain(v14);
  swift_release(v13);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a2 + 48);
  *(void *)(a1 + 48) = v16;
  swift_retain(v16);
  swift_release(v15);
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *(void *)(a2 + v17);
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  uint64_t v21 = *(void *)(a1 + v17 + 8);
  v18[1] = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  v18[2] = v19[2];
  uint64_t v22 = v19[3];
  uint64_t v23 = v18[3];
  v18[3] = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  uint64_t v24 = v18[4];
  uint64_t v25 = v19[4];
  v18[4] = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease(v24);
  uint64_t v26 = (int *)type metadata accessor for SiriTimerSnippetModel(0LL);
  uint64_t v27 = v26[7];
  uint64_t v28 = (char *)v18 + v27;
  uint64_t v29 = (char *)v19 + v27;
  uint64_t v30 = type metadata accessor for URL(0LL);
  int v31 = _s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v28, 1LL, v30);
  int v32 = _s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v29, 1LL, v30);
  if (!v31)
  {
    uint64_t v33 = *(void *)(v30 - 8);
    if (!v32)
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 24))(v28, v29, v30);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v30);
    goto LABEL_6;
  }

  if (v32)
  {
LABEL_6:
    uint64_t v34 = sub_6FC0(&qword_28358);
    memcpy(v28, v29, *(void *)(*(void *)(v34 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16LL))(v28, v29, v30);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v28, 0LL, 1LL, v30);
LABEL_7:
  uint64_t v35 = v26[8];
  uint64_t v36 = (void *)((char *)v18 + v35);
  uint64_t v37 = (void *)((char *)v19 + v35);
  *uint64_t v36 = *v37;
  uint64_t v38 = v37[1];
  uint64_t v39 = v36[1];
  v36[1] = v38;
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRelease(v39);
  uint64_t v40 = v26[9];
  uint64_t v41 = (char *)v18 + v40;
  id v42 = (char *)v19 + v40;
  uint64_t v43 = *(void *)v42;
  v41[8] = v42[8];
  *(void *)uint64_t v41 = v43;
  uint64_t v44 = v26[10];
  uint64_t v45 = (char *)v18 + v44;
  uint64_t v46 = (char *)v19 + v44;
  uint64_t v47 = *(void *)v46;
  v45[8] = v46[8];
  *(void *)uint64_t v45 = v47;
  uint64_t v48 = v26[11];
  uint64_t v49 = (char *)v18 + v48;
  char v50 = (char *)v19 + v48;
  uint64_t v51 = *(void *)v50;
  v49[8] = v50[8];
  *(void *)uint64_t v49 = v51;
  uint64_t v52 = a3[8];
  uint64_t v53 = (void *)(a1 + v52);
  uint64_t v54 = (void *)(a2 + v52);
  *uint64_t v53 = *v54;
  uint64_t v55 = v54[1];
  uint64_t v56 = v53[1];
  v53[1] = v55;
  swift_bridgeObjectRetain(v55);
  swift_bridgeObjectRelease(v56);
  uint64_t v57 = a3[9];
  uint64_t v58 = *(void **)(a2 + v57);
  uint64_t v59 = *(void **)(a1 + v57);
  *(void *)(a1 + v57) = v58;
  id v60 = v58;

  uint64_t v61 = a3[10];
  uint64_t v62 = *(void **)(a2 + v61);
  uint64_t v63 = *(void **)(a1 + v61);
  *(void *)(a1 + v61) = v62;
  id v64 = v62;

  uint64_t v65 = a3[11];
  uint64_t v66 = *(void *)(a2 + v65);
  uint64_t v67 = *(void *)(a1 + v65);
  *(void *)(a1 + v65) = v66;
  swift_retain(v66);
  swift_release(v67);
  return a1;
}

uint64_t sub_87A4(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __int128 v10 = *(_OWORD *)(a2 + v7 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(a2 + v7 + 32);
  uint64_t v11 = (int *)type metadata accessor for SiriTimerSnippetModel(0LL);
  uint64_t v12 = v11[7];
  uint64_t v13 = (void *)(v8 + v12);
  uint64_t v14 = (const void *)(v9 + v12);
  uint64_t v15 = type metadata accessor for URL(0LL);
  if (_s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v14, 1LL, v15))
  {
    uint64_t v16 = sub_6FC0(&qword_28358);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32LL))(v13, v14, v15);
    _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v13, 0LL, 1LL, v15);
  }

  *(_OWORD *)(v8 + v11[8]) = *(_OWORD *)(v9 + v11[8]);
  uint64_t v17 = v11[9];
  uint64_t v18 = v8 + v17;
  uint64_t v19 = v9 + v17;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(void *)uint64_t v18 = *(void *)v19;
  uint64_t v20 = v11[10];
  uint64_t v21 = v8 + v20;
  uint64_t v22 = v9 + v20;
  *(void *)uint64_t v21 = *(void *)v22;
  *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
  uint64_t v23 = v11[11];
  uint64_t v24 = v8 + v23;
  uint64_t v25 = v9 + v23;
  *(void *)uint64_t v24 = *(void *)v25;
  *(_BYTE *)(v24 + 8) = *(_BYTE *)(v25 + 8);
  uint64_t v26 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v27 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  return a1;
}

uint64_t sub_8930(uint64_t a1, void *a2, int *a3)
{
  __int128 v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];
  swift_release(v7);
  uint64_t v8 = a2[3];
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = a2[4];
  swift_release(v10);
  *(void *)(a1 + 40) = a2[5];
  uint64_t v11 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = a2[6];
  swift_release(v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = *(void *)((char *)a2 + v12 + 8);
  uint64_t v16 = *(void *)(a1 + v12 + 8);
  *uint64_t v13 = *(void *)((char *)a2 + v12);
  v13[1] = v15;
  swift_bridgeObjectRelease(v16);
  uint64_t v17 = v14[3];
  uint64_t v18 = v13[3];
  v13[2] = v14[2];
  v13[3] = v17;
  swift_bridgeObjectRelease(v18);
  uint64_t v19 = v13[4];
  v13[4] = v14[4];
  swift_bridgeObjectRelease(v19);
  uint64_t v20 = (int *)type metadata accessor for SiriTimerSnippetModel(0LL);
  uint64_t v21 = v20[7];
  uint64_t v22 = (char *)v13 + v21;
  uint64_t v23 = (char *)v14 + v21;
  uint64_t v24 = type metadata accessor for URL(0LL);
  int v25 = _s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v22, 1LL, v24);
  int v26 = _s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v23, 1LL, v24);
  if (!v25)
  {
    uint64_t v27 = *(void *)(v24 - 8);
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v22, v23, v24);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v24);
    goto LABEL_6;
  }

  if (v26)
  {
LABEL_6:
    uint64_t v28 = sub_6FC0(&qword_28358);
    memcpy(v22, v23, *(void *)(*(void *)(v28 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32LL))(v22, v23, v24);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v22, 0LL, 1LL, v24);
LABEL_7:
  uint64_t v29 = v20[8];
  uint64_t v30 = (void *)((char *)v13 + v29);
  int v31 = (void *)((char *)v14 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  uint64_t v34 = v30[1];
  *uint64_t v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease(v34);
  uint64_t v35 = v20[9];
  uint64_t v36 = (char *)v13 + v35;
  uint64_t v37 = (char *)v14 + v35;
  *(void *)uint64_t v36 = *(void *)v37;
  v36[8] = v37[8];
  uint64_t v38 = v20[10];
  uint64_t v39 = (char *)v13 + v38;
  uint64_t v40 = (char *)v14 + v38;
  v39[8] = v40[8];
  *(void *)uint64_t v39 = *(void *)v40;
  uint64_t v41 = v20[11];
  id v42 = (char *)v13 + v41;
  uint64_t v43 = (char *)v14 + v41;
  *(void *)id v42 = *(void *)v43;
  v42[8] = v43[8];
  uint64_t v44 = a3[8];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (void *)((char *)a2 + v44);
  uint64_t v48 = *v46;
  uint64_t v47 = v46[1];
  uint64_t v49 = v45[1];
  *uint64_t v45 = v48;
  v45[1] = v47;
  swift_bridgeObjectRelease(v49);
  uint64_t v50 = a3[9];
  uint64_t v51 = *(void **)(a1 + v50);
  *(void *)(a1 + v50) = *(void *)((char *)a2 + v50);

  uint64_t v52 = a3[10];
  uint64_t v53 = *(void **)(a1 + v52);
  *(void *)(a1 + v52) = *(void *)((char *)a2 + v52);

  uint64_t v54 = a3[11];
  uint64_t v55 = *(void *)(a1 + v54);
  *(void *)(a1 + v54) = *(void *)((char *)a2 + v54);
  swift_release(v55);
  return a1;
}

uint64_t sub_8BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8BB0);
}

void sub_8BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_9054();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    sub_9070(a1 + *(int *)(a3 + 28), a2, v6);
  }

  else
  {
    sub_91AC(*(void *)(a1 + *(int *)(a3 + 32) + 8));
    sub_90CC();
  }

uint64_t sub_8C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8C1C);
}

void sub_8C1C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_9054();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    sub_907C(a1 + *(int *)(a4 + 28), a2, a2, v8);
  }

  else
  {
    *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
    sub_90CC();
  }

uint64_t sub_8C84(uint64_t a1)
{
  v4[0] = &unk_1E290;
  v4[1] = &unk_1E380;
  void v4[2] = &unk_1E290;
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(319LL);
  if (v3 <= 0x3F)
  {
    v4[3] = *(void *)(result - 8) + 64LL;
    void v4[4] = &unk_1E398;
    v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[7] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_initStructMetadata(a1, 256LL, 8LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_8D2C()
{
  v1[0] = sub_756C(&qword_28288);
  v1[1] = sub_75F8();
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.lastComponentBottomSpacing(_:)>>,  1LL);
}

uint64_t sub_8D78(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_21ED0, 1LL);
}

unint64_t sub_8D88()
{
  unint64_t result = qword_28418;
  if (!qword_28418)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_28418);
  }

  return result;
}

uint64_t sub_8DC4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_release(a1);
  }
  else {
    return swift_bridgeObjectRelease(a2);
  }
}

uint64_t sub_8DD4()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_8E04()
{
  uint64_t v1 = (int *)sub_9164();
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v0 + v4;
  sub_9174();
  swift_release(*(void *)(v0 + v4 + 8));
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 24));
  swift_release(*(void *)(v0 + v4 + 32));
  swift_release(*(void *)(v0 + v4 + 48));
  uint64_t v7 = (void *)(v0 + v4 + v1[7]);
  swift_bridgeObjectRelease(v7[1]);
  swift_bridgeObjectRelease(v7[3]);
  swift_bridgeObjectRelease(v7[4]);
  sub_9054();
  uint64_t v8 = sub_91C0();
  sub_9154();
  swift_bridgeObjectRelease(*(void *)(v6 + v1[8] + 8));
  sub_916C(v1[9]);
  sub_916C(v1[10]);
  swift_release(*(void *)(v6 + v1[11]));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

void sub_8EFC()
{
}

void sub_8F20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_6FC0(a3);
  sub_9088(v3);
  sub_905C();
}

void sub_8F4C()
{
}

void sub_8F78(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_756C(a2);
    atomic_store(sub_9194(v3), a1);
  }

  sub_905C();
}

void type metadata accessor for MTTimerState(uint64_t a1)
{
}

void sub_8FC0(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t sub_9054()
{
  return type metadata accessor for SiriTimerSnippetModel(0LL);
}

  ;
}

uint64_t _s13TimerUIPlugin07ComposeA5ModelV8durationSSSgvpfi_0()
{
  return 0LL;
}

uint64_t sub_9070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s13TimerUIPlugin19SiriTimePluginModelOwet_0(a1, a2, a3);
}

uint64_t sub_907C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s13TimerUIPlugin19SiriTimePluginModelOwst_0(a1, a2, a3, a4);
}

uint64_t sub_9088(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 32LL))(v1, v2, a1);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_90D8(uint64_t a1)
{
  return _s13TimerUIPlugin19SiriTimePluginModelOwet_0(v1, 1LL, a1);
}

uint64_t sub_90EC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_9100()
{
  return type metadata accessor for TimerSelectorModel(0LL);
}

uint64_t _s13TimerUIPlugin04SiriA12SnippetModelV8durationSdSgvpfi_0()
{
  return 0LL;
}

uint64_t sub_9114()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))(v0, v1);
}

uint64_t sub_9128(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_9134(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(0LL);
}

uint64_t sub_9144(uint64_t a1)
{
  return State.init(wrappedValue:)(v1 - 144, a1);
}

uint64_t sub_9154()
{
  return swift_bridgeObjectRelease(*(void *)(v1 + *(int *)(v0 + 32) + 8));
}

uint64_t sub_9164()
{
  return type metadata accessor for TimerItemView(0LL);
}

void sub_916C(uint64_t a1@<X8>)
{
}

void sub_9174()
{
}

  ;
}

  ;
}

uint64_t sub_9194(uint64_t a1)
{
  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_91A0(uint64_t a1)
{
  return swift_allocObject(a1, 48LL, 7LL);
}

uint64_t sub_91AC@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t sub_91C0()
{
  return type metadata accessor for URL(0LL);
}

uint64_t sub_91C8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_91D0(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_91D8()
{
  return swift_bridgeObjectRelease(*(void *)(v1 + *(int *)(v0 + 24)));
}

uint64_t TimerSelectorModel.header.getter()
{
  uint64_t v0 = sub_6FC0(&qword_281D0);
  Loggable.wrappedValue.getter(&v2, v0);
  return v2;
}

uint64_t type metadata accessor for TimerSelectorModel(uint64_t a1)
{
  return sub_78C8(a1, (uint64_t *)&unk_28798, (uint64_t)&nominal type descriptor for TimerSelectorModel);
}

void sub_9234()
{
  *(_WORD *)&algn_2B458[6] = -4864;
}

uint64_t *SiriTimePluginModel.bundleName.unsafeMutableAddressor()
{
  if (qword_28180 != -1) {
    swift_once(&qword_28180, sub_9234);
  }
  return &static SiriTimePluginModel.bundleName;
}

void static SiriTimePluginModel.bundleName.getter()
{
  if (qword_28180 != -1) {
    swift_once(&qword_28180, sub_9234);
  }
  sub_10E38();
  sub_10E9C();
  sub_905C();
}

uint64_t SiriTimePluginModel.snippetHidden(for:idiom:)(uint64_t a1, char a2)
{
  uint64_t v5 = type metadata accessor for DeviceIdiom(0LL);
  __chkstk_darwin(v5);
  sub_9020();
  uint64_t v6 = type metadata accessor for SiriTimePluginModel(0LL);
  sub_10CF0();
  __chkstk_darwin(v7);
  sub_10DB0();
  sub_E400(v2, v3, v8);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v3, v6);
  if (EnumCaseMultiPayload > 1)
  {
    sub_7E54(v3, type metadata accessor for SiriTimePluginModel);
    sub_111D8(v10, enum case for DeviceIdiom.car(_:));
    sub_11314();
    sub_11028();
  }

  else
  {
    sub_111D8(EnumCaseMultiPayload, enum case for DeviceIdiom.car(_:));
    sub_11314();
    sub_11028();
    sub_7E54(v3, type metadata accessor for SiriTimePluginModel);
  }

  return a2 & 1;
}

uint64_t type metadata accessor for SiriTimePluginModel(uint64_t a1)
{
  return sub_78C8(a1, qword_28658, (uint64_t)&nominal type descriptor for SiriTimePluginModel);
}

uint64_t sub_941C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C754D72656D6974LL && a2 == 0xEA00000000006974LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6C754D72656D6974LL, 0xEA00000000006974LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x6C655372656D6974LL && a2 == 0xED0000726F746365LL;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6C655372656D6974LL, 0xED0000726F746365LL) & 1) != 0)
    {
      swift_bridgeObjectRelease(a2);
      return 1LL;
    }

    else if (a1 == 0x5465736F706D6F63LL && a2 == 0xEC00000072656D69LL)
    {
      swift_bridgeObjectRelease(a2);
      return 2LL;
    }

    else
    {
      char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x5465736F706D6F63LL, 0xEC00000072656D69LL);
      swift_bridgeObjectRelease(a2);
      if ((v8 & 1) != 0) {
        return 2LL;
      }
      else {
        return 3LL;
      }
    }
  }

uint64_t sub_9588()
{
  return 3LL;
}

uint64_t sub_9590(char a1)
{
  return *(void *)&aTimermultimers[8 * a1];
}

uint64_t sub_95B4()
{
  return sub_9590(*v0);
}

uint64_t sub_95BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_941C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_95E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_9588();
  *a1 = result;
  return result;
}

uint64_t sub_9604(uint64_t a1)
{
  unint64_t v2 = sub_9BA0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_962C(uint64_t a1)
{
  unint64_t v2 = sub_9BA0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_9654()
{
  return 12383LL;
}

uint64_t sub_9660(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000LL)
  {
    swift_bridgeObjectRelease(a2);
    char v5 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(12383LL, 0xE200000000000000LL);
    swift_bridgeObjectRelease(a2);
    char v5 = v4 ^ 1;
  }

  return v5 & 1;
}

void sub_96D0(uint64_t a1)
{
}

uint64_t sub_96F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_9660(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_9718(uint64_t a1)
{
  unint64_t v2 = sub_9BDC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_9740(uint64_t a1)
{
  unint64_t v2 = sub_9BDC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_9768(uint64_t a1)
{
  unint64_t v2 = sub_9C90();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_9790(uint64_t a1)
{
  unint64_t v2 = sub_9C90();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_97B8(uint64_t a1)
{
  unint64_t v2 = sub_9C54();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_97E0(uint64_t a1)
{
  unint64_t v2 = sub_9C54();
  return CodingKey.debugDescription.getter(a1, v2);
}

void SiriTimePluginModel.encode(to:)()
{
  uint64_t v55 = v0;
  char v4 = v3;
  uint64_t v53 = sub_6FC0(&qword_28440);
  uint64_t v42 = *(void *)(v53 - 8);
  sub_10CF0();
  __chkstk_darwin(v5);
  sub_1108C(v6, v39);
  uint64_t v7 = sub_6FC0(&qword_28448);
  uint64_t v48 = *(void *)(v7 - 8);
  uint64_t v50 = v7;
  sub_10CF0();
  __chkstk_darwin(v8);
  sub_110A8(v9, v40);
  uint64_t v45 = sub_9100();
  sub_10CF0();
  __chkstk_darwin(v10);
  sub_110C4(v11, v41);
  uint64_t v12 = sub_6FC0(&qword_28450);
  uint64_t v43 = *(void *)(v12 - 8);
  uint64_t v44 = v12;
  sub_10CF0();
  __chkstk_darwin(v13);
  uint64_t v14 = sub_11070();
  uint64_t v15 = type metadata accessor for SiriTimePluginModel(v14);
  sub_10CF0();
  __chkstk_darwin(v16);
  sub_11240();
  uint64_t v17 = sub_6FC0(&qword_28458);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  sub_10F18();
  uint64_t v19 = v4[3];
  uint64_t v20 = v4[4];
  sub_9B7C(v4, v19);
  unint64_t v21 = sub_9BA0();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for SiriTimePluginModel.CodingKeys,  &type metadata for SiriTimePluginModel.CodingKeys,  v21,  v19,  v20);
  sub_E400(v55, (uint64_t)v2, type metadata accessor for SiriTimePluginModel);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v2, v15);
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_E1C8((uint64_t)v2, v46, type metadata accessor for TimerSelectorModel);
      LOBYTE(v54[0]) = 1;
      sub_9C54();
      sub_110FC((uint64_t)&type metadata for SiriTimePluginModel.TimerSelectorCodingKeys, (uint64_t)v54, v17);
      sub_E1FC((uint64_t)&unk_28480);
      sub_1134C(v46, v24, v50, v45, v23);
      sub_10F74(v48);
      sub_7E54(v46, type metadata accessor for TimerSelectorModel);
      uint64_t v25 = sub_11334();
      v26(v25, v17);
    }

    else
    {
      uint64_t v30 = v2[1];
      uint64_t v31 = v2[3];
      uint64_t v49 = v2[2];
      uint64_t v51 = *v2;
      uint64_t v32 = v2[5];
      uint64_t v47 = v2[4];
      uint64_t v34 = v2[6];
      uint64_t v33 = v2[7];
      LOBYTE(v54[0]) = 2;
      sub_9BDC();
      sub_110FC((uint64_t)&type metadata for SiriTimePluginModel.ComposeTimerCodingKeys, (uint64_t)v54, v17);
      v54[0] = v51;
      v54[1] = v30;
      v54[2] = v49;
      v54[3] = v31;
      v54[4] = v47;
      v54[5] = v32;
      v54[6] = v34;
      v54[7] = v33;
      unint64_t v35 = sub_9C18();
      KeyedEncodingContainer.encode<A>(_:forKey:)(v54, v36, v53, &type metadata for ComposeTimerModel, v35);
      sub_10E94(v52, *(uint64_t (**)(uint64_t, uint64_t))(v42 + 8));
      uint64_t v37 = sub_11334();
      v38(v37, v17);
      swift_bridgeObjectRelease(v31);
      swift_bridgeObjectRelease(v30);
      swift_bridgeObjectRelease(v32);
      sub_10FB0();
    }
  }

  else
  {
    uint64_t v27 = *v2;
    LOBYTE(v54[0]) = 0;
    sub_9C90();
    sub_110FC((uint64_t)&type metadata for SiriTimePluginModel.TimerMultiCodingKeys, (uint64_t)v54, v17);
    v54[0] = v27;
    unint64_t v28 = sub_9CCC();
    sub_1134C((uint64_t)v54, v29, v44, (uint64_t)&type metadata for TimerSnippetModel, v28);
    sub_10F74(v43);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v1, v17);
    swift_bridgeObjectRelease(v27);
  }

  sub_10CC0();
}

void *sub_9B7C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_9BA0()
{
  unint64_t result = qword_28460;
  if (!qword_28460)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F128, &type metadata for SiriTimePluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28460);
  }

  return result;
}

unint64_t sub_9BDC()
{
  unint64_t result = qword_28468;
  if (!qword_28468)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F0D8, &type metadata for SiriTimePluginModel.ComposeTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_28468);
  }

  return result;
}

unint64_t sub_9C18()
{
  unint64_t result = qword_28470;
  if (!qword_28470)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ComposeTimerModel,  &type metadata for ComposeTimerModel);
    atomic_store(result, (unint64_t *)&qword_28470);
  }

  return result;
}

unint64_t sub_9C54()
{
  unint64_t result = qword_28478;
  if (!qword_28478)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F088, &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_28478);
  }

  return result;
}

unint64_t sub_9C90()
{
  unint64_t result = qword_28488;
  if (!qword_28488)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F038, &type metadata for SiriTimePluginModel.TimerMultiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_28488);
  }

  return result;
}

unint64_t sub_9CCC()
{
  unint64_t result = qword_28490;
  if (!qword_28490)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TimerSnippetModel,  &type metadata for TimerSnippetModel);
    atomic_store(result, (unint64_t *)&qword_28490);
  }

  return result;
}

void SiriTimePluginModel.init(from:)()
{
  BOOL v3 = v2;
  uint64_t v75 = v4;
  uint64_t v74 = sub_6FC0(&qword_28498);
  uint64_t v71 = *(void *)(v74 - 8);
  sub_10CF0();
  __chkstk_darwin(v5);
  sub_110E0(v6, v63);
  uint64_t v73 = sub_6FC0(&qword_284A0);
  uint64_t v70 = *(void *)(v73 - 8);
  sub_10CF0();
  __chkstk_darwin(v7);
  sub_110A8(v8, v63);
  uint64_t v72 = sub_6FC0(&qword_284A8);
  uint64_t v69 = *(void *)(v72 - 8);
  sub_10CF0();
  __chkstk_darwin(v9);
  sub_110C4(v10, v63);
  uint64_t v11 = sub_6FC0(&qword_284B0);
  uint64_t v79 = *(void *)(v11 - 8);
  uint64_t v80 = v11;
  sub_10CF0();
  __chkstk_darwin(v12);
  sub_10DB0();
  uint64_t v13 = type metadata accessor for SiriTimePluginModel(0LL);
  sub_10CF0();
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v63 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v63 - v22;
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v63 - v24;
  uint64_t v27 = v3[3];
  uint64_t v26 = v3[4];
  v81 = v3;
  sub_9B7C(v3, v27);
  unint64_t v28 = sub_9BA0();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for SiriTimePluginModel.CodingKeys,  &type metadata for SiriTimePluginModel.CodingKeys,  v28,  v27,  v26);
  if (v0)
  {
    uint64_t v29 = v81;
    goto LABEL_12;
  }

  uint64_t v65 = v23;
  uint64_t v67 = v20;
  uint64_t v66 = v17;
  unint64_t v68 = v25;
  uint64_t v87 = v13;
  uint64_t v30 = v80;
  uint64_t v31 = v1;
  uint64_t v32 = KeyedDecodingContainer.allKeys.getter(v80);
  uint64_t v33 = v32;
  uint64_t v34 = *(void *)(v32 + 16);
  if (v34)
  {
    uint64_t v35 = v30;
    uint64_t v64 = 0LL;
    int v36 = *(unsigned __int8 *)(v32 + 32);
    uint64_t v37 = sub_E114(1LL, v34, v32, v32 + 32, 0LL, (2 * v34) | 1);
    uint64_t v39 = v38;
    unint64_t v41 = v40;
    swift_bridgeObjectRelease(v33);
    if (v39 == v41 >> 1)
    {
      if (v36)
      {
        if (v36 == 1)
        {
          LOBYTE(v82) = 1;
          sub_9C54();
          uint64_t v42 = v77;
          sub_10EF8((uint64_t)&type metadata for SiriTimePluginModel.TimerSelectorCodingKeys, (uint64_t)&v82);
          sub_9100();
          sub_E1FC((uint64_t)&unk_284C8);
          uint64_t v43 = (uint64_t)v67;
          sub_1103C();
          uint64_t v44 = v79;
          sub_10E94(v42, *(uint64_t (**)(uint64_t, uint64_t))(v70 + 8));
          sub_10EC0();
          sub_10EC8(v35, *(uint64_t (**)(uint64_t, uint64_t))(v44 + 8));
          swift_storeEnumTagMultiPayload(v43, v87, 1LL);
          sub_11264(v43, v54, type metadata accessor for SiriTimePluginModel);
          uint64_t v29 = v81;
LABEL_18:
          sub_E1C8(v44, v75, type metadata accessor for SiriTimePluginModel);
          goto LABEL_12;
        }

        LOBYTE(v82) = 2;
        sub_9BDC();
        uint64_t v52 = v64;
        KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for SiriTimePluginModel.ComposeTimerCodingKeys,  &v82,  v35,  &type metadata for SiriTimePluginModel.ComposeTimerCodingKeys);
        uint64_t v29 = v81;
        if (v52)
        {
          sub_10EC0();
          (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v1, v35);
          goto LABEL_12;
        }

        sub_E18C();
        sub_1103C();
        uint64_t v53 = v79;
        sub_1113C();
        sub_10EC0();
        sub_11058(*(uint64_t (**)(uint64_t, uint64_t))(v53 + 8));
        uint64_t v60 = v83;
        uint64_t v61 = v84;
        uint64_t v44 = (uint64_t)v66;
        *uint64_t v66 = v82;
        *(void *)(v44 + 16) = v60;
        *(void *)(v44 + 24) = v61;
        __int128 v62 = v86;
        *(_OWORD *)(v44 + 32) = v85;
        *(_OWORD *)(v44 + 48) = v62;
        swift_storeEnumTagMultiPayload(v44, v87, 2LL);
        uint64_t v59 = v44;
      }

      else
      {
        LOBYTE(v82) = 0;
        sub_9C90();
        uint64_t v51 = v76;
        sub_10EF8((uint64_t)&type metadata for SiriTimePluginModel.TimerMultiCodingKeys, (uint64_t)&v82);
        uint64_t v44 = v13;
        sub_E234();
        sub_1103C();
        uint64_t v29 = v81;
        sub_10E94(v51, *(uint64_t (**)(uint64_t, uint64_t))(v69 + 8));
        sub_10EC0();
        uint64_t v55 = sub_11334();
        sub_10EC8(v55, v56);
        uint64_t v57 = v65;
        void *v65 = v82;
        swift_storeEnumTagMultiPayload(v57, v87, 0LL);
        uint64_t v59 = (uint64_t)v57;
      }

      sub_11264(v59, v58, type metadata accessor for SiriTimePluginModel);
      goto LABEL_18;
    }

    uint64_t v78 = v37;
    uint64_t v29 = v81;
    uint64_t v30 = v35;
  }

  else
  {
    uint64_t v78 = v32;
    uint64_t v29 = v81;
  }

  uint64_t v45 = v79;
  uint64_t v46 = type metadata accessor for DecodingError(0LL);
  swift_allocError(v46, &protocol witness table for DecodingError, 0LL, 0LL);
  uint64_t v48 = v47;
  sub_6FC0(&qword_284B8);
  *uint64_t v48 = v87;
  uint64_t v49 = KeyedDecodingContainer.codingPath.getter(v30);
  DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v49,  0xD00000000000002BLL,  0x800000000001F8C0LL,  0LL);
  uint64_t v50 = (*(uint64_t (**)(uint64_t *, void, uint64_t))(*(void *)(v46 - 8) + 104LL))( v48,  enum case for DecodingError.typeMismatch(_:),  v46);
  swift_willThrow(v50);
  swift_unknownObjectRelease(v78);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v31, v30);
LABEL_12:
  sub_10BE8(v29);
  sub_10CC0();
}

uint64_t sub_A31C()
{
  uint64_t v0 = static SiriTimePluginModel.bundleName;
  swift_bridgeObjectRetain(*(void *)algn_2B458);
  return v0;
}

void sub_A358()
{
}

void sub_A36C()
{
}

void TimerSelectorModel.timers.setter()
{
  *uint64_t v1 = v0;
  sub_905C();
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *TimerSelectorModel.timers.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

void *TimerSnippetModel.init(from:)(void *a1)
{
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = sub_9B7C(a1, v6);
  unint64_t v9 = sub_E270();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for TimerSnippetModel.CodingKeys,  &type metadata for TimerSnippetModel.CodingKeys,  v9,  v6,  v7);
  if (v1)
  {
    sub_11108();
  }

  else
  {
    uint64_t v10 = sub_6FC0(&qword_284E8);
    sub_E2C0((uint64_t)&unk_284F0);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v12, v10);
    sub_10E94(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    uint64_t v8 = v12;
    sub_11108();
  }

  return v8;
}

void TimerSnippetModel.encode(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_6FC0(&qword_28500);
  sub_10F30();
  __chkstk_darwin(v6);
  sub_10F18();
  sub_10FE4();
  unint64_t v7 = sub_E270();
  sub_10F90((uint64_t)&type metadata for TimerSnippetModel.CodingKeys, v8, v7);
  uint64_t v12 = a2;
  uint64_t v9 = sub_6FC0(&qword_284E8);
  unint64_t v10 = sub_E2C0((uint64_t)&unk_28508);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v12, v11, v5, v9, v10);
  sub_10E94(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_10E80();
}

uint64_t sub_A5B4()
{
  return 1LL;
}

void sub_A5BC()
{
}

uint64_t sub_A5E0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7372656D6974LL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(a2);
    char v5 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x7372656D6974LL, 0xE600000000000000LL);
    swift_bridgeObjectRelease(a2);
    char v5 = v4 ^ 1;
  }

  return v5 & 1;
}

void sub_A65C(uint64_t a1)
{
}

uint64_t sub_A680()
{
  return 0x7372656D6974LL;
}

void sub_A694(uint64_t a1)
{
}

uint64_t sub_A6C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_A5E0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_A6E8()
{
  return _s13TimerUIPlugin04SiriA12SnippetModelV8durationSdSgvpfi_0();
}

uint64_t sub_A700@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_A5B4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_A728(uint64_t a1)
{
  unint64_t v2 = sub_E270();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_A750(uint64_t a1)
{
  unint64_t v2 = sub_E270();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_A778@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = TimerSnippetModel.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_A7A0(uint64_t a1)
{
}

void ComposeTimerModel.header.getter()
{
}

void ComposeTimerModel.header.setter()
{
  *uint64_t v1 = v2;
  v1[1] = v0;
  sub_90CC();
}

void ComposeTimerModel.prompt.getter()
{
}

void ComposeTimerModel.prompt.setter()
{
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  sub_90CC();
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *ComposeTimerModel.prompt.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.directInvocationPayload.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 32));
}

void SiriTimerSnippetModel.directInvocationPayload.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  sub_905C();
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *ComposeTimerModel.label.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

void SiriTimerSnippetModel.punchoutURL.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SiriTimerSnippetModel(0LL);
  sub_10B94(v1 + *(int *)(v3 + 28), a1, &qword_28358);
  sub_905C();
}

uint64_t SiriTimerSnippetModel.punchoutURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 28);
  return sub_E340(a1, v3);
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.punchoutURL.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

void SiriTimerSnippetModel.label.getter()
{
}

void SiriTimerSnippetModel.label.setter(uint64_t a1, uint64_t a2)
{
  char v5 = (void *)(v2 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 32));
  swift_bridgeObjectRelease(v5[1]);
  *char v5 = a1;
  v5[1] = a2;
  sub_90CC();
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.label.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.duration.getter()
{
  uint64_t v0 = type metadata accessor for SiriTimerSnippetModel(0LL);
  return sub_11180(*(int *)(v0 + 36));
}

void SiriTimerSnippetModel.duration.setter()
{
  uint64_t v0 = sub_10F40();
  sub_10FD0(*(int *)(v0 + 36));
  sub_90CC();
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.duration.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.remainingTime.getter()
{
  uint64_t v0 = type metadata accessor for SiriTimerSnippetModel(0LL);
  return sub_11180(*(int *)(v0 + 40));
}

void SiriTimerSnippetModel.remainingTime.setter()
{
  uint64_t v0 = sub_10F40();
  sub_10FD0(*(int *)(v0 + 40));
  sub_90CC();
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.remainingTime.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.state.getter()
{
  uint64_t v0 = type metadata accessor for SiriTimerSnippetModel(0LL);
  return sub_11180(*(int *)(v0 + 44));
}

void SiriTimerSnippetModel.state.setter()
{
  uint64_t v0 = sub_10F40();
  sub_10FD0(*(int *)(v0 + 44));
  sub_90CC();
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *SiriTimerSnippetModel.state.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

uint64_t SiriTimerSnippetModel.init(timerIdentifier:directInvocation:label:duration:remainingTime:state:punchoutURL:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, void *a9@<X8>, unsigned __int8 a10, uint64_t a11, unsigned __int8 a12, uint64_t a13)
{
  uint64_t v54 = a8;
  int v53 = a7;
  uint64_t v51 = a5;
  uint64_t v52 = a6;
  uint64_t v48 = a2;
  uint64_t v49 = a13;
  uint64_t v50 = a4;
  sub_6FC0(&qword_28518);
  sub_10CF0();
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = &v43[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v17);
  uint64_t v21 = &v43[-v20];
  uint64_t v22 = (int *)type metadata accessor for SiriTimerSnippetModel(0LL);
  a9[3] = 0LL;
  a9[4] = 0LL;
  a9[2] = 0LL;
  uint64_t v23 = (uint64_t)a9 + v22[7];
  type metadata accessor for URL(0LL);
  uint64_t v47 = v23;
  sub_11284();
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0(v24, v25, v26, v27);
  unint64_t v28 = (void *)((char *)a9 + v22[8]);
  *unint64_t v28 = 0LL;
  v28[1] = 0LL;
  uint64_t v29 = (char *)a9 + v22[9];
  *(void *)uint64_t v29 = 0LL;
  v29[8] = 1;
  uint64_t v30 = (char *)a9 + v22[10];
  *(void *)uint64_t v30 = 0LL;
  v30[8] = 1;
  uint64_t v31 = (char *)a9 + v22[11];
  *(void *)uint64_t v31 = 0LL;
  v31[8] = 1;
  uint64_t v32 = v48;
  *a9 = a1;
  a9[1] = v32;
  uint64_t v48 = a3;
  sub_10B94(a3, (uint64_t)v21, &qword_28518);
  uint64_t v33 = type metadata accessor for Parse.DirectInvocation(0LL);
  if (_s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v21, 1LL, v33) == 1)
  {
    sub_7F08((uint64_t)v21, &qword_28518);
    uint64_t v34 = 0LL;
    uint64_t v35 = 0LL;
  }

  else
  {
    uint64_t v34 = Parse.DirectInvocation.identifier.getter();
    uint64_t v35 = v36;
    (*(void (**)(_BYTE *, uint64_t))(*(void *)(v33 - 8) + 8LL))(v21, v33);
  }

  int v46 = a12;
  uint64_t v45 = a11;
  int v44 = a10;
  swift_bridgeObjectRelease(a9[3]);
  a9[2] = v34;
  a9[3] = v35;
  uint64_t v37 = v48;
  sub_10B94(v48, (uint64_t)v19, &qword_28518);
  if (_s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v19, 1LL, v33) == 1)
  {
    sub_7F08(v37, &qword_28518);
    uint64_t v38 = sub_10E9C();
    sub_7F08(v38, v39);
    uint64_t v40 = 0LL;
  }

  else
  {
    uint64_t v40 = Parse.DirectInvocation.userData.getter();
    sub_7F08(v37, &qword_28518);
    (*(void (**)(_BYTE *, uint64_t))(*(void *)(v33 - 8) + 8LL))(v19, v33);
  }

  swift_bridgeObjectRelease(a9[4]);
  a9[4] = v40;
  sub_E340(v49, v47);
  uint64_t result = swift_bridgeObjectRelease(v28[1]);
  uint64_t v42 = v51;
  *unint64_t v28 = v50;
  v28[1] = v42;
  *(void *)uint64_t v29 = v52;
  v29[8] = v53 & 1;
  *(void *)uint64_t v30 = v54;
  v30[8] = v44 & 1;
  *(void *)uint64_t v31 = v45;
  v31[8] = v46 & 1;
  return result;
}

void SiriTimerSnippetModel.init(from:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char a11, char a12, char a13, char a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
  a26 = v29;
  a27 = v30;
  uint64_t v32 = v31;
  uint64_t v78 = v33;
  sub_6FC0(&qword_28520);
  sub_10CF0();
  __chkstk_darwin(v34);
  sub_1108C(v35, v72);
  uint64_t v77 = sub_6FC0(&qword_28528);
  uint64_t v75 = *(void *)(v77 - 8);
  sub_10CF0();
  __chkstk_darwin(v36);
  sub_110E0(v37, v73);
  sub_6FC0(&qword_28358);
  sub_10CF0();
  __chkstk_darwin(v38);
  sub_9040();
  uint64_t v79 = v39;
  uint64_t v80 = sub_6FC0(&qword_28530);
  sub_10CF0();
  __chkstk_darwin(v40);
  uint64_t v41 = sub_11070();
  uint64_t v42 = (int *)type metadata accessor for SiriTimerSnippetModel(v41);
  sub_10CF0();
  __chkstk_darwin(v43);
  sub_11210();
  v28[3] = 0LL;
  v28[4] = 0LL;
  v28[2] = 0LL;
  uint64_t v45 = (char *)v28 + *(int *)(v44 + 28);
  uint64_t v46 = type metadata accessor for URL(0LL);
  uint64_t v82 = (uint64_t)v45;
  sub_11284();
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0(v47, v48, v49, v46);
  uint64_t v50 = (uint64_t *)((char *)v28 + v42[8]);
  *uint64_t v50 = 0LL;
  v50[1] = 0LL;
  uint64_t v83 = v28;
  uint64_t v84 = v50;
  uint64_t v51 = (char *)v28 + v42[9];
  *(void *)uint64_t v51 = 0LL;
  v51[8] = 1;
  uint64_t v52 = (char *)v28 + v42[10];
  *(void *)uint64_t v52 = 0LL;
  v52[8] = 1;
  int v53 = (char *)v28 + v42[11];
  *(void *)int v53 = 0LL;
  v53[8] = 1;
  uint64_t v55 = v32[3];
  uint64_t v54 = v32[4];
  v81 = v32;
  sub_9B7C(v32, v55);
  unint64_t v56 = sub_E388();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for SiriTimerSnippetModel.CodingKeys,  &type metadata for SiriTimerSnippetModel.CodingKeys,  v56,  v55,  v54);
  if (v27)
  {
    sub_10BE8(v32);
    swift_bridgeObjectRelease(v83[3]);
    swift_bridgeObjectRelease(v83[4]);
    sub_7F08(v82, &qword_28358);
    swift_bridgeObjectRelease(v84[1]);
  }

  else
  {
    a17 = 0;
    uint64_t v57 = sub_113A4();
    if (v58) {
      uint64_t v59 = v57;
    }
    else {
      uint64_t v59 = 0LL;
    }
    unint64_t v60 = 0xE000000000000000LL;
    if (v58) {
      unint64_t v60 = v58;
    }
    *uint64_t v83 = v59;
    v83[1] = v60;
    a16 = 1;
    v83[2] = sub_113A4();
    v83[3] = v61;
    a15 = 3;
    uint64_t *v84 = sub_113A4();
    v84[1] = v62;
    a14 = 4;
    *(void *)uint64_t v51 = sub_113AC((uint64_t)&a14);
    v51[8] = v63 & 1;
    a13 = 5;
    *(void *)uint64_t v52 = sub_113AC((uint64_t)&a13);
    v52[8] = v64 & 1;
    a12 = 6;
    *(void *)int v53 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&a12, v80);
    v53[8] = v65 & 1;
    a11 = 7;
    sub_E1FC((uint64_t)&unk_28540);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v46, &a11, v80, v46, v66);
    sub_E340(v79, v82);
    uint64_t v67 = v32[3];
    uint64_t v68 = v81[4];
    sub_9B7C(v81, v81[3]);
    unint64_t v69 = sub_112AC();
    dispatch thunk of Decoder.container<A>(keyedBy:)(&unk_25658, &unk_25658, v69, v67, v68);
    _s13TimerUIPlugin19SiriTimePluginModelOwst_0(v76, 0LL, 1LL, v77);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v75 + 32))(v74, v76, v77);
    sub_B250();
    uint64_t v71 = v70;
    sub_10E2C(*(uint64_t (**)(uint64_t, uint64_t))(v75 + 8));
    sub_111B0();
    swift_bridgeObjectRelease(v83[4]);
    v83[4] = v71;
    sub_E400((uint64_t)v83, v78, type metadata accessor for SiriTimerSnippetModel);
    sub_112F0();
    sub_7E54((uint64_t)v83, type metadata accessor for SiriTimerSnippetModel);
  }

  sub_10CC0();
}

void sub_B250()
{
  uint64_t v3 = v2 - v1;
  uint64_t v4 = sub_6FC0(&qword_28528);
  uint64_t v32 = *(void *)(v4 - 8);
  sub_10CF0();
  __chkstk_darwin(v5);
  sub_9040();
  uint64_t v31 = v6;
  Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  uint64_t v7 = KeyedDecodingContainer.allKeys.getter(v4);
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
LABEL_53:
    swift_bridgeObjectRelease(v7);
    sub_9008();
    return;
  }

  uint64_t v30 = v7;
  uint64_t v9 = (_BYTE *)(v7 + 56);
  uint64_t v33 = v4;
  while (1)
  {
    uint64_t v11 = *((void *)v9 - 3);
    uint64_t v10 = *((void *)v9 - 2);
    uint64_t v12 = *((void *)v9 - 1);
    char v13 = *v9;
    uint64_t v34 = v11;
    uint64_t v35 = v10;
    uint64_t v36 = v12;
    LOBYTE(v37) = v13;
    swift_bridgeObjectRetain(v10);
    uint64_t v14 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v34, v4);
    if ((v15 & 1) == 0) {
      break;
    }
    uint64_t v19 = sub_10ED0();
    uint64_t v21 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v19, v20);
    if ((v22 & 1) == 0)
    {
      uint64_t v37 = &type metadata for Double;
      uint64_t v34 = v21;
      sub_10D74();
      sub_10CD8();
      sub_10D30();
      if (v16) {
        goto LABEL_57;
      }
      sub_11004();
      sub_6FC0(&qword_288C8);
      if (sub_10D1C())
      {
        sub_10D64();
        sub_10DC8();
        if (!v17) {
          goto LABEL_64;
        }
      }

      if ((v13 & 1) == 0)
      {
        sub_10C74();
        if (v16) {
          goto LABEL_62;
        }
        goto LABEL_49;
      }

      goto LABEL_44;
    }

    uint64_t v23 = sub_10ED0();
    uint64_t v24 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v23);
    if (v25)
    {
      uint64_t v37 = &type metadata for String;
      uint64_t v34 = v24;
      uint64_t v35 = v25;
      sub_10D74();
      sub_10CD8();
      sub_10D30();
      if (v16) {
        goto LABEL_55;
      }
      sub_11004();
      sub_6FC0(&qword_288C8);
      if (sub_10D1C())
      {
        sub_10D64();
        sub_10DC8();
        if (!v17) {
          goto LABEL_64;
        }
      }

      if ((v13 & 1) == 0)
      {
        sub_10C74();
        if (v16) {
          goto LABEL_60;
        }
        goto LABEL_49;
      }

LABEL_44:
      sub_11118();
LABEL_50:
      sub_11010();
      sub_111E8();
      uint64_t v4 = v33;
      goto LABEL_51;
    }

    uint64_t v26 = sub_10ED0();
    char v27 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v26);
    if (v27 != 2)
    {
      uint64_t v37 = &type metadata for Bool;
      LOBYTE(v34) = v27 & 1;
      sub_10D74();
      sub_10CD8();
      sub_10D30();
      if (v16) {
        goto LABEL_58;
      }
      sub_11004();
      sub_6FC0(&qword_288C8);
      if (sub_10D1C())
      {
        sub_10D64();
        sub_10DC8();
        if (!v17) {
          goto LABEL_64;
        }
      }

      if ((v13 & 1) == 0)
      {
        sub_10C74();
        if (v16) {
          goto LABEL_63;
        }
        goto LABEL_49;
      }

      goto LABEL_44;
    }

    uint64_t v34 = v11;
    uint64_t v35 = v10;
    uint64_t v36 = v12;
    LOBYTE(v37) = v13;
    sub_E3C4();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&unk_25658, &v34, v33, &unk_25658);
    _s13TimerUIPlugin19SiriTimePluginModelOwst_0(v3, 0LL, 1LL, v33);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v31, v3, v33);
    uint64_t v28 = sub_B250(v31);
    uint64_t v37 = (void *)sub_6FC0(&qword_288B8);
    uint64_t v34 = v28;
    sub_10D74();
    sub_10CD8();
    sub_10D30();
    if (v16) {
      goto LABEL_56;
    }
    sub_11004();
    sub_6FC0(&qword_288C8);
    if (sub_10D1C())
    {
      sub_10D64();
      sub_10DC8();
      if (!v17) {
        goto LABEL_64;
      }
    }

    if ((v13 & 1) != 0)
    {
      sub_11118();
    }

    else
    {
      sub_10C74();
      if (v16) {
        goto LABEL_61;
      }
      sub_11064(v29);
    }

    sub_11010();
    sub_111E8();
    uint64_t v4 = v33;
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
LABEL_51:
    v9 += 32;
    if (!--v8)
    {
      uint64_t v7 = v30;
      goto LABEL_53;
    }
  }

  uint64_t v37 = &type metadata for Int;
  uint64_t v34 = v14;
  sub_10D74();
  sub_10CD8();
  sub_10D30();
  if (!v16)
  {
    sub_11004();
    sub_6FC0(&qword_288C8);
    if (sub_10D1C())
    {
      sub_10D64();
      sub_10DC8();
      if (!v17) {
        goto LABEL_64;
      }
    }

    if ((v13 & 1) != 0) {
      goto LABEL_44;
    }
    sub_10C74();
    if (v16) {
      goto LABEL_59;
    }
LABEL_49:
    sub_11064(v18);
    goto LABEL_50;
  }

  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
  __break(1u);
LABEL_63:
  __break(1u);
  __break(1u);
  __break(1u);
LABEL_64:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

void SiriTimerSnippetModel.encode(to:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  a22 = v28;
  a23 = v29;
  uint64_t v30 = v23;
  uint64_t v32 = v31;
  uint64_t v33 = sub_6FC0(&qword_28550);
  uint64_t v53 = *(void *)(v33 - 8);
  uint64_t v54 = v33;
  sub_10CF0();
  __chkstk_darwin(v34);
  sub_10DB0();
  uint64_t v35 = sub_6FC0(&qword_28558);
  sub_10F30();
  __chkstk_darwin(v36);
  sub_10F18();
  uint64_t v37 = v32[3];
  uint64_t v38 = v32[4];
  sub_9B7C(v32, v37);
  unint64_t v39 = sub_E388();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for SiriTimerSnippetModel.CodingKeys,  &type metadata for SiriTimerSnippetModel.CodingKeys,  v39,  v37,  v38);
  uint64_t v40 = *v23;
  uint64_t v41 = v23[1];
  LOBYTE(v56) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v40, v41, &v56, v35);
  if (v24)
  {
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v35);
  }

  else
  {
    uint64_t v55 = v25;
    uint64_t v52 = v27;
    __int128 v56 = *((_OWORD *)v23 + 1);
    a13 = 1;
    sub_11390();
    sub_11388((uint64_t)&unk_28560);
    sub_10CFC();
    uint64_t v42 = (int *)type metadata accessor for SiriTimerSnippetModel(0LL);
    __int128 v56 = *(_OWORD *)((char *)v23 + v42[8]);
    a13 = 3;
    sub_10CFC();
    sub_10EA8(v42[9]);
    a13 = 4;
    sub_11390();
    sub_11388((uint64_t)&unk_28570);
    sub_10CFC();
    sub_10EA8(v42[10]);
    a13 = 5;
    sub_10CFC();
    sub_10EA8(v42[11]);
    a13 = 6;
    uint64_t v43 = sub_11390();
    sub_11388((uint64_t)&unk_28580);
    sub_10E20((uint64_t)&v56, (uint64_t)&a13, v35, v43, v44);
    uint64_t v45 = (uint64_t)v23 + v42[7];
    LOBYTE(v56) = 7;
    uint64_t v46 = sub_6FC0(&qword_28358);
    unint64_t v47 = sub_E468();
    sub_10E20(v45, (uint64_t)&v56, v35, v46, v47);
    if (v30[4])
    {
      uint64_t v48 = v32;
      uint64_t v49 = v32[3];
      uint64_t v50 = v48[4];
      sub_9B7C(v48, v49);
      unint64_t v51 = sub_112AC();
      dispatch thunk of Encoder.container<A>(keyedBy:)(&unk_25658, &unk_25658, v51, v49, v50);
      sub_BC6C();
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v55, v54);
    }

    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v26, v35);
  }

  sub_10CC0();
}

void sub_BC6C()
{
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v48 = sub_6FC0(&qword_28550);
  uint64_t v45 = *(void *)(v48 - 8);
  sub_10CF0();
  __chkstk_darwin(v4);
  sub_9040();
  uint64_t v44 = v5;
  uint64_t v6 = v3 + 64;
  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = v8 & *(void *)(v3 + 64);
  int64_t v47 = (unint64_t)(v7 + 63) >> 6;
  swift_bridgeObjectRetain(v3);
  int64_t v10 = 0LL;
  while (v9)
  {
    unint64_t v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v12 = v11 | (v10 << 6);
LABEL_26:
    char v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v12);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    if (*(void *)(v3 + 16))
    {
      swift_bridgeObjectRetain_n(v19, 2LL);
      unint64_t v20 = sub_DFD0(v18, v19);
      if ((v21 & 1) != 0)
      {
        sub_7E7C(*(void *)(v3 + 56) + 32 * v20, (uint64_t)&v55);
      }

      else
      {
        __int128 v55 = 0u;
        __int128 v56 = 0u;
      }

      sub_10E60();
    }

    else
    {
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      swift_bridgeObjectRetain(v19);
    }

    sub_10D44();
    if (v54)
    {
      uint64_t v22 = sub_10EE8();
      uint64_t v25 = v50;
      sub_11320();
      uint64_t v0 = v1;
      KeyedEncodingContainer.encode(_:forKey:)(v26, v25, v53, v48);
      if (v1)
      {
        swift_bridgeObjectRelease(v25);
LABEL_68:
        sub_7F08((uint64_t)&v55, &qword_288A8);
        sub_10E60();
LABEL_69:
        swift_release(v3);
        sub_10CC0();
        return;
      }

      sub_7F08((uint64_t)&v55, &qword_288A8);
      sub_10E60();
      swift_bridgeObjectRelease(v25);
    }

    else
    {
      sub_10E08();
LABEL_37:
      sub_10D44();
      if (v54)
      {
        uint64_t v27 = sub_10EE8();
        if ((sub_10DA8(v27, v28, v29, (uint64_t)&type metadata for Int) & 1) != 0)
        {
          sub_111C0();
          uint64_t v0 = v1;
          KeyedEncodingContainer.encode(_:forKey:)();
          goto LABEL_48;
        }
      }

      else
      {
        sub_10E08();
      }

      sub_10D44();
      if (v54)
      {
        uint64_t v30 = sub_10EE8();
        if ((sub_10DA8(v30, v31, v32, (uint64_t)&type metadata for Double) & 1) != 0)
        {
          uint64_t v33 = sub_10F50();
          KeyedEncodingContainer.encode(_:forKey:)(v33);
          goto LABEL_48;
        }
      }

      else
      {
        sub_10E08();
      }

      sub_10D44();
      if (!v54)
      {
        sub_10E08();
        goto LABEL_51;
      }

      uint64_t v34 = sub_10EE8();
      if ((sub_10DA8(v34, v35, v36, (uint64_t)&type metadata for Bool) & 1) != 0)
      {
        sub_111C0();
        uint64_t v0 = v1;
        KeyedEncodingContainer.encode(_:forKey:)();
LABEL_48:
        uint64_t v1 = v0;
        if (v0) {
          goto LABEL_68;
        }
        sub_10E78((uint64_t)&v55);
        sub_10E60();
      }

      else
      {
LABEL_51:
        sub_10D44();
        if (v54)
        {
          sub_6FC0(&qword_288B8);
          uint64_t v37 = sub_10EE8();
          if ((sub_10DA8(v37, v38, v39, v40) & 1) == 0) {
            goto LABEL_56;
          }
          uint64_t v46 = v49;
          sub_11320();
          sub_E3C4();
          KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&unk_25658, v53, v48, &unk_25658);
          sub_10E60();
          uint64_t v0 = v1;
          sub_BC6C(v44, v46);
          sub_11110();
          sub_10F74(v45);
          sub_7F08((uint64_t)&v55, &qword_288A8);
          if (v1) {
            goto LABEL_69;
          }
        }

        else
        {
          sub_10E08();
LABEL_56:
          sub_10D44();
          if (!v54)
          {
            sub_10E08();
            goto LABEL_61;
          }

          uint64_t v41 = sub_6FC0(&qword_288B0);
          if ((sub_10DA8((uint64_t)&v49, (uint64_t)v53, (uint64_t)&type metadata for Any + 8, v41) & 1) != 0)
          {
            uint64_t v42 = v49;
            uint64_t v49 = v18;
            uint64_t v50 = v19;
            uint64_t v51 = 0LL;
            char v52 = 1;
            KeyedEncodingContainer.nestedUnkeyedContainer(forKey:)(v53, &v49, v48);
            sub_10E60();
            uint64_t v0 = v1;
            sub_C174((uint64_t)v53, v42);
            swift_bridgeObjectRelease(v42);
            sub_10BE8(v53);
            sub_10E78((uint64_t)&v55);
            if (v1) {
              goto LABEL_69;
            }
          }

          else
          {
LABEL_61:
            uint64_t v43 = sub_10F50();
            KeyedEncodingContainer.encodeNil(forKey:)(v43);
            uint64_t v1 = v0;
            sub_10E78((uint64_t)&v55);
            sub_10E60();
            if (v0) {
              goto LABEL_69;
            }
          }
        }
      }
    }
  }

  BOOL v13 = __OFADD__(v10++, 1LL);
  if (v13)
  {
    __break(1u);
    goto LABEL_71;
  }

  if (v10 >= v47) {
    goto LABEL_69;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v10);
  if (v14)
  {
LABEL_25:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_26;
  }

  sub_11258();
  if (v16 == v13) {
    goto LABEL_69;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14) {
    goto LABEL_24;
  }
  sub_11258();
  if (v16 == v13) {
    goto LABEL_69;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14) {
    goto LABEL_24;
  }
  sub_11258();
  if (v16 == v13) {
    goto LABEL_69;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14) {
    goto LABEL_24;
  }
  sub_11258();
  if (v16 == v13) {
    goto LABEL_69;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14) {
    goto LABEL_24;
  }
  sub_11258();
  if (v16 == v13) {
    goto LABEL_69;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
LABEL_24:
    int64_t v10 = v15;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v10 >= v47) {
      goto LABEL_69;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_25;
    }
  }

LABEL_71:
  __break(1u);
}

  ;
}

void sub_C174(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  uint64_t v8 = sub_6FC0(&qword_28550);
  __chkstk_darwin(v8);
  sub_9040();
  uint64_t v10 = *(void *)(a2 + 16);
  if (!v10) {
    return;
  }
  uint64_t v34 = v9;
  uint64_t v11 = a2 + 32;
  uint64_t v35 = a2;
  sub_10E38();
  while (1)
  {
    sub_7E7C(v11, (uint64_t)v38);
    sub_10E14();
    if (!sub_10DA8( (uint64_t)v37,  (uint64_t)v36,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for String)) {
      break;
    }
    uint64_t v12 = v37[0];
    uint64_t v13 = v37[1];
    uint64_t v4 = *(void *)(a1 + 24);
    uint64_t v3 = *(void *)(a1 + 32);
    sub_10BC0(a1, v4);
    uint64_t v2 = v5;
    dispatch thunk of UnkeyedEncodingContainer.encode(_:)(v12, v13, v4, v3);
    if (v5)
    {
      swift_bridgeObjectRelease(v13);
      goto LABEL_24;
    }

    sub_111F0();
    swift_bridgeObjectRelease(v13);
LABEL_13:
    v11 += 32LL;
    if (!--v10) {
      goto LABEL_25;
    }
  }

  sub_10E14();
  uint64_t v14 = sub_11018();
  if (sub_10DA8(v14, v15, v16, (uint64_t)&type metadata for Int))
  {
    sub_10D98();
    sub_112DC();
    dispatch thunk of UnkeyedEncodingContainer.encode(_:)();
    goto LABEL_12;
  }

  sub_10E14();
  uint64_t v17 = sub_11018();
  if (sub_10DA8(v17, v18, v19, (uint64_t)&type metadata for Double))
  {
    sub_10D98();
    uint64_t v20 = sub_112C8();
    dispatch thunk of UnkeyedEncodingContainer.encode(_:)(v20);
    goto LABEL_12;
  }

  sub_10E14();
  uint64_t v21 = sub_11018();
  if (sub_10DA8(v21, v22, v23, (uint64_t)&type metadata for Bool))
  {
    sub_10D98();
    sub_112DC();
    dispatch thunk of UnkeyedEncodingContainer.encode(_:)();
LABEL_12:
    uint64_t v5 = v2;
    sub_111F0();
    if (v2) {
      goto LABEL_25;
    }
    goto LABEL_13;
  }

  sub_10E14();
  sub_6FC0(&qword_288B8);
  uint64_t v24 = sub_11018();
  if (sub_10DA8(v24, v25, v26, v27))
  {
    uint64_t v28 = v37[0];
    uint64_t v3 = *(void *)(a1 + 24);
    uint64_t v33 = *(void *)(a1 + 32);
    sub_10BC0(a1, v3);
    unint64_t v29 = sub_112AC();
    uint64_t v4 = v34;
    dispatch thunk of UnkeyedEncodingContainer.nestedContainer<A>(keyedBy:)(&unk_25658, &unk_25658, v29, v3, v33);
    uint64_t v2 = v5;
    sub_BC6C(v34, v28);
    if (v5)
    {
      swift_bridgeObjectRelease(v28);
      sub_11274();
      goto LABEL_24;
    }

    swift_bridgeObjectRelease(v28);
    sub_11274();
    goto LABEL_22;
  }

  sub_10E14();
  uint64_t v30 = sub_6FC0(&qword_288B0);
  if (!sub_10DA8((uint64_t)v37, (uint64_t)v36, (uint64_t)&type metadata for Any + 8, v30))
  {
    sub_10D98();
    uint64_t v32 = sub_112C8();
    dispatch thunk of UnkeyedEncodingContainer.encodeNil()(v32);
    uint64_t v5 = v2;
    if (v2) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }

  uint64_t v31 = v37[0];
  sub_10D98();
  dispatch thunk of UnkeyedEncodingContainer.nestedUnkeyedContainer()(v36, v3, v4);
  uint64_t v2 = v5;
  sub_C174(v36, v31);
  if (!v5)
  {
    swift_bridgeObjectRelease(v31);
    sub_10BE8(v36);
LABEL_22:
    sub_111F0();
    goto LABEL_13;
  }

  swift_bridgeObjectRelease(v31);
  sub_10BE8(v36);
LABEL_24:
  sub_111F0();
LABEL_25:
  swift_bridgeObjectRelease(v35);
}

void sub_C4AC(void *a1)
{
  uint64_t v5 = sub_6FC0(&qword_28528);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_11228();
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_9B7C(a1, v7);
  if ((dispatch thunk of UnkeyedDecodingContainer.isAtEnd.getter(v7, v8) & 1) == 0)
  {
    do
    {
      uint64_t v10 = a1[3];
      uint64_t v9 = a1[4];
      sub_10BC0((uint64_t)a1, v10);
      dispatch thunk of UnkeyedDecodingContainer.decodeIfPresent(_:)(v10, v9);
      if (v12) {
        goto LABEL_15;
      }
      sub_10D54();
      uint64_t v11 = sub_10FA0();
      dispatch thunk of UnkeyedDecodingContainer.decodeIfPresent(_:)(v11);
      if ((v13 & 1) != 0
        && (sub_10D54(),
            uint64_t v14 = sub_10FA0(),
            dispatch thunk of UnkeyedDecodingContainer.decodeIfPresent(_:)(v14),
            (v15 & 1) != 0)
        && (sub_10D54(),
            uint64_t v16 = sub_10FA0(),
            dispatch thunk of UnkeyedDecodingContainer.decodeIfPresent(_:)(v16) == 2))
      {
        sub_10D54();
        unint64_t v17 = sub_E3C4();
        dispatch thunk of UnkeyedDecodingContainer.nestedContainer<A>(keyedBy:)(&unk_25658, &unk_25658, v17, v9, v10);
        _s13TimerUIPlugin19SiriTimePluginModelOwst_0(v1, 0LL, 1LL, v5);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v2, v1, v5);
        sub_B250(v2);
        sub_6FC0(&qword_288B8);
        if ((sub_10E58() & 1) == 0) {
          sub_10DD8();
        }
        sub_111F8();
        if (v19) {
          sub_10DF0(v18);
        }
        sub_11044();
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
      }

      else
      {
LABEL_15:
        if ((sub_10E58() & 1) == 0) {
          sub_10DD8();
        }
        sub_111F8();
        if (v19) {
          sub_10DF0(v20);
        }
        sub_11044();
      }

      sub_9B7C(a1, a1[3]);
      uint64_t v21 = sub_10FA0();
    }

    while ((dispatch thunk of UnkeyedDecodingContainer.isAtEnd.getter(v21, v22) & 1) == 0);
  }

  sub_9008();
}

BOOL sub_C870(char a1, char a2)
{
  return a1 == a2;
}

void sub_C880(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_C8A4(uint64_t a1, unint64_t a2)
{
  BOOL v3 = a1 == 0x65644972656D6974LL && a2 == 0xEF7265696669746ELL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x65644972656D6974LL, 0xEF7265696669746ELL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  if (a1 == 0xD000000000000013LL)
  {
    unint64_t v6 = 0x800000000001F900LL;
    if (a2 == 0x800000000001F900LL) {
      goto LABEL_11;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013LL, 0x800000000001F900LL) & 1) != 0)
  {
    unint64_t v6 = a2;
LABEL_11:
    swift_bridgeObjectRelease(v6);
    return 1LL;
  }

  if (a1 == 0xD000000000000017LL && a2 == 0x800000000001F920LL)
  {
    unint64_t v7 = 0x800000000001F920LL;
LABEL_17:
    swift_bridgeObjectRelease(v7);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000017LL, 0x800000000001F920LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_17;
  }

  BOOL v8 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000LL;
  if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6C6562616CLL, 0xE500000000000000LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 3LL;
  }

  else
  {
    BOOL v9 = a1 == 0x6E6F697461727564LL && a2 == 0xE800000000000000LL;
    if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461727564LL, 0xE800000000000000LL) & 1) != 0)
    {
      swift_bridgeObjectRelease(a2);
      return 4LL;
    }

    else
    {
      BOOL v10 = a1 == 0x6E696E69616D6572LL && a2 == 0xED0000656D695467LL;
      if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6E696E69616D6572LL, 0xED0000656D695467LL) & 1) != 0)
      {
        swift_bridgeObjectRelease(a2);
        return 5LL;
      }

      else
      {
        BOOL v11 = a1 == 0x6574617473LL && a2 == 0xE500000000000000LL;
        if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6574617473LL, 0xE500000000000000LL) & 1) != 0)
        {
          swift_bridgeObjectRelease(a2);
          return 6LL;
        }

        else if (a1 == 0x74756F68636E7570LL && a2 == 0xEB000000004C5255LL)
        {
          swift_bridgeObjectRelease(a2);
          return 7LL;
        }

        else
        {
          char v13 = _stringCompareWithSmolCheck(_:_:expecting:)(0x74756F68636E7570LL, 0xEB000000004C5255LL);
          swift_bridgeObjectRelease(a2);
          if ((v13 & 1) != 0) {
            return 7LL;
          }
          else {
            return 8LL;
          }
        }
      }
    }
  }

uint64_t sub_CBD4()
{
  return 8LL;
}

uint64_t sub_CBDC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_CC14 + 4 * byte_1E480[a1]))( 0xD000000000000013LL,  0x800000000001F900LL);
}

uint64_t sub_CC14()
{
  return 0x65644972656D6974LL;
}

uint64_t sub_CC38(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_CC50()
{
  return 0x6C6562616CLL;
}

uint64_t sub_CC64()
{
  return 0x6E6F697461727564LL;
}

uint64_t sub_CC7C()
{
  return 0x6E696E69616D6572LL;
}

uint64_t sub_CCA0()
{
  return 0x6574617473LL;
}

uint64_t sub_CCB4()
{
  return 0x74756F68636E7570LL;
}

BOOL sub_CCD4(char *a1, char *a2)
{
  return sub_C870(*a1, *a2);
}

void sub_CCE0()
{
}

void sub_CCF8(uint64_t a1)
{
}

uint64_t sub_CD00()
{
  return sub_CBDC(*v0);
}

uint64_t sub_CD08@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_C8A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_CD2C()
{
  return _s13TimerUIPlugin04SiriA12SnippetModelV8durationSdSgvpfi_0();
}

uint64_t sub_CD48@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_CBD4();
  *a1 = result;
  return result;
}

uint64_t sub_CD6C(uint64_t a1)
{
  unint64_t v2 = sub_E388();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_CD94(uint64_t a1)
{
  unint64_t v2 = sub_E388();
  return CodingKey.debugDescription.getter(a1, v2);
}

#error "CDC4: call analysis failed (funcsize=5)"
#error "CDD8: call analysis failed (funcsize=5)"
uint64_t sub_CDE4()
{
  return dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
}

uint64_t sub_CE2C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

void sub_CE58(uint64_t a1@<X8>)
{
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = 0LL;
  *(_BYTE *)(a1 + 24) = 1;
}

uint64_t sub_CE88()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_CE94@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_CDE4();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = 0;
  return result;
}

uint64_t sub_CEC0(uint64_t a1)
{
  unint64_t v2 = sub_E3C4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_CEE8(uint64_t a1)
{
  unint64_t v2 = sub_E3C4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t TimerSelectorModel.timers.getter()
{
  return swift_bridgeObjectRetain(*v0);
}

uint64_t property wrapper backing initializer of TimerSelectorModel.header(uint64_t a1, uint64_t a2)
{
  v3[0] = a1;
  v3[1] = a2;
  return Loggable.init(wrappedValue:)(v3, &type metadata for String);
}

uint64_t TimerSelectorModel.header.setter(uint64_t a1, uint64_t a2)
{
  v4[0] = a1;
  v4[1] = a2;
  sub_11290();
  uint64_t v2 = sub_6FC0(&qword_281D0);
  return Loggable.wrappedValue.setter(v4, v2);
}

void (*TimerSelectorModel.header.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_11290();
  uint64_t v3 = sub_6FC0(&qword_281D0);
  v2[4] = Loggable.wrappedValue.modify(v2, v3);
  return sub_CFE0;
}

void sub_CFE0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32LL))(*a1, 0LL);
  free(v1);
}

uint64_t TimerSelectorModel.init(timers:header:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = a1;
  type metadata accessor for TimerSelectorModel(0LL);
  v7[0] = a2;
  v7[1] = a3;
  return Loggable.init(wrappedValue:)(v7, &type metadata for String);
}

BOOL sub_D06C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_D07C(uint64_t a1, char a2)
{
}

uint64_t sub_D0A0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7372656D6974LL && a2 == 0xE600000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7372656D6974LL, 0xE600000000000000LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x726564616568LL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x726564616568LL, 0xE600000000000000LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_D17C()
{
  return 2LL;
}

Swift::Int sub_D184(char a1)
{
  return Hasher._finalize()();
}

uint64_t sub_D1C8(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x726564616568LL;
  }
  else {
    return 0x7372656D6974LL;
  }
}

BOOL sub_D1F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_D06C(*a1, *a2);
}

Swift::Int sub_D1FC()
{
  return sub_D184(*v0);
}

void sub_D204(uint64_t a1)
{
}

Swift::Int sub_D20C(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_D24C()
{
  return sub_D1C8(*v0);
}

uint64_t sub_D254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_D0A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_D278@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_D17C();
  *a1 = result;
  return result;
}

uint64_t sub_D29C(uint64_t a1)
{
  unint64_t v2 = sub_E4E4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_D2C4(uint64_t a1)
{
  unint64_t v2 = sub_E4E4();
  return CodingKey.debugDescription.getter(a1, v2);
}

void TimerSelectorModel.encode(to:)()
{
  BOOL v3 = v0;
  uint64_t v4 = sub_6FC0(&qword_28598);
  sub_10F30();
  __chkstk_darwin(v5);
  sub_10FE4();
  unint64_t v6 = sub_E4E4();
  sub_10F90((uint64_t)&type metadata for TimerSelectorModel.CodingKeys, v7, v6);
  uint64_t v15 = *v0;
  char v14 = 0;
  uint64_t v8 = sub_6FC0(&qword_284E8);
  unint64_t v9 = sub_E2C0((uint64_t)&unk_28508);
  sub_1137C((uint64_t)&v15, (uint64_t)&v14, v4, v8, v9);
  if (!v1)
  {
    uint64_t v10 = (uint64_t)v3 + *(int *)(sub_9100() + 20);
    char v13 = 1;
    uint64_t v11 = sub_6FC0(&qword_281D0);
    sub_E520((uint64_t)&unk_285A8);
    sub_1137C(v10, (uint64_t)&v13, v4, v11, v12);
  }

  sub_11058(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_10E80();
}

void TimerSelectorModel.init(from:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v38 = v10;
  char v13 = v12;
  uint64_t v34 = v14;
  uint64_t v35 = sub_6FC0(&qword_281D0);
  uint64_t v33 = *(void *)(v35 - 8);
  sub_10CF0();
  __chkstk_darwin(v15);
  unint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = sub_6FC0(&qword_285B0);
  uint64_t v18 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  sub_11240();
  uint64_t v19 = sub_9100();
  sub_10CF0();
  __chkstk_darwin(v20);
  sub_9020();
  uint64_t v23 = (char *)(v22 - v21);
  uint64_t v25 = v13[3];
  uint64_t v24 = v13[4];
  sub_9B7C(v13, v25);
  unint64_t v26 = sub_E4E4();
  uint64_t v36 = v11;
  uint64_t v27 = v38;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for TimerSelectorModel.CodingKeys,  &type metadata for TimerSelectorModel.CodingKeys,  v26,  v25,  v24);
  if (v27)
  {
    sub_112F0();
  }

  else
  {
    uint64_t v38 = v13;
    uint64_t v28 = v35;
    sub_6FC0(&qword_284E8);
    char v40 = 0;
    sub_E2C0((uint64_t)&unk_284F0);
    uint64_t v29 = v36;
    sub_1103C();
    uint64_t v32 = a10;
    *(void *)uint64_t v23 = a10;
    char v39 = 1;
    sub_E520((uint64_t)&unk_285B8);
    sub_1103C();
    sub_10E94(v29, *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(&v23[*(int *)(v19 + 20)], v17, v28);
    sub_E400((uint64_t)v23, v34, type metadata accessor for TimerSelectorModel);
    sub_10BE8(v38);
    uint64_t v30 = sub_10E9C();
    sub_7E54(v30, v31);
  }

  sub_10CC0();
}

void sub_D674( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D688()
{
}

void ComposeTimerModel.label.getter()
{
}

void ComposeTimerModel.label.setter(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  sub_90CC();
}

void ComposeTimerModel.duration.getter()
{
}

void ComposeTimerModel.duration.setter(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  sub_90CC();
}

TimerUIPlugin::TimerSnippetModel (__swiftcall *ComposeTimerModel.duration.modify())(Swift::OpaquePointer timers)
{
  return TimerSnippetModel.init(timers:);
}

void __swiftcall ComposeTimerModel.init(header:prompt:label:duration:)( TimerUIPlugin::ComposeTimerModel *__return_ptr retstr, Swift::String header, Swift::String prompt, Swift::String_optional label, Swift::String_optional duration)
{
  retstr->header = header;
  retstr->prompt = prompt;
  retstr->label = label;
  retstr->duration = duration;
}

uint64_t sub_D758(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726564616568LL && a2 == 0xE600000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x726564616568LL, 0xE600000000000000LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else
  {
    BOOL v6 = a1 == 0x74706D6F7270LL && a2 == 0xE600000000000000LL;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x74706D6F7270LL, 0xE600000000000000LL) & 1) != 0)
    {
      swift_bridgeObjectRelease(a2);
      return 1LL;
    }

    else
    {
      BOOL v7 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000LL;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6C6562616CLL, 0xE500000000000000LL) & 1) != 0)
      {
        swift_bridgeObjectRelease(a2);
        return 2LL;
      }

      else if (a1 == 0x6E6F697461727564LL && a2 == 0xE800000000000000LL)
      {
        swift_bridgeObjectRelease(a2);
        return 3LL;
      }

      else
      {
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461727564LL, 0xE800000000000000LL);
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

uint64_t sub_D8DC()
{
  return 4LL;
}

void sub_D8E4(uint64_t a1)
{
  unsigned __int8 v1 = a1;
  sub_11358(a1);
  Hasher._combine(_:)(v1);
  sub_11208();
  sub_10F84();
}

uint64_t sub_D914(char a1)
{
  return *(void *)&aHeader_1[8 * a1];
}

void sub_D934(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  Hasher._combine(_:)(v2);
  sub_11208();
  sub_10F84();
}

uint64_t sub_D968()
{
  return sub_D914(*v0);
}

uint64_t sub_D970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_D758(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_D994@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_D8DC();
  *a1 = result;
  return result;
}

uint64_t sub_D9B8(uint64_t a1)
{
  unint64_t v2 = sub_E578();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_D9E0(uint64_t a1)
{
  unint64_t v2 = sub_E578();
  return CodingKey.debugDescription.getter(a1, v2);
}

void ComposeTimerModel.encode(to:)()
{
  unint64_t v4 = sub_E578();
  sub_10F90((uint64_t)&type metadata for ComposeTimerModel.CodingKeys, v5, v4);
  uint64_t v6 = *v0;
  uint64_t v7 = v0[1];
  char v17 = 0;
  sub_11160(v6, v7, (uint64_t)&v17);
  if (!v1)
  {
    uint64_t v8 = v0[2];
    uint64_t v9 = v0[3];
    char v16 = 1;
    sub_11160(v8, v9, (uint64_t)&v16);
    uint64_t v10 = v0[4];
    uint64_t v11 = v0[5];
    char v15 = 2;
    sub_11170(v10, v11, (uint64_t)&v15);
    uint64_t v12 = v0[6];
    uint64_t v13 = v0[7];
    char v14 = 3;
    sub_11170(v12, v13, (uint64_t)&v14);
  }

  sub_11058(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_10E80();
}

void ComposeTimerModel.init(from:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v26;
  a24 = v27;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v32 = sub_6FC0(&qword_285D0);
  uint64_t v33 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  sub_11210();
  uint64_t v34 = v29[3];
  uint64_t v35 = v29[4];
  sub_9B7C(v29, v34);
  unint64_t v36 = sub_E578();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ComposeTimerModel.CodingKeys,  &type metadata for ComposeTimerModel.CodingKeys,  v36,  v34,  v35);
  if (v24)
  {
    sub_11108();
    swift_bridgeObjectRelease(0LL);
    sub_10E60();
  }

  else
  {
    a14 = 0;
    uint64_t v37 = sub_11150((uint64_t)&a14);
    uint64_t v39 = v38;
    uint64_t v55 = v37;
    a13 = 1;
    swift_bridgeObjectRetain(v38);
    uint64_t v40 = sub_11150((uint64_t)&a13);
    uint64_t v42 = v41;
    uint64_t v52 = v40;
    uint64_t v53 = v31;
    a12 = 2;
    sub_10E38();
    uint64_t v54 = v42;
    uint64_t v43 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&a12);
    uint64_t v45 = v44;
    uint64_t v51 = v43;
    a11 = 3;
    swift_bridgeObjectRetain(v44);
    uint64_t v46 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&a11);
    uint64_t v48 = v47;
    uint64_t v49 = *(uint64_t (**)(uint64_t, uint64_t))(v33 + 8);
    uint64_t v50 = v46;
    sub_10EC8(v25, v49);
    sub_10E38();
    swift_bridgeObjectRelease(0LL);
    sub_11108();
    sub_11110();
    sub_10E60();
    swift_bridgeObjectRelease(v54);
    sub_10FB0();
    *uint64_t v53 = v55;
    v53[1] = v39;
    v53[2] = v52;
    void v53[3] = v54;
    v53[4] = v51;
    v53[5] = v45;
    v53[6] = v50;
    v53[7] = v48;
  }

  sub_10CC0();
}

double sub_DD14@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _OWORD *a9@<X8>)
{
  if (!v9)
  {
    *a9 = v13;
    a9[1] = v16;
    double result = *(double *)&v19;
    a9[2] = v19;
    a9[3] = v22;
  }

  return result;
}

void sub_DD54()
{
}

char *sub_DD68(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_6FC0(&qword_288D0);
    uint64_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 32);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  __int128 v13 = v11 + 32;
  if ((v5 & 1) != 0)
  {
    sub_DF4C((char *)(a4 + 32), v8, v13);
    *(void *)(a4 + 16) = 0LL;
    swift_bridgeObjectRelease(a4);
  }

  else
  {
    sub_DE54(0LL, v8, (unint64_t)v13, a4);
  }

  return v11;
}

uint64_t sub_DE54(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  unint64_t v6 = a4 + 32 * a1 + 32;
  unint64_t v7 = a3 + 32 * v4;
  if (v6 >= v7 || v6 + 32 * v4 <= a3)
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

char *sub_DF4C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }

  return __src;
}

unint64_t sub_DFD0(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_E034(a1, a2, v5);
}

unint64_t sub_E034(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11) & 1) == 0)
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

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15) & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_E114(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
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

unint64_t sub_E18C()
{
  unint64_t result = qword_284C0;
  if (!qword_284C0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ComposeTimerModel,  &type metadata for ComposeTimerModel);
    atomic_store(result, (unint64_t *)&qword_284C0);
  }

  return result;
}

void sub_E1C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_9134(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(v3, v4, v5);
  sub_905C();
}

void sub_E1FC(uint64_t a1)
{
  if (!sub_11364(a1))
  {
    uint64_t v4 = v3;
    uint64_t v5 = v2(255LL);
    atomic_store(swift_getWitnessTable(v4, v5), v1);
  }

  sub_905C();
}

unint64_t sub_E234()
{
  unint64_t result = qword_284D0;
  if (!qword_284D0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for TimerSnippetModel,  &type metadata for TimerSnippetModel);
    atomic_store(result, (unint64_t *)&qword_284D0);
  }

  return result;
}

unint64_t sub_E270()
{
  unint64_t result = qword_284E0;
  if (!qword_284E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EFE8, &type metadata for TimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_284E0);
  }

  return result;
}

uint64_t type metadata accessor for SiriTimerSnippetModel(uint64_t a1)
{
  return sub_78C8(a1, (uint64_t *)&unk_286E8, (uint64_t)&nominal type descriptor for SiriTimerSnippetModel);
}

unint64_t sub_E2C0(uint64_t a1)
{
  unint64_t result = sub_11364(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    uint64_t v6 = v3;
    uint64_t v7 = sub_756C(&qword_284E8);
    sub_E1FC(v6);
    unint64_t result = swift_getWitnessTable(v5, v7);
    atomic_store(result, v1);
  }

  return result;
}

uint64_t sub_E340(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6FC0(&qword_28358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_E388()
{
  unint64_t result = qword_28538;
  if (!qword_28538)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EF98, &type metadata for SiriTimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28538);
  }

  return result;
}

unint64_t sub_E3C4()
{
  unint64_t result = qword_28548;
  if (!qword_28548)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EF48, &unk_25658);
    atomic_store(result, (unint64_t *)&qword_28548);
  }

  return result;
}

void sub_E400(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_9134(a1, a2, a3);
  sub_10FB8(v3);
  sub_905C();
}

void sub_E420(uint64_t a1)
{
  if (!sub_11364(a1))
  {
    uint64_t v3 = sub_756C(v2);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v3), v1);
  }

  sub_11398();
}

unint64_t sub_E468()
{
  unint64_t result = qword_28588;
  if (!qword_28588)
  {
    uint64_t v1 = sub_756C(&qword_28358);
    sub_E1FC((uint64_t)&unk_28590);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_28588);
  }

  return result;
}

unint64_t sub_E4E4()
{
  unint64_t result = qword_285A0;
  if (!qword_285A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EEF8, &type metadata for TimerSelectorModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_285A0);
  }

  return result;
}

void sub_E520(uint64_t a1)
{
  if (!sub_11364(a1))
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_756C(&qword_281D0);
    atomic_store(swift_getWitnessTable(v3, v4), v1);
  }

  sub_11398();
}

unint64_t sub_E578()
{
  unint64_t result = qword_285C8;
  if (!qword_285C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EEA8, &type metadata for ComposeTimerModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_285C8);
  }

  return result;
}

void sub_E5B4()
{
}

void sub_E5E0()
{
}

void sub_E614()
{
}

void sub_E640()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriTimePluginModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v16);
  }

  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v17 = a2[1];
      *a1 = *a2;
      a1[1] = v17;
      uint64_t v18 = a2[3];
      a1[2] = a2[2];
      a1[3] = v18;
      uint64_t v19 = a2[5];
      a1[4] = a2[4];
      a1[5] = v19;
      uint64_t v20 = a2[6];
      uint64_t v21 = a2[7];
      a1[6] = v20;
      a1[7] = v21;
      swift_bridgeObjectRetain(v17);
      swift_bridgeObjectRetain(v18);
      swift_bridgeObjectRetain(v19);
      swift_bridgeObjectRetain(v21);
      uint64_t v13 = a1;
      uint64_t v14 = a3;
      uint64_t v15 = 2LL;
    }

    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = *a2;
      *a1 = *a2;
      uint64_t v9 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      swift_bridgeObjectRetain(v8);
      uint64_t v12 = sub_6FC0(&qword_281D0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
      uint64_t v13 = a1;
      uint64_t v14 = a3;
      uint64_t v15 = 1LL;
    }

    else
    {
      uint64_t v22 = *a2;
      *a1 = *a2;
      swift_bridgeObjectRetain(v22);
      uint64_t v13 = a1;
      uint64_t v14 = a3;
      uint64_t v15 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v13, v14, v15);
  }

  return a1;
}

uint64_t destroy for SiriTimePluginModel(void *a1, uint64_t a2)
{
  uint64_t result = swift_getEnumCaseMultiPayload(a1, a2);
  if ((_DWORD)result == 2)
  {
    swift_bridgeObjectRelease(a1[1]);
    swift_bridgeObjectRelease(a1[3]);
    swift_bridgeObjectRelease(a1[5]);
    uint64_t v4 = a1[7];
    return swift_bridgeObjectRelease(v4);
  }

  if ((_DWORD)result != 1)
  {
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v4 = *a1;
    return swift_bridgeObjectRelease(v4);
  }

  swift_bridgeObjectRelease(*a1);
  int v5 = (char *)a1 + *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
  uint64_t v6 = sub_6FC0(&qword_281D0);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

void *initializeWithCopy for SiriTimePluginModel(void *a1, void *a2, uint64_t a3)
{
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  uint64_t v7 = EnumCaseMultiPayload;
  if ((_DWORD)EnumCaseMultiPayload == 2)
  {
    uint64_t v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    uint64_t v14 = a2[3];
    a1[2] = a2[2];
    a1[3] = v14;
    uint64_t v15 = a2[5];
    a1[4] = a2[4];
    a1[5] = v15;
    uint64_t v16 = a2[6];
    uint64_t v17 = a2[7];
    a1[6] = v16;
    a1[7] = v17;
    swift_bridgeObjectRetain(v13);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRetain(v15);
    uint64_t v18 = v17;
LABEL_6:
    swift_bridgeObjectRetain(v18);
    goto LABEL_7;
  }

  if ((_DWORD)EnumCaseMultiPayload != 1)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    goto LABEL_6;
  }

  uint64_t v8 = *a2;
  *a1 = *a2;
  uint64_t v9 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  swift_bridgeObjectRetain(v8);
  uint64_t v12 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
LABEL_7:
  swift_storeEnumTagMultiPayload(a1, a3, v7);
  return a1;
}

void *assignWithCopy for SiriTimePluginModel(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_7E54((uint64_t)a1, type metadata accessor for SiriTimePluginModel);
    uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    uint64_t v7 = EnumCaseMultiPayload;
    if ((_DWORD)EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      uint64_t v13 = a2[1];
      a1[1] = v13;
      a1[2] = a2[2];
      uint64_t v14 = a2[3];
      a1[3] = v14;
      a1[4] = a2[4];
      uint64_t v15 = a2[5];
      a1[5] = v15;
      a1[6] = a2[6];
      uint64_t v16 = a2[7];
      a1[7] = v16;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRetain(v14);
      swift_bridgeObjectRetain(v15);
      uint64_t v17 = v16;
    }

    else
    {
      if ((_DWORD)EnumCaseMultiPayload == 1)
      {
        uint64_t v8 = *a2;
        *a1 = *a2;
        uint64_t v9 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
        uint64_t v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        swift_bridgeObjectRetain(v8);
        uint64_t v12 = sub_6FC0(&qword_281D0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
LABEL_8:
        swift_storeEnumTagMultiPayload(a1, a3, v7);
        return a1;
      }

      uint64_t v17 = *a2;
      *a1 = *a2;
    }

    swift_bridgeObjectRetain(v17);
    goto LABEL_8;
  }

  return a1;
}

void *initializeWithTake for SiriTimePluginModel(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    *a1 = *a2;
    uint64_t v6 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_6FC0(&qword_281D0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
    swift_storeEnumTagMultiPayload(a1, a3, 1LL);
  }

  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  return a1;
}

void *assignWithTake for SiriTimePluginModel(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_7E54((uint64_t)a1, type metadata accessor for SiriTimePluginModel);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      *a1 = *a2;
      uint64_t v6 = *(int *)(type metadata accessor for TimerSelectorModel(0LL) + 20);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_6FC0(&qword_281D0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
      swift_storeEnumTagMultiPayload(a1, a3, 1LL);
    }

    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }
  }

  return a1;
}

uint64_t sub_EC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_EC14(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  uint64_t result = type metadata accessor for TimerSelectorModel(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    void v4[2] = "@";
    swift_initEnumMetadataMultiPayload(a1, 256LL, 3LL, v4);
    return 0LL;
  }

  return result;
}

void type metadata accessor for TimerSnippetModel()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriTimerSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v15);
  }

  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[4];
    uint64_t v10 = a3[7];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    a1[4] = v9;
    uint64_t v13 = type metadata accessor for URL(0LL);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    if (_s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v12, 1LL, v13))
    {
      uint64_t v14 = sub_6FC0(&qword_28358);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
      _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v11, 0LL, 1LL, v13);
    }

    uint64_t v16 = a3[8];
    uint64_t v17 = a3[9];
    uint64_t v18 = (uint64_t *)((char *)v4 + v16);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (char *)v4 + v17;
    uint64_t v22 = (char *)a2 + v17;
    *(void *)uint64_t v21 = *(void *)v22;
    v21[8] = v22[8];
    uint64_t v23 = a3[10];
    uint64_t v24 = a3[11];
    uint64_t v25 = (char *)v4 + v23;
    uint64_t v26 = (char *)a2 + v23;
    *(void *)uint64_t v25 = *(void *)v26;
    v25[8] = v26[8];
    uint64_t v27 = (char *)v4 + v24;
    uint64_t v28 = (char *)a2 + v24;
    *(void *)uint64_t v27 = *(void *)v28;
    v27[8] = v28[8];
    swift_bridgeObjectRetain(v20);
  }

  return v4;
}

uint64_t destroy for SiriTimerSnippetModel(void *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for URL(0LL);
  return swift_bridgeObjectRelease(*(void *)((char *)a1 + *(int *)(a2 + 32) + 8));
}

void *initializeWithCopy for SiriTimerSnippetModel(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[4];
  a1[4] = v8;
  uint64_t v9 = a3[7];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for URL(0LL);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  if (_s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v11, 1LL, v12))
  {
    uint64_t v13 = sub_6FC0(&qword_28358);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
    _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v10, 0LL, 1LL, v12);
  }

  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = (void *)((char *)a1 + v14);
  uint64_t v17 = (void *)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = (char *)a1 + v15;
  uint64_t v20 = (char *)a2 + v15;
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v20[8];
  uint64_t v21 = a3[10];
  uint64_t v22 = a3[11];
  uint64_t v23 = (char *)a1 + v21;
  uint64_t v24 = (char *)a2 + v21;
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v24[8];
  uint64_t v25 = (char *)a1 + v22;
  uint64_t v26 = (char *)a2 + v22;
  *(void *)uint64_t v25 = *(void *)v26;
  v25[8] = v26[8];
  swift_bridgeObjectRetain(v18);
  return a1;
}

void *assignWithCopy for SiriTimerSnippetModel(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a1[4];
  uint64_t v11 = a2[4];
  a1[4] = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for URL(0LL);
  int v16 = _s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v13, 1LL, v15);
  int v17 = _s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v14, 1LL, v15);
  if (!v16)
  {
    uint64_t v18 = *(void *)(v15 - 8);
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v13, v14, v15);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v15);
    goto LABEL_6;
  }

  if (v17)
  {
LABEL_6:
    uint64_t v19 = sub_6FC0(&qword_28358);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v13, 0LL, 1LL, v15);
LABEL_7:
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  uint64_t v23 = v22[1];
  uint64_t v24 = v21[1];
  v21[1] = v23;
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRelease(v24);
  uint64_t v25 = a3[9];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = *(void *)v27;
  v26[8] = v27[8];
  *(void *)uint64_t v26 = v28;
  uint64_t v29 = a3[10];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  LOBYTE(v28) = v31[8];
  *(void *)uint64_t v30 = *(void *)v31;
  v30[8] = v28;
  uint64_t v32 = a3[11];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  uint64_t v35 = *(void *)v34;
  v33[8] = v34[8];
  *(void *)uint64_t v33 = v35;
  return a1;
}

uint64_t initializeWithTake for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for URL(0LL);
  if (_s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v9, 1LL, v10))
  {
    uint64_t v11 = sub_6FC0(&qword_28358);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
    _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v8, 0LL, 1LL, v10);
  }

  uint64_t v12 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  *(void *)uint64_t v13 = *(void *)v14;
  uint64_t v15 = a3[10];
  uint64_t v16 = a3[11];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  *(void *)uint64_t v17 = *(void *)v18;
  uint64_t v19 = a1 + v16;
  uint64_t v20 = a2 + v16;
  *(void *)uint64_t v19 = *(void *)v20;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  return a1;
}

void *assignWithTake for SiriTimerSnippetModel(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a1[4];
  a1[4] = a2[4];
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for URL(0LL);
  int v15 = _s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v12, 1LL, v14);
  int v16 = _s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v13, 1LL, v14);
  if (!v15)
  {
    uint64_t v17 = *(void *)(v14 - 8);
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 40))(v12, v13, v14);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v14);
    goto LABEL_6;
  }

  if (v16)
  {
LABEL_6:
    uint64_t v18 = sub_6FC0(&qword_28358);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v12, v13, v14);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v12, 0LL, 1LL, v14);
LABEL_7:
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  uint64_t v24 = v20[1];
  *uint64_t v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease(v24);
  uint64_t v25 = a3[9];
  uint64_t v26 = a3[10];
  uint64_t v27 = (char *)a1 + v25;
  uint64_t v28 = (char *)a2 + v25;
  *(void *)uint64_t v27 = *(void *)v28;
  v27[8] = v28[8];
  uint64_t v29 = (char *)a1 + v26;
  uint64_t v30 = (char *)a2 + v26;
  *(void *)uint64_t v29 = *(void *)v30;
  v29[8] = v30[8];
  uint64_t v31 = a3[11];
  uint64_t v32 = (char *)a1 + v31;
  uint64_t v33 = (char *)a2 + v31;
  *(void *)uint64_t v32 = *(void *)v33;
  v32[8] = v33[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F4A4);
}

void sub_F4A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    sub_91AC(*(void *)(a1 + 8));
    sub_90CC();
  }

  else
  {
    uint64_t v6 = sub_6FC0(&qword_28358);
    sub_9070(a1 + *(int *)(a3 + 28), a2, v6);
  }

uint64_t storeEnumTagSinglePayload for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F50C);
}

void sub_F50C()
{
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
    sub_90CC();
  }

  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_6FC0(&qword_28358);
    sub_907C(v1 + *(int *)(v4 + 28), v0, v0, v5);
  }

void sub_F560(uint64_t a1)
{
  v4[0] = &unk_1E788;
  v4[1] = &unk_1E7A0;
  void v4[2] = &unk_1E7B8;
  sub_F5F8(319LL);
  if (v3 <= 0x3F)
  {
    void v4[3] = *(void *)(v2 - 8) + 64LL;
    void v4[4] = &unk_1E7A0;
    v4[5] = &unk_1E7D0;
    v4[6] = &unk_1E7D0;
    v4[7] = &unk_1E7D0;
    swift_initStructMetadata(a1, 256LL, 8LL, v4, a1 + 16);
  }

void sub_F5F8(uint64_t a1)
{
  if (!qword_286F8)
  {
    uint64_t v2 = type metadata accessor for URL(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_286F8);
    }
  }

uint64_t *initializeBufferWithCopyOfBuffer for TimerSelectorModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v5);
  }

  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    swift_bridgeObjectRetain(v5);
    uint64_t v9 = sub_6FC0(&qword_281D0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16LL))(v7, v8, v9);
  }

  return a1;
}

uint64_t destroy for TimerSelectorModel(void *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_6FC0(&qword_281D0);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t *initializeWithCopy for TimerSelectorModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  swift_bridgeObjectRetain(v4);
  uint64_t v8 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16LL))(v6, v7, v8);
  return a1;
}

uint64_t *assignWithCopy for TimerSelectorModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 24LL))(v9, v10, v11);
  return a1;
}

void *initializeWithTake for TimerSelectorModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(v5, v6, v7);
  return a1;
}

uint64_t *assignWithTake for TimerSelectorModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_6FC0(&qword_281D0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimerSelectorModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F8D8);
}

void sub_F8D8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    sub_91AC(*a1);
    sub_90CC();
  }

  else
  {
    uint64_t v6 = sub_6FC0(&qword_281D0);
    sub_9070((uint64_t)a1 + *(int *)(a3 + 20), a2, v6);
  }

uint64_t storeEnumTagSinglePayload for TimerSelectorModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F940);
}

void sub_F940()
{
  if (v3)
  {
    *uint64_t v1 = (v0 - 1);
    sub_90CC();
  }

  else
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_6FC0(&qword_281D0);
    sub_907C((uint64_t)v1 + *(int *)(v4 + 20), v0, v0, v5);
  }

void sub_F994(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  sub_FA0C();
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
  }

void sub_FA0C()
{
  if (!qword_287A8)
  {
    unint64_t v0 = type metadata accessor for Loggable(0LL, &type metadata for String);
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_287A8);
    }
  }

uint64_t initializeBufferWithCopyOfBuffer for ComposeTimerModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for ComposeTimerModel(void *a1)
{
  return swift_bridgeObjectRelease(a1[7]);
}

void *initializeWithCopy for ComposeTimerModel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

void *assignWithCopy for ComposeTimerModel(void *a1, void *a2)
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
  a1[4] = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a1[7];
  a1[7] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

__n128 initializeWithTake for ComposeTimerModel(uint64_t a1, uint64_t a2)
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

void *assignWithTake for ComposeTimerModel(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[5];
  uint64_t v9 = a1[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a2[7];
  uint64_t v11 = a1[7];
  a1[6] = a2[6];
  a1[7] = v10;
  swift_bridgeObjectRelease(v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComposeTimerModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ComposeTimerModel(uint64_t result, int a2, int a3)
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

void type metadata accessor for ComposeTimerModel()
{
}

_BYTE *initializeBufferWithCopyOfBuffer for ComposeTimerModel.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ComposeTimerModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ComposeTimerModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_FDC4 + 4 * byte_1E48D[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_FDF8 + 4 * byte_1E488[v4]))();
}

uint64_t sub_FDF8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_FE00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xFE08LL);
  }
  return result;
}

uint64_t sub_FE14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xFE1CLL);
  }
  *(_BYTE *)__n128 result = a2 + 3;
  return result;
}

uint64_t sub_FE20(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_FE28(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ComposeTimerModel.CodingKeys()
{
  return &type metadata for ComposeTimerModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TimerSelectorModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TimerSelectorModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_FF18 + 4 * byte_1E497[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_FF4C + 4 * byte_1E492[v4]))();
}

uint64_t sub_FF4C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_FF54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xFF5CLL);
  }
  return result;
}

uint64_t sub_FF68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xFF70LL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_FF74(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_FF7C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_FF88(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_FF90(_BYTE *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TimerSelectorModel.CodingKeys()
{
  return &type metadata for TimerSelectorModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriTimerSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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

    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for SiriTimerSnippetModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF8) {
    return ((uint64_t (*)(void))((char *)&loc_10080 + 4 * byte_1E4A1[v4]))();
  }
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_100B4 + 4 * byte_1E49C[v4]))();
}

uint64_t sub_100B4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100C4LL);
  }
  return result;
}

uint64_t sub_100D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100D8LL);
  }
  *(_BYTE *)__n128 result = a2 + 7;
  return result;
}

uint64_t sub_100DC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100E4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100F0(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimerSnippetModel.CodingKeys()
{
  return &type metadata for SiriTimerSnippetModel.CodingKeys;
}

uint64_t sub_10108(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

uint64_t sub_10110(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t sub_1014C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  return a1;
}

__n128 sub_101A8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_101BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t sub_10200(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 25))
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

uint64_t sub_10240(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(_BYTE *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 25) = 1;
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

    *(_BYTE *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for JSONCodingKeys()
{
}

uint64_t sub_1029C()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for TimerSnippetModel.CodingKeys()
{
  return &type metadata for TimerSnippetModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriTimePluginModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
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

    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for SiriTimePluginModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_10388 + 4 * byte_1E4AB[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_103BC + 4 * byte_1E4A6[v4]))();
}

uint64_t sub_103BC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_103C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x103CCLL);
  }
  return result;
}

uint64_t sub_103D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x103E0LL);
  }
  *(_BYTE *)__n128 result = a2 + 2;
  return result;
}

uint64_t sub_103E4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_103EC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.CodingKeys()
{
  return &type metadata for SiriTimePluginModel.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.TimerMultiCodingKeys()
{
  return &type metadata for SiriTimePluginModel.TimerMultiCodingKeys;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.TimerSelectorCodingKeys()
{
  return &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys;
}

uint64_t _s13TimerUIPlugin17TimerSnippetModelV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s13TimerUIPlugin17TimerSnippetModelV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_104B8 + 4 * byte_1E4B0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_104D8 + 4 * byte_1E4B5[v4]))();
  }
}

_BYTE *sub_104B8(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

_BYTE *sub_104D8(_BYTE *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_104E0(_DWORD *result, int a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_104E8(_WORD *result, __int16 a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_104F0(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_104F8(_DWORD *result)
{
  *__n128 result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.ComposeTimerCodingKeys()
{
  return &type metadata for SiriTimePluginModel.ComposeTimerCodingKeys;
}

unint64_t sub_10518()
{
  unint64_t result = qword_287D8;
  if (!qword_287D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1E928, &type metadata for SiriTimePluginModel.ComposeTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_287D8);
  }

  return result;
}

unint64_t sub_10558()
{
  unint64_t result = qword_287E0;
  if (!qword_287E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1E9E0, &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_287E0);
  }

  return result;
}

unint64_t sub_10598()
{
  unint64_t result = qword_287E8;
  if (!qword_287E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EA98, &type metadata for SiriTimePluginModel.TimerMultiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_287E8);
  }

  return result;
}

unint64_t sub_105D8()
{
  unint64_t result = qword_287F0;
  if (!qword_287F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EB50, &type metadata for SiriTimePluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_287F0);
  }

  return result;
}

unint64_t sub_10618()
{
  unint64_t result = qword_287F8;
  if (!qword_287F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EC08, &type metadata for TimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_287F8);
  }

  return result;
}

unint64_t sub_10658()
{
  unint64_t result = qword_28800;
  if (!qword_28800)
  {
    unint64_t result = swift_getWitnessTable(&unk_1ED10, &type metadata for SiriTimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28800);
  }

  return result;
}

unint64_t sub_10698()
{
  unint64_t result = qword_28808;
  if (!qword_28808)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EDC8, &type metadata for TimerSelectorModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28808);
  }

  return result;
}

unint64_t sub_106D8()
{
  unint64_t result = qword_28810;
  if (!qword_28810)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EE80, &type metadata for ComposeTimerModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28810);
  }

  return result;
}

unint64_t sub_10718()
{
  unint64_t result = qword_28818;
  if (!qword_28818)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EDF0, &type metadata for ComposeTimerModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28818);
  }

  return result;
}

unint64_t sub_10758()
{
  unint64_t result = qword_28820;
  if (!qword_28820)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EE18, &type metadata for ComposeTimerModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28820);
  }

  return result;
}

unint64_t sub_10798()
{
  unint64_t result = qword_28828;
  if (!qword_28828)
  {
    unint64_t result = swift_getWitnessTable(&unk_1ED38, &type metadata for TimerSelectorModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28828);
  }

  return result;
}

unint64_t sub_107D8()
{
  unint64_t result = qword_28830;
  if (!qword_28830)
  {
    unint64_t result = swift_getWitnessTable(&unk_1ED60, &type metadata for TimerSelectorModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28830);
  }

  return result;
}

unint64_t sub_10818()
{
  unint64_t result = qword_28838;
  if (!qword_28838)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EC30, &unk_25658);
    atomic_store(result, (unint64_t *)&qword_28838);
  }

  return result;
}

unint64_t sub_10858()
{
  unint64_t result = qword_28840;
  if (!qword_28840)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EC58, &unk_25658);
    atomic_store(result, (unint64_t *)&qword_28840);
  }

  return result;
}

unint64_t sub_10898()
{
  unint64_t result = qword_28848;
  if (!qword_28848)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EC80, &type metadata for SiriTimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28848);
  }

  return result;
}

unint64_t sub_108D8()
{
  unint64_t result = qword_28850;
  if (!qword_28850)
  {
    unint64_t result = swift_getWitnessTable(&unk_1ECA8, &type metadata for SiriTimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28850);
  }

  return result;
}

unint64_t sub_10918()
{
  unint64_t result = qword_28858;
  if (!qword_28858)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EB78, &type metadata for TimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28858);
  }

  return result;
}

unint64_t sub_10958()
{
  unint64_t result = qword_28860;
  if (!qword_28860)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EBA0, &type metadata for TimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28860);
  }

  return result;
}

unint64_t sub_10998()
{
  unint64_t result = qword_28868;
  if (!qword_28868)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EA08, &type metadata for SiriTimePluginModel.TimerMultiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_28868);
  }

  return result;
}

unint64_t sub_109D8()
{
  unint64_t result = qword_28870;
  if (!qword_28870)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EA30, &type metadata for SiriTimePluginModel.TimerMultiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_28870);
  }

  return result;
}

unint64_t sub_10A18()
{
  unint64_t result = qword_28878;
  if (!qword_28878)
  {
    unint64_t result = swift_getWitnessTable(&unk_1E950, &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_28878);
  }

  return result;
}

unint64_t sub_10A58()
{
  unint64_t result = qword_28880;
  if (!qword_28880)
  {
    unint64_t result = swift_getWitnessTable(&unk_1E978, &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_28880);
  }

  return result;
}

unint64_t sub_10A98()
{
  unint64_t result = qword_28888;
  if (!qword_28888)
  {
    unint64_t result = swift_getWitnessTable("1q", &type metadata for SiriTimePluginModel.ComposeTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_28888);
  }

  return result;
}

unint64_t sub_10AD8()
{
  unint64_t result = qword_28890;
  if (!qword_28890)
  {
    unint64_t result = swift_getWitnessTable(&unk_1E8C0, &type metadata for SiriTimePluginModel.ComposeTimerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_28890);
  }

  return result;
}

unint64_t sub_10B18()
{
  unint64_t result = qword_28898;
  if (!qword_28898)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EAC0, &type metadata for SiriTimePluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_28898);
  }

  return result;
}

unint64_t sub_10B58()
{
  unint64_t result = qword_288A0;
  if (!qword_288A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1EAE8, &type metadata for SiriTimePluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_288A0);
  }

  return result;
}

void sub_10B94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_6FC0(a3);
  sub_10FB8(v3);
  sub_905C();
}

uint64_t sub_10BC0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t sub_10BE8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10C08()
{
  if (*(void *)(v0 + 40)) {
    sub_10BE8((void *)(v0 + 16));
  }
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10C34(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_OWORD *sub_10C74()
{
  *(void *)(v1 + 8 * (v2 >> 6) + 64) |= 1LL << v2;
  int v5 = (void *)(*(void *)(v1 + 48) + 16 * v2);
  *int v5 = v3;
  v5[1] = v0;
  return sub_7EB8((_OWORD *)(v4 - 192), (_OWORD *)(*(void *)(v1 + 56) + 32 * v2));
}

  ;
}

unint64_t sub_10CD8()
{
  *(void *)(v3 - 224) = v1;
  return sub_DFD0(v2, v0);
}

  ;
}

uint64_t sub_10CFC()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)(v3 - 96, v3 - 65, v0, v1, v2);
}

BOOL sub_10D1C()
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(v0, v1);
}

  ;
}

void sub_10D44()
{
}

uint64_t sub_10D54()
{
  return sub_10BC0(v0, *(void *)(v0 + 24));
}

unint64_t sub_10D64()
{
  return sub_DFD0(v1, v0);
}

uint64_t sub_10D74()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_10D90()
{
  return swift_errorRelease(v0);
}

uint64_t sub_10D98()
{
  return sub_10BC0(v0, *(void *)(v0 + 24));
}

uint64_t sub_10DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, a2, a3, a4, 6LL);
}

  ;
}

  ;
}

char *sub_10DD8()
{
  return sub_DD68(0LL, *(void *)(v0 + 16) + 1LL, 1, v0);
}

char *sub_10DF0@<X0>(unint64_t a1@<X8>)
{
  return sub_DD68((char *)(a1 > 1), v1, 1, v2);
}

void sub_10E08()
{
}

uint64_t sub_10E14()
{
  return sub_7E7C(v0 - 112, v0 - 168);
}

uint64_t sub_10E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)(a1, a2, a3, a4, a5);
}

uint64_t sub_10E2C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_10E38()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

uint64_t sub_10E58()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_10E60()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10E68()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

void sub_10E78(uint64_t a1)
{
}

  ;
}

uint64_t sub_10E94@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_10E9C()
{
  return v0;
}

void sub_10EA8(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + a1);
  uint64_t v4 = *v3;
  LOBYTE(v3) = *((_BYTE *)v3 + 8);
  *(void *)(v2 - 96) = v4;
  *(_BYTE *)(v2 - 88) = (_BYTE)v3;
}

uint64_t sub_10EC0()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t sub_10EC8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_10ED0()
{
  *(void *)(v4 - 144) = v3;
  *(void *)(v4 - 136) = v2;
  *(void *)(v4 - 128) = v0;
  *(_BYTE *)(v4 - 120) = v1;
  return v4 - 144;
}

uint64_t sub_10EE8()
{
  return v0 - 184;
}

uint64_t sub_10EF8(uint64_t a1, uint64_t a2)
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, v2, a1);
}

  ;
}

  ;
}

uint64_t sub_10F40()
{
  return type metadata accessor for SiriTimerSnippetModel(0LL);
}

uint64_t sub_10F50()
{
  *(void *)(v2 - 152) = v0;
  *(void *)(v2 - 144) = v1;
  *(void *)(v2 - 136) = 0LL;
  *(_BYTE *)(v2 - 128) = 1;
  return v2 - 152;
}

uint64_t sub_10F74@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

  ;
}

uint64_t sub_10F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)(a1, a1, a3, v3, v4);
}

uint64_t sub_10FA0()
{
  return v0;
}

uint64_t sub_10FB0()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10FB8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16LL))(v1, v2, a1);
}

void sub_10FD0(uint64_t a1@<X8>)
{
  uint64_t v4 = v2 + a1;
  *(void *)uint64_t v4 = v3;
  *(_BYTE *)(v4 + 8) = v1 & 1;
}

void *sub_10FE4()
{
  return sub_9B7C(v0, v0[3]);
}

  ;
}

uint64_t sub_11010()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_11018()
{
  return v0 - 128;
}

uint64_t sub_11028()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_1103C()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

_OWORD *sub_11044()
{
  *(void *)(v1 + 16) = v0;
  return sub_7EB8((_OWORD *)(v3 - 128), (_OWORD *)(v1 + 32 * v2 + 32));
}

uint64_t sub_11058@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_11064@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 16) = a1;
  return swift_bridgeObjectRetain(v1);
}

uint64_t sub_11070()
{
  return 0LL;
}

void sub_1108C(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void sub_110A8(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void sub_110C4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 200) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void sub_110E0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_110FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, a3, a1);
}

uint64_t sub_11108()
{
  return sub_10BE8(v0);
}

uint64_t sub_11110()
{
  return swift_bridgeObjectRelease(v0);
}

_OWORD *sub_11118()
{
  uint64_t v3 = (void *)(*(void *)(v0 + 56) + 32 * v1);
  sub_10BE8(v3);
  return sub_7EB8((_OWORD *)(v2 - 192), v3);
}

uint64_t sub_1113C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 240) + 8LL))(v1, v0);
}

uint64_t sub_11150(uint64_t a1)
{
  return KeyedDecodingContainer.decode(_:forKey:)(a1, v1);
}

uint64_t sub_11160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, a3, v3);
}

uint64_t sub_11170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a1, a2, a3, v3);
}

uint64_t sub_11180@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t sub_11190()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 24));
}

uint64_t sub_111A0()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 8));
}

uint64_t sub_111B0()
{
  return (*(uint64_t (**)(uint64_t, void))(v0 + 8))(v1, *(void *)(v2 - 136));
}

void sub_111C0()
{
  *(void *)(v2 - 152) = v0;
  *(void *)(v2 - 144) = v1;
  *(void *)(v2 - 136) = 0LL;
  *(_BYTE *)(v2 - 128) = 1;
}

uint64_t sub_111D8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

uint64_t sub_111E8()
{
  return swift_bridgeObjectRelease(0x8000000000000000LL);
}

uint64_t sub_111F0()
{
  return sub_10BE8((void *)(v0 - 112));
}

  ;
}

Swift::Int sub_11208()
{
  return Hasher._finalize()();
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_11264(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
}

uint64_t sub_11274()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 200) + 8LL))(v0, *(void *)(v1 - 192));
}

  ;
}

uint64_t sub_11290()
{
  return type metadata accessor for TimerSelectorModel(0LL);
}

unint64_t sub_112AC()
{
  return sub_E3C4();
}

uint64_t sub_112B4()
{
  return v0;
}

uint64_t sub_112C8()
{
  return v0;
}

  ;
}

uint64_t sub_112F0()
{
  return sub_10BE8(v0);
}

  ;
}

  ;
}

uint64_t sub_11314()
{
  return static DeviceIdiom.== infix(_:_:)(v1, v0);
}

void sub_11320()
{
  *(void *)(v2 - 152) = v0;
  *(void *)(v2 - 144) = v1;
  *(void *)(v2 - 136) = 0LL;
  *(_BYTE *)(v2 - 128) = 1;
}

uint64_t sub_11334()
{
  return v0;
}

void sub_11340()
{
}

uint64_t sub_1134C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)(a1, a2, a3, a4, a5);
}

void *sub_11358(uint64_t a1, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, 0LL);
}

uint64_t sub_11364(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_11370()
{
  return swift_bridgeObjectRelease(*v0);
}

uint64_t sub_1137C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)(a1, a2, a3, a4, a5);
}

void sub_11388(uint64_t a1)
{
}

uint64_t sub_11390()
{
  return sub_6FC0(v0);
}

  ;
}

uint64_t sub_113A4()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_113AC(uint64_t a1)
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(a1, v1);
}

void sub_113B8(uint64_t a1)
{
}

uint64_t *sub_113F0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  unsigned int v6 = (void *)a2[2];
  uint64_t v5 = a2[3];
  a1[2] = (uint64_t)v6;
  a1[3] = v5;
  uint64_t v8 = (void *)a2[4];
  uint64_t v7 = a2[5];
  a1[4] = (uint64_t)v8;
  a1[5] = v7;
  swift_retain(v3);
  swift_retain(v4);
  id v9 = v6;
  id v10 = v8;
  return a1;
}

uint64_t *sub_11444(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  uint64_t v8 = (void *)a1[2];
  id v9 = (void *)a2[2];
  a1[2] = (uint64_t)v9;
  id v10 = v9;

  a1[3] = a2[3];
  uint64_t v11 = (void *)a2[4];
  uint64_t v12 = (void *)a1[4];
  a1[4] = (uint64_t)v11;
  id v13 = v11;

  a1[5] = a2[5];
  return a1;
}

__n128 sub_114D8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *sub_114EC(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  uint64_t v5 = (void *)a1[2];
  a1[2] = *(void *)(a2 + 16);

  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = (void *)a1[4];
  a1[3] = *(void *)(a2 + 24);
  a1[4] = v6;

  a1[5] = *(void *)(a2 + 40);
  return a1;
}

uint64_t sub_11550(uint64_t a1, int a2)
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

uint64_t sub_11590(uint64_t result, int a2, int a3)
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

void type metadata accessor for TimerProgressView()
{
}

uint64_t sub_115E8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_22158, 1LL);
}

BOOL sub_115F8(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_11604()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_6E94(v0, qword_288D8);
  sub_6D9C(v0, (uint64_t)qword_288D8);
  return Logger.init(subsystem:category:)( 0xD000000000000013LL,  0x800000000001F8A0LL,  0x495572656D6974LL,  0xE700000000000000LL);
}

uint64_t sub_11678()
{
  uint64_t result = static Color.orange.getter();
  qword_288F0 = result;
  return result;
}

uint64_t sub_11694()
{
  id v0 = [(id)objc_opt_self(UIColor) systemGray2Color];
  uint64_t result = Color.init(uiColor:)(v0);
  qword_288F8 = result;
  return result;
}

void sub_116D0(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = static Alignment.center.getter(a1);
  a2[1] = v4;
  uint64_t v5 = sub_6FC0(&qword_28900);
  sub_1170C(v2, (uint64_t)a2 + *(int *)(v5 + 44));
  sub_905C();
}

uint64_t sub_1170C@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v97 = type metadata accessor for RoundedRectangle(0LL);
  __chkstk_darwin(v97);
  v98 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v94 = type metadata accessor for PlainButtonStyle(0LL);
  uint64_t v93 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v92 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v91 = sub_6FC0(&qword_28908);
  uint64_t v89 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v87 = (char *)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v90 = sub_6FC0(&qword_28910);
  uint64_t v88 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  __int128 v86 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v85 = sub_6FC0(&qword_28918);
  __chkstk_darwin(v85);
  v96 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v104 = sub_6FC0(&qword_28920);
  __chkstk_darwin(v104);
  uint64_t v95 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_6FC0(&qword_28928);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v106 = (uint64_t)&v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v105 = (uint64_t)&v84 - v13;
  uint64_t v102 = sub_6FC0(&qword_28930);
  __chkstk_darwin(v102);
  int v15 = (uint64_t *)((char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v16 = type metadata accessor for LayoutDirection(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v84 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = sub_6FC0(&qword_28938);
  uint64_t v21 = __chkstk_darwin(v20);
  v107 = (uint64_t *)((char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v21);
  uint64_t v108 = (uint64_t)&v84 - v23;
  if (qword_28198 != -1) {
    swift_once(&qword_28198, sub_11694);
  }
  uint64_t v103 = qword_288F8;
  swift_retain(qword_288F8);
  uint64_t v24 = StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)( v110,  0LL,  0LL,  &_swiftEmptyArrayStorage,  3.0,  10.0,  0.0);
  double v25 = *(double *)v110;
  uint64_t v26 = v110[1];
  uint64_t v27 = v110[2];
  uint64_t v101 = v110[3];
  uint64_t v28 = v110[4];
  uint64_t v100 = static Alignment.center.getter(v24);
  uint64_t v99 = v29;
  uint64_t v30 = *((void *)a1 + 5);
  if (qword_28190 != -1) {
    swift_once(&qword_28190, sub_11678);
  }
  uint64_t v31 = qword_288F0;
  uint64_t v32 = swift_retain_n(qword_288F0, 2LL);
  uint64_t v33 = static Color.orange.getter(v32);
  uint64_t KeyPath = swift_getKeyPath(&unk_1F288);
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, enum case for LayoutDirection.leftToRight(_:), v16);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))((char *)v15 + *(int *)(v102 + 28), v19, v16);
  *int v15 = KeyPath;
  uint64_t v35 = *(int *)(v20 + 36);
  unint64_t v36 = v107;
  sub_1321C((uint64_t)v15, (uint64_t)v107 + v35, &qword_28930);
  *unint64_t v36 = v30;
  v36[1] = 0x4008000000000000LL;
  v36[2] = v31;
  v36[3] = v33;
  swift_retain(v31);
  swift_retain(v33);
  sub_13730((uint64_t)v15, &qword_28930);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  swift_release(v33);
  uint64_t v102 = v31;
  swift_release(v31);
  sub_131F0((uint64_t)v36, v108, &qword_28938);
  if (sub_12144())
  {
    uint64_t v37 = 1LL;
    uint64_t v38 = v105;
    uint64_t v39 = v104;
  }

  else
  {
    __int128 v111 = *a1;
    uint64_t v112 = *((void *)a1 + 2);
    uint64_t v40 = *((void *)&v111 + 1);
    uint64_t v114 = v111;
    sub_131F0((uint64_t)&v112, (uint64_t)&v113, &qword_28320);
    uint64_t v41 = (void *)*((void *)a1 + 4);
    uint64_t v42 = (_OWORD *)swift_allocObject(&unk_25AF0, 64LL, 7LL);
    __int128 v43 = a1[1];
    v42[1] = *a1;
    v42[2] = v43;
    _OWORD v42[3] = a1[2];
    __chkstk_darwin(v42);
    *(&v84 - 2) = (uint64_t)a1;
    sub_13030(&v114);
    swift_retain(v40);
    sub_13058(&v113);
    id v44 = v41;
    uint64_t v45 = sub_6FC0(&qword_28940);
    uint64_t v46 = sub_756C(&qword_28948);
    uint64_t v47 = sub_756C(&qword_28950);
    unint64_t v48 = sub_13080();
    sub_8F78(&qword_28980, &qword_28950);
    v109[0] = v46;
    v109[1] = v47;
    v109[2] = v48;
    v109[3] = v49;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v109,  &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>,  1LL);
    uint64_t v51 = v87;
    uint64_t v52 = Button.init(action:label:)(sub_1300C, v42, sub_13028, &v84 - 4, v45, OpaqueTypeConformance2);
    uint64_t v53 = v92;
    PlainButtonStyle.init()(v52);
    sub_8F78(&qword_28988, &qword_28908);
    uint64_t v55 = v54;
    sub_78F8(&qword_28990, (uint64_t (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    __int128 v56 = v86;
    uint64_t v57 = v91;
    uint64_t v58 = v94;
    View.buttonStyle<A>(_:)(v53, v91, v94, v55, v59);
    (*(void (**)(char *, uint64_t))(v93 + 8))(v53, v58);
    (*(void (**)(char *, uint64_t))(v89 + 8))(v51, v57);
    uint64_t v60 = v88;
    uint64_t v61 = (uint64_t)v96;
    uint64_t v62 = v90;
    (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v96, v56, v90);
    *(_BYTE *)(v61 + *(int *)(v85 + 36)) = 0;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v56, v62);
    char v63 = v98;
    char v64 = &v98[*(int *)(v97 + 20)];
    uint64_t v65 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v66 = type metadata accessor for RoundedCornerStyle(0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v66 - 8) + 104LL))(v64, v65, v66);
    __asm { FMOV            V0.2D, #25.0 }

    *char v63 = _Q0;
    uint64_t v39 = v104;
    uint64_t v72 = (uint64_t)v95;
    uint64_t v73 = (uint64_t)&v95[*(int *)(v104 + 36)];
    sub_13170((uint64_t)v63, v73);
    *(_WORD *)(v73 + *(int *)(sub_6FC0(&qword_28998) + 36)) = 256;
    sub_1321C(v61, v72, &qword_28918);
    sub_131B4((uint64_t)v63);
    sub_13730(v61, &qword_28918);
    uint64_t v74 = v72;
    uint64_t v38 = v105;
    sub_131F0(v74, v105, &qword_28920);
    uint64_t v37 = 0LL;
  }

  _s13TimerUIPlugin19SiriTimePluginModelOwst_0(v38, v37, 1LL, v39);
  uint64_t v75 = v108;
  uint64_t v76 = (uint64_t)v107;
  sub_1321C(v108, (uint64_t)v107, &qword_28938);
  uint64_t v77 = v106;
  sub_1321C(v38, v106, &qword_28928);
  *(double *)a2 = v25 * 0.5;
  *(double *)(a2 + 8) = v25;
  *(void *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v27;
  uint64_t v78 = v101;
  *(void *)(a2 + 32) = v101;
  *(void *)(a2 + 40) = v28;
  uint64_t v79 = v103;
  *(void *)(a2 + 48) = v103;
  *(_WORD *)(a2 + 56) = 256;
  uint64_t v80 = v99;
  *(void *)(a2 + 64) = v100;
  *(void *)(a2 + 72) = v80;
  *(void *)(a2 + 80) = v30;
  uint64_t v81 = v102;
  *(void *)(a2 + 88) = 0x4008000000000000LL;
  *(void *)(a2 + 96) = v81;
  *(_WORD *)(a2 + 104) = 256;
  uint64_t v82 = sub_6FC0(&qword_289A0);
  sub_1321C(v76, a2 + *(int *)(v82 + 64), &qword_28938);
  sub_1321C(v77, a2 + *(int *)(v82 + 80), &qword_28928);
  swift_retain_n(v81, 2LL);
  swift_bridgeObjectRetain_n(v78, 2LL);
  swift_retain_n(v79, 2LL);
  sub_13730(v38, &qword_28928);
  sub_13730(v75, &qword_28938);
  swift_release(v79);
  swift_bridgeObjectRelease(v78);
  swift_release(v81);
  sub_13730(v77, &qword_28928);
  sub_13730(v76, &qword_28938);
  swift_release(v79);
  swift_bridgeObjectRelease(v78);
  return swift_release(v81);
}

uint64_t sub_120C8(uint64_t a1)
{
  __int128 v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.layoutDirection.setter(v3);
}

BOOL sub_12144()
{
  __int128 v7 = *v0;
  uint64_t v8 = *((void *)v0 + 2);
  sub_6FC0(&qword_289A8);
  Binding.wrappedValue.getter(&v9);
  id v1 = v9;
  if (v9)
  {
    objc_msgSend(v9, "remainingTime", v7, v8);
    double v3 = v2;

    if (v3 == 0.0) {
      return 1LL;
    }
  }

  Binding.wrappedValue.getter(&v9);
  id v5 = v9;
  if (!v9) {
    return 0LL;
  }
  uint64_t v6 = (char *)[v9 state];

  return v6 == (_BYTE *)&dword_0 + 1;
}

void sub_12224()
{
  if (qword_28188 != -1) {
    swift_once(&qword_28188, sub_11604);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  sub_6D9C(v1, (uint64_t)qword_288D8);
  __int128 v58 = *v0;
  uint64_t v59 = (void (*)(uint64_t, void *))*((void *)v0 + 2);
  uint64_t v2 = *((void *)&v58 + 1);
  v61[0] = v58;
  sub_131F0((uint64_t)&v59, (uint64_t)&v60, &qword_28320);
  double v3 = (void *)*((void *)v0 + 4);
  sub_13030(v61);
  swift_retain(*((void *)&v58 + 1));
  sub_13058(&v60);
  id v4 = v3;
  sub_13030(v61);
  swift_retain(*((void *)&v58 + 1));
  sub_13058(&v60);
  id v5 = v4;
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    id v9 = (void *)swift_slowAlloc(32LL, -1LL);
    v55[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    __int128 aBlock = v58;
    uint64_t v51 = v59;
    sub_6FC0(&qword_289A8);
    Binding.wrappedValue.getter(&v57);
    id v10 = v57;
    if (v57)
    {
      id v11 = [v57 timerIDString];

      id v10 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      uint64_t v13 = v12;
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    *(void *)&__int128 aBlock = v10;
    *((void *)&aBlock + 1) = v13;
    uint64_t v14 = sub_6FC0(&qword_28328);
    uint64_t v15 = String.init<A>(describing:)(&aBlock, v14);
    unint64_t v17 = v16;
    *(void *)&__int128 aBlock = sub_1C5A4(v15, v16, (uint64_t *)v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 8, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v17);
    sub_137AC(v61);
    swift_release(v2);
    sub_137D4(&v60);

    sub_137AC(v61);
    swift_release(v2);
    sub_137D4(&v60);

    _os_log_impl(&dword_0, v6, v7, "[TimerProgressView.onButtonTap] Button tap detected for timer %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    sub_137AC(v61);
    swift_release(*((void *)&v58 + 1));
    sub_137D4(&v60);

    sub_137AC(v61);
    swift_release(*((void *)&v58 + 1));
    sub_137D4(&v60);
  }

  *(_OWORD *)uint64_t v55 = v58;
  __int128 v56 = v59;
  uint64_t v18 = sub_6FC0(&qword_289A8);
  uint64_t v19 = (uint64_t)Binding.wrappedValue.getter(&v57);
  id v20 = v57;
  if (v57
    && (id v21 = [v57 mutableCopy],
        v20,
        _bridgeAnyObjectToAny(_:)(&aBlock, v21),
        swift_unknownObjectRelease(v21),
        unint64_t v22 = sub_137FC(),
        uint64_t v19 = swift_dynamicCast(v55, &aBlock, (char *)&type metadata for Any + 8, v22, 6LL),
        (v19 & 1) != 0))
  {
    id v23 = v55[0];
    uint64_t v24 = (char *)[v55[0] state];
    if (v24 == (_BYTE *)&dword_0 + 2)
    {
      [v23 setState:3];
    }

    else if (v24 == (_BYTE *)&dword_0 + 3)
    {
      [v23 setState:2];
    }

    else
    {
      uint64_t v28 = (os_log_s *)Logger.logObject.getter(v24);
      os_log_type_t v29 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl( &dword_0,  v28,  v29,  "[TimerProgressView.onButtonTap] Timer is in Stopped or Unknown state, so it must be firing! Taking no action.",  v30,  2u);
        swift_slowDealloc(v30, -1LL, -1LL);
      }
    }

    id v31 = v23;
    uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v49 = v18;
      *(void *)&__int128 aBlock = swift_slowAlloc(32LL, -1LL);
      uint64_t v35 = aBlock;
      *(_DWORD *)uint64_t v34 = 136315138;
      v55[0] = [v31 state];
      type metadata accessor for MTTimerState(0LL);
      uint64_t v37 = String.init<A>(describing:)(v55, v36);
      unint64_t v39 = v38;
      v55[0] = (id)sub_1C5A4(v37, v38, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v55, &v55[1], v34 + 4, v34 + 12);

      swift_bridgeObjectRelease(v39);
      _os_log_impl(&dword_0, v32, v33, "[TimerProgressView.onButtonTap] Updating timer to new state: %s", v34, 0xCu);
      swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v40 = v35;
      uint64_t v18 = v49;
      swift_slowDealloc(v40, -1LL, -1LL);
      swift_slowDealloc(v34, -1LL, -1LL);
    }

    else
    {
    }

    id v41 = [v5 updateTimer:v31];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v53 = sub_12CB8;
      uint64_t v54 = 0LL;
      *(void *)&__int128 aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256LL;
      uint64_t v51 = sub_12D84;
      uint64_t v52 = &unk_25B08;
      __int128 v43 = _Block_copy(&aBlock);
      id v44 = [v42 addSuccessBlock:v43];
      _Block_release(v43);

      uint64_t v53 = sub_12D88;
      uint64_t v54 = 0LL;
      *(void *)&__int128 aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256LL;
      uint64_t v51 = sub_12D84;
      uint64_t v52 = &unk_25B30;
      uint64_t v45 = _Block_copy(&aBlock);
      uint64_t v46 = (os_log_s *)[v42 addFailureBlock:v45];
      _Block_release(v45);
    }

    else
    {
      uint64_t v46 = (os_log_s *)Logger.logObject.getter(0LL);
      os_log_type_t v47 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v46, v47))
      {
        unint64_t v48 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)unint64_t v48 = 0;
        _os_log_impl( &dword_0,  v46,  v47,  "[TimerProgressView.onButtonTap] No timerUpdateFuture created. Unclear if timer got updated!",  v48,  2u);
        swift_slowDealloc(v48, -1LL, -1LL);
      }
    }

    __int128 aBlock = v58;
    uint64_t v51 = v59;
    v55[0] = v31;
    Binding.wrappedValue.setter(v55, v18);
  }

  else
  {
    double v25 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl( &dword_0,  v25,  v26,  "[TimerProgressView.onButtonTap] Failed to get mutable timer from MT - Cannot update timer!",  v27,  2u);
      swift_slowDealloc(v27, -1LL, -1LL);
    }
  }

uint64_t sub_12990@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_6FC0(&qword_28950);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_6FC0(&qword_28940);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __dst[0] = *(_OWORD *)a1;
  *(void *)&__dst[1] = *(void *)(a1 + 16);
  sub_6FC0(&qword_289A8);
  Binding.wrappedValue.getter(v31);
  id v11 = v31[0];
  if (v31[0])
  {
    uint64_t v12 = (char *)[v31[0] state];
  }

  else
  {
    uint64_t v12 = *(char **)(a1 + 24);
  }

  if (v12 == (_BYTE *)&dword_0 + 2) {
    uint64_t v13 = 0x6C69662E79616C70LL;
  }
  else {
    uint64_t v13 = 0x69662E6573756170LL;
  }
  if (v12 == (_BYTE *)&dword_0 + 2) {
    unint64_t v14 = 0xE90000000000006CLL;
  }
  else {
    unint64_t v14 = 0xEA00000000006C6CLL;
  }
  uint64_t v15 = Image.init(systemName:)(v13, v14);
  if (qword_28190 != -1) {
    swift_once(&qword_28190, sub_11678);
  }
  uint64_t v16 = qword_288F0;
  uint64_t KeyPath = swift_getKeyPath(&unk_1F2B8);
  uint64_t v18 = swift_retain(v16);
  uint64_t v19 = static Alignment.center.getter(v18);
  sub_1B160(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v31, 0.0, 1, INFINITY, 0, v19, v20, v15, KeyPath, v16);
  swift_release(v16);
  swift_release(KeyPath);
  swift_release(v15);
  memcpy(v30, v31, sizeof(v30));
  uint64_t v21 = enum case for DynamicTypeSize.accessibility3(_:);
  uint64_t v22 = type metadata accessor for DynamicTypeSize(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104LL))(v6, v21, v22);
  sub_78F8(&qword_289B0, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)(v6, v6, v22, v23);
  if ((result & 1) != 0)
  {
    uint64_t v25 = sub_6FC0(&qword_28948);
    unint64_t v26 = sub_13080();
    uint64_t v29 = v7;
    sub_8F78(&qword_28980, &qword_28950);
    View.dynamicTypeSize<A>(_:)(v6, v25, v4, v26, v27);
    sub_13730((uint64_t)v6, &qword_28950);
    memcpy(__dst, v30, 0x88uLL);
    sub_13768((uint64_t *)__dst);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v29);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_12CB8()
{
  if (qword_28188 != -1) {
    swift_once(&qword_28188, sub_11604);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_6D9C(v0, (uint64_t)qword_288D8);
  oslog = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    double v3 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)double v3 = 0;
    _os_log_impl(&dword_0, oslog, v2, "[TimerProgressView.onButtonTap] timerUpdateFuture success block called.", v3, 2u);
    swift_slowDealloc(v3, -1LL, -1LL);
  }
}

void sub_12D88(uint64_t a1)
{
  if (qword_28188 != -1) {
    swift_once(&qword_28188, sub_11604);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_6D9C(v2, (uint64_t)qword_288D8);
  uint64_t v3 = swift_errorRetain(a1);
  oslog = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v5 = 138412290;
    uint64_t v7 = _convertErrorToNSError(_:)(a1);
    uint64_t v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v5 + 4, v5 + 12);
    *uint64_t v6 = v7;
    swift_errorRelease(a1);
    _os_log_impl( &dword_0,  oslog,  v4,  "[TimerProgressView.onButtonTap] timerUpdateFuture failure block called with error: %@",  v5,  0xCu);
    uint64_t v8 = sub_6FC0(&qword_289C0);
    swift_arrayDestroy(v6, 1LL, v8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(a1);
  }

void sub_12F28(uint64_t a1, void *a2)
{
  os_log_type_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

void sub_12F78(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void sub_12FB0()
{
}

uint64_t sub_12FD0()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

void sub_1300C()
{
}

uint64_t sub_13028@<X0>(uint64_t a1@<X8>)
{
  return sub_12990(*(void *)(v1 + 16), a1);
}

void *sub_13030(void *a1)
{
  return a1;
}

id *sub_13058(id *a1)
{
  id v2 = *a1;
  return a1;
}

unint64_t sub_13080()
{
  unint64_t result = qword_28958;
  if (!qword_28958)
  {
    uint64_t v1 = sub_756C(&qword_28948);
    sub_130EC();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_28958);
  }

  return result;
}

unint64_t sub_130EC()
{
  unint64_t result = qword_28960;
  if (!qword_28960)
  {
    uint64_t v1 = sub_756C(&qword_28968);
    sub_8F78(&qword_28970, &qword_28978);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_28960);
  }

  return result;
}

uint64_t sub_13170(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_131B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_131F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_13CF4(a1, a2, a3);
  sub_13D04(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_905C();
}

void sub_1321C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_13CF4(a1, a2, a3);
  sub_13D04(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_905C();
}

double sub_13248@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void (**a3)(uint64_t a1@<X8>)@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10 = swift_allocObject(&unk_25C70, 48LL, 7LL);
  *(double *)(v10 + 16) = a4;
  *(double *)(v10 + 24) = a5;
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  *a3 = sub_13B9C;
  a3[1] = (void (*)(uint64_t@<X8>))v10;
  swift_retain(a1);
  *(void *)&double result = swift_retain(a2).n128_u64[0];
  return result;
}

void sub_132B8(uint64_t a1@<X2>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  double v9 = GeometryProxy.size.getter() * 0.5;
  double v10 = v8 * 0.5;
  if (v8 * 0.5 >= v9) {
    double v11 = v9;
  }
  else {
    double v11 = v8 * 0.5;
  }
  double v12 = v10 - v11;
  uint64_t v13 = swift_retain(a1);
  double v14 = static UnitPoint.center.getter(v13);
  *(double *)a2 = a4;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = v9 - a4 * 0.5;
  *(double *)(a2 + 24) = v12;
  *(void *)(a2 + 32) = a1;
  *(_WORD *)(a2 + 40) = 256;
  *(double *)(a2 + 48) = a4;
  *(double *)(a2 + 56) = a4;
  *(double *)(a2 + 64) = v9;
  *(double *)(a2 + 72) = v12;
  *(_WORD *)(a2 + 80) = 0;
  *(double *)(a2 + 88) = a3 * 3.14159265 + a3 * 3.14159265;
  *(double *)(a2 + 96) = v14;
  *(void *)(a2 + 104) = v15;
}

double sub_1336C@<D0>(void (**a1)(uint64_t a1@<X8>)@<X8>)
{
  return sub_13248(*(void *)(v1 + 16), *(void *)(v1 + 24), a1, *(double *)v1, *(double *)(v1 + 8));
}

double sub_13378@<D0>(uint64_t a1@<X8>, double a2@<D5>)
{
  v39.origin.x = sub_13CE0();
  double MidX = CGRectGetMidX(v39);
  v40.origin.x = sub_13CE0();
  double MidY = CGRectGetMidY(v40);
  v41.origin.x = sub_13CE0();
  double Width = CGRectGetWidth(v41);
  v42.origin.x = sub_13CE0();
  double Height = CGRectGetHeight(v42);
  if (Height >= Width) {
    double Height = Width;
  }
  v37[0] = 0x3FF0000000000000LL;
  v37[1] = 0LL;
  void v37[2] = 0LL;
  v37[3] = 0x3FF0000000000000LL;
  v37[4] = 0LL;
  v37[5] = 0LL;
  v7.n128_f64[0] = (Height - a2) * 0.5;
  Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)(0LL, v37, MidX, MidY, v7);
  v35[0] = v28;
  v35[1] = v29;
  char v36 = v30;
  sub_13BA8((uint64_t)v35, (uint64_t)v38);
  sub_13C24((uint64_t)v38, (void (*)(void, void, void, void, void))sub_13BE4);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)( &v31,  1LL,  0LL,  &_swiftEmptyArrayStorage,  a2,  10.0,  0.0);
  Path.strokedPath(_:)(v33, &v31);
  uint64_t v8 = sub_13BFC((uint64_t)&v31);
  sub_13D10( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  *(uint64_t *)&MidX,  v28,  *((uint64_t *)&v28 + 1),  v29,  *((uint64_t *)&v29 + 1),  v30,  v31,  v32);
  sub_13D10( v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v27,  v28,  *((uint64_t *)&v28 + 1),  v29,  *((uint64_t *)&v29 + 1),  v30,  v31,  v32);
  double result = *(double *)v33;
  __int128 v25 = v33[1];
  *(_OWORD *)a1 = v33[0];
  *(_OWORD *)(a1 + 16) = v25;
  *(_BYTE *)(a1 + 32) = v34;
  return result;
}

void sub_13510(double a1, double a2)
{
  *uint64_t v2 = a1;
  v2[1] = a2;
}

double sub_13518@<D0>(uint64_t a1@<X8>)
{
  double result = *(double *)v5;
  __int128 v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_13564()
{
  return Shape.sizeThatFits(_:)();
}

TimerUIPlugin::TimerSnippetModel sub_1357C@<X0>(Swift::OpaquePointer a1@<X0>, void *a2@<X8>)
{
  result.timers._rawValue = TimerSnippetModel.init(timers:)(a1).timers._rawValue;
  *a2 = v4;
  a2[1] = v5;
  return result;
}

void sub_135A4(double *a1)
{
}

void (*sub_135AC(void *a1))(double *a1)
{
  a1[2] = v1;
  TimerSnippetModel.init(timers:)((Swift::OpaquePointer)a1);
  *a1 = v3;
  a1[1] = v4;
  return sub_135E4;
}

void sub_135E4(double *a1)
{
}

uint64_t sub_13608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_13C70();
  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_13658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_13C70();
  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_136A8(uint64_t a1)
{
  unint64_t v2 = sub_13C70();
  return Shape.body.getter(a1, v2);
}

void sub_136E0(void *a1@<X8>)
{
  *a1 = EnvironmentValues.foregroundColor.getter();
  sub_905C();
}

uint64_t sub_13704(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

void sub_13730(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_6FC0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_905C();
}

uint64_t *sub_13768(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[2];
  swift_release(a1[1]);
  swift_release(v2);
  swift_release(v3);
  return a1;
}

void *sub_137AC(void *a1)
{
  return a1;
}

id *sub_137D4(id *a1)
{
  return a1;
}

unint64_t sub_137FC()
{
  unint64_t result = qword_289B8;
  if (!qword_289B8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___MTMutableTimer);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_289B8);
  }

  return result;
}

uint64_t sub_13838(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_13848(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_13850(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 24));
}

uint64_t sub_13878(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

void *sub_138B4(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = a2[2];
  uint64_t v5 = a1[2];
  a1[2] = v4;
  swift_retain(v4);
  swift_release(v5);
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[3] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

__n128 sub_13920(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1392C(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release(*(void *)(a1 + 16));
  uint64_t v4 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release(v4);
  return a1;
}

uint64_t sub_13970(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t sub_139B0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 32) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for EndCap()
{
}

__n128 sub_139FC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_13A08(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_13A28(uint64_t result, int a2, int a3)
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

void type metadata accessor for RingArc()
{
}

void sub_13A5C()
{
}

void sub_13A88()
{
}

void sub_13AB4()
{
}

unint64_t sub_13AE4()
{
  unint64_t result = qword_289F8;
  if (!qword_289F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F348, &unk_25C48);
    atomic_store(result, (unint64_t *)&qword_289F8);
  }

  return result;
}

unint64_t sub_13B24()
{
  unint64_t result = qword_28A00;
  if (!qword_28A00)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F2F8, &unk_25C48);
    atomic_store(result, (unint64_t *)&qword_28A00);
  }

  return result;
}

uint64_t sub_13B60(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_22180, 1LL);
}

uint64_t sub_13B70()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_13B9C(uint64_t a1@<X8>)
{
}

uint64_t sub_13BA8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_13BE4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  return result;
}

uint64_t sub_13BFC(uint64_t a1)
{
  return a1;
}

void sub_13C24(uint64_t a1, void (*a2)(void, void, void, void, void))
{
}

uint64_t sub_13C58(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  return result;
}

unint64_t sub_13C70()
{
  unint64_t result = qword_28A08;
  if (!qword_28A08)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F398, &unk_25C48);
    atomic_store(result, (unint64_t *)&qword_28A08);
  }

  return result;
}

void sub_13CAC()
{
}

double sub_13CE0()
{
  return v0;
}

uint64_t sub_13CF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_6FC0(a3);
}

uint64_t sub_13D04@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

void sub_13D10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

uint64_t sub_13D1C()
{
  uint64_t result = swift_allocObject(v0, 32LL, 7LL);
  *(void *)(result + 16) = 0xD000000000000015LL;
  *(void *)(result + 24) = 0x800000000001FAB0LL;
  return result;
}

Swift::Int sub_13D58(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

Swift::Int sub_13D9C()
{
  return sub_13D58(*v0);
}

BOOL sub_13DB4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_25180, v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

uint64_t sub_13DF8(uint64_t a1, void *a2)
{
  v13._countAndFlagsBits = a1;
  v13._object = a2;
  if (sub_13DB4(v13))
  {
    unint64_t v5 = sub_14264();
    uint64_t v6 = swift_allocError(&type metadata for TimerUIPlugin.Error, v5, 0LL, 0LL);
    *uint64_t v7 = 0;
    return swift_willThrow(v6);
  }

  else
  {
    unint64_t v10 = *(void *)(v2 + 16);
    unint64_t v9 = *(void *)(v2 + 24);
    swift_bridgeObjectRetain(v9);
    sub_1B4A8(v10, v9, v12);
    unint64_t v11 = sub_142A0();
    return AnyView.init<A>(_:)(v12, &type metadata for TimerDurationViewLegacy, v11);
  }

uint64_t sub_13EB0()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for TimerUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC13TimerUIPlugin13TimerUIPlugin);
}

void sub_13EF4()
{
}

uint64_t sub_13F20(uint64_t a1, void *a2)
{
  return sub_13DF8(a1, a2);
}

uint64_t sub_13F40(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ComposeTimerSnippet(0LL);
  sub_9030();
  __chkstk_darwin(v3);
  sub_9020();
  uint64_t v6 = (void *)(v5 - v4);
  uint64_t v7 = type metadata accessor for TimerSelector(0LL);
  sub_9030();
  __chkstk_darwin(v8);
  sub_9020();
  uint64_t v11 = v10 - v9;
  type metadata accessor for TimerSelectorModel(0LL);
  sub_9030();
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v50 - v16;
  uint64_t v18 = type metadata accessor for SiriTimePluginModel(0LL);
  sub_9030();
  __chkstk_darwin(v19);
  sub_9020();
  uint64_t v22 = v21 - v20;
  sub_14320(a1, v21 - v20, v23);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v22, v18);
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_142DC(v22, (uint64_t)v17);
      sub_14320((uint64_t)v17, (uint64_t)v15, type metadata accessor for TimerSelectorModel);
      sub_48AC( (uint64_t)v15,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v50,  *((uint64_t *)&v50 + 1),  v51,  *((uint64_t *)&v51 + 1),  v52,  *((uint64_t *)&v52 + 1),  v53,  *((uint64_t *)&v53 + 1),  v54,  *((uint64_t *)&v54 + 1),  v55,  *((uint64_t *)&v55 + 1));
      sub_14360(&qword_28AE0, type metadata accessor for TimerSelector, (uint64_t)"Up");
      uint64_t v33 = View.eraseToAnyView()(v7, v32);
      sub_1439C(v11, type metadata accessor for TimerSelector);
      uint64_t v34 = (uint64_t)v17;
      uint64_t v35 = type metadata accessor for TimerSelectorModel;
    }

    else
    {
      __int128 v40 = *(_OWORD *)v22;
      __int128 v51 = *(_OWORD *)(v22 + 16);
      __int128 v52 = v40;
      __int128 v50 = *(_OWORD *)(v22 + 32);
      uint64_t v41 = *(void *)(v22 + 48);
      uint64_t v42 = *(void *)(v22 + 56);
      uint64_t v43 = type metadata accessor for Context(0LL);
      sub_14360( &qword_281C0,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
      *uint64_t v6 = EnvironmentObject.init()(v43, v44);
      v6[1] = v45;
      _s13TimerUIPlugin07ComposeA7SnippetV20_interactionDelegate33_72C0F54402B260C409E0864AF7B13339LL0D2UI011InteractionF0Vvpfi_0();
      uint64_t v46 = (char *)v6 + *(int *)(v2 + 24);
      __int128 v47 = v51;
      *(_OWORD *)uint64_t v46 = v52;
      *((_OWORD *)v46 + 1) = v47;
      *((_OWORD *)v46 + 2) = v50;
      *((void *)v46 + 6) = v41;
      *((void *)v46 + 7) = v42;
      sub_14360( &qword_28AD8,  type metadata accessor for ComposeTimerSnippet,  (uint64_t)&protocol conformance descriptor for ComposeTimerSnippet);
      uint64_t v33 = View.eraseToAnyView()(v2, v48);
      uint64_t v34 = (uint64_t)v6;
      uint64_t v35 = type metadata accessor for ComposeTimerSnippet;
    }

    sub_1439C(v34, v35);
  }

  else
  {
    uint64_t v36 = *(void *)v22;
    uint64_t v37 = *(void *)(v52 + 16);
    uint64_t v38 = *(void *)(v52 + 24);
    swift_bridgeObjectRetain(v38);
    sub_14580(v36, v37, v38, v57);
    __int128 v53 = v57[0];
    __int128 v54 = v57[1];
    __int128 v55 = v57[2];
    uint64_t v56 = v58;
    unint64_t v39 = sub_143D4();
    uint64_t v33 = View.eraseToAnyView()(&type metadata for TimerSnippet, v39);
    sub_14410((uint64_t)v57);
  }

  return v33;
}

uint64_t sub_14220@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_13D1C();
  *a1 = result;
  return result;
}

uint64_t sub_14244(uint64_t a1)
{
  return sub_13F40(a1);
}

unint64_t sub_14264()
{
  unint64_t result = qword_28AC8;
  if (!qword_28AC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F540, &type metadata for TimerUIPlugin.Error);
    atomic_store(result, (unint64_t *)&qword_28AC8);
  }

  return result;
}

unint64_t sub_142A0()
{
  unint64_t result = qword_28AD0;
  if (!qword_28AD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F7E8, &type metadata for TimerDurationViewLegacy);
    atomic_store(result, (unint64_t *)&qword_28AD0);
  }

  return result;
}

uint64_t sub_142DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimerSelectorModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_14320(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  sub_905C();
}

void sub_14360(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_905C();
}

void sub_1439C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_905C();
}

unint64_t sub_143D4()
{
  unint64_t result = qword_28AE8;
  if (!qword_28AE8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F59C, &type metadata for TimerSnippet);
    atomic_store(result, (unint64_t *)&qword_28AE8);
  }

  return result;
}

uint64_t sub_14410(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);

  return a1;
}

uint64_t storeEnumTagSinglePayload for TimerUIPlugin.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_144BC + 4 * byte_1F43D[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_144F0 + 4 * byte_1F438[v4]))();
}

uint64_t sub_144F0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_144F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x14500LL);
  }
  return result;
}

uint64_t sub_1450C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x14514LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_14518(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_14520(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TimerUIPlugin.Error()
{
  return &type metadata for TimerUIPlugin.Error;
}

unint64_t sub_14540()
{
  unint64_t result = qword_28AF0;
  if (!qword_28AF0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1F518, &type metadata for TimerUIPlugin.Error);
    atomic_store(result, (unint64_t *)&qword_28AF0);
  }

  return result;
}

void sub_14580(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = type metadata accessor for Context(0LL);
  sub_78F8(&qword_281C0, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  uint64_t v9 = (void *)EnvironmentObject.init()(v7, v8);
  uint64_t v11 = v10;
  id v12 = objc_allocWithZone(&OBJC_CLASS___MTTimerManager);
  id v13 = v9;
  id v14 = [v12 init];
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = qword_281A0;
  id v17 = v14;
  if (v16 != -1) {
    swift_once(&qword_281A0, sub_147B4);
  }
  uint64_t v18 = type metadata accessor for Logger(0LL);
  uint64_t v19 = sub_6D9C(v18, (uint64_t)qword_28AF8);
  uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    id v27 = v13;
    uint64_t v22 = (uint8_t *)sub_91D0(12LL);
    *(_DWORD *)uint64_t v22 = 134217984;
    uint64_t v29 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v22 + 4, v22 + 12);
    _os_log_impl(&dword_0, v20, v21, "[TimerSnippet.init] Initializing for %ld timers.", v22, 0xCu);
    uint64_t v23 = (uint64_t)v22;
    id v13 = v27;
    sub_9128(v23);
  }

  sub_188BC();
  sub_18870();
  uint64_t v24 = sub_17A60(v17);
  if (v24) {
    uint64_t v25 = (void *)v24;
  }
  else {
    uint64_t v25 = &_swiftEmptyArrayStorage;
  }
  uint64_t v29 = (uint64_t)v9;
  v30[0] = v11;
  v30[1] = a1;
  v30[2] = a2;
  v30[3] = a3;
  v30[4] = v25;
  v30[5] = v17;
  id v26 = v13;
  sub_188BC();
  sub_18870();
  swift_bridgeObjectRetain(v25);

  swift_bridgeObjectRelease(a1);
  swift_bridgeObjectRelease(a3);
  sub_14828(v15);

  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a1);

  *a4 = v9;
  a4[1] = v11;
  a4[2] = a1;
  a4[3] = a2;
  a4[4] = a3;
  a4[5] = v25;
  a4[6] = v17;
}

uint64_t sub_147B4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_6E94(v0, qword_28AF8);
  sub_6D9C(v0, (uint64_t)qword_28AF8);
  return Logger.init(subsystem:category:)( 0xD000000000000013LL,  0x800000000001F8A0LL,  0x495572656D6974LL,  0xE700000000000000LL);
}

void sub_14828(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v12 = v3;
  if ((unint64_t)v3 >> 62)
  {
    if (v3 >= 0) {
      uint64_t v10 = v3 & 0xFFFFFFFFFFFFFF8LL;
    }
    else {
      uint64_t v10 = v3;
    }
    swift_bridgeObjectRetain(v3);
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v10);
    sub_17FE8(&v12);
  }

  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFF8LL));
  }

  if (v4 != a1)
  {
    if (qword_281A0 != -1) {
      swift_once(&qword_281A0, sub_147B4);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    uint64_t v6 = sub_6D9C(v5, (uint64_t)qword_28AF8);
    uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc(22LL, -1LL);
      *(_DWORD *)uint64_t v9 = 134218240;
      uint64_t v11 = v4;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v9 + 4, v9 + 12);
      *(_WORD *)(v9 + 12) = 2048;
      uint64_t v11 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v9 + 14, v9 + 22);
      _os_log_impl(&dword_0, v7, v8, "[TimerSnippet.init] timerManager %ld timers != %ld", (uint8_t *)v9, 0x16u);
      swift_slowDealloc(v9, -1LL, -1LL);
    }
  }

void sub_14998()
{
  uint64_t v101 = v4;
  uint64_t v102 = sub_6FC0(&qword_28B10);
  sub_9030();
  __chkstk_darwin(v5);
  sub_9040();
  uint64_t v93 = v6;
  uint64_t v94 = type metadata accessor for SashStandardView(0LL);
  uint64_t v89 = *(void *)(v94 - 8);
  sub_10CF0();
  uint64_t v8 = __chkstk_darwin(v7);
  __int128 v86 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  v96 = (char *)&v82 - v10;
  uint64_t v99 = sub_6FC0(&qword_28B18);
  sub_9030();
  __chkstk_darwin(v11);
  sub_9040();
  uint64_t v100 = v12;
  uint64_t v13 = type metadata accessor for ComponentStackBottomSpacing(0LL);
  uint64_t v91 = *(void *)(v13 - 8);
  uint64_t v92 = v13;
  sub_10CF0();
  __chkstk_darwin(v14);
  sub_9040();
  uint64_t v90 = v15;
  uint64_t v16 = type metadata accessor for ColorScheme(0LL);
  uint64_t v87 = *(void *)(v16 - 8);
  uint64_t v88 = v16;
  sub_10CF0();
  __chkstk_darwin(v17);
  sub_9040();
  uint64_t v19 = v18;
  sub_6FC0(&qword_28B20);
  sub_9030();
  __chkstk_darwin(v20);
  sub_9020();
  uint64_t v23 = (void *)(v22 - v21);
  uint64_t v24 = sub_6FC0(&qword_28B28);
  uint64_t v95 = *(void *)(v24 - 8);
  sub_10CF0();
  uint64_t v26 = __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v82 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v26);
  uint64_t v30 = (char *)&v82 - v29;
  uint64_t v84 = sub_6FC0(&qword_28B30);
  uint64_t v83 = *(void *)(v84 - 8);
  sub_10CF0();
  __chkstk_darwin(v31);
  sub_10DB0();
  uint64_t v97 = sub_6FC0(&qword_28B38);
  sub_9030();
  __chkstk_darwin(v32);
  sub_10F18();
  uint64_t v98 = sub_6FC0(&qword_28B40);
  uint64_t v85 = *(void *)(v98 - 8);
  sub_10CF0();
  __chkstk_darwin(v33);
  sub_1884C();
  uint64_t v35 = __chkstk_darwin(v34);
  uint64_t v37 = (char *)&v82 - v36;
  if ((static RFFeatureFlags.ResponseFramework.SMART.getter(v35) & 1) != 0)
  {
    uint64_t v38 = sub_18840((uint64_t)&unk_25F38);
    sub_18818(v38);
    uint64_t v39 = sub_6FC0(&qword_28B48);
    unint64_t v40 = sub_17E00();
    uint64_t v41 = ComponentStack.init(content:)(sub_17FA8, v38, v39, v40);
    *uint64_t v23 = static Color.black.getter(v41);
    uint64_t v42 = enum case for HostBackground.color(_:);
    uint64_t v43 = type metadata accessor for HostBackground(0LL);
    sub_188B4((uint64_t)v23, v42, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104LL));
    _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v23, 0LL, 1LL, v43);
    sub_8F78(&qword_28B70, &qword_28B28);
    View.setHostBackground(_:)(v23, v24, v44);
    sub_7F08((uint64_t)v23, &qword_28B20);
    (*(void (**)(char *, uint64_t))(v95 + 8))(v30, v24);
    uint64_t KeyPath = swift_getKeyPath(&unk_1F5F0);
    uint64_t v47 = v87;
    uint64_t v46 = v88;
    (*(void (**)(uint64_t, void, uint64_t))(v87 + 104))(v19, enum case for ColorScheme.dark(_:), v88);
    uint64_t v48 = v97;
    uint64_t v49 = (uint64_t *)(v2 + *(int *)(v97 + 36));
    uint64_t v50 = sub_6FC0(&qword_282A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))((char *)v49 + *(int *)(v50 + 28), v19, v46);
    *uint64_t v49 = KeyPath;
    uint64_t v51 = v83;
    uint64_t v52 = v84;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v2, v1, v84);
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v19, v46);
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v1, v52);
    uint64_t v54 = v90;
    uint64_t v53 = v91;
    sub_188B4( v90,  enum case for ComponentStackBottomSpacing.none(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v91 + 104));
    unint64_t v55 = sub_17ED8();
    View.lastComponentBottomSpacing(_:)(v54, v48, v55);
    sub_188C4(v54, *(uint64_t (**)(uint64_t, uint64_t))(v53 + 8));
    sub_7F08(v2, &qword_28B38);
    uint64_t v56 = v85;
    uint64_t v57 = v98;
    (*(void (**)(char *, uint64_t, uint64_t))(v85 + 32))(v37, v3, v98);
    uint64_t v58 = v100;
    (*(void (**)(uint64_t, char *, uint64_t))(v56 + 16))(v100, v37, v57);
    swift_storeEnumTagMultiPayload(v58, v99, 0LL);
    uint64_t v103 = v48;
    unint64_t v104 = v55;
    uint64_t v59 = sub_18868( (uint64_t)&v103,  (uint64_t)&opaque type descriptor for <<opaque return type of View.lastComponentBottomSpacing(_:)>>);
    sub_8F78(&qword_28B78, &qword_28B10);
    _ConditionalContent<>.init(storage:)(v58, v57, v102, v59, v60);
    sub_188C4((uint64_t)v37, *(uint64_t (**)(uint64_t, uint64_t))(v56 + 8));
  }

  else
  {
    uint64_t v61 = *(void *)(v0 + 24);
    uint64_t v62 = *(void *)(v0 + 32);
    swift_bridgeObjectRetain(v62);
    char v63 = v96;
    SashStandardView.init(_:titleColor:showOnWatch:)(v61, v62, 0LL, 0LL);
    uint64_t v64 = sub_18840((uint64_t)&unk_25F10);
    sub_18818(v64);
    uint64_t v65 = sub_6FC0(&qword_28B48);
    unint64_t v66 = sub_17E00();
    ComponentStack.init(content:)(sub_17D68, v64, v65, v66);
    uint64_t v67 = v89;
    uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v89 + 16);
    unint64_t v69 = v86;
    uint64_t v70 = v63;
    uint64_t v71 = v94;
    v68(v86, v70, v94);
    uint64_t v72 = v95;
    uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v95 + 16);
    v73(v28, v30, v24);
    uint64_t v74 = v93;
    v68((char *)v93, v69, v71);
    uint64_t v75 = sub_6FC0(&qword_28B60);
    v73((char *)(v74 + *(int *)(v75 + 48)), v28, v24);
    uint64_t v76 = *(void (**)(char *, uint64_t))(v72 + 8);
    v76(v28, v24);
    uint64_t v77 = *(void (**)(char *, uint64_t))(v67 + 8);
    v77(v69, v71);
    uint64_t v78 = v100;
    sub_10B94(v74, v100, &qword_28B10);
    swift_storeEnumTagMultiPayload(v78, v99, 1LL);
    unint64_t v79 = sub_17ED8();
    uint64_t v103 = v97;
    unint64_t v104 = v79;
    uint64_t v80 = sub_18868( (uint64_t)&v103,  (uint64_t)&opaque type descriptor for <<opaque return type of View.lastComponentBottomSpacing(_:)>>);
    sub_8F78(&qword_28B78, &qword_28B10);
    _ConditionalContent<>.init(storage:)(v78, v98, v102, v80, v81);
    sub_7F08(v74, &qword_28B10);
    v76(v30, v24);
    v77(v96, v71);
  }

  sub_9008();
}

uint64_t sub_15008@<X0>( uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>)
{
  id v89 = a6;
  id v90 = a3;
  uint64_t v86 = a4;
  uint64_t v87 = a5;
  sub_6FC0(&qword_28318);
  sub_9030();
  __chkstk_darwin(v11);
  sub_9020();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_9054();
  sub_9030();
  __chkstk_darwin(v16);
  sub_1884C();
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v81 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (uint64_t *)((char *)&v81 - v21);
  uint64_t v91 = 0LL;
  uint64_t v23 = sub_6FC0(&qword_28320);
  sub_9144(v23);
  *(_OWORD *)a7 = v93;
  sub_188D8(0.0);
  uint64_t v91 = v24;
  uint64_t v92 = v25;
  uint64_t v26 = sub_6FC0(&qword_28328);
  sub_9144(v26);
  uint64_t v27 = v94;
  *(_OWORD *)(a7 + 16) = v93;
  *(void *)(a7 + 32) = v27;
  if (qword_281A0 != -1) {
    swift_once(&qword_281A0, sub_147B4);
  }
  uint64_t v28 = type metadata accessor for Logger(0LL);
  sub_6D9C(v28, (uint64_t)qword_28AF8);
  sub_18334(a1, (uint64_t)v22, type metadata accessor for SiriTimerSnippetModel);
  uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v31 = static os_log_type_t.default.getter();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v88 = v20;
  if (v32)
  {
    uint64_t v82 = v15;
    uint64_t v33 = (uint8_t *)sub_91D0(12LL);
    uint64_t v34 = sub_91D0(32LL);
    uint64_t v85 = a1;
    uint64_t v35 = v34;
    *(void *)&__int128 v93 = v34;
    uint64_t v83 = a2;
    uint64_t v84 = v14;
    *(_DWORD *)uint64_t v33 = 136315138;
    uint64_t v81 = v33 + 4;
    uint64_t v36 = v7;
    uint64_t v38 = *v22;
    unint64_t v37 = v22[1];
    sub_188BC();
    uint64_t v39 = v38;
    uint64_t v7 = v36;
    uint64_t v91 = sub_1C5A4(v39, v37, (uint64_t *)&v93);
    a2 = v83;
    uint64_t v14 = v84;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, &v92, v81, v33 + 12);
    unint64_t v40 = v37;
    uint64_t v15 = v82;
    swift_bridgeObjectRelease(v40);
    sub_7E54((uint64_t)v22, type metadata accessor for SiriTimerSnippetModel);
    _os_log_impl(&dword_0, v30, v31, "[TimerView.init] Initializing for timer with ID %s.", v33, 0xCu);
    swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v41 = v35;
    a1 = v85;
    sub_9128(v41);
    sub_9128((uint64_t)v33);
  }

  else
  {
    sub_7E54((uint64_t)v22, type metadata accessor for SiriTimerSnippetModel);
  }

  uint64_t v42 = (int *)sub_18838();
  sub_18334(a1, a7 + v42[7], type metadata accessor for SiriTimerSnippetModel);
  uint64_t v43 = (void *)(a7 + v42[8]);
  uint64_t v44 = v87;
  void *v43 = v86;
  v43[1] = v44;
  id v46 = v89;
  id v45 = v90;
  *(void *)(a7 + v42[10]) = v90;
  *(void *)(a7 + v42[9]) = v46;
  uint64_t v48 = *(void **)a7;
  uint64_t v47 = *(void *)(a7 + 8);
  *(void *)a7 = a2;
  *(void *)(a7 + 8) = 0LL;
  id v90 = v45;
  id v89 = v46;
  id v49 = a2;

  swift_release(v47);
  if (a2)
  {
    [v49 remainingTime];
    double v51 = v50;
  }

  else
  {
    double v51 = 0.0;
  }

  uint64_t v52 = (uint64_t)v88;
  sub_18334(a1, (uint64_t)v88, type metadata accessor for SiriTimerSnippetModel);
  if (a2)
  {
    sub_7E54(v52, type metadata accessor for SiriTimerSnippetModel);
    [v49 duration];
    double v54 = v53;
  }

  else
  {
    uint64_t v55 = v52 + *(int *)(v15 + 40);
    double v51 = *(double *)v55;
    uint64_t v56 = v52;
    int v57 = *(unsigned __int8 *)(v55 + 8);
    sub_7E54(v56, type metadata accessor for SiriTimerSnippetModel);
    double v54 = 0.0;
    if (v57) {
      double v51 = 0.0;
    }
  }

  sub_18334(a1, v7, type metadata accessor for SiriTimerSnippetModel);
  if (a2)
  {
    sub_7E54(v7, type metadata accessor for SiriTimerSnippetModel);
    *(double *)(a7 + 40) = v51 / v54;
    *(void *)(a7 + 48) = 0LL;
    id v58 = v49;
    uint64_t v59 = (char *)[v58 state];
    double v60 = 0.0;
    if (v59 != (_BYTE *)&dword_0 + 1) {
      objc_msgSend(v58, "remainingTime", 0.0);
    }
    sub_188D8(v60);
    uint64_t v62 = v61;
    a2 = v63;
  }

  else
  {
    uint64_t v64 = v7 + *(int *)(v15 + 36);
    double v65 = *(double *)v64;
    int v66 = *(unsigned __int8 *)(v64 + 8);
    sub_7E54(v7, type metadata accessor for SiriTimerSnippetModel);
    uint64_t v62 = 0LL;
    double v67 = 1.0;
    if (!v66) {
      double v67 = v65;
    }
    *(double *)(a7 + 40) = v51 / v67;
    *(void *)(a7 + 48) = 0LL;
    uint64_t v68 = a1 + *(int *)(v15 + 40);
    if ((*(_BYTE *)(v68 + 8) & 1) == 0)
    {
      sub_188D8(*(double *)v68);
      uint64_t v62 = v69;
      a2 = v70;
    }
  }

  swift_bridgeObjectRelease(*(void *)(a7 + 24));
  swift_release(*(void *)(a7 + 32));
  *(void *)(a7 + 16) = v62;
  *(void *)(a7 + 24) = a2;
  *(void *)(a7 + 32) = 0LL;
  id v71 = [(id)objc_opt_self(NSRunLoop) mainRunLoop];
  sub_7ED0(0LL, (unint64_t *)&qword_28330, &OBJC_CLASS___NSTimer_ptr);
  uint64_t v72 = type metadata accessor for NSRunLoop.SchedulerOptions(0LL);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0(v14, 1LL, 1LL, v72);
  uint64_t v73 = static NSTimer.publish(every:tolerance:on:in:options:)(0LL, 1LL, v71, NSRunLoopCommonModes, v14, 0.2);
  sub_7F08(v14, &qword_28318);
  *(void *)&__int128 v93 = v73;
  uint64_t v74 = type metadata accessor for NSTimer.TimerPublisher(0LL);
  sub_78F8( (unint64_t *)&qword_28338,  (uint64_t (*)(uint64_t))&type metadata accessor for NSTimer.TimerPublisher);
  uint64_t v76 = ConnectablePublisher.autoconnect()(v74, v75);
  swift_release(v73);
  *(void *)&__int128 v93 = v76;
  uint64_t v77 = sub_6FC0(&qword_28340);
  sub_8F78(&qword_28348, &qword_28340);
  uint64_t v79 = Publisher.eraseToAnyPublisher()(v77, v78);

  sub_7E54(a1, type metadata accessor for SiriTimerSnippetModel);
  uint64_t result = swift_release(v93);
  *(void *)(a7 + v42[11]) = v79;
  return result;
}

uint64_t sub_155F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v26 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain(v26);
  sub_792C();
  uint64_t v11 = v10;
  sub_17FE8(&v26);
  uint64_t v25 = v11;
  uint64_t KeyPath = swift_getKeyPath(&unk_1F620);
  uint64_t v13 = sub_18840(a2);
  __int128 v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v13 + 32) = v14;
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v13 + 64) = *(void *)(a1 + 48);
  uint64_t v15 = swift_allocObject(a3, 32LL, 7LL);
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = v13;
  sub_17DA0(a1);
  uint64_t v16 = sub_6FC0(&qword_282F0);
  uint64_t v17 = sub_6FC0(&qword_28B80);
  sub_8F78(&qword_28300, &qword_282F0);
  uint64_t v19 = v18;
  uint64_t v20 = type metadata accessor for TimerView(255LL);
  sub_78F8(&qword_28B58, type metadata accessor for TimerView);
  v24[0] = v20;
  v24[1] = v21;
  uint64_t v22 = sub_18868( (uint64_t)v24,  (uint64_t)&opaque type descriptor for <<opaque return type of View.separators(_:isOverride:)>>);
  return ForEach<>.init(_:id:content:)(&v25, KeyPath, a5, v15, v16, v17, v19, &protocol witness table for Int, v22);
}

void sub_15760()
{
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v36 = v8;
  uint64_t v35 = *(void *)(type metadata accessor for SeparatorStyle(0LL) - 8);
  sub_10CF0();
  __chkstk_darwin(v9);
  sub_10F18();
  sub_9054();
  sub_9030();
  __chkstk_darwin(v10);
  sub_18878();
  uint64_t v33 = sub_18838();
  sub_9030();
  __chkstk_darwin(v11);
  sub_9020();
  uint64_t v14 = v13 - v12;
  uint64_t v34 = sub_6FC0(&qword_28B80);
  uint64_t v32 = *(void *)(v34 - 8);
  sub_10CF0();
  __chkstk_darwin(v15);
  sub_9020();
  uint64_t v18 = v17 - v16;
  sub_18334(v7, v1, type metadata accessor for SiriTimerSnippetModel);
  uint64_t v19 = *(void *)(v5 + 40);
  void v37[2] = v7;
  swift_bridgeObjectRetain(v19);
  uint64_t v20 = sub_5530(v3, (uint64_t)v37, v19);
  swift_bridgeObjectRelease(v19);
  uint64_t v21 = *(void **)(v5 + 48);
  uint64_t v22 = *(void *)(v5 + 32);
  uint64_t v23 = *(void **)v5;
  if (*(void *)v5)
  {
    uint64_t v24 = *(void *)(v5 + 24);
    id v25 = v21;
    sub_18870();
    sub_15008(v1, v20, v25, v24, v22, v23, v14);
    sub_188B4( v0,  enum case for SeparatorStyle.edgeToEdge(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 104));
    sub_78F8(&qword_28B58, type metadata accessor for TimerView);
    View.separators(_:isOverride:)(v0, 1LL, v33, v26);
    sub_188C4(v0, *(uint64_t (**)(uint64_t, uint64_t))(v35 + 8));
    sub_7E54(v14, type metadata accessor for TimerView);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v36, v18, v34);
    sub_9008();
  }

  else
  {
    uint64_t v27 = *(void *)(v5 + 8);
    uint64_t v28 = type metadata accessor for Context(0LL);
    sub_78F8(&qword_281C0, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
    uint64_t v30 = v29;
    id v31 = v21;
    sub_18870();
    EnvironmentObject.error()(0LL, v27, v28, v30);
    __break(1u);
  }

void sub_15988()
{
}

void sub_159C8()
{
  uint64_t v24 = v3;
  uint64_t v4 = sub_18838();
  uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64LL);
  __chkstk_darwin(v4);
  sub_6FC0(&qword_28C40);
  sub_9030();
  __chkstk_darwin(v6);
  sub_18878();
  uint64_t v7 = sub_6FC0(&qword_28C48);
  sub_9030();
  __chkstk_darwin(v8);
  sub_10DB0();
  uint64_t v23 = sub_6FC0(&qword_28C50);
  sub_9030();
  __chkstk_darwin(v9);
  sub_9020();
  uint64_t v12 = v11 - v10;
  *(void *)uint64_t v2 = static VerticalAlignment.center.getter();
  *(void *)(v2 + 8) = 0LL;
  *(_BYTE *)(v2 + 16) = 1;
  uint64_t v13 = sub_6FC0(&qword_28C58);
  sub_15BEC(v0, v2 + *(int *)(v13 + 44));
  uint64_t v14 = *(int *)(v4 + 44);
  uint64_t v21 = (uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = v0;
  uint64_t v15 = *(void *)(v0 + v14);
  sub_18334(v0, v21, type metadata accessor for TimerView);
  uint64_t v16 = sub_188CC((uint64_t)&unk_26000);
  sub_188A8(v16);
  sub_10B94(v2, v1, &qword_28C40);
  *(void *)(v1 + *(int *)(v7 + 52)) = v15;
  uint64_t v17 = (void (**)())(v1 + *(int *)(v7 + 56));
  *uint64_t v17 = sub_183A8;
  v17[1] = (void (*)())v16;
  swift_retain(v15);
  sub_7F08(v2, &qword_28C40);
  sub_10B94(v1, v12, &qword_28C48);
  uint64_t v18 = v23;
  *(_BYTE *)(v12 + *(int *)(v23 + 36)) = 0;
  sub_7F08(v1, &qword_28C48);
  sub_18334(v22, v21, type metadata accessor for TimerView);
  uint64_t v19 = sub_188CC((uint64_t)&unk_26028);
  sub_188A8(v19);
  unint64_t v20 = sub_18520();
  View.onTapGesture(count:perform:)(1LL, sub_18500, v19, v18, v20);
  swift_release(v19);
  sub_7F08(v12, &qword_28C50);
  sub_9008();
}

void sub_15BEC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v164 = a1;
  uint64_t v159 = a2;
  uint64_t v162 = type metadata accessor for TimerView(0LL);
  uint64_t v2 = __chkstk_darwin(v162);
  v161 = (char *)&v147 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v147 - v5;
  __chkstk_darwin(v4);
  uint64_t v154 = (uint64_t)&v147 - v7;
  uint64_t v8 = type metadata accessor for FactItemHeroNumberView(0LL);
  uint64_t v9 = *(void (***)(uint64_t, uint64_t, void))(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v147 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v147 - v13;
  uint64_t v15 = sub_6FC0(&qword_28C90);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v147 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_6FC0(&qword_28C98);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v147 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v147 - v23;
  char v25 = static RFFeatureFlags.ResponseFramework.SMART.getter(v22);
  v163 = v21;
  v160 = v24;
  uint64_t v157 = v8;
  v158 = v6;
  uint64_t v155 = v15;
  v156 = v17;
  if ((v25 & 1) != 0)
  {
    uint64_t v26 = static HorizontalAlignment.leading.getter();
    uint64_t v149 = v26;
    uint64_t v27 = sub_1676C(v164, (uint64_t *)v169);
    uint64_t v28 = *(void *)v169;
    v152 = *(char **)&v169[8];
    int v29 = v169[16];
    uint64_t v30 = *(void *)&v169[24];
    uint64_t v31 = *(void *)&v169[32];
    uint64_t v148 = *(void *)&v169[24];
    uint64_t v150 = *(void *)&v169[32];
    uint64_t v32 = *(void *)&v169[40];
    int v33 = v169[48];
    uint64_t v34 = *(void *)&v169[56];
    char v35 = static Edge.Set.all.getter(v27);
    LOBYTE(v173[0]) = 1;
    LODWORD(v153) = v29;
    v171[0] = v29;
    LODWORD(v154) = v33;
    char v166 = v33;
    char v165 = 1;
    v167[0] = (unint64_t)v26;
    LOBYTE(v167[1]) = 1;
    *((void *)&v167[1] + 1) = v28;
    *(void *)&v167[2] = v152;
    BYTE8(v167[2]) = v29;
    *(void *)&v167[3] = v30;
    *((void *)&v167[3] + 1) = v31;
    *(void *)&v167[4] = v32;
    BYTE8(v167[4]) = v33;
    *(void *)&v167[5] = v34;
    uint64_t v36 = v34;
    BYTE8(v167[5]) = v35;
    LOBYTE(v30) = v35;
    memset(&v167[6], 0, 32);
    LOBYTE(v167[8]) = 1;
    memcpy(v169, v167, 0x81uLL);
    LOBYTE(v175[0]) = 1;
    uint64_t v37 = v148;
    v168[0] = (unint64_t)v149;
    LOBYTE(v168[1]) = 1;
    uint64_t v38 = v28;
    *((void *)&v168[1] + 1) = v28;
    *(void *)&v168[2] = v152;
    uint64_t v39 = (uint64_t)v152;
    LOBYTE(v26) = (_BYTE)v153;
    BYTE8(v168[2]) = (_BYTE)v153;
    uint64_t v40 = v150;
    *(void *)&v168[3] = v148;
    *((void *)&v168[3] + 1) = v150;
    uint64_t v41 = v32;
    v151 = (char *)v32;
    *(void *)&v168[4] = v32;
    LOBYTE(v32) = v154;
    BYTE8(v168[4]) = v154;
    *(void *)&v168[5] = v36;
    BYTE8(v168[5]) = v30;
    memset(&v168[6], 0, 32);
    LOBYTE(v168[8]) = 1;
    sub_186C0((uint64_t)v167);
    sub_18730(v38, v39, v26);
    uint64_t v42 = v37;
    swift_bridgeObjectRetain(v37);
    sub_18730(v40, v41, v32);
    swift_bridgeObjectRetain(v36);
    sub_18740((uint64_t)v168);
    uint64_t v43 = v156;
    memcpy(v156, v169, 0x88uLL);
    v43[17] = 0LL;
    *((_BYTE *)v43 + 144) = 1;
    uint64_t v44 = (uint64_t)v160;
    swift_storeEnumTagMultiPayload(v43, v155, 0LL);
    uint64_t v45 = sub_6FC0(&qword_28CA0);
    sub_8F78(&qword_28CA8, &qword_28CA0);
    uint64_t v47 = v46;
    sub_78F8(&qword_28CB0, (uint64_t (*)(uint64_t))&type metadata accessor for FactItemHeroNumberView);
    _ConditionalContent<>.init(storage:)(v43, v45, v157, v47, v48);
    id v49 = (void *)v164;
    sub_8DC4(v38, (uint64_t)v152, (char)v153);
    swift_bridgeObjectRelease(v42);
    sub_8DC4(v40, (uint64_t)v151, v154);
    swift_bridgeObjectRelease(v36);
  }

  else
  {
    v151 = v12;
    v152 = v14;
    v153 = v9;
    uint64_t v50 = *(void *)(v164 + 32);
    *(_OWORD *)v169 = *(_OWORD *)(v164 + 16);
    *(void *)&v169[16] = v50;
    uint64_t v51 = sub_6FC0(&qword_28410);
    State.wrappedValue.getter(v168, v51);
    uint64_t v52 = *((void *)&v168[0] + 1);
    if (*((void *)&v168[0] + 1)) {
      uint64_t v53 = *(void *)&v168[0];
    }
    else {
      sub_188D8(0.0);
    }
    *(void *)v169 = v53;
    *(void *)&v169[8] = v52;
    unint64_t v54 = sub_8D88();
    uint64_t v55 = Text.init<A>(_:)(v169, &type metadata for String, v54);
    uint64_t v57 = v56;
    char v59 = v58;
    uint64_t v61 = v60;
    if (sub_16C20() == 2) {
      int v62 = static HierarchicalShapeStyle.secondary.getter();
    }
    else {
      int v62 = static HierarchicalShapeStyle.primary.getter();
    }
    *(_DWORD *)v169 = v62;
    char v63 = v59 & 1;
    uint64_t v64 = Text.foregroundStyle<A>(_:)( v169,  v55,  v57,  v59 & 1,  v61,  &type metadata for HierarchicalShapeStyle,  &protocol witness table for HierarchicalShapeStyle);
    uint64_t v66 = v65;
    char v68 = v67;
    uint64_t v70 = v69;
    sub_8DC4(v55, v57, v63);
    swift_bridgeObjectRelease(v61);
    *(void *)&v169[24] = &type metadata for Text;
    *(void *)&v169[32] = &protocol witness table for Text;
    uint64_t v71 = swift_allocObject(&unk_26078, 48LL, 7LL);
    *(void *)v169 = v71;
    *(void *)(v71 + 16) = v64;
    *(void *)(v71 + 24) = v66;
    *(_BYTE *)(v71 + 32) = v68 & 1;
    *(void *)(v71 + 40) = v70;
    memset(v168, 0, 40);
    uint64_t v72 = v164;
    v167[0] = *(_OWORD *)v164;
    uint64_t v73 = sub_6FC0(&qword_28420);
    State.wrappedValue.getter(v175, v73);
    uint64_t v74 = *(void **)&v175[0];
    if (*(void *)&v175[0])
    {
      id v75 = [*(id *)&v175[0] displayTitle];

      uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)(v75);
      uint64_t v74 = v77;
    }

    else
    {
      uint64_t v76 = 0LL;
    }

    uint64_t v78 = v154;
    sub_18334(v72, v154, type metadata accessor for TimerView);
    if (!v74)
    {
      uint64_t v79 = *(int *)(v162 + 28);
      uint64_t v80 = (uint64_t *)(v78 + v79 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 32));
      uint64_t v74 = (void *)v80[1];
      if (v74)
      {
        uint64_t v76 = *v80;
        swift_bridgeObjectRetain(v80[1]);
      }

      else
      {
        uint64_t v74 = (void *)0xE500000000000000LL;
        uint64_t v76 = 0x72656D6954LL;
      }
    }

    sub_7E54(v78, type metadata accessor for TimerView);
    *(void *)&v167[0] = v76;
    *((void *)&v167[0] + 1) = v74;
    uint64_t v81 = Text.init<A>(_:)(v167, &type metadata for String, v54);
    uint64_t v83 = v82;
    char v85 = v84;
    uint64_t v87 = v86;
    id v49 = (void *)v72;
    if (sub_16C20() == 2) {
      int v88 = static HierarchicalShapeStyle.tertiary.getter();
    }
    else {
      int v88 = static HierarchicalShapeStyle.primary.getter();
    }
    LODWORD(v167[0]) = v88;
    char v89 = v85 & 1;
    uint64_t v90 = Text.foregroundStyle<A>(_:)( v167,  v81,  v83,  v85 & 1,  v87,  &type metadata for HierarchicalShapeStyle,  &protocol witness table for HierarchicalShapeStyle);
    uint64_t v92 = v91;
    char v94 = v93;
    uint64_t v96 = v95;
    sub_8DC4(v81, v83, v89);
    swift_bridgeObjectRelease(v87);
    *((void *)&v167[1] + 1) = &type metadata for Text;
    *(void *)&v167[2] = &protocol witness table for Text;
    uint64_t v97 = swift_allocObject(&unk_26078, 48LL, 7LL);
    *(void *)&v167[0] = v97;
    *(void *)(v97 + 16) = v90;
    *(void *)(v97 + 24) = v92;
    *(_BYTE *)(v97 + 32) = v94 & 1;
    *(void *)(v97 + 40) = v96;
    uint64_t v176 = 0LL;
    memset(v175, 0, sizeof(v175));
    uint64_t v174 = 0LL;
    memset(v173, 0, sizeof(v173));
    uint64_t v172 = 0LL;
    memset(v171, 0, sizeof(v171));
    uint64_t v98 = (uint64_t)v151;
    FactItemHeroNumberView.init(number:text1:text2:text3:text4:text5:)(v169, v168, v167, v175, v173, v171);
    uint64_t v100 = (uint64_t)v152;
    uint64_t v99 = v153;
    uint64_t v101 = v157;
    v153[4]((uint64_t)v152, v98, v157);
    uint64_t v102 = v156;
    v99[2]((uint64_t)v156, v100, v101);
    swift_storeEnumTagMultiPayload(v102, v155, 1LL);
    uint64_t v103 = sub_6FC0(&qword_28CA0);
    sub_8F78(&qword_28CA8, &qword_28CA0);
    uint64_t v105 = v104;
    sub_78F8(&qword_28CB0, (uint64_t (*)(uint64_t))&type metadata accessor for FactItemHeroNumberView);
    uint64_t v44 = (uint64_t)v160;
    _ConditionalContent<>.init(storage:)(v102, v103, v101, v105, v106);
    ((void (*)(uint64_t, uint64_t))v99[1])(v100, v101);
  }

  uint64_t v108 = v49[1];
  *(void *)&v168[0] = *v49;
  uint64_t v107 = *(void *)&v168[0];
  *((void *)&v168[0] + 1) = v108;
  uint64_t v109 = sub_6FC0(&qword_28420);
  State.projectedValue.getter(v169);
  v156 = *(void **)&v169[8];
  uint64_t v157 = *(void *)v169;
  uint64_t v155 = *(void *)&v169[16];
  uint64_t v154 = sub_16C20();
  uint64_t v110 = v49[6];
  *(void *)v169 = v49[5];
  *(void *)&v169[8] = v110;
  uint64_t v111 = sub_6FC0(&qword_28428);
  State.wrappedValue.getter(v168, v111);
  uint64_t v112 = *(void *)&v168[0];
  v153 = (void (**)(uint64_t, uint64_t, void))*(id *)((char *)v49 + *(int *)(v162 + 40));
  v152 = (char *)static Animation.linear(duration:)(0.2);
  *(void *)v169 = v107;
  *(void *)&v169[8] = v108;
  State.wrappedValue.getter(v168, v109);
  id v113 = *(void **)&v168[0];
  if (*(void *)&v168[0])
  {
    [*(id *)&v168[0] remainingTime];
    double v115 = v114;
  }

  else
  {
    double v115 = 0.0;
  }

  uint64_t v116 = (uint64_t)v161;
  uint64_t v117 = (uint64_t)v158;
  sub_18334((uint64_t)v49, (uint64_t)v158, type metadata accessor for TimerView);
  if (v113)
  {
    sub_7E54(v117, type metadata accessor for TimerView);
  }

  else
  {
    uint64_t v118 = *(int *)(v162 + 28);
    uint64_t v119 = v117 + v118 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 40);
    double v115 = *(double *)v119;
    LODWORD(v118) = *(unsigned __int8 *)(v119 + 8);
    sub_7E54(v117, type metadata accessor for TimerView);
    if ((_DWORD)v118) {
      double v115 = 0.0;
    }
  }

  *(_OWORD *)v169 = *(_OWORD *)v49;
  State.wrappedValue.getter(v168, v109);
  v120 = *(void **)&v168[0];
  if (*(void *)&v168[0])
  {
    [*(id *)&v168[0] duration];
    double v122 = v121;
  }

  else
  {
    double v122 = 0.0;
  }

  sub_18334((uint64_t)v49, v116, type metadata accessor for TimerView);
  if (v120)
  {
    sub_7E54(v116, type metadata accessor for TimerView);
  }

  else
  {
    uint64_t v124 = *(int *)(v162 + 28);
    uint64_t v125 = v116 + v124 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 36);
    double v122 = *(double *)v125;
    LODWORD(v124) = *(unsigned __int8 *)(v125 + 8);
    sub_7E54(v116, type metadata accessor for TimerView);
    if ((_DWORD)v124) {
      double v122 = 1.0;
    }
  }

  double v126 = v115 / v122;
  uint64_t v127 = static Alignment.center.getter(v123);
  v129 = _FrameLayout.init(width:height:alignment:)( v167,  0x404E000000000000LL,  0LL,  0x404E000000000000LL,  0LL,  v127,  v128);
  char v130 = BYTE8(v167[0]);
  v161 = *(char **)&v167[1];
  uint64_t v162 = *(void *)&v167[0];
  char v131 = BYTE8(v167[1]);
  v151 = (char *)*((void *)&v167[2] + 1);
  v158 = *(char **)&v167[2];
  LODWORD(v164) = static Edge.Set.all.getter(v129);
  LOBYTE(v175[0]) = v130;
  LOBYTE(v173[0]) = v131;
  v171[0] = 1;
  uint64_t v132 = (uint64_t)v163;
  sub_10B94(v44, (uint64_t)v163, &qword_28C98);
  char v133 = v175[0];
  LODWORD(v149) = LOBYTE(v175[0]);
  char v134 = v173[0];
  LODWORD(v150) = LOBYTE(v173[0]);
  char v135 = v171[0];
  uint64_t v136 = v132;
  uint64_t v137 = v159;
  sub_10B94(v136, v159, &qword_28C98);
  v138 = (void *)(v137 + *(int *)(sub_6FC0(&qword_28CB8) + 48));
  v140 = v156;
  uint64_t v139 = v157;
  *(void *)&v168[0] = v157;
  *((void *)&v168[0] + 1) = v156;
  uint64_t v142 = v154;
  uint64_t v141 = v155;
  *(void *)&v168[1] = v155;
  *((void *)&v168[1] + 1) = v154;
  uint64_t v144 = (uint64_t)v152;
  v143 = v153;
  *(void *)&v168[2] = v153;
  *((void *)&v168[2] + 1) = v112;
  *(void *)&v168[3] = v152;
  *((double *)&v168[3] + 1) = v126;
  *(void *)&v168[4] = v162;
  BYTE8(v168[4]) = v133;
  *(void *)&v168[5] = v161;
  BYTE8(v168[5]) = v134;
  uint64_t v145 = (uint64_t)v158;
  uint64_t v146 = (uint64_t)v151;
  *(void *)&v168[6] = v158;
  *((void *)&v168[6] + 1) = v151;
  LOBYTE(v168[7]) = v164;
  *(_OWORD *)((char *)&v168[7] + 8) = 0u;
  *(_OWORD *)((char *)&v168[8] + 8) = 0u;
  BYTE8(v168[9]) = v135;
  memcpy(v138, v168, 0x99uLL);
  sub_18604((uint64_t *)v168);
  sub_7F08((uint64_t)v160, &qword_28C98);
  *(void *)v169 = v139;
  *(void *)&v169[8] = v140;
  *(void *)&v169[16] = v141;
  *(void *)&v169[24] = v142;
  *(void *)&v169[32] = v143;
  *(void *)&v169[40] = v112;
  *(void *)&v169[48] = v144;
  *(double *)&v169[56] = v126;
  *(void *)&v169[64] = v162;
  v169[72] = v149;
  *(void *)&v169[80] = v161;
  v169[88] = v150;
  *(void *)&v169[96] = v145;
  *(void *)&v169[104] = v146;
  v169[112] = v164;
  memset(&v169[120], 0, 32);
  char v170 = v135;
  sub_18660((uint64_t *)v169);
  sub_7F08((uint64_t)v163, &qword_28C98);
}

uint64_t sub_1676C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v91 = a2;
  uint64_t v83 = type metadata accessor for TimerView(0LL);
  __chkstk_darwin(v83);
  uint64_t v4 = (char *)&v83 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_6FC0(&qword_28CC0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *(void *)(a1 + 32);
  __int128 v92 = *(_OWORD *)(a1 + 16);
  uint64_t v93 = v8;
  uint64_t v9 = sub_6FC0(&qword_28410);
  State.wrappedValue.getter(&v94, v9);
  uint64_t v10 = v95;
  char v89 = v4;
  uint64_t v90 = (__int128 *)a1;
  if (v95) {
    id v11 = v94;
  }
  else {
    sub_188D8(0.0);
  }
  *(void *)&__int128 v92 = v11;
  *((void *)&v92 + 1) = v10;
  unint64_t v87 = sub_8D88();
  uint64_t v12 = Text.init<A>(_:)(&v92, &type metadata for String, v87);
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17 & 1;
  uint64_t v19 = type metadata accessor for Font.Design(0LL);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v7, 1LL, 1LL, v19);
  uint64_t v20 = static Font.system(size:weight:design:)(0LL, 1LL, v7, 50.0);
  sub_7F08((uint64_t)v7, &qword_28CC0);
  uint64_t v21 = Text.font(_:)(v20, v12, v14, v18, v16);
  uint64_t v23 = v22;
  char v25 = v24;
  uint64_t v27 = v26;
  swift_release(v20);
  LOBYTE(v20) = v25 & 1;
  sub_8DC4(v12, v14, v18);
  uint64_t v28 = swift_bridgeObjectRelease(v16);
  double v29 = static Font.Weight.light.getter(v28);
  uint64_t v30 = Text.fontWeight(_:)(*(void *)&v29, 0LL, v21, v23, v25 & 1, v27);
  uint64_t v32 = v31;
  char v34 = v33;
  uint64_t v36 = v35;
  sub_8DC4(v21, v23, v20);
  swift_bridgeObjectRelease(v27);
  uint64_t v37 = v90;
  if (sub_16C20() == 2) {
    uint64_t v38 = static Color.gray.getter();
  }
  else {
    uint64_t v38 = static Color.white.getter();
  }
  uint64_t v39 = v38;
  uint64_t v40 = Text.foregroundColor(_:)(v38, v30, v32, v34 & 1, v36);
  uint64_t v85 = v41;
  uint64_t v86 = v40;
  int v84 = v42;
  uint64_t v88 = v43;
  swift_release(v39);
  sub_8DC4(v30, v32, v34 & 1);
  swift_bridgeObjectRelease(v36);
  __int128 v92 = *v37;
  uint64_t v44 = sub_6FC0(&qword_28420);
  State.wrappedValue.getter(&v94, v44);
  id v45 = v94;
  uint64_t v46 = (uint64_t)v89;
  if (v94)
  {
    id v47 = [v94 displayTitle];

    uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
    id v45 = v49;
  }

  else
  {
    uint64_t v48 = 0LL;
  }

  sub_18334((uint64_t)v37, v46, type metadata accessor for TimerView);
  if (!v45)
  {
    uint64_t v50 = *(int *)(v83 + 28);
    uint64_t v51 = (uint64_t *)(v46 + v50 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 32));
    id v45 = (id)v51[1];
    if (v45)
    {
      uint64_t v48 = *v51;
      swift_bridgeObjectRetain(v51[1]);
    }

    else
    {
      id v45 = (id)0xE500000000000000LL;
      uint64_t v48 = 0x72656D6954LL;
    }
  }

  sub_7E54(v46, type metadata accessor for TimerView);
  *(void *)&__int128 v92 = v48;
  *((void *)&v92 + 1) = v45;
  uint64_t v52 = Text.init<A>(_:)(&v92, &type metadata for String, v87);
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v58 = v57 & 1;
  uint64_t v59 = static Font.footnote.getter();
  uint64_t v60 = Text.font(_:)(v59, v52, v54, v58, v56);
  uint64_t v62 = v61;
  char v64 = v63;
  uint64_t v66 = v65;
  swift_release(v59);
  sub_8DC4(v52, v54, v58);
  swift_bridgeObjectRelease(v56);
  if (sub_16C20() == 2) {
    uint64_t v67 = static Color.gray.getter();
  }
  else {
    uint64_t v67 = static Color.white.getter();
  }
  uint64_t v68 = v67;
  char v69 = v64 & 1;
  char v70 = v84 & 1;
  uint64_t v71 = Text.foregroundColor(_:)(v67, v60, v62, v64 & 1, v66);
  uint64_t v73 = v72;
  char v75 = v74;
  uint64_t v77 = v76;
  swift_release(v68);
  sub_8DC4(v60, v62, v69);
  swift_bridgeObjectRelease(v66);
  LOBYTE(v92) = v70;
  uint64_t v78 = v91;
  uint64_t v80 = v85;
  uint64_t v79 = v86;
  *uint64_t v91 = v86;
  v78[1] = v80;
  *((_BYTE *)v78 + 16) = v70;
  uint64_t v81 = v88;
  v78[3] = v88;
  v78[4] = v71;
  v78[5] = v73;
  *((_BYTE *)v78 + 48) = v75 & 1;
  v78[7] = v77;
  sub_18730(v79, v80, v70);
  swift_bridgeObjectRetain(v81);
  sub_18730(v71, v73, v75 & 1);
  swift_bridgeObjectRetain(v77);
  sub_8DC4(v71, v73, v75 & 1);
  swift_bridgeObjectRelease(v77);
  sub_8DC4(v79, v80, v92);
  return swift_bridgeObjectRelease(v81);
}

uint64_t sub_16C20()
{
  uint64_t v1 = v0;
  __int128 v10 = *v0;
  uint64_t v2 = sub_6FC0(&qword_28420);
  State.wrappedValue.getter(&v11, v2);
  id v3 = v11;
  if (v11)
  {
    id v4 = objc_msgSend(v11, "state", v10);
  }

  else
  {
    uint64_t v5 = (char *)v1 + *(int *)(type metadata accessor for TimerView(0LL) + 28);
    id v4 = 0LL;
    uint64_t v6 = &v5[*(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 44)];
    if ((v6[8] & 1) == 0)
    {
      uint64_t v7 = SiriTimerState.init(rawValue:)(*(void *)v6);
      if ((v8 & 1) != 0)
      {
        return 0LL;
      }

      else if (v7 == 1)
      {
        return 3LL;
      }

      else
      {
        return 2LL * (v7 == 2);
      }
    }
  }

  return (uint64_t)v4;
}

uint64_t sub_16CE4()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = type metadata accessor for TimerView(0LL);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v44 - v6;
  uint64_t v8 = *v0;
  uint64_t v9 = v0[1];
  *(void *)&__int128 v45 = *v0;
  *((void *)&v45 + 1) = v9;
  uint64_t v10 = sub_6FC0(&qword_28420);
  State.wrappedValue.getter(v44, v10);
  id v11 = v44[0];

  if (!v11)
  {
    uint64_t v18 = v1 + *(int *)(v2 + 28);
    char v17 = 0LL;
    uint64_t v19 = v18 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 40);
    if ((*(_BYTE *)(v19 + 8) & 1) != 0) {
      goto LABEL_14;
    }
    double v20 = *(double *)v19;
    goto LABEL_13;
  }

  *(void *)&__int128 v45 = v8;
  *((void *)&v45 + 1) = v9;
  State.wrappedValue.getter(v44, v10);
  if (!v44[0])
  {
    if (qword_281A0 != -1) {
      swift_once(&qword_281A0, sub_147B4);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    uint64_t v22 = sub_6D9C(v21, (uint64_t)qword_28AF8);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      char v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)char v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "TimerView: MTTimer missing in call for durationString(for:)", v25, 2u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    double v20 = 0.0;
LABEL_13:
    sub_188D8(v20);
    id v11 = v26;
    char v17 = v27;
    goto LABEL_14;
  }

  id v12 = v44[0];
  uint64_t v13 = (char *)[v12 state];
  double v14 = 0.0;
  if (v13 != (_BYTE *)&dword_0 + 1) {
    objc_msgSend(v12, "remainingTime", 0.0);
  }
  sub_188D8(v14);
  id v11 = v15;
  char v17 = v16;

LABEL_14:
  uint64_t v28 = *(void *)(v1 + 32);
  __int128 v45 = *(_OWORD *)(v1 + 16);
  uint64_t v46 = v28;
  v44[0] = v11;
  v44[1] = v17;
  uint64_t v29 = sub_6FC0(&qword_28410);
  State.wrappedValue.setter(v44, v29);
  if (sub_16C20() == 1)
  {
    uint64_t v30 = *(void *)(v1 + 48);
    *(void *)&__int128 v45 = *(void *)(v1 + 40);
    *((void *)&v45 + 1) = v30;
    v44[0] = 0LL;
  }

  else
  {
    *(void *)&__int128 v45 = v8;
    *((void *)&v45 + 1) = v9;
    State.wrappedValue.getter(v44, v10);
    id v31 = v44[0];
    if (v44[0])
    {
      [v44[0] remainingTime];
      double v33 = v32;
    }

    else
    {
      double v33 = 0.0;
    }

    sub_18334(v1, (uint64_t)v7, type metadata accessor for TimerView);
    if (v31)
    {
      sub_7E54((uint64_t)v7, type metadata accessor for TimerView);
    }

    else
    {
      uint64_t v34 = *(int *)(v2 + 28);
      uint64_t v35 = &v7[v34 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 40)];
      double v33 = *(double *)v35;
      LODWORD(v34) = v35[8];
      sub_7E54((uint64_t)v7, type metadata accessor for TimerView);
      if ((_DWORD)v34) {
        double v33 = 0.0;
      }
    }

    __int128 v45 = *(_OWORD *)v1;
    State.wrappedValue.getter(v44, v10);
    id v36 = v44[0];
    if (v44[0])
    {
      [v44[0] duration];
      double v38 = v37;
    }

    else
    {
      double v38 = 0.0;
    }

    sub_18334(v1, (uint64_t)v5, type metadata accessor for TimerView);
    if (v36)
    {
      sub_7E54((uint64_t)v5, type metadata accessor for TimerView);
    }

    else
    {
      uint64_t v39 = *(int *)(v2 + 28);
      uint64_t v40 = &v5[v39 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0LL) + 36)];
      double v38 = *(double *)v40;
      LODWORD(v39) = v40[8];
      sub_7E54((uint64_t)v5, type metadata accessor for TimerView);
      if ((_DWORD)v39) {
        double v38 = 1.0;
      }
    }

    uint64_t v41 = *(void *)(v1 + 48);
    *(void *)&__int128 v45 = *(void *)(v1 + 40);
    *((void *)&v45 + 1) = v41;
    *(double *)uint64_t v44 = v33 / v38;
  }

  uint64_t v42 = sub_6FC0(&qword_28428);
  return State.wrappedValue.setter(v44, v42);
}

void sub_170D8()
{
  uint64_t v58 = type metadata accessor for AppPunchout(0LL);
  uint64_t v1 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v3 = (char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_6FC0(&qword_28358);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v54 - v12;
  uint64_t v59 = type metadata accessor for TimerView(0LL);
  uint64_t v60 = v0;
  double v14 = (void *)(v0 + *(int *)(v59 + 28));
  unint64_t v15 = v14[3];
  if (v15 && (uint64_t v16 = v14[4]) != 0)
  {
    uint64_t v17 = v14[2];
    if (qword_281A0 != -1) {
      swift_once(&qword_281A0, sub_147B4);
    }
    uint64_t v18 = type metadata accessor for Logger(0LL);
    sub_6D9C(v18, (uint64_t)qword_28AF8);
    swift_bridgeObjectRetain_n(v15, 2LL);
    uint64_t v19 = swift_bridgeObjectRetain_n(v16, 2LL);
    double v20 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc(22LL, -1LL);
      uint64_t v57 = swift_slowAlloc(64LL, -1LL);
      aBlock[0] = v57;
      *(_DWORD *)uint64_t v22 = 136315394;
      swift_bridgeObjectRetain(v15);
      uint64_t v61 = sub_1C5A4(v17, v15, aBlock);
      uint64_t v58 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, aBlock, v22 + 4, v22 + 12);
      swift_bridgeObjectRelease_n(v15, 3LL);
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v23 = swift_bridgeObjectRetain(v16);
      uint64_t v24 = Dictionary.description.getter( v23,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
      unint64_t v26 = v25;
      swift_bridgeObjectRelease(v16);
      uint64_t v61 = sub_1C5A4(v24, v26, aBlock);
      uint64_t v17 = v58;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, aBlock, v22 + 14, v22 + 22);
      swift_bridgeObjectRelease_n(v16, 2LL);
      swift_bridgeObjectRelease(v26);
      _os_log_impl( &dword_0,  v20,  v21,  "[TimerView.onSnippetTapped]: Performing direct invocation with ID = %s, payload = %s",  (uint8_t *)v22,  0x16u);
      uint64_t v27 = v57;
      swift_arrayDestroy(v57, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1LL, -1LL);
      swift_slowDealloc(v22, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v16, 2LL);
      swift_bridgeObjectRelease_n(v15, 2LL);
    }

    sub_5F1C(v16);
    uint64_t v52 = v51;
    dispatch thunk of Context.perform(directInvocation:payload:)(v17, v15, v51);
    swift_bridgeObjectRelease(v52);
  }

  else
  {
    uint64_t v28 = type metadata accessor for SiriTimerSnippetModel(0LL);
    sub_10B94((uint64_t)v14 + *(int *)(v28 + 28), (uint64_t)v6, &qword_28358);
    if (_s13TimerUIPlugin19SiriTimePluginModelOwet_0((uint64_t)v6, 1LL, v7) == 1)
    {
      sub_7F08((uint64_t)v6, &qword_28358);
      if (qword_281A0 != -1) {
        swift_once(&qword_281A0, sub_147B4);
      }
      uint64_t v29 = type metadata accessor for Logger(0LL);
      uint64_t v30 = sub_6D9C(v29, (uint64_t)qword_28AF8);
      id v31 = (os_log_s *)Logger.logObject.getter(v30);
      os_log_type_t v32 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v31, v32))
      {
        double v33 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)double v33 = 0;
        _os_log_impl( &dword_0,  v31,  v32,  "[TimerView.onSnippetTapped]: Nil direct invocation parameters detected; punching out instead.",
          v33,
          2u);
        swift_slowDealloc(v33, -1LL, -1LL);
      }

      id v34 =  [(id)objc_opt_self(FBSOpenApplicationService) serviceWithDefaultShellEndpoint];
      if (v34)
      {
        id v35 = v34;
        NSString v36 = String._bridgeToObjectiveC()();
        aBlock[4] = (uint64_t)sub_177F0;
        aBlock[5] = 0LL;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256LL;
        aBlock[2] = (uint64_t)sub_179E8;
        aBlock[3] = (uint64_t)&unk_26040;
        double v37 = _Block_copy(aBlock);
        [v35 openApplication:v36 withOptions:0 completion:v37];

        _Block_release(v37);
      }
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
      if (qword_281A0 != -1) {
        swift_once(&qword_281A0, sub_147B4);
      }
      uint64_t v38 = type metadata accessor for Logger(0LL);
      sub_6D9C(v38, (uint64_t)qword_28AF8);
      uint64_t v39 = (*(uint64_t (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      uint64_t v40 = (os_log_s *)Logger.logObject.getter(v39);
      os_log_type_t v41 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v57 = swift_slowAlloc(32LL, -1LL);
        aBlock[0] = v57;
        uint64_t v56 = v42;
        *(_DWORD *)uint64_t v42 = 136315138;
        uint64_t v55 = v42 + 4;
        sub_78F8(&qword_28C80, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v44 = dispatch thunk of CustomStringConvertible.description.getter(v7, v43);
        unint64_t v46 = v45;
        uint64_t v61 = sub_1C5A4(v44, v45, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, aBlock, v55, v42 + 12);
        swift_bridgeObjectRelease(v46);
        id v47 = *(void (**)(char *, uint64_t))(v8 + 8);
        v47(v11, v7);
        os_log_type_t v48 = v41;
        id v49 = v56;
        _os_log_impl(&dword_0, v40, v48, "[TimerView.onSnippetTapped]: Performing punchout URL = %s", v56, 0xCu);
        uint64_t v50 = v57;
        swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v50, -1LL, -1LL);
        swift_slowDealloc(v49, -1LL, -1LL);
      }

      else
      {
        id v47 = *(void (**)(char *, uint64_t))(v8 + 8);
        v47(v11, v7);
      }

      uint64_t v53 = URL.absoluteString.getter();
      AppPunchout.init(punchOutUri:bundleId:appDisplayName:)(v53);
      dispatch thunk of Context.perform(appPunchout:)(v3);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v58);
      v47(v13, v7);
    }
  }

void sub_177F0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_281A0 != -1) {
      swift_once(&qword_281A0, sub_147B4);
    }
    uint64_t v3 = type metadata accessor for Logger(0LL);
    sub_6D9C(v3, (uint64_t)qword_28AF8);
    swift_errorRetain(a2);
    uint64_t v4 = swift_errorRetain(a2);
    oslog = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v7 = swift_slowAlloc(32LL, -1LL);
      uint64_t v13 = a2;
      uint64_t v14 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      swift_errorRetain(a2);
      uint64_t v8 = sub_6FC0(&qword_28C88);
      uint64_t v9 = String.init<A>(describing:)(&v13, v8);
      unint64_t v11 = v10;
      uint64_t v13 = sub_1C5A4(v9, v10, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v6 + 4, v6 + 12);
      swift_bridgeObjectRelease(v11);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl(&dword_0, oslog, v5, "[TimerView.onSnippetTapped]: Failed to launch clock app! %s", v6, 0xCu);
      swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v7, -1LL, -1LL);
      swift_slowDealloc(v6, -1LL, -1LL);

      swift_errorRelease(a2);
    }

    else
    {
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
    }
  }

void sub_179E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void (**)(void *, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v8 = a2;
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);
}

uint64_t sub_17A60(void *a1)
{
  id v1 = [a1 timersSync];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_7ED0(0LL, &qword_281C8, &OBJC_CLASS___MTTimer_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

void destroy for TimerSnippet(uint64_t a1)
{
}

void *initializeWithCopy for TimerSnippet(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = v6;
  a1[3] = v5;
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  a1[4] = v7;
  a1[5] = v8;
  uint64_t v9 = *(void **)(a2 + 48);
  a1[6] = v9;
  id v10 = v3;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  id v11 = v9;
  return a1;
}

uint64_t assignWithCopy for TimerSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = *(void *)(a2 + 40);
  uint64_t v12 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = *(void **)(a2 + 48);
  uint64_t v14 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v13;
  id v15 = v13;

  return a1;
}

__n128 initializeWithTake for TimerSnippet(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TimerSnippet(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease(v6);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(*(void *)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  return a1;
}

uint64_t getEnumTagSinglePayload for TimerSnippet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for TimerSnippet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 56) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TimerSnippet()
{
  return &type metadata for TimerSnippet;
}

uint64_t sub_17D54(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_22244, 1LL);
}

uint64_t sub_17D68()
{
  return sub_155F0(v0 + 16, (uint64_t)&unk_25FB0, (uint64_t)&unk_25FD8, (uint64_t)sub_180A0, (uint64_t)sub_18814);
}

uint64_t sub_17DA0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v6 = *(id *)a1;
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  id v7 = v5;
  return a1;
}

unint64_t sub_17E00()
{
  unint64_t result = qword_28B50;
  if (!qword_28B50)
  {
    uint64_t v1 = sub_756C(&qword_28B48);
    uint64_t v2 = type metadata accessor for TimerView(255LL);
    sub_78F8(&qword_28B58, type metadata accessor for TimerView);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2( v4,  &opaque type descriptor for <<opaque return type of View.separators(_:isOverride:)>>,  1LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_28B50);
  }

  return result;
}

uint64_t type metadata accessor for TimerView(uint64_t a1)
{
  uint64_t result = qword_28BE0;
  if (!qword_28BE0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TimerView);
  }
  return result;
}

unint64_t sub_17ED8()
{
  unint64_t result = qword_28B68;
  if (!qword_28B68)
  {
    uint64_t v1 = sub_756C(&qword_28B38);
    uint64_t v2 = sub_756C(&qword_28B28);
    sub_8F78(&qword_28B70, &qword_28B28);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2( v4,  &opaque type descriptor for <<opaque return type of View.setHostBackground(_:)>>,  1LL);
    sub_8F78(&qword_282D0, &qword_282A0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_28B68);
  }

  return result;
}

uint64_t sub_17FA8()
{
  return sub_155F0(v0 + 16, (uint64_t)&unk_25F60, (uint64_t)&unk_25F88, (uint64_t)sub_18014, (uint64_t)sub_7C8C);
}

void *sub_17FE8(void *a1)
{
  return a1;
}

void sub_18014()
{
}

uint64_t sub_18034()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1805C()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  swift_bridgeObjectRelease(*(void *)(v0 + 56));

  return swift_deallocObject(v0, 72LL, 7LL);
}

void sub_180A0()
{
}

uint64_t sub_180C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_180CC);
}

uint64_t sub_180CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_9054();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2) {
    return _s13TimerUIPlugin19SiriTimePluginModelOwet_0(a1 + *(int *)(a3 + 28), a2, v6);
  }
  unint64_t v8 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
  if (v8 >= 0xFFFFFFFF) {
    LODWORD(v8) = -1;
  }
  return (v8 + 1);
}

uint64_t sub_18148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_18154);
}

uint64_t sub_18154(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_9054();
  if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3) {
    return _s13TimerUIPlugin19SiriTimePluginModelOwst_0(a1 + *(int *)(a4 + 28), a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_181CC(uint64_t a1)
{
  v4[0] = &unk_1F648;
  v4[1] = &unk_1F660;
  void v4[2] = &unk_1F648;
  uint64_t result = type metadata accessor for SiriTimerSnippetModel(319LL);
  if (v3 <= 0x3F)
  {
    void v4[3] = *(void *)(result - 8) + 64LL;
    void v4[4] = &unk_1F678;
    v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[7] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_initStructMetadata(a1, 256LL, 8LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

unint64_t sub_18278()
{
  unint64_t result = qword_28C30;
  if (!qword_28C30)
  {
    uint64_t v1 = sub_756C(&qword_28C38);
    v2[0] = sub_756C(&qword_28B38);
    v2[1] = sub_17ED8();
    swift_getOpaqueTypeConformance2( v2,  &opaque type descriptor for <<opaque return type of View.lastComponentBottomSpacing(_:)>>,  1LL);
    sub_8F78(&qword_28B78, &qword_28B10);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_28C30);
  }

  return result;
}

uint64_t sub_18324(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_2226C, 1LL);
}

void sub_18334(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3(0LL);
  sub_10FB8(v3);
  sub_905C();
}

uint64_t sub_18364(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimerView(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_183A8()
{
}

uint64_t sub_183CC()
{
  uint64_t v1 = (int *)sub_18838();
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v0 + v4;

  swift_release(*(void *)(v0 + v4 + 8));
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 24));
  swift_release(*(void *)(v0 + v4 + 32));
  swift_release(*(void *)(v0 + v4 + 48));
  id v7 = (void *)(v0 + v4 + v1[7]);
  swift_bridgeObjectRelease(v7[1]);
  swift_bridgeObjectRelease(v7[3]);
  swift_bridgeObjectRelease(v7[4]);
  uint64_t v8 = sub_9054();
  uint64_t v9 = (uint64_t)v7 + *(int *)(v8 + 28);
  uint64_t v10 = type metadata accessor for URL(0LL);
  swift_bridgeObjectRelease(*(void *)((char *)v7 + *(int *)(v8 + 32) + 8));
  swift_bridgeObjectRelease(*(void *)(v6 + v1[8] + 8));

  swift_release(*(void *)(v6 + v1[11]));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

void sub_18500()
{
}

unint64_t sub_18520()
{
  unint64_t result = qword_28C60;
  if (!qword_28C60)
  {
    uint64_t v1 = sub_756C(&qword_28C50);
    sub_8F78(&qword_28C68, &qword_28C48);
    sub_8F78(&qword_28C70, &qword_28C78);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_28C60);
  }

  return result;
}

uint64_t sub_185BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_185CC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_185D4()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t *sub_18604(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = (void *)a1[4];
  swift_retain(a1[6]);
  swift_retain(v2);
  swift_retain(v3);
  id v6 = v4;
  id v7 = v5;
  return a1;
}

uint64_t *sub_18660(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = a1[6];

  swift_release(v3);
  swift_release(v2);

  swift_release(v5);
  return a1;
}

uint64_t sub_186C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  char v5 = *(_BYTE *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  sub_18730(*(void *)(a1 + 24), *(void *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain(v2);
  sub_18730(v3, v4, v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

uint64_t sub_18730(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_retain(a1);
  }
  else {
    return swift_bridgeObjectRetain(a2);
  }
}

uint64_t sub_18740(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  char v5 = *(_BYTE *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  sub_8DC4(*(void *)(a1 + 24), *(void *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease(v2);
  sub_8DC4(v3, v4, v5);
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t sub_187B0()
{
  v1[0] = sub_756C(&qword_28C50);
  v1[1] = sub_18520();
  return sub_18868( (uint64_t)v1,  (uint64_t)&opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>);
}

uint64_t sub_187F8(id *a1)
{
  return sub_7C94(a1) & 1;
}

uint64_t sub_18818(uint64_t a1)
{
  __int128 v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 32) = v2;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(v1 + 32);
  *(void *)(a1 + 64) = *(void *)(v1 + 48);
  return sub_17DA0(v1);
}

uint64_t sub_18838()
{
  return type metadata accessor for TimerView(0LL);
}

uint64_t sub_18840(uint64_t a1)
{
  return swift_allocObject(a1, 72LL, 7LL);
}

  ;
}

uint64_t sub_18868(uint64_t a1, uint64_t a2)
{
  return swift_getOpaqueTypeConformance2(a1, a2, 1LL);
}

uint64_t sub_18870()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

  ;
}

uint64_t sub_188A8(uint64_t a1)
{
  return sub_18364(v2, a1 + v1);
}

uint64_t sub_188B4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_188BC()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_188C4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_188CC(uint64_t a1)
{
  return swift_allocObject(a1, v1, v2);
}

void sub_188D8(double a1)
{
  uint64_t v3 = type metadata accessor for Locale(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_190B8(&v66, a1);
  static Locale.current.getter(v7);
  v8.super.isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (qword_281A8 != -1) {
    swift_once(&qword_281A8, sub_18FFC);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = sub_6D9C(v9, (uint64_t)qword_28CC8);
  uint64_t v11 = v8.super.isa;
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  uint64_t v14 = v13;
  BOOL v15 = os_log_type_enabled(v12, v13);
  uint64_t v16 = os_log_type_enabled;
  uint64_t v61 = v10;
  if (v15)
  {
    uint64_t v17 = (uint8_t *)sub_91D0(12LL);
    uint64_t v1 = sub_91D0(32LL);
    uint64_t v62 = v1;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v16 = (BOOL (__cdecl *)(os_log_t, os_log_type_t))(v17 + 12);
    uint64_t v72 = (uint64_t)v11;
    type metadata accessor for CFLocale(0LL);
    uint64_t v19 = v18;
    double v20 = v11;
    uint64_t v21 = String.init<A>(describing:)(&v72, v19);
    unint64_t v23 = v22;
    uint64_t v72 = sub_1C5A4(v21, v22, &v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v17 + 4, v17 + 12);

    swift_bridgeObjectRelease(v23);
    _os_log_impl( &dword_0,  v12,  (os_log_type_t)v14,  "TimeInterval.intervalTextString formatting time components using locale %s",  v17,  0xCu);
    swift_arrayDestroy(v1, 1LL, (char *)&type metadata for Any + 8);
    sub_9128(v1);
    sub_9128((uint64_t)v17);
  }

  else
  {
  }

  sub_19830((uint64_t)&v66, (uint64_t)v69);
  sub_19830((uint64_t)v69, (uint64_t)&v72);
  if (v73)
  {
    String._bridgeToObjectiveC()();
    uint64_t v24 = (const __CFAllocator *)sub_19C80();
    uint64_t v60 = v11;
    CFStringRef DateFormatFromTemplate = CFDateFormatterCreateDateFormatFromTemplate(v24, v25, v26, (CFLocaleRef)v11);

    if (DateFormatFromTemplate)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(DateFormatFromTemplate);
      sub_19C94();
      uint64_t v62 = v14;
      uint64_t v63 = v1;
      *(void *)&__int128 v71 = 18504LL;
      *((void *)&v71 + 1) = 0xE200000000000000LL;
      *(void *)&__int128 v70 = 1076113701LL;
      *((void *)&v70 + 1) = 0xE400000000000000LL;
      unint64_t v28 = sub_8D88();
      sub_19BCC();
      sub_19BF8();
      uint64_t v62 = (uint64_t)DateFormatFromTemplate;
      uint64_t v63 = (uint64_t)v16;
      *(void *)&__int128 v71 = 72LL;
      *((void *)&v71 + 1) = 0xE100000000000000LL;
      *(void *)&__int128 v70 = 1076113701LL;
      *((void *)&v70 + 1) = 0xE400000000000000LL;
      sub_19BCC();
      sub_19C0C();
      sub_19C34();
      *(void *)&__int128 v71 = 26728LL;
      *((void *)&v71 + 1) = 0xE200000000000000LL;
      *(void *)&__int128 v70 = 1076113701LL;
      *((void *)&v70 + 1) = 0xE400000000000000LL;
      sub_19BCC();
      sub_19BF8();
      uint64_t v62 = (uint64_t)DateFormatFromTemplate;
      uint64_t v63 = (uint64_t)v16;
      *(void *)&__int128 v71 = 104LL;
      *((void *)&v71 + 1) = 0xE100000000000000LL;
      *(void *)&__int128 v70 = 1076113701LL;
      *((void *)&v70 + 1) = 0xE400000000000000LL;
      sub_19BCC();
      sub_19C0C();
      sub_19C34();
      *(void *)&__int128 v71 = 28013LL;
      *((void *)&v71 + 1) = 0xE200000000000000LL;
      *(void *)&__int128 v70 = 1076113957LL;
      *((void *)&v70 + 1) = 0xE400000000000000LL;
      sub_19BCC();
      sub_19BF8();
      sub_19C6C();
      *(void *)&__int128 v71 = v29;
      *((void *)&v71 + 1) = 0xE100000000000000LL;
      *(void *)&__int128 v70 = 1076113957LL;
      *((void *)&v70 + 1) = 0xE400000000000000LL;
      sub_19BCC();
      sub_19C0C();
      sub_19C44();
      *(void *)&__int128 v71 = v30;
      *((void *)&v71 + 1) = 0xE200000000000000LL;
      *(void *)&__int128 v70 = 1076114213LL;
      *((void *)&v70 + 1) = 0xE400000000000000LL;
      sub_19BCC();
      sub_19BF8();
      sub_19C58();
      *(void *)&__int128 v71 = v31;
      *((void *)&v71 + 1) = 0xE200000000000000LL;
      *(void *)&__int128 v70 = 1076114469LL;
      *((void *)&v70 + 1) = 0xE400000000000000LL;
      sub_19BCC();
      sub_19C0C();
      uint64_t v64 = (uint64_t)DateFormatFromTemplate;
      unint64_t v65 = v1;
      sub_19C34();
      if (qword_281B0 != -1) {
        swift_once(&qword_281B0, sub_19070);
      }
      uint64_t v32 = type metadata accessor for CharacterSet(0LL);
      uint64_t v33 = sub_6D9C(v32, (uint64_t)qword_28CE0);
      uint64_t v34 = StringProtocol.trimmingCharacters(in:)(v33, &type metadata for String, v28);
      unint64_t v36 = v35;
      swift_bridgeObjectRelease(v63);
      uint64_t v64 = v34;
      unint64_t v65 = v36;
      uint64_t v11 = v60;
      goto LABEL_13;
    }

    __break(1u);
LABEL_21:
    __break(1u);
    return;
  }

  String._bridgeToObjectiveC()();
  double v37 = (const __CFAllocator *)sub_19C80();
  CFStringRef v40 = CFDateFormatterCreateDateFormatFromTemplate(v37, v38, v39, (CFLocaleRef)v11);

  if (!v40) {
    goto LABEL_21;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
  sub_19C94();
  uint64_t v62 = v14;
  uint64_t v63 = v1;
  *(void *)&__int128 v71 = 28013LL;
  *((void *)&v71 + 1) = 0xE200000000000000LL;
  *(void *)&__int128 v70 = 1076113701LL;
  *((void *)&v70 + 1) = 0xE400000000000000LL;
  sub_8D88();
  sub_19BCC();
  sub_19BF8();
  sub_19C6C();
  *(void *)&__int128 v71 = v41;
  *((void *)&v71 + 1) = 0xE100000000000000LL;
  *(void *)&__int128 v70 = 1076113701LL;
  *((void *)&v70 + 1) = 0xE400000000000000LL;
  sub_19BCC();
  sub_19C0C();
  sub_19C44();
  *(void *)&__int128 v71 = v42;
  *((void *)&v71 + 1) = 0xE200000000000000LL;
  *(void *)&__int128 v70 = 1076113957LL;
  *((void *)&v70 + 1) = 0xE400000000000000LL;
  sub_19BCC();
  sub_19BF8();
  sub_19C58();
  *(void *)&__int128 v71 = v43;
  *((void *)&v71 + 1) = 0xE200000000000000LL;
  *(void *)&__int128 v70 = 1076114213LL;
  *((void *)&v70 + 1) = 0xE400000000000000LL;
  uint64_t v34 = sub_19BCC();
  unint64_t v36 = v44;
  swift_bridgeObjectRelease(v16);
  uint64_t v64 = v34;
  unint64_t v65 = v36;
LABEL_13:
  uint64_t v45 = swift_bridgeObjectRetain_n(v36, 2LL);
  unint64_t v46 = (os_log_s *)Logger.logObject.getter(v45);
  os_log_type_t v47 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v46, v47))
  {
    os_log_type_t v48 = (uint8_t *)sub_91D0(12LL);
    uint64_t v49 = sub_91D0(32LL);
    uint64_t v62 = v49;
    *(_DWORD *)os_log_type_t v48 = 136315138;
    swift_bridgeObjectRetain(v36);
    *(void *)&__int128 v71 = sub_1C5A4(v34, v36, &v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8, v48 + 4, v48 + 12);
    swift_bridgeObjectRelease_n(v36, 3LL);
    _os_log_impl(&dword_0, v46, v47, "TimeInterval.intervalTextString formatString: %s", v48, 0xCu);
    swift_arrayDestroy(v49, 1LL, (char *)&type metadata for Any + 8);
    sub_9128(v49);
    sub_9128((uint64_t)v48);
  }

  else
  {

    swift_bridgeObjectRelease_n(v36, 2LL);
  }

  sub_19830((uint64_t)v69, (uint64_t)&v70);
  if (*((void *)&v70 + 1))
  {
    __int128 v71 = v70;
    sub_19C20();
    uint64_t v51 = v64;
    unint64_t v50 = v65;
    uint64_t v52 = sub_6FC0(&qword_28CF8);
    uint64_t v53 = swift_allocObject(v52, 152LL, 7LL);
    unint64_t v54 = sub_19CA0((__n128 *)v53, (__n128)xmmword_1F6F0);
    *(void *)(v53 + 64) = v54;
    *(_OWORD *)(v53 + 32) = v71;
    *(void *)(v53 + 96) = &type metadata for String;
    *(void *)(v53 + 104) = v54;
    __int128 v55 = v68;
    *(_OWORD *)(v53 + 72) = v67;
    *(void *)(v53 + 136) = &type metadata for String;
    *(void *)(v53 + 144) = v54;
    *(_OWORD *)(v53 + 112) = v55;
  }

  else
  {
    sub_19C20();
    uint64_t v51 = v64;
    unint64_t v50 = v65;
    uint64_t v56 = sub_6FC0(&qword_28CF8);
    uint64_t v53 = swift_allocObject(v56, 112LL, 7LL);
    unint64_t v57 = sub_19CA0((__n128 *)v53, (__n128)xmmword_1F700);
    *(void *)(v53 + 64) = v57;
    __int128 v58 = v68;
    *(_OWORD *)(v53 + 32) = v67;
    *(void *)(v53 + 96) = &type metadata for String;
    *(void *)(v53 + 104) = v57;
    *(_OWORD *)(v53 + 72) = v58;
  }

  String.init(format:_:)(v51, v50, v53);
  swift_bridgeObjectRelease(v50);
}

uint64_t sub_18FFC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_6E94(v0, qword_28CC8);
  sub_6D9C(v0, (uint64_t)qword_28CC8);
  return Logger.init(subsystem:category:)( 0xD000000000000013LL,  0x800000000001F8A0LL,  0x495572656D6974LL,  0xE700000000000000LL);
}

uint64_t sub_19070()
{
  uint64_t v0 = type metadata accessor for CharacterSet(0LL);
  sub_6E94(v0, qword_28CE0);
  sub_6D9C(v0, (uint64_t)qword_28CE0);
  return static CharacterSet.letters.getter();
}

uint64_t sub_190B8@<X0>(_OWORD *a1@<X8>, double a2@<D0>)
{
  uint64_t v88 = a1;
  uint64_t v89 = type metadata accessor for Calendar(0LL);
  unint64_t v87 = *(uint64_t (***)(char *, uint64_t))(v89 - 8);
  __chkstk_darwin(v89);
  uint64_t v4 = (char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v86 = type metadata accessor for DateComponents(0LL);
  uint64_t v82 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v6 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v83 = *(void *)(v7 - 8);
  uint64_t v84 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v78 - v11;
  os_log_type_t v13 = (uint64_t (**)(char *, uint64_t))[objc_allocWithZone(NSNumberFormatter) init];
  uint64_t v14 = Date.init()([v13 setNumberStyle:0]);
  uint64_t v15 = Date.addingTimeInterval(_:)(v14, a2);
  static Calendar.current.getter(v15);
  uint64_t v16 = sub_6FC0(&qword_28D08);
  uint64_t v17 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 72);
  uint64_t v20 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v21 = (v20 + 32) & ~v20;
  uint64_t v22 = swift_allocObject(v16, v21 + 3 * v19, v20 | 7);
  *(_OWORD *)(v22 + 16) = xmmword_1F6F0;
  uint64_t v23 = v22 + v21;
  uint64_t v24 = *(void (**)(uint64_t, void, uint64_t))(v18 + 104);
  v24(v23, enum case for Calendar.Component.hour(_:), v17);
  v24(v23 + v19, enum case for Calendar.Component.minute(_:), v17);
  v24(v23 + 2 * v19, enum case for Calendar.Component.second(_:), v17);
  uint64_t v25 = sub_198B4(v22);
  uint64_t v85 = v12;
  uint64_t v81 = v10;
  Calendar.dateComponents(_:from:to:)(v25, v12, v10);
  swift_bridgeObjectRelease(v25);
  uint64_t v26 = v87[1](v4, v89);
  __int128 v93 = 0uLL;
  uint64_t v89 = (uint64_t)v6;
  uint64_t v27 = DateComponents.hour.getter(v26);
  if ((v28 & 1) == 0 && v27 > 0)
  {
    sub_19B3C(48LL, 0xE100000000000000LL, v13);
    Class isa = Int._bridgeToObjectiveC()().super.super.isa;
    id v30 = [v13 stringFromNumber:isa];

    if (v30)
    {
      uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      unint64_t v33 = v32;
    }

    else
    {
      uint64_t v31 = 0LL;
      unint64_t v33 = 0xE000000000000000LL;
    }

    *(void *)&__int128 v93 = v31;
    *((void *)&v93 + 1) = v33;
  }

  uint64_t v34 = 12336LL;
  unint64_t v35 = 0xE200000000000000LL;
  sub_19B3C(12336LL, 0xE200000000000000LL, v13);
  uint64_t v36 = DateComponents.minute.getter();
  if ((v37 & 1) != 0) {
    uint64_t v38 = 0LL;
  }
  else {
    uint64_t v38 = v36;
  }
  id v39 = [objc_allocWithZone(NSNumber) initWithInteger:v38];
  id v40 = [v13 stringFromNumber:v39];

  if (v40)
  {
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
    unint64_t v35 = v41;
  }

  uint64_t v42 = DateComponents.second.getter();
  if ((v43 & 1) != 0) {
    uint64_t v44 = 0LL;
  }
  else {
    uint64_t v44 = v42;
  }
  id v45 = [objc_allocWithZone(NSNumber) initWithInteger:v44];
  id v46 = [v13 stringFromNumber:v45];

  if (v46)
  {
    uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
    unint64_t v49 = v48;
  }

  else
  {
    unint64_t v49 = 0xE200000000000000LL;
    uint64_t v47 = 12336LL;
  }

  if (qword_281A8 != -1) {
    swift_once(&qword_281A8, sub_18FFC);
  }
  uint64_t v50 = type metadata accessor for Logger(0LL);
  sub_6D9C(v50, (uint64_t)qword_28CC8);
  __int128 v51 = v93;
  swift_bridgeObjectRetain_n(*((void *)&v93 + 1), 2LL);
  swift_bridgeObjectRetain_n(v35, 2LL);
  uint64_t v52 = swift_bridgeObjectRetain_n(v49, 2LL);
  uint64_t v53 = (os_log_s *)Logger.logObject.getter(v52);
  os_log_type_t v54 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = swift_slowAlloc(32LL, -1LL);
    uint64_t v56 = swift_slowAlloc(96LL, -1LL);
    unint64_t v87 = v13;
    uint64_t v79 = v56;
    uint64_t v90 = v56;
    uint64_t v91 = v51;
    *(_DWORD *)uint64_t v55 = 136315650;
    v92[0] = *((void *)&v51 + 1);
    swift_bridgeObjectRetain(*((void *)&v51 + 1));
    uint64_t v57 = sub_6FC0(&qword_28328);
    uint64_t v58 = String.init<A>(describing:)(&v91, v57);
    uint64_t v80 = v47;
    uint64_t v59 = v34;
    unint64_t v61 = v60;
    uint64_t v91 = sub_1C5A4(v58, v60, &v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, v92, v55 + 4, v55 + 12);
    swift_bridgeObjectRelease_n(*((void *)&v51 + 1), 2LL);
    unint64_t v62 = v61;
    uint64_t v34 = v59;
    swift_bridgeObjectRelease(v62);
    *(_WORD *)(v55 + 12) = 2080;
    swift_bridgeObjectRetain(v35);
    uint64_t v91 = sub_1C5A4(v59, v35, &v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, v92, v55 + 14, v55 + 22);
    swift_bridgeObjectRelease_n(v35, 3LL);
    *(_WORD *)(v55 + 22) = 2080;
    uint64_t v47 = v80;
    swift_bridgeObjectRetain(v49);
    uint64_t v91 = sub_1C5A4(v47, v49, &v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, v92, v55 + 24, v55 + 32);
    swift_bridgeObjectRelease_n(v49, 3LL);
    _os_log_impl( &dword_0,  v53,  v54,  "TimeInterval.getTimeComponents: hours %s, minutes %s, seconds %s",  (uint8_t *)v55,  0x20u);
    uint64_t v63 = v79;
    swift_arrayDestroy(v79, 3LL, (char *)&type metadata for Any + 8);
    os_log_type_t v13 = v87;
    swift_slowDealloc(v63, -1LL, -1LL);
    swift_slowDealloc(v55, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v49, 2LL);
    swift_bridgeObjectRelease_n(v35, 2LL);
    swift_bridgeObjectRelease_n(*((void *)&v51 + 1), 2LL);
  }

  swift_beginAccess(&v93, &v91, 0LL, 0LL);
  uint64_t v64 = *((void *)&v93 + 1);
  if (*((void *)&v93 + 1))
  {
    if ((void)v93 == 48LL && *((void *)&v93 + 1) == 0xE100000000000000LL)
    {
      swift_bridgeObjectRetain_n(*((void *)&v93 + 1), 2LL);

      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v89, v86);
      uint64_t v75 = v84;
      uint64_t v76 = *(void (**)(char *, uint64_t))(v83 + 8);
      v76(v81, v84);
      v76(v85, v75);
      swift_bridgeObjectRelease_n(v64, 2LL);
LABEL_33:
      uint64_t result = swift_bridgeObjectRelease(*((void *)&v93 + 1));
      __int128 v74 = 0uLL;
      goto LABEL_34;
    }

    char v66 = _stringCompareWithSmolCheck(_:_:expecting:)(v93, *((void *)&v93 + 1));
    swift_bridgeObjectRetain_n(v64, 2LL);

    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v89, v86);
    __int128 v67 = *(void (**)(char *, uint64_t))(v83 + 8);
    uint64_t v68 = v47;
    uint64_t v69 = v84;
    v67(v81, v84);
    uint64_t v70 = v69;
    uint64_t v47 = v68;
    v67(v85, v70);
    uint64_t result = swift_bridgeObjectRelease_n(v64, 2LL);
    if ((v66 & 1) != 0) {
      goto LABEL_33;
    }
  }

  else
  {

    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v89, v86);
    uint64_t v72 = v84;
    uint64_t v73 = *(void (**)(char *, uint64_t))(v83 + 8);
    v73(v81, v84);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v73)(v85, v72);
  }

  __int128 v74 = v93;
LABEL_34:
  uint64_t v77 = v88;
  *uint64_t v88 = v74;
  v77[2] = v34;
  v77[3] = v35;
  v77[4] = v47;
  v77[5] = v49;
  return result;
}

uint64_t sub_19830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6FC0(&qword_28328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_19878()
{
  unint64_t result = qword_28D00;
  if (!qword_28D00)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_28D00);
  }

  return result;
}

uint64_t sub_198B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v30 - v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
    uint64_t v10 = &_swiftEmptySetSingleton;
    goto LABEL_16;
  }

  sub_6FC0(&qword_28D10);
  uint64_t result = static _SetStorage.allocate(capacity:)(v8);
  uint64_t v10 = (void *)result;
  uint64_t v32 = *(void *)(a1 + 16);
  if (!v32)
  {
LABEL_16:
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v10;
  }

  unint64_t v11 = 0LL;
  uint64_t v34 = result + 56;
  uint64_t v12 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v30 = a1;
  uint64_t v31 = a1 + ((v12 + 32) & ~v12);
  while (v11 < *(void *)(a1 + 16))
  {
    uint64_t v13 = *(void *)(v35 + 72);
    uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
    v14(v7, v31 + v13 * v11, v2);
    uint64_t v15 = v10[5];
    uint64_t v16 = sub_19B8C(&qword_28D18, (uint64_t)&protocol conformance descriptor for Calendar.Component);
    uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v2, v16);
    uint64_t v18 = -1LL << *((_BYTE *)v10 + 32);
    unint64_t v19 = v17 & ~v18;
    unint64_t v20 = v19 >> 6;
    uint64_t v21 = *(void *)(v34 + 8 * (v19 >> 6));
    uint64_t v22 = 1LL << v19;
    if (((1LL << v19) & v21) != 0)
    {
      unint64_t v33 = v11;
      uint64_t v23 = ~v18;
      while (1)
      {
        v14(v5, v10[6] + v19 * v13, v2);
        uint64_t v24 = sub_19B8C(&qword_28D20, (uint64_t)&protocol conformance descriptor for Calendar.Component);
        char v25 = dispatch thunk of static Equatable.== infix(_:_:)(v5, v7, v2, v24);
        uint64_t v26 = *(void (**)(char *, uint64_t))(v35 + 8);
        v26(v5, v2);
        if ((v25 & 1) != 0) {
          break;
        }
        unint64_t v19 = (v19 + 1) & v23;
        unint64_t v20 = v19 >> 6;
        uint64_t v21 = *(void *)(v34 + 8 * (v19 >> 6));
        uint64_t v22 = 1LL << v19;
        if ((v21 & (1LL << v19)) == 0)
        {
          a1 = v30;
          unint64_t v11 = v33;
          goto LABEL_10;
        }
      }

      uint64_t result = ((uint64_t (*)(char *, uint64_t))v26)(v7, v2);
      a1 = v30;
      unint64_t v11 = v33;
    }

    else
    {
LABEL_10:
      *(void *)(v34 + 8 * v20) = v22 | v21;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v35 + 32))(v10[6] + v19 * v13, v7, v2);
      uint64_t v27 = v10[2];
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        goto LABEL_18;
      }
      v10[2] = v29;
    }

    if (++v11 == v32) {
      goto LABEL_16;
    }
  }

  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

void sub_19B3C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  [a3 setPositiveFormat:v5];
}

uint64_t sub_19B8C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for Calendar.Component(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_19BCC()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( v2 - 144,  v2 - 160,  0LL,  0LL,  0LL,  1LL,  v0,  v0,  v0,  v1);
}

uint64_t sub_19BF8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_19C0C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_19C20()
{
  return swift_beginAccess(v0 - 240, v0 - 264, 0LL, 0LL);
}

void sub_19C34()
{
  *(void *)(v2 - 264) = v0;
  *(void *)(v2 - 256) = v1;
}

void sub_19C44()
{
  *(void *)(v2 - 264) = v0;
  *(void *)(v2 - 256) = v1;
}

void sub_19C58()
{
  *(void *)(v2 - 264) = v0;
  *(void *)(v2 - 256) = v1;
}

void sub_19C6C()
{
  *(void *)(v2 - 264) = v0;
  *(void *)(v2 - 256) = v1;
}

uint64_t sub_19C80()
{
  return v0;
}

void sub_19C94()
{
}

unint64_t sub_19CA0(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[3].n128_u64[1] = v2;
  return sub_19878();
}

void ComposeTimerSnippet.init(snippetModel:)(_OWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Context(0LL);
  sub_78F8(&qword_281C0, (uint64_t (*)(uint64_t))&type metadata accessor for Context);
  *a2 = EnvironmentObject.init()(v4, v5);
  a2[1] = v6;
  uint64_t v7 = sub_1B0D8();
  _s13TimerUIPlugin07ComposeA7SnippetV20_interactionDelegate33_72C0F54402B260C409E0864AF7B13339LL0D2UI011InteractionF0Vvpfi_0();
  uint64_t v8 = (_OWORD *)((char *)a2 + *(int *)(v7 + 24));
  __int128 v9 = a1[1];
  *uint64_t v8 = *a1;
  v8[1] = v9;
  __int128 v10 = a1[3];
  v8[2] = a1[2];
  v8[3] = v10;
  sub_90CC();
}

uint64_t type metadata accessor for ComposeTimerSnippet(uint64_t a1)
{
  uint64_t result = qword_28D90;
  if (!qword_28D90) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ComposeTimerSnippet);
  }
  return result;
}

void ComposeTimerSnippet.body.getter(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v2 = sub_1B0D8();
  uint64_t v3 = *(void *)(*(void *)(v2 - 8) + 64LL);
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v3;
  __chkstk_darwin(v2);
  uint64_t v4 = type metadata accessor for NavigationHeader(0LL);
  __chkstk_darwin(v4);
  sub_9020();
  uint64_t v35 = v6 - v5;
  uint64_t v7 = (void *)(v1 + *(int *)(v2 + 24));
  uint64_t v8 = v7[1];
  v38[0] = *v7;
  v38[1] = v8;
  sub_8D88();
  uint64_t v9 = swift_bridgeObjectRetain(v8);
  uint64_t v10 = sub_1B130(v9, (uint64_t)&type metadata for String);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15 & 1;
  uint64_t v17 = static Font.headline.getter();
  uint64_t v18 = Text.font(_:)(v17, v10, v12, v16, v14);
  uint64_t v20 = v19;
  char v22 = v21;
  uint64_t v24 = v23;
  swift_release(v17);
  sub_8DC4(v10, v12, v16);
  swift_bridgeObjectRelease(v14);
  v38[3] = &type metadata for Text;
  v38[4] = &protocol witness table for Text;
  uint64_t v25 = sub_91A0((uint64_t)&unk_260E0);
  v38[0] = v25;
  *(void *)(v25 + 16) = v18;
  *(void *)(v25 + 24) = v20;
  *(_BYTE *)(v25 + 32) = v22 & 1;
  *(void *)(v25 + 40) = v24;
  v37[3] = type metadata accessor for RFImage(0LL);
  void v37[4] = &protocol witness table for RFImage;
  sub_19FD8(v37);
  sub_1B0E0();
  sub_1B154();
  uint64_t v26 = sub_1B148((uint64_t)&unk_26108);
  uint64_t v27 = sub_1B13C(v26);
  uint64_t v28 = static Color.orange.getter(v27);
  uint64_t v29 = v35;
  NavigationHeader.init(text1:thumbnail:thumbnailTapAction:thumbnailColor:)(v38, v37, sub_1A0A0, v26, v28);
  sub_1B154();
  uint64_t v30 = sub_1B148((uint64_t)&unk_26130);
  sub_1B13C(v30);
  uint64_t v31 = sub_6FC0(&qword_28D28);
  sub_8F78(&qword_28D30, &qword_28D28);
  CompositionView.init(header:parameters:)(v29, sub_1A324, v30, v31, v32);
  sub_9008();
}

uint64_t sub_19FA8()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

void *sub_19FD8(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_1A014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComposeTimerSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A05C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ComposeTimerSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_1A0A4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_6FC0(&qword_28DE0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v26[-1] - v8;
  uint64_t v10 = sub_6FC0(&qword_28DE8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v26[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  char v15 = (char *)&v26[-1] - v14;
  sub_1A36C((uint64_t)&v26[-1] - v14);
  uint64_t v16 = a1 + *(int *)(type metadata accessor for ComposeTimerSnippet(0LL) + 24);
  uint64_t v17 = *(void *)(v16 + 40);
  if (v17)
  {
    uint64_t v18 = *(void *)(v16 + 32);
    v26[3] = type metadata accessor for RFImage(0LL);
    v26[4] = &protocol witness table for RFImage;
    sub_19FD8(v26);
    swift_bridgeObjectRetain(v17);
    static RFImage.symbol(_:dark:)(0xD000000000000016LL, 0x800000000001FB00LL, 0LL, 0LL);
    uint64_t v19 = swift_allocObject(&unk_26158, 32LL, 7LL);
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    uint64_t v20 = type metadata accessor for CompositionToken(0LL);
    sub_78F8(&qword_28E00, (uint64_t (*)(uint64_t))&type metadata accessor for CompositionToken);
    CompositionParameter.init(thumbnail:tokens:)(v26, sub_1AF80, v19, v20, v21);
    uint64_t v22 = 0LL;
  }

  else
  {
    uint64_t v22 = 1LL;
  }

  uint64_t v23 = sub_6FC0(&qword_28DF0);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v9, v22, 1LL, v23);
  sub_1AF1C((uint64_t)v15, (uint64_t)v13, &qword_28DE8);
  sub_1AF1C((uint64_t)v9, (uint64_t)v7, &qword_28DE0);
  sub_1AF1C((uint64_t)v13, a2, &qword_28DE8);
  uint64_t v24 = sub_6FC0(&qword_28DF8);
  sub_1AF1C((uint64_t)v7, a2 + *(int *)(v24 + 48), &qword_28DE0);
  sub_13730((uint64_t)v9, &qword_28DE0);
  sub_13730((uint64_t)v15, &qword_28DE8);
  sub_13730((uint64_t)v7, &qword_28DE0);
  sub_13730((uint64_t)v13, &qword_28DE8);
}

void sub_1A324(uint64_t a1@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(sub_1B0D8() - 8) + 80LL);
  sub_1A0A4(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_1A35C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of ComposeTimerSnippet.body>>,  1LL);
}

void sub_1A36C(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v2 = type metadata accessor for CompositionPrompt(0LL);
  uint64_t v41 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_9020();
  uint64_t v5 = v4 - v3;
  uint64_t v42 = sub_6FC0(&qword_28E08);
  __chkstk_darwin(v42);
  sub_9020();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_1B0D8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v43 = sub_6FC0(&qword_28DF0);
  uint64_t v12 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  sub_9020();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = (void *)(v1 + *(int *)(v9 + 24));
  uint64_t v17 = v16[7];
  if (v17)
  {
    uint64_t v41 = v2;
    uint64_t v18 = v16[6];
    uint64_t v47 = (void *)type metadata accessor for RFImage(0LL);
    unint64_t v48 = &protocol witness table for RFImage;
    sub_19FD8(&v45);
    swift_bridgeObjectRetain(v17);
    sub_1B0E0();
    sub_1A014(v1, (uint64_t)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    uint64_t v19 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v20 = (v19 + 32) & ~v19;
    uint64_t v21 = swift_allocObject(&unk_26180, v20 + v11, v19 | 7);
    *(void *)(v21 + 16) = v18;
    *(void *)(v21 + 24) = v17;
    sub_1A05C((uint64_t)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), v21 + v20);
    uint64_t v22 = type metadata accessor for CompositionToken(0LL);
    sub_78F8(&qword_28E00, (uint64_t (*)(uint64_t))&type metadata accessor for CompositionToken);
    CompositionParameter.init(thumbnail:tokens:)(&v45, sub_1B00C, v21, v22, v23);
    uint64_t v24 = v43;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v8, v15, v43);
    swift_storeEnumTagMultiPayload(v8, v42, 0LL);
    sub_8F78(&qword_28E10, &qword_28DF0);
    uint64_t v26 = v25;
    sub_78F8(&qword_28E18, (uint64_t (*)(uint64_t))&type metadata accessor for CompositionPrompt);
    _ConditionalContent<>.init(storage:)(v8, v24, v41, v26, v27);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v24);
  }

  else
  {
    uint64_t v46 = v16[3];
    sub_8D88();
    uint64_t v28 = swift_bridgeObjectRetain(v46);
    uint64_t v29 = sub_1B130(v28, (uint64_t)&type metadata for String);
    uint64_t v31 = v30;
    char v33 = v32;
    uint64_t v35 = v34;
    uint64_t v47 = &type metadata for Text;
    unint64_t v48 = &protocol witness table for Text;
    uint64_t v36 = sub_91A0((uint64_t)&unk_260E0);
    uint64_t v45 = v36;
    *(void *)(v36 + 16) = v29;
    *(void *)(v36 + 24) = v31;
    *(_BYTE *)(v36 + 32) = v33 & 1;
    *(void *)(v36 + 40) = v35;
    CompositionPrompt.init(prompt:)(&v45);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v8, v5, v2);
    swift_storeEnumTagMultiPayload(v8, v42, 1LL);
    sub_8F78(&qword_28E10, &qword_28DF0);
    uint64_t v38 = v37;
    sub_78F8(&qword_28E18, (uint64_t (*)(uint64_t))&type metadata accessor for CompositionPrompt);
    _ConditionalContent<>.init(storage:)(v8, v43, v2, v38, v39);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v5, v2);
  }

  sub_9008();
}

uint64_t sub_1A6CC(uint64_t a1, uint64_t a2)
{
  v13[0] = a1;
  v13[1] = a2;
  unint64_t v3 = sub_8D88();
  swift_bridgeObjectRetain(a2);
  uint64_t v4 = Text.init<A>(_:)(v13, &type metadata for String, v3);
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  v13[3] = &type metadata for Text;
  v13[4] = &protocol witness table for Text;
  uint64_t v11 = swift_allocObject(&unk_260E0, 48LL, 7LL);
  v13[0] = v11;
  *(void *)(v11 + 16) = v4;
  *(void *)(v11 + 24) = v6;
  *(_BYTE *)(v11 + 32) = v8 & 1;
  *(void *)(v11 + 40) = v10;
  return CompositionToken.init(text1:tapAction:)(v13, 0LL, 0LL);
}

uint64_t sub_1A78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ComposeTimerSnippet(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  v23[0] = a1;
  v23[1] = a2;
  unint64_t v9 = sub_8D88();
  swift_bridgeObjectRetain(a2);
  uint64_t v10 = Text.init<A>(_:)(v23, &type metadata for String, v9);
  uint64_t v12 = v11;
  char v14 = v13;
  uint64_t v16 = v15;
  v23[3] = &type metadata for Text;
  v23[4] = &protocol witness table for Text;
  uint64_t v17 = swift_allocObject(&unk_260E0, 48LL, 7LL);
  v23[0] = v17;
  *(void *)(v17 + 16) = v10;
  *(void *)(v17 + 24) = v12;
  *(_BYTE *)(v17 + 32) = v14 & 1;
  *(void *)(v17 + 40) = v16;
  sub_1A014(a3, (uint64_t)&v23[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v18 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = (v18 + 16) & ~v18;
  uint64_t v20 = swift_allocObject(&unk_261A8, v19 + v8, v18 | 7);
  sub_1A05C((uint64_t)&v23[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL), v20 + v19);
  return CompositionToken.init(text1:tapAction:)(v23, sub_1A0A0, v20);
}

char *initializeBufferWithCopyOfBuffer for ComposeTimerSnippet(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v4 = *a2;
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
    unint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for InteractionDelegate(0LL);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL);
    char v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = &v7[v14];
    uint64_t v16 = (char **)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *(void *)uint64_t v15 = *v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = v16[3];
    *((void *)v15 + 2) = v16[2];
    *((void *)v15 + 3) = v18;
    uint64_t v19 = v16[5];
    *((void *)v15 + 4) = v16[4];
    *((void *)v15 + 5) = v19;
    uint64_t v20 = v16[7];
    *((void *)v15 + 6) = v16[6];
    *((void *)v15 + 7) = v20;
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v20);
  }

  return v7;
}

uint64_t destroy for ComposeTimerSnippet(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = (id *)((char *)a1 + *(int *)(a2 + 24));
  swift_bridgeObjectRelease(v6[1]);
  swift_bridgeObjectRelease(v6[3]);
  swift_bridgeObjectRelease(v6[5]);
  return swift_bridgeObjectRelease(v6[7]);
}

void *initializeWithCopy for ComposeTimerSnippet(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = *(int *)(a3 + 20);
  unint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for InteractionDelegate(0LL);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL);
  id v13 = v7;
  v12(v9, v10, v11);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v16[3];
  _OWORD v15[2] = v16[2];
  v15[3] = v18;
  uint64_t v19 = v16[5];
  v15[4] = v16[4];
  v15[5] = v19;
  uint64_t v20 = v16[7];
  v15[6] = v16[6];
  v15[7] = v20;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v20);
  return a1;
}

uint64_t assignWithCopy for ComposeTimerSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24LL))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  uint64_t v16 = v15[1];
  uint64_t v17 = *(void *)(a1 + v13 + 8);
  v14[1] = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  v14[2] = v15[2];
  uint64_t v18 = v15[3];
  uint64_t v19 = v14[3];
  v14[3] = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  v14[4] = v15[4];
  uint64_t v20 = v15[5];
  uint64_t v21 = v14[5];
  v14[5] = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  v14[6] = v15[6];
  uint64_t v22 = v15[7];
  uint64_t v23 = v14[7];
  v14[7] = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  return a1;
}

_OWORD *initializeWithTake for ComposeTimerSnippet(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (_OWORD *)((char *)a1 + v10);
  uint64_t v12 = (_OWORD *)((char *)a2 + v10);
  __int128 v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  __int128 v14 = v12[3];
  v11[2] = v12[2];
  v11[3] = v14;
  return a1;
}

uint64_t assignWithTake for ComposeTimerSnippet(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for InteractionDelegate(0LL);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  __int128 v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  uint64_t v15 = *(void *)(a1 + v11 + 8);
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = v13[3];
  uint64_t v17 = v12[3];
  v12[2] = v13[2];
  v12[3] = v16;
  swift_bridgeObjectRelease(v17);
  uint64_t v18 = v13[5];
  uint64_t v19 = v12[5];
  __n128 v12[4] = v13[4];
  v12[5] = v18;
  swift_bridgeObjectRelease(v19);
  uint64_t v20 = v13[7];
  uint64_t v21 = v12[7];
  v12[6] = v13[6];
  v12[7] = v20;
  swift_bridgeObjectRelease(v21);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComposeTimerSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1AD74);
}

uint64_t sub_1AD74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InteractionDelegate(0LL);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2) {
    return _s13TimerUIPlugin19SiriTimePluginModelOwet_0(a1 + *(int *)(a3 + 20), a2, v6);
  }
  unint64_t v8 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v8 >= 0xFFFFFFFF) {
    LODWORD(v8) = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ComposeTimerSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1AE00);
}

void sub_1AE00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for InteractionDelegate(0LL);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    _s13TimerUIPlugin19SiriTimePluginModelOwst_0(a1 + *(int *)(a4 + 20), a2, a2, v8);
  }

  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
    sub_90CC();
  }

uint64_t sub_1AE74(uint64_t a1)
{
  v4[0] = &unk_1F788;
  uint64_t result = type metadata accessor for InteractionDelegate(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    void v4[2] = &unk_1F7A0;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void sub_1AEF0()
{
}

void sub_1AF1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_6FC0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  sub_905C();
}

uint64_t sub_1AF5C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1AF80()
{
  return sub_1A6CC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1AF88()
{
  uint64_t v1 = (void *)sub_1B0D8();
  uint64_t v2 = *(v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease(*(void *)(v0 + 24));

  uint64_t v7 = sub_1B120();
  sub_1B0FC(v7);
  sub_1B110();
  swift_bridgeObjectRelease(v1[3]);
  swift_bridgeObjectRelease(v1[5]);
  swift_bridgeObjectRelease(v1[7]);
  return sub_1B0C8(v0, v5, v6);
}

uint64_t sub_1B00C()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(sub_1B0D8() - 8) + 80LL);
  return sub_1A78C(*(void *)(v0 + 16), *(void *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_1B04C()
{
  uint64_t v1 = (void *)sub_1B0D8();
  uint64_t v2 = *(v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  uint64_t v7 = sub_1B120();
  sub_1B0FC(v7);
  sub_1B110();
  swift_bridgeObjectRelease(v1[3]);
  swift_bridgeObjectRelease(v1[5]);
  swift_bridgeObjectRelease(v1[7]);
  return sub_1B0C8(v0, v5, v6);
}

uint64_t sub_1B0C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_deallocObject(a1, a2, a3);
}

uint64_t sub_1B0D8()
{
  return type metadata accessor for ComposeTimerSnippet(0LL);
}

uint64_t sub_1B0E0()
{
  return static RFImage.symbol(_:dark:)(0x72656D6974LL, 0xE500000000000000LL, 0LL, 0LL);
}

uint64_t sub_1B0FC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_1B110()
{
  return swift_bridgeObjectRelease(*(void *)(v1 + *(int *)(v0 + 24) + 8));
}

uint64_t sub_1B120()
{
  return type metadata accessor for InteractionDelegate(0LL);
}

uint64_t sub_1B130(uint64_t a1, uint64_t a2)
{
  return Text.init<A>(_:)(v3 - 120, a2, v2);
}

uint64_t sub_1B13C(uint64_t a1)
{
  return sub_1A05C(v1, a1 + v2);
}

uint64_t sub_1B148(uint64_t a1)
{
  return swift_allocObject(a1, v1, v2);
}

uint64_t sub_1B154()
{
  return sub_1A014(v1, v0);
}

uint64_t sub_1B160@<X0>( double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, void *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v19 = a17;
  uint64_t v20 = a15;
  uint64_t v21 = a16;
  uint64_t v22 = a14;
  double v23 = a12;
  double v24 = a10;
  uint64_t v25 = a2 & 1;
  double v26 = a1;
  if ((_DWORD)v25) {
    double v26 = -INFINITY;
  }
  uint64_t v27 = a4 & 1;
  double v28 = a3;
  if ((_DWORD)v27) {
    double v28 = v26;
  }
  uint64_t v29 = a6 & 1;
  uint64_t v30 = a8 & 1;
  double v31 = a5;
  if ((a6 & 1) != 0) {
    double v31 = v28;
  }
  if (v26 > v28 || v28 > v31) {
    goto LABEL_22;
  }
  double v33 = a7;
  if ((a8 & 1) != 0) {
    double v33 = -INFINITY;
  }
  double v34 = a10;
  if ((a11 & 1) != 0) {
    double v34 = v33;
  }
  double v35 = a12;
  if ((a13 & 1) != 0) {
    double v35 = v34;
  }
  if (v33 > v34 || v34 > v35)
  {
LABEL_22:
    double v44 = a5;
    double v45 = a7;
    double v42 = a3;
    double v43 = a1;
    unsigned int v41 = v25;
    unsigned int v40 = v27;
    uint64_t v37 = static os_log_type_t.fault.getter();
    uint64_t v38 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)( v37,  &dword_0,  v38,  "Contradictory frame constraints specified.",  42LL,  2LL,  &_swiftEmptyArrayStorage);

    uint64_t v27 = v40;
    uint64_t v22 = a14;
    uint64_t v20 = a15;
    uint64_t v25 = v41;
    double v24 = a10;
    double v23 = a12;
    a3 = v42;
    a1 = v43;
    a5 = v44;
    a7 = v45;
    uint64_t v19 = a17;
    uint64_t v21 = a16;
  }

  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( __src,  *(void *)&a1,  v25,  *(void *)&a3,  v27,  *(void *)&a5,  v29,  *(void *)&a7,  v30,  *(void *)&v24,  a11 & 1,  *(void *)&v23,  a13 & 1,  v22,  v20);
  *a9 = v21;
  a9[1] = v19;
  a9[2] = a18;
  memcpy(a9 + 3, __src, 0x70uLL);
  swift_retain(a18);
  swift_retain(v21);
  return swift_retain(v19);
}

void *sub_1B30C@<X0>( double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
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
    double v34 = (void *)static Log.runtimeIssuesLog.getter();
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
  sub_1AF1C(v16, a9, &qword_28E40);
  uint64_t v35 = sub_6FC0(&qword_28E48);
  return memcpy((void *)(a9 + *(int *)(v35 + 36)), __src, 0x70uLL);
}

__n128 sub_1B4A8@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X8>)
{
  uint64_t v47 = v8 - v7;
  double v9 = 0.0;
  sub_188D8(0.0);
  uint64_t v48 = v10;
  uint64_t v49 = v11;
  sub_1D230(v10, (uint64_t)&type metadata for String);
  unint64_t v12 = v51;
  unint64_t v46 = v50.n128_u64[1];
  id v13 = [objc_allocWithZone(MTTimerManager) init];
  id v14 = [v13 getCurrentTimerSync];
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 remainingTime];
    double v9 = v16;
  }

  if (qword_281B8 != -1) {
    swift_once(&qword_281B8, sub_1B84C);
  }
  uint64_t v17 = type metadata accessor for Logger(0LL);
  uint64_t v18 = sub_6D9C(v17, (uint64_t)qword_28E20);
  double v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    unint64_t v44 = v51;
    uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    v50.n128_u64[0] = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v23 = Double.description.getter(v9);
    unint64_t v25 = v24;
    uint64_t v48 = sub_1C5A4(v23, v24, (uint64_t *)&v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease(v25);
    _os_log_impl(&dword_0, v19, v20, "TimerDurationViewLegacy: Timer initial remaining time: %s", v21, 0xCu);
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    sub_9128(v22);
    uint64_t v26 = (uint64_t)v21;
    unint64_t v12 = v44;
    sub_9128(v26);
  }

  id v27 = v15;
  sub_1B8C0(v15);
  uint64_t v29 = v28;
  uint64_t v31 = v30;

  uint64_t v48 = v29;
  uint64_t v49 = v31;
  sub_1D230(v32, (uint64_t)&type metadata for String);
  __n128 v45 = v50;
  unint64_t v33 = v51;
  swift_bridgeObjectRelease(v46);
  swift_release(v12);
  id v34 = [(id)objc_opt_self(NSRunLoop) mainRunLoop];
  sub_1BAEC();
  uint64_t v35 = type metadata accessor for NSRunLoop.SchedulerOptions(0LL);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0(v47, 1LL, 1LL, v35);
  uint64_t v36 = static NSTimer.publish(every:tolerance:on:in:options:)(0LL, 1LL, v34, NSRunLoopCommonModes, v47, 0.5);
  sub_13730(v47, &qword_28318);
  v50.n128_u64[0] = v36;
  uint64_t v37 = type metadata accessor for NSTimer.TimerPublisher(0LL);
  unint64_t v38 = sub_1BB28();
  uint64_t v39 = ConnectablePublisher.autoconnect()(v37, v38);
  swift_release(v36);
  v50.n128_u64[0] = v39;
  uint64_t v40 = sub_6FC0(&qword_28340);
  sub_1D004(&qword_28348, &qword_28340, (uint64_t)&protocol conformance descriptor for Publishers.Autoconnect<A>);
  uint64_t v42 = Publisher.eraseToAnyPublisher()(v40, v41);
  swift_release(v39);

  __n128 result = v45;
  *a3 = v45;
  a3[1].n128_u64[0] = v33;
  a3[1].n128_u64[1] = a1;
  a3[2].n128_u64[0] = a2;
  a3[2].n128_u64[1] = (unint64_t)v13;
  a3[3].n128_u64[0] = v42;
  a3[3].n128_u64[1] = (unint64_t)v15;
  return result;
}

uint64_t sub_1B84C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_6E94(v0, qword_28E20);
  sub_6D9C(v0, (uint64_t)qword_28E20);
  return Logger.init(subsystem:category:)( 0xD000000000000013LL,  0x800000000001F8A0LL,  0x495572656D6974LL,  0xE700000000000000LL);
}

void sub_1B8C0(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    double v2 = 0.0;
    if ([v1 state] != (char *)&dword_0 + 1)
    {
      [v1 remainingTime];
      double v2 = v3;
    }

    if (qword_281B8 != -1) {
      swift_once(&qword_281B8, sub_1B84C);
    }
    uint64_t v4 = type metadata accessor for Logger(0LL);
    uint64_t v5 = sub_6D9C(v4, (uint64_t)qword_28E20);
    uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v8 = 134217984;
      double v14 = v2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v8 + 4, v8 + 12);
      _os_log_impl(&dword_0, v6, v7, "TimerDurationViewLegacy: timeRemaining %f", v8, 0xCu);
      swift_slowDealloc(v8, -1LL, -1LL);
    }

    sub_188D8(v2);
  }

  else
  {
    if (qword_281B8 != -1) {
      swift_once(&qword_281B8, sub_1B84C);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    uint64_t v10 = sub_6D9C(v9, (uint64_t)qword_28E20);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v13 = 0;
      _os_log_impl( &dword_0,  v11,  v12,  "TimerUIPlugin (Legacy): MTTimer missing in call for durationString(for:)",  v13,  2u);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    sub_188D8(0.0);
  }

unint64_t sub_1BAEC()
{
  unint64_t result = qword_28330;
  if (!qword_28330)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSTimer);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_28330);
  }

  return result;
}

unint64_t sub_1BB28()
{
  unint64_t result = qword_28338;
  if (!qword_28338)
  {
    uint64_t v1 = type metadata accessor for NSTimer.TimerPublisher(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSTimer.TimerPublisher, v1);
    atomic_store(result, (unint64_t *)&qword_28338);
  }

  return result;
}

void sub_1BB68()
{
  uint64_t v1 = v0;
  sub_6FC0(&qword_28E40);
  sub_9030();
  __chkstk_darwin(v2);
  sub_9020();
  uint64_t v5 = v4 - v3;
  sub_6FC0(&qword_28E48);
  sub_9030();
  __chkstk_darwin(v6);
  sub_9020();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_6FC0(&qword_28E50);
  sub_9030();
  __chkstk_darwin(v11);
  sub_9020();
  uint64_t v14 = v13 - v12;
  *(void *)uint64_t v5 = static HorizontalAlignment.center.getter();
  *(void *)(v5 + 8) = 0LL;
  *(_BYTE *)(v5 + 16) = 1;
  uint64_t v15 = sub_6FC0(&qword_28E58);
  uint64_t v16 = sub_1BD88((__int128 *)v1, v5 + *(int *)(v15 + 44));
  uint64_t v17 = static Alignment.center.getter(v16);
  sub_1B30C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v9, 0.0, 1, 0.0, 1, v17, v18);
  sub_13730(v5, &qword_28E40);
  uint64_t v23 = *(void *)(v1 + 48);
  uint64_t v19 = sub_1D224((uint64_t)&unk_26298);
  sub_1D23C(v19);
  sub_1AF1C(v9, v14, &qword_28E48);
  *(void *)(v14 + *(int *)(v10 + 52)) = v23;
  os_log_type_t v20 = (uint64_t (**)(uint64_t))(v14 + *(int *)(v10 + 56));
  *os_log_type_t v20 = sub_1CF2C;
  v20[1] = (uint64_t (*)(uint64_t))v19;
  sub_13030(&v23);
  sub_1CF34(v1);
  sub_13730(v9, &qword_28E48);
  uint64_t v21 = sub_1D224((uint64_t)&unk_262C0);
  sub_1D23C(v21);
  sub_1CF34(v1);
  sub_1D004(&qword_28E60, &qword_28E50, (uint64_t)&protocol conformance descriptor for SubscriptionView<A, B>);
  View.onTapGesture(count:perform:)(1LL, sub_1CFE8, v21, v10, v22);
  swift_release(v21);
  sub_13730(v14, &qword_28E50);
}

uint64_t sub_1BD88@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&__int128 v81 = a2;
  uint64_t v3 = sub_6FC0(&qword_28CC0);
  __chkstk_darwin(v3);
  uint64_t KeyPath = &v69[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v5 = sub_6FC0(&qword_28E70);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v82 = &v69[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v6);
  uint64_t v9 = &v69[-v8];
  uint64_t v10 = sub_6FC0(&qword_28E78);
  __chkstk_darwin(v10);
  uint64_t v12 = &v69[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = type metadata accessor for SashStandard.Title(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = &v69[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v17 = type metadata accessor for SashStandard(0LL);
  __chkstk_darwin(v17);
  uint64_t v19 = &v69[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v80 = type metadata accessor for SashStandardView(0LL);
  uint64_t v84 = *(void *)(v80 - 8);
  uint64_t v20 = __chkstk_darwin(v80);
  uint64_t v85 = &v69[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v20);
  uint64_t v23 = &v69[-v22];
  uint64_t v24 = *((void *)a1 + 4);
  *uint64_t v16 = *((void *)a1 + 3);
  v16[1] = v24;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))( v16,  enum case for SashStandard.Title.applicationBundleIdentifier(_:),  v13);
  uint64_t v25 = type metadata accessor for VisualProperty(0LL);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v12, 1LL, 1LL, v25);
  uint64_t v26 = type metadata accessor for Color(0LL);
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v9, 1LL, 1LL, v26);
  id v27 = v82;
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)v82, 1LL, 1LL, v26);
  uint64_t v100 = 0LL;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  swift_bridgeObjectRetain(v24);
  SashStandard.init(title:thumbnail:titleColor:backgroundColor:action:componentName:showOnWatch:)( v16,  v12,  v9,  v27,  &v98,  0LL,  0xE000000000000000LL,  0LL);
  uint64_t v28 = v23;
  SashStandardView.init(model:)(v19);
  __int128 v98 = *a1;
  *(void *)&__int128 v99 = *((void *)a1 + 2);
  uint64_t v29 = sub_6FC0(&qword_28E68);
  State.wrappedValue.getter(v97, v29);
  uint64_t v31 = *((void *)&v97[0] + 1);
  uint64_t v30 = *(void *)&v97[0];
  uint64_t v32 = type metadata accessor for Font.Design(0LL);
  unint64_t v33 = KeyPath;
  _s13TimerUIPlugin19SiriTimePluginModelOwst_0((uint64_t)KeyPath, 1LL, 1LL, v32);
  uint64_t v34 = static Font.system(size:weight:design:)(0LL, 1LL, v33, 50.0);
  sub_13730((uint64_t)v33, &qword_28CC0);
  static Font.Weight.regular.getter();
  uint64_t v35 = Font.weight(_:)(v34);
  swift_release(v34);
  uint64_t v36 = Font.monospacedDigit()(v35);
  swift_release(v35);
  uint64_t v37 = Text.font(_:)(v36, v30, v31, 0LL, &_swiftEmptyArrayStorage);
  uint64_t v78 = v38;
  uint64_t v79 = v37;
  char v40 = v39;
  uint64_t v82 = v41;
  swift_bridgeObjectRelease(v31);
  swift_release(v36);
  uint64_t KeyPath = (_BYTE *)swift_getKeyPath(&unk_1F838);
  uint64_t v77 = swift_getKeyPath(&unk_1F868);
  unsigned int v42 = static Edge.Set.bottom.getter();
  uint64_t v43 = Edge.Set.init(rawValue:)(0LL);
  int v44 = v43;
  int v45 = Edge.Set.init(rawValue:)(v43);
  int v70 = v44;
  double v46 = EdgeInsets.init(_all:)(15.0);
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  unsigned __int8 v92 = v40 & 1;
  unsigned __int8 v91 = 0;
  unsigned __int8 v90 = 0;
  uint64_t v75 = static Color.clear.getter();
  int v53 = static Edge.Set.all.getter(v75);
  unsigned __int8 v54 = v92;
  unsigned __int8 v55 = v91;
  int v71 = v91;
  int v72 = v92;
  int v73 = v90;
  int v74 = v53;
  uint64_t v56 = v85;
  uint64_t v57 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v84 + 16);
  uint64_t v76 = v28;
  uint64_t v58 = v80;
  v57(v85, v28, v80);
  v89[0] = *(_DWORD *)v96;
  *(_DWORD *)((char *)v89 + 3) = *(_DWORD *)&v96[3];
  v88[0] = *(_DWORD *)v95;
  *(_DWORD *)((char *)v88 + 3) = *(_DWORD *)&v95[3];
  v87[0] = *(_DWORD *)v94;
  *(_DWORD *)((char *)v87 + 3) = *(_DWORD *)&v94[3];
  *(_DWORD *)((char *)v86 + 3) = *(_DWORD *)&v93[3];
  v86[0] = *(_DWORD *)v93;
  uint64_t v59 = v81;
  v57((_BYTE *)v81, v56, v58);
  unint64_t v60 = (void *)(v59 + *(int *)(sub_6FC0((uint64_t *)&unk_28E80) + 48));
  uint64_t v61 = v78;
  uint64_t v62 = v79;
  *(void *)&v97[0] = v79;
  *((void *)&v97[0] + 1) = v78;
  LOBYTE(v97[1]) = v54;
  *(_DWORD *)((char *)&v97[1] + 1) = v89[0];
  DWORD1(v97[1]) = *(_DWORD *)((char *)v89 + 3);
  *((void *)&v97[1] + 1) = v82;
  *(void *)&v97[2] = KeyPath;
  *((void *)&v97[2] + 1) = 1LL;
  LOBYTE(v97[3]) = v55;
  *(_DWORD *)((char *)&v97[3] + 1) = v88[0];
  DWORD1(v97[3]) = *(_DWORD *)((char *)v88 + 3);
  uint64_t v63 = v77;
  *((void *)&v97[3] + 1) = v77;
  __int128 v81 = xmmword_1F7C0;
  v97[4] = xmmword_1F7C0;
  LOBYTE(v97[5]) = v44;
  DWORD1(v97[5]) = *(_DWORD *)((char *)v87 + 3);
  *(_DWORD *)((char *)&v97[5] + 1) = v87[0];
  *((double *)&v97[5] + 1) = v46;
  *(void *)&v97[6] = v48;
  *((void *)&v97[6] + 1) = v50;
  *(void *)&v97[7] = v52;
  char v65 = v73;
  char v64 = v74;
  BYTE8(v97[7]) = v73;
  HIDWORD(v97[7]) = *(_DWORD *)((char *)v86 + 3);
  *(_DWORD *)((char *)&v97[7] + 9) = v86[0];
  uint64_t v66 = v75;
  *(void *)&v97[8] = v75;
  BYTE8(v97[8]) = v74;
  memcpy(v60, v97, 0x89uLL);
  sub_1D0E8((uint64_t)v97);
  __int128 v67 = *(void (**)(_BYTE *, uint64_t))(v84 + 8);
  v67(v76, v58);
  *(void *)&__int128 v98 = v62;
  *((void *)&v98 + 1) = v61;
  LOBYTE(v99) = v72;
  *(_DWORD *)((char *)&v99 + 1) = v89[0];
  DWORD1(v99) = *(_DWORD *)((char *)v89 + 3);
  *((void *)&v99 + 1) = v82;
  uint64_t v100 = KeyPath;
  uint64_t v101 = 1LL;
  char v102 = v71;
  *(_DWORD *)uint64_t v103 = v88[0];
  *(_DWORD *)&v103[3] = *(_DWORD *)((char *)v88 + 3);
  uint64_t v104 = v63;
  __int128 v105 = v81;
  char v106 = v70;
  *(_DWORD *)&v107[3] = *(_DWORD *)((char *)v87 + 3);
  *(_DWORD *)uint64_t v107 = v87[0];
  double v108 = v46;
  uint64_t v109 = v48;
  uint64_t v110 = v50;
  uint64_t v111 = v52;
  char v112 = v65;
  *(_DWORD *)&v113[3] = *(_DWORD *)((char *)v86 + 3);
  *(_DWORD *)id v113 = v86[0];
  uint64_t v114 = v66;
  char v115 = v64;
  sub_1D154((uint64_t)&v98);
  return ((uint64_t (*)(_BYTE *, uint64_t))v67)(v85, v58);
}

uint64_t sub_1C3B4(uint64_t a1, void **a2)
{
  __int128 v8 = *(_OWORD *)a2;
  uint64_t v9 = a2[2];
  v7[0] = v3;
  v7[1] = v4;
  uint64_t v5 = sub_6FC0(&qword_28E68);
  return State.wrappedValue.setter(v7, v5);
}

void sub_1C410()
{
  id v0 = [(id)objc_opt_self(FBSOpenApplicationService) serviceWithDefaultShellEndpoint];
  if (v0)
  {
    id v1 = v0;
    NSString v2 = String._bridgeToObjectiveC()();
    oslog = (os_log_s *)[objc_allocWithZone(FBSOpenApplicationOptions) init];
    objc_msgSend(v1, "openApplication:withOptions:completion:", v2);
  }

  else
  {
    if (qword_281B8 != -1) {
      swift_once(&qword_281B8, sub_1B84C);
    }
    uint64_t v3 = type metadata accessor for Logger(0LL);
    uint64_t v4 = sub_6D9C(v3, (uint64_t)qword_28E20);
    oslog = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, oslog, v5, "TimerDurationViewLegacy: Failed to launch clock app!", v6, 2u);
      swift_slowDealloc(v6, -1LL, -1LL);
    }
  }
}

void sub_1C56C()
{
}

uint64_t sub_1C5A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C674(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    __int128 v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_7E7C((uint64_t)v12, *a3);
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
      sub_7E7C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10BE8(v12);
  return v7;
}

void *sub_1C674(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1C7C8((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    unint64_t result = sub_1C88C(a5, a6);
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
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

void *sub_1C7C8(char *__src, size_t __n, char *__dst)
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

void *sub_1C88C(uint64_t a1, unint64_t a2)
{
  NSString v2 = sub_1C920(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    NSString v2 = sub_1CAF4(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    NSString v2 = sub_1CAF4((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  void v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_1C920(uint64_t a1, unint64_t a2)
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
  os_log_type_t v5 = sub_1CA90(v4, 0LL);
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

void *sub_1CA90(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_6FC0(&qword_28E38);
  os_log_type_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  _OWORD v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1CAF4(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_6FC0(&qword_28E38);
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
    sub_1CC8C(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_1CBC8(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_1CBC8(char *__src, size_t __n, char *__dst)
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

char *sub_1CC8C(char *__src, size_t __len, char *__dst)
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

void destroy for TimerDurationViewLegacy(uint64_t a1)
{
  swift_release(*(void *)(a1 + 48));
}

void *initializeWithCopy for TimerDurationViewLegacy(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v5 = a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  uint64_t v6 = a2[4];
  int64_t v7 = (void *)a2[5];
  a1[4] = v6;
  a1[5] = v7;
  uint64_t v8 = a2[6];
  int64_t v9 = (void *)a2[7];
  a1[6] = v8;
  a1[7] = v9;
  swift_bridgeObjectRetain(v3);
  swift_retain(v5);
  swift_bridgeObjectRetain(v6);
  id v10 = v7;
  swift_retain(v8);
  id v11 = v9;
  return a1;
}

void *assignWithCopy for TimerDurationViewLegacy(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a1[2];
  uint64_t v7 = a2[2];
  a1[2] = v7;
  swift_retain(v7);
  swift_release(v6);
  a1[3] = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  id v10 = (void *)a2[5];
  id v11 = (void *)a1[5];
  a1[5] = v10;
  id v12 = v10;

  uint64_t v13 = a2[6];
  uint64_t v14 = a1[6];
  a1[6] = v13;
  swift_retain(v13);
  swift_release(v14);
  uint64_t v15 = (void *)a1[7];
  uint64_t v16 = (void *)a2[7];
  a1[7] = v16;
  id v17 = v16;

  return a1;
}

void *assignWithTake for TimerDurationViewLegacy(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease(a1[1]);
  uint64_t v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_release(v4);
  a1[3] = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(a1[4]);
  uint64_t v5 = (void *)a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);

  swift_release(a1[6]);
  uint64_t v6 = (void *)a1[7];
  *((_OWORD *)a1 + 3) = *(_OWORD *)(a2 + 48);

  return a1;
}

ValueMetadata *type metadata accessor for TimerDurationViewLegacy()
{
  return &type metadata for TimerDurationViewLegacy;
}

uint64_t sub_1CF18(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_22300, 1LL);
}

uint64_t sub_1CF2C(uint64_t a1)
{
  return sub_1C3B4(a1, (void **)(v1 + 16));
}

uint64_t sub_1CF34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_bridgeObjectRetain(v4);
  id v8 = v5;
  swift_retain(v6);
  return a1;
}

uint64_t sub_1CF9C()
{
  swift_release(*(void *)(v0 + 64));
  return swift_deallocObject(v0, 80LL, 7LL);
}

void sub_1CFE8()
{
}

void sub_1D004(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = sub_756C(a2);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_905C();
}

uint64_t sub_1D040@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1D074(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

void sub_1D0A4(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
  sub_905C();
}

void sub_1D0C8(double *a1)
{
}

uint64_t sub_1D0E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 128);
  sub_18730(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  return a1;
}

uint64_t sub_1D154(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 128);
  sub_8DC4(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_1D1C0()
{
  uint64_t v0 = sub_756C(&qword_28E50);
  sub_1D004(&qword_28E60, &qword_28E50, (uint64_t)&protocol conformance descriptor for SubscriptionView<A, B>);
  v3[0] = v0;
  v3[1] = v1;
  return swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>,  1LL);
}

uint64_t sub_1D224(uint64_t a1)
{
  return swift_allocObject(a1, 80LL, 7LL);
}

uint64_t sub_1D230(uint64_t a1, uint64_t a2)
{
  return State.init(wrappedValue:)(v2 - 136, a2);
}

__n128 sub_1D23C(uint64_t a1)
{
  __int128 v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 32) = v2;
  __n128 result = *(__n128 *)(v1 + 32);
  __int128 v4 = *(_OWORD *)(v1 + 48);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v4;
  return result;
}

uint64_t _s13TimerUIPlugin07ComposeA7SnippetV20_interactionDelegate33_72C0F54402B260C409E0864AF7B13339LL0D2UI011InteractionF0Vvpfi_0()
{
  return InteractionDelegate.init()();
}