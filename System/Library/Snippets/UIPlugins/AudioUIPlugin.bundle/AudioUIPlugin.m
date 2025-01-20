uint64_t SiriAudioSnippets.snippetHidden(for:idiom:)()
{
  return 0LL;
}

uint64_t SiriAudioSnippets.snippet.getter()
{
  uint64_t v142 = type metadata accessor for SiriAudioAlternativeSnippet(0LL);
  uint64_t v0 = __chkstk_darwin(v142);
  v138 = (uint64_t *)((char *)&v129 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v0);
  uint64_t v140 = (uint64_t)&v129 - v2;
  uint64_t v141 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
  uint64_t v139 = *(void *)(v141 - 8);
  uint64_t v3 = __chkstk_darwin(v141);
  v136 = (char *)&v129 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  v137 = (char *)&v129 - v5;
  uint64_t v135 = type metadata accessor for SiriAudioSimpleTextSnippet(0LL);
  __chkstk_darwin(v135);
  v133 = (char *)&v129 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v134 = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
  uint64_t v132 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  v131 = (char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v147 = type metadata accessor for SiriAudioDisambiguationSnippet(0LL);
  __chkstk_darwin(v147);
  v145 = (char *)&v129 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v146 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  uint64_t v144 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  v143 = (char *)&v129 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v152 = type metadata accessor for SiriAudioActionButtonSnippet(0LL);
  __chkstk_darwin(v152);
  v150 = (char *)&v129 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v151 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  uint64_t v149 = *(void *)(v151 - 8);
  __chkstk_darwin(v151);
  v148 = (char *)&v129 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v153 = type metadata accessor for ConfirmationSnippet(0LL);
  __chkstk_darwin(v153);
  v13 = (char *)&v129 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for Logger(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v155 = v14;
  uint64_t v156 = v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v130 = (char *)&v129 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v16);
  v129 = (char *)&v129 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  v22 = (char *)&v129 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  v25 = (char *)&v129 - v24;
  __chkstk_darwin(v23);
  v27 = (char *)&v129 - v26;
  uint64_t v28 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  v31 = (char *)&v129 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = type metadata accessor for SiriAudioSnippets(0LL);
  uint64_t v33 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  v35 = (char *)&v129 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v35, v154, v32);
  int v36 = (*(uint64_t (**)(char *, uint64_t))(v33 + 88))(v35, v32);
  if (v36 == enum case for SiriAudioSnippets.confirmation(_:))
  {
    (*(void (**)(char *, uint64_t))(v33 + 96))(v35, v32);
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v31, v35, v28);
    if (qword_14140 != -1) {
      swift_once(&qword_14140, sub_D2D8);
    }
    uint64_t v37 = v155;
    uint64_t v38 = sub_568C(v155, (uint64_t)qword_14D58);
    uint64_t v39 = v156;
    uint64_t v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v156 + 16))(v27, v38, v37);
    v41 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_0, v41, v42, "SiriAudioSnippets#snippet create ConfirmationSnippet", v43, 2u);
      swift_slowDealloc(v43, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v37);
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v13, v31, v28);
    uint64_t v44 = v153;
    v45 = &v13[*(int *)(v153 + 20)];
    uint64_t v46 = type metadata accessor for Context(0LL);
    uint64_t v47 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    *(void *)v45 = EnvironmentObject.init()(v46, v47);
    *((void *)v45 + 1) = v48;
    uint64_t v49 = sub_5738( &qword_14178,  type metadata accessor for ConfirmationSnippet,  (uint64_t)&protocol conformance descriptor for ConfirmationSnippet);
    uint64_t v50 = View.eraseToAnyView()(v44, v49);
    sub_5778((uint64_t)v13, type metadata accessor for ConfirmationSnippet);
    v51 = *(void (**)(char *, uint64_t))(v29 + 8);
    v52 = v31;
    goto LABEL_7;
  }

  if (v36 == enum case for SiriAudioSnippets.actionButton(_:))
  {
    (*(void (**)(char *, uint64_t))(v33 + 96))(v35, v32);
    v55 = v148;
    uint64_t v54 = v149;
    uint64_t v56 = v151;
    (*(void (**)(char *, char *, uint64_t))(v149 + 32))(v148, v35, v151);
    if (qword_14140 != -1) {
      swift_once(&qword_14140, sub_D2D8);
    }
    uint64_t v57 = v155;
    uint64_t v58 = sub_568C(v155, (uint64_t)qword_14D58);
    uint64_t v59 = v156;
    uint64_t v60 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v156 + 16))(v25, v58, v57);
    v61 = (os_log_s *)Logger.logObject.getter(v60);
    os_log_type_t v62 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_0, v61, v62, "SiriAudioSnippets#snippet create SiriAudioActionButtonSnippet", v63, 2u);
      swift_slowDealloc(v63, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v59 + 8))(v25, v57);
    uint64_t v64 = (uint64_t)v150;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v150, v55, v56);
    uint64_t v65 = v152;
    v66 = (void *)(v64 + *(int *)(v152 + 20));
    uint64_t v67 = type metadata accessor for Context(0LL);
    uint64_t v68 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    void *v66 = EnvironmentObject.init()(v67, v68);
    v66[1] = v69;
    uint64_t v70 = sub_5738( &qword_14170,  type metadata accessor for SiriAudioActionButtonSnippet,  (uint64_t)&protocol conformance descriptor for SiriAudioActionButtonSnippet);
    uint64_t v50 = View.eraseToAnyView()(v65, v70);
    sub_5778(v64, type metadata accessor for SiriAudioActionButtonSnippet);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v56);
    return v50;
  }

  if (v36 == enum case for SiriAudioSnippets.disambiguation(_:))
  {
    (*(void (**)(char *, uint64_t))(v33 + 96))(v35, v32);
    v72 = v143;
    uint64_t v71 = v144;
    uint64_t v73 = v146;
    (*(void (**)(char *, char *, uint64_t))(v144 + 32))(v143, v35, v146);
    if (qword_14140 != -1) {
      swift_once(&qword_14140, sub_D2D8);
    }
    uint64_t v74 = v155;
    uint64_t v75 = sub_568C(v155, (uint64_t)qword_14D58);
    uint64_t v76 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v156 + 16))(v22, v75, v74);
    v77 = (os_log_s *)Logger.logObject.getter(v76);
    os_log_type_t v78 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v77, v78))
    {
      v79 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v79 = 0;
      _os_log_impl(&dword_0, v77, v78, "SiriAudioSnippets#snippet create SiriAudioDisambiguationSnippet", v79, 2u);
      swift_slowDealloc(v79, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v156 + 8))(v22, v74);
    uint64_t v80 = (uint64_t)v145;
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v145, v72, v73);
    uint64_t v81 = v147;
    v82 = (void *)(v80 + *(int *)(v147 + 20));
    uint64_t v83 = type metadata accessor for Context(0LL);
    uint64_t v84 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    void *v82 = EnvironmentObject.init()(v83, v84);
    v82[1] = v85;
    uint64_t v86 = sub_5738(&qword_14168, type metadata accessor for SiriAudioDisambiguationSnippet, (uint64_t)&unk_EBA8);
    uint64_t v50 = View.eraseToAnyView()(v81, v86);
    sub_5778(v80, type metadata accessor for SiriAudioDisambiguationSnippet);
    v51 = *(void (**)(char *, uint64_t))(v71 + 8);
    v52 = v72;
    uint64_t v53 = v73;
    goto LABEL_20;
  }

  uint64_t v88 = v156;
  if (v36 == enum case for SiriAudioSnippets.simpleText(_:))
  {
    (*(void (**)(char *, uint64_t))(v33 + 96))(v35, v32);
    uint64_t v89 = v132;
    v90 = v131;
    uint64_t v28 = v134;
    (*(void (**)(char *, char *, uint64_t))(v132 + 32))(v131, v35, v134);
    if (qword_14140 != -1) {
      swift_once(&qword_14140, sub_D2D8);
    }
    uint64_t v91 = v155;
    uint64_t v92 = sub_568C(v155, (uint64_t)qword_14D58);
    v93 = v129;
    uint64_t v94 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v88 + 16))(v129, v92, v91);
    v95 = (os_log_s *)Logger.logObject.getter(v94);
    os_log_type_t v96 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v95, v96))
    {
      v97 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v97 = 0;
      _os_log_impl(&dword_0, v95, v96, "SiriAudioSnippets#snippet create Section Header standard view", v97, 2u);
      swift_slowDealloc(v97, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v88 + 8))(v93, v91);
    v98 = v133;
    (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v133, v90, v28);
    uint64_t v99 = v135;
    v100 = &v98[*(int *)(v135 + 20)];
    uint64_t v101 = type metadata accessor for Context(0LL);
    uint64_t v102 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    *(void *)v100 = EnvironmentObject.init()(v101, v102);
    *((void *)v100 + 1) = v103;
    v104 = type metadata accessor for SiriAudioSimpleTextSnippet;
    uint64_t v105 = sub_5738(&qword_14160, type metadata accessor for SiriAudioSimpleTextSnippet, (uint64_t)&unk_F048);
    uint64_t v50 = View.eraseToAnyView()(v99, v105);
    uint64_t v106 = (uint64_t)v98;
LABEL_34:
    sub_5778(v106, v104);
    v51 = *(void (**)(char *, uint64_t))(v89 + 8);
    v52 = v90;
LABEL_7:
    uint64_t v53 = v28;
LABEL_20:
    v51(v52, v53);
    return v50;
  }

  if (v36 == enum case for SiriAudioSnippets.alternatives(_:))
  {
    (*(void (**)(char *, uint64_t))(v33 + 96))(v35, v32);
    uint64_t v89 = v139;
    v107 = *(void (**)(char *, char *, uint64_t))(v139 + 32);
    v90 = v137;
    uint64_t v28 = v141;
    v107(v137, v35, v141);
    if (qword_14140 != -1) {
      swift_once(&qword_14140, sub_D2D8);
    }
    uint64_t v108 = v155;
    uint64_t v109 = sub_568C(v155, (uint64_t)qword_14D58);
    v110 = v130;
    uint64_t v111 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v88 + 16))(v130, v109, v108);
    v112 = (os_log_s *)Logger.logObject.getter(v111);
    os_log_type_t v113 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v112, v113))
    {
      v114 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v114 = 0;
      _os_log_impl(&dword_0, v112, v113, "SiriAudioSnippets#snippet create Alternative Snippet", v114, 2u);
      swift_slowDealloc(v114, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v88 + 8))(v110, v155);
    v115 = v136;
    (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v136, v90, v28);
    uint64_t v116 = type metadata accessor for Context(0LL);
    uint64_t v117 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    uint64_t v118 = EnvironmentObject.init()(v116, v117);
    v119 = v138;
    uint64_t *v138 = v118;
    v119[1] = v120;
    uint64_t v121 = v142;
    v122 = (uint64_t *)((char *)v119 + *(int *)(v142 + 20));
    void *v122 = swift_getKeyPath(&unk_EB00);
    uint64_t v123 = sub_56A4(&qword_14150);
    swift_storeEnumTagMultiPayload(v122, v123, 0LL);
    v124 = (char *)v119 + *(int *)(v121 + 24);
    char v157 = 0;
    State.init(wrappedValue:)(v158, &v157, &type metadata for Bool);
    uint64_t v125 = v158[1];
    char *v124 = v158[0];
    *((void *)v124 + 1) = v125;
    v107((char *)v119 + *(int *)(v121 + 28), v115, v28);
    uint64_t v126 = (uint64_t)v119;
    uint64_t v127 = v140;
    sub_56E4(v126, v140);
    v104 = type metadata accessor for SiriAudioAlternativeSnippet;
    uint64_t v128 = sub_5738(&qword_14158, type metadata accessor for SiriAudioAlternativeSnippet, (uint64_t)&unk_ECF8);
    uint64_t v50 = View.eraseToAnyView()(v121, v128);
    uint64_t v106 = v127;
    goto LABEL_34;
  }

  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v32, v32);
  __break(1u);
  return result;
}

uint64_t sub_55A8()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_55C8(uint64_t a1)
{
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t _s13AudioUIPlugin19ConfirmationSnippetV8_context33_771F22E388A5AC0FA382258073F3D643LL7SwiftUI17EnvironmentObjectVy0dN07ContextCGvpfi_0()
{
  uint64_t v0 = type metadata accessor for Context(0LL);
  uint64_t v1 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  return EnvironmentObject.init()(v0, v1);
}

uint64_t sub_568C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_56A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_56E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioAlternativeSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_5728(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_5738(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_5778(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t *sub_57B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v12 = *(void **)v10;
    uint64_t v11 = *((void *)v10 + 1);
    *uint64_t v9 = v12;
    v9[1] = v11;
    id v13 = v12;
  }

  return a1;
}

void sub_5848(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
}

uint64_t sub_588C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v11 = *(void **)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  id v12 = v11;
  return a1;
}

uint64_t sub_58F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)v9;
  *uint64_t v8 = *(void *)v9;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  return a1;
}

uint64_t sub_596C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_59C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  return a1;
}

uint64_t sub_5A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5A48);
}

uint64_t sub_5A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  int v10 = v9 - 1;
  if (v10 < 0) {
    int v10 = -1;
  }
  return (v10 + 1);
}

uint64_t sub_5AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5ADC);
}

uint64_t sub_5ADC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for SiriAudioDisambiguationSnippet(uint64_t a1)
{
  uint64_t result = qword_141F8;
  if (!qword_141F8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriAudioDisambiguationSnippet);
  }
  return result;
}

uint64_t sub_5B90(uint64_t a1)
{
  uint64_t result = type metadata accessor for SiriAudioDisambiguationSnippetModel(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_EB90;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_5C00(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_F360, 1LL);
}

void sub_5C10()
{
  qword_14180 = 0x401C000000000000LL;
}

void sub_5C20()
{
  qword_14188 = 0x401C000000000000LL;
}

void sub_5C30()
{
  qword_14190 = 0x64496D657469LL;
  *(void *)algn_14198 = 0xE600000000000000LL;
}

uint64_t sub_5C50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAudioDisambiguationSnippet(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  int v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_7068(a1, (uint64_t)v5);
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = v7 + v4;
  uint64_t v9 = v6 | 7;
  uint64_t v10 = swift_allocObject(&unk_10A28, v8, v6 | 7);
  sub_70B0((uint64_t)v5, v10 + v7);
  sub_7068(a1, (uint64_t)v5);
  uint64_t v11 = swift_allocObject(&unk_10A50, v8, v9);
  sub_70B0((uint64_t)v5, v11 + v7);
  uint64_t v12 = type metadata accessor for PrimaryHeaderRichView(0LL);
  uint64_t v13 = sub_56A4(&qword_14240);
  uint64_t v14 = sub_5738( &qword_14248,  (uint64_t (*)(uint64_t))&type metadata accessor for PrimaryHeaderRichView,  (uint64_t)&protocol conformance descriptor for PrimaryHeaderRichView);
  unint64_t v15 = sub_71B0();
  return DisambiguationStandardView.init(header:content:)(sub_7148, v10, sub_7158, v11, v12, v13, v14, v15);
}

uint64_t sub_5DA8()
{
  v10[3] = &type metadata for String;
  v10[4] = &protocol witness table for String;
  v10[0] = SiriAudioDisambiguationSnippetModel.title.getter();
  v10[1] = v0;
  uint64_t v9 = 0LL;
  memset(v8, 0, sizeof(v8));
  uint64_t v7 = 0LL;
  memset(v6, 0, sizeof(v6));
  uint64_t v5 = 0LL;
  memset(v4, 0, sizeof(v4));
  uint64_t v3 = 0LL;
  memset(v2, 0, sizeof(v2));
  return PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)(v10, v8, v6, v4, v2, 0LL);
}

uint64_t sub_5E38(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAudioDisambiguationSnippet(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v19 = SiriAudioDisambiguationSnippetModel.items.getter(v5);
  sub_7068(a1, (uint64_t)&v18[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = swift_allocObject(&unk_10A78, v7 + v4, v6 | 7);
  sub_70B0((uint64_t)&v18[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL), v8 + v7);
  uint64_t v9 = sub_56A4(&qword_14260);
  uint64_t v10 = sub_56A4(&qword_14268);
  uint64_t v11 = sub_7674(&qword_14270, &qword_14260, (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v12 = type metadata accessor for SimpleItemRichView(255LL);
  uint64_t v13 = sub_5738( &qword_14258,  (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemRichView,  (uint64_t)&protocol conformance descriptor for SimpleItemRichView);
  v18[0] = v12;
  v18[1] = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v18,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
  uint64_t v15 = sub_5738( &qword_14278,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriAudioDisambiguationItemModel,  (uint64_t)&protocol conformance descriptor for SiriAudioDisambiguationItemModel);
  return ForEach<>.init(_:content:)( &v19,  sub_72DC,  v8,  v9,  &type metadata for String,  v10,  v11,  OpaqueTypeConformance2,  v15);
}

uint64_t sub_5FC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v55 = a3;
  uint64_t v4 = type metadata accessor for SiriAudioDisambiguationSnippet(0LL);
  uint64_t v53 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v43 = v5;
  v45 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = type metadata accessor for SiriAudioDisambiguationItemModel(0LL);
  uint64_t v6 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v48 = v7;
  v52 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_56A4(&qword_14280);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v42 = type metadata accessor for RFImage(0LL);
  uint64_t v11 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for SimpleItemRichView(0LL);
  uint64_t v50 = *(void *)(v14 - 8);
  uint64_t v51 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v49 = sub_56A4(&qword_14268);
  uint64_t v47 = *(void *)(v49 - 8);
  uint64_t v17 = __chkstk_darwin(v49);
  uint64_t v46 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = SiriAudioDisambiguationItemModel.title.getter(v17);
  v74[3] = &type metadata for String;
  v74[4] = &protocol witness table for String;
  v74[0] = v19;
  v74[1] = v20;
  uint64_t v73 = 0LL;
  memset(v72, 0, sizeof(v72));
  uint64_t v21 = SiriAudioDisambiguationItemModel.subtitle.getter();
  if (v22)
  {
    *((void *)&v70 + 1) = &type metadata for String;
    uint64_t v71 = &protocol witness table for String;
    *(void *)&__int128 v69 = v21;
    *((void *)&v69 + 1) = v22;
  }

  else
  {
    uint64_t v71 = 0LL;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
  }

  uint64_t v68 = 0LL;
  memset(v67, 0, sizeof(v67));
  uint64_t v66 = 0LL;
  memset(v65, 0, sizeof(v65));
  uint64_t v64 = 0LL;
  memset(v63, 0, sizeof(v63));
  uint64_t v62 = 0LL;
  memset(v61, 0, sizeof(v61));
  uint64_t v60 = 0LL;
  memset(v59, 0, sizeof(v59));
  uint64_t v23 = v54;
  uint64_t v24 = SiriAudioDisambiguationSnippetModel.isAppDisambiguation.getter();
  if ((v24 & 1) != 0)
  {
    uint64_t v25 = SiriAudioDisambiguationItemModel.id.getter(v24);
    uint64_t v27 = v26;
    static RFImage.appIcon(_:)(v25);
    uint64_t v28 = sub_6AFC((uint64_t)v13);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v42);
    swift_bridgeObjectRelease(v27);
  }

  else
  {
    SiriAudioDisambiguationItemModel.imageURL.getter();
    uint64_t v28 = sub_6940((uint64_t)v10);
    sub_7328((uint64_t)v10);
  }

  uint64_t v30 = v44;
  uint64_t v29 = (uint64_t)v45;
  uint64_t v31 = v43;
  if (v28)
  {
    *((void *)&v57 + 1) = &type metadata for AnyView;
    uint64_t v58 = &protocol witness table for AnyView;
    *(void *)&__int128 v56 = v28;
  }

  else
  {
    uint64_t v58 = 0LL;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
  }

  SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)( v74,  v72,  &v69,  v67,  v65,  v63,  v61,  v59,  &v56);
  uint64_t v32 = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v52, a1, v30);
  sub_7068(v23, v29);
  uint64_t v33 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v34 = (v33 + 16) & ~v33;
  uint64_t v35 = *(unsigned __int8 *)(v53 + 80);
  uint64_t v36 = (v48 + v35 + v34) & ~v35;
  uint64_t v37 = swift_allocObject(&unk_10AA0, v36 + v31, v33 | v35 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v37 + v34, v32, v30);
  sub_70B0(v29, v37 + v36);
  uint64_t v38 = sub_5738( &qword_14258,  (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemRichView,  (uint64_t)&protocol conformance descriptor for SimpleItemRichView);
  uint64_t v39 = v46;
  uint64_t v40 = v51;
  View.componentTapped(isNavigation:perform:)(0LL, sub_7430, v37, v51, v38);
  swift_release(v37);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v40);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v47 + 32))(v55, v39, v49);
}

uint64_t sub_63CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioDisambiguationItemModel(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v49 - v9;
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_14140 != -1) {
    swift_once(&qword_14140, sub_D2D8);
  }
  uint64_t v15 = sub_568C(v11, (uint64_t)qword_14D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  uint64_t v55 = v12;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, a1, v4);
  uint64_t v17 = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)(v8, a1, v4);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.default.getter();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc(22LL, -1LL);
    uint64_t v54 = a1;
    uint64_t v22 = v21;
    uint64_t v52 = swift_slowAlloc(64LL, -1LL);
    v57[0] = v52;
    *(_DWORD *)uint64_t v22 = 136315394;
    int v51 = v20;
    os_log_t v50 = v18;
    uint64_t v23 = ((uint64_t (*)(void))SiriAudioDisambiguationItemModel.id.getter)();
    unint64_t v25 = v24;
    uint64_t v56 = sub_AE68(v23, v24, v57);
    uint64_t v53 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v25);
    uint64_t v26 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    uint64_t v27 = v26(v10, v4);
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v28 = SiriAudioDisambiguationItemModel.title.getter(v27);
    unint64_t v30 = v29;
    uint64_t v56 = sub_AE68(v28, v29, v57);
    a2 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(v30);
    v26(v8, v4);
    os_log_t v31 = v50;
    _os_log_impl( &dword_0,  v50,  (os_log_type_t)v51,  "SiriAudioDisambiguationSnippet#body tapped on %s, itemTitle: %s",  (uint8_t *)v22,  0x16u);
    uint64_t v32 = v52;
    swift_arrayDestroy(v52, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  else
  {
    uint64_t v33 = *(void (**)(char *, uint64_t))(v5 + 8);
    v33(v10, v4);
    v33(v8, v4);
  }

  (*(void (**)(char *, uint64_t))(v55 + 8))(v14, v11);
  uint64_t v34 = a2 + *(int *)(type metadata accessor for SiriAudioDisambiguationSnippet(0LL) + 20);
  if (*(void *)v34)
  {
    id v35 = *(id *)v34;
    uint64_t v36 = SiriAudioDisambiguationSnippetModel.directInvocation.getter();
    uint64_t v38 = v37;
    uint64_t v39 = sub_56A4(&qword_14298);
    uint64_t inited = swift_initStackObject(v39, v58);
    *(_OWORD *)(inited + 16) = xmmword_EB50;
    if (qword_14130 != -1) {
      swift_once(&qword_14130, sub_5C30);
    }
    v57[0] = qword_14190;
    v57[1] = *(void *)algn_14198;
    swift_bridgeObjectRetain(*(void *)algn_14198);
    uint64_t v41 = AnyHashable.init<A>(_:)(v57, &type metadata for String, &protocol witness table for String);
    uint64_t v42 = SiriAudioDisambiguationItemModel.id.getter(v41);
    *(void *)(inited + 96) = &type metadata for String;
    *(void *)(inited + 72) = v42;
    *(void *)(inited + 80) = v43;
    unint64_t v44 = sub_6800(inited);
    dispatch thunk of Context.perform(directInvocation:payload:)(v36, v38, v44);

    swift_bridgeObjectRelease(v38);
    return swift_bridgeObjectRelease(v44);
  }

  else
  {
    uint64_t v46 = *(void *)(v34 + 8);
    uint64_t v47 = type metadata accessor for Context(0LL);
    uint64_t v48 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    uint64_t result = EnvironmentObject.error()(0LL, v46, v47, v48);
    __break(1u);
  }

  return result;
}

unint64_t sub_6800(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_56A4(&qword_142A0);
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
    sub_7604(v7, (uint64_t)v16, &qword_142A8);
    unint64_t result = sub_7490((uint64_t)v16);
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
    unint64_t result = (unint64_t)sub_74C0(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    _OWORD v4[2] = v15;
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

uint64_t sub_6940(uint64_t a1)
{
  uint64_t v18 = type metadata accessor for RFImage(0LL);
  uint64_t v2 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_56A4(&qword_14280);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  BOOL v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_7604(a1, (uint64_t)v10, &qword_14280);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11) == 1)
  {
    sub_7328((uint64_t)v10);
    return 0LL;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, 1LL, 1LL, v11);
    static RFImage.url(_:dark:)(v14, v8);
    sub_7328((uint64_t)v8);
    uint64_t v15 = sub_6AFC((uint64_t)v4);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }

  return v15;
}

uint64_t sub_6AFC(uint64_t a1)
{
  uint64_t v52 = type metadata accessor for RFImageView(0LL);
  uint64_t v50 = *(void *)(v52 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v49 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_56A4(&qword_14288);
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v51 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for RFImage(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v41 - v11;
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_14140 != -1) {
    swift_once(&qword_14140, sub_D2D8);
  }
  uint64_t v17 = sub_568C(v13, (uint64_t)qword_14D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  uint64_t v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v18 = v53(v12, a1, v6);
  uint64_t v19 = Logger.logObject.getter(v18);
  uint64_t v47 = v7;
  int v20 = (os_log_s *)v19;
  os_log_type_t v21 = static os_log_type_t.default.getter();
  uint64_t v48 = v14;
  os_log_type_t v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v46 = v3;
    uint64_t v23 = swift_slowAlloc(12LL, -1LL);
    uint64_t v45 = v4;
    unint64_t v24 = (uint8_t *)v23;
    uint64_t v43 = swift_slowAlloc(32LL, -1LL);
    uint64_t v54 = v43;
    uint64_t v44 = a1;
    *(_DWORD *)unint64_t v24 = 136315138;
    uint64_t v42 = v24 + 4;
    v53(v10, (uint64_t)v12, v6);
    uint64_t v55 = String.init<A>(describing:)(v10, v6);
    uint64_t v56 = v25;
    uint64_t v26 = String.init<A>(_:)( &v55,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
    unint64_t v28 = v27;
    uint64_t v55 = sub_AE68(v26, v27, &v54);
    a1 = v44;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v42, v24 + 12);
    unint64_t v29 = v28;
    uint64_t v3 = v46;
    swift_bridgeObjectRelease(v29);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v6);
    _os_log_impl(&dword_0, v20, v22, "SiriAudioDisambiguationSnippet#imageView building imageView: %s", v24, 0xCu);
    uint64_t v30 = v43;
    swift_arrayDestroy(v43, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1LL, -1LL);
    os_log_t v31 = v24;
    uint64_t v4 = v45;
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v6);
  }

  (*(void (**)(char *, uint64_t))(v48 + 8))(v16, v13);
  v53(v10, a1, v6);
  uint64_t v32 = v49;
  RFImageView.init(_:)(v10);
  if (qword_14120 != -1) {
    swift_once(&qword_14120, sub_5C10);
  }
  double v33 = *(double *)&qword_14180;
  if (qword_14128 != -1) {
    swift_once(&qword_14128, sub_5C20);
  }
  double v34 = *(double *)&qword_14188;
  uint64_t v35 = sub_5738( &qword_14290,  (uint64_t (*)(uint64_t))&type metadata accessor for RFImageView,  (uint64_t)&protocol conformance descriptor for RFImageView);
  uint64_t v37 = v51;
  uint64_t v36 = v52;
  View.imageAspectRatio(width:height:)(v52, v35, v33, v34);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v32, v36);
  uint64_t v55 = v36;
  uint64_t v56 = v35;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v55,  &opaque type descriptor for <<opaque return type of View.imageAspectRatio(width:height:)>>,  1LL);
  uint64_t v39 = View.eraseToAnyView()(v3, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v37, v3);
  return v39;
}

uint64_t sub_6F70()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_6F88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1);
  sub_7068(v1, (uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = swift_allocObject(&unk_10A00, v5 + v3, v4 | 7);
  sub_70B0((uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v6 + v5);
  uint64_t v7 = sub_56A4(&qword_14230);
  uint64_t v8 = sub_7674( &qword_14238,  &qword_14230,  (uint64_t)&protocol conformance descriptor for DisambiguationStandardView<A, B>);
  return ComponentStack.init(content:)(sub_70F4, v6, v7, v8);
}

uint64_t sub_7068(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioDisambiguationSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_70B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioDisambiguationSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_70F4()
{
  return sub_7164(sub_5C50);
}

uint64_t sub_7100(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_7148()
{
  return sub_7164((uint64_t (*)(uint64_t))sub_5DA8);
}

uint64_t sub_7158()
{
  return sub_7164(sub_5E38);
}

uint64_t sub_7164(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriAudioDisambiguationSnippet(0LL) - 8) + 80LL);
  return a1(v1 + ((v2 + 16) & ~v2));
}

unint64_t sub_71B0()
{
  unint64_t result = qword_14250;
  if (!qword_14250)
  {
    uint64_t v1 = sub_7100(&qword_14240);
    v2[0] = type metadata accessor for SimpleItemRichView(255LL);
    v2[1] = sub_5738( &qword_14258,  (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemRichView,  (uint64_t)&protocol conformance descriptor for SimpleItemRichView);
    swift_getOpaqueTypeConformance2( v2,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_14250);
  }

  return result;
}

uint64_t sub_7254()
{
  uint64_t v1 = type metadata accessor for SiriAudioDisambiguationSnippet(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);

  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_72DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriAudioDisambiguationSnippet(0LL) - 8) + 80LL);
  return sub_5FC0(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_7328(uint64_t a1)
{
  uint64_t v2 = sub_56A4(&qword_14280);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_7368()
{
  uint64_t v1 = type metadata accessor for SiriAudioDisambiguationItemModel(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for SiriAudioDisambiguationSnippet(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v12 = type metadata accessor for SiriAudioDisambiguationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8LL))(v0 + v9, v12);

  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_7430()
{
  uint64_t v1 = *(void *)(type metadata accessor for SiriAudioDisambiguationItemModel(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriAudioDisambiguationSnippet(0LL) - 8) + 80LL);
  return sub_63CC(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

unint64_t sub_7490(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_74D0(a1, v4);
}

_OWORD *sub_74C0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_74D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_7594(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_75D0((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

uint64_t sub_7594(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_75D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_7604(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_56A4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_7648()
{
  return sub_7674(&qword_142B0, &qword_142B8, (uint64_t)&protocol conformance descriptor for ComponentStack<A>);
}

uint64_t sub_7674(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_7100(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t SiriAudioActionButtonSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = (void *)(a2 + *(int *)(type metadata accessor for SiriAudioActionButtonSnippet(0LL) + 20));
  uint64_t v5 = type metadata accessor for Context(0LL);
  uint64_t v6 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  *unint64_t v4 = EnvironmentObject.init()(v5, v6);
  v4[1] = v7;
  uint64_t v8 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(a2, a1, v8);
}

uint64_t type metadata accessor for SiriAudioActionButtonSnippet(uint64_t a1)
{
  uint64_t result = qword_14318;
  if (!qword_14318) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriAudioActionButtonSnippet);
  }
  return result;
}

uint64_t SiriAudioActionButtonSnippet.body.getter()
{
  uint64_t v1 = type metadata accessor for SiriAudioActionButtonSnippet(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1);
  sub_7D84(v0, (uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = swift_allocObject(&unk_10B00, v5 + v3, v4 | 7);
  sub_7DCC((uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v6 + v5);
  return ComponentStack.init(content:)(sub_7E10, v6, &type metadata for AnyView, &protocol witness table for AnyView);
}

uint64_t sub_7840@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v56 = type metadata accessor for SiriAudioActionButtonSnippetRole(0LL);
  uint64_t v54 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v52 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ButtonItemButtonStyle.Role(0LL);
  uint64_t v58 = *(void *)(v4 - 8);
  uint64_t v59 = v4;
  __chkstk_darwin(v4);
  __int128 v57 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v45 = type metadata accessor for SiriAudioActionButtonSnippetStyle(0LL);
  uint64_t v46 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v55 = type metadata accessor for RFButtonStyle(0LL);
  uint64_t v48 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for SiriAudioActionButtonSnippet(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_56A4(&qword_14360);
  uint64_t v47 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v51 = sub_56A4(&qword_14368);
  uint64_t v49 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = sub_56A4(&qword_14370);
  uint64_t v50 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  int v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_7D84(a1, (uint64_t)v13);
  uint64_t v21 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v22 = (v21 + 16) & ~v21;
  uint64_t v23 = swift_allocObject(&unk_10B50, v22 + v12, v21 | 7);
  sub_7DCC((uint64_t)v13, v23 + v22);
  uint64_t v62 = a1;
  uint64_t v24 = sub_56A4(&qword_14378);
  uint64_t v25 = sub_7674(&qword_14380, &qword_14378, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  uint64_t v26 = Button.init(action:label:)(sub_84E4, v23, sub_8510, v61, v24, v25);
  SiriAudioActionButtonSnippetModel.buttonStyle.getter(v26);
  uint64_t v27 = v45;
  int v28 = (*(uint64_t (**)(char *, uint64_t))(v46 + 88))(v7, v45);
  if (v28 == enum case for SiriAudioActionButtonSnippetStyle.button(_:))
  {
    static PrimitiveButtonStyle<>.rfButton.getter();
LABEL_5:
    uint64_t v29 = v55;
    goto LABEL_8;
  }

  if (v28 == enum case for SiriAudioActionButtonSnippetStyle.buttonCircularIconOnly(_:))
  {
    static PrimitiveButtonStyle<>.rfButtonCircularIconOnly.getter();
    goto LABEL_5;
  }

  uint64_t v29 = v55;
  if (v28 != enum case for SiriAudioActionButtonSnippetStyle.buttonCircularIconAndTitle(_:)) {
    goto LABEL_15;
  }
  static PrimitiveButtonStyle<>.rfButtonCircularIconAndTitle.getter();
LABEL_8:
  uint64_t v30 = sub_7674(&qword_14388, &qword_14360, (uint64_t)&protocol conformance descriptor for Button<A>);
  uint64_t v31 = sub_5738( &qword_14390,  (uint64_t (*)(uint64_t))&type metadata accessor for RFButtonStyle,  (uint64_t)&protocol conformance descriptor for RFButtonStyle);
  View.buttonStyle<A>(_:)(v9, v14, v29, v30, v31);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v9, v29);
  uint64_t v32 = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v16, v14);
  double v33 = v52;
  SiriAudioActionButtonSnippetModel.buttonRole.getter(v32);
  uint64_t v27 = v56;
  int v34 = (*(uint64_t (**)(char *, uint64_t))(v54 + 88))(v33, v56);
  if (v34 == enum case for SiriAudioActionButtonSnippetRole.standard(_:))
  {
    uint64_t v35 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.standard(_:);
LABEL_14:
    uint64_t v37 = v57;
    uint64_t v36 = v58;
    uint64_t v38 = v59;
    (*(void (**)(char *, void, uint64_t))(v58 + 104))(v57, *v35, v59);
    uint64_t v63 = v14;
    uint64_t v64 = v29;
    uint64_t v65 = v30;
    uint64_t v66 = v31;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v63,  &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>,  1LL);
    uint64_t v40 = v51;
    View.buttonRole(_:)(v37, v51, OpaqueTypeConformance2);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v18, v40);
    uint64_t v63 = v40;
    uint64_t v64 = OpaqueTypeConformance2;
    uint64_t v41 = swift_getOpaqueTypeConformance2( &v63,  &opaque type descriptor for <<opaque return type of View.buttonRole(_:)>>,  1LL);
    uint64_t v42 = v53;
    uint64_t v43 = View.eraseToAnyView()(v53, v41);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v20, v42);
    *uint64_t v60 = v43;
    return result;
  }

  if (v34 == enum case for SiriAudioActionButtonSnippetRole.preferred(_:))
  {
    uint64_t v35 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.preferred(_:);
    goto LABEL_14;
  }

  if (v34 == enum case for SiriAudioActionButtonSnippetRole.preferredAndDestructive(_:))
  {
    uint64_t v35 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.preferredAndDestructive(_:);
    goto LABEL_14;
  }

LABEL_15:
  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v27, v27);
  __break(1u);
  return result;
}

uint64_t sub_7D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioActionButtonSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_7DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioActionButtonSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_7E14(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of SiriAudioActionButtonSnippet.body>>,  1LL);
}

void sub_7E24(uint64_t a1)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for SiriAudioActionButtonSnippet(0LL) + 20);
  if (*(void *)v1)
  {
    id v2 = *(id *)v1;
    id v6 = (id)SiriAudioActionButtonSnippetModel.buttonCommand.getter();
    dispatch thunk of Context.perform(aceCommand:)();
  }

  else
  {
    uint64_t v3 = *(void *)(v1 + 8);
    uint64_t v4 = type metadata accessor for Context(0LL);
    uint64_t v5 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    EnvironmentObject.error()(0LL, v3, v4, v5);
    __break(1u);
  }
}

uint64_t sub_7EC4@<X0>(uint64_t a1@<X8>)
{
  v8[0] = SiriAudioActionButtonSnippetModel.buttonLabel.getter();
  v8[1] = v2;
  unint64_t v3 = sub_8574();
  uint64_t result = Text.init<A>(_:)(v8, &type metadata for String, v3);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_7F20(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1);
  sub_7D84(v1, (uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = swift_allocObject(&unk_10B28, v5 + v3, v4 | 7);
  sub_7DCC((uint64_t)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v6 + v5);
  return ComponentStack.init(content:)(sub_7E10, v6, &type metadata for AnyView, &protocol witness table for AnyView);
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriAudioActionButtonSnippet( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v12 = *(void **)v10;
    uint64_t v11 = *((void *)v10 + 1);
    *uint64_t v9 = v12;
    v9[1] = v11;
    id v13 = v12;
  }

  return a1;
}

void destroy for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
}

uint64_t initializeWithCopy for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v11 = *(void **)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  id v12 = v11;
  return a1;
}

uint64_t assignWithCopy for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)v9;
  *uint64_t v8 = *(void *)v9;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  return a1;
}

uint64_t initializeWithTake for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8270);
}

uint64_t sub_8270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  int v10 = v9 - 1;
  if (v10 < 0) {
    int v10 = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriAudioActionButtonSnippet( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8304);
}

uint64_t sub_8304(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t sub_837C(uint64_t a1)
{
  uint64_t result = type metadata accessor for SiriAudioActionButtonSnippetModel(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_EC90;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_83EC()
{
  return sub_7674(&qword_14350, &qword_14358, (uint64_t)&protocol conformance descriptor for ComponentStack<A>);
}

uint64_t sub_841C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriAudioActionButtonSnippet(0LL) - 8) + 80LL);
  return sub_7840(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_845C()
{
  uint64_t v1 = type metadata accessor for SiriAudioActionButtonSnippet(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for SiriAudioActionButtonSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);

  return swift_deallocObject(v0, v5, v6);
}

void sub_84E4()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriAudioActionButtonSnippet(0LL) - 8) + 80LL);
  sub_7E24(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_8510()
{
  void v2[2] = *(void *)(v0 + 16);
  return Label.init(title:icon:)( sub_856C,  v2,  nullsub_1,  0LL,  &type metadata for Text,  &type metadata for EmptyView,  &protocol witness table for Text,  &protocol witness table for EmptyView);
}

uint64_t sub_856C@<X0>(uint64_t a1@<X8>)
{
  return sub_7EC4(a1);
}

unint64_t sub_8574()
{
  unint64_t result = qword_14398;
  if (!qword_14398)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_14398);
  }

  return result;
}

char *sub_85B8(char *a1, char **a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16LL) & ~(unint64_t)v4];
    swift_retain(v5);
  }

  else
  {
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    int v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v5;
    uint64_t v12 = sub_56A4(&qword_14150);
    if (swift_getEnumCaseMultiPayload(v10, v12) == 1)
    {
      uint64_t v13 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v9, v10, v13);
      uint64_t v14 = 1LL;
    }

    else
    {
      uint64_t v15 = *v10;
      *(void *)uint64_t v9 = *v10;
      swift_retain(v15);
      uint64_t v14 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v9, v12, v14);
    uint64_t v16 = a3[6];
    uint64_t v17 = a3[7];
    uint64_t v18 = &a1[v16];
    uint64_t v19 = (char *)a2 + v16;
    *uint64_t v18 = *v19;
    uint64_t v20 = *((void *)v19 + 1);
    *((void *)v18 + 1) = v20;
    uint64_t v21 = &a1[v17];
    uint64_t v22 = (uint64_t)a2 + v17;
    uint64_t v23 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16LL);
    swift_retain(v20);
    v24(v21, v22, v23);
  }

  return a1;
}

uint64_t sub_86EC(id *a1, int *a2)
{
  int v4 = (id *)((char *)a1 + a2[5]);
  uint64_t v5 = sub_56A4(&qword_14150);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v4, v6);
  }

  else
  {
    swift_release(*v4);
  }

  swift_release(*(id *)((char *)a1 + a2[6] + 8));
  uint64_t v7 = (char *)a1 + a2[7];
  uint64_t v8 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
}

void *sub_879C(void *a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)((char *)a1 + v8);
  int v10 = (uint64_t *)(a2 + v8);
  id v11 = v6;
  uint64_t v12 = sub_56A4(&qword_14150);
  if (swift_getEnumCaseMultiPayload(v10, v12) == 1)
  {
    uint64_t v13 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v9, v10, v13);
    uint64_t v14 = 1LL;
  }

  else
  {
    uint64_t v15 = *v10;
    *uint64_t v9 = *v10;
    swift_retain(v15);
    uint64_t v14 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v9, v12, v14);
  uint64_t v16 = a3[6];
  uint64_t v17 = a3[7];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)(a2 + v16);
  *uint64_t v18 = *v19;
  uint64_t v20 = *((void *)v19 + 1);
  *((void *)v18 + 1) = v20;
  uint64_t v21 = (char *)a1 + v17;
  uint64_t v22 = a2 + v17;
  uint64_t v23 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16LL);
  swift_retain(v20);
  v24(v21, v22, v23);
  return a1;
}

uint64_t sub_88A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  if (a1 != a2)
  {
    uint64_t v9 = a3[5];
    int v10 = (uint64_t *)(a1 + v9);
    id v11 = (uint64_t *)(a2 + v9);
    sub_B7A0(a1 + v9, &qword_14150);
    uint64_t v12 = sub_56A4(&qword_14150);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      uint64_t v13 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v10, v11, v13);
      uint64_t v14 = 1LL;
    }

    else
    {
      uint64_t v15 = *v11;
      *int v10 = *v11;
      swift_retain(v15);
      uint64_t v14 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v10, v12, v14);
  }

  uint64_t v16 = a3[6];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(_BYTE *)uint64_t v17 = *(_BYTE *)v18;
  uint64_t v19 = *(void *)(v17 + 8);
  uint64_t v20 = *(void *)(v18 + 8);
  *(void *)(v17 + 8) = v20;
  swift_retain(v20);
  swift_release(v19);
  uint64_t v21 = a3[7];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 24LL))(v22, v23, v24);
  return a1;
}

_OWORD *sub_89DC(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_56A4(&qword_14150);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    uint64_t v10 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1LL);
  }

  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64LL));
  }

  uint64_t v11 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v12, v13, v14);
  return a1;
}

void **sub_8AC8(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    id v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    sub_B7A0((uint64_t)a1 + v7, &qword_14150);
    uint64_t v10 = sub_56A4(&qword_14150);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      uint64_t v11 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1LL);
    }

    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64LL));
    }
  }

  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  char *v13 = *v14;
  uint64_t v15 = *((void *)v13 + 1);
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_release(v15);
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40LL))(v17, v18, v19);
  return a1;
}

uint64_t sub_8BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8C04);
}

uint64_t sub_8C04(char *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 2147483646)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
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
    uint64_t v9 = sub_56A4(&qword_143A0);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(int *)(a3 + 20);
    }

    else
    {
      uint64_t v11 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
      uint64_t v10 = *(void *)(v11 - 8);
      uint64_t v12 = *(int *)(a3 + 28);
    }

    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(&a1[v12], a2, v11);
  }

uint64_t sub_8CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8CC0);
}

char *sub_8CC0(char *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)unint64_t result = a2;
  }

  else
  {
    uint64_t v8 = sub_56A4(&qword_143A0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }

    else
    {
      uint64_t v10 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a4 + 28);
    }

    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }

  return result;
}

uint64_t type metadata accessor for SiriAudioAlternativeSnippet(uint64_t a1)
{
  uint64_t result = qword_14400;
  if (!qword_14400) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriAudioAlternativeSnippet);
  }
  return result;
}

void sub_8D9C(uint64_t a1)
{
  v6[0] = &unk_ECE0;
  sub_8E2C(319LL);
  if (v3 <= 0x3F)
  {
    v6[1] = *(void *)(v2 - 8) + 64LL;
    _OWORD v6[2] = &unk_ECE0;
    uint64_t v4 = type metadata accessor for SiriAudioAlternativeSnippetModel(319LL);
    if (v5 <= 0x3F)
    {
      v6[3] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 4LL, v6, a1 + 16);
    }
  }

void sub_8E2C(uint64_t a1)
{
  if (!qword_14410)
  {
    uint64_t v2 = type metadata accessor for ColorScheme(255LL);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_14410);
    }
  }

uint64_t sub_8E80(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_F400, 1LL);
}

uint64_t sub_8E90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v112 = a1;
  uint64_t v110 = sub_56A4(&qword_14448);
  __chkstk_darwin(v110);
  uint64_t v111 = (char *)&v91 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_56A4(&qword_14450);
  __chkstk_darwin(v4);
  uint64_t v6 = (uint64_t *)((char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v92 = type metadata accessor for ColorScheme(0LL);
  uint64_t v98 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  v97 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v102 = type metadata accessor for ComponentStackBottomSpacing(0LL);
  uint64_t v8 = *(void *)(v102 - 8);
  __chkstk_darwin(v102);
  uint64_t v10 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for SiriAudioAlternativeSnippet(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_56A4(&qword_14458);
  uint64_t v100 = *(void *)(v15 - 8);
  uint64_t v101 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v91 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v104 = sub_56A4(&qword_14460);
  __chkstk_darwin(v104);
  os_log_type_t v113 = (char *)&v91 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v109 = sub_56A4(&qword_14468);
  uint64_t v106 = *(void *)(v109 - 8);
  __chkstk_darwin(v109);
  uint64_t v105 = (char *)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v107 = sub_56A4(&qword_14470);
  __chkstk_darwin(v107);
  uint64_t v94 = (char *)&v91 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v108 = sub_56A4(&qword_14478);
  uint64_t v96 = *(void *)(v108 - 8);
  uint64_t v21 = __chkstk_darwin(v108);
  v93 = (char *)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __chkstk_darwin(v21);
  v95 = (char *)&v91 - v24;
  LOBYTE(v11) = SiriAudioAlternativeSnippetModel.isSnippetInDarkMode.getter(v23);
  uint64_t v103 = v2;
  sub_A8A4(v2, (uint64_t)v14);
  uint64_t v25 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v26 = (v25 + 16) & ~v25;
  uint64_t v27 = v25 | 7;
  uint64_t v99 = v26 + v13;
  if ((v11 & 1) != 0)
  {
    uint64_t v28 = swift_allocObject(&unk_10C00, v26 + v13, v25 | 7);
    sub_56E4((uint64_t)&v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL), v28 + v26);
    uint64_t v29 = sub_56A4(&qword_14480);
    uint64_t v91 = v6;
    uint64_t v30 = v29;
    unint64_t v31 = sub_A8F8();
    ComponentStack.init(content:)(sub_A8EC, v28, v30, v31);
    uint64_t v32 = v102;
    (*(void (**)(char *, void, uint64_t))(v8 + 104))( v10,  enum case for ComponentStackBottomSpacing.default(_:),  v102);
    uint64_t v33 = sub_7674(&qword_144C8, &qword_14458, (uint64_t)&protocol conformance descriptor for ComponentStack<A>);
    uint64_t v34 = v101;
    View.lastComponentBottomSpacing(_:)(v10, v101, v33);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v32);
    (*(void (**)(char *, uint64_t))(v100 + 8))(v17, v34);
    sub_A8A4(v103, (uint64_t)v14);
    uint64_t v35 = swift_allocObject(&unk_10C28, v99, v27);
    sub_56E4((uint64_t)v14, v35 + v26);
    uint64_t v36 = sub_56A4(&qword_144D0);
    uint64_t v114 = v34;
    unint64_t v115 = v33;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v114,  &opaque type descriptor for <<opaque return type of View.lastComponentBottomSpacing(_:)>>,  1LL);
    uint64_t v38 = sub_7100(&qword_144D8);
    uint64_t v39 = sub_7100(&qword_144E0);
    uint64_t v40 = sub_7674(&qword_144E8, &qword_144E0, (uint64_t)&protocol conformance descriptor for ComponentStack<A>);
    uint64_t v114 = v39;
    unint64_t v115 = v40;
    uint64_t v41 = swift_getOpaqueTypeConformance2( &v114,  &opaque type descriptor for <<opaque return type of View.lastComponentBottomSpacing(_:)>>,  1LL);
    uint64_t v114 = v38;
    unint64_t v115 = v41;
    uint64_t v42 = swift_getOpaqueTypeConformance2( &v114,  &opaque type descriptor for <<opaque return type of View.labelsHidden()>>,  1LL);
    uint64_t v43 = v105;
    ExpandableStandardView.init(_:expandableContent:)(v113, sub_AACC, v35, v104, v36, OpaqueTypeConformance2, v42);
    uint64_t KeyPath = swift_getKeyPath(&unk_ED48);
    uint64_t v46 = v97;
    uint64_t v45 = v98;
    uint64_t v47 = v92;
    (*(void (**)(char *, void, uint64_t))(v98 + 104))(v97, enum case for ColorScheme.dark(_:), v92);
    uint64_t v48 = v107;
    uint64_t v49 = (uint64_t)v94;
    uint64_t v50 = (uint64_t *)&v94[*(int *)(v107 + 36)];
    uint64_t v51 = sub_56A4(&qword_14508);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))((char *)v50 + *(int *)(v51 + 28), v46, v47);
    *uint64_t v50 = KeyPath;
    uint64_t v52 = v106;
    uint64_t v53 = v109;
    (*(void (**)(uint64_t, char *, uint64_t))(v106 + 16))(v49, v43, v109);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
    uint64_t v54 = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v43, v53);
    uint64_t v55 = static Color.black.getter(v54);
    uint64_t v56 = (uint64_t)v91;
    *uint64_t v91 = v55;
    uint64_t v57 = enum case for HostBackground.color(_:);
    uint64_t v58 = type metadata accessor for HostBackground(0LL);
    uint64_t v59 = *(void *)(v58 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 104))(v56, v57, v58);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56))(v56, 0LL, 1LL, v58);
    unint64_t v60 = sub_AA28();
    v61 = v93;
    View.setHostBackground(_:)(v56, v48, v60);
    sub_B7A0(v56, &qword_14450);
    sub_B7A0(v49, &qword_14470);
    uint64_t v63 = v95;
    uint64_t v62 = v96;
    uint64_t v64 = v61;
    uint64_t v65 = v108;
    (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v95, v64, v108);
    uint64_t v66 = v111;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v111, v63, v65);
    swift_storeEnumTagMultiPayload(v66, v110, 0LL);
    uint64_t v114 = v48;
    unint64_t v115 = v60;
    uint64_t v67 = swift_getOpaqueTypeConformance2( &v114,  &opaque type descriptor for <<opaque return type of View.setHostBackground(_:)>>,  1LL);
    uint64_t v68 = sub_7674( &qword_144F8,  &qword_14468,  (uint64_t)&protocol conformance descriptor for ExpandableStandardView<A, B>);
    _ConditionalContent<>.init(storage:)(v66, v65, v53, v67, v68);
    return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v63, v65);
  }

  else
  {
    uint64_t v70 = swift_allocObject(&unk_10BB0, v26 + v13, v25 | 7);
    sub_56E4((uint64_t)&v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL), v70 + v26);
    uint64_t v71 = sub_56A4(&qword_14480);
    unint64_t v72 = sub_A8F8();
    ComponentStack.init(content:)(sub_A8EC, v70, v71, v72);
    uint64_t v73 = v102;
    (*(void (**)(char *, void, uint64_t))(v8 + 104))( v10,  enum case for ComponentStackBottomSpacing.default(_:),  v102);
    uint64_t v74 = sub_7674(&qword_144C8, &qword_14458, (uint64_t)&protocol conformance descriptor for ComponentStack<A>);
    uint64_t v75 = v101;
    View.lastComponentBottomSpacing(_:)(v10, v101, v74);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v73);
    (*(void (**)(char *, uint64_t))(v100 + 8))(v17, v75);
    sub_A8A4(v103, (uint64_t)v14);
    uint64_t v76 = swift_allocObject(&unk_10BD8, v99, v27);
    sub_56E4((uint64_t)v14, v76 + v26);
    uint64_t v77 = sub_56A4(&qword_144D0);
    uint64_t v114 = v75;
    unint64_t v115 = v74;
    uint64_t v78 = swift_getOpaqueTypeConformance2( &v114,  &opaque type descriptor for <<opaque return type of View.lastComponentBottomSpacing(_:)>>,  1LL);
    uint64_t v79 = sub_7100(&qword_144D8);
    uint64_t v80 = sub_7100(&qword_144E0);
    uint64_t v81 = sub_7674(&qword_144E8, &qword_144E0, (uint64_t)&protocol conformance descriptor for ComponentStack<A>);
    uint64_t v114 = v80;
    unint64_t v115 = v81;
    uint64_t v82 = swift_getOpaqueTypeConformance2( &v114,  &opaque type descriptor for <<opaque return type of View.lastComponentBottomSpacing(_:)>>,  1LL);
    uint64_t v114 = v79;
    unint64_t v115 = v82;
    uint64_t v83 = swift_getOpaqueTypeConformance2( &v114,  &opaque type descriptor for <<opaque return type of View.labelsHidden()>>,  1LL);
    uint64_t v84 = v105;
    ExpandableStandardView.init(_:expandableContent:)(v113, sub_AA1C, v76, v104, v77, v78, v83);
    uint64_t v85 = v106;
    uint64_t v86 = v111;
    uint64_t v87 = v109;
    (*(void (**)(char *, char *, uint64_t))(v106 + 16))(v111, v84, v109);
    swift_storeEnumTagMultiPayload(v86, v110, 1LL);
    unint64_t v88 = sub_AA28();
    uint64_t v114 = v107;
    unint64_t v115 = v88;
    uint64_t v89 = swift_getOpaqueTypeConformance2( &v114,  &opaque type descriptor for <<opaque return type of View.setHostBackground(_:)>>,  1LL);
    uint64_t v90 = sub_7674( &qword_144F8,  &qword_14468,  (uint64_t)&protocol conformance descriptor for ExpandableStandardView<A, B>);
    _ConditionalContent<>.init(storage:)(v86, v108, v87, v89, v90);
    return (*(uint64_t (**)(char *, uint64_t))(v85 + 8))(v84, v87);
  }

uint64_t sub_97CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_97F4(a1, (uint64_t)&unk_10C50, (uint64_t)sub_AAE4, a2);
}

uint64_t sub_97E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_97F4(a1, (uint64_t)&unk_10CC8, (uint64_t)sub_AAE4, a2);
}

uint64_t sub_97F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v26 = a2;
  uint64_t v31 = a4;
  uint64_t v29 = type metadata accessor for ComponentStackBottomSpacing(0LL);
  uint64_t v5 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for SiriAudioAlternativeSnippet(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = sub_56A4(&qword_144E0);
  uint64_t v27 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_56A4(&qword_144D8);
  uint64_t v30 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_A8A4(a1, (uint64_t)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v17 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = (v17 + 16) & ~v17;
  uint64_t v19 = swift_allocObject(v26, v18 + v10, v17 | 7);
  sub_56E4((uint64_t)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), v19 + v18);
  uint64_t v20 = sub_56A4(&qword_14510);
  unint64_t v21 = sub_AAF0();
  ComponentStack.init(content:)(v28, v19, v20, v21);
  uint64_t v22 = v29;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))( v7,  enum case for ComponentStackBottomSpacing.none(_:),  v29);
  uint64_t v23 = sub_7674(&qword_144E8, &qword_144E0, (uint64_t)&protocol conformance descriptor for ComponentStack<A>);
  View.lastComponentBottomSpacing(_:)(v7, v11, v23);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v22);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v11);
  v32[0] = v11;
  v32[1] = v23;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v32,  &opaque type descriptor for <<opaque return type of View.lastComponentBottomSpacing(_:)>>,  1LL);
  View.labelsHidden()(v14, OpaqueTypeConformance2);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v16, v14);
}

uint64_t sub_9A50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v3 = type metadata accessor for Text.TruncationMode(0LL);
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  __chkstk_darwin(v3);
  uint64_t v35 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = type metadata accessor for SimpleItemStandardView(0LL);
  uint64_t v5 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = sub_56A4(&qword_14498);
  __chkstk_darwin(v32);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v33 = sub_56A4(&qword_14480);
  __chkstk_darwin(v33);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (char *)(a1 + *(int *)(type metadata accessor for SiriAudioAlternativeSnippet(0LL) + 24));
  char v13 = *v12;
  unint64_t v14 = *((void *)v12 + 1);
  LOBYTE(v48) = v13;
  unint64_t v49 = v14;
  uint64_t v15 = sub_56A4(&qword_14548);
  uint64_t v16 = State.wrappedValue.getter(v46, v15);
  if ((v46[0] & 1) != 0)
  {
    uint64_t v17 = 0LL;
    unint64_t v18 = 0xE000000000000000LL;
  }

  else
  {
    uint64_t v17 = SiriAudioAlternativeSnippetModel.subtitle.getter(v16);
  }

  uint64_t v50 = &type metadata for String;
  uint64_t v51 = &protocol witness table for String;
  uint64_t v48 = v17;
  unint64_t v49 = v18;
  uint64_t v47 = 0LL;
  memset(v46, 0, sizeof(v46));
  uint64_t v45 = 0LL;
  memset(v44, 0, sizeof(v44));
  uint64_t v43 = 0LL;
  memset(v42, 0, sizeof(v42));
  uint64_t v19 = SiriAudioAlternativeSnippetModel.title.getter();
  v41[3] = &type metadata for String;
  v41[4] = &protocol witness table for String;
  v41[0] = v19;
  v41[1] = v20;
  uint64_t v40 = 0LL;
  memset(v39, 0, sizeof(v39));
  SimpleItemStandardView.init(text1:text2:text3:text4:text5:text6:)(&v48, v46, v44, v42, v41, v39);
  uint64_t KeyPath = swift_getKeyPath(&off_ED78);
  uint64_t v22 = v34;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v7, v34);
  uint64_t v23 = &v9[*(int *)(v32 + 36)];
  *(void *)uint64_t v23 = KeyPath;
  *((void *)v23 + 1) = 1LL;
  v23[16] = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v22);
  uint64_t v25 = v35;
  uint64_t v24 = v36;
  uint64_t v26 = v37;
  (*(void (**)(char *, void, uint64_t))(v36 + 104))(v35, enum case for Text.TruncationMode.tail(_:), v37);
  uint64_t v27 = swift_getKeyPath(&unk_EDA8);
  uint64_t v28 = (uint64_t *)&v11[*(int *)(v33 + 36)];
  uint64_t v29 = sub_56A4(&qword_144C0);
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))((char *)v28 + *(int *)(v29 + 28), v25, v26);
  *uint64_t v28 = v27;
  sub_B758((uint64_t)v9, (uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  sub_B7A0((uint64_t)v9, &qword_14498);
  return sub_B7DC((uint64_t)v11, v38);
}

uint64_t sub_9D48(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAudioAlternativeSnippet(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  uint64_t v21 = SiriAudioAlternativeSnippetModel.items.getter();
  sub_A8A4(a1, (uint64_t)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v5 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (v5 + 16) & ~v5;
  uint64_t v7 = swift_allocObject(&unk_10C78, v6 + v4, v5 | 7);
  sub_56E4((uint64_t)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL), v7 + v6);
  uint64_t v8 = sub_56A4(&qword_14520);
  uint64_t v9 = sub_56A4(&qword_14528);
  uint64_t v10 = sub_7674(&qword_14530, &qword_14520, (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v11 = sub_7100(&qword_14268);
  uint64_t v12 = type metadata accessor for SimpleItemRichView(255LL);
  uint64_t v13 = sub_5738( &qword_14258,  (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemRichView,  (uint64_t)&protocol conformance descriptor for SimpleItemRichView);
  uint64_t v19 = v12;
  uint64_t v20 = v13;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v19,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
  uint64_t v19 = v11;
  uint64_t v20 = OpaqueTypeConformance2;
  uint64_t v15 = swift_getOpaqueTypeConformance2( &v19,  &opaque type descriptor for <<opaque return type of View.separators(_:isOverride:)>>,  1LL);
  uint64_t v16 = sub_5738( &qword_14538,  (uint64_t (*)(uint64_t))&type metadata accessor for SiriAudioAlternativeItemModel,  (uint64_t)&protocol conformance descriptor for SiriAudioAlternativeItemModel);
  return ForEach<>.init(_:content:)(&v21, sub_ABC4, v7, v8, &type metadata for String, v9, v10, v15, v16);
}

uint64_t sub_9F08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v55 = a3;
  uint64_t v4 = type metadata accessor for SeparatorStyle(0LL);
  uint64_t v53 = *(void *)(v4 - 8);
  uint64_t v54 = v4;
  __chkstk_darwin(v4);
  uint64_t v52 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for SiriAudioAlternativeSnippet(0LL);
  uint64_t v42 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v43 = v7;
  uint64_t v45 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for SiriAudioAlternativeItemModel(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v44 = type metadata accessor for SimpleItemRichView(0LL);
  uint64_t v46 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_56A4(&qword_14268);
  uint64_t v50 = *(void *)(v13 - 8);
  uint64_t v51 = v13;
  __chkstk_darwin(v13);
  uint64_t v41 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_56A4(&qword_14528);
  uint64_t v48 = *(void *)(v15 - 8);
  uint64_t v49 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v47 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = SiriAudioAlternativeItemModel.title.getter(v16);
  uint64_t v74 = &type metadata for String;
  uint64_t v75 = &protocol witness table for String;
  uint64_t v72 = v18;
  uint64_t v73 = v19;
  uint64_t v71 = 0LL;
  memset(v70, 0, sizeof(v70));
  uint64_t v20 = SiriAudioAlternativeItemModel.subtitle.getter();
  v69[3] = &type metadata for String;
  v69[4] = &protocol witness table for String;
  uint64_t v21 = v40;
  v69[0] = v20;
  v69[1] = v22;
  uint64_t v68 = 0LL;
  memset(v67, 0, sizeof(v67));
  uint64_t v66 = 0LL;
  memset(v65, 0, sizeof(v65));
  uint64_t v64 = 0LL;
  memset(v63, 0, sizeof(v63));
  uint64_t v62 = 0LL;
  memset(v61, 0, sizeof(v61));
  uint64_t v60 = 0LL;
  memset(v59, 0, sizeof(v59));
  uint64_t v23 = sub_A320();
  if (v23)
  {
    *((void *)&v57 + 1) = &type metadata for AnyView;
    uint64_t v58 = &protocol witness table for AnyView;
    *(void *)&__int128 v56 = v23;
  }

  else
  {
    uint64_t v58 = 0LL;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
  }

  SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)( &v72,  v70,  v69,  v67,  v65,  v63,  v61,  v59,  &v56);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))( (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v8);
  uint64_t v24 = v45;
  sub_A8A4(v21, v45);
  uint64_t v25 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v26 = (v25 + 16) & ~v25;
  uint64_t v27 = *(unsigned __int8 *)(v42 + 80);
  uint64_t v28 = (v10 + v27 + v26) & ~v27;
  uint64_t v29 = swift_allocObject(&unk_10CA0, v28 + v43, v25 | v27 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))( v29 + v26,  (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v8);
  sub_56E4(v24, v29 + v28);
  uint64_t v30 = sub_5738( &qword_14258,  (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemRichView,  (uint64_t)&protocol conformance descriptor for SimpleItemRichView);
  uint64_t v31 = v41;
  uint64_t v32 = v44;
  View.componentTapped(isNavigation:perform:)(0LL, sub_AD44, v29, v44, v30);
  swift_release(v29);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v12, v32);
  uint64_t v34 = v52;
  uint64_t v33 = v53;
  uint64_t v35 = v54;
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v52, enum case for SeparatorStyle.insetLeading(_:), v54);
  uint64_t v72 = v32;
  uint64_t v73 = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v72,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
  uint64_t v37 = v47;
  uint64_t v38 = v51;
  View.separators(_:isOverride:)(v34, 0LL, v51, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v31, v38);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v48 + 32))(v55, v37, v49);
}

uint64_t sub_A320()
{
  uint64_t v0 = type metadata accessor for RFImage(0LL);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for RFImageView(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_56A4(&qword_14280);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = type metadata accessor for URL(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  SiriAudioAlternativeItemModel.imageURL.getter(v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13) == 1)
  {
    sub_B7A0((uint64_t)v12, &qword_14280);
    return 0LL;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v12, v13);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v10, 1LL, 1LL, v13);
    static RFImage.url(_:dark:)(v17, v10);
    sub_B7A0((uint64_t)v10, &qword_14280);
    RFImageView.init(_:)(v2);
    uint64_t v19 = sub_5738( &qword_14290,  (uint64_t (*)(uint64_t))&type metadata accessor for RFImageView,  (uint64_t)&protocol conformance descriptor for RFImageView);
    uint64_t v18 = View.eraseToAnyView()(v3, v19);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }

  return v18;
}

void sub_A540(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioAlternativeItemModel(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v40 - v9;
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_14140 != -1) {
    swift_once(&qword_14140, sub_D2D8);
  }
  uint64_t v15 = sub_568C(v11, (uint64_t)qword_14D58);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  uint64_t v45 = v12;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, a1, v4);
  uint64_t v17 = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)(v8, a1, v4);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.default.getter();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc(22LL, -1LL);
    uint64_t v43 = a2;
    uint64_t v22 = v21;
    uint64_t v42 = swift_slowAlloc(64LL, -1LL);
    uint64_t v47 = v42;
    *(_DWORD *)uint64_t v22 = 136315394;
    int v41 = v20;
    os_log_t v40 = v18;
    uint64_t v23 = SiriAudioAlternativeItemModel.id.getter();
    unint64_t v25 = v24;
    uint64_t v46 = sub_AE68(v23, v24, &v47);
    uint64_t v44 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v25);
    uint64_t v26 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    uint64_t v27 = v26(v10, v4);
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v28 = SiriAudioAlternativeItemModel.title.getter(v27);
    unint64_t v30 = v29;
    uint64_t v46 = sub_AE68(v28, v29, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(v30);
    v26(v8, v4);
    os_log_t v31 = v40;
    _os_log_impl( &dword_0,  v40,  (os_log_type_t)v41,  "AlternativeItemsView#body tapped on %s, itemTitle: %s",  (uint8_t *)v22,  0x16u);
    uint64_t v32 = v42;
    swift_arrayDestroy(v42, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    uint64_t v33 = v22;
    a2 = v43;
    swift_slowDealloc(v33, -1LL, -1LL);
  }

  else
  {
    uint64_t v34 = *(void (**)(char *, uint64_t))(v5 + 8);
    v34(v10, v4);
    v34(v8, v4);
  }

  (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v11);
  if (*(void *)a2)
  {
    id v35 = *(id *)a2;
    uint64_t v36 = (void *)SiriAudioAlternativeItemModel.command.getter();
    dispatch thunk of Context.perform(aceCommand:)();
  }

  else
  {
    uint64_t v37 = *(void *)(a2 + 8);
    uint64_t v38 = type metadata accessor for Context(0LL);
    uint64_t v39 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    EnvironmentObject.error()(0LL, v37, v38, v39);
    __break(1u);
  }

uint64_t sub_A8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioAlternativeSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_A8EC()
{
  return sub_B610((uint64_t (*)(uint64_t))sub_9A50);
}

unint64_t sub_A8F8()
{
  unint64_t result = qword_14488;
  if (!qword_14488)
  {
    uint64_t v1 = sub_7100(&qword_14480);
    sub_A97C();
    sub_7674( &qword_144B8,  &qword_144C0,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_14488);
  }

  return result;
}

unint64_t sub_A97C()
{
  unint64_t result = qword_14490;
  if (!qword_14490)
  {
    uint64_t v1 = sub_7100(&qword_14498);
    sub_5738( &qword_144A0,  (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemStandardView,  (uint64_t)&protocol conformance descriptor for SimpleItemStandardView);
    sub_7674( &qword_144A8,  &qword_144B0,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_14490);
  }

  return result;
}

uint64_t sub_AA1C()
{
  return sub_B610((uint64_t (*)(uint64_t))sub_97E0);
}

unint64_t sub_AA28()
{
  unint64_t result = qword_144F0;
  if (!qword_144F0)
  {
    uint64_t v1 = sub_7100(&qword_14470);
    sub_7674(&qword_144F8, &qword_14468, (uint64_t)&protocol conformance descriptor for ExpandableStandardView<A, B>);
    sub_7674( &qword_14500,  &qword_14508,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_144F0);
  }

  return result;
}

uint64_t sub_AACC()
{
  return sub_B610((uint64_t (*)(uint64_t))sub_97CC);
}

uint64_t sub_AAE4()
{
  return sub_B610(sub_9D48);
}

unint64_t sub_AAF0()
{
  unint64_t result = qword_14518;
  if (!qword_14518)
  {
    uint64_t v1 = sub_7100(&qword_14510);
    uint64_t v2 = sub_7100(&qword_14268);
    uint64_t v4 = type metadata accessor for SimpleItemRichView(255LL);
    uint64_t v5 = sub_5738( &qword_14258,  (uint64_t (*)(uint64_t))&type metadata accessor for SimpleItemRichView,  (uint64_t)&protocol conformance descriptor for SimpleItemRichView);
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( &v4,  &opaque type descriptor for <<opaque return type of View.componentTapped(isNavigation:perform:)>>,  1LL);
    uint64_t v4 = v2;
    uint64_t v5 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2( &v4,  &opaque type descriptor for <<opaque return type of View.separators(_:isOverride:)>>,  1LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_14518);
  }

  return result;
}

uint64_t sub_ABC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriAudioAlternativeSnippet(0LL) - 8) + 80LL);
  return sub_9F08(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_AC10()
{
  uint64_t v1 = type metadata accessor for SiriAudioAlternativeItemModel(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (int *)type metadata accessor for SiriAudioAlternativeSnippet(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = *(void *)(v7 + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v11 = v0 + v9;

  uint64_t v12 = (void *)(v0 + v9 + v6[5]);
  uint64_t v13 = sub_56A4(&qword_14150);
  if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
  {
    uint64_t v14 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v14 - 8) + 8LL))(v12, v14);
  }

  else
  {
    swift_release(*v12);
  }

  swift_release(*(void *)(v11 + v6[6] + 8));
  uint64_t v15 = v11 + v6[7];
  uint64_t v16 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8LL))(v15, v16);
  return swift_deallocObject(v0, v9 + v10, v3 | v8 | 7);
}

void sub_AD44()
{
  uint64_t v1 = *(void *)(type metadata accessor for SiriAudioAlternativeItemModel(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriAudioAlternativeSnippet(0LL) - 8) + 80LL);
  sub_A540(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t sub_ADA4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_ADD8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_ADF8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_AE68(v6, v7, a3);
  uint64_t v10 = *a1;
  uint64_t v11 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_AE68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_AF38(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_B4D8((uint64_t)v12, *a3);
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
      sub_B4D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_B4B8(v12);
  return v7;
}

uint64_t sub_AF38(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_B0F0(a5, a6);
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

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_B0F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_B184(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_B35C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_B35C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_B184(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_B2F8(v4, 0LL);
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

void *sub_B2F8(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_56A4(&qword_14540);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_B35C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_56A4(&qword_14540);
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

_BYTE **sub_B4A8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_B4B8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_B4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_B51C()
{
  uint64_t v1 = (int *)type metadata accessor for SiriAudioAlternativeSnippet(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v0 + v4;

  int64_t v7 = (void *)(v0 + v4 + v1[5]);
  uint64_t v8 = sub_56A4(&qword_14150);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    uint64_t v9 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v9 - 8) + 8LL))(v7, v9);
  }

  else
  {
    swift_release(*v7);
  }

  swift_release(*(void *)(v6 + v1[6] + 8));
  uint64_t v10 = v6 + v1[7];
  uint64_t v11 = type metadata accessor for SiriAudioAlternativeSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8LL))(v10, v11);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_B610(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SiriAudioAlternativeSnippet(0LL) - 8) + 80LL);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_B65C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_B68C(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_B6B8()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_B6D8(uint64_t a1)
{
  char v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.truncationMode.setter(v3);
}

uint64_t sub_B758(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_56A4(&qword_14498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_B7A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_56A4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_B7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_56A4(&qword_14480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_B828()
{
  unint64_t result = qword_14550;
  if (!qword_14550)
  {
    uint64_t v1 = sub_7100(&qword_14558);
    v2[0] = sub_7100(&qword_14470);
    v2[1] = sub_AA28();
    swift_getOpaqueTypeConformance2( v2,  &opaque type descriptor for <<opaque return type of View.setHostBackground(_:)>>,  1LL);
    sub_7674(&qword_144F8, &qword_14468, (uint64_t)&protocol conformance descriptor for ExpandableStandardView<A, B>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_14550);
  }

  return result;
}

uint64_t ConfirmationSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void *)(a2 + *(int *)(type metadata accessor for ConfirmationSnippet(0LL) + 20));
  uint64_t v5 = type metadata accessor for Context(0LL);
  uint64_t v6 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
  *uint64_t v4 = EnvironmentObject.init()(v5, v6);
  v4[1] = v7;
  uint64_t v8 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(a2, a1, v8);
}

uint64_t type metadata accessor for ConfirmationSnippet(uint64_t a1)
{
  uint64_t result = qword_145C0;
  if (!qword_145C0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ConfirmationSnippet);
  }
  return result;
}

uint64_t ConfirmationSnippet.body.getter()
{
  uint64_t v1 = type metadata accessor for ConfirmationSnippet(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1);
  sub_BD4C(v0, (uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = swift_allocObject(&unk_10D40, v5 + v3, v4 | 7);
  sub_BD94((uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v6 + v5);
  uint64_t v7 = type metadata accessor for BinaryButtonView(0LL);
  uint64_t v8 = sub_5738( &qword_14560,  (uint64_t (*)(uint64_t))&type metadata accessor for BinaryButtonView,  (uint64_t)&protocol conformance descriptor for BinaryButtonView);
  return ComponentStack.init(content:)(sub_BDD8, v6, v7, v8);
}

uint64_t sub_BA80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v28 = type metadata accessor for ButtonItemButtonStyle.Role(0LL);
  uint64_t v3 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ConfirmationSnippet(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_56A4(&qword_14360);
  uint64_t v27 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  size_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_56A4(&qword_14608);
  uint64_t v29 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_BDEC();
  v34[3] = &type metadata for AnyView;
  v34[4] = &protocol witness table for AnyView;
  v34[0] = v16;
  sub_BD4C(a1, (uint64_t)v9);
  uint64_t v17 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v18 = (v17 + 16) & ~v17;
  uint64_t v19 = swift_allocObject(&unk_10D90, v18 + v8, v17 | 7);
  sub_BD94((uint64_t)v9, v19 + v18);
  uint64_t v32 = a1;
  uint64_t v20 = sub_56A4(&qword_14378);
  uint64_t v21 = sub_7674(&qword_14380, &qword_14378, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  Button.init(action:label:)(sub_C7F8, v19, sub_C80C, v31, v20, v21);
  uint64_t v22 = v28;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for ButtonItemButtonStyle.Role.standard(_:),  v28);
  uint64_t v23 = sub_7674(&qword_14388, &qword_14360, (uint64_t)&protocol conformance descriptor for Button<A>);
  View.buttonRole(_:)(v5, v10, v23);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v22);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v10);
  v33[0] = v10;
  v33[1] = v23;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v33,  &opaque type descriptor for <<opaque return type of View.buttonRole(_:)>>,  1LL);
  uint64_t v25 = View.eraseToAnyView()(v13, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v13);
  v33[4] = &protocol witness table for AnyView;
  v33[3] = &type metadata for AnyView;
  v33[0] = v25;
  return BinaryButtonView.init(primaryButton:secondaryButton:)(v34, v33);
}

uint64_t sub_BD4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_BD94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_BDDC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of ConfirmationSnippet.body>>,  1LL);
}

uint64_t sub_BDEC()
{
  uint64_t v29 = type metadata accessor for ButtonItemButtonStyle.Role(0LL);
  uint64_t v1 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ConfirmationSnippet(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_56A4(&qword_14360);
  uint64_t v28 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_56A4(&qword_14608);
  uint64_t v30 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_BD4C(v0, (uint64_t)v7);
  uint64_t v14 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  uint64_t v16 = swift_allocObject(&unk_10DB8, v15 + v6, v14 | 7);
  sub_BD94((uint64_t)v7, v16 + v15);
  uint64_t v32 = v0;
  uint64_t v17 = sub_56A4(&qword_14378);
  uint64_t v18 = sub_7674(&qword_14380, &qword_14378, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  uint64_t v19 = Button.init(action:label:)(sub_C914, v16, sub_C978, v31, v17, v18);
  char v20 = SiriAudioConfirmationSnippetModel.isDestructive.getter(v19);
  uint64_t v21 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.preferredAndDestructive(_:);
  if ((v20 & 1) == 0) {
    uint64_t v21 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.preferred(_:);
  }
  uint64_t v22 = v29;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *v21, v29);
  uint64_t v23 = sub_7674(&qword_14388, &qword_14360, (uint64_t)&protocol conformance descriptor for Button<A>);
  View.buttonRole(_:)(v3, v8, v23);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v22);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v8);
  v33[0] = v8;
  v33[1] = v23;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2( v33,  &opaque type descriptor for <<opaque return type of View.buttonRole(_:)>>,  1LL);
  uint64_t v25 = View.eraseToAnyView()(v11, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v11);
  return v25;
}

void sub_C080(uint64_t a1, const char *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_14140 != -1) {
    swift_once(&qword_14140, sub_D2D8);
  }
  uint64_t v10 = sub_568C(v6, (uint64_t)qword_14D58);
  uint64_t v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_0, v12, v13, a2, v14, 2u);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v15 = a1 + *(int *)(type metadata accessor for ConfirmationSnippet(0LL) + 20);
  if (*(void *)v15)
  {
    id v16 = *(id *)v15;
    uint64_t v17 = (void *)a3();
    dispatch thunk of Context.perform(aceCommand:)();
  }

  else
  {
    uint64_t v18 = *(void *)(v15 + 8);
    uint64_t v19 = type metadata accessor for Context(0LL);
    uint64_t v20 = sub_5738( &qword_14148,  (uint64_t (*)(uint64_t))&type metadata accessor for Context,  (uint64_t)&protocol conformance descriptor for Context);
    EnvironmentObject.error()(0LL, v18, v19, v20);
    __break(1u);
  }

uint64_t sub_C244@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  v9[0] = a1();
  v9[1] = v3;
  unint64_t v4 = sub_8574();
  uint64_t result = Text.init<A>(_:)(v9, &type metadata for String, v4);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(void *)(a2 + 24) = v8;
  return result;
}

uint64_t sub_C29C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1);
  sub_BD4C(v1, (uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = swift_allocObject(&unk_10D68, v5 + v3, v4 | 7);
  sub_BD94((uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v6 + v5);
  uint64_t v7 = type metadata accessor for BinaryButtonView(0LL);
  uint64_t v8 = sub_5738( &qword_14560,  (uint64_t (*)(uint64_t))&type metadata accessor for BinaryButtonView,  (uint64_t)&protocol conformance descriptor for BinaryButtonView);
  return ComponentStack.init(content:)(sub_BDD8, v6, v7, v8);
}

uint64_t *initializeBufferWithCopyOfBuffer for ConfirmationSnippet(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v12 = *(void **)v10;
    uint64_t v11 = *((void *)v10 + 1);
    *uint64_t v9 = v12;
    v9[1] = v11;
    id v13 = v12;
  }

  return a1;
}

void destroy for ConfirmationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
}

uint64_t initializeWithCopy for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v11 = *(void **)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  id v12 = v11;
  return a1;
}

uint64_t assignWithCopy for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)v9;
  *uint64_t v8 = *(void *)v9;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  return a1;
}

uint64_t initializeWithTake for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_C60C);
}

uint64_t sub_C60C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  int v10 = v9 - 1;
  if (v10 < 0) {
    int v10 = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C6A0);
}

uint64_t sub_C6A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t sub_C718(uint64_t a1)
{
  uint64_t result = type metadata accessor for SiriAudioConfirmationSnippetModel(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_EE68;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_C788()
{
  return sub_7674(&qword_145F8, &qword_14600, (uint64_t)&protocol conformance descriptor for ComponentStack<A>);
}

uint64_t sub_C7B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(type metadata accessor for ConfirmationSnippet(0LL) - 8) + 80LL);
  return sub_BA80(v1 + ((v3 + 16) & ~v3), a1);
}

void sub_C7F8()
{
}

uint64_t sub_C80C()
{
  void v2[2] = *(void *)(v0 + 16);
  return Label.init(title:icon:)( sub_C868,  v2,  nullsub_1,  0LL,  &type metadata for Text,  &type metadata for EmptyView,  &protocol witness table for Text,  &protocol witness table for EmptyView);
}

uint64_t sub_C868@<X0>(uint64_t a1@<X8>)
{
  return sub_C244((uint64_t (*)(void))&SiriAudioConfirmationSnippetModel.denyText.getter, a1);
}

uint64_t sub_C88C()
{
  uint64_t v1 = type metadata accessor for ConfirmationSnippet(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for SiriAudioConfirmationSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);

  return swift_deallocObject(v0, v5, v6);
}

void sub_C914()
{
}

void sub_C928(const char *a1, uint64_t (*a2)(void))
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for ConfirmationSnippet(0LL) - 8) + 80LL);
  sub_C080(v2 + ((v5 + 16) & ~v5), a1, a2);
}

uint64_t sub_C978()
{
  void v2[2] = *(void *)(v0 + 16);
  return Label.init(title:icon:)( sub_C9D4,  v2,  nullsub_1,  0LL,  &type metadata for Text,  &type metadata for EmptyView,  &protocol witness table for Text,  &protocol witness table for EmptyView);
}

uint64_t sub_C9D4@<X0>(uint64_t a1@<X8>)
{
  return sub_C244((uint64_t (*)(void))&SiriAudioConfirmationSnippetModel.confirmText.getter, a1);
}

uint64_t sub_C9F4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_CE84(v0, qword_14D40);
  sub_568C(v0, (uint64_t)qword_14D40);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x800000000000FBC0LL,  0x5049556F69647541LL,  0xED00006E6967756CLL);
}

uint64_t sub_CA74()
{
  return 1LL;
}

Swift::Int sub_CA7C()
{
  return Hasher._finalize()();
}

void sub_CABC()
{
}

Swift::Int sub_CAE0(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_CB2C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for Plugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC13AudioUIPlugin6Plugin);
}

unint64_t sub_CB60()
{
  unint64_t result = qword_146A8;
  if (!qword_146A8)
  {
    uint64_t v1 = type metadata accessor for SiriAudioSnippets(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for SiriAudioSnippets, v1);
    atomic_store(result, (unint64_t *)&qword_146A8);
  }

  return result;
}

uint64_t sub_CBA8(uint64_t a1, uint64_t a2)
{
  return sub_CC00(a1, a2);
}

uint64_t sub_CBBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject(v1, 16LL, 7LL);
  *a1 = result;
  return result;
}

uint64_t sub_CBEC(uint64_t a1)
{
  return sub_CEC4(a1);
}

uint64_t sub_CC00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_14138 != -1) {
    swift_once(&qword_14138, sub_C9F4);
  }
  uint64_t v7 = sub_568C(v3, (uint64_t)qword_14D40);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v18 = v4;
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = swift_slowAlloc(32LL, -1LL);
    uint64_t v21 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v17 = v11 + 4;
    Swift::String v13 = String.lowercased()();
    uint64_t v19 = sub_AE68(v13._countAndFlagsBits, (unint64_t)v13._object, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v17, v11 + 12);
    swift_bridgeObjectRelease_n(a2, 2LL);
    swift_bridgeObjectRelease(v13._object);
    _os_log_impl(&dword_0, v9, v10, "Plugin#view %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v3);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  unint64_t v14 = sub_CE40();
  swift_allocError(&type metadata for Plugin.Error, v14, 0LL, 0LL);
  return swift_willThrow();
}

unint64_t sub_CE40()
{
  unint64_t result = qword_146B0;
  if (!qword_146B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_EF84, &type metadata for Plugin.Error);
    atomic_store(result, (unint64_t *)&qword_146B0);
  }

  return result;
}

uint64_t *sub_CE84(uint64_t a1, uint64_t *a2)
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

uint64_t sub_CEC4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for SiriAudioSnippets(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v37 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v31 - v7;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_14138 != -1) {
    swift_once(&qword_14138, sub_C9F4);
  }
  uint64_t v13 = sub_568C(v9, (uint64_t)qword_14D40);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  unint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v15 = v14(v8, a1, v3);
  uint64_t v16 = Logger.logObject.getter(v15);
  uint64_t v38 = v4;
  uint64_t v17 = (os_log_s *)v16;
  os_log_type_t v18 = static os_log_type_t.default.getter();
  uint64_t v39 = v10;
  os_log_type_t v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v20 = swift_slowAlloc(12LL, -1LL);
    uint64_t v36 = v1;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v34 = swift_slowAlloc(32LL, -1LL);
    uint64_t v42 = v34;
    uint64_t v35 = a1;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v22 = v21 + 12;
    uint64_t v32 = v21 + 4;
    uint64_t v33 = v21;
    uint64_t v23 = v37;
    v14(v37, (uint64_t)v8, v3);
    uint64_t v24 = String.init<A>(describing:)(v23, v3);
    unint64_t v26 = v25;
    uint64_t v40 = sub_AE68(v24, v25, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v32, v22);
    swift_bridgeObjectRelease(v26);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v3);
    os_log_type_t v27 = v19;
    uint64_t v28 = v33;
    _os_log_impl(&dword_0, v17, v27, "AudioUIPlugin#snippet %s", v33, 0xCu);
    uint64_t v29 = v34;
    swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1LL, -1LL);
    swift_slowDealloc(v28, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v3);
  }

  (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v9);
  return SiriAudioSnippets.snippet.getter();
}

uint64_t getEnumTagSinglePayload for Plugin.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Plugin.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_D210 + 4 * byte_EE84[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_D230 + 4 * byte_EE89[v4]))();
  }
}

_BYTE *sub_D210(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_D230(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_D238(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_D240(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_D248(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_D250(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Plugin.Error()
{
  return &type metadata for Plugin.Error;
}

unint64_t sub_D270()
{
  unint64_t result = qword_146B8;
  if (!qword_146B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_EF5C, &type metadata for Plugin.Error);
    atomic_store(result, (unint64_t *)&qword_146B8);
  }

  return result;
}

uint64_t type metadata accessor for AudioUIPluginUtils()
{
  return objc_opt_self(&OBJC_CLASS____TtC13AudioUIPlugin18AudioUIPluginUtils);
}

uint64_t sub_D2D8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_CE84(v0, qword_14D58);
  sub_568C(v0, (uint64_t)qword_14D58);
  sub_D36C();
  uint64_t v1 = OS_os_log.init(subsystem:category:)( 0xD000000000000014LL,  0x800000000000FBC0LL,  0x5049556F69647541LL,  0xED00006E6967756CLL);
  return Logger.init(_:)(v1);
}

unint64_t sub_D36C()
{
  unint64_t result = qword_14758;
  if (!qword_14758)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_14758);
  }

  return result;
}

uint64_t *sub_D3A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v12 = *(void **)v10;
    uint64_t v11 = *((void *)v10 + 1);
    *uint64_t v9 = v12;
    v9[1] = v11;
    id v13 = v12;
  }

  return a1;
}

void sub_D43C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
}

uint64_t sub_D480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v11 = *(void **)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  id v12 = v11;
  return a1;
}

uint64_t sub_D4E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)v9;
  *uint64_t v8 = *(void *)v9;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  return a1;
}

uint64_t sub_D560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_D5BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  return a1;
}

uint64_t sub_D630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_D63C);
}

uint64_t sub_D63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  int v10 = v9 - 1;
  if (v10 < 0) {
    int v10 = -1;
  }
  return (v10 + 1);
}

uint64_t sub_D6C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D6D0);
}

uint64_t sub_D6D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for SiriAudioSimpleTextSnippet(uint64_t a1)
{
  uint64_t result = qword_147B8;
  if (!qword_147B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriAudioSimpleTextSnippet);
  }
  return result;
}

uint64_t sub_D784(uint64_t a1)
{
  uint64_t result = type metadata accessor for SiriAudioSimpleTextSnippetModel(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_F030;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_D7F4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_F534, 1LL);
}

uint64_t sub_D804()
{
  v10[3] = &type metadata for String;
  v10[4] = &protocol witness table for String;
  v10[0] = SiriAudioSimpleTextSnippetModel.text.getter();
  v10[1] = v0;
  uint64_t v9 = 0LL;
  memset(v8, 0, sizeof(v8));
  uint64_t v7 = 0LL;
  memset(v6, 0, sizeof(v6));
  uint64_t v5 = 0LL;
  memset(v4, 0, sizeof(v4));
  uint64_t v3 = 0LL;
  memset(v2, 0, sizeof(v2));
  return SummaryItemStandardView.init(text1:text2:text3:text4:thumbnail:)(v10, v8, v6, v4, v2);
}

uint64_t sub_D890(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1);
  sub_D954(v1, (uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = swift_allocObject(&unk_10F48, v5 + v3, v4 | 7);
  sub_DA20((uint64_t)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL), v6 + v5);
  uint64_t v7 = type metadata accessor for SummaryItemStandardView(0LL);
  unint64_t v8 = sub_DAA0();
  return ComponentStack.init(content:)(sub_DA64, v6, v7, v8);
}

uint64_t sub_D954(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioSimpleTextSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_D998()
{
  uint64_t v1 = type metadata accessor for SiriAudioSimpleTextSnippet(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for SiriAudioSimpleTextSnippetModel(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);

  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_DA20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioSimpleTextSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_DA64()
{
  return sub_D804();
}

unint64_t sub_DAA0()
{
  unint64_t result = qword_147F0;
  if (!qword_147F0)
  {
    uint64_t v1 = type metadata accessor for SummaryItemStandardView(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for SummaryItemStandardView, v1);
    atomic_store(result, (unint64_t *)&qword_147F0);
  }

  return result;
}

unint64_t sub_DAEC()
{
  unint64_t result = qword_147F8;
  if (!qword_147F8)
  {
    uint64_t v1 = sub_7100((uint64_t *)&unk_14800);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ComponentStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_147F8);
  }

  return result;
}