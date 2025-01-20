void sub_5B30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_5B6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_5B7C(uint64_t a1)
{
}

void sub_5B84(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_28:
    v39 = 0LL;
    goto LABEL_33;
  }

  v39 = 0LL;
LABEL_34:

  return v39;
}

void sub_61E0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_61F0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_6210()
{
  if (qword_16F68 != -1) {
    dispatch_once(&qword_16F68, &stru_10688);
  }
  return (id)qword_16F60;
}

void sub_6250(id a1)
{
  os_log_t v1 = os_log_create("com.apple.VideosSiriSnippetPlugin", "Default");
  v2 = (void *)qword_16F60;
  qword_16F60 = (uint64_t)v1;
}

LABEL_40:
        if (v9) {
          [v3 setObject:v9 forKey:v8];
        }

        v7 = (char *)v7 + 1;
      }

      while (v7 != v5);
      v40 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
      v5 = v40;
    }

    while (v40);
  }

  v41 = [v3 copy];
  return v41;
}

void sub_69AC(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___VSSPSiriLifecycleObserver);
  v2 = (void *)qword_16F70;
  qword_16F70 = (uint64_t)v1;
}

id sub_6C3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_6C48(uint64_t a1)
{
  return _objc_msgSend( *(id *)(a1 + 32),  "completeTransition:",  objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

id sub_6DA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_6DB0(uint64_t a1)
{
  return _objc_msgSend( *(id *)(a1 + 40),  "completeTransition:",  objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
}

uint64_t sub_7E98()
{
  return sub_7EFC();
}

uint64_t type metadata accessor for SSPVideosSiriSnippetPlugin(uint64_t a1)
{
  uint64_t result = qword_16FC0;
  if (!qword_16FC0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SSPVideosSiriSnippetPlugin);
  }
  return result;
}

uint64_t sub_7EFC()
{
  os_log_t v1 = &v24[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v2 = type metadata accessor for ImpressionMetrics.ID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = &v24[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v4);
  v8 = &v24[-v7];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"siriSearch");
  ImpressionMetrics.ID.init(parent:element:index:)(0LL, 0LL, v9, v10, 0LL);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v3 + 16))(v6, v8, v2);
  uint64_t v11 = sub_AB98(&qword_16E70);
  uint64_t inited = swift_initStackObject(v11, v24);
  *(_OWORD *)(inited + 16) = xmmword_CD10;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsImpressionsTypeKey);
  *(void *)(inited + 40) = v13;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"Shelf");
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v14;
  *(void *)(inited + 56) = v15;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsImpressionsNameKey);
  *(void *)(inited + 88) = v16;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"Siri Search");
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v17;
  *(void *)(inited + 104) = v18;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsImpressionsIndexKey);
  *(void *)(inited + 136) = v19;
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 144) = 0LL;
  unint64_t v20 = sub_8620(inited);
  ScalarDictionary.init()();
  unint64_t v21 = sub_99E8((uint64_t)&_swiftEmptyArrayStorage);
  unint64_t v22 = sub_99E8((uint64_t)&_swiftEmptyArrayStorage);
  ImpressionMetrics.init(id:fields:custom:commonFields:clickLocationFields:)(v6, v20, v1, v21, v22);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_810C()
{
  return BasicImpressionsTracker.__allocating_init(threshold:)(1.0);
}

void *sub_8138()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_8144()
{
  uint64_t v0 = type metadata accessor for ImpressionsContext(0LL);
  sub_ACC8(v0, qword_16F88);
  sub_AA08(v0, (uint64_t)qword_16F88);
  return ImpressionsContext.init()();
}

uint64_t sub_818C()
{
  return 0LL;
}

id sub_8194(id result, char a2, char a3)
{
  if (result)
  {
    uint64_t v5 = result;
    type metadata accessor for SSPProductPageAceViewController();
    return sub_AF7C(v5, a2 & 1, a3 & 1);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_823C(void *a1, char a2)
{
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_95CC();
  uint64_t v9 = objc_opt_self(&OBJC_CLASS___SAVCSContentCabinet);
  uint64_t v10 = swift_dynamicCastObjCClass(a1, v9);
  if (v10 && (a2 & 1) != 0)
  {
    uint64_t v11 = (void *)v10;
    v12 = *(void **)(v2 + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_contentCabinet);
    *(void *)(v2 + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_contentCabinet) = v10;
    id v27 = a1;

    id v13 = [v11 shelves];
    if (!v13)
    {

      return;
    }

    uint64_t v14 = v13;
    uint64_t v15 = sub_AD08(0LL, &qword_16E68, &OBJC_CLASS___SAVCSContentShelf_ptr);
    uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);

    if ((unint64_t)v16 >> 62)
    {
      if (v16 < 0) {
        uint64_t v25 = v16;
      }
      else {
        uint64_t v25 = v16 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v16);
      uint64_t v17 = (void *)_CocoaArrayWrapper.endIndex.getter(v25);
      swift_bridgeObjectRelease(v16);
      id v18 = v27;
      if (v17)
      {
LABEL_6:
        if ((v16 & 0xC000000000000001LL) != 0)
        {
          id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v16);
        }

        else
        {
          if (!*(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8LL)))
          {
            __break(1u);
            goto LABEL_20;
          }

          id v19 = *(id *)(v16 + 32);
        }

        uint64_t v17 = v19;
        swift_bridgeObjectRelease(v16);
        sub_A164(v17);
        sub_A434(v17);
        uint64_t v20 = *(void *)(v2 + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_impressionsData);
        *(void *)(v2 + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_impressionsData) = v21;
        uint64_t v22 = swift_bridgeObjectRelease(v20);
        v2 += OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_shelfImpressionsData;
        Date.init()(v22);
        if (qword_16F80 == -1)
        {
LABEL_10:
          uint64_t v23 = type metadata accessor for ImpressionsContext(0LL);
          uint64_t v24 = sub_AA08(v23, (uint64_t)qword_16F88);
          BasicImpressionsTracker.elementDidEnterView(_:on:with:)(v2, v8, v24);

          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
          return;
        }

LABEL_20:
        swift_once(&qword_16F80, sub_8144);
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v17 = *(void **)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8LL));
      id v18 = v27;
      if (v17) {
        goto LABEL_6;
      }
    }

    swift_bridgeObjectRelease(v16);
  }
}

uint64_t sub_8520(uint64_t a1, unint64_t a2)
{
  return sub_AA20( a2,  (void (*)(char *, char *, uint64_t))&BasicImpressionsTracker.elementDidEnterView(_:on:with:));
}

uint64_t sub_85A0(uint64_t a1, unint64_t a2)
{
  return sub_AA20( a2,  (void (*)(char *, char *, uint64_t))&BasicImpressionsTracker.elementDidLeaveView(_:on:with:));
}

unint64_t sub_8620(uint64_t a1)
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

  sub_AB98(&qword_16ED8);
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
    sub_ADC8(v7, (uint64_t)&v17, &qword_16EE0);
    uint64_t v8 = v17;
    uint64_t v9 = v18;
    unint64_t result = sub_9C74(v17, v18, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_9D10);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_ACAC(&v19, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_12;
    }
    v4[2] = v15;
    v7 += 48LL;
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

unint64_t sub_8768(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_AB98(&qword_16EC0);
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
    sub_ADC8(v7, (uint64_t)v16, &qword_16F08);
    unint64_t result = sub_9CE0((uint64_t)v16);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v10 = v4[6] + 40 * result;
    __int128 v11 = v16[0];
    __int128 v12 = v16[1];
    *(void *)(v10 + 32) = v17;
    *(_OWORD *)uint64_t v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    unint64_t result = (unint64_t)sub_ACAC(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 72LL;
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

unint64_t sub_88A8(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_AB98(&qword_16EC8);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(v1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(v1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v18 = v1;
  uint64_t v6 = (uint64_t *)(v1 + 56);
  while (1)
  {
    uint64_t v7 = *(v6 - 3);
    uint64_t v8 = *(v6 - 2);
    uint64_t v9 = *(v6 - 1);
    uint64_t v10 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v10);
    unint64_t result = sub_9C74(v7, v8, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_9D10);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v13 = v7;
    v13[1] = v8;
    BOOL v14 = (void *)(v4[7] + 16 * result);
    *BOOL v14 = v9;
    v14[1] = v10;
    uint64_t v15 = v4[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v6 += 4;
    v4[2] = v17;
    if (!--v5)
    {
      swift_release(v4);
      uint64_t v1 = v18;
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_89E4(void *a1)
{
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for ImpressionsTrackerFormat(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v11 = (unint64_t)[a1 resultIndex];
  if ((v11 & 0x8000000000000000LL) != 0) {
    goto LABEL_24;
  }
  unint64_t v105 = v11;
  uint64_t v107 = v8;
  uint64_t v108 = v7;
  uint64_t v109 = v4;
  uint64_t v110 = v1;
  uint64_t v102 = v3;
  uint64_t v12 = sub_AB98(&qword_16E70);
  uint64_t inited = swift_initStackObject(v12, &v115);
  *(_OWORD *)(inited + 16) = xmmword_CD20;
  uint64_t v14 = VUIMetricsLocationIdKey;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsLocationIdKey);
  *(void *)(inited + 40) = v15;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"siriSearch");
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v16;
  *(void *)(inited + 56) = v17;
  uint64_t v18 = VUIMetricsLocationNameKey;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsLocationNameKey);
  *(void *)(inited + 88) = v19;
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"Siri Search");
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v20;
  *(void *)(inited + 104) = v21;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsLocationTypeKey);
  *(void *)(inited + 136) = v22;
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"Shelf");
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = v23;
  *(void *)(inited + 152) = v24;
  uint64_t v98 = VUIMetricsLocationPositionKey;
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsLocationPositionKey);
  *(void *)(inited + 184) = v25;
  *(void *)(inited + 216) = &type metadata for Int;
  *(void *)(inited + 192) = 0LL;
  unint64_t v99 = sub_8620(inited);
  uint64_t v106 = v12;
  uint64_t v26 = swift_initStackObject(v12, &v114);
  *(_OWORD *)(v26 + 16) = xmmword_CD30;
  *(void *)(v26 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  *(void *)(v26 + 40) = v27;
  id v28 = [a1 utsId];
  if (v28)
  {
    v29 = v28;
    v30 = a1;
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    unint64_t v33 = v32;

    v34 = (uint64_t *)(v26 + 48);
    *(void *)(v26 + 72) = &type metadata for String;
    if (v33)
    {
      uint64_t *v34 = v31;
      a1 = v30;
      goto LABEL_8;
    }

    a1 = v30;
  }

  else
  {
    v34 = (uint64_t *)(v26 + 48);
    *(void *)(v26 + 72) = &type metadata for String;
  }

  uint64_t *v34 = 0LL;
  unint64_t v33 = 0xE000000000000000LL;
LABEL_8:
  *(void *)(v26 + 56) = v33;
  uint64_t v101 = VUIMetricsActionTypeKey;
  *(void *)(v26 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsActionTypeKey);
  *(void *)(v26 + 88) = v35;
  uint64_t v36 = VUIMetricsActionTypeNavigate;
  uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsActionTypeNavigate);
  *(void *)(v26 + 120) = &type metadata for String;
  *(void *)(v26 + 96) = v37;
  *(void *)(v26 + 104) = v38;
  uint64_t v39 = VUIMetricsTargetTypeKey;
  *(void *)(v26 + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsTargetTypeKey);
  *(void *)(v26 + 136) = v40;
  v100 = @"lockup";
  uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"lockup");
  *(void *)(v26 + 168) = &type metadata for String;
  *(void *)(v26 + 144) = v41;
  *(void *)(v26 + 152) = v42;
  *(void *)(v26 + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
  *(void *)(v26 + 184) = v43;
  id v44 = [a1 loadingText];
  id v111 = a1;
  uint64_t v103 = v39;
  uint64_t v104 = v36;
  if (v44)
  {
    v45 = v44;
    uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
    unint64_t v48 = v47;

    v49 = (uint64_t *)(v26 + 192);
    *(void *)(v26 + 216) = &type metadata for String;
    if (v48)
    {
      uint64_t *v49 = v46;
      uint64_t v50 = v102;
      uint64_t v51 = v98;
      unint64_t v52 = v99;
      goto LABEL_13;
    }
  }

  else
  {
    v49 = (uint64_t *)(v26 + 192);
    *(void *)(v26 + 216) = &type metadata for String;
  }

  uint64_t v50 = v102;
  uint64_t v51 = v98;
  unint64_t v52 = v99;
  uint64_t *v49 = 0LL;
  unint64_t v48 = 0xE000000000000000LL;
LABEL_13:
  *(void *)(v26 + 200) = v48;
  *(void *)(v26 + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(v51);
  *(void *)(v26 + 232) = v53;
  *(void *)(v26 + 264) = &type metadata for Int;
  *(void *)(v26 + 240) = v105;
  unint64_t v54 = sub_8620(v26);
  uint64_t v55 = sub_AB98(&qword_16E78);
  uint64_t v56 = swift_allocObject(v55, 48LL, 7LL);
  *(_OWORD *)(v56 + 16) = xmmword_CD40;
  *(void *)(v56 + 32) = v52;
  *(void *)(v56 + 40) = v54;
  uint64_t v58 = v107;
  uint64_t v57 = v108;
  uint64_t v59 = (*(uint64_t (**)(char *, void, uint64_t))(v107 + 104))( v10,  enum case for ImpressionsTrackerFormat.v3(_:),  v108);
  Date.init()(v59);
  uint64_t v60 = BasicImpressionsTracker.snapshotOnScreenImpressions(in:on:)(v10, v6);
  (*(void (**)(char *, uint64_t))(v109 + 8))(v6, v50);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v10, v57);
  v61 = sub_9070(v60);
  swift_bridgeObjectRelease(v60);
  uint64_t v62 = swift_initStackObject(v106, &v113);
  *(_OWORD *)(v62 + 16) = xmmword_CD50;
  *(void *)(v62 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsTargetIdKey);
  *(void *)(v62 + 40) = v63;
  id v64 = [v111 utsId];
  if (!v64)
  {
    v69 = (uint64_t *)(v62 + 48);
    *(void *)(v62 + 72) = &type metadata for String;
    goto LABEL_17;
  }

  v65 = v64;
  uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)(v64);
  unint64_t v68 = v67;

  v69 = (uint64_t *)(v62 + 48);
  *(void *)(v62 + 72) = &type metadata for String;
  if (!v68)
  {
LABEL_17:
    p_ivars = &SSPProductPageApplicationViewController.ivars;
    uint64_t v71 = v101;
    uint64_t *v69 = 0LL;
    unint64_t v68 = 0xE000000000000000LL;
    goto LABEL_18;
  }

  uint64_t *v69 = v66;
  p_ivars = (__objc2_ivar_list **)(&SSPProductPageApplicationViewController + 48);
  uint64_t v71 = v101;
LABEL_18:
  v72 = v100;
  *(void *)(v62 + 56) = v68;
  *(void *)(v62 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(v71);
  *(void *)(v62 + 88) = v73;
  uint64_t v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(v104);
  *(void *)(v62 + 120) = &type metadata for String;
  *(void *)(v62 + 96) = v74;
  *(void *)(v62 + 104) = v75;
  *(void *)(v62 + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(v103);
  *(void *)(v62 + 136) = v76;
  uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(v72);
  *(void *)(v62 + 168) = &type metadata for String;
  *(void *)(v62 + 144) = v77;
  *(void *)(v62 + 152) = v78;
  *(void *)(v62 + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsActionDetailsKey);
  *(void *)(v62 + 184) = v79;
  uint64_t v80 = sub_AB98(&qword_16E80);
  uint64_t v81 = swift_initStackObject(v80, &v112);
  *(_OWORD *)(v81 + 16) = xmmword_CD60;
  *(void *)(v81 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsActionDetailsNameKey);
  *(void *)(v81 + 40) = v82;
  id v83 = objc_msgSend(v111, (SEL)p_ivars[52]);
  if (v83)
  {
    v84 = v83;
    uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(v83);
    unint64_t v87 = v86;
  }

  else
  {
    uint64_t v85 = 0LL;
    unint64_t v87 = 0xE000000000000000LL;
  }

  *(void *)(v81 + 48) = v85;
  *(void *)(v81 + 56) = v87;
  unint64_t v88 = sub_88A8(v81);
  *(void *)(v62 + 216) = sub_AB98(&qword_16E88);
  *(void *)(v62 + 192) = v88;
  *(void *)(v62 + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsLocationKey);
  *(void *)(v62 + 232) = v89;
  uint64_t v90 = sub_AB98(&qword_16E90);
  *(void *)(v62 + 264) = v90;
  *(void *)(v62 + 240) = v56;
  *(void *)(v62 + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsImpressionsKey);
  *(void *)(v62 + 280) = v91;
  *(void *)(v62 + 312) = v90;
  v92 = &_swiftEmptyArrayStorage;
  if (v61) {
    v92 = v61;
  }
  *(void *)(v62 + 288) = v92;
  unint64_t v93 = sub_8620(v62);
  id v94 = [(id)objc_opt_self(VUIMetricsController) sharedInstance];
  uint64_t v95 = sub_91B4(v93);
  swift_bridgeObjectRelease(v93);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v95);
  [v94 recordClick:isa];

LABEL_24:
  sub_95CC();
}

void *sub_9070(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = &_swiftEmptyArrayStorage;
  sub_A028(0LL, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32LL)
    {
      sub_AC70(i, (uint64_t)v11);
      uint64_t v5 = sub_AB98(&qword_16ED0);
      uint64_t v6 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_A028(0LL, v3[2] + 1LL, 1);
        uint64_t v3 = v12;
      }

      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_A028((void *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v12;
      }

      v3[2] = v8 + 1;
      v3[v8 + 4] = v6;
      if (!--v2) {
        return v3;
      }
    }

    uint64_t v10 = 0LL;
    swift_release(v3);
    swift_bridgeObjectRelease(v10);
    return 0LL;
  }

  return v3;
}

uint64_t sub_91B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_AB98(&qword_16EC0);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v29 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  unint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain(v3);
  int64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }

    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v14 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    int64_t v16 = v9 + 1;
    if (!v15)
    {
      int64_t v16 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v29 + 8 * v16);
          if (!v15) {
            break;
          }
        }
      }
    }

LABEL_27:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    int64_t v9 = v16;
LABEL_28:
    uint64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v13);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_AC70(*(void *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(void *)&__int128 v40 = v20;
    *((void *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(void *)&v38[0] = v20;
    *((void *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_ACAC(v39, v33);
    __int128 v34 = v30;
    __int128 v35 = v31;
    uint64_t v36 = v32;
    sub_ACAC(v33, v37);
    __int128 v30 = v34;
    __int128 v31 = v35;
    uint64_t v32 = v36;
    sub_ACAC(v37, v38);
    sub_ACAC(v38, &v34);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v3[5]);
    uint64_t v21 = -1LL << *((_BYTE *)v3 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)]) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1LL << v22) & ~*(void *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0LL;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)&v7[8 * v23];
      }

      while (v27 == -1);
      unint64_t v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }

    *(void *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v10;
    uint64_t v11 = v3[6] + 40 * v10;
    *(_OWORD *)uint64_t v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(void *)(v11 + 32) = v32;
    uint64_t result = (uint64_t)sub_ACAC(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }

  int64_t v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_ACBC(a1);
    return (uint64_t)v3;
  }

  unint64_t v15 = *(void *)(v29 + 8 * v17);
  if (v15)
  {
    int64_t v16 = v9 + 5;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v16 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v16 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v16);
    ++v17;
    if (v15) {
      goto LABEL_27;
    }
  }

LABEL_39:
  __break(1u);
  return result;
}

void sub_95CC()
{
  uint64_t v0 = type metadata accessor for Date(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v18[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ImpressionsTrackerFormat(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = (*(uint64_t (**)(char *, void, uint64_t))(v5 + 104))( v7,  enum case for ImpressionsTrackerFormat.v3(_:),  v4);
  Date.init()(v8);
  uint64_t v9 = BasicImpressionsTracker.consumeImpressions(in:on:)(v7, v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  unint64_t v10 = sub_9070(v9);
  swift_bridgeObjectRelease(v9);
  if (v10)
  {
    id v11 = [(id)objc_opt_self(VUIMetricsController) sharedInstance];
    uint64_t v12 = sub_AB98(&qword_16F00);
    uint64_t inited = swift_initStackObject(v12, v19);
    *(_OWORD *)(inited + 16) = xmmword_CD60;
    v18[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsEventTypeImpressions);
    v18[1] = v14;
    AnyHashable.init<A>(_:)(v18, &type metadata for String, &protocol witness table for String);
    *(void *)(inited + 96) = sub_AB98(&qword_16E90);
    *(void *)(inited + 72) = v10;
    unint64_t v15 = sub_8768(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v15);
    [v11 recordImpressions:isa];
  }

id sub_97D0()
{
  return [objc_allocWithZone(v0) init];
}

id sub_97F0()
{
  uint64_t v1 = (objc_class *)type metadata accessor for SSPVideosSiriSnippetPlugin(0LL);
  uint64_t v2 = v0;
  sub_7EFC();
  uint64_t v3 = OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_impressionTracker;
  type metadata accessor for BasicImpressionsTracker(0LL);
  *(void *)&v2[v3] = BasicImpressionsTracker.__allocating_init(threshold:)(1.0);
  *(void *)&v2[OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_impressionsData] = &_swiftEmptyArrayStorage;
  *(void *)&v2[OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_contentCabinet] = 0LL;

  v5.receiver = v2;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, "init");
}

id sub_9944()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SSPVideosSiriSnippetPlugin(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_99E8(uint64_t a1)
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

  sub_AB98(&qword_16ED8);
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
    sub_ADC8(v7, (uint64_t)&v17, &qword_16EE0);
    uint64_t v8 = v17;
    uint64_t v9 = v18;
    unint64_t result = sub_9C74(v17, v18, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_9B30);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_ACAC(&v19, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_12;
    }
    v4[2] = v15;
    v7 += 48LL;
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

unint64_t sub_9B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if (((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
      {
        uint64_t v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              break;
            }
          }
        }
      }
    }
  }

  return i;
}

uint64_t sub_9C74(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  Swift::Int v6 = Hasher._finalize()();
  return a3(a1, a2, v6);
}

unint64_t sub_9CE0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_9DF0(a1, v4);
}

unint64_t sub_9D10(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_9DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_AE0C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_AE48((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

size_t sub_9EB4(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_30:
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_AB98(&qword_16EF0);
  uint64_t v12 = *(void *)(type metadata accessor for ImpressionMetrics(0LL, v11) - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v16 = (void *)swift_allocObject(v10, v15 + v13 * v9, v14 | 7);
  unint64_t result = j__malloc_size(v16);
  if (!v13)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (result - v15 == 0x8000000000000000LL && v13 == -1) {
    goto LABEL_29;
  }
  _OWORD v16[2] = v8;
  v16[3] = 2 * ((uint64_t)(result - v15) / v13);
LABEL_19:
  uint64_t v18 = type metadata accessor for ImpressionMetrics(0LL, a2);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if ((v5 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }

    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v21, v22, v8, v18);
  }

  swift_bridgeObjectRelease(a4);
  return (size_t)v16;
}

void *sub_A028(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_A044(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_A044(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_AB98(&qword_16E78);
    uint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = &_swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[v8 + 4]) {
      memmove(v11 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    uint64_t v15 = sub_AB98(&qword_16ED0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v15);
  }

  swift_release(a4);
  return v11;
}

uint64_t sub_A164(void *a1)
{
  uint64_t v2 = sub_AB98(&qword_16EF8);
  uint64_t v3 = __chkstk_darwin(v2);
  char v5 = (char *)&v29[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v29[-1] - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v29[-1] - v9;
  id v11 = [a1 url];
  if (v11)
  {
    int64_t v12 = v11;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v13 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v8, 0LL, 1LL, v13);
  }

  else
  {
    uint64_t v13 = ((uint64_t (*)(void))type metadata accessor for URL)();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v8, 1LL, 1LL, v13);
  }

  sub_AD40((uint64_t)v8, (uint64_t)v10);
  sub_ADC8((uint64_t)v10, (uint64_t)v5, &qword_16EF8);
  type metadata accessor for URL(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v5, 1LL, v13) == 1)
  {
    sub_AD88((uint64_t)v5);
    uint64_t v15 = 0LL;
    unint64_t v16 = 0xE000000000000000LL;
  }

  else
  {
    uint64_t v15 = URL.absoluteString.getter();
    unint64_t v16 = v17;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v13);
  }

  uint64_t v18 = (void *)objc_opt_self(&OBJC_CLASS___VUIMetricsPageEventData);
  uint64_t v19 = sub_AB98(&qword_16F00);
  uint64_t inited = swift_initStackObject(v19, v30);
  *(_OWORD *)(inited + 16) = xmmword_CD60;
  v29[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(VUIMetricsKeySearchTerm);
  v29[1] = v21;
  unint64_t v22 = @"Siri";
  AnyHashable.init<A>(_:)(v29, &type metadata for String, &protocol witness table for String);
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = v15;
  *(void *)(inited + 80) = v16;
  unint64_t v23 = sub_8768(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  id v25 = [v18 createWithPageId:v22 andPageType:v22 andEventData:isa];

  id v26 = [(id)objc_opt_self(VUIMetricsController) sharedInstance];
  [v26 recordPage:v25];

  return sub_AD88((uint64_t)v10);
}

void sub_A434(void *a1)
{
  uint64_t v2 = type metadata accessor for ScalarDictionary(0LL);
  __chkstk_darwin(v2);
  uint64_t v82 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for ImpressionMetrics(0LL, v4);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  unint64_t v87 = (char *)&v67 - v10;
  uint64_t v11 = type metadata accessor for ImpressionMetrics.ID(0LL);
  uint64_t v85 = *(void *)(v11 - 8);
  uint64_t v86 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v81 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  v84 = (char *)&v67 - v14;
  id v15 = [a1 contentHead];
  if (v15)
  {
    unint64_t v16 = v15;
    uint64_t v17 = sub_AD08(0LL, &qword_16EE8, &OBJC_CLASS___SAVCSContentButton_ptr);
    uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);

    if ((unint64_t)v18 >> 62)
    {
      if (v18 < 0) {
        uint64_t v66 = v18;
      }
      else {
        uint64_t v66 = v18 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v18);
      uint64_t v19 = _CocoaArrayWrapper.endIndex.getter(v66);
      swift_bridgeObjectRelease(v18);
      if (v19) {
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v19 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFF8LL));
      if (v19)
      {
LABEL_4:
        if (v19 >= 1)
        {
          uint64_t v20 = 0LL;
          unint64_t v75 = v18 & 0xC000000000000001LL;
          uint64_t v74 = VUIMetricsImpressionsIdKey;
          uint64_t v73 = VUIMetricsImpressionsNameKey;
          uint64_t v72 = VUIMetricsImpressionsTypeKey;
          uint64_t v71 = @"lockup";
          uint64_t v70 = VUIMetricsContentTypeKey;
          uint64_t v69 = VUIMetricsImpressionsIndexKey;
          uint64_t v21 = &_swiftEmptyArrayStorage;
          unint64_t v68 = @"siriSearch";
          __int128 v67 = xmmword_CD30;
          uint64_t v79 = v6;
          uint64_t v80 = v5;
          uint64_t v77 = v18;
          uint64_t v78 = v9;
          uint64_t v76 = v19;
          while (1)
          {
            if (v75) {
              id v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v20, v18);
            }
            else {
              id v22 = *(id *)(v18 + 8 * v20 + 32);
            }
            unint64_t v23 = v22;
            id v24 = objc_msgSend(v22, "canonicalId", (void)v67, *((void *)&v67 + 1));
            if (v24)
            {
              id v25 = v24;
              uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
              unint64_t v28 = v27;
            }

            else
            {
              uint64_t v26 = 0LL;
              unint64_t v28 = 0xE000000000000000LL;
            }

            uint64_t v29 = sub_AB98(&qword_16E70);
            uint64_t inited = swift_initStackObject(v29, &v88);
            *(_OWORD *)(inited + 16) = v67;
            *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(v74);
            *(void *)(inited + 40) = v31;
            *(void *)(inited + 72) = &type metadata for String;
            uint64_t v83 = v26;
            *(void *)(inited + 48) = v26;
            *(void *)(inited + 56) = v28;
            *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(v73);
            *(void *)(inited + 88) = v32;
            swift_bridgeObjectRetain(v28);
            id v33 = [v23 text];
            if (v33)
            {
              __int128 v34 = v33;
              __int128 v35 = v21;
              uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
              unint64_t v38 = v37;

              uint64_t v39 = (uint64_t *)(inited + 96);
              *(void *)(inited + 120) = &type metadata for String;
              if (v38)
              {
                *uint64_t v39 = v36;
                uint64_t v21 = v35;
                goto LABEL_18;
              }

              uint64_t v21 = v35;
            }

            else
            {
              uint64_t v39 = (uint64_t *)(inited + 96);
              *(void *)(inited + 120) = &type metadata for String;
            }

            *uint64_t v39 = 0LL;
            unint64_t v38 = 0xE000000000000000LL;
LABEL_18:
            *(void *)(inited + 104) = v38;
            *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)(v72);
            *(void *)(inited + 136) = v40;
            uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v71);
            *(void *)(inited + 168) = &type metadata for String;
            *(void *)(inited + 144) = v41;
            *(void *)(inited + 152) = v42;
            *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(v70);
            *(void *)(inited + 184) = v43;
            id v44 = [v23 contentType];
            if (!v44)
            {
              v49 = (uint64_t *)(inited + 192);
              *(void *)(inited + 216) = &type metadata for String;
LABEL_22:
              uint64_t *v49 = 0LL;
              unint64_t v48 = 0xE000000000000000LL;
              goto LABEL_23;
            }

            v45 = v44;
            uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
            unint64_t v48 = v47;

            v49 = (uint64_t *)(inited + 192);
            *(void *)(inited + 216) = &type metadata for String;
            if (!v48) {
              goto LABEL_22;
            }
            uint64_t *v49 = v46;
LABEL_23:
            *(void *)(inited + 200) = v48;
            *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(v69);
            *(void *)(inited + 232) = v50;
            *(void *)(inited + 264) = &type metadata for Int;
            *(void *)(inited + 240) = v20;
            unint64_t v51 = sub_8620(inited);
            uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(v68);
            uint64_t v53 = v84;
            ImpressionMetrics.ID.init(parent:element:index:)(v52, v54, v83, v28, v20);
            uint64_t v55 = v81;
            uint64_t v56 = (*(uint64_t (**)(char *, char *, uint64_t))(v85 + 16))(v81, v53, v86);
            uint64_t v57 = v82;
            ScalarDictionary.init()(v56);
            unint64_t v58 = sub_99E8((uint64_t)&_swiftEmptyArrayStorage);
            unint64_t v59 = sub_99E8((uint64_t)&_swiftEmptyArrayStorage);
            uint64_t v60 = v87;
            ImpressionMetrics.init(id:fields:custom:commonFields:clickLocationFields:)(v55, v51, v57, v58, v59);
            uint64_t v62 = v78;
            uint64_t v61 = v79;
            uint64_t v63 = v80;
            (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v78, v60, v80);
            if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0) {
              uint64_t v21 = (void *)sub_9EB4(0LL, v21[2] + 1LL, 1, v21);
            }
            unint64_t v65 = v21[2];
            unint64_t v64 = v21[3];
            if (v65 >= v64 >> 1) {
              uint64_t v21 = (void *)sub_9EB4(v64 > 1, v65 + 1, 1, v21);
            }
            ++v20;
            v21[2] = v65 + 1;
            (*(void (**)(unint64_t, char *, uint64_t))(v61 + 32))( (unint64_t)v21 + ((*(unsigned __int8 *)(v61 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))
            + *(void *)(v61 + 72) * v65,
              v62,
              v63);

            (*(void (**)(char *, uint64_t))(v61 + 8))(v87, v63);
            (*(void (**)(char *, uint64_t))(v85 + 8))(v84, v86);
            uint64_t v18 = v77;
            if (v76 == v20)
            {
              swift_bridgeObjectRelease(v77);
              return;
            }
          }
        }

        __break(1u);
        goto LABEL_35;
      }
    }

    swift_bridgeObjectRelease(v18);
    return;
  }

LABEL_35:
  __break(1u);
}

uint64_t sub_AA08(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_AA20(unint64_t a1, void (*a2)(char *, char *, uint64_t))
{
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for ImpressionMetrics(0LL, v9);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t result = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((a1 & 0x8000000000000000LL) == 0)
  {
    uint64_t v15 = *(void *)(v2 + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_impressionsData);
    if (*(void *)(v15 + 16) > a1)
    {
      uint64_t v16 = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v11 + 16))( v14,  v15 + ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
            + *(void *)(v11 + 72) * a1,
              v10);
      Date.init()(v16);
      if (qword_16F80 != -1) {
        swift_once(&qword_16F80, sub_8144);
      }
      uint64_t v17 = type metadata accessor for ImpressionsContext(0LL);
      uint64_t v18 = sub_AA08(v17, (uint64_t)qword_16F88);
      a2(v14, v8, v18);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    }
  }

  return result;
}

uint64_t sub_AB98(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_ABD8()
{
  return type metadata accessor for SSPVideosSiriSnippetPlugin(0LL);
}

uint64_t sub_ABE0(uint64_t a1, uint64_t a2)
{
  uint64_t result = type metadata accessor for ImpressionMetrics(319LL, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    v5[1] = (char *)&value witness table for Builtin.NativeObject + 64;
    v5[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v5[3] = "\b";
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 4LL, v5, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_AC70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_ACAC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_ACBC(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t *sub_ACC8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_AD08(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_AD40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_AB98(&qword_16EF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_AD88(uint64_t a1)
{
  uint64_t v2 = sub_AB98(&qword_16EF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_ADC8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_AB98(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_AE0C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_AE48(uint64_t a1)
{
  return a1;
}

void sub_AE7C()
{
}

uint64_t sub_AE8C(uint64_t a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for SSPProductPageAceViewController();
  objc_msgSendSuper2(&v4, "_exposeObjectsInJSContext:", a1);
  type metadata accessor for VideosUI(0LL);
  return static VideosUI.initializeJSContext(_:)(a1);
}

uint64_t type metadata accessor for SSPProductPageAceViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC23VideosSiriSnippetPlugin31SSPProductPageAceViewController);
}

id sub_AF7C(void *a1, char a2, char a3)
{
  id v5 = [objc_allocWithZone(v3) initWithContentItem:a1 userDriven:a2 & 1 playTrailer:a3 & 1];

  return v5;
}

id sub_AFD4(void *a1, char a2, char a3)
{
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for SSPProductPageAceViewController();
  id v7 = objc_msgSendSuper2(&v9, "initWithContentItem:userDriven:playTrailer:", a1, a2 & 1, a3 & 1);

  return v7;
}

id sub_B094()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SSPProductPageAceViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_B0C4(void *a1, char a2, char a3)
{
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for SSPProductPageApplicationViewController();
  id v7 = objc_msgSendSuper2(&v9, "initWithContentItem:userDriven:playTrailer:", a1, a2 & 1, a3 & 1);

  return v7;
}

uint64_t type metadata accessor for SSPProductPageApplicationViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC23VideosSiriSnippetPlugin39SSPProductPageApplicationViewController);
}

id sub_B1A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SSPProductPageApplicationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_B1D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "VSSPProductPageApplicationViewController: openURLHandler returned an empty viewcontroller",  v1,  2u);
}

void sub_B214( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B244( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B2A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B2D8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B33C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B36C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B3D0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_B444( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B474( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_B4A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend__sendMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMetrics:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_aceViewController_performAceCommand_conversationItemIdentifier_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aceViewController:performAceCommand:conversationItemIdentifier:completion:");
}

id objc_msgSend_aceViewControllerDelegate(void *a1, const char *a2, ...)
{
  return _[a1 aceViewControllerDelegate];
}

id objc_msgSend_activeTokens(void *a1, const char *a2, ...)
{
  return _[a1 activeTokens];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_beginLifecycle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginLifecycle:");
}

id objc_msgSend_checkAndUpdateSettings(void *a1, const char *a2, ...)
{
  return _[a1 checkAndUpdateSettings];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return _[a1 containerView];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentItem(void *a1, const char *a2, ...)
{
  return _[a1 contentItem];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_endLifecycle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endLifecycle:");
}

id objc_msgSend_flushMetrics(void *a1, const char *a2, ...)
{
  return _[a1 flushMetrics];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 imageAspectRatio];
}

id objc_msgSend_imageURLTemplateString(void *a1, const char *a2, ...)
{
  return _[a1 imageURLTemplateString];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContentItem_userDriven_playTrailer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentItem:userDriven:playTrailer:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithIdentifier_contentType_tvAppURL_imageResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:contentType:tvAppURL:imageResource:");
}

id objc_msgSend_initializeUIFactory(void *a1, const char *a2, ...)
{
  return _[a1 initializeUIFactory];
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_interruption(void *a1, const char *a2, ...)
{
  return _[a1 interruption];
}

id objc_msgSend_interruptionDidBegin(void *a1, const char *a2, ...)
{
  return _[a1 interruptionDidBegin];
}

id objc_msgSend_interruptionDidEnd(void *a1, const char *a2, ...)
{
  return _[a1 interruptionDidEnd];
}

id objc_msgSend_interruptionWillBegin(void *a1, const char *a2, ...)
{
  return _[a1 interruptionWillBegin];
}

id objc_msgSend_interruptionWillEnd(void *a1, const char *a2, ...)
{
  return _[a1 interruptionWillEnd];
}

id objc_msgSend_isEVOD(void *a1, const char *a2, ...)
{
  return _[a1 isEVOD];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEvod(void *a1, const char *a2, ...)
{
  return _[a1 isEvod];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadingText(void *a1, const char *a2, ...)
{
  return _[a1 loadingText];
}

id objc_msgSend_metricsForTVMetric_refId_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsForTVMetric:refId:duration:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_openURLHandler(void *a1, const char *a2, ...)
{
  return _[a1 openURLHandler];
}

id objc_msgSend_parseURL_appContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseURL:appContext:completion:");
}

id objc_msgSend_pixelHeight(void *a1, const char *a2, ...)
{
  return _[a1 pixelHeight];
}

id objc_msgSend_pixelWidth(void *a1, const char *a2, ...)
{
  return _[a1 pixelWidth];
}

id objc_msgSend_playTrailer(void *a1, const char *a2, ...)
{
  return _[a1 playTrailer];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_productPageAceViewControllerWithContentItem_userDriven_playTrailer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productPageAceViewControllerWithContentItem:userDriven:playTrailer:");
}

id objc_msgSend_propertyNames(void *a1, const char *a2, ...)
{
  return _[a1 propertyNames];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_recordMetricsForSelectedResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetricsForSelectedResult:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_searchTerm(void *a1, const char *a2, ...)
{
  return _[a1 searchTerm];
}

id objc_msgSend_seasonIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 seasonIdentifier];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEVOD_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEVOD:");
}

id objc_msgSend_setEventInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventInformation:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPrefetchData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefetchData:");
}

id objc_msgSend_setProductPageAppDocumentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProductPageAppDocumentViewController:");
}

id objc_msgSend_setSearchTerm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchTerm:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransitioningDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitioningDelegate:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldShowWelcomeScreen(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowWelcomeScreen];
}

id objc_msgSend_showIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 showIdentifier];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_toJSONDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toJSONDictionary];
}

id objc_msgSend_transitionDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionDuration:");
}

id objc_msgSend_transitionWasCancelled(void *a1, const char *a2, ...)
{
  return _[a1 transitionWasCancelled];
}

id objc_msgSend_tvAppURL(void *a1, const char *a2, ...)
{
  return _[a1 tvAppURL];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_urlFormatString(void *a1, const char *a2, ...)
{
  return _[a1 urlFormatString];
}

id objc_msgSend_userDriven(void *a1, const char *a2, ...)
{
  return _[a1 userDriven];
}

id objc_msgSend_utsId(void *a1, const char *a2, ...)
{
  return _[a1 utsId];
}

id objc_msgSend_utsSearchUrl(void *a1, const char *a2, ...)
{
  return _[a1 utsSearchUrl];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForKey:");
}

id objc_msgSend_viewControllerWith_appContext_documentOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerWith:appContext:documentOptions:");
}

id objc_msgSend_viewServiceLifycycleToken(void *a1, const char *a2, ...)
{
  return _[a1 viewServiceLifycycleToken];
}

id objc_msgSend_wallpaperViewForVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wallpaperViewForVariant:");
}