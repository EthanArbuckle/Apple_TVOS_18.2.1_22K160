void sub_3DD0()
{
  strcpy((char *)&qword_10270, "SiriMessages");
  algn_10278[5] = 0;
  *(_WORD *)&algn_10278[6] = -5120;
}

uint64_t sub_3DFC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_3EB4(v0, qword_10680);
  sub_3FD0();
  sub_3F0C();
  if (qword_10268 != -1) {
    swift_once(&qword_10268, sub_3DD0);
  }
  uint64_t v1 = qword_10270;
  uint64_t v2 = *(void *)algn_10278;
  swift_bridgeObjectRetain(*(void *)algn_10278);
  uint64_t v3 = OS_os_log.init(subsystem:category:)(0xD000000000000017LL, 0x800000000000A990LL, v1, v2);
  return Logger.init(_:)(v3);
}

uint64_t *sub_3EB4(uint64_t a1, uint64_t *a2)
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

uint64_t sub_3EF4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_3F0C()
{
  unint64_t result = qword_10290;
  if (!qword_10290)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10290);
  }

  return result;
}

uint64_t sub_3F48()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_3EB4(v0, qword_10698);
  uint64_t v1 = sub_3FD0();
  if (qword_10280 != -1) {
    swift_once(&qword_10280, sub_3DFC);
  }
  uint64_t v2 = sub_3EF4(v0, (uint64_t)qword_10680);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_3FD0()
{
  return sub_3EF4(v0, v1);
}

uint64_t sub_3FDC()
{
  uint64_t v0 = static Device.current.getter(v6);
  static OutputPublisherFactory.makeOutputPublisherAsync()(v5, v0);
  type metadata accessor for ReferenceResolutionClient(0LL);
  uint64_t v1 = ReferenceResolutionClient.__allocating_init()();
  uint64_t v2 = type metadata accessor for MessagesTVOSFlowPlugin();
  uint64_t v3 = swift_allocObject(v2, 136LL, 7LL);
  return sub_6390(v6, v5, v1, v3);
}

uint64_t sub_4044()
{
  uint64_t v79 = v4;
  uint64_t v80 = v5;
  uint64_t v7 = v6;
  uint64_t v76 = *(void *)(((uint64_t (*)(void))type metadata accessor for NamedParseTransformer)(0LL) - 8);
  sub_6578();
  __chkstk_darwin(v8);
  sub_65E4();
  uint64_t v75 = v9;
  uint64_t v10 = sub_5E00(&qword_103C0);
  uint64_t v73 = *(void *)(v10 - 8);
  uint64_t v74 = v10;
  sub_6578();
  __chkstk_darwin(v11);
  sub_6548();
  uint64_t v71 = v12;
  sub_6564();
  __chkstk_darwin(v13);
  sub_67DC();
  uint64_t v72 = v14;
  uint64_t v15 = sub_6738();
  uint64_t v77 = type metadata accessor for USOParse(v15);
  uint64_t v16 = *(void *)(v77 - 8);
  sub_6578();
  __chkstk_darwin(v17);
  sub_65E4();
  uint64_t v19 = v18;
  uint64_t v20 = sub_6738();
  type metadata accessor for Parse(v20);
  sub_67B0();
  __chkstk_darwin(v21);
  sub_665C();
  uint64_t v22 = v1[5];
  uint64_t v23 = v1[6];
  os_log_type_t v24 = sub_6268(v1 + 2, v22);
  if ((((uint64_t (*)(uint64_t, uint64_t))dispatch thunk of DeviceState.isHomePod.getter)(v22, v23) & 1) != 0)
  {
    sub_678C(v3, v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    int v25 = (*(uint64_t (**)(uint64_t, os_log_s *))(v2 + 88))(v3, v0);
    v26 = v0;
    if (v25 == enum case for Parse.directInvocation(_:))
    {
      if (qword_10280 != -1) {
        swift_once(&qword_10280, sub_3DFC);
      }
      uint64_t v27 = sub_652C();
      sub_6518(v27, (uint64_t)qword_10680);
      os_log_type_t v28 = sub_6718();
      if (sub_6508(v28))
      {
        v29 = (uint8_t *)sub_6500(2LL);
        *(_WORD *)v29 = 0;
        sub_655C(&dword_0, v0, v24, "MessagesTVOSFlowPlugin received a direct invocation", v29);
        sub_64F4((uint64_t)v29);
      }

      sub_67F0();
      uint64_t v30 = type metadata accessor for GuardAndExecuteFlow(0LL);
      uint64_t v31 = sub_6638(v30);
      uint64_t v32 = v31 + OBJC_IVAR____TtC22MessagesTVOSFlowPlugin19GuardAndExecuteFlow_state;
      uint64_t v33 = type metadata accessor for Input(0LL);
      sub_67D0(v32, v34, v35, v33);
      sub_64BC(v78, v31 + 16);
      *(void *)&v78[0] = v31;
      uint64_t v38 = sub_6794(&qword_103C8, v36, v37, (uint64_t)&unk_A8E8);
      uint64_t v39 = sub_66F8(v38);
      swift_release(v31);
      sub_6780();
      swift_release(v39);
      return (*(uint64_t (**)(uint64_t, os_log_s *))(v2 + 8))(v3, v26);
    }

    if (v25 != enum case for Parse.uso(_:))
    {
      if (qword_10280 != -1) {
        swift_once(&qword_10280, sub_3DFC);
      }
      uint64_t v53 = sub_652C();
      sub_6518(v53, (uint64_t)qword_10680);
      os_log_type_t v54 = sub_6718();
      if (sub_6508(v54))
      {
        v55 = (uint8_t *)sub_6500(2LL);
        *(_WORD *)v55 = 0;
        sub_655C(&dword_0, v0, v24, "MessagesTVOSFlowPlugin received an unsupported parse, returning .noFlow", v55);
        sub_64F4((uint64_t)v55);
      }

      ((void (*)(void))static FlowSearchResult.noFlow.getter)();
      return (*(uint64_t (**)(uint64_t, os_log_s *))(v2 + 8))(v3, v26);
    }

    (*(void (**)(uint64_t, os_log_s *))(v2 + 96))(v3, v0);
    uint64_t v46 = v19;
    sub_668C(v19, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 32));
    sub_58D0();
    if ((v47 & 1) != 0 && (sub_4618(), (v48 & 1) != 0))
    {
      if (qword_10280 != -1) {
        swift_once(&qword_10280, sub_3DFC);
      }
      uint64_t v49 = sub_652C();
      v50 = (os_log_s *)sub_6518(v49, (uint64_t)qword_10680);
      os_log_type_t v51 = static os_log_type_t.info.getter();
      if (sub_658C(v51))
      {
        v52 = (uint8_t *)sub_6500(2LL);
        *(_WORD *)v52 = 0;
        sub_655C( &dword_0,  v50,  (os_log_type_t)v7,  "MessagesTVOSFlowPlugin received an NLv4 parse for reply and announcement is salient, reforming to NLv4 parse w ith NamedParseTransformer",  v52);
        sub_64F4((uint64_t)v52);
      }

      ((void (*)(uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>), void, os_log_s *, os_log_s *))Transformer.init(transform:))( sub_67FC,  0LL,  v0,  v0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 16))(v71, v72, v74);
      ((void (*)(uint64_t))NamedParseTransformer.init(transformer:))(v71);
      ((void (*)(uint64_t, uint64_t))static FlowSearchResult.reform(transformer:exclude:))(v75, 1LL);
      sub_67C4(v76);
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v72, v74);
    }

    else
    {
      if (qword_10280 != -1) {
        swift_once(&qword_10280, sub_3DFC);
      }
      uint64_t v56 = sub_652C();
      sub_6518(v56, (uint64_t)qword_10680);
      os_log_type_t v57 = sub_6718();
      if (sub_6508(v57))
      {
        v58 = (_WORD *)sub_6500(2LL);
        sub_66DC(v58);
        sub_6534(&dword_0, v59, v60, "MessagesTVOSFlowPlugin received a USO parse type");
        sub_64F4(v2);
      }

      sub_67F0();
      uint64_t v61 = type metadata accessor for GuardAndExecuteFlow(0LL);
      uint64_t v62 = sub_6638(v61);
      uint64_t v63 = v62 + OBJC_IVAR____TtC22MessagesTVOSFlowPlugin19GuardAndExecuteFlow_state;
      uint64_t v64 = type metadata accessor for Input(0LL);
      sub_67D0(v63, v65, v66, v64);
      sub_64BC(v78, v62 + 16);
      *(void *)&v78[0] = v62;
      uint64_t v69 = sub_6794(&qword_103C8, v67, v68, (uint64_t)&unk_A8E8);
      uint64_t v70 = sub_66F8(v69);
      sub_66D4();
      sub_6780();
      swift_release(v70);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v46, v77);
  }

  else
  {
    if (qword_10280 != -1) {
      swift_once(&qword_10280, sub_3DFC);
    }
    uint64_t v40 = sub_652C();
    sub_6518(v40, (uint64_t)qword_10680);
    os_log_type_t v41 = sub_6718();
    if (sub_6508(v41))
    {
      v42 = (_WORD *)sub_6500(2LL);
      sub_66DC(v42);
      sub_6534(&dword_0, v43, v44, "MessagesTVOSFlowPlugin only supports HomePod");
      sub_64F4(v2);
    }

    return ((uint64_t (*)(void))static FlowSearchResult.noFlow.getter)();
  }
}

void sub_4618()
{
  uint64_t v5 = v1;
  sub_5E00(&qword_10380);
  sub_6578();
  ((void (*)(void))__chkstk_darwin)();
  sub_665C();
  type metadata accessor for RREntity(0LL);
  sub_67B0();
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v35 - v9;
  if (qword_10280 != -1) {
    swift_once(&qword_10280, sub_3DFC);
  }
  uint64_t v11 = sub_652C();
  uint64_t v12 = (os_log_s *)sub_3EF4(v11, (uint64_t)qword_10680);
  ((void (*)(void))Logger.logObject.getter)();
  os_log_type_t v13 = sub_6630();
  if (sub_658C(v13))
  {
    uint64_t v14 = (uint8_t *)sub_6500(2LL);
    *(_WORD *)uint64_t v14 = 0;
    sub_655C(&dword_0, v12, v3, "MessagesTVOSFlowPlugin checking if HomeCommunication Announcement is salient", v14);
    sub_64F4((uint64_t)v14);
  }

  uint64_t v15 = type metadata accessor for UsoEntityBuilder_common_Announcement(0LL);
  sub_6638(v15);
  uint64_t v16 = UsoEntityBuilder_common_Announcement.init()();
  uint64_t v17 = static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
  swift_release(v16);
  if (v17)
  {
    sub_6268((void *)(v5 + 96), *(void *)(v5 + 120));
    uint64_t v18 = sub_4974();
    sub_5858((uint64_t)v18, (uint64_t (*)(void))&type metadata accessor for RREntity, v4);
    sub_6584();
    if (sub_5E40(v4, 1LL, (uint64_t)v0) == 1)
    {
      uint64_t v30 = sub_62D4(v4, &qword_10380);
      Logger.logObject.getter(v30);
      os_log_type_t v31 = sub_67A8();
      if (sub_6508(v31))
      {
        uint64_t v32 = (_WORD *)sub_6500(2LL);
        sub_66DC(v32);
        sub_6534(&dword_0, v33, v34, "MessagesTVOSFlowPlugin announcement is not present");
        sub_64F4(v2);
      }

      sub_67E8();
    }

    else
    {
      sub_678C((uint64_t)v10, v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
      uint64_t v19 = sub_678C((uint64_t)v8, (uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
      uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
      os_log_type_t v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = sub_6500(12LL);
        uint64_t v38 = v10;
        uint64_t v23 = (uint8_t *)v22;
        uint64_t v37 = sub_6500(32LL);
        uint64_t v40 = v37;
        *(_DWORD *)uint64_t v23 = 136315138;
        uint64_t v36 = v23 + 4;
        uint64_t v25 = sub_67A0( &qword_10388,  v24,  (uint64_t (*)(uint64_t))&type metadata accessor for RREntity,  (uint64_t)&protocol conformance descriptor for RREntity);
        uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter(v0, v25);
        os_log_type_t v28 = (void (*)(char *, void *))v27;
        uint64_t v39 = sub_95F0(v26, v27, &v40);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v36, v23 + 12);
        sub_6584();
        sub_66E8();
        sub_6610(&dword_0, v20, v21, "MessagesTVOSFlowPlugin announcement is present: %s", v23);
        uint64_t v29 = v37;
        swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
        sub_64F4(v29);
        sub_64F4((uint64_t)v23);

        sub_67E8();
        v28(v38, v0);
      }

      else
      {

        sub_67E8();
        sub_66E8();
        ((void (*)(char *, void *))v12)(v10, v0);
      }
    }

    sub_65F8();
  }

  else
  {
    __break(1u);
  }

void *sub_4974()
{
  uint64_t v203 = v2;
  uint64_t v204 = v3;
  uint64_t v190 = v0;
  v191 = v4;
  uint64_t v189 = v5;
  uint64_t v7 = v6;
  sub_5E00(&qword_10380);
  sub_6578();
  ((void (*)(void))__chkstk_darwin)();
  sub_6548();
  uint64_t v188 = v8;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_67DC();
  uint64_t v197 = v9;
  sub_5E00(&qword_10390);
  sub_6578();
  ((void (*)(void))__chkstk_darwin)();
  sub_65E4();
  uint64_t v181 = v10;
  uint64_t v11 = sub_6738();
  uint64_t v12 = type metadata accessor for RREntity(v11);
  uint64_t v198 = *(void *)(v12 - 8);
  uint64_t v199 = v12;
  sub_6578();
  ((void (*)(void))__chkstk_darwin)();
  sub_6548();
  uint64_t v185 = v13;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_65D8();
  uint64_t v182 = v14;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_65D8();
  uint64_t v196 = v15;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_65D8();
  uint64_t v192 = v16;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_65D8();
  uint64_t v179 = v17;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_67DC();
  uint64_t v180 = v18;
  uint64_t v19 = sub_6738();
  uint64_t v20 = ((uint64_t (*)(uint64_t))type metadata accessor for RRCandidate)(v19);
  uint64_t v193 = *(void *)(v20 - 8);
  uint64_t v194 = v20;
  sub_6578();
  ((void (*)(void))__chkstk_darwin)();
  sub_6548();
  uint64_t v184 = v21;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_65D8();
  uint64_t v195 = v22;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_65D8();
  uint64_t v183 = v23;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_67DC();
  v186 = (os_log_s *)v24;
  uint64_t v25 = sub_6738();
  uint64_t v26 = ((uint64_t (*)(uint64_t))type metadata accessor for RRResult)(v25);
  uint64_t v27 = *(void *)(v26 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_6548();
  uint64_t v178 = v28;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  sub_65D8();
  v187 = v29;
  sub_6564();
  ((void (*)(void))__chkstk_darwin)();
  os_log_type_t v31 = (uint8_t *)&v177 - v30;
  uint64_t v32 = ((uint64_t (*)(void))type metadata accessor for RRQuery)(0LL);
  uint64_t v33 = *(void *)(v32 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_6644();
  uint64_t v34 = sub_5E00(&qword_10398);
  sub_6578();
  uint64_t v35 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v37 = (uint64_t *)((char *)&v177 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  ((void (*)(uint64_t))__chkstk_darwin)(v35);
  uint64_t v39 = (char *)&v177 - v38;
  *uint64_t v1 = v7;
  (*(void (**)(void *, void, uint64_t))(v33 + 104))(v1, enum case for RRQuery.usoReference(_:), v32);
  ((void (*)(uint64_t))swift_retain)(v7);
  ((void (*)(void *, uint64_t, char *))dispatch thunk of RRReferenceResolverProtocol.resolve(reference:))( v1,  v189,  v191);
  sub_6570((uint64_t)v1, *(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
  v191 = v39;
  sub_628C((uint64_t)v39, (uint64_t)v37);
  if (((uint64_t (*)(uint64_t *, uint64_t))swift_getEnumCaseMultiPayload)(v37, v34) == 1)
  {
    uint64_t v40 = *v37;
    if (qword_10280 != -1) {
      swift_once(&qword_10280, sub_3DFC);
    }
    uint64_t v41 = sub_652C();
    sub_3EF4(v41, (uint64_t)qword_10680);
    sub_675C();
    uint64_t v42 = sub_675C();
    uint64_t v43 = (os_log_s *)((uint64_t (*)(uint64_t))Logger.logObject.getter)(v42);
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (_DWORD *)sub_6500(12LL);
      uint64_t v46 = sub_6500(32LL);
      uint64_t v200 = v40;
      uint64_t v201 = v46;
      _DWORD *v45 = 136315138;
      sub_675C();
      uint64_t v47 = sub_5E00(&qword_103A0);
      uint64_t v48 = ((uint64_t (*)(uint64_t *, uint64_t))String.init<A>(describing:))(&v200, v47);
      unint64_t v50 = v49;
      uint64_t v200 = sub_6754(v48, v49);
      sub_674C((uint64_t)&v200, (uint64_t)&v201, (uint64_t)(v45 + 1));
      swift_bridgeObjectRelease(v50);
      sub_6620();
      sub_6620();
      sub_659C(&dword_0, v43, v51, "ReferenceResolution# Received a failure: %s -> nil");
      sub_65B8((uint64_t)&type metadata for Any);
      sub_64F4(v46);
      sub_64F4((uint64_t)v45);
    }

    else
    {

      sub_6620();
      sub_6620();
    }

    uint64_t v78 = sub_6620();
    goto LABEL_13;
  }

  sub_668C((uint64_t)v31, (uint64_t)v37, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 32));
  v52 = *(void (**)(os_log_s *, uint8_t *, uint64_t))(v27 + 16);
  uint64_t v53 = v187;
  v52(v187, v31, v26);
  int v54 = (*(uint64_t (**)(os_log_s *, uint64_t))(v27 + 88))(v53, v26);
  uint64_t v55 = v26;
  uint64_t v56 = (uint64_t)v31;
  uint64_t v57 = v27;
  uint64_t v58 = (uint64_t)v53;
  if (v54 == enum case for RRResult.foundMatch(_:))
  {
    uint64_t v190 = v57;
    sub_6570((uint64_t)v53, *(uint64_t (**)(uint64_t, uint64_t))(v57 + 96));
    uint64_t v60 = v193;
    uint64_t v59 = v194;
    uint64_t v61 = v186;
    sub_668C((uint64_t)v186, (uint64_t)v53, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v193 + 32));
    if (qword_10280 != -1) {
      swift_once(&qword_10280, sub_3DFC);
    }
    uint64_t v62 = sub_652C();
    sub_3EF4(v62, (uint64_t)qword_10680);
    uint64_t v63 = sub_668C(v183, (uint64_t)v61, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 16));
    ((void (*)(uint64_t))Logger.logObject.getter)(v63);
    os_log_type_t v64 = sub_67A8();
    if (sub_66AC(v64))
    {
      uint64_t v65 = sub_6500(12LL);
      uint64_t v189 = v56;
      uint64_t v66 = (_DWORD *)v65;
      uint64_t v67 = sub_6500(32LL);
      uint64_t v201 = v67;
      *uint64_t v66 = 136315138;
      uint64_t v39 = (char *)(v66 + 3);
      uint64_t v69 = sub_67A0( &qword_103B8,  v68,  (uint64_t (*)(uint64_t))&type metadata accessor for RRCandidate,  (uint64_t)&protocol conformance descriptor for RRCandidate);
      uint64_t v70 = ((uint64_t (*)(uint64_t, uint64_t))dispatch thunk of CustomStringConvertible.description.getter)( v194,  v69);
      uint64_t v72 = sub_6754(v70, v71);
      uint64_t v73 = sub_6694(v72);
      uint64_t v59 = v194;
      sub_674C(v73, v74, v75);
      sub_6584();
      sub_6728();
      sub_659C(&dword_0, v61, v76, "ReferenceResolution# Found a candidate %s");
      sub_65B8((uint64_t)&type metadata for Any);
      sub_64F4(v67);
      uint64_t v77 = (uint64_t)v66;
      uint64_t v56 = v189;
      sub_64F4(v77);
    }

    else
    {
      sub_6728();
    }

    uint64_t v100 = v198;
    uint64_t v101 = sub_5E00(&qword_103B0);
    uint64_t v79 = (void *)swift_allocObject( v101,  ((*(unsigned __int8 *)(v100 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80))
                  + *(void *)(v100 + 72),
                    *(unsigned __int8 *)(v100 + 80) | 7LL);
    *((_OWORD *)v79 + 1) = xmmword_A7B0;
    uint64_t v102 = (uint64_t)v186;
    ((void (*)(void))RRCandidate.entity.getter)();
    ((void (*)(uint64_t, uint64_t))v39)(v102, v59);
    v103 = *(uint64_t (**)(uint64_t, uint64_t))(v190 + 8);
    goto LABEL_33;
  }

  uint64_t v81 = v193;
  uint64_t v80 = v194;
  if (v54 == enum case for RRResult.needsDisambiguation(_:))
  {
    v82 = *(uint64_t (**)(uint64_t, uint64_t))(v57 + 96);
    v186 = (os_log_s *)v55;
    sub_6570((uint64_t)v53, v82);
    uint64_t v83 = *(void *)v53;
    if (qword_10280 != -1) {
      swift_once(&qword_10280, sub_3DFC);
    }
    uint64_t v189 = (uint64_t)v31;
    uint64_t v84 = sub_652C();
    sub_6518(v84, (uint64_t)qword_10680);
    os_log_type_t v85 = sub_6630();
    if (sub_658C(v85))
    {
      v86 = (_WORD *)sub_6500(2LL);
      sub_66DC(v86);
      sub_655C(&dword_0, v53, (os_log_type_t)v55, "ReferenceResolution# Found ambiguous entities", v31);
      sub_64F4((uint64_t)v31);
    }

    uint64_t v87 = *(void *)(v83 + 16);
    if (v87)
    {
      uint64_t v190 = v57;
      uint64_t v88 = v83 + ((*(unsigned __int8 *)(v81 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80));
      uint64_t v89 = *(void *)(v81 + 72);
      uint64_t v188 = v83;
      swift_bridgeObjectRetain(v83);
      uint64_t v79 = &_swiftEmptyArrayStorage;
      uint64_t v90 = v197;
      uint64_t v91 = v199;
      do
      {
        uint64_t v92 = v195;
        uint64_t v93 = sub_6764(v195, v88);
        ((void (*)(uint64_t))RRCandidate.entity.getter)(v93);
        sub_625C(v90, 0LL, 1LL, v91);
        (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v92, v80);
        if (sub_5E40(v90, 1LL, v91) == 1)
        {
          sub_62D4(v90, &qword_10380);
        }

        else
        {
          v94 = *(void (**)(uint64_t, uint64_t, uint64_t))(v198 + 32);
          uint64_t v95 = v192;
          v94(v192, v90, v91);
          v94(v196, v95, v91);
          unint64_t v97 = *((void *)v79 + 2);
          unint64_t v96 = *((void *)v79 + 3);
          if (v97 >= v96 >> 1) {
            uint64_t v79 = (void *)sub_65AC(v96 > 1, v97 + 1);
          }
          *((void *)v79 + 2) = v97 + 1;
          sub_6674();
          ((void (*)(unint64_t, uint64_t))v94)(v98 + v99 * v97, v196);
          uint64_t v81 = v193;
          uint64_t v80 = v194;
        }

        v88 += v89;
        --v87;
      }

      while (v87);
LABEL_39:
      sub_6618();
      uint64_t v57 = v190;
      goto LABEL_59;
    }

LABEL_58:
    uint64_t v79 = &_swiftEmptyArrayStorage;
LABEL_59:
    uint64_t v137 = (*(uint64_t (**)(uint64_t, os_log_s *))(v57 + 8))(v189, v186);
    sub_6720(v137, &qword_10398);
    sub_6618();
    return v79;
  }

  if (v54 == enum case for RRResult.foundMatchPlural(_:))
  {
    sub_6570((uint64_t)v53, *(uint64_t (**)(uint64_t, uint64_t))(v57 + 96));
    uint64_t v105 = *(void *)v53;
    if (qword_10280 != -1) {
      swift_once(&qword_10280, sub_3DFC);
    }
    uint64_t v106 = sub_652C();
    v107 = (os_log_s *)sub_3EF4(v106, (uint64_t)qword_10680);
    uint64_t v108 = swift_bridgeObjectRetain(v105);
    ((void (*)(uint64_t))Logger.logObject.getter)(v108);
    os_log_type_t v109 = sub_6630();
    if (sub_6708(v109))
    {
      uint64_t v110 = v57;
      v111 = (uint8_t *)sub_6500(12LL);
      *(_DWORD *)v111 = 134217984;
      uint64_t v201 = *(void *)(v105 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v201, &v202, v111 + 4, v111 + 12);
      sub_6618();
      sub_6610( &dword_0,  v107,  (os_log_type_t)v31,  "ReferenceResolution# Found %ld candidates. Using the first one",  v111);
      uint64_t v112 = (uint64_t)v111;
      uint64_t v57 = v110;
      sub_64F4(v112);
    }

    else
    {

      sub_6618();
    }

    uint64_t v139 = v181;
    sub_5858(v105, (uint64_t (*)(void))&type metadata accessor for RRCandidate, v181);
    sub_6618();
    uint64_t v140 = v194;
    int v141 = sub_5E40(v139, 1LL, v194);
    uint64_t v142 = v193;
    if (v141 != 1)
    {
      uint64_t v150 = v179;
      ((void (*)(void))RRCandidate.entity.getter)();
      (*(void (**)(uint64_t, uint64_t))(v142 + 8))(v139, v140);
      uint64_t v151 = v198;
      uint64_t v152 = v180;
      sub_6764(v180, v150);
      uint64_t v153 = sub_5E00(&qword_103B0);
      uint64_t v154 = *(void *)(v151 + 72);
      uint64_t v155 = *(unsigned __int8 *)(v151 + 80);
      uint64_t v156 = (v155 + 32) & ~v155;
      uint64_t v79 = (void *)swift_allocObject(v153, v156 + v154, v155 | 7);
      *((_OWORD *)v79 + 1) = xmmword_A7B0;
      sub_6764((uint64_t)v79 + v156, v152);
      v103 = *(uint64_t (**)(uint64_t, uint64_t))(v57 + 8);
LABEL_33:
      uint64_t v104 = sub_6570(v56, v103);
      sub_6720(v104, &qword_10398);
      return v79;
    }

    sub_62D4(v139, &qword_10390);
    goto LABEL_75;
  }

  if (v54 == enum case for RRResult.needsDisambiguationPlural(_:))
  {
    uint64_t v189 = (uint64_t)v31;
    sub_6570((uint64_t)v53, *(uint64_t (**)(uint64_t, uint64_t))(v57 + 96));
    uint64_t v113 = *(void *)v53;
    if (qword_10280 != -1) {
      swift_once(&qword_10280, sub_3DFC);
    }
    v186 = (os_log_s *)v55;
    uint64_t v114 = sub_652C();
    sub_6518(v114, (uint64_t)qword_10680);
    os_log_type_t v115 = sub_6630();
    BOOL v116 = sub_6708(v115);
    uint64_t v117 = v188;
    if (v116)
    {
      uint64_t v118 = v57;
      v119 = (uint8_t *)sub_6500(2LL);
      *(_WORD *)v119 = 0;
      sub_655C(&dword_0, v53, (os_log_type_t)v31, "ReferenceResolution# Found plural ambiguous entities", v119);
      uint64_t v120 = (uint64_t)v119;
      uint64_t v57 = v118;
      sub_64F4(v120);
    }

    uint64_t v121 = *(void *)(v113 + 16);
    if (!v121) {
      goto LABEL_58;
    }
    uint64_t v190 = v57;
    swift_bridgeObjectRetain(v113);
    uint64_t v122 = 0LL;
    uint64_t v79 = &_swiftEmptyArrayStorage;
    v123 = &qword_10380;
    while (1)
    {
      uint64_t v124 = *(void *)(v113 + 8 * v122 + 32);
      if (*(void *)(v124 + 16))
      {
        uint64_t v125 = v193;
        uint64_t v126 = v194;
        uint64_t v127 = v184;
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v193 + 16))( v184,  v124 + ((*(unsigned __int8 *)(v193 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v193 + 80)),  v194);
        uint64_t v128 = swift_bridgeObjectRetain(v124);
        ((void (*)(uint64_t))RRCandidate.entity.getter)(v128);
        uint64_t v129 = v199;
        v130 = *(void (**)(uint64_t, uint64_t))(v125 + 8);
        uint64_t v117 = v188;
        v130(v127, v126);
        sub_676C(v117, 0LL);
        swift_bridgeObjectRelease(v124);
        if (sub_5E40(v117, 1LL, v129) != 1)
        {
          v131 = v123;
          uint64_t v132 = v182;
          sub_6744(v182, v117);
          sub_6744(v185, v132);
          unint64_t v134 = *((void *)v79 + 2);
          unint64_t v133 = *((void *)v79 + 3);
          if (v134 >= v133 >> 1) {
            uint64_t v79 = (void *)sub_65AC(v133 > 1, v134 + 1);
          }
          *((void *)v79 + 2) = v134 + 1;
          sub_6674();
          sub_6744(v135 + v136 * v134, v185);
          v123 = v131;
          goto LABEL_56;
        }
      }

      else
      {
        sub_676C(v117, 1LL);
      }

      sub_62D4(v117, v123);
LABEL_56:
      if (v121 == ++v122) {
        goto LABEL_39;
      }
    }
  }

  if (v54 != enum case for RRResult.noMatch(_:))
  {
    if (qword_10280 != -1) {
      swift_once(&qword_10280, sub_3DFC);
    }
    uint64_t v157 = sub_652C();
    sub_3EF4(v157, (uint64_t)qword_10680);
    uint64_t v158 = v178;
    uint64_t v159 = ((uint64_t (*)(uint64_t, uint8_t *, uint64_t))v52)(v178, v31, v55);
    v160 = (os_log_s *)((uint64_t (*)(uint64_t))Logger.logObject.getter)(v159);
    os_log_type_t v161 = static os_log_type_t.error.getter();
    if (sub_66AC(v161))
    {
      uint64_t v162 = sub_6500(12LL);
      uint64_t v189 = (uint64_t)v31;
      v163 = (_DWORD *)v162;
      uint64_t v164 = v55;
      uint64_t v165 = sub_6500(32LL);
      uint64_t v201 = v165;
      _DWORD *v163 = 136315138;
      uint64_t v167 = sub_67A0( &qword_103A8,  v166,  (uint64_t (*)(uint64_t))&type metadata accessor for RRResult,  (uint64_t)&protocol conformance descriptor for RRResult);
      uint64_t v168 = ((uint64_t (*)(uint64_t, uint64_t))dispatch thunk of CustomStringConvertible.description.getter)( v164,  v167);
      uint64_t v170 = sub_6754(v168, v169);
      uint64_t v171 = sub_6694(v170);
      sub_674C(v171, v172, v173);
      sub_6584();
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v158, v164);
      sub_659C(&dword_0, v160, v174, "ReferenceResolution# Received unknown result type %s");
      sub_65B8((uint64_t)&type metadata for Any);
      sub_64F4(v165);
      sub_64F4((uint64_t)v163);

      uint64_t v175 = v189;
      uint64_t v58 = (uint64_t)v187;
    }

    else
    {

      sub_6778(v158);
      uint64_t v175 = (uint64_t)v31;
    }

    uint64_t v176 = sub_6778(v175);
    sub_6720(v176, &qword_10398);
    sub_6778(v58);
    return &_swiftEmptyArrayStorage;
  }

  if (qword_10280 != -1) {
    swift_once(&qword_10280, sub_3DFC);
  }
  uint64_t v143 = sub_652C();
  sub_6518(v143, (uint64_t)qword_10680);
  os_log_type_t v144 = sub_67A8();
  if (!sub_6508(v144))
  {

LABEL_75:
    v148 = *(uint64_t (**)(uint64_t, uint64_t))(v57 + 8);
    uint64_t v149 = (uint64_t)v31;
    goto LABEL_76;
  }

  v145 = (_WORD *)sub_6500(2LL);
  sub_66DC(v145);
  sub_6534(&dword_0, v146, v147, "ReferenceResolution# No matches found");
  sub_64F4((uint64_t)v31);

  v148 = *(uint64_t (**)(uint64_t, uint64_t))(v57 + 8);
  uint64_t v149 = (uint64_t)v31;
LABEL_76:
  uint64_t v78 = sub_6570(v149, v148);
LABEL_13:
  sub_6720(v78, &qword_10398);
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_584C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_5858(a1, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct, a2);
}

uint64_t sub_5858@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = a2(0LL);
  uint64_t v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))( a3,  a1 + ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL)),  v6);
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  return sub_625C(a3, v8, 1LL, v7);
}

void sub_58D0()
{
  uint64_t v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v7 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  __chkstk_darwin(v7);
  sub_6644();
  uint64_t v8 = USOParse.userParse.getter();
  uint64_t v9 = Siri_Nlu_External_UserParse.userDialogActs.getter(v8);
  sub_5858(v9, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct, (uint64_t)v2);
  sub_6584();
  if (sub_5E40((uint64_t)v2, 1LL, v3) == 1)
  {
    sub_65C8();
    sub_62D4((uint64_t)v2, &qword_10370);
    goto LABEL_22;
  }

  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v6, v2, v3);
  uint64_t v10 = static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)(v6);
  uint64_t v11 = v10;
  if (!((unint64_t)v10 >> 62))
  {
LABEL_20:
    sub_6584();
    goto LABEL_21;
  }

  if (v10 < 0) {
    uint64_t v18 = v10;
  }
  else {
    uint64_t v18 = v10 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v10);
  uint64_t v19 = _CocoaArrayWrapper.endIndex.getter(v18);
  sub_6584();
  if (!v19) {
    goto LABEL_20;
  }
LABEL_5:
  if ((v11 & 0xC000000000000001LL) != 0)
  {
    uint64_t v12 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v11);
  }

  else
  {
    if (!*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8LL)))
    {
      __break(1u);
      goto LABEL_25;
    }

    uint64_t v12 = *(void *)(v11 + 32);
    swift_retain(v12);
  }

  sub_6584();
  uint64_t v13 = swift_retain(v12);
  static UsoTask_CodegenConverter.convert(task:)(v21, v13);
  sub_66D4();
  if (!v21[3])
  {
    sub_62D4((uint64_t)v21, &qword_10378);
    goto LABEL_15;
  }

  uint64_t v14 = type metadata accessor for UsoTask_reply_common_Message(0LL);
  if ((swift_dynamicCast(&v22, v21, (char *)&type metadata for Any + 8, v14, 6LL) & 1) == 0)
  {
LABEL_15:
    sub_66D4();
LABEL_21:
    sub_6570((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    sub_65C8();
    goto LABEL_22;
  }

  swift_release(v22);
  if (qword_10280 != -1) {
LABEL_25:
  }
    swift_once(&qword_10280, sub_3DFC);
  uint64_t v15 = sub_652C();
  sub_6518(v15, (uint64_t)qword_10680);
  os_log_type_t v16 = sub_6630();
  if (os_log_type_enabled((os_log_t)v11, v16))
  {
    uint64_t v17 = (uint8_t *)sub_6500(2LL);
    *(_WORD *)uint64_t v17 = 0;
    sub_655C(&dword_0, (os_log_s *)v11, v16, "MessagesTVOSFlowPlugin USOParse is reply::common_Message", v17);
    sub_64F4((uint64_t)v17);
  }

  sub_66D4();

  sub_6570((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_65C8();
LABEL_22:
  sub_65F8();
}

void *sub_5D10()
{
  return v0;
}

uint64_t sub_5D3C()
{
  return swift_deallocClassInstance(v0, 136LL, 7LL);
}

uint64_t type metadata accessor for MessagesTVOSFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC22MessagesTVOSFlowPlugin22MessagesTVOSFlowPlugin);
}

uint64_t sub_5D7C()
{
  return sub_4044();
}

uint64_t sub_5D9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3FDC();
  *a1 = result;
  return result;
}

uint64_t sub_5DD4(uint64_t a1, uint64_t a2)
{
  return sub_6350( &qword_10368,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for MessagesTVOSFlowPlugin,  (uint64_t)&unk_A7F8);
}

uint64_t sub_5E00(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_5E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_5E4C(char a1, int64_t a2, char a3, uint64_t a4)
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
LABEL_24:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_26:
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

  uint64_t v10 = sub_5E00(&qword_103B0);
  uint64_t v11 = *(void *)(type metadata accessor for RREntity(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12) {
    goto LABEL_24;
  }
  if (v16 - v14 == 0x8000000000000000LL && v12 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_26;
  }

  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = *(unsigned __int8 *)(*(void *)(type metadata accessor for RREntity(0LL) - 8) + 80LL);
  uint64_t v19 = (v18 + 32) & ~v18;
  unint64_t v20 = (unint64_t)v15 + v19;
  if ((a1 & 1) != 0)
  {
    sub_613C(a4 + v19, v8, v20);
    *(void *)(a4 + 16) = 0LL;
    swift_bridgeObjectRelease(a4);
  }

  else
  {
    sub_601C(0LL, v8, v20, a4);
  }

  return (uint64_t)v15;
}

uint64_t sub_601C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  uint64_t v8 = *(void *)(type metadata accessor for RREntity(0LL) - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 72);
  unint64_t v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  uint64_t v12 = v10 * v4;
  unint64_t v13 = a3 + v12;
  unint64_t v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v13;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_613C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    char v8 = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v8,  1046LL,  0);
    __break(1u);
  }

  else if (a3 < a1 {
         || (uint64_t result = type metadata accessor for RREntity(0LL),
  }
             a1 + *(void *)(*(void *)(result - 8) + 72LL) * a2 <= a3))
  {
    uint64_t v7 = type metadata accessor for RREntity(0LL);
    return swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }

  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }

  return result;
}

unint64_t sub_6238(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_625C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

void *sub_6268(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_628C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5E00(&qword_10398);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_62D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5E00(a2);
  sub_67C4(*(void *)(v3 - 8));
  return a1;
}

uint64_t sub_630C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 3sub_64D4(v0 + 2) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_6350(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

uint64_t sub_6390(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = type metadata accessor for ReferenceResolutionClient(0LL);
  size_t v16 = &protocol witness table for ReferenceResolutionClient;
  *(void *)&__int128 v14 = a3;
  if (qword_10280 != -1) {
    swift_once(&qword_10280, sub_3DFC);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_3EF4(v8, (uint64_t)qword_10680);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "MessagesTVOSFlowPlugin is being initialized", v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  sub_64BC(a1, a4 + 16);
  sub_64BC(a2, a4 + 56);
  sub_64BC(&v14, a4 + 96);
  return a4;
}

uint64_t sub_64BC(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 3sub_64D4(v0 + 2) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_64D4(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_64F4(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_6500(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

BOOL sub_6508(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_6518(uint64_t a1, uint64_t a2)
{
  return Logger.logObject.getter();
}

uint64_t sub_652C()
{
  return type metadata accessor for Logger(0LL);
}

void sub_6534(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

  ;
}

void sub_655C(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t sub_6570@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

  ;
}

uint64_t sub_6584()
{
  return swift_bridgeObjectRelease(v0);
}

BOOL sub_658C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void sub_659C(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_65AC(char a1, int64_t a2)
{
  return sub_5E4C(a1, a2, 1, v2);
}

uint64_t sub_65B8@<X0>(uint64_t a1@<X8>)
{
  return swift_arrayDestroy(v1, 1LL, a1 + 8);
}

uint64_t sub_65C8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

  ;
}

  ;
}

  ;
}

void sub_6610(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_6618()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_6620()
{
  return swift_errorRelease(v0);
}

uint64_t sub_6628()
{
  return swift_errorRelease(v0);
}

uint64_t sub_6630()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_6638(uint64_t a1)
{
  return swift_allocObject(a1, *(unsigned int *)(a1 + 48), *(unsigned __int16 *)(a1 + 52));
}

  ;
}

  ;
}

  ;
}

uint64_t sub_668C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_6694(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

BOOL sub_66AC(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

uint64_t sub_66D4()
{
  return swift_release(v0);
}

_WORD *sub_66DC(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_66E8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_66F8(uint64_t a1)
{
  return Flow.eraseToAnyFlow()(v1, a1);
}

BOOL sub_6708(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_6718()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_6720(uint64_t a1, uint64_t *a2)
{
  return sub_62D4(*(void *)(v2 - 176), a2);
}

uint64_t sub_6728()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_6738()
{
  return 0LL;
}

uint64_t sub_6744(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_674C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, a3, v3);
}

uint64_t sub_6754(uint64_t a1, unint64_t a2)
{
  return sub_95F0(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t sub_675C()
{
  return swift_errorRetain(v0);
}

uint64_t sub_6764(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

uint64_t sub_676C(uint64_t a1, uint64_t a2)
{
  return sub_625C(a1, a2, 1LL, v2);
}

uint64_t sub_6778(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_6780()
{
  return static FlowSearchResult.flow(_:)(v0);
}

uint64_t sub_678C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_6794(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_6350(a1, 255LL, v4, a4);
}

uint64_t sub_67A0(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  return sub_6350(a1, 255LL, a3, a4);
}

uint64_t sub_67A8()
{
  return static os_log_type_t.debug.getter();
}

  ;
}

uint64_t sub_67C4@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_67D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_625C(a1, 1LL, 3LL, a4);
}

  ;
}

uint64_t sub_67E8()
{
  return swift_release(v0);
}

uint64_t sub_67F0()
{
  return sub_630C(v0 + 56, v1 - 120);
}

uint64_t sub_67FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v159 = a2;
  uint64_t v3 = type metadata accessor for UsoIdentifier(0LL);
  uint64_t v161 = *(void *)(v3 - 8);
  uint64_t v162 = v3;
  sub_6578();
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v150 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v158 = type metadata accessor for UtteranceAlignment(0LL);
  uint64_t v160 = *(void *)(v158 - 8);
  sub_6578();
  __chkstk_darwin(v7);
  sub_65E4();
  uint64_t v157 = v8;
  sub_5E00(&qword_10370);
  sub_6578();
  __chkstk_darwin(v9);
  sub_65E4();
  uint64_t v172 = (void *)v10;
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v170 = v11;
  uint64_t v171 = v12;
  sub_6578();
  __chkstk_darwin(v13);
  sub_65E4();
  uint64_t v165 = v14;
  uint64_t v15 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  uint64_t v166 = *(void *)(v15 - 8);
  uint64_t v167 = v15;
  sub_6578();
  __chkstk_darwin(v16);
  sub_65E4();
  uint64_t v169 = v17;
  uint64_t v18 = type metadata accessor for Parse(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v150 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v174 = type metadata accessor for USOParse(0LL);
  uint64_t v22 = *(void *)(v174 - 8);
  uint64_t v23 = __chkstk_darwin(v174);
  v163 = (char *)&v150 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v168 = (char *)&v150 - v26;
  __chkstk_darwin(v25);
  uint64_t v173 = (char *)&v150 - v27;
  if (qword_10288 != -1) {
    swift_once(&qword_10288, sub_3F48);
  }
  uint64_t v28 = type metadata accessor for Logger(0LL);
  uint64_t v29 = sub_3EF4(v28, (uint64_t)qword_10698);
  uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v31 = static os_log_type_t.debug.getter();
  uint64_t v32 = v31;
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v33 = (uint8_t *)sub_736C();
    uint64_t v156 = v22;
    uint64_t v34 = a1;
    uint64_t v35 = v29;
    uint64_t v36 = v19;
    uint64_t v37 = v18;
    uint64_t v38 = v6;
    uint64_t v39 = v33;
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl( &dword_0,  v30,  (os_log_type_t)v32,  "#Transformer.getReplyAnnouncementParseTransformer .transform was called",  v33,  2u);
    uint64_t v40 = (uint64_t)v39;
    unint64_t v6 = v38;
    uint64_t v18 = v37;
    uint64_t v19 = v36;
    uint64_t v29 = v35;
    a1 = v34;
    uint64_t v22 = v156;
    sub_64F4(v40);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  unsigned int v41 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v21, v18);
  if (v41 == enum case for Parse.uso(_:))
  {
    unsigned int v153 = v41;
    uint64_t v152 = v6;
    uint64_t v154 = v19;
    uint64_t v42 = *(void (**)(char *, uint64_t))(v19 + 96);
    uint64_t v155 = v18;
    v42(v21, v18);
    uint64_t v43 = v173;
    os_log_type_t v44 = v21;
    uint64_t v45 = v174;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v173, v44, v174);
    uint64_t v46 = v22;
    uint64_t v47 = *(uint64_t (**)(char *, char *, uint64_t))(v22 + 16);
    uint64_t v48 = v168;
    uint64_t v49 = v47(v168, v43, v45);
    uint64_t v156 = v29;
    unint64_t v50 = (os_log_s *)Logger.logObject.getter(v49);
    os_log_type_t v51 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v53 = swift_slowAlloc(32LL, -1LL);
      v175[0] = v53;
      *(_DWORD *)v52 = 136315138;
      uint64_t v151 = v52 + 4;
      int v54 = v163;
      v47(v163, v48, v174);
      uint64_t v55 = String.init<A>(describing:)(v54, v174);
      unint64_t v57 = v56;
      uint64_t v176 = sub_95F0(v55, v56, v175);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v176, &v177, v151, v52 + 12);
      swift_bridgeObjectRelease(v57);
      v163 = *(char **)(v46 + 8);
      ((void (*)(char *, uint64_t))v163)(v48, v174);
      _os_log_impl( &dword_0,  v50,  v51,  "#Transformer.getReplyAnnouncementParseTransformer parse is a usoParse: %s",  v52,  0xCu);
      swift_arrayDestroy(v53, 1LL, (char *)&type metadata for Any + 8);
      sub_64F4(v53);
      sub_64F4((uint64_t)v52);
    }

    else
    {
      v163 = *(char **)(v46 + 8);
      ((void (*)(char *, uint64_t))v163)(v48, v45);
    }

    uint64_t v70 = v171;
    uint64_t v71 = USOParse.userParse.getter();
    uint64_t v72 = (void *)Siri_Nlu_External_UserParse.userDialogActs.getter(v71);
    uint64_t v73 = (uint64_t)v172;
    sub_584C((uint64_t)v72, (uint64_t)v172);
    swift_bridgeObjectRelease(v72);
    uint64_t v74 = v170;
    if (sub_5E40(v73, 1LL, v170) == 1)
    {
      sub_72F8((uint64_t)v172, &qword_10370);
      sub_73C4();
      os_log_type_t v75 = sub_7408();
      if (sub_6508(v75))
      {
        uint64_t v76 = (_WORD *)sub_736C();
        sub_7418(v76);
        sub_7334(&dword_0, v77, v78, "#Transformer.getReplyAnnouncementParseTransformer did not have a userDialogAct");
        sub_64F4(v70);
      }

      sub_73D0();
      unint64_t v79 = sub_7400();
      uint64_t v80 = sub_7348(v79);
      sub_7378(v80, v81);
      sub_73B4(v83, v82 | 2);
      sub_735C(v84, enum case for TransformationError.cannotTransform(_:));
      sub_73F8();
      goto LABEL_58;
    }

    os_log_type_t v85 = v165;
    (*(void (**)(void *, void *, uint64_t))(v70 + 32))(v165, v172, v74);
    uint64_t v86 = v164;
    uint64_t v87 = static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)(v85);
    if (v86)
    {
      (*(void (**)(void *, uint64_t))(v70 + 8))(v85, v74);
LABEL_58:
      sub_73E8();
      return sub_73D8();
    }

    uint64_t v88 = v87;
    if ((unint64_t)v87 >> 62)
    {
      if (v87 < 0) {
        uint64_t v139 = v87;
      }
      else {
        uint64_t v139 = v87 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v87);
      uint64_t v89 = _CocoaArrayWrapper.endIndex.getter(v139);
      sub_6584();
      if (v89)
      {
LABEL_20:
        sub_6238(0LL, (v88 & 0xC000000000000001LL) == 0, v88);
        if ((v88 & 0xC000000000000001LL) != 0)
        {
          uint64_t v90 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v88);
        }

        else
        {
          uint64_t v90 = *(void **)(v88 + 32);
          swift_retain(v90);
        }

        sub_6584();
        uint64_t v91 = swift_retain(v90);
        static UsoTask_CodegenConverter.convert(task:)(v175, v91);
        swift_release(v90);
        uint64_t v92 = v171;
        uint64_t v172 = v90;
        if (v175[3])
        {
          uint64_t v93 = type metadata accessor for UsoTask_reply_common_Message(0LL);
          if ((swift_dynamicCast(&v176, v175, (char *)&type metadata for Any + 8, v93, 6LL) & 1) != 0)
          {
            v94 = (char *)v176;
            uint64_t v95 = type metadata accessor for UsoTaskBuilder_reply_common_Announcement(0LL);
            sub_6638(v95);
            uint64_t v96 = UsoTaskBuilder_reply_common_Announcement.init()();
            uint64_t v97 = swift_retain(v94);
            dispatch thunk of Uso_VerbTemplate_ReferenceTarget.target.getter(v175, v97);
            swift_release(v94);
            uint64_t v98 = v175[0];
            if (v175[0])
            {
              uint64_t v99 = type metadata accessor for UsoEntityBuilder_common_Announcement(0LL);
              sub_6638(v99);
              uint64_t v100 = UsoEntityBuilder_common_Announcement.init()();
              uint64_t v101 = dispatch thunk of UsoEntity_common_Message.stringContent.getter();
              uint64_t v103 = v98;
              uint64_t v104 = v100;
              uint64_t v105 = v165;
              if (v102)
              {
                uint64_t v106 = v102;
                uint64_t v156 = v96;
                dispatch thunk of UsoEntityBuilder_common_Announcement.setContent(value:)(v101);
                swift_bridgeObjectRelease(v106);
                uint64_t v107 = sub_738C();
                uint64_t v108 = (uint8_t *)dispatch thunk of CodeGenBase.getUtteranceAlignmentsHelper(attributeName:)(v107);
                if (!v108) {
                  uint64_t v108 = (uint8_t *)&_swiftEmptyArrayStorage;
                }
                uint64_t v109 = *((void *)v108 + 2);
                uint64_t v168 = v94;
                uint64_t v164 = v103;
                if (v109)
                {
                  unint64_t v110 = (*(unsigned __int8 *)(v160 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v160 + 80);
                  uint64_t v151 = v108;
                  v111 = &v108[v110];
                  uint64_t v112 = *(void *)(v160 + 72);
                  uint64_t v113 = *(uint64_t (**)(uint64_t, uint8_t *, uint64_t))(v160 + 16);
                  uint64_t v114 = v158;
                  uint64_t v115 = v157;
                  do
                  {
                    uint64_t v116 = v113(v115, v111, v114);
                    if (dispatch thunk of UsoEntityBuilder_common_Announcement.content.getter(v116))
                    {
                      dispatch thunk of UsoBuilder.addUtteranceAlignment(utteranceAlignment:)(v115);
                      sub_7410();
                    }

                    (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v115, v114);
                    v111 += v112;
                    --v109;
                  }

                  while (v109);
                  swift_bridgeObjectRelease(v151);
                  uint64_t v103 = v164;
                  uint64_t v105 = v165;
                  v94 = v168;
                }

                else
                {
                  swift_bridgeObjectRelease(v108);
                }

                uint64_t v128 = sub_738C();
                uint64_t v129 = (void *)dispatch thunk of CodeGenBase.getUsoIdentifiersHelper(attributeName:)(v128);
                if (!v129) {
                  uint64_t v129 = &_swiftEmptyArrayStorage;
                }
                uint64_t v130 = v129[2];
                if (v130)
                {
                  uint64_t v131 = v162;
                  uint64_t v132 = v129;
                  unint64_t v133 = (char *)v129
                       + ((*(unsigned __int8 *)(v161 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v161 + 80));
                  uint64_t v134 = *(void *)(v161 + 72);
                  uint64_t v135 = *(uint64_t (**)(char *, char *, uint64_t))(v161 + 16);
                  uint64_t v136 = v152;
                  do
                  {
                    uint64_t v137 = v135(v136, v133, v131);
                    if (dispatch thunk of UsoEntityBuilder_common_Announcement.content.getter(v137))
                    {
                      dispatch thunk of UsoBuilder.addUsoIdentifier(usoIdentifier:)(v136);
                      sub_7410();
                    }

                    uint64_t v131 = v162;
                    (*(void (**)(char *, uint64_t))(v161 + 8))(v136, v162);
                    v133 += v134;
                    --v130;
                  }

                  while (v130);
                  swift_bridgeObjectRelease(v132);
                  uint64_t v103 = v164;
                  uint64_t v105 = v165;
                  v94 = v168;
                }

                else
                {
                  swift_bridgeObjectRelease(v129);
                }
              }

              dispatch thunk of Uso_VerbTemplateBuilder_ReferenceTarget.setTarget(value:)(v104);
              swift_release(v103);
              swift_release(v104);
              uint64_t v92 = v171;
            }

            else
            {
              uint64_t v105 = v165;
            }

            uint64_t v138 = v159;
            sub_7424(v159);
            swift_release(v172);
            swift_release(v94);
            sub_7410();
            (*(void (**)(void *, uint64_t))(v92 + 8))(v105, v170);
            sub_73E8();
            sub_73D8();
            return (*(uint64_t (**)(uint64_t, void, uint64_t))(v154 + 104))(v138, v153, v155);
          }
        }

        else
        {
          sub_72F8((uint64_t)v175, &qword_10378);
        }

        sub_73C4();
        os_log_type_t v117 = sub_7408();
        if (sub_6508(v117))
        {
          uint64_t v118 = (_WORD *)sub_736C();
          sub_7418(v118);
          sub_7334( &dword_0,  v119,  v120,  "#Transformer.getReplyAnnouncementParseTransformer could not convert UsoTask to replyTask");
          uint64_t v121 = v92;
          uint64_t v92 = v171;
          sub_64F4(v121);
        }

        sub_73D0();
        unint64_t v122 = sub_7400();
        uint64_t v123 = sub_7348(v122);
        sub_7378(v123, v124);
        sub_73B4(v126, v125 + 12);
        sub_735C(v127, enum case for TransformationError.cannotTransform(_:));
        sub_73F8();
        swift_release(v172);
        (*(void (**)(void *, uint64_t))(v92 + 8))(v165, v74);
        goto LABEL_58;
      }
    }

    else
    {
      uint64_t v89 = *(void *)((char *)&dword_10 + (v87 & 0xFFFFFFFFFFFFF8LL));
      if (v89) {
        goto LABEL_20;
      }
    }

    sub_6584();
    sub_73C4();
    os_log_type_t v140 = sub_7408();
    if (sub_6508(v140))
    {
      int v141 = (_WORD *)sub_736C();
      sub_7418(v141);
      sub_7334( &dword_0,  v142,  v143,  "#Transformer.getReplyAnnouncementParseTransformer External_UDA does not have a first task");
      sub_64F4(v89);
    }

    sub_73D0();
    unint64_t v144 = sub_7400();
    uint64_t v145 = sub_7348(v144);
    sub_7378(v145, v146);
    sub_73B4(v147, v148);
    sub_735C(v149, enum case for TransformationError.cannotTransform(_:));
    sub_73F8();
    (*(void (**)(void *, uint64_t))(v171 + 8))(v165, v74);
    goto LABEL_58;
  }

  uint64_t v58 = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  Logger.logObject.getter(v58);
  os_log_type_t v59 = sub_7408();
  if (sub_6508(v59))
  {
    uint64_t v60 = (_WORD *)sub_736C();
    sub_7418(v60);
    sub_7334(&dword_0, v61, v62, "#Transformer.getReplyAnnouncementParseTransformer parse was not a .uso parse");
    sub_64F4(v32);
  }

  sub_73D0();
  unint64_t v63 = sub_7400();
  uint64_t v64 = sub_7348(v63);
  sub_7378(v64, v65);
  sub_73B4(v66, v67);
  sub_735C(v68, enum case for TransformationError.cannotTransform(_:));
  return sub_73F8();
}

unint64_t sub_72B8()
{
  unint64_t result = qword_103D0;
  if (!qword_103D0)
  {
    uint64_t v1 = type metadata accessor for TransformationError(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for TransformationError, v1);
    atomic_store(result, (unint64_t *)&qword_103D0);
  }

  return result;
}

uint64_t sub_72F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5E00(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void sub_7334(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_7348(uint64_t a1)
{
  return swift_allocError(v1, a1, 0LL, 0LL);
}

uint64_t sub_735C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 104LL))(a1, a2, v2);
}

uint64_t sub_736C()
{
  return swift_slowAlloc(2LL, -1LL);
}

uint64_t sub_7378(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_738C()
{
  return 0x6F43676E69727473LL;
}

void sub_73B4(void *a1@<X1>, uint64_t a2@<X8>)
{
  *a1 = a2;
  a1[1] = (v2 - 32) | 0x8000000000000000LL;
}

uint64_t sub_73C4()
{
  return Logger.logObject.getter();
}

uint64_t sub_73D0()
{
  return type metadata accessor for TransformationError(0LL);
}

uint64_t sub_73D8()
{
  return (*(uint64_t (**)(void, uint64_t))(v1 - 216))(*(void *)(v1 - 136), v0);
}

uint64_t sub_73E8()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 192) + 8LL))(v0, *(void *)(v1 - 184));
}

uint64_t sub_73F8()
{
  return swift_willThrow();
}

unint64_t sub_7400()
{
  return sub_72B8();
}

uint64_t sub_7408()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_7410()
{
  return swift_release(v0);
}

_WORD *sub_7418(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

void sub_7424(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  sub_5E00(&qword_103D8);
  sub_7C0C();
  __chkstk_darwin(v1);
  sub_65E4();
  uint64_t v49 = v2;
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v48 = v3;
  __chkstk_darwin(v3);
  sub_7C1C();
  uint64_t v46 = v4 - v5;
  __chkstk_darwin(v6);
  uint64_t v43 = (char *)&v41 - v7;
  uint64_t v52 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  uint64_t v8 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  sub_65E4();
  uint64_t v51 = v9;
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserStatedTask(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v41 = v10;
  uint64_t v42 = v11;
  __chkstk_darwin(v10);
  sub_7C1C();
  uint64_t v14 = v12 - v13;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v41 - v16;
  uint64_t v18 = type metadata accessor for Siri_Nlu_External_UsoGraph(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v44 = v18;
  uint64_t v45 = v19;
  __chkstk_darwin(v18);
  sub_7C1C();
  uint64_t v22 = v20 - v21;
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v41 - v24;
  sub_771C(0LL, 0LL);
  Siri_Nlu_External_UserStatedTask.init()();
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v22, v25, v18);
  uint64_t v26 = Siri_Nlu_External_UserStatedTask.task.setter(v22);
  uint64_t v27 = v51;
  Siri_Nlu_External_UserDialogAct.init()(v26);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v14, v17, v10);
  uint64_t v28 = Siri_Nlu_External_UserDialogAct.userStatedTask.setter(v14);
  uint64_t v29 = v43;
  Siri_Nlu_External_UserParse.init()(v28);
  uint64_t v30 = sub_5E00(&qword_103E0);
  uint64_t v31 = v8;
  uint64_t v32 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v33 = (v32 + 32) & ~v32;
  uint64_t v34 = swift_allocObject(v30, v33 + *(void *)(v8 + 72), v32 | 7);
  *(_OWORD *)(v34 + 16) = xmmword_A7B0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v34 + v33, v27, v52);
  Siri_Nlu_External_UserParse.userDialogActs.setter(v34);
  uint64_t v36 = v46;
  uint64_t v35 = v47;
  uint64_t v37 = v48;
  (*(void (**)(uint64_t, char *, uint64_t))(v47 + 16))(v46, v29, v48);
  uint64_t v38 = enum case for Siri_Nlu_External_Parser.ParserIdentifier.nlv4(_:);
  uint64_t v39 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier(0LL);
  uint64_t v40 = v49;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104LL))(v49, v38, v39);
  sub_625C(v40, 0LL, 1LL, v39);
  USOParse.init(userParse:parserIdentifier:appBundleId:)(v36, v40, 0LL, 0LL);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v29, v37);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v51, v52);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v17, v41);
  sub_7C2C(v45);
  sub_65F8();
}

void sub_771C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Node(0LL);
  uint64_t v37 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_7BFC();
  sub_5E00(&qword_103E8);
  sub_7C0C();
  __chkstk_darwin(v5);
  sub_7BFC();
  uint64_t v8 = v7 - v6;
  sub_5E00(&qword_103F0);
  sub_7C0C();
  __chkstk_darwin(v9);
  sub_7BFC();
  uint64_t v12 = v11 - v10;
  uint64_t v35 = type metadata accessor for UsoEntitySpan(0LL);
  uint64_t v13 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  sub_7BFC();
  uint64_t v16 = v15 - v14;
  sub_5E00(&qword_103F8);
  sub_7C0C();
  __chkstk_darwin(v17);
  sub_7BFC();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_5E00(&qword_10400);
  uint64_t v22 = swift_allocObject(v21, 40LL, 7LL);
  *(_OWORD *)(v22 + 16) = xmmword_A880;
  *(void *)(v22 + 3sub_64D4(v0 + 2) = v2;
  uint64_t v38 = v22;
  specialized Array._endMutation()();
  swift_retain(v2);
  UsoBuilderOptions.init(longhandDefinedValues:)(1LL);
  uint64_t v23 = type metadata accessor for UsoBuilderOptions(0LL);
  sub_625C(v20, 0LL, 1LL, v23);
  uint64_t v24 = static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)(v38, v20);
  swift_bridgeObjectRelease(v38);
  sub_7BBC(v20);
  if (a2)
  {
    uint64_t v25 = type metadata accessor for UsoEntitySpan.SpanSource(0LL);
    sub_7C44(v12, v26, v27, v25);
    uint64_t matched = type metadata accessor for MatchInfo(0LL);
    sub_7C44(v8, v29, v30, matched);
    uint64_t v31 = sub_5E00(&qword_10408);
    uint64_t v32 = *(void *)(type metadata accessor for SpanProperty(0LL) - 8);
    uint64_t v33 = swift_allocObject( v31,  ((*(unsigned __int8 *)(v32 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))
          + *(void *)(v32 + 72),
            *(unsigned __int8 *)(v32 + 80) | 7LL);
    *(_OWORD *)(v33 + 16) = xmmword_A7B0;
    swift_bridgeObjectRetain(a2);
    sub_7C38();
    sub_7C38();
    SpanProperty.init(key:valueString:valueInt:valueFloat:)(0x75676E616C736D73LL, 0xEB00000000656761LL, a1, a2);
    sub_7C38();
    sub_7C38();
    uint64_t v34 = UsoEntitySpan.init(originAppId:sourceComponent:label:matchInfo:properties:startIndex:endIndex:alternatives:originEntityId:)( 0LL,  0LL,  v12,  0LL,  0LL,  v8,  v33);
    dispatch thunk of Graph.startNode.getter(v34);
    Node.addEntitySpan(entitySpan:)(v16);
    sub_7C2C(v37);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v35);
  }

  static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)(v24, 0LL);
  swift_release(v24);
  sub_65F8();
}

uint64_t sub_7BBC(uint64_t a1)
{
  uint64_t v2 = sub_5E00(&qword_103F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_7C2C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

void sub_7C38()
{
  *(_BYTE *)(v1 - 88) = v0;
}

uint64_t sub_7C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_625C(a1, 1LL, 1LL, a4);
}

BOOL sub_7C50(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for GuardAndExecuteFlow.State(0LL);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v44 = (char *)&v38 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = sub_9E1C();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10280 != -1) {
    swift_once(&qword_10280, sub_3DFC);
  }
  uint64_t v16 = sub_652C();
  uint64_t v17 = sub_3EF4(v16, (uint64_t)qword_10680);
  uint64_t v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v18 = v43(v15, a1, v12);
  uint64_t v42 = v17;
  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.info.getter();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v45 = a1;
  if (v21)
  {
    uint64_t v22 = sub_6500(12LL);
    uint64_t v41 = v7;
    uint64_t v23 = (uint8_t *)v22;
    uint64_t v24 = sub_6500(32LL);
    v48[0] = v24;
    uint64_t v40 = v2;
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v39 = v23 + 4;
    uint64_t v25 = sub_9494( &qword_105D8,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
    uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter(v12, v25);
    unint64_t v28 = v27;
    uint64_t v46 = sub_95F0(v26, v27, v48);
    uint64_t v2 = v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v39, v23 + 12);
    swift_bridgeObjectRelease(v28);
    sub_9E34();
    _os_log_impl(&dword_0, v19, v20, "#GuardAndExecuteFlow received input %s", v23, 0xCu);
    swift_arrayDestroy(v24, 1LL, (char *)&type metadata for Any + 8);
    sub_64F4(v24);
    uint64_t v29 = (uint64_t)v23;
    uint64_t v7 = v41;
    sub_64F4(v29);
  }

  else
  {
    sub_9E34();
  }

  uint64_t v30 = v2 + OBJC_IVAR____TtC22MessagesTVOSFlowPlugin19GuardAndExecuteFlow_state;
  sub_9E54(v2 + OBJC_IVAR____TtC22MessagesTVOSFlowPlugin19GuardAndExecuteFlow_state, (uint64_t)v48, 0LL);
  sub_9414(v30, (uint64_t)v11);
  int v31 = sub_5E40((uint64_t)v11, 3LL, v12);
  uint64_t v32 = sub_9458((uint64_t)v11);
  if (v31 == 1)
  {
    uint64_t v33 = (uint64_t)v44;
    v43(v44, v45, v12);
    sub_625C(v33, 0LL, 3LL, v12);
    sub_9D94(v33, (uint64_t)v7);
    sub_9E54(v30, (uint64_t)&v46, 33LL);
    sub_95AC((uint64_t)v7, v30);
    swift_endAccess(&v46);
  }

  else
  {
    uint64_t v34 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v35 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)sub_6500(2LL);
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl( &dword_0,  v34,  v35,  "#GuardAndExecuteFlow received an input in a non-started state, ignoring",  v36,  2u);
      sub_64F4((uint64_t)v36);
    }
  }

  return v31 == 1;
}

uint64_t sub_7FC8(uint64_t a1)
{
  v2[13] = a1;
  v2[14] = v1;
  uint64_t v3 = type metadata accessor for FlowUnhandledReason(0LL);
  v2[15] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[16] = v4;
  v2[17] = sub_9DD8(v4);
  uint64_t v5 = type metadata accessor for ExecuteOnRemoteDeviceSpecification(0LL);
  v2[18] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[19] = v6;
  v2[20] = sub_9DD8(v6);
  uint64_t v7 = sub_5E00(&qword_10598);
  v2[21] = sub_9DD8(*(void *)(v7 - 8));
  uint64_t v8 = type metadata accessor for UserIdentityCheckFlowStrategy(0LL);
  v2[22] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[23] = v9;
  v2[24] = sub_9DD8(v9);
  uint64_t v10 = type metadata accessor for UserIdentityCheckFlowStrategy.HandoffConfiguration(0LL);
  v2[25] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[26] = v11;
  v2[27] = sub_9DD8(v11);
  uint64_t v12 = type metadata accessor for CompanionDeviceInfoRequirement(0LL);
  v2[28] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[29] = v13;
  v2[30] = sub_9DD8(v13);
  uint64_t v14 = sub_9E1C();
  v2[31] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v2[32] = v15;
  unint64_t v16 = (*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[33] = swift_task_alloc(v16);
  v2[34] = swift_task_alloc(v16);
  uint64_t v17 = type metadata accessor for GuardAndExecuteFlow.State(0LL);
  v2[35] = sub_9DD8(*(void *)(v17 - 8));
  return swift_task_switch(sub_80EC, 0LL, 0LL);
}

void sub_80EC()
{
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[31];
  uint64_t v3 = v0[14] + OBJC_IVAR____TtC22MessagesTVOSFlowPlugin19GuardAndExecuteFlow_state;
  sub_9E54(v3, (uint64_t)(v0 + 7), 0LL);
  sub_9414(v3, v1);
  uint64_t v4 = (char *)sub_8170 + 4 * word_A8A0[sub_5E40(v1, 3LL, v2)];
  __asm { BR              X10 }

uint64_t sub_8170()
{
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v37 = *(void *)(v0 + 264);
  uint64_t v4 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v5 = *(void *)(v0 + 224);
  uint64_t v6 = *(void *)(v0 + 232);
  uint64_t v7 = *(void *)(v0 + 208);
  uint64_t v43 = *(void *)(v0 + 216);
  uint64_t v44 = *(void *)(v0 + 272);
  uint64_t v40 = *(void *)(v0 + 184);
  uint64_t v8 = *(void *)(v0 + 168);
  uint64_t v41 = *(void *)(v0 + 176);
  uint64_t v42 = *(void *)(v0 + 200);
  uint64_t v32 = *(void *)(v0 + 192);
  uint64_t v33 = *(void *)(v0 + 152);
  uint64_t v34 = *(void *)(v0 + 160);
  uint64_t v35 = *(void *)(v0 + 144);
  uint64_t v36 = *(void *)(v0 + 112);
  uint64_t v38 = v3;
  uint64_t v39 = v2;
  (*(void (**)(void))(v2 + 32))();
  ((void (*)(void))type metadata accessor for CompanionCompatibilityCheckFlowStrategy)(0LL);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))( v4,  enum case for CompanionDeviceInfoRequirement.supportsPeerToPeerHandoff(_:),  v5);
  uint64_t v9 = ((uint64_t (*)(uint64_t, uint64_t))static CompanionCompatibilityCheckFlowStrategy.require(_:redirectToServerOnFailure:))( v4,  1LL);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  uint64_t v10 = type metadata accessor for MessagesHandoffSessionToCompanionFlowStrategy();
  uint64_t v11 = swift_allocObject(v10, 16LL, 7LL);
  *(void *)(v1 - 88) = v10;
  *(void *)(v1 - 80) = sub_9494( &qword_105A0,  (uint64_t (*)(uint64_t))type metadata accessor for MessagesHandoffSessionToCompanionFlowStrategy,  (uint64_t)&unk_A980);
  *(void *)(v1 - 11sub_64D4(v0 + 2) = v11;
  uint64_t v12 = swift_retain(v9);
  ((void (*)(uint64_t, uint64_t))UserIdentityCheckFlowStrategy.HandoffConfiguration.init(companionCompatiblityCheck:handoffStrategy:))( v12,  v1 - 112);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, v43, v42);
  sub_625C(v8, 0LL, 1LL, v42);
  ((void (*)(void, uint64_t, uint64_t, uint64_t))UserIdentityCheckFlowStrategy.init(allowsAnonymousUser:allowsUserInteraction:handoffConfiguration:requireSpeechProfile:))( 0LL,  1LL,  v8,  1LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v37, v44, v3);
  (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))( v34,  enum case for ExecuteOnRemoteDeviceSpecification.userCompanion(_:),  v35);
  sub_630C(v36 + 16, v0 + 16);
  uint64_t v13 = ((uint64_t (*)(void))type metadata accessor for ExecuteOnRemoteFlow)(0LL);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  uint64_t v14 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))ExecuteOnRemoteFlow.init(inputToExecute:device:outputPublisher:))( v37,  v34,  v0 + 16);
  *(void *)(v0 + 80) = v14;
  uint64_t v15 = sub_5E00(&qword_105A8);
  uint64_t v16 = *(void *)(((uint64_t (*)(void))type metadata accessor for CommonFlowGuard)(0LL) - 8);
  uint64_t v17 = swift_allocObject( v15,  ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))
        + 3LL * *(void *)(v16 + 72),
          *(unsigned __int8 *)(v16 + 80) | 7LL);
  *(_OWORD *)(v17 + 16) = xmmword_A890;
  ((void (*)(void))static CommonFlowGuard.ensuringPersonalRequestsAreEnabledWhenApplicable.getter)();
  ((void (*)(uint64_t))static CommonFlowGuard.ensuringUserIdentity(using:))(v32);
  ((void (*)(uint64_t))static CommonFlowGuard.ensuringUserHasSupportedCompanion(using:))(v9);
  uint64_t v18 = ((uint64_t (*)(uint64_t))static CommonGuardFlowUtils.makeGuardFlow(withGuards:))(v17);
  swift_bridgeObjectRelease(v17);
  *(void *)(v0 + 88) = v18;
  uint64_t v19 = ((uint64_t (*)(void))type metadata accessor for GuardFlow)(0LL);
  uint64_t v20 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, void *))Flow.guarded<A>(by:))( v0 + 88,  v13,  v19,  &protocol witness table for ExecuteOnRemoteFlow,  &protocol witness table for GuardFlow);
  swift_release(v14);
  swift_release(v18);
  *(void *)(v0 + 96) = v20;
  swift_retain(v36);
  uint64_t v21 = sub_5E00(&qword_105B0);
  unint64_t v22 = sub_94DC();
  ((void (*)(uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, unint64_t))static ExecuteResponse.ongoing<A>(next:childCompletion:))( v0 + 96,  sub_94D4,  v36,  v21,  v22);
  swift_release(v9);
  swift_release(v36);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v32, v41);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v43, v42);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v44, v38);
  swift_release(v20);
  uint64_t v23 = *(void *)(v0 + 272);
  uint64_t v24 = *(void *)(v0 + 264);
  uint64_t v25 = *(void *)(v0 + 240);
  uint64_t v26 = *(void *)(v0 + 216);
  uint64_t v27 = *(void *)(v0 + 192);
  uint64_t v29 = *(void *)(v0 + 160);
  uint64_t v28 = *(void *)(v0 + 168);
  uint64_t v30 = *(void *)(v0 + 136);
  swift_task_dealloc(*(void *)(v0 + 280));
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_869C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExecuteOnRemoteFlowResult(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v47 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v47 - v12;
  uint64_t v14 = type metadata accessor for GuardAndExecuteFlow.State(0LL);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_5E00(&qword_105C0);
  __chkstk_darwin(v17);
  uint64_t v19 = (id *)((char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_9564(a1, (uint64_t)v19);
  uint64_t v20 = sub_5E00(&qword_105C8);
  if (sub_5E40((uint64_t)v19, 1LL, v20) == 1)
  {
    if (qword_10280 != -1) {
      swift_once(&qword_10280, sub_3DFC);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    uint64_t v22 = sub_3EF4(v21, (uint64_t)qword_10680);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v23, v24)) {
      goto LABEL_12;
    }
    uint64_t v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_0, v23, v24, "#GuardAndExecuteFlow guard flows did not pass", v25, 2u);
    uint64_t v26 = v25;
LABEL_11:
    swift_slowDealloc(v26, -1LL, -1LL);
LABEL_12:

    uint64_t v31 = type metadata accessor for Input(0LL);
    sub_625C((uint64_t)v16, 3LL, 3LL, v31);
    uint64_t v32 = a2 + OBJC_IVAR____TtC22MessagesTVOSFlowPlugin19GuardAndExecuteFlow_state;
    goto LABEL_19;
  }

  if ((*(unsigned int (**)(id *, uint64_t))(v5 + 88))(v19, v4) == enum case for ExecuteOnRemoteFlowResult.success(_:))
  {
    (*(void (**)(id *, uint64_t))(v5 + 96))(v19, v4);

    if (qword_10280 != -1) {
      swift_once(&qword_10280, sub_3DFC);
    }
    uint64_t v27 = type metadata accessor for Logger(0LL);
    uint64_t v28 = sub_3EF4(v27, (uint64_t)qword_10680);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v29 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v23, v29)) {
      goto LABEL_12;
    }
    uint64_t v30 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_0, v23, v29, "#GuardAndExecuteFlow request executed successfully", v30, 2u);
    uint64_t v26 = v30;
    goto LABEL_11;
  }

  uint64_t v50 = a2;
  (*(void (**)(char *, id *, uint64_t))(v5 + 32))(v13, v19, v4);
  if (qword_10280 != -1) {
    swift_once(&qword_10280, sub_3DFC);
  }
  uint64_t v33 = type metadata accessor for Logger(0LL);
  sub_3EF4(v33, (uint64_t)qword_10680);
  uint64_t v34 = *(uint64_t (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v35 = v34(v11, v13, v4);
  uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
  os_log_type_t v37 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v49 = swift_slowAlloc(32LL, -1LL);
    v52[0] = v49;
    uint64_t v48 = v38;
    *(_DWORD *)uint64_t v38 = 136315138;
    uint64_t v47 = v38 + 4;
    v34(v8, v11, v4);
    uint64_t v39 = String.init<A>(reflecting:)(v8, v4);
    unint64_t v41 = v40;
    uint64_t v51 = sub_95F0(v39, v40, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, v52, v47, v38 + 12);
    swift_bridgeObjectRelease(v41);
    uint64_t v42 = *(void (**)(char *, uint64_t))(v5 + 8);
    v42(v11, v4);
    uint64_t v43 = v48;
    _os_log_impl( &dword_0,  v36,  v37,  "#GuardAndExecuteFlow request failed to execute on remote device with error %s",  v48,  0xCu);
    uint64_t v44 = v49;
    swift_arrayDestroy(v49, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v44, -1LL, -1LL);
    swift_slowDealloc(v43, -1LL, -1LL);
  }

  else
  {

    uint64_t v42 = *(void (**)(char *, uint64_t))(v5 + 8);
    v42(v11, v4);
  }

  v42(v13, v4);
  uint64_t v45 = type metadata accessor for Input(0LL);
  sub_625C((uint64_t)v16, 2LL, 3LL, v45);
  uint64_t v32 = v50 + OBJC_IVAR____TtC22MessagesTVOSFlowPlugin19GuardAndExecuteFlow_state;
LABEL_19:
  swift_beginAccess(v32, v52, 33LL, 0LL);
  sub_95AC((uint64_t)v16, v32);
  return swift_endAccess(v52);
}

void sub_8BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GuardAndExecuteFlow(0LL);
  uint64_t v5 = sub_9494(&qword_103C8, type metadata accessor for GuardAndExecuteFlow, (uint64_t)&unk_A8E8);
  Flow.deferToExecuteAsync(_:)(a1, a2, v4, v5);
  sub_9E44();
}

uint64_t sub_8C18()
{
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48LL), *(unsigned __int16 *)(*v0 + 52LL));
}

uint64_t sub_8C50()
{
  return type metadata accessor for GuardAndExecuteFlow(0LL);
}

uint64_t type metadata accessor for GuardAndExecuteFlow(uint64_t a1)
{
  return sub_8CF8(a1, (uint64_t *)&unk_10440, (uint64_t)&nominal type descriptor for GuardAndExecuteFlow);
}

uint64_t sub_8C6C(uint64_t a1)
{
  v4[0] = "(";
  uint64_t result = type metadata accessor for GuardAndExecuteFlow.State(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for GuardAndExecuteFlow.State(uint64_t a1)
{
  return sub_8CF8(a1, qword_10578, (uint64_t)&nominal type descriptor for GuardAndExecuteFlow.State);
}

uint64_t sub_8CF8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t *sub_8D28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain(v8);
  }

  else
  {
    uint64_t v7 = type metadata accessor for Input(0LL);
    if (sub_5E40((uint64_t)a2, 3LL, v7))
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      sub_625C((uint64_t)a1, 0LL, 3LL, v7);
    }
  }

  return a1;
}

uint64_t sub_8DE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Input(0LL);
  uint64_t result = sub_5E40(a1, 3LL, v2);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  }
  return result;
}

void *sub_8E38(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  if (sub_5E40((uint64_t)a2, 3LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    sub_625C((uint64_t)a1, 0LL, 3LL, v6);
  }

  return a1;
}

void *sub_8ECC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  int v7 = sub_5E40((uint64_t)a1, 3LL, v6);
  int v8 = sub_5E40((uint64_t)a2, 3LL, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 24))(a1, a2, v6);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }

  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  sub_625C((uint64_t)a1, 0LL, 3LL, v6);
  return a1;
}

void *sub_8FB0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  if (sub_5E40((uint64_t)a2, 3LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    sub_625C((uint64_t)a1, 0LL, 3LL, v6);
  }

  return a1;
}

void *sub_9044(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Input(0LL);
  int v7 = sub_5E40((uint64_t)a1, 3LL, v6);
  int v8 = sub_5E40((uint64_t)a2, 3LL, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(a1, a2, v6);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }

  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  sub_625C((uint64_t)a1, 0LL, 3LL, v6);
  return a1;
}

uint64_t sub_9128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_9134);
}

uint64_t sub_9134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9E1C();
  unsigned int v5 = sub_5E40(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_9174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_9180);
}

uint64_t sub_9180(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = sub_9E1C();
  return sub_625C(a1, v5, a3, v6);
}

uint64_t sub_91C8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Input(0LL);
  return sub_5E40(a1, 3LL, v2);
}

uint64_t sub_91FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Input(0LL);
  return sub_625C(a1, a2, 3LL, v4);
}

uint64_t sub_9234(uint64_t a1)
{
  uint64_t result = type metadata accessor for Input(319LL);
  if (v3 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload(a1, 256LL, *(void *)(result - 8) + 64LL, 3LL);
    return 0LL;
  }

  return result;
}

BOOL sub_9288(uint64_t a1)
{
  return sub_7C50(a1);
}

uint64_t sub_92AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v7 = (void *)swift_task_alloc(async function pointer to Flow.onAsync(input:)[1]);
  *(void *)(v3 + 16) = v7;
  *int v7 = v3;
  v7[1] = sub_9314;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_9314(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

void sub_9348(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_9368(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_10454);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_93BC;
  return sub_7FC8(a1);
}

uint64_t sub_93BC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_93E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for GuardAndExecuteFlow(0LL);
  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_9414(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GuardAndExecuteFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_9458(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GuardAndExecuteFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_9494(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_94D4(uint64_t a1)
{
  return sub_869C(a1, v1);
}

unint64_t sub_94DC()
{
  unint64_t result = qword_105B8;
  if (!qword_105B8)
  {
    uint64_t v1 = sub_9520(&qword_105B0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ConditionalFlow<A>, v1);
    atomic_store(result, (unint64_t *)&qword_105B8);
  }

  return result;
}

uint64_t sub_9520(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_9564(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5E00(&qword_105C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_95AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GuardAndExecuteFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_95F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_96C0(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    int v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_9D58((uint64_t)v12, *a3);
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
      sub_9D58((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_64D4(v12);
  return v7;
}

void *sub_96C0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_9814((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_98D8(a5, a6);
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

void *sub_9814(char *__src, size_t __n, char *__dst)
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

void *sub_98D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_996C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_9B40(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_9B40((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 3sub_64D4(v0 + 2) = 0;
  return v2;
}

void *sub_996C(uint64_t a1, unint64_t a2)
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
  uint64_t v5 = sub_9ADC(v4, 0LL);
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

void *sub_9ADC(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_5E00(&qword_105D0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  __int128 v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_9B40(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_5E00(&qword_105D0);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + sub_64D4(v0 + 2) = v8;
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
    sub_9CD8(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_9C14(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_9C14(char *__src, size_t __n, char *__dst)
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

char *sub_9CD8(char *__src, size_t __len, char *__dst)
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

uint64_t sub_9D58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_9D94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GuardAndExecuteFlow.State(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_9DD8@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_9DE8()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

void sub_9E08(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_9E1C()
{
  return type metadata accessor for Input(0LL);
}

BOOL sub_9E24(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_9E34()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

  ;
}

uint64_t sub_9E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

uint64_t sub_9E5C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for MessagesHandoffSessionToCompanionFlowStrategy()
{
  return objc_opt_self(&OBJC_CLASS____TtC22MessagesTVOSFlowPlugin45MessagesHandoffSessionToCompanionFlowStrategy);
}

uint64_t sub_9E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v7 = (void *)swift_task_alloc(async function pointer to HandoffSessionToCompanionFlowStrategyAsync.makeHandoffResponse()[1]);
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = sub_9EF8;
  return HandoffSessionToCompanionFlowStrategyAsync.makeHandoffResponse()(a1, a2, a3);
}

uint64_t sub_9EF8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}