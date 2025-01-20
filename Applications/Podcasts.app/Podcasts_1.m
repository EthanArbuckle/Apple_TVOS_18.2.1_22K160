id sub_1001723E0(void *a1, uint64_t a2, uint64_t a3)
{
  return PodcastsStateCoordinator.unsafeImplicitlyFollowIfNeeded(_:for:from:)(a1, a2, a3);
}

id PodcastsStateCoordinator.unsafeImplicitlyFollowIfNeeded(_:for:from:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v151 = a3;
  uint64_t v140 = type metadata accessor for Date(0LL);
  uint64_t v138 = *(void *)(v140 - 8);
  __chkstk_darwin();
  v139 = (char *)&v133 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for RemoteNonFollowedShow(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v145 = (char *)&v133 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin();
  v149 = (char *)&v133 - v9;
  __chkstk_darwin();
  v11 = (char *)&v133 - v10;
  __chkstk_darwin();
  v13 = (char *)&v133 - v12;
  uint64_t v14 = type metadata accessor for Logger(0LL);
  v146 = *(void (**)(char *, uint64_t))(v14 - 8);
  __chkstk_darwin();
  v150 = (char *)&v133 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin();
  v18 = (char *)&v133 - v17;
  uint64_t v19 = static Logger.podcastsStatesCoordination.getter(v16);
  int v20 = static os_log_type_t.default.getter(v19);
  v21 = *(os_log_s **)(v7 + 16);
  id v22 = a1;
  ((void (*)(char *, uint64_t, uint64_t))v21)(v13, a2, v6);
  uint64_t v148 = a2;
  v144 = v21;
  ((void (*)(char *, uint64_t, uint64_t))v21)(v11, a2, v6);
  id v23 = v22;
  v24 = (os_log_s *)Logger.logObject.getter(v23);
  if (os_log_type_enabled(v24, (os_log_type_t)v20))
  {
    v135 = v13;
    uint64_t v136 = v7;
    LODWORD(v137) = v20;
    v141 = v24;
    uint64_t v142 = v6;
    v25 = v18;
    uint64_t v143 = v14;
    uint64_t v26 = swift_slowAlloc(82LL, -1LL);
    uint64_t v134 = swift_slowAlloc(192LL, -1LL);
    v153[0] = v134;
    *(_DWORD *)uint64_t v26 = 136382467;
    id v27 = [v23 title];
    if (v27)
    {
      v28 = v27;
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      unint64_t v31 = v30;
    }

    else
    {
      uint64_t v29 = 0x6C746974206F6E3CLL;
      unint64_t v31 = 0xEA00000000003E65LL;
    }

    v40 = v11;
    uint64_t v41 = 0x3E7974706D653CLL;
    id v152 = (id)sub_100178E7C(v29, v31, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v26 + 4, v26 + 12);

    swift_bridgeObjectRelease(v31);
    *(_WORD *)(v26 + 12) = 2080;
    id v42 = [v23 uuid];
    v133 = v25;
    if (v42)
    {
      v43 = v42;
      uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
      unint64_t v46 = v45;
    }

    else
    {
      unint64_t v46 = 0xE700000000000000LL;
      uint64_t v44 = 0x3E7974706D653CLL;
    }

    v47 = v141;
    id v152 = (id)sub_100178E7C(v44, v46, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v26 + 14, v26 + 22);

    swift_bridgeObjectRelease(v46);
    *(_WORD *)(v26 + 22) = 2080;
    id v152 = [v23 managedObjectContext];
    uint64_t v48 = sub_100126450(&qword_1002B66C0);
    uint64_t v49 = String.init<A>(describing:)(&v152, v48);
    unint64_t v51 = v50;
    id v152 = (id)sub_100178E7C(v49, v50, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v26 + 24, v26 + 32);

    swift_bridgeObjectRelease(v51);
    *(_WORD *)(v26 + 32) = 2049;
    id v52 = [v23 storeCollectionId];

    id v152 = v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v26 + 34, v26 + 42);

    *(_WORD *)(v26 + 42) = 2081;
    id v53 = [v23 feedURL];
    if (v53)
    {
      v54 = v53;
      uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v53);
      unint64_t v56 = v55;
    }

    else
    {
      unint64_t v56 = 0xE700000000000000LL;
    }

    uint64_t v57 = v136;
    id v152 = (id)sub_100178E7C(v41, v56, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v26 + 44, v26 + 52);

    uint64_t v58 = swift_bridgeObjectRelease(v56);
    *(_WORD *)(v26 + 52) = 2049;
    v59 = v135;
    uint64_t v60 = RemoteNonFollowedShow.storeCollectionId.getter(v58);
    v61 = *(os_log_s **)(v57 + 8);
    uint64_t v6 = v142;
    ((void (*)(char *, uint64_t))v61)(v59, v142);
    id v152 = (id)v60;
    uint64_t v62 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v26 + 54, v26 + 62);
    *(_WORD *)(v26 + 62) = 2081;
    uint64_t v63 = RemoteNonFollowedShow.feedURL.getter(v62);
    unint64_t v65 = v64;
    id v152 = (id)sub_100178E7C(v63, v64, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v26 + 64, v26 + 72);
    swift_bridgeObjectRelease(v65);
    v141 = v61;
    ((void (*)(char *, uint64_t))v61)(v40, v6);
    *(_WORD *)(v26 + 72) = 2080;
    uint64_t v38 = v151;
    uint64_t v66 = PodcastsStateChangeOrigin.description.getter(v151);
    unint64_t v68 = v67;
    id v152 = (id)sub_100178E7C(v66, v67, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v26 + 74, v26 + 82);
    swift_bridgeObjectRelease(v68);
    _os_log_impl( (void *)&_mh_execute_header,  v47,  (os_log_type_t)v137,  "Implicitly Following if needed podcast: %{private}s, uuid: %s, MOC: %s, adamID: %{private}lld, feedURL: %{private} s; For RemoteNonFollowedShow with adamID: %{private}lld, feedURL: %{private}s; From origin: %s.",
      (uint8_t *)v26,
      0x52u);
    uint64_t v69 = v134;
    swift_arrayDestroy(v134, 6LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v69, -1LL, -1LL);
    swift_slowDealloc(v26, -1LL, -1LL);

    v33 = (void (*)(char *, uint64_t))*((void *)v146 + 1);
    uint64_t v37 = v143;
    v33(v133, v143);
    v35 = v149;
    v39 = v150;
    uint64_t v36 = v147;
    uint64_t v34 = v148;
  }

  else
  {
    v32 = *(os_log_s **)(v7 + 8);
    ((void (*)(char *, uint64_t))v32)(v13, v6);

    v141 = v32;
    ((void (*)(char *, uint64_t))v32)(v11, v6);

    v33 = (void (*)(char *, uint64_t))*((void *)v146 + 1);
    v33(v18, v14);
    uint64_t v34 = v148;
    v35 = v149;
    uint64_t v36 = v147;
    uint64_t v37 = v14;
    v39 = v150;
    uint64_t v38 = v151;
  }

  uint64_t v70 = *(void *)(v36 + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateTransitions);
  sub_10014F148(v23, 3LL, 4, v38);
  [v23 lastDatePlayed];
  double v72 = v71;
  sub_10017A43C(v23, v34);
  id result = [v23 lastDatePlayed];
  if (v72 != v74)
  {
    uint64_t v148 = v70;
    uint64_t v75 = static Logger.podcastsStatesCoordination.getter(result);
    int v76 = static os_log_type_t.default.getter(v75);
    id v77 = v23;
    os_log_t v78 = v144;
    ((void (*)(char *, uint64_t, uint64_t))v144)(v35, v34, v6);
    v79 = v145;
    ((void (*)(char *, uint64_t, uint64_t))v78)(v145, v34, v6);
    id v80 = v77;
    v81 = (os_log_s *)Logger.logObject.getter(v80);
    LODWORD(v147) = v76;
    if (os_log_type_enabled(v81, (os_log_type_t)v76))
    {
      uint64_t v143 = v37;
      v144 = v81;
      v146 = v33;
      uint64_t v142 = v6;
      uint64_t v82 = swift_slowAlloc(102LL, -1LL);
      uint64_t v137 = swift_slowAlloc(256LL, -1LL);
      v153[0] = v137;
      *(_DWORD *)uint64_t v82 = 136382979;
      v83 = v139;
      Date.init(timeIntervalSinceReferenceDate:)(v72);
      uint64_t v84 = sub_100127210( &qword_1002B66C8,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
      uint64_t v85 = v140;
      uint64_t v86 = dispatch thunk of CustomStringConvertible.description.getter(v140, v84);
      unint64_t v88 = v87;
      v89 = *(void (**)(char *, uint64_t))(v138 + 8);
      v89(v83, v85);
      id v152 = (id)sub_100178E7C(v86, v88, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 4, v82 + 12);
      swift_bridgeObjectRelease(v88);
      *(_WORD *)(v82 + 12) = 2081;
      [v80 lastDatePlayed];
      Date.init(timeIntervalSinceReferenceDate:)(v90);
      uint64_t v91 = dispatch thunk of CustomStringConvertible.description.getter(v85, v84);
      unint64_t v93 = v92;
      v89(v83, v85);
      id v152 = (id)sub_100178E7C(v91, v93, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 14, v82 + 22);

      swift_bridgeObjectRelease(v93);
      *(_WORD *)(v82 + 22) = 2081;
      id v94 = [v80 title];
      if (v94)
      {
        v95 = v94;
        uint64_t v96 = static String._unconditionallyBridgeFromObjectiveC(_:)(v94);
        unint64_t v98 = v97;
      }

      else
      {
        uint64_t v96 = 0x6C746974206F6E3CLL;
        unint64_t v98 = 0xEA00000000003E65LL;
      }

      uint64_t v101 = 0x3E7974706D653CLL;
      id v152 = (id)sub_100178E7C(v96, v98, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 24, v82 + 32);

      swift_bridgeObjectRelease(v98);
      *(_WORD *)(v82 + 32) = 2080;
      id v102 = [v80 uuid];
      v103 = v150;
      if (v102)
      {
        v104 = v102;
        uint64_t v105 = static String._unconditionallyBridgeFromObjectiveC(_:)(v102);
        unint64_t v107 = v106;
      }

      else
      {
        unint64_t v107 = 0xE700000000000000LL;
        uint64_t v105 = 0x3E7974706D653CLL;
      }

      id v152 = (id)sub_100178E7C(v105, v107, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 34, v82 + 42);

      swift_bridgeObjectRelease(v107);
      *(_WORD *)(v82 + 42) = 2080;
      id v152 = [v80 managedObjectContext];
      uint64_t v108 = sub_100126450(&qword_1002B66C0);
      uint64_t v109 = String.init<A>(describing:)(&v152, v108);
      unint64_t v111 = v110;
      id v152 = (id)sub_100178E7C(v109, v110, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 44, v82 + 52);

      swift_bridgeObjectRelease(v111);
      *(_WORD *)(v82 + 52) = 2049;
      id v112 = [v80 storeCollectionId];

      id v152 = v112;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 54, v82 + 62);

      *(_WORD *)(v82 + 62) = 2081;
      id v113 = [v80 feedURL];
      if (v113)
      {
        v114 = v113;
        uint64_t v101 = static String._unconditionallyBridgeFromObjectiveC(_:)(v113);
        unint64_t v116 = v115;
      }

      else
      {
        unint64_t v116 = 0xE700000000000000LL;
      }

      id v152 = (id)sub_100178E7C(v101, v116, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 64, v82 + 72);

      uint64_t v117 = swift_bridgeObjectRelease(v116);
      *(_WORD *)(v82 + 72) = 2049;
      v118 = v149;
      uint64_t v119 = RemoteNonFollowedShow.storeCollectionId.getter(v117);
      v120 = v118;
      v121 = v141;
      uint64_t v122 = v142;
      ((void (*)(char *, uint64_t))v141)(v120, v142);
      id v152 = (id)v119;
      uint64_t v123 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 74, v82 + 82);
      *(_WORD *)(v82 + 82) = 2081;
      v124 = v145;
      uint64_t v125 = RemoteNonFollowedShow.feedURL.getter(v123);
      unint64_t v127 = v126;
      id v152 = (id)sub_100178E7C(v125, v126, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 84, v82 + 92);
      swift_bridgeObjectRelease(v127);
      ((void (*)(char *, uint64_t))v121)(v124, v122);
      *(_WORD *)(v82 + 92) = 2080;
      uint64_t v100 = v151;
      uint64_t v128 = PodcastsStateChangeOrigin.description.getter(v151);
      unint64_t v130 = v129;
      id v152 = (id)sub_100178E7C(v128, v129, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v152, v153, v82 + 94, v82 + 102);
      swift_bridgeObjectRelease(v130);
      os_log_t v131 = v144;
      _os_log_impl( (void *)&_mh_execute_header,  v144,  (os_log_type_t)v147,  "Implicit Follow did updated lastDatePlayed from %{private}s to %{private}s; Podcast: %{private}s, uuid: %s, MOC:"
        " %s, adamID: %{private}lld, feedURL: %{private}s; For RemoteNonFollowedShow with adamID: %{private}lld, feedURL:"
        " %{private}s; From origin: %s.",
        (uint8_t *)v82,
        0x66u);
      uint64_t v132 = v137;
      swift_arrayDestroy(v137, 8LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v132, -1LL, -1LL);
      swift_slowDealloc(v82, -1LL, -1LL);

      v146(v103, v143);
    }

    else
    {
      v99 = v141;
      ((void (*)(char *, uint64_t))v141)(v35, v6);

      ((void (*)(char *, uint64_t))v99)(v79, v6);
      v33(v39, v37);
      uint64_t v100 = v151;
    }

    return (id)sub_10014F148(v80, 8LL, 4, v100);
  }

  return result;
}

uint64_t sub_100173100(void *a1, uint64_t a2)
{
  return sub_10014F148(a1, 4LL, 4, a2);
}

uint64_t PodcastsStateCoordinator.unsafeRemoveImplicitFollowIfNeeded(_:from:)(void *a1, uint64_t a2)
{
  return sub_10014F148(a1, 4LL, 4, a2);
}

void PodcastsStateCoordinator.enableSubscription(onPodcastUUID:from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 =  [*(id *)&v3[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider] mainOrPrivateContext];
  uint64_t v8 = (void *)swift_allocObject(&unk_100248560, 56LL, 7LL);
  v8[2] = v3;
  v8[3] = a1;
  v8[4] = a2;
  v8[5] = a3;
  v8[6] = v7;
  v13[4] = sub_10017AB2C;
  uint64_t v14 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256LL;
  v13[2] = sub_10013D2D8;
  v13[3] = &unk_100248578;
  uint64_t v9 = _Block_copy(v13);
  uint64_t v10 = v14;
  v11 = v3;
  swift_bridgeObjectRetain(a2);
  id v12 = v7;
  swift_release(v10);
  [v12 performBlockAndWaitWithSave:v9];
  _Block_release(v9);
}

void PodcastsStateCoordinator.unsafeEnableSubscription(onPodcastUUID:from:context:)( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [a4 podcastForUuid:v6];

  if (v7)
  {
    sub_100173360(v7, a3);
    [a4 saveInCurrentBlock];
  }

id sub_100173360(void *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin();
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = static Logger.podcastsStatesCoordination.getter(v7);
  os_log_type_t v11 = static os_log_type_t.default.getter(v10);
  id v12 = a1;
  v13 = (os_log_s *)Logger.logObject.getter(v12);
  if (os_log_type_enabled(v13, v11))
  {
    uint64_t v49 = v2;
    uint64_t v14 = swift_slowAlloc(42LL, -1LL);
    uint64_t v47 = swift_slowAlloc(128LL, -1LL);
    uint64_t v53 = v47;
    *(_DWORD *)uint64_t v14 = 136315907;
    uint64_t v50 = a2;
    uint64_t v15 = PodcastsStateChangeOrigin.description.getter(a2);
    unint64_t v17 = v16;
    uint64_t v51 = sub_100178E7C(v15, v16, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v17);
    *(_WORD *)(v14 + 12) = 2081;
    id v18 = [v12 title];
    uint64_t v48 = v5;
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      uint64_t v22 = v21;
    }

    else
    {
      uint64_t v20 = 0LL;
      uint64_t v22 = 0LL;
    }

    uint64_t v51 = v20;
    uint64_t v52 = v22;
    uint64_t v23 = sub_100126450(&qword_1002B5820);
    uint64_t v24 = String.init<A>(describing:)(&v51, v23);
    unint64_t v26 = v25;
    uint64_t v51 = sub_100178E7C(v24, v25, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v14 + 14, v14 + 22);

    swift_bridgeObjectRelease(v26);
    *(_WORD *)(v14 + 22) = 2080;
    id v27 = [v12 uuid];
    if (v27)
    {
      v28 = v27;
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      uint64_t v31 = v30;
    }

    else
    {
      uint64_t v29 = 0LL;
      uint64_t v31 = 0LL;
    }

    uint64_t v51 = v29;
    uint64_t v52 = v31;
    uint64_t v32 = String.init<A>(describing:)(&v51, v23);
    unint64_t v34 = v33;
    uint64_t v51 = sub_100178E7C(v32, v33, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v14 + 24, v14 + 32);

    uint64_t v35 = swift_bridgeObjectRelease(v34);
    *(_WORD *)(v14 + 32) = 2081;
    uint64_t v36 = MTPodcast.adamId.getter(v35);
    if ((v37 & 1) != 0)
    {
      uint64_t v39 = 0LL;
      uint64_t v40 = 0LL;
    }

    else
    {
      uint64_t v51 = v36;
      unint64_t v38 = sub_10017BFC8();
      uint64_t v39 = BinaryInteger.description.getter(&type metadata for UInt64, v38);
    }

    uint64_t v51 = v39;
    uint64_t v52 = v40;
    uint64_t v41 = String.init<A>(describing:)(&v51, v23);
    unint64_t v43 = v42;
    uint64_t v51 = sub_100178E7C(v41, v42, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v14 + 34, v14 + 42);

    swift_bridgeObjectRelease(v43);
    _os_log_impl( (void *)&_mh_execute_header,  v13,  v11,  "Following podcast (origin: %s): %{private}s, uuid: %s, adamID: %{private}s.",  (uint8_t *)v14,  0x2Au);
    uint64_t v44 = v47;
    swift_arrayDestroy(v47, 4LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v44, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v48);
    a2 = v50;
  }

  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }

  sub_10014F148(v12, (uint64_t)[v12 syncType], 0, a2);
  objc_msgSend( v12,  "applyFollowedShowSettingsFor:",  MTPodcast.showType.getter(objc_msgSend(v12, "setNeedsArtworkUpdate:", 1)));
  [v12 resetGoDarkWithReason:5];
  [v12 setLastRemovedFromUpNextDate:0.0];
  return [v12 setLastUnfollowedDate:0.0];
}

void PodcastsStateCoordinator.disableSubscription(onPodcastUUID:from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 =  [*(id *)&v3[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider] mainOrPrivateContext];
  [v3 disableSubscriptionOnPodcastUUID:v5 from:a3 context:v6];
}

void PodcastsStateCoordinator.disableSubscription(onPodcastUUID:from:context:)( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = (void *)swift_allocObject(&unk_1002485B0, 56LL, 7LL);
  v9[2] = a4;
  v9[3] = a1;
  v9[4] = a2;
  v9[5] = v4;
  v9[6] = a3;
  v14[4] = sub_10017AB8C;
  uint64_t v15 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256LL;
  v14[2] = sub_10013D2D8;
  v14[3] = &unk_1002485C8;
  uint64_t v10 = _Block_copy(v14);
  os_log_type_t v11 = v15;
  id v12 = a4;
  swift_bridgeObjectRetain(a2);
  id v13 = v4;
  swift_release(v11);
  [v12 performBlockAndWaitWithSave:v10];
  _Block_release(v10);
}

void sub_100173A7C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [a1 podcastForUuid:v7];

  if (v8)
  {
    sub_100173B14(v8, a5, a1);
  }

void sub_100173B14(void *a1, uint64_t a2, void *a3)
{
  uint64_t v69 = a3;
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin();
  id v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = static Logger.podcastsStatesCoordination.getter(v11);
  int v15 = static os_log_type_t.default.getter(v14);
  id v16 = a1;
  unint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
  int v68 = v15;
  if (os_log_type_enabled(v17, (os_log_type_t)v15))
  {
    uint64_t v62 = v10;
    os_log_t v63 = v17;
    uint64_t v64 = v9;
    uint64_t v66 = v6;
    uint64_t v67 = v5;
    uint64_t v18 = a2;
    uint64_t v19 = swift_slowAlloc(42LL, -1LL);
    uint64_t v20 = swift_slowAlloc(128LL, -1LL);
    uint64_t v72 = v20;
    *(_DWORD *)uint64_t v19 = 136315907;
    uint64_t v65 = v18;
    uint64_t v21 = PodcastsStateChangeOrigin.description.getter(v18);
    unint64_t v23 = v22;
    uint64_t v70 = sub_100178E7C(v21, v22, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v19 + 12) = 2081;
    id v24 = [v16 title];
    if (v24)
    {
      unint64_t v25 = v24;
      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
      uint64_t v28 = v27;
    }

    else
    {
      uint64_t v26 = 0LL;
      uint64_t v28 = 0LL;
    }

    uint64_t v70 = v26;
    uint64_t v71 = v28;
    uint64_t v30 = sub_100126450(&qword_1002B5820);
    uint64_t v31 = String.init<A>(describing:)(&v70, v30);
    unint64_t v33 = v32;
    uint64_t v70 = sub_100178E7C(v31, v32, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v19 + 14, v19 + 22);

    swift_bridgeObjectRelease(v33);
    *(_WORD *)(v19 + 22) = 2080;
    id v34 = [v16 uuid];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
      uint64_t v38 = v37;
    }

    else
    {
      uint64_t v36 = 0LL;
      uint64_t v38 = 0LL;
    }

    uint64_t v70 = v36;
    uint64_t v71 = v38;
    uint64_t v39 = String.init<A>(describing:)(&v70, v30);
    unint64_t v41 = v40;
    uint64_t v70 = sub_100178E7C(v39, v40, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v19 + 24, v19 + 32);

    uint64_t v42 = swift_bridgeObjectRelease(v41);
    *(_WORD *)(v19 + 32) = 2081;
    uint64_t v43 = MTPodcast.adamId.getter(v42);
    if ((v44 & 1) != 0)
    {
      uint64_t v46 = 0LL;
      uint64_t v47 = 0LL;
    }

    else
    {
      uint64_t v70 = v43;
      unint64_t v45 = sub_10017BFC8();
      uint64_t v46 = BinaryInteger.description.getter(&type metadata for UInt64, v45);
    }

    uint64_t v29 = v69;
    uint64_t v48 = v62;
    uint64_t v70 = v46;
    uint64_t v71 = v47;
    uint64_t v49 = String.init<A>(describing:)(&v70, v30);
    unint64_t v51 = v50;
    uint64_t v70 = sub_100178E7C(v49, v50, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v19 + 34, v19 + 42);

    swift_bridgeObjectRelease(v51);
    os_log_t v52 = v63;
    _os_log_impl( (void *)&_mh_execute_header,  v63,  (os_log_type_t)v68,  "Unfollowing podcast (origin: %s): %{private}s, uuid: %s, adamID: %{private}s.",  (uint8_t *)v19,  0x2Au);
    swift_arrayDestroy(v20, 4LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1LL, -1LL);
    swift_slowDealloc(v19, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v64);
    uint64_t v6 = v66;
    uint64_t v5 = v67;
    a2 = v65;
  }

  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    uint64_t v29 = v69;
  }

  sub_10014F148(v16, (uint64_t)[v16 syncType], 1, a2);
  uint64_t v53 = Date.init()([v16 applyUnfollowedShowSettings]);
  double v54 = Date.timeIntervalSinceReferenceDate.getter(v53);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  [v16 setLastRemovedFromUpNextDate:v54];
  [v16 setLastUnfollowedDate:v54];
  id v55 = [v16 nextEpisodeUuid];
  if (v55)
  {
    unint64_t v56 = v55;
    uint64_t v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
    unint64_t v59 = v58;
    swift_bridgeObjectRelease(v58);
    uint64_t v60 = HIBYTE(v59) & 0xF;
    if ((v59 & 0x2000000000000000LL) == 0) {
      uint64_t v60 = v57 & 0xFFFFFFFFFFFFLL;
    }
    if (v60)
    {
      [v16 setNextEpisodeUuid:0];
      id v61 = [v29 episodeForUuid:v56];

      if (!v61) {
        return;
      }
      [v61 setListenNowEpisode:0];
      unint64_t v56 = v61;
    }
  }

void PodcastsStateCoordinator.disableSubscriptions(onPodcastUUIDs:from:context:)( uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = (void *)swift_allocObject(&unk_100248600, 48LL, 7LL);
  v7[2] = a3;
  v7[3] = a1;
  v7[4] = v3;
  v7[5] = a2;
  v12[4] = sub_10017AB9C;
  id v13 = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256LL;
  v12[2] = sub_10013D2D8;
  v12[3] = &unk_100248618;
  id v8 = _Block_copy(v12);
  uint64_t v9 = v13;
  id v10 = a3;
  swift_bridgeObjectRetain(a1);
  id v11 = v3;
  swift_release(v9);
  [v10 performBlockAndWaitWithSave:v8];
  _Block_release(v8);
}

void sub_100174228(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)kMTPodcastEntityName;
  id v8 = (void *)objc_opt_self(&OBJC_CLASS___MTPodcast);
  id v9 = v7;
  swift_bridgeObjectRetain(a2);
  uint64_t v11 = sub_10017ABDC(v10);
  swift_bridgeObjectRelease(a2);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  id v13 = [v8 predicateForPodcastUuids:isa];

  id v14 = [a1 objectsInEntity:v9 predicate:v13 sortDescriptors:0];
  if (!v14) {
    return;
  }
  uint64_t v15 = sub_100134284(0LL, (unint64_t *)&qword_1002B6720, &OBJC_CLASS___NSManagedObject_ptr);
  unint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);

  uint64_t v17 = (uint64_t)sub_100130468(v16);
  swift_bridgeObjectRelease(v16);
  if (!v17) {
    return;
  }
  if ((unint64_t)v17 >> 62)
  {
    if (v17 >= 0) {
      uint64_t v22 = v17 & 0xFFFFFFFFFFFFFF8LL;
    }
    else {
      uint64_t v22 = v17;
    }
    swift_bridgeObjectRetain(v17);
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter(v22);
    swift_bridgeObjectRelease(v17);
    if (v18) {
      goto LABEL_5;
    }
LABEL_16:
    swift_bridgeObjectRelease(v17);
    return;
  }

  uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  if (!v18) {
    goto LABEL_16;
  }
LABEL_5:
  if (v18 >= 1)
  {
    for (uint64_t i = 0LL; i != v18; ++i)
    {
      if ((v17 & 0xC000000000000001LL) != 0) {
        id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v17);
      }
      else {
        id v20 = *(id *)(v17 + 8 * i + 32);
      }
      uint64_t v21 = v20;
      sub_100173B14(v20, a4, a1);
    }

    goto LABEL_16;
  }

  __break(1u);
}

void sub_100174524(void *a1)
{
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [a1 podcastForUuid:v2];

  if (v3)
  {
    [v3 setLastUnfollowedDate:0.0];
    [a1 saveInCurrentBlock];
  }

void sub_1001745BC(void *a1, void (*a2)(char *, uint64_t), int a3, int a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v104 = a5;
  LODWORD(v7) = a4;
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  id v102 = (char *)&v94 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin();
  unint64_t v16 = (char *)&v94 - v15;
  uint64_t v17 = static Logger.podcastsStatesCoordination.getter(v14);
  os_log_type_t v18 = static os_log_type_t.default.getter(v17);
  id v19 = a1;
  id v20 = (os_log_s *)Logger.logObject.getter(v19);
  if (os_log_type_enabled(v20, v18))
  {
    unint64_t v97 = v16;
    uint64_t v95 = v12;
    LODWORD(v100) = v7;
    uint64_t v103 = v11;
    uint64_t v101 = v6;
    uint64_t v21 = swift_slowAlloc(52LL, -1LL);
    uint64_t v96 = swift_slowAlloc(160LL, -1LL);
    uint64_t v107 = v96;
    *(_DWORD *)uint64_t v21 = 136316163;
    v99 = a2;
    id v105 = a2;
    LODWORD(v98) = a3;
    LOBYTE(v106) = a3 & 1;
    uint64_t v22 = sub_100126450((uint64_t *)&unk_1002B6480);
    uint64_t v23 = String.init<A>(describing:)(&v105, v22);
    unint64_t v25 = v24;
    id v105 = (id)sub_100178E7C(v23, v24, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease(v25);
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v26 = PodcastsStateChangeOrigin.description.getter(v104);
    unint64_t v28 = v27;
    id v105 = (id)sub_100178E7C(v26, v27, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v21 + 14, v21 + 22);
    swift_bridgeObjectRelease(v28);
    *(_WORD *)(v21 + 22) = 2081;
    id v29 = [v19 title];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
      uint64_t v33 = v32;
    }

    else
    {
      uint64_t v31 = 0LL;
      uint64_t v33 = 0LL;
    }

    uint64_t v36 = v95;
    os_log_type_t v37 = v18;
    id v105 = (id)v31;
    uint64_t v106 = v33;
    uint64_t v38 = sub_100126450(&qword_1002B5820);
    uint64_t v39 = String.init<A>(describing:)(&v105, v38);
    unint64_t v41 = v40;
    id v105 = (id)sub_100178E7C(v39, v40, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v21 + 24, v21 + 32);

    swift_bridgeObjectRelease(v41);
    *(_WORD *)(v21 + 32) = 2080;
    id v42 = [v19 uuid];
    uint64_t v43 = v97;
    if (v42)
    {
      char v44 = v42;
      uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
      uint64_t v7 = v46;
    }

    else
    {
      uint64_t v45 = 0LL;
      uint64_t v7 = 0LL;
    }

    id v105 = (id)v45;
    uint64_t v106 = v7;
    uint64_t v47 = String.init<A>(describing:)(&v105, v38);
    unint64_t v49 = v48;
    id v105 = (id)sub_100178E7C(v47, v48, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v21 + 34, v21 + 42);

    swift_bridgeObjectRelease(v49);
    *(_WORD *)(v21 + 42) = 2081;
    id v105 = [v19 storeTrackId];
    uint64_t v50 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
    unint64_t v52 = v51;
    id v105 = (id)sub_100178E7C(v50, v51, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v21 + 44, v21 + 52);

    swift_bridgeObjectRelease(v52);
    _os_log_impl( (void *)&_mh_execute_header,  v20,  v37,  "Bookmarking episode on timestamp %s (origin: %s): %{private}s, uuid: %s, adamID: %{private}s.",  (uint8_t *)v21,  0x34u);
    uint64_t v53 = v96;
    swift_arrayDestroy(v96, 5LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v53, -1LL, -1LL);
    swift_slowDealloc(v21, -1LL, -1LL);

    double v54 = v43;
    id v34 = *(void (**)(char *, uint64_t))(v36 + 8);
    uint64_t v11 = v103;
    v34(v54, v103);
    uint64_t v35 = v101;
    LOBYTE(v7) = v100;
    a2 = v99;
    if ((v98 & 1) != 0) {
      goto LABEL_11;
    }
LABEL_5:
    [v19 markAsBookmarkedOnTimestamp:*(double *)&a2];
    goto LABEL_12;
  }

  id v34 = *(void (**)(char *, uint64_t))(v12 + 8);
  v34(v16, v11);
  uint64_t v35 = v6;
  if ((a3 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_11:
  [v19 markAsBookmarked];
LABEL_12:
  id v55 = [v19 podcast];
  if (v55)
  {
    unint64_t v56 = v55;
    id v57 = [v19 bookmarksSyncType];
    sub_10014F148(v56, (uint64_t)v57, 2, v104);
  }

  if ((v7 & 1) != 0)
  {
    id v58 = [v19 uuid];
    if (v58)
    {
      unint64_t v59 = v58;
      uint64_t v103 = v11;
      uint64_t v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
      unint64_t v62 = v61;

      id v63 = [v19 managedObjectContext];
      if (v63)
      {
        uint64_t v64 = v63;
        if (([v19 isDownloaded] & 1) == 0)
        {
          id v65 = [v19 isEntitled];
          if ((_DWORD)v65)
          {
            uint64_t v66 = v102;
            uint64_t v67 = static Logger.podcastsStatesCoordination.getter(v65);
            os_log_type_t v68 = static os_log_type_t.default.getter(v67);
            id v69 = v19;
            uint64_t v70 = (os_log_s *)Logger.logObject.getter(v69);
            if (os_log_type_enabled(v70, v68))
            {
              uint64_t v101 = v35;
              uint64_t v71 = swift_slowAlloc(32LL, -1LL);
              uint64_t v72 = swift_slowAlloc(96LL, -1LL);
              uint64_t v107 = v72;
              *(_DWORD *)uint64_t v71 = 136381187;
              id v73 = [v69 title];
              v99 = v34;
              uint64_t v100 = v60;
              uint64_t v98 = v72;
              if (v73)
              {
                double v74 = v73;
                uint64_t v75 = static String._unconditionallyBridgeFromObjectiveC(_:)(v73);
                uint64_t v77 = v76;
              }

              else
              {
                uint64_t v75 = 0LL;
                uint64_t v77 = 0LL;
              }

              id v105 = (id)v75;
              uint64_t v106 = v77;
              uint64_t v78 = sub_100126450(&qword_1002B5820);
              uint64_t v79 = String.init<A>(describing:)(&v105, v78);
              unint64_t v81 = v80;
              id v105 = (id)sub_100178E7C(v79, v80, &v107);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v71 + 4, v71 + 12);

              swift_bridgeObjectRelease(v81);
              *(_WORD *)(v71 + 12) = 2080;
              id v82 = [v69 uuid];
              if (v82)
              {
                v83 = v82;
                uint64_t v84 = static String._unconditionallyBridgeFromObjectiveC(_:)(v82);
                uint64_t v86 = v85;
              }

              else
              {
                uint64_t v84 = 0LL;
                uint64_t v86 = 0LL;
              }

              id v105 = (id)v84;
              uint64_t v106 = v86;
              uint64_t v87 = String.init<A>(describing:)(&v105, v78);
              unint64_t v89 = v88;
              id v105 = (id)sub_100178E7C(v87, v88, &v107);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v71 + 14, v71 + 22);

              swift_bridgeObjectRelease(v89);
              *(_WORD *)(v71 + 22) = 2081;
              id v105 = [v69 storeTrackId];
              uint64_t v90 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
              unint64_t v92 = v91;
              id v105 = (id)sub_100178E7C(v90, v91, &v107);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106, v71 + 24, v71 + 32);

              swift_bridgeObjectRelease(v92);
              _os_log_impl( (void *)&_mh_execute_header,  v70,  v68,  "Automatically downloading recently saved episode %{private}s uuid: %s, adamID: %{private}s.",  (uint8_t *)v71,  0x20u);
              uint64_t v93 = v98;
              swift_arrayDestroy(v98, 3LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v93, -1LL, -1LL);
              swift_slowDealloc(v71, -1LL, -1LL);

              v99(v102, v103);
              uint64_t v60 = v100;
            }

            else
            {

              v34(v66, v103);
            }

            PodcastsStateCoordinator.downloadEpisode(withUUID:isFromSaving:from:in:)(v60, v62, 1, v104, v64);
          }
        }

        swift_bridgeObjectRelease(v62);
      }

      else
      {
        swift_bridgeObjectRelease(v62);
      }
    }
  }

void PodcastsStateCoordinator.unsafeBookmark(episode:on:shouldDownloadEpisode:from:)( void *a1, int a2, uint64_t a3, double a4)
{
}

void PodcastsStateCoordinator.unsafeRemoveEpisodeFromBookmarks(episode:from:)(void *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin();
  id v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = static Logger.podcastsStatesCoordination.getter(v7);
  os_log_type_t v11 = static os_log_type_t.default.getter(v10);
  id v12 = a1;
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  if (os_log_type_enabled(v13, v11))
  {
    uint64_t v44 = v2;
    uint64_t v14 = swift_slowAlloc(42LL, -1LL);
    uint64_t v42 = swift_slowAlloc(128LL, -1LL);
    uint64_t v48 = v42;
    *(_DWORD *)uint64_t v14 = 136315907;
    uint64_t v45 = a2;
    uint64_t v15 = PodcastsStateChangeOrigin.description.getter(a2);
    unint64_t v17 = v16;
    id v46 = (id)sub_100178E7C(v15, v16, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v17);
    *(_WORD *)(v14 + 12) = 2081;
    id v18 = [v12 title];
    uint64_t v43 = v5;
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      uint64_t v22 = v21;
    }

    else
    {
      uint64_t v20 = 0LL;
      uint64_t v22 = 0LL;
    }

    id v46 = (id)v20;
    uint64_t v47 = v22;
    uint64_t v23 = sub_100126450(&qword_1002B5820);
    uint64_t v24 = String.init<A>(describing:)(&v46, v23);
    unint64_t v26 = v25;
    id v46 = (id)sub_100178E7C(v24, v25, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v14 + 14, v14 + 22);

    swift_bridgeObjectRelease(v26);
    *(_WORD *)(v14 + 22) = 2080;
    id v27 = [v12 uuid];
    if (v27)
    {
      unint64_t v28 = v27;
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      uint64_t v31 = v30;
    }

    else
    {
      uint64_t v29 = 0LL;
      uint64_t v31 = 0LL;
    }

    id v46 = (id)v29;
    uint64_t v47 = v31;
    uint64_t v32 = String.init<A>(describing:)(&v46, v23);
    unint64_t v34 = v33;
    id v46 = (id)sub_100178E7C(v32, v33, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v14 + 24, v14 + 32);

    swift_bridgeObjectRelease(v34);
    *(_WORD *)(v14 + 32) = 2081;
    id v46 = [v12 storeTrackId];
    uint64_t v35 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
    unint64_t v37 = v36;
    id v46 = (id)sub_100178E7C(v35, v36, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v14 + 34, v14 + 42);

    swift_bridgeObjectRelease(v37);
    _os_log_impl( (void *)&_mh_execute_header,  v13,  v11,  "Removing Bookmark for episode (origin: %s): %{private}s, uuid: %s, adamID: %{private}s.",  (uint8_t *)v14,  0x2Au);
    uint64_t v38 = v42;
    swift_arrayDestroy(v42, 4LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v43);
    a2 = v45;
  }

  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }

  [v12 markAsUnbookmarked];
  id v39 = [v12 podcast];
  if (v39)
  {
    unint64_t v40 = v39;
    sub_10014F148(v39, (uint64_t)[v12 bookmarksSyncType], 3, a2);
  }

BOOL sub_1001752B8()
{
  uint64_t v0 = EpisodeStateChanges.updated.getter();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRelease(v0);
  return v1 != 0;
}

uint64_t sub_1001752E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EpisodeStateChanges.updated.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100175310()
{
  uint64_t v0 = sub_100126450(&qword_1002B6650);
  uint64_t v1 = sub_1001342BC(&qword_1002B6770, &qword_1002B6650, (uint64_t)&protocol conformance descriptor for [A : B].Keys);
  return Sequence.publisher.getter(v0, v1);
}

void sub_100175384(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_1001753DC(a1);
  }

uint64_t sub_1001753DC(uint64_t a1)
{
  uint64_t v93 = (char *)&v82 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for PodcastStateModel(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v88 = v5;
  unint64_t v89 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin();
  uint64_t v96 = (char *)&v82 - v6;
  uint64_t v7 = type metadata accessor for EpisodeStateModel(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v90 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin();
  os_log_type_t v11 = (char *)&v82 - v10;
  __chkstk_darwin();
  uint64_t v13 = (char *)&v82 - v12;
  unint64_t v97 = (void *)type metadata accessor for Logger(0LL);
  uint64_t v92 = *(v97 - 1);
  __chkstk_darwin();
  unint64_t v91 = (char *)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin();
  unint64_t v17 = (char *)&v82 - v16;
  uint64_t v18 = static Logger.podcastsStatesCoordination.getter(v15);
  os_log_type_t v19 = static os_log_type_t.default.getter(v18);
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v20(v13, a1, v7);
  uint64_t v94 = a1;
  uint64_t v86 = (uint64_t (*)(char *, uint64_t, uint64_t))v20;
  uint64_t v21 = ((uint64_t (*)(char *, uint64_t, uint64_t))v20)(v11, a1, v7);
  uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  BOOL v23 = os_log_type_enabled(v22, v19);
  uint64_t v95 = v4;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc(18LL, -1LL);
    int v84 = v19;
    uint64_t v25 = v24;
    uint64_t v85 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v85;
    *(_DWORD *)uint64_t v25 = 136380931;
    uint64_t v82 = v25 + 4;
    os_log_t v83 = v22;
    uint64_t v26 = ((uint64_t (*)(void))EpisodeStateModel.ids.getter)();
    unint64_t v27 = sub_10017C104();
    uint64_t v28 = Set.description.getter(v26, &type metadata for EpisodeStateIdentifier, v27);
    uint64_t v29 = v3;
    unint64_t v31 = v30;
    swift_bridgeObjectRelease(v26);
    uint64_t v100 = sub_100178E7C(v28, v31, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v82, v25 + 12);
    unint64_t v32 = v31;
    uint64_t v3 = v29;
    uint64_t v4 = v95;
    swift_bridgeObjectRelease(v32);
    unint64_t v33 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    uint64_t v34 = v33(v13, v7);
    *(_WORD *)(v25 + 12) = 1024;
    int v35 = EpisodeStateModel.isDownloaded.getter(v34) & 1;
    v33(v11, v7);
    LODWORD(v100) = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, (char *)&v100 + 4, v25 + 14, v25 + 18);
    uint64_t v22 = v83;
    _os_log_impl( (void *)&_mh_execute_header,  v83,  (os_log_type_t)v84,  "Update on download state of episode with IDs: %{private}s; isDownloaded: %{BOOL}d.",
      (uint8_t *)v25,
      0x12u);
    uint64_t v36 = v85;
    swift_arrayDestroy(v85, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1LL, -1LL);
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  else
  {
    unint64_t v33 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    v33(v11, v7);
    v33(v13, v7);
  }

  unint64_t v37 = *(uint64_t (**)(char *, void *))(v92 + 8);
  uint64_t v38 = v37(v17, v97);
  uint64_t v39 = (uint64_t)v93;
  uint64_t v40 = v94;
  BOOL v41 = (EpisodeStateModel.isDownloaded.getter(v38) & 1) == 0;
  EpisodeStateModel.podcastStateModel.getter();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v39, 1LL, v3) == 1)
  {
    uint64_t v42 = sub_100151AE4(v39);
    uint64_t v43 = v91;
    static Logger.podcastsStatesCoordination.getter(v42);
    uint64_t v44 = v90;
    uint64_t v45 = v86(v90, v40, v7);
    id v46 = (os_log_s *)Logger.logObject.getter(v45);
    os_log_type_t v47 = static os_log_type_t.error.getter(v46);
    int v48 = v47;
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v49 = swift_slowAlloc(22LL, -1LL);
      uint64_t v95 = v7;
      uint64_t v50 = v49;
      uint64_t v96 = (char *)swift_slowAlloc(64LL, -1LL);
      aBlock[0] = (uint64_t)v96;
      *(_DWORD *)uint64_t v50 = 136315395;
      LODWORD(v94) = v48;
      sub_1001514D0(v41, 4);
      unint64_t v52 = v51;
      uint64_t v100 = sub_100178E7C(v53, v51, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v50 + 4, v50 + 12);
      uint64_t v54 = swift_bridgeObjectRelease(v52);
      *(_WORD *)(v50 + 12) = 2081;
      uint64_t v55 = EpisodeStateModel.ids.getter(v54);
      unint64_t v56 = sub_10017C104();
      uint64_t v57 = Set.description.getter(v55, &type metadata for EpisodeStateIdentifier, v56);
      id v58 = v44;
      unint64_t v60 = v59;
      swift_bridgeObjectRelease(v55);
      uint64_t v100 = sub_100178E7C(v57, v60, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v50 + 14, v50 + 22);
      swift_bridgeObjectRelease(v60);
      v33(v58, v95);
      _os_log_impl( (void *)&_mh_execute_header,  v46,  (os_log_type_t)v94,  "We can't process event %s because episode has no Podcast associated to it. Episode IDs: %{private}s.",  (uint8_t *)v50,  0x16u);
      unint64_t v61 = v96;
      swift_arrayDestroy(v96, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v61, -1LL, -1LL);
      swift_slowDealloc(v50, -1LL, -1LL);

      unint64_t v62 = v91;
    }

    else
    {
      v33(v44, v7);

      unint64_t v62 = v43;
    }

    return v37(v62, v97);
  }

  else
  {
    id v63 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 32);
    uint64_t v64 = v96;
    v63(v96, v39, v3);
    uint64_t v65 = v87;
    unint64_t v97 =  [*(id *)(v87 + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider) mainOrPrivateContext];
    uint64_t v66 = *(void *)(v65 + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateTransitions);
    uint64_t v67 = swift_allocObject(&unk_1002487B8, 24LL, 7LL);
    swift_weakInit(v67 + 16, v66);
    BOOL v68 = v41;
    id v69 = v89;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v89, v64, v3);
    uint64_t v70 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v71 = (v70 + 24) & ~v70;
    uint64_t v72 = v3;
    unint64_t v73 = (v88 + v71 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v74 = (v73 + 31) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v75 = swift_allocObject(&unk_1002487E0, v74 + 8, v70 | 7);
    *(void *)(v75 + 16) = v67;
    v63((char *)(v75 + v71), (uint64_t)v69, v72);
    uint64_t v76 = v97;
    *(void *)(v75 + v73) = v97;
    unint64_t v77 = v75 + ((v73 + 15) & 0xFFFFFFFFFFFFFFF8LL);
    *(void *)unint64_t v77 = v68;
    *(_BYTE *)(v77 + 8) = 4;
    *(void *)(v75 + v74) = 3LL;
    aBlock[4] = (uint64_t)sub_10017C204;
    uint64_t v99 = v75;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_10013D2D8;
    aBlock[3] = (uint64_t)&unk_1002487F8;
    uint64_t v78 = _Block_copy(aBlock);
    uint64_t v79 = v99;
    id v80 = v76;
    swift_release(v79);
    [v80 performBlockAndWaitWithSave:v78];
    _Block_release(v78);

    return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v96, v72);
  }

void sub_100175B30(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (void *)type metadata accessor for Logger(0LL);
  uint64_t v10 = *(v9 - 1);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [a1 episodeForUuid:v13];

  if (v14)
  {
    id v16 = [v14 podcast];
    if (v16)
    {
      id v23 = v16;
      sub_10014F148(v16, 0LL, 4, a5);

      return;
    }
  }

  static Logger.podcastsStatesCoordination.getter(v15);
  uint64_t v17 = swift_bridgeObjectRetain_n(a3, 2LL);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.error.getter(v18);
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v21 = swift_slowAlloc(32LL, -1LL);
    uint64_t v25 = v21;
    id v23 = v9;
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_bridgeObjectRetain(a3);
    uint64_t v24 = sub_100178E7C(a2, a3, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease_n(a3, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "Can't transition podcast to correct state because either the episode for %s was not found, or it has no associated podcast.",  v20,  0xCu);
    swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);

    (*(void (**)(char *, id))(v10 + 8))(v12, v23);
  }

  else
  {

    swift_bridgeObjectRelease_n(a3, 2LL);
    (*(void (**)(char *, void *))(v10 + 8))(v12, v9);
  }

unint64_t sub_100175DA0@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v96 = a3;
  uint64_t v97 = a4;
  unint64_t v91 = a5;
  id v92 = a1;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin();
  uint64_t v11 = (char *)v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = static Logger.podcastsStatesCoordination.getter(v9);
  NSString v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.default.getter(v13);
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Transitioning podcasts to download state", v15, 2u);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  unint64_t result = NSManagedObjectContext.episodes(for:sortDescriptors:limit:)(a2, _swiftEmptyArrayStorage, 0LL, 1LL);
  if (v5) {
    return result;
  }
  uint64_t isUniquelyReferenced_nonNull_native = result;
  v89[2] = 0LL;
  if (result >> 62) {
    goto LABEL_91;
  }
  uint64_t v18 = *(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(result);
  while (1)
  {
    uint64_t v99 = isUniquelyReferenced_nonNull_native;
    uint64_t v95 = v18;
    if (!v18) {
      break;
    }
    unint64_t v98 = isUniquelyReferenced_nonNull_native & 0xC000000000000001LL;
    uint64_t v19 = (uint64_t)&_swiftEmptyDictionarySingleton;
    uint64_t v20 = 4LL;
    while (1)
    {
      id v21 = v98
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v20 - 4, isUniquelyReferenced_nonNull_native)
          : *(id *)(isUniquelyReferenced_nonNull_native + 8 * v20);
      uint64_t v22 = v21;
      uint64_t v23 = v20 - 3;
      if (__OFADD__(v20 - 4, 1LL)) {
        break;
      }
      id v24 = [v21 podcast];
      if (v24)
      {
        uint64_t v25 = v24;
        id v26 = [v24 objectID];
        if ((v19 & 0xC000000000000001LL) != 0)
        {
          if (v19 < 0) {
            uint64_t v27 = v19;
          }
          else {
            uint64_t v27 = v19 & 0xFFFFFFFFFFFFFF8LL;
          }
          id v28 = v25;
          uint64_t v29 = __CocoaDictionary.count.getter(v27);
          if (__OFADD__(v29, 1LL)) {
            goto LABEL_88;
          }
          Swift::Int v30 = sub_10017954C(v27, v29 + 1);
        }

        else
        {
          id v31 = v25;
          Swift::Int v30 = v19;
        }

        Swift::Int v32 = v30;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v30);
        uint64_t v101 = (void *)v32;
        unint64_t v34 = sub_10015F188((uint64_t)v26);
        uint64_t v35 = *(void *)(v32 + 16);
        BOOL v36 = (v33 & 1) == 0;
        uint64_t v37 = v35 + v36;
        if (__OFADD__(v35, v36)) {
          goto LABEL_87;
        }
        char v38 = v33;
        if (*(void *)(v32 + 24) >= v37)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_10015BD54();
          }
        }

        else
        {
          sub_10015B09C(v37, isUniquelyReferenced_nonNull_native);
          unint64_t v39 = sub_10015F188((uint64_t)v26);
          if ((v38 & 1) != (v40 & 1)) {
            goto LABEL_96;
          }
          unint64_t v34 = v39;
        }

        BOOL v41 = v101;
        if ((v38 & 1) != 0)
        {
          uint64_t v19 = (uint64_t)v101;
          uint64_t v42 = v101[7];

          *(void *)(v42 + 8 * v34) = v25;
        }

        else
        {
          v101[(v34 >> 6) + 8] |= 1LL << v34;
          *(void *)(v41[6] + 8 * v34) = v26;
          *(void *)(v41[7] + 8 * v34) = v25;
          uint64_t v43 = v41[2];
          BOOL v44 = __OFADD__(v43, 1LL);
          uint64_t v45 = v43 + 1;
          if (v44) {
            goto LABEL_89;
          }
          uint64_t v19 = (uint64_t)v41;
          v41[2] = v45;
          id v46 = v26;
        }

        swift_bridgeObjectRelease(0x8000000000000000LL);
        uint64_t isUniquelyReferenced_nonNull_native = v99;
        uint64_t v18 = v95;
      }

      else
      {
      }

      ++v20;
      if (v23 == v18) {
        goto LABEL_34;
      }
    }

    __break(1u);
LABEL_87:
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    if (isUniquelyReferenced_nonNull_native < 0) {
      uint64_t v87 = isUniquelyReferenced_nonNull_native;
    }
    else {
      uint64_t v87 = isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(isUniquelyReferenced_nonNull_native, 2LL);
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter(v87);
    swift_bridgeObjectRelease(isUniquelyReferenced_nonNull_native);
  }

  uint64_t v19 = (uint64_t)&_swiftEmptyDictionarySingleton;
LABEL_34:
  uint64_t v90 = v19;
  swift_bridgeObjectRelease(isUniquelyReferenced_nonNull_native);
  uint64_t v47 = v90;
  if ((v90 & 0xC000000000000001LL) != 0)
  {
    if (v90 < 0) {
      uint64_t v48 = v90;
    }
    else {
      uint64_t v48 = v90 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v49 = __CocoaDictionary.makeIterator()(v48);
    uint64_t v47 = v90;
    unint64_t v98 = 0LL;
    uint64_t v50 = 0LL;
    unint64_t v51 = 0LL;
    unint64_t v52 = v49 | 0x8000000000000000LL;
  }

  else
  {
    uint64_t v53 = -1LL << *(_BYTE *)(v90 + 32);
    uint64_t v50 = ~v53;
    uint64_t v54 = *(void *)(v90 + 64);
    unint64_t v98 = v90 + 64;
    uint64_t v55 = -v53;
    if (v55 < 64) {
      uint64_t v56 = ~(-1LL << v55);
    }
    else {
      uint64_t v56 = -1LL;
    }
    unint64_t v51 = v56 & v54;
    unint64_t v52 = v90;
  }

  __n128 v57 = swift_bridgeObjectRetain(v47);
  uint64_t v58 = 0LL;
  uint64_t v94 = v52 & 0x7FFFFFFFFFFFFFFFLL;
  v89[1] = v50;
  int64_t v59 = (unint64_t)(v50 + 64) >> 6;
  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)off_1002B6000;
  uint64_t v93 = (char *)&type metadata for Swift.AnyObject + 8;
  if ((v52 & 0x8000000000000000LL) == 0)
  {
LABEL_44:
    if (v51)
    {
      uint64_t v60 = (v51 - 1) & v51;
      unint64_t v61 = __clz(__rbit64(v51)) | (v58 << 6);
      uint64_t v62 = v58;
    }

    else
    {
      int64_t v68 = v58 + 1;
      if (__OFADD__(v58, 1LL)) {
        goto LABEL_90;
      }
      if (v68 >= v59) {
        goto LABEL_68;
      }
      unint64_t v69 = *(void *)(v98 + 8 * v68);
      uint64_t v62 = v58 + 1;
      if (!v69)
      {
        uint64_t v62 = v58 + 2;
        if (v58 + 2 >= v59) {
          goto LABEL_68;
        }
        unint64_t v69 = *(void *)(v98 + 8 * v62);
        if (!v69)
        {
          uint64_t v62 = v58 + 3;
          if (v58 + 3 >= v59) {
            goto LABEL_68;
          }
          unint64_t v69 = *(void *)(v98 + 8 * v62);
          if (!v69)
          {
            uint64_t v62 = v58 + 4;
            if (v58 + 4 >= v59) {
              goto LABEL_68;
            }
            unint64_t v69 = *(void *)(v98 + 8 * v62);
            if (!v69)
            {
              uint64_t v62 = v58 + 5;
              if (v58 + 5 >= v59) {
                goto LABEL_68;
              }
              unint64_t v69 = *(void *)(v98 + 8 * v62);
              if (!v69)
              {
                uint64_t v70 = v58 + 6;
                while (v59 != v70)
                {
                  unint64_t v69 = *(void *)(v98 + 8 * v70++);
                  if (v69)
                  {
                    uint64_t v62 = v70 - 1;
                    goto LABEL_64;
                  }
                }

                goto LABEL_68;
              }
            }
          }
        }
      }

void sub_1001764D4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = String._bridgeToObjectiveC()();
  id v11 = [a1 episodeForUuid:v7];

  if (v11)
  {
    id v8 = [v11 podcast];
    if (v8)
    {
      id v9 = v8;
      sub_10014F148(v8, 1LL, 4, a5);

      uint64_t v10 = v9;
    }

    else
    {
      uint64_t v10 = v11;
    }
  }

uint64_t sub_1001765A4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_100159544((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v66 = a1 + 56;
  uint64_t v9 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v10 = -1LL;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  unint64_t v11 = v10 & *(void *)(a1 + 56);
  int64_t v67 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  int64_t v12 = 0LL;
  NSString v13 = &selRef_derivedPropertiesForPodcast_;
  uint64_t v65 = a1;
  while (v11)
  {
    unint64_t v14 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v15 = v14 | (v12 << 6);
LABEL_21:
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 16 * v15 + 8);
    swift_bridgeObjectRetain(v19);
    NSString v20 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v19);
    id v21 = objc_msgSend(a2, v13[206], v20);

    if (v21)
    {
      id v22 = [v21 podcast];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = a3;
        uint64_t v25 = a4;
        id v26 = v13;
        id v27 = [v22 uuid];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
          uint64_t v63 = v30;
          uint64_t v64 = v29;

          id v62 = v23;
          unsigned int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
          unint64_t v32 = sub_10015F124(v64, v63);
          uint64_t v33 = *(void *)(v8 + 16);
          BOOL v34 = (v31 & 1) == 0;
          uint64_t v35 = v33 + v34;
          if (__OFADD__(v33, v34)) {
            goto LABEL_63;
          }
          if (*(void *)(v8 + 24) >= v35)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              char v60 = v31;
              sub_10015BEF8();
              char v31 = v60;
            }
          }

          else
          {
            char v59 = v31;
            sub_10015B36C(v35, isUniquelyReferenced_nonNull_native);
            unint64_t v36 = sub_10015F124(v64, v63);
            int v38 = v37 & 1;
            char v31 = v59;
            if ((v59 & 1) != v38) {
              goto LABEL_65;
            }
            unint64_t v32 = v36;
          }

          if ((v31 & 1) != 0)
          {
            uint64_t v39 = *(void *)(v8 + 56);
            uint64_t v40 = 8 * v32;

            *(void *)(v39 + v40) = v62;
            BOOL v41 = v62;
          }

          else
          {
            *(void *)(v8 + 8 * (v32 >> 6) + 64) |= 1LL << v32;
            uint64_t v42 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v32);
            *uint64_t v42 = v64;
            v42[1] = v63;
            BOOL v41 = v62;
            *(void *)(*(void *)(v8 + 56) + 8 * v32) = v62;
            uint64_t v43 = *(void *)(v8 + 16);
            BOOL v44 = __OFADD__(v43, 1LL);
            uint64_t v45 = v43 + 1;
            if (v44) {
              goto LABEL_64;
            }
            *(void *)(v8 + 16) = v45;
            swift_bridgeObjectRetain(v63);
          }

          swift_bridgeObjectRelease(v63);
          swift_bridgeObjectRelease(0x8000000000000000LL);
          NSString v13 = v26;
          a4 = v25;
          a3 = v24;
          a1 = v65;
        }

        else
        {

          a4 = v25;
          a3 = v24;
          a1 = v65;
        }
      }

      else
      {
      }
    }
  }

  int64_t v16 = v12 + 1;
  if (__OFADD__(v12, 1LL))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }

  if (v16 >= v67) {
    goto LABEL_36;
  }
  unint64_t v17 = *(void *)(v66 + 8 * v16);
  ++v12;
  if (v17) {
    goto LABEL_20;
  }
  int64_t v12 = v16 + 1;
  if (v16 + 1 >= v67) {
    goto LABEL_36;
  }
  unint64_t v17 = *(void *)(v66 + 8 * v12);
  if (v17) {
    goto LABEL_20;
  }
  int64_t v12 = v16 + 2;
  if (v16 + 2 >= v67) {
    goto LABEL_36;
  }
  unint64_t v17 = *(void *)(v66 + 8 * v12);
  if (v17)
  {
LABEL_20:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
    goto LABEL_21;
  }

  int64_t v18 = v16 + 3;
  if (v18 < v67)
  {
    unint64_t v17 = *(void *)(v66 + 8 * v18);
    if (!v17)
    {
      while (1)
      {
        int64_t v12 = v18 + 1;
        if (__OFADD__(v18, 1LL)) {
          break;
        }
        if (v12 >= v67) {
          goto LABEL_36;
        }
        unint64_t v17 = *(void *)(v66 + 8 * v12);
        ++v18;
        if (v17) {
          goto LABEL_20;
        }
      }

LABEL_61:
      __break(1u);
      goto LABEL_62;
    }

    int64_t v12 = v18;
    goto LABEL_20;
  }

void PodcastsStateCoordinator.removeDownload(forEpisodeWithUUID:from:shouldAllowAutomaticRedownloads:completionHandler:)( uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = type metadata accessor for Logger(0LL);
  uint64_t v39 = *(void *)(v14 - 8);
  uint64_t v40 = v14;
  uint64_t v15 = __chkstk_darwin();
  unint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = static Logger.podcastsStatesCoordination.getter(v15);
  os_log_type_t v19 = static os_log_type_t.default.getter(v18);
  uint64_t v20 = swift_bridgeObjectRetain_n(a2, 2LL);
  id v21 = (os_log_s *)Logger.logObject.getter(v20);
  if (os_log_type_enabled(v21, v19))
  {
    uint64_t v22 = swift_slowAlloc(22LL, -1LL);
    uint64_t v38 = a1;
    uint64_t v23 = v22;
    uint64_t v24 = swift_slowAlloc(64LL, -1LL);
    int v37 = a4;
    uint64_t v35 = v24;
    aBlock[0] = v24;
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v25 = PodcastsStateChangeOrigin.description.getter(a3);
    unint64_t v27 = v26;
    uint64_t v41 = sub_100178E7C(v25, v26, aBlock);
    uint64_t v36 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, aBlock, v23 + 4, v23 + 12);
    swift_bridgeObjectRelease(v27);
    *(_WORD *)(v23 + 12) = 2080;
    swift_bridgeObjectRetain(a2);
    uint64_t v41 = sub_100178E7C(v38, a2, aBlock);
    uint64_t v7 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, aBlock, v23 + 14, v23 + 22);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v21,  v19,  "Removing download (origin: %s) for episode with UUID: %s.",  (uint8_t *)v23,  0x16u);
    uint64_t v28 = v35;
    swift_arrayDestroy(v35, 2LL, (char *)&type metadata for Any + 8);
    LOBYTE(a4) = v37;
    swift_slowDealloc(v28, -1LL, -1LL);
    swift_slowDealloc(v23, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  (*(void (**)(char *, uint64_t))(v39 + 8))(v17, v40);
  uint64_t v29 = *(void **)(v7 + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_downloadsGateway);
  NSString v30 = String._bridgeToObjectiveC()();
  uint64_t v31 = swift_allocObject(&unk_100248650, 32LL, 7LL);
  *(void *)(v31 + 16) = a5;
  *(void *)(v31 + 24) = a6;
  aBlock[4] = (uint64_t)sub_10017ABD4;
  uint64_t v43 = v31;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_100176E0C;
  aBlock[3] = (uint64_t)&unk_100248668;
  unint64_t v32 = _Block_copy(aBlock);
  uint64_t v33 = v43;
  sub_10013397C(a5, a6);
  swift_release(v33);
  [v29 removeDownload:v30 shouldAllowAutomaticRedownloads:a4 & 1 completion:v32];
  _Block_release(v32);
}

void sub_100176D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  id v6 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
  [v6 postNotificationName:PFMediaDownloadWasDeletedNotification object:0];

  if (a5) {
    a5();
  }
}

uint64_t sub_100176E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v8 = v7;
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v10;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  swift_retain(v4);
  v5(v6, v8, v9, a3);
  swift_release(v4);
  swift_bridgeObjectRelease(v8);
  return swift_bridgeObjectRelease(a3);
}

uint64_t PodcastsStateCoordinator.insertNewImplicitFollowIfNeeded(for:from:completion:)( void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for PodcastPlayerItem(0LL);
  __chkstk_darwin();
  unint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for PlayerItem(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v16 = a1;
  sub_10016635C(v16);
  id v17 = v16;
  sub_1001664A4(v17, (uint64_t)v9);
  PlayerItem.init(podcast:episode:)(v11, v9);

  PodcastsStateCoordinator.insertNewImplicitFollowIfNeeded(for:from:completion:)((uint64_t)v15, a2, a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_100177164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a3)
  {
    NSString v9 = 0LL;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v10 = 0LL;
    goto LABEL_6;
  }

  NSString v9 = String._bridgeToObjectiveC()();
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v10 = String._bridgeToObjectiveC()();
LABEL_6:
  id v11 = v10;
  (*(void (**)(uint64_t, uint64_t, NSString))(a6 + 16))(a6, a1, v9);
}

void sub_1001771FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v85 = a2;
  uint64_t v86 = a3;
  uint64_t v87 = a4;
  uint64_t v77 = type metadata accessor for EpisodePlayerItem(0LL);
  uint64_t v75 = *(void *)(v77 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for PlayerItem(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  unint64_t v83 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin();
  id v11 = (char *)&v69 - v10;
  __chkstk_darwin();
  uint64_t v13 = (char *)&v69 - v12;
  uint64_t v78 = v14;
  __chkstk_darwin();
  id v16 = (char *)&v69 - v15;
  uint64_t v17 = type metadata accessor for Logger(0LL);
  uint64_t v81 = *(void *)(v17 - 8);
  uint64_t v18 = __chkstk_darwin();
  uint64_t v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = static Logger.podcastsStatesCoordination.getter(v18);
  os_log_type_t v22 = static os_log_type_t.default.getter(v21);
  uint64_t v88 = v8;
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v23(v16, a1, v7);
  v23(v13, a1, v7);
  uint64_t v80 = v11;
  uint64_t v82 = v23;
  uint64_t v24 = ((uint64_t (*)(char *, uint64_t, uint64_t))v23)(v11, a1, v7);
  uint64_t v79 = v20;
  int v25 = v22;
  id v76 = (os_log_s *)Logger.logObject.getter(v24);
  if (os_log_type_enabled(v76, v22))
  {
    uint64_t v26 = swift_slowAlloc(32LL, -1LL);
    uint64_t v27 = swift_slowAlloc(64LL, -1LL);
    uint64_t v73 = v27;
    uint64_t v89 = v27;
    *(_DWORD *)uint64_t v26 = 136381187;
    int v72 = v25;
    uint64_t v28 = PlayerItem.episode.getter(v27);
    uint64_t v29 = EpisodePlayerItem.title.getter(v28);
    uint64_t v74 = v17;
    uint64_t v31 = v30;
    unint64_t v32 = *(void (**)(char *, uint64_t))(v75 + 8);
    v32(v6, v77);
    uint64_t aBlock = v29;
    v91[0] = v31;
    uint64_t v71 = sub_100126450(&qword_1002B5820);
    uint64_t v75 = a1;
    uint64_t v33 = String.init<A>(describing:)(&aBlock, v71);
    unint64_t v35 = v34;
    uint64_t aBlock = sub_100178E7C(v33, v34, &v89);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v91, v26 + 4, v26 + 12);
    swift_bridgeObjectRelease(v35);
    uint64_t v36 = *(uint64_t (**)(char *, uint64_t))(v88 + 8);
    uint64_t v37 = v36(v16, v7);
    uint64_t v70 = (void (*)(char *, uint64_t))v36;
    *(_WORD *)(v26 + 12) = 2049;
    uint64_t v38 = PlayerItem.episode.getter(v37);
    uint64_t v39 = EpisodePlayerItem.adamID.getter(v38);
    uint64_t v40 = v77;
    v32(v6, v77);
    v36(v13, v7);
    uint64_t aBlock = v39;
    uint64_t v41 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v91, v26 + 14, v26 + 22);
    *(_WORD *)(v26 + 22) = 2081;
    uint64_t v42 = v76;
    uint64_t v43 = v80;
    uint64_t v44 = PlayerItem.episode.getter(v41);
    uint64_t v45 = EpisodePlayerItem.guid.getter(v44);
    uint64_t v47 = v46;
    v32(v6, v40);
    uint64_t aBlock = v45;
    v91[0] = v47;
    uint64_t v48 = String.init<A>(describing:)(&aBlock, v71);
    unint64_t v50 = v49;
    uint64_t aBlock = sub_100178E7C(v48, v49, &v89);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v91, v26 + 24, v26 + 32);
    swift_bridgeObjectRelease(v50);
    v70(v43, v7);
    a1 = v75;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  (os_log_type_t)v72,  "Inserting new Implicit Follow if needed for currently playing episode: %{private}s, adamID: %{private}lld, guid: %{private}s.",  (uint8_t *)v26,  0x20u);
    uint64_t v51 = v73;
    swift_arrayDestroy(v73, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1LL, -1LL);
    swift_slowDealloc(v26, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v81 + 8))(v79, v74);
  }

  else
  {
    unint64_t v52 = *(void (**)(char *, uint64_t))(v88 + 8);
    v52(v13, v7);
    v52(v16, v7);
    v52(v80, v7);

    (*(void (**)(char *, uint64_t))(v81 + 8))(v79, v17);
  }

  uint64_t v53 = v84;
  id v54 =  [*(id *)(v84 + OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider) privateQueueContext];
  uint64_t v55 = swift_allocObject(&unk_100248470, 24LL, 7LL);
  swift_unknownObjectWeakInit(v55 + 16, v53);
  unint64_t v56 = v83;
  v82(v83, a1, v7);
  uint64_t v57 = v88;
  uint64_t v58 = *(unsigned __int8 *)(v88 + 80);
  uint64_t v59 = (v58 + 32) & ~v58;
  unint64_t v60 = (v78 + v59 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v61 = (v60 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v62 = swift_allocObject(&unk_100248768, v61 + 16, v58 | 7);
  *(void *)(v62 + 16) = v55;
  *(void *)(v62 + 24) = v54;
  (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v62 + v59, v56, v7);
  uint64_t v63 = v86;
  *(void *)(v62 + v60) = v85;
  uint64_t v64 = (void *)(v62 + v61);
  uint64_t v65 = v87;
  *uint64_t v64 = v63;
  v64[1] = v65;
  v91[3] = sub_10017C0B0;
  uint64_t v92 = v62;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  v91[0] = 1107296256LL;
  v91[1] = sub_10013D2D8;
  v91[2] = &unk_100248780;
  uint64_t v66 = _Block_copy(&aBlock);
  uint64_t v67 = v92;
  id v68 = v54;
  swift_retain(v65);
  swift_release(v67);
  [v68 performBlock:v66];
  _Block_release(v66);
}

void PodcastsStateCoordinator.unsafeEpisodePlayedBeyondThresholdForFirstTime(_:from:)(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)type metadata accessor for Logger(0LL);
  uint64_t v5 = *(v4 - 1);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin();
  uint64_t v10 = (char *)&v56 - v9;
  if (!a1)
  {
    uint64_t v13 = static Logger.podcastsStatesCoordination.getter(v8);
    uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.error.getter(v14);
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      id v17 = (id)swift_slowAlloc(32LL, -1LL);
      id v59 = v17;
      *(_DWORD *)id v16 = 136315138;
      uint64_t v18 = PodcastsStateChangeOrigin.description.getter(a2);
      unint64_t v20 = v19;
      uint64_t v61 = sub_100178E7C(v18, v19, (uint64_t *)&v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v16 + 4, v16 + 12);
      swift_bridgeObjectRelease(v20);
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "We can't transition podcast for nil MTEpisode; Origin: %s.",
        v16,
        0xCu);
      swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1LL, -1LL);
      swift_slowDealloc(v16, -1LL, -1LL);
    }

    uint64_t v21 = *(void (**)(char *, void *))(v5 + 8);
    os_log_type_t v22 = v7;
    goto LABEL_11;
  }

  id v11 = a1;
  id v12 = [v11 podcast];
  if (v12)
  {
    id v58 = v12;
    sub_10014F148(v12, 5LL, 4, a2);

    return;
  }

  static Logger.podcastsStatesCoordination.getter(0LL);
  id v23 = v11;
  uint64_t v24 = (void *)Logger.logObject.getter(v23);
  int v25 = static os_log_type_t.error.getter(v24);
  if (!os_log_type_enabled((os_log_t)v24, (os_log_type_t)v25))
  {

    uint64_t v21 = *(void (**)(char *, void *))(v5 + 8);
    os_log_type_t v22 = v10;
LABEL_11:
    v21(v22, v4);
    return;
  }

  int v57 = v25;
  id v58 = v4;
  uint64_t v26 = swift_slowAlloc(42LL, -1LL);
  uint64_t v56 = swift_slowAlloc(128LL, -1LL);
  uint64_t v61 = v56;
  *(_DWORD *)uint64_t v26 = 136381443;
  id v27 = [v23 title];
  if (v27)
  {
    uint64_t v28 = v27;
    id v29 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
    uint64_t v31 = v30;
  }

  else
  {
    id v29 = 0LL;
    uint64_t v31 = 0LL;
  }

  id v59 = v29;
  uint64_t v60 = v31;
  uint64_t v32 = sub_100126450(&qword_1002B5820);
  uint64_t v33 = String.init<A>(describing:)(&v59, v32);
  unint64_t v35 = v34;
  id v59 = (id)sub_100178E7C(v33, v34, &v61);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v26 + 4, v26 + 12);

  swift_bridgeObjectRelease(v35);
  *(_WORD *)(v26 + 12) = 2080;
  id v36 = [v23 uuid];
  if (v36)
  {
    uint64_t v37 = v36;
    id v38 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
    uint64_t v40 = v39;
  }

  else
  {
    id v38 = 0LL;
    uint64_t v40 = 0LL;
  }

  id v59 = v38;
  uint64_t v60 = v40;
  uint64_t v41 = String.init<A>(describing:)(&v59, v32);
  unint64_t v43 = v42;
  id v59 = (id)sub_100178E7C(v41, v42, &v61);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v26 + 14, v26 + 22);

  swift_bridgeObjectRelease(v43);
  *(_WORD *)(v26 + 22) = 2081;
  id v59 = [v23 storeTrackId];
  uint64_t v44 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  unint64_t v46 = v45;
  id v59 = (id)sub_100178E7C(v44, v45, &v61);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v26 + 24, v26 + 32);

  swift_bridgeObjectRelease(v46);
  *(_WORD *)(v26 + 32) = 2081;
  id v47 = [v23 guid];
  if (v47)
  {
    uint64_t v48 = v47;
    id v49 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
    uint64_t v51 = v50;
  }

  else
  {
    id v49 = 0LL;
    uint64_t v51 = 0LL;
  }

  id v59 = v49;
  uint64_t v60 = v51;
  uint64_t v52 = String.init<A>(describing:)(&v59, v32);
  unint64_t v54 = v53;
  id v59 = (id)sub_100178E7C(v52, v53, &v61);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v26 + 34, v26 + 42);

  swift_bridgeObjectRelease(v54);
  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  (os_log_type_t)v57,  "We can't transition podcast. MTEpisode without an associated podcast: %{private}s, uuid: %s, adamID: %{private}s, gu id: %{private}s.",  (uint8_t *)v26,  0x2Au);
  uint64_t v55 = v56;
  swift_arrayDestroy(v56, 4LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v55, -1LL, -1LL);
  swift_slowDealloc(v26, -1LL, -1LL);

  (*(void (**)(char *, id))(v5 + 8))(v10, v58);
}

void PodcastsStateCoordinator.unsafeMark(_:as:in:from:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_100177E10( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void *), uint64_t a6)
{
  uint64_t v124 = a6;
  uint64_t v125 = a5;
  uint64_t v122 = a4;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v119 = *(void *)(v9 - 8);
  uint64_t v120 = v9;
  __chkstk_darwin();
  uint64_t v123 = (char *)&v112 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for PodcastPlayerItem(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v112 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for EpisodePlayerItem(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin();
  uint64_t v18 = (char *)&v112 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin();
  v121 = (char *)&v112 - v19;
  __chkstk_darwin();
  uint64_t v21 = (char *)&v112 - v20;
  a1 += 16LL;
  swift_beginAccess(a1, v130, 0LL, 0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(a1);
  unint64_t v126 = (char *)result;
  if (result)
  {
    uint64_t v23 = ((uint64_t (*)(void))PlayerItem.episode.getter)();
    uint64_t v24 = EpisodePlayerItem.adamID.getter(v23);
    int v25 = *(void (**)(char *, uint64_t))(v16 + 8);
    v25(v21, v15);
    id v26 = [a2 episodeForStoreTrackID:v24];
    uint64_t v117 = v25;
    uint64_t v118 = v15;
    if (v26)
    {
      uint64_t v116 = a3;
      id v27 = v26;
      uint64_t v28 = v123;
      static Logger.podcastsStatesCoordination.getter(v27);
      id v29 = v27;
      uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
      int v31 = static os_log_type_t.error.getter(v30);
      uint64_t v32 = &selRef_titleLabel;
      if (os_log_type_enabled(v30, (os_log_type_t)v31))
      {
        int v114 = v31;
        os_log_t v115 = v30;
        uint64_t v33 = swift_slowAlloc(42LL, -1LL);
        uint64_t v113 = swift_slowAlloc(128LL, -1LL);
        uint64_t v129 = v113;
        *(_DWORD *)uint64_t v33 = 136381443;
        id v34 = [v29 title];
        if (v34)
        {
          unint64_t v35 = v34;
          id v36 = a2;
          uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
          uint64_t v39 = v38;
        }

        else
        {
          id v36 = a2;
          uint64_t v37 = 0LL;
          uint64_t v39 = 0LL;
        }

        id v127 = (id)v37;
        uint64_t v128 = v39;
        uint64_t v71 = sub_100126450(&qword_1002B5820);
        uint64_t v72 = String.init<A>(describing:)(&v127, v71);
        unint64_t v74 = v73;
        id v127 = (id)sub_100178E7C(v72, v73, &v129);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v33 + 4, v33 + 12);

        swift_bridgeObjectRelease(v74);
        *(_WORD *)(v33 + 12) = 2080;
        id v75 = [v29 uuid];
        if (v75)
        {
          id v76 = v75;
          uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(v75);
          uint64_t v79 = v78;
        }

        else
        {
          uint64_t v77 = 0LL;
          uint64_t v79 = 0LL;
        }

        id v127 = (id)v77;
        uint64_t v128 = v79;
        uint64_t v80 = String.init<A>(describing:)(&v127, v71);
        unint64_t v82 = v81;
        id v127 = (id)sub_100178E7C(v80, v81, &v129);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v33 + 14, v33 + 22);

        swift_bridgeObjectRelease(v82);
        *(_WORD *)(v33 + 22) = 2081;
        id v127 = [v29 storeTrackId];
        uint64_t v83 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
        unint64_t v85 = v84;
        id v127 = (id)sub_100178E7C(v83, v84, &v129);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v33 + 24, v33 + 32);

        swift_bridgeObjectRelease(v85);
        *(_WORD *)(v33 + 32) = 2081;
        id v86 = [v29 guid];
        if (v86)
        {
          uint64_t v87 = v86;
          uint64_t v88 = static String._unconditionallyBridgeFromObjectiveC(_:)(v86);
          uint64_t v90 = v89;
        }

        else
        {
          uint64_t v88 = 0LL;
          uint64_t v90 = 0LL;
        }

        unint64_t v91 = v123;
        id v127 = (id)v88;
        uint64_t v128 = v90;
        uint64_t v92 = String.init<A>(describing:)(&v127, v71);
        unint64_t v94 = v93;
        id v127 = (id)sub_100178E7C(v92, v93, &v129);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v33 + 34, v33 + 42);

        swift_bridgeObjectRelease(v94);
        os_log_t v95 = v115;
        _os_log_impl( (void *)&_mh_execute_header,  v115,  (os_log_type_t)v114,  "Abort new Implicit Follow insertion: Episode already in the DB: %{private}s, uuid: %s, adamID: %{private}s, gu id: %{private}s.",  (uint8_t *)v33,  0x2Au);
        uint64_t v96 = v113;
        swift_arrayDestroy(v113, 4LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v96, -1LL, -1LL);
        swift_slowDealloc(v33, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v119 + 8))(v91, v120);
        uint64_t v32 = &selRef_titleLabel;
      }

      else
      {
        id v36 = a2;

        (*(void (**)(char *, uint64_t))(v119 + 8))(v28, v120);
      }

      id v97 = [v29 podcast];
      if (v97)
      {
        unint64_t v98 = v97;
        uint64_t v99 = *(void *)&v126[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateTransitions];
        swift_retain(v99);
        sub_10014F148(v98, 3LL, 4, v122);

        swift_release(v99);
      }

      id v100 = [v36 saveInCurrentBlock];
      uint64_t v101 = v121;
      uint64_t v102 = PlayerItem.episode.getter(v100);
      uint64_t v103 = EpisodePlayerItem.adamID.getter(v102);
      v117(v101, v118);
      id v104 = [v29 v32[321]];
      if (v104)
      {
        id v105 = v104;
        uint64_t v106 = static String._unconditionallyBridgeFromObjectiveC(_:)(v104);
        uint64_t v65 = v107;
      }

      else
      {
        uint64_t v106 = 0LL;
        uint64_t v65 = 0LL;
      }

      id v108 = [v29 podcast];
      uint64_t v70 = v108;
      if (v108)
      {
        id v109 = [v108 v32[321]];

        if (v109)
        {
          uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v109);
          uint64_t v70 = v111;
        }

        else
        {
          uint64_t v110 = 0LL;
          uint64_t v70 = 0LL;
        }
      }

      else
      {
        uint64_t v110 = 0LL;
      }

      v125(v103, v106, v65, v110, v70);
      id v54 = v126;
      uint64_t v56 = v29;
    }

    else
    {
      uint64_t v40 = PlayerItem.podcast.getter();
      uint64_t v41 = a2;
      uint64_t v42 = PodcastPlayerItem.adamID.getter(v40);
      unint64_t v43 = *(void (**)(char *, uint64_t))(v12 + 8);
      v43(v14, v11);
      uint64_t v123 = v41;
      id v44 = [v41 podcastForStoreId:v42];
      id v45 = v44;
      if (!v44)
      {
        uint64_t v46 = *(void *)&v126[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateCoordinatorPersistentStore
                             + 24];
        v121 = *(char **)&v126[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateCoordinatorPersistentStore
                             + 32];
        sub_1001361FC( &v126[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateCoordinatorPersistentStore],  v46);
        PlayerItem.podcast.getter();
        id v47 = (void *)dispatch thunk of PodcastsStateCoordinatorPersistentStoreProtocol.insertPodcastInStoreState(in:for:)( v123,  v14,  v46,  v121);
        v43(v14, v11);
        id v45 = v47;
      }

      uint64_t v48 = v126;
      uint64_t v49 = *(void *)&v126[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateTransitions];
      swift_retain(v49);
      id v50 = v44;
      sub_10014F148(v45, 3LL, 4, v122);

      swift_release(v49);
      uint64_t v51 = &v48[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateCoordinatorPersistentStore];
      uint64_t v52 = *(void *)&v48[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateCoordinatorPersistentStore
                          + 24];
      uint64_t v53 = *((void *)v51 + 4);
      sub_1001361FC(v51, v52);
      ((void (*)(void))PlayerItem.episode.getter)();
      id v54 = v45;
      uint64_t v55 = v123;
      uint64_t v56 = (void *)dispatch thunk of PodcastsStateCoordinatorPersistentStoreProtocol.insertEpisode(in:for:asPartOf:)( v123,  v21,  v45,  v52,  v53);

      id v58 = v117;
      uint64_t v57 = v118;
      v117(v21, v118);
      uint64_t v59 = PlayerItem.episode.getter([v55 saveInCurrentBlock]);
      uint64_t v60 = EpisodePlayerItem.adamID.getter(v59);
      v58(v18, v57);
      id v61 = [v56 uuid];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
        uint64_t v65 = v64;
      }

      else
      {
        uint64_t v63 = 0LL;
        uint64_t v65 = 0LL;
      }

      id v66 = [v54 uuid];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
        uint64_t v70 = v69;
      }

      else
      {
        uint64_t v68 = 0LL;
        uint64_t v70 = 0LL;
      }

      v125(v60, v63, v65, v68, v70);
      id v29 = v126;
    }

    swift_bridgeObjectRelease(v70);
    return swift_bridgeObjectRelease(v65);
  }

  return result;
}

uint64_t PodcastsStateCoordinator.unsafeDidBumpLastDatePlayed(for:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v57 - v12;
  uint64_t v14 = type metadata accessor for Podcasts(0LL);
  v66[3] = v14;
  v66[4] = sub_100127210( (unint64_t *)&qword_1002B66D0,  (uint64_t (*)(uint64_t))&type metadata accessor for Podcasts,  (uint64_t)&protocol conformance descriptor for Podcasts);
  uint64_t v15 = sub_10012761C(v66);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104LL))( v15,  enum case for Podcasts.simplifiedSyncDirtyHandling(_:),  v14);
  LOBYTE(v14) = isFeatureEnabled(_:)(v66);
  uint64_t v16 = sub_100136648(v66);
  if ((v14 & 1) != 0)
  {
    uint64_t v63 = v4;
    uint64_t v17 = v9;
    uint64_t v18 = static Logger.podcastsStatesCoordination.getter(v16);
    int v19 = static os_log_type_t.default.getter(v18);
    id v20 = a1;
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    int v64 = v19;
    if (os_log_type_enabled(v21, (os_log_type_t)v19))
    {
      os_log_t v59 = v21;
      uint64_t v60 = v5;
      uint64_t v62 = v8;
      uint64_t v22 = swift_slowAlloc(62LL, -1LL);
      uint64_t v57 = swift_slowAlloc(160LL, -1LL);
      v66[0] = v57;
      *(_DWORD *)uint64_t v22 = 136381955;
      id v23 = [v20 title];
      uint64_t v58 = v17;
      uint64_t v61 = v2;
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
        unint64_t v27 = v26;
      }

      else
      {
        unint64_t v27 = 0xEA00000000003E65LL;
        uint64_t v25 = 0x6C746974206F6E3CLL;
      }

      uint64_t v34 = v63;
      id v65 = (id)sub_100178E7C(v25, v27, v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v22 + 4, v22 + 12);

      swift_bridgeObjectRelease(v27);
      *(_WORD *)(v22 + 12) = 2080;
      id v35 = [v20 uuid];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
        unint64_t v39 = v38;
      }

      else
      {
        unint64_t v39 = 0xE700000000000000LL;
        uint64_t v37 = 0x3E7974706D653CLL;
      }

      id v65 = (id)sub_100178E7C(v37, v39, v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v22 + 14, v22 + 22);

      swift_bridgeObjectRelease(v39);
      *(_WORD *)(v22 + 22) = 2080;
      id v65 = [v20 managedObjectContext];
      uint64_t v40 = sub_100126450(&qword_1002B66C0);
      uint64_t v41 = String.init<A>(describing:)(&v65, v40);
      unint64_t v43 = v42;
      id v65 = (id)sub_100178E7C(v41, v42, v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v22 + 24, v22 + 32);

      swift_bridgeObjectRelease(v43);
      *(_WORD *)(v22 + 32) = 2049;
      id v44 = [v20 storeCollectionId];

      id v65 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v22 + 34, v22 + 42);

      *(_WORD *)(v22 + 42) = 2081;
      id v45 = [v20 feedURL];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
        unint64_t v49 = v48;
      }

      else
      {
        unint64_t v49 = 0xE700000000000000LL;
        uint64_t v47 = 0x3E7974706D653CLL;
      }

      id v65 = (id)sub_100178E7C(v47, v49, v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v22 + 44, v22 + 52);

      swift_bridgeObjectRelease(v49);
      *(_WORD *)(v22 + 52) = 2081;
      [v20 lastDatePlayed];
      Date.init(timeIntervalSinceReferenceDate:)(v50);
      uint64_t v51 = sub_100127210( &qword_1002B66C8,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
      uint64_t v52 = dispatch thunk of CustomStringConvertible.description.getter(v34, v51);
      unint64_t v54 = v53;
      (*(void (**)(char *, uint64_t))(v60 + 8))(v7, v34);
      id v65 = (id)sub_100178E7C(v52, v54, v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v22 + 54, v22 + 62);

      swift_bridgeObjectRelease(v54);
      os_log_t v55 = v59;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  (os_log_type_t)v64,  "Change detected in lastDatePlayed of podcast: %{private}s, uuid: %s, MOC: %s, adamID: %{private}lld, feedURL: %{ private}s. New lastDatePlayed = %{private}s",  (uint8_t *)v22,  0x3Eu);
      uint64_t v56 = v57;
      swift_arrayDestroy(v57, 5LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1LL, -1LL);
      swift_slowDealloc(v22, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v58 + 8))(v13, v62);
    }

    else
    {

      (*(void (**)(char *, uint64_t))(v17 + 8))(v13, v8);
    }

    return sub_10014F148(v20, 9LL, 4, 4LL);
  }

  else
  {
    uint64_t v28 = static Logger.podcastsStatesCoordination.getter(v16);
    uint64_t v29 = static os_log_type_t.default.getter(v28);
    os_log_type_t v30 = v29;
    int v31 = (os_log_s *)Logger.logObject.getter(v29);
    if (os_log_type_enabled(v31, v30))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v32 = 0;
      swift_slowDealloc(v32, -1LL, -1LL);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

uint64_t sub_100178E0C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_100178E7C(v6, v7, a3);
  uint64_t v10 = *a1;
  uint64_t v11 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_100178E7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100178F4C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1001343F8((uint64_t)v12, *a3);
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
      sub_1001343F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100136648(v12);
  return v7;
}

uint64_t sub_100178F4C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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

uint64_t sub_100179104(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100179198(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_10017930C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10017930C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100179198(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_1001695B0(v4, 0LL);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }

  return result;
}

uint64_t sub_10017930C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100126450((uint64_t *)&unk_1002B6490);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
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

uint64_t sub_10017945C()
{
  return sub_10017BFA8((uint64_t (*)(void, void, void, void, void))sub_100175B30);
}

uint64_t sub_100179468(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100179478(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t type metadata accessor for PodcastsStateCoordinator()
{
  return objc_opt_self(&OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator);
}

uint64_t sub_1001794A4()
{
  return sub_10017BFA8((uint64_t (*)(void, void, void, void, void))sub_100174524);
}

uint64_t sub_1001794B0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1001794D4(uint64_t a1)
{
}

unint64_t sub_1001794E0@<X0>(void *a1@<X8>)
{
  return sub_100175DA0(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_100179500()
{
  return sub_10017BFA8((uint64_t (*)(void, void, void, void, void))sub_1001764D4);
}

uint64_t sub_10017950C()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100179540()
{
  return sub_1001765A4(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

Swift::Int sub_10017954C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100126450(&qword_1002B60E0);
    uint64_t v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
    uint64_t v30 = v4;
    uint64_t v5 = __CocoaDictionary.makeIterator()(a1);
    uint64_t v6 = __CocoaDictionary.Iterator.next()();
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = sub_100134284(0LL, (unint64_t *)&qword_1002B6750, &OBJC_CLASS___NSManagedObjectID_ptr);
      do
      {
        uint64_t v28 = v8;
        swift_dynamicCast(&v29, &v28, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
        uint64_t v27 = v9;
        uint64_t v21 = sub_100134284(0LL, (unint64_t *)&qword_1002B50A0, &OBJC_CLASS___MTPodcast_ptr);
        swift_dynamicCast(&v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v21, 7LL);
        uint64_t v4 = v30;
        unint64_t v22 = *(void *)(v30 + 16);
        if (*(void *)(v30 + 24) <= v22)
        {
          sub_10015B09C(v22 + 1, 1LL);
          uint64_t v4 = v30;
        }

        uint64_t v12 = v28;
        uint64_t v11 = v29;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
        uint64_t v14 = v4 + 64;
        uint64_t v15 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v16 = result & ~v15;
        unint64_t v17 = v16 >> 6;
        if (((-1LL << v16) & ~*(void *)(v4 + 64 + 8 * (v16 >> 6))) != 0)
        {
          unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v4 + 64 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v23 = 0;
          unint64_t v24 = (unint64_t)(63 - v15) >> 6;
          do
          {
            if (++v17 == v24 && (v23 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v25 = v17 == v24;
            if (v17 == v24) {
              unint64_t v17 = 0LL;
            }
            v23 |= v25;
            uint64_t v26 = *(void *)(v14 + 8 * v17);
          }

          while (v26 == -1);
          unint64_t v18 = __clz(__rbit64(~v26)) + (v17 << 6);
        }

        *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
        uint64_t v19 = 8 * v18;
        *(void *)(*(void *)(v4 + 48) + v19) = v11;
        *(void *)(*(void *)(v4 + 56) + v19) = v12;
        ++*(void *)(v4 + 16);
        uint64_t v8 = __CocoaDictionary.Iterator.next()();
        uint64_t v9 = v20;
      }

      while (v8);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }

  return v4;
}

uint64_t sub_10017979C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v24, *(void *)(*v3 + 40LL));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    uint64_t v13 = v12[1];
    BOOL v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0LL) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48LL) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0LL;
    }

    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v19 = (void *)(v11 + 16 * v10);
      uint64_t v20 = v19[1];
      BOOL v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0LL) & 1) != 0) {
        goto LABEL_7;
      }
    }
  }

  swift_bridgeObjectRelease(v7);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  void *v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_100179C24(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  void *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

Swift::Int sub_100179948(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100126450((uint64_t *)&unk_1002B6730);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v32 = v2;
    uint64_t v33 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v13 = 0LL;
    while (1)
    {
      if (v9)
      {
        unint64_t v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }

      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v10) {
          goto LABEL_36;
        }
        unint64_t v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v10) {
            goto LABEL_36;
          }
          unint64_t v19 = v33[v13];
          if (!v19)
          {
            int64_t v13 = v18 + 2;
            if (v18 + 2 >= v10) {
              goto LABEL_36;
            }
            unint64_t v19 = v33[v13];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v32;
                uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v33 = -1LL << v31;
                }
                *(void *)(v3 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v13 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v13 >= v10) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v33[v13];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v13 = v20;
            }
          }
        }

void sub_100179C24(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_100179948(v11);
  }

  else
  {
    if (v10 > v9)
    {
      sub_100179DBC();
      goto LABEL_22;
    }

    sub_100179F6C(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v29, *(void *)(*v4 + 40));
  String.hash(into:)(v29, a1, a2);
  Swift::Int v13 = Hasher._finalize()();
  uint64_t v14 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = v13 & ~v14;
  uint64_t v15 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v16 = *(void *)(v12 + 48);
    unint64_t v17 = (void *)(v16 + 16 * a3);
    uint64_t v18 = v17[1];
    BOOL v19 = *v17 == a1 && v18 == a2;
    if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0)
    {
LABEL_21:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }

    else
    {
      uint64_t v20 = ~v14;
      while (1)
      {
        a3 = (a3 + 1) & v20;
        if (((*(void *)(v15 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) == 0) {
          break;
        }
        BOOL v21 = (void *)(v16 + 16 * a3);
        uint64_t v22 = v21[1];
        BOOL v23 = *v21 == a1 && v22 == a2;
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v21, v22, a1, a2, 0LL) & 1) != 0) {
          goto LABEL_21;
        }
      }
    }
  }

void sub_100179DBC()
{
  uint64_t v1 = v0;
  sub_100126450((uint64_t *)&unk_1002B6730);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    swift_release(v2);
    *uint64_t v1 = v4;
    return;
  }

  uint64_t v5 = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }

Swift::Int sub_100179F6C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100126450((uint64_t *)&unk_1002B6730);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  uint64_t v31 = v2;
  int64_t v32 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v32) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v32) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v13);
      if (!v19)
      {
        int64_t v13 = v18 + 2;
        if (v18 + 2 >= v32) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v13);
        if (!v19) {
          break;
        }
      }
    }

id sub_10017A218( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char *a8)
{
  uint64_t v16 = type metadata accessor for PodcastsStateCoordinatorPersistentStore(0LL);
  *(void *)&a8[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_subscriptions] = _swiftEmptyArrayStorage;
  *(void *)&a8[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_downloadsGateway] = a1;
  v20[3] = v16;
  v20[4] = &protocol witness table for PodcastsStateCoordinatorPersistentStore;
  *(void *)&a8[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateTransitions] = a2;
  v20[0] = a5;
  *(void *)&a8[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_episodeStateRepository] = a3;
  *(void *)&a8[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_contextProvider] = a4;
  sub_1001376A4( (uint64_t)v20,  (uint64_t)&a8[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_podcastsStateCoordinatorPersistentStore]);
  *(void *)&a8[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_syncController] = a6;
  *(void *)&a8[OBJC_IVAR____TtC8Podcasts24PodcastsStateCoordinator_library] = a7;
  v19.receiver = a8;
  v19.super_class = (Class)type metadata accessor for PodcastsStateCoordinator();
  id v17 = objc_msgSendSuper2(&v19, "init");
  sub_100136648(v20);
  return v17;
}

void *sub_10017A320(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v18[3] = type metadata accessor for ImplicitFollowsDecayCoordinator();
  v18[4] = &protocol witness table for ImplicitFollowsDecayCoordinator;
  v18[0] = a3;
  v17[3] = type metadata accessor for PodcastsStateTransitionsExternalEffects();
  v17[4] = &protocol witness table for PodcastsStateTransitionsExternalEffects;
  v17[0] = a4;
  sub_1001376A4((uint64_t)a1, (uint64_t)(a5 + 2));
  a5[7] = a2;
  sub_1001376A4((uint64_t)v18, (uint64_t)(a5 + 8));
  sub_1001376A4((uint64_t)v17, (uint64_t)(a5 + 13));
  swift_beginAccess(a5 + 8, v16, 33LL, 0LL);
  uint64_t v10 = a5[11];
  uint64_t v11 = a5[12];
  sub_10013767C((uint64_t)(a5 + 8), v10);
  unint64_t v12 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v11 + 24);
  id v13 = a2;
  uint64_t v14 = swift_retain(a5);
  v12(v14, &off_100247490, v10, v11);
  swift_endAccess(v16);
  sub_100136648(v17);
  sub_100136648(v18);
  sub_100136648(a1);
  return a5;
}

id sub_10017A43C(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RemoteNonFollowedShow(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v71 - v8;
  __chkstk_darwin();
  uint64_t v11 = (char *)&v71 - v10;
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v78 = *(void *)(v12 - 8);
  uint64_t v79 = v12;
  uint64_t v13 = __chkstk_darwin();
  unint64_t v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = static Logger.podcastsStatesCoordination.getter(v13);
  int v17 = static os_log_type_t.default.getter(v16);
  int64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  id v19 = a1;
  v18(v11, a2, v4);
  v18(v9, a2, v4);
  uint64_t v80 = a2;
  v18(v7, a2, v4);
  id v20 = v19;
  unint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  int v77 = v17;
  if (os_log_type_enabled(v21, (os_log_type_t)v17))
  {
    uint64_t v72 = v5;
    unint64_t v73 = v9;
    os_log_t v74 = v21;
    id v75 = v7;
    id v76 = v15;
    uint64_t v22 = swift_slowAlloc(82LL, -1LL);
    uint64_t v71 = swift_slowAlloc(128LL, -1LL);
    uint64_t v82 = v71;
    *(_DWORD *)uint64_t v22 = 136382467;
    id v23 = [v20 title];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      unint64_t v27 = v26;
    }

    else
    {
      unint64_t v27 = 0xEA00000000003E65LL;
      uint64_t v25 = 0x6C746974206F6E3CLL;
    }

    uint64_t v81 = sub_100178E7C(v25, v27, &v82);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v22 + 4, v22 + 12);

    swift_bridgeObjectRelease(v27);
    *(_WORD *)(v22 + 12) = 2080;
    id v31 = [v20 uuid];
    if (v31)
    {
      int64_t v32 = v31;
      uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
      unint64_t v35 = v34;
    }

    else
    {
      unint64_t v35 = 0xE90000000000003ELL;
      uint64_t v33 = 0x64697575206F6E3CLL;
    }

    uint64_t v81 = sub_100178E7C(v33, v35, &v82);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v22 + 14, v22 + 22);

    swift_bridgeObjectRelease(v35);
    *(_WORD *)(v22 + 22) = 2049;
    id v36 = [v20 storeCollectionId];

    uint64_t v81 = (uint64_t)v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v22 + 24, v22 + 32);

    *(_WORD *)(v22 + 32) = 2081;
    id v37 = [v20 feedURL];
    if (v37)
    {
      unint64_t v38 = v37;
      os_log_type_t v39 = v77;
      uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
      unint64_t v42 = v41;
    }

    else
    {
      os_log_type_t v39 = v77;
      unint64_t v42 = 0xE700000000000000LL;
      uint64_t v40 = 0x3E7974706D653CLL;
    }

    uint64_t v81 = sub_100178E7C(v40, v42, &v82);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v22 + 34, v22 + 42);

    swift_bridgeObjectRelease(v42);
    *(_WORD *)(v22 + 42) = 2049;
    [v20 lastDatePlayed];
    uint64_t v81 = v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v22 + 44, v22 + 52);

    *(_WORD *)(v22 + 52) = 2049;
    uint64_t v44 = RemoteNonFollowedShow.storeCollectionId.getter();
    id v45 = *(void (**)(char *, uint64_t))(v72 + 8);
    v45(v11, v4);
    uint64_t v81 = v44;
    uint64_t v46 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v22 + 54, v22 + 62);
    *(_WORD *)(v22 + 62) = 2081;
    uint64_t v47 = v73;
    uint64_t v48 = RemoteNonFollowedShow.feedURL.getter(v46);
    unint64_t v50 = v49;
    uint64_t v81 = sub_100178E7C(v48, v49, &v82);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v22 + 64, v22 + 72);
    swift_bridgeObjectRelease(v50);
    uint64_t v51 = ((uint64_t (*)(char *, uint64_t))v45)(v47, v4);
    *(_WORD *)(v22 + 72) = 2049;
    uint64_t v52 = v75;
    double v53 = COERCE_DOUBLE(RemoteNonFollowedShow.lastDatePlayed.getter(v51));
    if ((v54 & 1) != 0) {
      double v53 = 0.0;
    }
    uint64_t v81 = *(void *)&v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v22 + 74, v22 + 82);
    v45(v52, v4);
    os_log_t v55 = v74;
    _os_log_impl( (void *)&_mh_execute_header,  v74,  v39,  "Updating local podcast %{private}s, uuid: %s, adamID: %{private}lld, feedURL: %{private}s, lastDatePlayed: %{priva te}f; For remote NonFollowedShow with adamID: %{private}lld, feedURL: %{private}s, lastDatePlayed: %{private}f.",
      (uint8_t *)v22,
      0x52u);
    uint64_t v56 = v71;
    swift_arrayDestroy(v71, 4LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v56, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);

    uint64_t v30 = (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v76, v79);
  }

  else
  {
    unint64_t v28 = v21;
    BOOL v29 = *(void (**)(char *, uint64_t))(v5 + 8);
    v29(v11, v4);

    v29(v9, v4);
    v29(v7, v4);

    uint64_t v30 = (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v15, v79);
  }

  uint64_t v57 = RemoteNonFollowedShow.unknownSyncProperties.getter(v30);
  uint64_t v82 = v57;
  uint64_t v58 = sub_100126450((uint64_t *)&unk_1002B62E0);
  uint64_t v59 = sub_1001342BC( (unint64_t *)&qword_1002B6740,  (uint64_t *)&unk_1002B62E0,  (uint64_t)&protocol conformance descriptor for [A : B]);
  char v60 = Collection.isNotEmpty.getter(v58, v59);
  swift_bridgeObjectRelease(v57);
  if ((v60 & 1) != 0)
  {
    uint64_t v61 = RemoteSyncTypeWithUnknownSyncProperties.encodeUnknownSyncProperties()( v4,  &protocol witness table for RemoteNonFollowedShow);
    if (v62 >> 60 == 15)
    {
      Class isa = 0LL;
    }

    else
    {
      uint64_t v65 = v61;
      unint64_t v66 = v62;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_100133558(v65, v66);
    }

    [v20 setImplicitFollowsUnknownSyncProperties:isa];
  }

  else
  {
    id v64 = [v20 setImplicitFollowsUnknownSyncProperties:0];
  }

  id result = (id)RemoteNonFollowedShow.lastDatePlayed.getter(v64);
  if ((v68 & 1) == 0)
  {
    double v69 = *(double *)&result;
    id result = [v20 lastDatePlayed];
    if (v70 < v69) {
      return [v20 setLastDatePlayed:v69];
    }
  }

  return result;
}

uint64_t sub_10017AAF8()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 56LL, 7LL);
}

void sub_10017AB2C()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  id v4 = String._bridgeToObjectiveC()();
  [v1 unsafeEnableSubscriptionOnPodcastUUID:v4 from:v2 context:v3];
}

uint64_t sub_10017AB8C()
{
  return sub_10017BFA8((uint64_t (*)(void, void, void, void, void))sub_100173A7C);
}

void sub_10017AB9C()
{
}

uint64_t sub_10017ABA8()
{
  if (*(void *)(v0 + 16)) {
    swift_release(*(void *)(v0 + 24));
  }
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_10017ABD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_10017ABDC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_10017979C(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }

    while (v2);
    return v8;
  }

  return result;
}

uint64_t sub_10017AC70(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v70 = a2;
  uint64_t v71 = a3;
  uint64_t v74 = type metadata accessor for EpisodePlayerItem(0LL);
  uint64_t v76 = *(void *)(v74 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for PlayerItem(0LL);
  uint64_t v77 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v78 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v65 - v10;
  __chkstk_darwin();
  uint64_t v13 = (char *)&v65 - v12;
  uint64_t v14 = type metadata accessor for Logger(0LL);
  uint64_t v72 = *(void *)(v14 - 8);
  uint64_t v73 = v14;
  __chkstk_darwin();
  uint64_t v79 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for PodcastPlayerItem(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin();
  id v19 = (char *)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = swift_allocObject(&unk_1002486A0, 24LL, 7LL);
  *(void *)(v20 + swift_unknownObjectWeakDestroy(v0 + 16) = a4;
  id v75 = a4;
  unint64_t v21 = _Block_copy(a4);
  uint64_t v22 = PlayerItem.podcast.getter(v21);
  LOBYTE(a4) = PodcastPlayerItem.isSubscribeable.getter(v22);
  uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  if ((a4 & 1) != 0)
  {
    sub_1001771FC(a1, v70, (uint64_t)sub_10017BF30, v20);
    uint64_t v24 = v20;
  }

  else
  {
    uint64_t v71 = v20;
    uint64_t v25 = static Logger.podcastsStatesCoordination.getter(v23);
    os_log_type_t v26 = static os_log_type_t.default.getter(v25);
    unint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v77 + 16);
    v27(v13, a1, v8);
    v27(v11, a1, v8);
    uint64_t v28 = ((uint64_t (*)(char *, uint64_t, uint64_t))v27)(v78, a1, v8);
    BOOL v29 = (os_log_s *)Logger.logObject.getter(v28);
    if (os_log_type_enabled(v29, v26))
    {
      uint64_t v30 = swift_slowAlloc(32LL, -1LL);
      int v68 = v26;
      uint64_t v31 = v30;
      uint64_t v32 = swift_slowAlloc(64LL, -1LL);
      uint64_t v69 = v32;
      uint64_t v82 = v32;
      *(_DWORD *)uint64_t v31 = 136381187;
      os_log_t v67 = v29;
      uint64_t v33 = PlayerItem.episode.getter(v32);
      uint64_t v34 = EpisodePlayerItem.title.getter(v33);
      uint64_t v70 = a1;
      uint64_t v36 = v35;
      uint64_t v65 = *(void (**)(char *, uint64_t))(v76 + 8);
      uint64_t v37 = v74;
      v65(v7, v74);
      uint64_t v80 = v34;
      uint64_t v81 = v36;
      uint64_t v66 = sub_100126450(&qword_1002B5820);
      uint64_t v38 = String.init<A>(describing:)(&v80, v66);
      unint64_t v40 = v39;
      uint64_t v80 = sub_100178E7C(v38, v39, &v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v31 + 4, v31 + 12);
      swift_bridgeObjectRelease(v40);
      unint64_t v41 = *(uint64_t (**)(char *, uint64_t))(v77 + 8);
      uint64_t v42 = v41(v13, v8);
      *(_WORD *)(v31 + 12) = 2049;
      uint64_t v43 = PlayerItem.episode.getter(v42);
      uint64_t v44 = EpisodePlayerItem.adamID.getter(v43);
      id v45 = v65;
      v65(v7, v37);
      v41(v11, v8);
      uint64_t v80 = v44;
      uint64_t v46 = v37;
      uint64_t v47 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v31 + 14, v31 + 22);
      *(_WORD *)(v31 + 22) = 2081;
      uint64_t v48 = v78;
      uint64_t v49 = PlayerItem.episode.getter(v47);
      uint64_t v50 = EpisodePlayerItem.guid.getter(v49);
      uint64_t v52 = v51;
      v45(v7, v46);
      uint64_t v80 = v50;
      uint64_t v81 = v52;
      uint64_t v53 = String.init<A>(describing:)(&v80, v66);
      unint64_t v55 = v54;
      uint64_t v80 = sub_100178E7C(v53, v54, &v82);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v31 + 24, v31 + 32);
      swift_bridgeObjectRelease(v55);
      v41(v48, v8);
      os_log_t v56 = v67;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  (os_log_type_t)v68,  "Skip inserting new Implicit Follow for currently playing episode because the show is Not Subscribeable -- i. e. from a news diggest or some other type of 'fake' show: %{private}s, adamID: %{private}lld, guid: %{private}s.",  (uint8_t *)v31,  0x20u);
      uint64_t v57 = v69;
      swift_arrayDestroy(v69, 2LL, (char *)&type metadata for Any + 8);
      uint64_t v58 = v57;
      uint64_t v59 = v76;
      swift_slowDealloc(v58, -1LL, -1LL);
      swift_slowDealloc(v31, -1LL, -1LL);

      uint64_t v60 = (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v79, v73);
    }

    else
    {
      uint64_t v61 = *(void (**)(char *, uint64_t))(v77 + 8);
      v61(v11, v8);
      v61(v13, v8);
      v61(v78, v8);

      uint64_t v60 = (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v79, v73);
      uint64_t v46 = v74;
      uint64_t v59 = v76;
    }

    uint64_t v62 = PlayerItem.episode.getter(v60);
    uint64_t v63 = EpisodePlayerItem.adamID.getter(v62);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v46);
    (*((void (**)(const void *, uint64_t, void, void))v75 + 2))(v75, v63, 0LL, 0LL);
    uint64_t v24 = v71;
  }

  return swift_release(v24);
}

void sub_10017B198(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v132 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v132 - v12;
  uint64_t v14 = __chkstk_darwin();
  uint64_t v16 = (char *)&v132 - v15;
  if (!a2)
  {
    uint64_t v142 = 0LL;
    id v17 = [a1 podcast];
    if (v17)
    {
      uint64_t v18 = v17;
      sub_10014F148(v17, 6LL, 4, a3);
    }

    else
    {
      uint64_t v138 = v3;
      static Logger.podcastsStatesCoordination.getter(0LL);
      id v19 = a1;
      uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
      int v21 = static os_log_type_t.error.getter(v20);
      if (os_log_type_enabled(v20, (os_log_type_t)v21))
      {
        uint64_t v140 = v13;
        v141 = v11;
        uint64_t v22 = swift_slowAlloc(42LL, -1LL);
        uint64_t v133 = swift_slowAlloc(128LL, -1LL);
        uint64_t v145 = v133;
        *(_DWORD *)uint64_t v22 = 136381443;
        id v23 = [v19 title];
        os_log_t v136 = v20;
        int v134 = v21;
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
          uint64_t v27 = v26;
        }

        else
        {
          uint64_t v25 = 0LL;
          uint64_t v27 = 0LL;
        }

        id v143 = (id)v25;
        uint64_t v144 = v27;
        uint64_t v137 = sub_100126450(&qword_1002B5820);
        uint64_t v108 = String.init<A>(describing:)(&v143, v137);
        unint64_t v110 = v109;
        id v143 = (id)sub_100178E7C(v108, v109, &v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v143, &v144, v22 + 4, v22 + 12);

        swift_bridgeObjectRelease(v110);
        *(_WORD *)(v22 + 12) = 2080;
        id v111 = [v19 uuid];
        uint64_t v139 = a3;
        if (v111)
        {
          uint64_t v112 = v111;
          uint64_t v113 = static String._unconditionallyBridgeFromObjectiveC(_:)(v111);
          uint64_t v115 = v114;
        }

        else
        {
          uint64_t v113 = 0LL;
          uint64_t v115 = 0LL;
        }

        id v143 = (id)v113;
        uint64_t v144 = v115;
        uint64_t v116 = String.init<A>(describing:)(&v143, v137);
        unint64_t v118 = v117;
        id v143 = (id)sub_100178E7C(v116, v117, &v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v143, &v144, v22 + 14, v22 + 22);

        swift_bridgeObjectRelease(v118);
        *(_WORD *)(v22 + 22) = 2081;
        id v143 = [v19 storeTrackId];
        uint64_t v119 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
        unint64_t v121 = v120;
        id v143 = (id)sub_100178E7C(v119, v120, &v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v143, &v144, v22 + 24, v22 + 32);

        swift_bridgeObjectRelease(v121);
        *(_WORD *)(v22 + 32) = 2081;
        id v122 = [v19 guid];
        if (v122)
        {
          uint64_t v123 = v122;
          uint64_t v124 = static String._unconditionallyBridgeFromObjectiveC(_:)(v122);
          uint64_t v126 = v125;
        }

        else
        {
          uint64_t v124 = 0LL;
          uint64_t v126 = 0LL;
        }

        a3 = v139;
        id v143 = (id)v124;
        uint64_t v144 = v126;
        uint64_t v127 = String.init<A>(describing:)(&v143, v137);
        unint64_t v129 = v128;
        id v143 = (id)sub_100178E7C(v127, v128, &v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v143, &v144, v22 + 34, v22 + 42);

        swift_bridgeObjectRelease(v129);
        os_log_t v130 = v136;
        _os_log_impl( (void *)&_mh_execute_header,  v136,  (os_log_type_t)v134,  "We can't transition podcast. MTEpisode without an associated podcast: %{private}s, uuid: %s, adamID: %{private }s, guid: %{private}s.",  (uint8_t *)v22,  0x2Au);
        uint64_t v131 = v133;
        swift_arrayDestroy(v133, 4LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v131, -1LL, -1LL);
        swift_slowDealloc(v22, -1LL, -1LL);

        uint64_t v14 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v16, v8);
        uint64_t v11 = v141;
        a2 = (void *)v142;
        uint64_t v4 = v138;
        uint64_t v13 = v140;
        goto LABEL_9;
      }

      uint64_t v14 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v16, v8);
      uint64_t v4 = v138;
    }

    a2 = (void *)v142;
  }

void _s8Podcasts0A16StateCoordinatorC014currentPodcastB11Description4fromS2S_tF_0(uint64_t a1, uint64_t a2)
{
  id v4 = [(id)objc_opt_self(MTDB) sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  uint64_t v7[2] = v5;
  v7[3] = a1;
  v7[4] = a2;
  uint64_t v6 = sub_100126450(&qword_1002B6718);
  NSManagedObjectContext.performAndWait<A>(_:)(&v8, sub_10017BFBC, v7, v6);

  __asm { BR              X10 }

uint64_t sub_10017BEA0()
{
  return 0x65726F7473LL;
}

uint64_t sub_10017BF0C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10017BF30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_10017BF3C()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10017BF74()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_10017BFA8(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_10017BFBC@<X0>(char *a1@<X8>)
{
  return sub_100150C18(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

unint64_t sub_10017BFC8()
{
  unint64_t result = qword_1002B6728;
  if (!qword_1002B6728)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UInt64, &type metadata for UInt64);
    atomic_store(result, (unint64_t *)&qword_1002B6728);
  }

  return result;
}

uint64_t sub_10017C00C()
{
  uint64_t v1 = type metadata accessor for PlayerItem(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_10017C0B0()
{
  uint64_t v1 = *(void *)(type metadata accessor for PlayerItem(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  return sub_100177E10( *(void *)(v0 + 16),  *(char **)(v0 + 24),  v0 + v2,  *(void *)(v0 + v3),  *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8LL)),  *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 8));
}

unint64_t sub_10017C104()
{
  unint64_t result = qword_1002B6768;
  if (!qword_1002B6768)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EpisodeStateIdentifier,  &type metadata for EpisodeStateIdentifier);
    atomic_store(result, (unint64_t *)&qword_1002B6768);
  }

  return result;
}

uint64_t sub_10017C148()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10017C16C()
{
  uint64_t v1 = type metadata accessor for PodcastStateModel(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, ((v6 + 31) & 0xFFFFFFFFFFFFFFF8LL) + 8, v5);
}

void sub_10017C204()
{
  uint64_t v1 = *(void *)(type metadata accessor for PodcastStateModel(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  sub_10014FE38( *(void *)(v0 + 16),  v0 + v2,  *(void **)(v0 + v3),  *(os_log_s **)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8LL)),  *(unsigned __int8 *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 8),  *(char **)(v0 + ((v3 + 31) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t DummyCategoryIngester.deinit()
{
  return v0;
}

uint64_t type metadata accessor for DummyCategoryIngester()
{
  return objc_opt_self(&OBJC_CLASS____TtC8Podcasts21DummyCategoryIngester);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC8PodcastsP33_F6D5C82A1EAC8EE8094292EEB021E60619ResourceBundleClass);
}

void sub_10017C328()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "AFAnalytics");
  sub_10017C34C(v0);
}

void sub_10017C34C()
{
  __assert_rtn( "-[MTTVPodcastsSystemNowPlayingViewController _playerDidChangeState:]",  "MTTVPodcastsSystemNowPlayingViewController.m",  136,  "player == [notification object]");
}

void sub_10017C374()
{
}

void sub_10017C39C()
{
}

void sub_10017C3C4()
{
}

void sub_10017C3EC()
{
}

void sub_10017C414()
{
}

void sub_10017C43C()
{
}

void sub_10017C464()
{
}

void sub_10017C48C()
{
}

void sub_10017C4B4()
{
}

void sub_10017C4DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10017C550( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10017C5C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10017C638()
{
}

id objc_msgSend_AND_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AND:");
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return _[a1 CGSizeValue];
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return _[a1 DSID];
}

id objc_msgSend_DSIDText(void *a1, const char *a2, ...)
{
  return _[a1 DSIDText];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_MZDataByDeflatingWithGZip(void *a1, const char *a2, ...)
{
  return _[a1 MZDataByDeflatingWithGZip];
}

id objc_msgSend_MZDataByInflatingWithGZip(void *a1, const char *a2, ...)
{
  return _[a1 MZDataByInflatingWithGZip];
}

id objc_msgSend_MZStringByMD5HashingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MZStringByMD5HashingString:");
}

id objc_msgSend_MZStringFromDigestData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MZStringFromDigestData:");
}

id objc_msgSend_OR_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "OR:");
}

id objc_msgSend_UPPDisabled(void *a1, const char *a2, ...)
{
  return _[a1 UPPDisabled];
}

id objc_msgSend_UPPDomainVersion(void *a1, const char *a2, ...)
{
  return _[a1 UPPDomainVersion];
}

id objc_msgSend_UPPEnabled(void *a1, const char *a2, ...)
{
  return _[a1 UPPEnabled];
}

id objc_msgSend_UPPStore(void *a1, const char *a2, ...)
{
  return _[a1 UPPStore];
}

id objc_msgSend_URI(void *a1, const char *a2, ...)
{
  return _[a1 URI];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingPathExtension];
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLsForDirectory:inDomains:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UTIByExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTIByExtension:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__TVPPlaybackStateFromMCPPlayerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_TVPPlaybackStateFromMCPPlayerState:");
}

id objc_msgSend___queryStringToQueryDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__queryStringToQueryDictionary:");
}

id objc_msgSend___stringByRemovingPercentEscapes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__stringByRemovingPercentEscapes:");
}

id objc_msgSend___stringWithPercentEscape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__stringWithPercentEscape:");
}

id objc_msgSend__accountForSyncing(void *a1, const char *a2, ...)
{
  return _[a1 _accountForSyncing];
}

id objc_msgSend__actionButtonDisplayTitleForActionTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionButtonDisplayTitleForActionTitle:");
}

id objc_msgSend__activeAccountBlocking(void *a1, const char *a2, ...)
{
  return _[a1 _activeAccountBlocking];
}

id objc_msgSend__activityRestorationPath(void *a1, const char *a2, ...)
{
  return _[a1 _activityRestorationPath];
}

id objc_msgSend__addAnimationsWithRepeatCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAnimationsWithRepeatCount:");
}

id objc_msgSend__addDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addDictionary:");
}

id objc_msgSend__addEpisode_toMyEpisodesInPodcast_persist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addEpisode:toMyEpisodesInPodcast:persist:");
}

id objc_msgSend__addLatestSeasonForSerialPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addLatestSeasonForSerialPodcast:");
}

id objc_msgSend__addLatestSeasonToPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addLatestSeasonToPodcast:");
}

id objc_msgSend__addNewestEpisodeToPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addNewestEpisodeToPodcast:");
}

id objc_msgSend__addPendingFeedProcessingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPendingFeedProcessingBlock:");
}

id objc_msgSend__addPendingTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPendingTransaction:");
}

id objc_msgSend__addSetting_syncObj_playlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addSetting:syncObj:playlist:");
}

id objc_msgSend__addedSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 _addedSubscriptions];
}

id objc_msgSend__alertControllerForClearingOrKeepingUpNextWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertControllerForClearingOrKeepingUpNextWithRequest:");
}

id objc_msgSend__allEligiblePodcastsForPlaylistInCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allEligiblePodcastsForPlaylistInCtx:");
}

id objc_msgSend__applePodcastsFoundationSettingsUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 _applePodcastsFoundationSettingsUserDefaults];
}

id objc_msgSend__applePodcastsFoundationSharedUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 _applePodcastsFoundationSharedUserDefaults];
}

id objc_msgSend__appliedInsets(void *a1, const char *a2, ...)
{
  return _[a1 _appliedInsets];
}

id objc_msgSend__applyBackdropViewSettings_includeTints_includeBlur_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyBackdropViewSettings:includeTints:includeBlur:");
}

id objc_msgSend__applyBackdropViewSettings_includeTints_includeBlur_allowImageResizing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:");
}

id objc_msgSend__applyFocusDirectionTransform(void *a1, const char *a2, ...)
{
  return _[a1 _applyFocusDirectionTransform];
}

id objc_msgSend__artworkSizeDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _artworkSizeDidChange];
}

id objc_msgSend__artworkView(void *a1, const char *a2, ...)
{
  return _[a1 _artworkView];
}

id objc_msgSend__asyncFetchArtworkDidLoadImage_forArtworkKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_asyncFetchArtworkDidLoadImage:forArtworkKey:");
}

id objc_msgSend__augmentPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentPredicate:");
}

id objc_msgSend__authenticationCanProcessTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_authenticationCanProcessTransaction:error:");
}

id objc_msgSend__automaticallySynchronizeLocalChangesOnResignActive(void *a1, const char *a2, ...)
{
  return _[a1 _automaticallySynchronizeLocalChangesOnResignActive];
}

id objc_msgSend__automaticallySynchronizeOnBecomeActive(void *a1, const char *a2, ...)
{
  return _[a1 _automaticallySynchronizeOnBecomeActive];
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 _baselineOffsetFromBottom];
}

id objc_msgSend__beginBackgroundTask(void *a1, const char *a2, ...)
{
  return _[a1 _beginBackgroundTask];
}

id objc_msgSend__beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _beginGeneratingLibraryChangeNotifications];
}

id objc_msgSend__blurredArtworkForArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blurredArtworkForArtwork:");
}

id objc_msgSend__blurredImageForImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blurredImageForImage:");
}

id objc_msgSend__buildMap(void *a1, const char *a2, ...)
{
  return _[a1 _buildMap];
}

id objc_msgSend__canScheduleTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransaction:error:");
}

id objc_msgSend__canScheduleTransactionBasedOfNetworkingBlocked_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOfNetworkingBlocked:error:");
}

id objc_msgSend__canScheduleTransactionBasedOnBackOff_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOnBackOff:error:");
}

id objc_msgSend__canScheduleTransactionBasedOnDSIDCheck_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOnDSIDCheck:error:");
}

id objc_msgSend__canScheduleTransactionBasedOnType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOnType:error:");
}

id objc_msgSend__canScheduleTransactionBasedOnUserCancelledSignIn_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOnUserCancelledSignIn:error:");
}

id objc_msgSend__cancelAllPendingTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelAllPendingTransactions:");
}

id objc_msgSend__cancelTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelTransaction:error:");
}

id objc_msgSend__changeContainsRelevantChannelChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeContainsRelevantChannelChanges:");
}

id objc_msgSend__changeContainsRelevantEpisodeChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeContainsRelevantEpisodeChanges:");
}

id objc_msgSend__changeContainsRelevantPodcastChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeContainsRelevantPodcastChanges:");
}

id objc_msgSend__changeSortingTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeSortingTo:");
}

id objc_msgSend__chevronFrameForViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chevronFrameForViewSize:");
}

id objc_msgSend__chevronSize(void *a1, const char *a2, ...)
{
  return _[a1 _chevronSize];
}

id objc_msgSend__clampsCanScheduleTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clampsCanScheduleTransaction:error:");
}

id objc_msgSend__classesForTransactionClampsValues(void *a1, const char *a2, ...)
{
  return _[a1 _classesForTransactionClampsValues];
}

id objc_msgSend__clearAndHideArtworkView(void *a1, const char *a2, ...)
{
  return _[a1 _clearAndHideArtworkView];
}

id objc_msgSend__clearCachedValues(void *a1, const char *a2, ...)
{
  return _[a1 _clearCachedValues];
}

id objc_msgSend__clearCellEmphasis(void *a1, const char *a2, ...)
{
  return _[a1 _clearCellEmphasis];
}

id objc_msgSend__clearLabelTextContents(void *a1, const char *a2, ...)
{
  return _[a1 _clearLabelTextContents];
}

id objc_msgSend__colorThemeForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_colorThemeForPodcast:");
}

id objc_msgSend__commandEventIsFromSiri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commandEventIsFromSiri:");
}

id objc_msgSend__commandEventIsInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commandEventIsInternal:");
}

id objc_msgSend__compareServerEpisode_toLocalEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_compareServerEpisode:toLocalEpisode:");
}

id objc_msgSend__completedFrame(void *a1, const char *a2, ...)
{
  return _[a1 _completedFrame];
}

id objc_msgSend__configureEmphasisForCell_indexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureEmphasisForCell:indexPath:animated:");
}

id objc_msgSend__configureSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _configureSubviews];
}

id objc_msgSend__configureTabBarOnFirstLoad(void *a1, const char *a2, ...)
{
  return _[a1 _configureTabBarOnFirstLoad];
}

id objc_msgSend__contentGUID(void *a1, const char *a2, ...)
{
  return _[a1 _contentGUID];
}

id objc_msgSend__contentScrollInset(void *a1, const char *a2, ...)
{
  return _[a1 _contentScrollInset];
}

id objc_msgSend__contentViewLayoutRect(void *a1, const char *a2, ...)
{
  return _[a1 _contentViewLayoutRect];
}

id objc_msgSend__controllerForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_controllerForSection:");
}

id objc_msgSend__countFrameForViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_countFrameForViewSize:");
}

id objc_msgSend__countSize(void *a1, const char *a2, ...)
{
  return _[a1 _countSize];
}

id objc_msgSend__createBarViews(void *a1, const char *a2, ...)
{
  return _[a1 _createBarViews];
}

id objc_msgSend__createGlobalPlayerPathWithRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createGlobalPlayerPathWithRoute:");
}

id objc_msgSend__createLabelTextForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 _createLabelTextForCurrentState];
}

id objc_msgSend__currentDescriptionColor(void *a1, const char *a2, ...)
{
  return _[a1 _currentDescriptionColor];
}

id objc_msgSend__currentEpisodeForManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentEpisodeForManifest:");
}

id objc_msgSend__currentEpisodeForPodcastGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentEpisodeForPodcastGroup:");
}

id objc_msgSend__currentEpisodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 _currentEpisodeUuid];
}

id objc_msgSend__currentFocusAnimationCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 _currentFocusAnimationCoordinator];
}

id objc_msgSend__currentTitleColor(void *a1, const char *a2, ...)
{
  return _[a1 _currentTitleColor];
}

id objc_msgSend__currentTitleFont(void *a1, const char *a2, ...)
{
  return _[a1 _currentTitleFont];
}

id objc_msgSend__currentTransactionDidFinish(void *a1, const char *a2, ...)
{
  return _[a1 _currentTransactionDidFinish];
}

id objc_msgSend__currentUpNextIndex(void *a1, const char *a2, ...)
{
  return _[a1 _currentUpNextIndex];
}

id objc_msgSend__data(void *a1, const char *a2, ...)
{
  return _[a1 _data];
}

id objc_msgSend__dataSourceCancelTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _dataSourceCancelTransaction];
}

id objc_msgSend__defaultSelectionStyleForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultSelectionStyleForSetting:");
}

id objc_msgSend__defaultsChanged(void *a1, const char *a2, ...)
{
  return _[a1 _defaultsChanged];
}

id objc_msgSend__delegateOperationDidFinish(void *a1, const char *a2, ...)
{
  return _[a1 _delegateOperationDidFinish];
}

id objc_msgSend__delegateShouldScheduleTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_delegateShouldScheduleTransaction:error:");
}

id objc_msgSend__delegateTransactionDidFail_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_delegateTransactionDidFail:withError:");
}

id objc_msgSend__delegateTransactionDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_delegateTransactionDidFinish:");
}

id objc_msgSend__deleteEpisodeUuids_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteEpisodeUuids:forced:");
}

id objc_msgSend__deleteEpisodes_forced_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteEpisodes:forced:ctx:");
}

id objc_msgSend__deleteFromRecentlyUnfollowedForPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteFromRecentlyUnfollowedForPredicate:");
}

id objc_msgSend__deletePodcastForPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deletePodcastForPredicate:");
}

id objc_msgSend__destinationForRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destinationForRequest:completion:");
}

id objc_msgSend__determineManifest_scalledIndex_forIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineManifest:scalledIndex:forIndex:");
}

id objc_msgSend__dictionaryForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dictionaryForPodcastUuid:");
}

id objc_msgSend__didFinishUpdatingFeedUrl_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didFinishUpdatingFeedUrl:withError:");
}

id objc_msgSend__disclosureChevronImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disclosureChevronImage:");
}

id objc_msgSend__dismissDetailsForCurrentItemAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissDetailsForCurrentItemAnimated:");
}

id objc_msgSend__dismissDetailsForCurrentItemIfNeededAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissDetailsForCurrentItemIfNeededAnimated:");
}

id objc_msgSend__dismissRemoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 _dismissRemoteViewController];
}

id objc_msgSend__dismissTextField(void *a1, const char *a2, ...)
{
  return _[a1 _dismissTextField];
}

id objc_msgSend__drawFullMarqueeTextInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_drawFullMarqueeTextInRect:");
}

id objc_msgSend__duration(void *a1, const char *a2, ...)
{
  return _[a1 _duration];
}

id objc_msgSend__effectiveAutorefreshRate(void *a1, const char *a2, ...)
{
  return _[a1 _effectiveAutorefreshRate];
}

id objc_msgSend__encodedUpNext(void *a1, const char *a2, ...)
{
  return _[a1 _encodedUpNext];
}

id objc_msgSend__encodedUpNextClasses(void *a1, const char *a2, ...)
{
  return _[a1 _encodedUpNextClasses];
}

id objc_msgSend__endBackgroundTask(void *a1, const char *a2, ...)
{
  return _[a1 _endBackgroundTask];
}

id objc_msgSend__endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _endGeneratingLibraryChangeNotifications];
}

id objc_msgSend__enqueueStoreRequest_withUrlRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueStoreRequest:withUrlRequest:");
}

id objc_msgSend__enqueueTempFilesDeletion(void *a1, const char *a2, ...)
{
  return _[a1 _enqueueTempFilesDeletion];
}

id objc_msgSend__episodeArtworkIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _episodeArtworkIdentifier];
}

id objc_msgSend__episodeContextFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeContextFromString:");
}

id objc_msgSend__episodeContextSortFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeContextSortFromString:");
}

id objc_msgSend__episodeOrderFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeOrderFromString:");
}

id objc_msgSend__episodeStorePlatformDictionaryFromSiriAssetInfo_episodeAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeStorePlatformDictionaryFromSiriAssetInfo:episodeAdamId:");
}

id objc_msgSend__episodeToPlayForPodcastUuid_playbackOrder_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeToPlayForPodcastUuid:playbackOrder:excludeExplicit:ctx:");
}

id objc_msgSend__errorResolutionCancel_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorResolutionCancel:transaction:");
}

id objc_msgSend__errorResolutionDefault_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorResolutionDefault:transaction:");
}

id objc_msgSend__errorResolutionRetry_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorResolutionRetry:transaction:");
}

id objc_msgSend__extraObjects(void *a1, const char *a2, ...)
{
  return _[a1 _extraObjects];
}

id objc_msgSend__feedUpdateAndSubscribeToPodcast_feedUrl_adamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_feedUpdateAndSubscribeToPodcast:feedUrl:adamId:");
}

id objc_msgSend__fetchArtwork(void *a1, const char *a2, ...)
{
  return _[a1 _fetchArtwork];
}

id objc_msgSend__fetchArtworkInBackground(void *a1, const char *a2, ...)
{
  return _[a1 _fetchArtworkInBackground];
}

id objc_msgSend__fetchBatchFetchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _fetchBatchFetchEnabled];
}

id objc_msgSend__fetchDescription(void *a1, const char *a2, ...)
{
  return _[a1 _fetchDescription];
}

id objc_msgSend__fetchDurationText(void *a1, const char *a2, ...)
{
  return _[a1 _fetchDurationText];
}

id objc_msgSend__fetchLatestProcessedPersistentHistoryToken(void *a1, const char *a2, ...)
{
  return _[a1 _fetchLatestProcessedPersistentHistoryToken];
}

id objc_msgSend__fetchMediaAPIShowsExpectedToUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMediaAPIShowsExpectedToUpdate:");
}

id objc_msgSend__fetchMetadata(void *a1, const char *a2, ...)
{
  return _[a1 _fetchMetadata];
}

id objc_msgSend__fetchMetadataForModelObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMetadataForModelObject:");
}

id objc_msgSend__fetchMetadataForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMetadataForPlayerItem:");
}

id objc_msgSend__fetchPubDateText(void *a1, const char *a2, ...)
{
  return _[a1 _fetchPubDateText];
}

id objc_msgSend__fetchRequestForDistinctSeasons(void *a1, const char *a2, ...)
{
  return _[a1 _fetchRequestForDistinctSeasons];
}

id objc_msgSend__fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:");
}

id objc_msgSend__fetchRequestForMostRecentlyPlayedEpisode(void *a1, const char *a2, ...)
{
  return _[a1 _fetchRequestForMostRecentlyPlayedEpisode];
}

id objc_msgSend__fetchSmallestPicturePossible(void *a1, const char *a2, ...)
{
  return _[a1 _fetchSmallestPicturePossible];
}

id objc_msgSend__fetchTitle(void *a1, const char *a2, ...)
{
  return _[a1 _fetchTitle];
}

id objc_msgSend__filePath(void *a1, const char *a2, ...)
{
  return _[a1 _filePath];
}

id objc_msgSend__fillEmptyMetadataIdentifiersIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _fillEmptyMetadataIdentifiersIfNeeded];
}

id objc_msgSend__fixSortOrder_generated_p_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fixSortOrder:generated_p:");
}

id objc_msgSend__font(void *a1, const char *a2, ...)
{
  return _[a1 _font];
}

id objc_msgSend__frcDidChangeResults_uuidToManagedObjectIDMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frcDidChangeResults:uuidToManagedObjectIDMap:");
}

id objc_msgSend__freezeContentIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _freezeContentIfNeeded];
}

id objc_msgSend__genreNameForStoreItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_genreNameForStoreItemDictionary:");
}

id objc_msgSend__getStringForTitleLabel_subtitleLabel_forMediaItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getStringForTitleLabel:subtitleLabel:forMediaItem:");
}

id objc_msgSend__grabBagWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_grabBagWithCompletionBlock:");
}

id objc_msgSend__gradientMaskEdgeInsets(void *a1, const char *a2, ...)
{
  return _[a1 _gradientMaskEdgeInsets];
}

id objc_msgSend__graphicsQuality(void *a1, const char *a2, ...)
{
  return _[a1 _graphicsQuality];
}

id objc_msgSend__handleAccountsChangedOnMainQueue(void *a1, const char *a2, ...)
{
  return _[a1 _handleAccountsChangedOnMainQueue];
}

id objc_msgSend__handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded_isNewEpisodeToCurrentDevice_oldIsEntitled_oldEnclosureURL_oldPriceType_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:isNewEpisodeToCurrentDevice:oldIsEntitled:oldEnclosur eURL:oldPriceType:");
}

id objc_msgSend__handleBrowseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBrowseURL:");
}

id objc_msgSend__handleLegacyCoreSpotlightURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleLegacyCoreSpotlightURL:");
}

id objc_msgSend__handleNowPlayingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNowPlayingURL:");
}

id objc_msgSend__hasEmptySection(void *a1, const char *a2, ...)
{
  return _[a1 _hasEmptySection];
}

id objc_msgSend__hasMTImageStoreContent(void *a1, const char *a2, ...)
{
  return _[a1 _hasMTImageStoreContent];
}

id objc_msgSend__hasResults(void *a1, const char *a2, ...)
{
  return _[a1 _hasResults];
}

id objc_msgSend__hasRowAtIndexPath_focusable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasRowAtIndexPath:focusable:");
}

id objc_msgSend__heightWillChange(void *a1, const char *a2, ...)
{
  return _[a1 _heightWillChange];
}

id objc_msgSend__historyTransactionsSinceLatestPersistentHistoryToken(void *a1, const char *a2, ...)
{
  return _[a1 _historyTransactionsSinceLatestPersistentHistoryToken];
}

id objc_msgSend__identifierForDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifierForDictionary:");
}

id objc_msgSend__identifierForMPModelObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifierForMPModelObject:");
}

id objc_msgSend__idleModeLayoutAttributes(void *a1, const char *a2, ...)
{
  return _[a1 _idleModeLayoutAttributes];
}

id objc_msgSend__imageForText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageForText:");
}

id objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(void *a1, const char *a2, ...)
{
  return _[a1 _imageThatSuppressesAccessibilityHairlineThickening];
}

id objc_msgSend__imageViewForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageViewForKey:");
}

id objc_msgSend__imageViews(void *a1, const char *a2, ...)
{
  return _[a1 _imageViews];
}

id objc_msgSend__indexOfEpisodeUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexOfEpisodeUUID:");
}

id objc_msgSend__indexPathForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathForPodcastUuid:");
}

id objc_msgSend__indexPathForRowAfterIndexPath_focusable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathForRowAfterIndexPath:focusable:");
}

id objc_msgSend__indexPathForRowBeforeIndexPath_focusable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathForRowBeforeIndexPath:focusable:");
}

id objc_msgSend__initWithEpisodeAdamIds_playheadPosition_initialIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithEpisodeAdamIds:playheadPosition:initialIndex:");
}

id objc_msgSend__initWithPodcastStorePlatformDictionary_oldestEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithPodcastStorePlatformDictionary:oldestEpisode:");
}

id objc_msgSend__initWithTypeIdentifier_suggestedActionType_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithTypeIdentifier:suggestedActionType:options:");
}

id objc_msgSend__initializeFrc(void *a1, const char *a2, ...)
{
  return _[a1 _initializeFrc];
}

id objc_msgSend__insertNewEpisodeForServerEpisode_podcast_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertNewEpisodeForServerEpisode:podcast:ctx:");
}

id objc_msgSend__invalidateAssertionTimer(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateAssertionTimer];
}

id objc_msgSend__invalidateTaskAssertionForced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateTaskAssertionForced:");
}

id objc_msgSend__invalidateTaskTimer(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateTaskTimer];
}

id objc_msgSend__invokeRestorationCompletions(void *a1, const char *a2, ...)
{
  return _[a1 _invokeRestorationCompletions];
}

id objc_msgSend__isApplicationActive(void *a1, const char *a2, ...)
{
  return _[a1 _isApplicationActive];
}

id objc_msgSend__isContinuousPlaybackEnabledForLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isContinuousPlaybackEnabledForLimit:");
}

id objc_msgSend__isDarkBackground(void *a1, const char *a2, ...)
{
  return _[a1 _isDarkBackground];
}

id objc_msgSend__isEnabledForTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEnabledForTransaction:error:");
}

id objc_msgSend__isGetAllSinceDomainVersionRequest(void *a1, const char *a2, ...)
{
  return _[a1 _isGetAllSinceDomainVersionRequest];
}

id objc_msgSend__isIndexPathForDarkPlacard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isIndexPathForDarkPlacard:");
}

id objc_msgSend__isIndexPathForSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isIndexPathForSettings:");
}

id objc_msgSend__isLPMEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isLPMEnabled];
}

id objc_msgSend__isNowPlayingTabSelected(void *a1, const char *a2, ...)
{
  return _[a1 _isNowPlayingTabSelected];
}

id objc_msgSend__isNowPlayingTabVisible(void *a1, const char *a2, ...)
{
  return _[a1 _isNowPlayingTabVisible];
}

id objc_msgSend__isRTL(void *a1, const char *a2, ...)
{
  return _[a1 _isRTL];
}

id objc_msgSend__isRemoveAllSinceDomainVersion(void *a1, const char *a2, ...)
{
  return _[a1 _isRemoveAllSinceDomainVersion];
}

id objc_msgSend__isSectionForDarkPlacard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSectionForDarkPlacard:");
}

id objc_msgSend__isSectionForSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSectionForSettings:");
}

id objc_msgSend__isShowingDetailViewController(void *a1, const char *a2, ...)
{
  return _[a1 _isShowingDetailViewController];
}

id objc_msgSend__isShowingEpisodeDetails(void *a1, const char *a2, ...)
{
  return _[a1 _isShowingEpisodeDetails];
}

id objc_msgSend__isSideViewHidden(void *a1, const char *a2, ...)
{
  return _[a1 _isSideViewHidden];
}

id objc_msgSend__isTracklist_equalToTrackList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTracklist:equalToTrackList:");
}

id objc_msgSend__isTransactionValid_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTransactionValid:error:");
}

id objc_msgSend__isUserSubscribed(void *a1, const char *a2, ...)
{
  return _[a1 _isUserSubscribed];
}

id objc_msgSend__itemType(void *a1, const char *a2, ...)
{
  return _[a1 _itemType];
}

id objc_msgSend__itemTypeForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemTypeForPlayerItem:");
}

id objc_msgSend__keyForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyForTransaction:");
}

id objc_msgSend__keyForWidth_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyForWidth:style:");
}

id objc_msgSend__lastGlyphBaselineRightPointWithLayoutManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lastGlyphBaselineRightPointWithLayoutManager:");
}

id objc_msgSend__latestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_latestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:");
}

id objc_msgSend__layerBelowTitles(void *a1, const char *a2, ...)
{
  return _[a1 _layerBelowTitles];
}

id objc_msgSend__layeredImageContainer(void *a1, const char *a2, ...)
{
  return _[a1 _layeredImageContainer];
}

id objc_msgSend__layoutContentViewSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _layoutContentViewSubviews];
}

id objc_msgSend__layoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 _layoutMargins];
}

id objc_msgSend__layoutMarginsForViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutMarginsForViewWidth:");
}

id objc_msgSend__leading(void *a1, const char *a2, ...)
{
  return _[a1 _leading];
}

id objc_msgSend__load_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_load:");
}

id objc_msgSend__loadActivityForRestoration(void *a1, const char *a2, ...)
{
  return _[a1 _loadActivityForRestoration];
}

id objc_msgSend__loadArtworkForMPObject_scaleToSize_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadArtworkForMPObject:scaleToSize:completionHandler:");
}

id objc_msgSend__loadArtworkFromMemoryCache(void *a1, const char *a2, ...)
{
  return _[a1 _loadArtworkFromMemoryCache];
}

id objc_msgSend__loadItemsFromEpisodeAdamIdsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadItemsFromEpisodeAdamIdsWithCompletion:");
}

id objc_msgSend__loadQueryParameterValuesFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadQueryParameterValuesFromString:");
}

id objc_msgSend__loadWithBootURL_withLaunchOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadWithBootURL:withLaunchOptions:");
}

id objc_msgSend__localEpisode_isEqualToServerEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localEpisode:isEqualToServerEpisode:");
}

id objc_msgSend__localPlayerPath(void *a1, const char *a2, ...)
{
  return _[a1 _localPlayerPath];
}

id objc_msgSend__localPodcastExists(void *a1, const char *a2, ...)
{
  return _[a1 _localPodcastExists];
}

id objc_msgSend__longStringForEpisodes_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_longStringForEpisodes:defaultValue:");
}

id objc_msgSend__lookupEpisodeUuidIfNecessaryFromURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lookupEpisodeUuidIfNecessaryFromURLString:");
}

id objc_msgSend__lookupPodcastUuidIfNecessaryFromURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lookupPodcastUuidIfNecessaryFromURLString:");
}

id objc_msgSend__manifestForPlayMyLatestPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 _manifestForPlayMyLatestPodcasts];
}

id objc_msgSend__manifestForPlayMyOldestPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 _manifestForPlayMyOldestPodcasts];
}

id objc_msgSend__manifestForPlayMyPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 _manifestForPlayMyPodcasts];
}

id objc_msgSend__markAsHiddenPodcast_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markAsHiddenPodcast:inContext:");
}

id objc_msgSend__markAsHiddenPodcastsWithUuids_setSubscriptionsSyncDirty_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markAsHiddenPodcastsWithUuids:setSubscriptionsSyncDirty:ctx:");
}

id objc_msgSend__markEpisodeAsFirstSeen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markEpisodeAsFirstSeen:");
}

id objc_msgSend__markLatestEpisodeAsUnplayedIfNeeded_latestEpisodeInPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markLatestEpisodeAsUnplayedIfNeeded:latestEpisodeInPodcast:");
}

id objc_msgSend__markPlaylistsForUpdateForPodcastUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markPlaylistsForUpdateForPodcastUuids:");
}

id objc_msgSend__maxArtworkSize(void *a1, const char *a2, ...)
{
  return _[a1 _maxArtworkSize];
}

id objc_msgSend__mediaItemForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaItemForEpisode:");
}

id objc_msgSend__mediaItemForMPCPlayerResponseItem_section_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaItemForMPCPlayerResponseItem:section:atIndexPath:");
}

id objc_msgSend__mediaType(void *a1, const char *a2, ...)
{
  return _[a1 _mediaType];
}

id objc_msgSend__mediaTypeForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaTypeForPlayerItem:");
}

id objc_msgSend__menuItemElements(void *a1, const char *a2, ...)
{
  return _[a1 _menuItemElements];
}

id objc_msgSend__menuItemsForActionController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_menuItemsForActionController:");
}

id objc_msgSend__mergeSetting_syncObj_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mergeSetting:syncObj:");
}

id objc_msgSend__metadataUrl(void *a1, const char *a2, ...)
{
  return _[a1 _metadataUrl];
}

id objc_msgSend__metricsDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _metricsDateFormatter];
}

id objc_msgSend__migrateToImageProvider(void *a1, const char *a2, ...)
{
  return _[a1 _migrateToImageProvider];
}

id objc_msgSend__moreLabelExclusionPath(void *a1, const char *a2, ...)
{
  return _[a1 _moreLabelExclusionPath];
}

id objc_msgSend__moreLabelFrame(void *a1, const char *a2, ...)
{
  return _[a1 _moreLabelFrame];
}

id objc_msgSend__mostRecentPlayTimeFromDatabase(void *a1, const char *a2, ...)
{
  return _[a1 _mostRecentPlayTimeFromDatabase];
}

id objc_msgSend__multiSelectCheckmarkImage(void *a1, const char *a2, ...)
{
  return _[a1 _multiSelectCheckmarkImage];
}

id objc_msgSend__multiSelectNotSelectedImage(void *a1, const char *a2, ...)
{
  return _[a1 _multiSelectNotSelectedImage];
}

id objc_msgSend__needsImageStoreMigration(void *a1, const char *a2, ...)
{
  return _[a1 _needsImageStoreMigration];
}

id objc_msgSend__newSeparatorHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 _newSeparatorHeaderView];
}

id objc_msgSend__notifyDelegateIfHeightChanged(void *a1, const char *a2, ...)
{
  return _[a1 _notifyDelegateIfHeightChanged];
}

id objc_msgSend__observeAllPropertyChangesForEntityName_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_observeAllPropertyChangesForEntityName:predicate:");
}

id objc_msgSend__offerNameForOfferFlavor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_offerNameForOfferFlavor:");
}

id objc_msgSend__offerTypesAsFlagBits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_offerTypesAsFlagBits:");
}

id objc_msgSend__oldestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_oldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:");
}

id objc_msgSend__onQueueLoadBagContextWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueLoadBagContextWithCompletionHandler:");
}

id objc_msgSend__onQueueStartNewTimer(void *a1, const char *a2, ...)
{
  return _[a1 _onQueueStartNewTimer];
}

id objc_msgSend__onQueueStopTimer(void *a1, const char *a2, ...)
{
  return _[a1 _onQueueStopTimer];
}

id objc_msgSend__onQueueSuspendTimer(void *a1, const char *a2, ...)
{
  return _[a1 _onQueueSuspendTimer];
}

id objc_msgSend__onQueueSynchronizeImmediatelyWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueSynchronizeImmediatelyWithCompletionBlock:");
}

id objc_msgSend__onQueueSynchronizeWithAutosynchronizeMask_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueSynchronizeWithAutosynchronizeMask:withCompletionBlock:");
}

id objc_msgSend__onQueueUpdateTimerForActiveChanges(void *a1, const char *a2, ...)
{
  return _[a1 _onQueueUpdateTimerForActiveChanges];
}

id objc_msgSend__openExternalItemIfNeededForManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openExternalItemIfNeededForManifest:");
}

id objc_msgSend__options(void *a1, const char *a2, ...)
{
  return _[a1 _options];
}

id objc_msgSend__performAfterPlay_playbackStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAfterPlay:playbackStarted:");
}

id objc_msgSend__performFocusGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performFocusGesture:");
}

id objc_msgSend__performLoadImageForKey_scaleToSize_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performLoadImageForKey:scaleToSize:completionHandler:");
}

id objc_msgSend__performMediaRemoteCommand_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performMediaRemoteCommand:options:");
}

id objc_msgSend__performPlayerCommandRequest_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performPlayerCommandRequest:name:");
}

id objc_msgSend__playEventFromGenericObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playEventFromGenericObject:");
}

id objc_msgSend__playQueueTypeForRequestURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playQueueTypeForRequestURL:");
}

id objc_msgSend__playReasonFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playReasonFromString:");
}

id objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playbackRequestIdentifierWithHost:queryComponents:");
}

id objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playbackRequestIdentifierWithHost:queryKey:value:");
}

id objc_msgSend__playerItemForContentItemId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playerItemForContentItemId:");
}

id objc_msgSend__playerItemForContentItemId_infoCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playerItemForContentItemId:infoCenter:");
}

id objc_msgSend__podcastArtworkIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _podcastArtworkIdentifier];
}

id objc_msgSend__podcastFeedURL(void *a1, const char *a2, ...)
{
  return _[a1 _podcastFeedURL];
}

id objc_msgSend__podcastId(void *a1, const char *a2, ...)
{
  return _[a1 _podcastId];
}

id objc_msgSend__podcastState(void *a1, const char *a2, ...)
{
  return _[a1 _podcastState];
}

id objc_msgSend__podcastStateForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_podcastStateForPlayerItem:");
}

id objc_msgSend__podcastSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 _podcastSubscriptions];
}

id objc_msgSend__podcastsPlayerPathWithRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_podcastsPlayerPathWithRoute:");
}

id objc_msgSend__populatePlayerItem_withMetadataFromMediaItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_populatePlayerItem:withMetadataFromMediaItem:");
}

id objc_msgSend__predicate(void *a1, const char *a2, ...)
{
  return _[a1 _predicate];
}

id objc_msgSend__predicateForEpisodesToUpdateWithPodcastUuid_predicateForUnplayedInUnplayedTab_predicateForUserEpisodes_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_predicateForEpisodesToUpdateWithPodcastUuid:predicateForUnplayedInUnplayedTab:predicateForUserEpisodes:");
}

id objc_msgSend__predicateForFilteringExplicitEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 _predicateForFilteringExplicitEpisodes];
}

id objc_msgSend__predicateForOpportunisticHiddenPodcastDeletion(void *a1, const char *a2, ...)
{
  return _[a1 _predicateForOpportunisticHiddenPodcastDeletion];
}

id objc_msgSend__presentErrorDialogWithTitle_message_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentErrorDialogWithTitle:message:handler:");
}

id objc_msgSend__presetDialogWithError_appController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presetDialogWithError:appController:");
}

id objc_msgSend__processCurrentTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _processCurrentTransaction];
}

id objc_msgSend__processLatestPersistentHistoryTransactions(void *a1, const char *a2, ...)
{
  return _[a1 _processLatestPersistentHistoryTransactions];
}

id objc_msgSend__processOperationOutput_forRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processOperationOutput:forRequest:");
}

id objc_msgSend__processPendingTransactions(void *a1, const char *a2, ...)
{
  return _[a1 _processPendingTransactions];
}

id objc_msgSend__processResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processResults:");
}

id objc_msgSend__promptToClearUpNextIfNeededForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_promptToClearUpNextIfNeededForRequest:");
}

id objc_msgSend__propertiesToFetch(void *a1, const char *a2, ...)
{
  return _[a1 _propertiesToFetch];
}

id objc_msgSend__propertyDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _propertyDidChange];
}

id objc_msgSend__providerId(void *a1, const char *a2, ...)
{
  return _[a1 _providerId];
}

id objc_msgSend__queue_processNextPendingFeedIfPossible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_processNextPendingFeedIfPossible");
}

id objc_msgSend__radioButtonTintsTextColorOnSelection(void *a1, const char *a2, ...)
{
  return _[a1 _radioButtonTintsTextColorOnSelection];
}

id objc_msgSend__reCheck(void *a1, const char *a2, ...)
{
  return _[a1 _reCheck];
}

id objc_msgSend__recalculateEpisodeLevel_episodeLevelCalculator_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recalculateEpisodeLevel:episodeLevelCalculator:ctx:");
}

id objc_msgSend__recomputeTextSizeIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _recomputeTextSizeIfNeeded];
}

id objc_msgSend__recordMetricsForItemDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _recordMetricsForItemDidChange];
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return _[a1 _referenceBounds];
}

id objc_msgSend__refetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refetch:");
}

id objc_msgSend__refreshFeedIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _refreshFeedIfNeeded];
}

id objc_msgSend__registerForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForNotifications];
}

id objc_msgSend__reloadActionButtonContent(void *a1, const char *a2, ...)
{
  return _[a1 _reloadActionButtonContent];
}

id objc_msgSend__reloadArtwork(void *a1, const char *a2, ...)
{
  return _[a1 _reloadArtwork];
}

id objc_msgSend__reloadManifest(void *a1, const char *a2, ...)
{
  return _[a1 _reloadManifest];
}

id objc_msgSend__reloadSectionHeaderFooters_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadSectionHeaderFooters:withRowAnimation:");
}

id objc_msgSend__remainingFrame(void *a1, const char *a2, ...)
{
  return _[a1 _remainingFrame];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteViewControllerProxy];
}

id objc_msgSend__removeAnimations(void *a1, const char *a2, ...)
{
  return _[a1 _removeAnimations];
}

id objc_msgSend__removeDownloadAssetsForEpisodes_shouldKeep_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDownloadAssetsForEpisodes:shouldKeep:forced:");
}

id objc_msgSend__removeImageStoreContent(void *a1, const char *a2, ...)
{
  return _[a1 _removeImageStoreContent];
}

id objc_msgSend__reportMetrics(void *a1, const char *a2, ...)
{
  return _[a1 _reportMetrics];
}

id objc_msgSend__reportUpNextChangeType_forPlayerItem_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportUpNextChangeType:forPlayerItem:withData:");
}

id objc_msgSend__reportUpNextChangeType_forPlayerItems_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportUpNextChangeType:forPlayerItems:withData:");
}

id objc_msgSend__requestForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestForTransaction:");
}

id objc_msgSend__resetGoDark(void *a1, const char *a2, ...)
{
  return _[a1 _resetGoDark];
}

id objc_msgSend__resetState(void *a1, const char *a2, ...)
{
  return _[a1 _resetState];
}

id objc_msgSend__resolveError_transaction_resolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resolveError:transaction:resolution:");
}

id objc_msgSend__restoreDefaultManifestIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restoreDefaultManifestIfNeededWithCompletion:");
}

id objc_msgSend__restoreManifestIfNeededWithCompletion_useEmptyManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restoreManifestIfNeededWithCompletion:useEmptyManifest:");
}

id objc_msgSend__restoreUpNext(void *a1, const char *a2, ...)
{
  return _[a1 _restoreUpNext];
}

id objc_msgSend__rightNow(void *a1, const char *a2, ...)
{
  return _[a1 _rightNow];
}

id objc_msgSend__sanitisedTimeIntervalForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sanitisedTimeIntervalForObject:");
}

id objc_msgSend__saveActivityForRestoration(void *a1, const char *a2, ...)
{
  return _[a1 _saveActivityForRestoration];
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__scheduleTransactionWithType_sinceDomainVersion_URL_keys_processor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:");
}

id objc_msgSend__scrollEmphasizedCellToVisibleIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _scrollEmphasizedCellToVisibleIfNecessary];
}

id objc_msgSend__searchDictionaryFromArray_withKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_searchDictionaryFromArray:withKey:");
}

id objc_msgSend__sectionForController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sectionForController:");
}

id objc_msgSend__selectItemWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectItemWithUuid:");
}

id objc_msgSend__selectTabWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectTabWithIdentifier:");
}

id objc_msgSend__selectTabWithIdentifier_popToRoot_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectTabWithIdentifier:popToRoot:animated:completion:");
}

id objc_msgSend__selectedTabIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _selectedTabIdentifier];
}

id objc_msgSend__sendDidEndEditingForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDidEndEditingForIndexPath:");
}

id objc_msgSend__sendMediaRemoteCommand_toPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMediaRemoteCommand:toPlayer:");
}

id objc_msgSend__sendMediaRemoteCommand_toPlayer_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMediaRemoteCommand:toPlayer:options:");
}

id objc_msgSend__sendNotificationForError_avItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendNotificationForError:avItem:");
}

id objc_msgSend__sendNotificationForNewlyEntitledEpisodesIfNeeded_latestEpisodeInPodcast_newlyEntitledEpisodeUUIDs_ctx_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_sendNotificationForNewlyEntitledEpisodesIfNeeded:latestEpisodeInPodcast:newlyEntitledEpisodeUUIDs:ctx:");
}

id objc_msgSend__sendWillBeginEditingForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendWillBeginEditingForIndexPath:");
}

id objc_msgSend__separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 _separatorColor];
}

id objc_msgSend__setAVPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAVPlayer:");
}

id objc_msgSend__setAllowsVideoPlaybackWhileInBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllowsVideoPlaybackWhileInBackground:");
}

id objc_msgSend__setArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setArtwork:");
}

id objc_msgSend__setAttributedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAttributedMessage:");
}

id objc_msgSend__setAttributesOfLocalEpisode_feedEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAttributesOfLocalEpisode:feedEpisode:");
}

id objc_msgSend__setBarHeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBarHeights:");
}

id objc_msgSend__setContentScrollInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentScrollInset:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setControllers:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__setCurrentMediaItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCurrentMediaItem:");
}

id objc_msgSend__setCurrentState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCurrentState:");
}

id objc_msgSend__setDocument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDocument:");
}

id objc_msgSend__setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setError:");
}

id objc_msgSend__setFrc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFrc:");
}

id objc_msgSend__setGradientMaskEdgeInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGradientMaskEdgeInsets:");
}

id objc_msgSend__setGradientMaskInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGradientMaskInsets:");
}

id objc_msgSend__setHeight_forRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHeight:forRowAtIndexPath:");
}

id objc_msgSend__setIdleModeLayoutAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIdleModeLayoutAttributes:");
}

id objc_msgSend__setIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIndexPath:");
}

id objc_msgSend__setLastProcessedPersistentHistoryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLastProcessedPersistentHistoryToken:");
}

id objc_msgSend__setLocalPlaybackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLocalPlaybackQueue:");
}

id objc_msgSend__setManifest_playerController_queueType_startPlayback_forceLocal_reason_interactive_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_setManifest:playerController:queueType:startPlayback:forceLocal:reason:interactive:completion:");
}

id objc_msgSend__setNeedsTextSizeComputation(void *a1, const char *a2, ...)
{
  return _[a1 _setNeedsTextSizeComputation];
}

id objc_msgSend__setNumberOfLinesForDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNumberOfLinesForDescription:");
}

id objc_msgSend__setPlaybackQueueForMyPodcastsWithOrder_playerController_startPlayback_forceLocal_reason_interactive_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_setPlaybackQueueForMyPodcastsWithOrder:playerController:startPlayback:forceLocal:reason:interactive:completion:");
}

id objc_msgSend__setPlaybackQueueFromStoreForPodcastAdamId_playerController_siriAssetInfo_savePlayHistory_playbackOrder_startPlayback_reason_interactive_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_setPlaybackQueueFromStoreForPodcastAdamId:playerController:siriAssetInfo:savePlayHistory:playbackOrder:start Playback:reason:interactive:completion:");
}

id objc_msgSend__setPodcastArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPodcastArtwork:");
}

id objc_msgSend__setRepeatMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRepeatMode:");
}

id objc_msgSend__setRepeatType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRepeatType:");
}

id objc_msgSend__setRowAlignmentsOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRowAlignmentsOptions:");
}

id objc_msgSend__setShuffleEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShuffleEnabled:");
}

id objc_msgSend__setStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setStreaming:");
}

id objc_msgSend__setupBackgroundView(void *a1, const char *a2, ...)
{
  return _[a1 _setupBackgroundView];
}

id objc_msgSend__setupGestureRecognizers(void *a1, const char *a2, ...)
{
  return _[a1 _setupGestureRecognizers];
}

id objc_msgSend__setupLabel(void *a1, const char *a2, ...)
{
  return _[a1 _setupLabel];
}

id objc_msgSend__setupManifestDefaults(void *a1, const char *a2, ...)
{
  return _[a1 _setupManifestDefaults];
}

id objc_msgSend__setupPlayer(void *a1, const char *a2, ...)
{
  return _[a1 _setupPlayer];
}

id objc_msgSend__setupPlaylistPropertyObserver(void *a1, const char *a2, ...)
{
  return _[a1 _setupPlaylistPropertyObserver];
}

id objc_msgSend__setupUPP(void *a1, const char *a2, ...)
{
  return _[a1 _setupUPP];
}

id objc_msgSend__shiftIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shiftIndexPath:");
}

id objc_msgSend__shortStringForEpisodes_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shortStringForEpisodes:defaultValue:");
}

id objc_msgSend__shouldCycle(void *a1, const char *a2, ...)
{
  return _[a1 _shouldCycle];
}

id objc_msgSend__shouldDownloadPodcastWithIdentifierFromStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldDownloadPodcastWithIdentifierFromStore:");
}

id objc_msgSend__shouldOpenExternalItemForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldOpenExternalItemForEpisode:");
}

id objc_msgSend__shouldSkipSettingPropertiesForWatchPPT(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSkipSettingPropertiesForWatchPPT];
}

id objc_msgSend__shouldStop(void *a1, const char *a2, ...)
{
  return _[a1 _shouldStop];
}

id objc_msgSend__shouldUpdatePodcastsStatsForChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldUpdatePodcastsStatsForChange:");
}

id objc_msgSend__showAlertForInternetUnavailableReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlertForInternetUnavailableReason:completion:");
}

id objc_msgSend__showChangeSortUI(void *a1, const char *a2, ...)
{
  return _[a1 _showChangeSortUI];
}

id objc_msgSend__showCreateStationUI(void *a1, const char *a2, ...)
{
  return _[a1 _showCreateStationUI];
}

id objc_msgSend__showDetailViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showDetailViewController:animated:");
}

id objc_msgSend__showDetailsForEpisode_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showDetailsForEpisode:animated:");
}

id objc_msgSend__showDetailsForFirstItemAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showDetailsForFirstItemAnimated:");
}

id objc_msgSend__showDetailsForFirstItemIfNeededAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showDetailsForFirstItemIfNeededAnimated:");
}

id objc_msgSend__showDetailsForIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showDetailsForIndexPath:animated:");
}

id objc_msgSend__showDetailsForPlaceholderIfNeededAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showDetailsForPlaceholderIfNeededAnimated:");
}

id objc_msgSend__showSettings(void *a1, const char *a2, ...)
{
  return _[a1 _showSettings];
}

id objc_msgSend__showUserSwitchSpinnerUserSwitchState_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showUserSwitchSpinnerUserSwitchState:completion:");
}

id objc_msgSend__showsArtwork(void *a1, const char *a2, ...)
{
  return _[a1 _showsArtwork];
}

id objc_msgSend__signalKVSTransactionCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_signalKVSTransactionCompletion:");
}

id objc_msgSend__signalKVSTransactionCompletion_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_signalKVSTransactionCompletion:withError:");
}

id objc_msgSend__skipBackwardCommandEvent(void *a1, const char *a2, ...)
{
  return _[a1 _skipBackwardCommandEvent];
}

id objc_msgSend__skipForwardCommandEvent(void *a1, const char *a2, ...)
{
  return _[a1 _skipForwardCommandEvent];
}

id objc_msgSend__sortDescriptorsForLocalEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 _sortDescriptorsForLocalEpisodes];
}

id objc_msgSend__sortTypeForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortTypeForString:");
}

id objc_msgSend__sortUngroupedList_inPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortUngroupedList:inPlaylist:");
}

id objc_msgSend__startDownloadForFeedUrl_cloudSyncFeedUrl_podcastStoreId_triggerBy_userInitiated_useBackgroundFetch_source_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_startDownloadForFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:useBackgroundFetch:source:");
}

id objc_msgSend__startProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startProcessor:");
}

id objc_msgSend__storeDownloadArtworkArrayForStoreItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeDownloadArtworkArrayForStoreItemDictionary:");
}

id objc_msgSend__storeDownloadOffersForStoreItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeDownloadOffersForStoreItemDictionary:");
}

id objc_msgSend__storeOfferDownloadDictionaryForStoreOfferItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeOfferDownloadDictionaryForStoreOfferItemDictionary:");
}

id objc_msgSend__stringForSortType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForSortType:");
}

id objc_msgSend__subscribedPodcastsCount(void *a1, const char *a2, ...)
{
  return _[a1 _subscribedPodcastsCount];
}

id objc_msgSend__subtitleForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subtitleForPodcast:");
}

id objc_msgSend__subtitleForPodcastGroup_currentEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subtitleForPodcastGroup:currentEpisode:");
}

id objc_msgSend__subtitleSettingsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _subtitleSettingsDidChange];
}

id objc_msgSend__suggestedActionType(void *a1, const char *a2, ...)
{
  return _[a1 _suggestedActionType];
}

id objc_msgSend__synchronize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronize:");
}

id objc_msgSend__synchronousResetToInitialStateDatabase(void *a1, const char *a2, ...)
{
  return _[a1 _synchronousResetToInitialStateDatabase];
}

id objc_msgSend__synchronousResetToInitialStateMetadata(void *a1, const char *a2, ...)
{
  return _[a1 _synchronousResetToInitialStateMetadata];
}

id objc_msgSend__synchronouslyRunKVSTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronouslyRunKVSTransaction:");
}

id objc_msgSend__systemMidGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 _systemMidGrayTintColor];
}

id objc_msgSend__tabIdentifierForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tabIdentifierForIndex:");
}

id objc_msgSend__tabIndexForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tabIndexForIdentifier:");
}

id objc_msgSend__tableHeaderHeightDidChangeToHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tableHeaderHeightDidChangeToHeight:");
}

id objc_msgSend__tableView(void *a1, const char *a2, ...)
{
  return _[a1 _tableView];
}

id objc_msgSend__textForUserSwitchState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textForUserSwitchState:");
}

id objc_msgSend__timerFired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timerFired:");
}

id objc_msgSend__timerIsStopped(void *a1, const char *a2, ...)
{
  return _[a1 _timerIsStopped];
}

id objc_msgSend__tintedImageForSize_withTint_effectsImage_maskImage_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tintedImageForSize:withTint:effectsImage:maskImage:style:");
}

id objc_msgSend__titleForFirstSegment(void *a1, const char *a2, ...)
{
  return _[a1 _titleForFirstSegment];
}

id objc_msgSend__titleForPodcastGroup_currentEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleForPodcastGroup:currentEpisode:");
}

id objc_msgSend__toolbarButton(void *a1, const char *a2, ...)
{
  return _[a1 _toolbarButton];
}

id objc_msgSend__tracklistRangeForRadioPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tracklistRangeForRadioPlayback:");
}

id objc_msgSend__tracklistRepeatMode(void *a1, const char *a2, ...)
{
  return _[a1 _tracklistRepeatMode];
}

id objc_msgSend__transactionDidCancel_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transactionDidCancel:withError:");
}

id objc_msgSend__transactionDidFail_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transactionDidFail:withError:");
}

id objc_msgSend__triggeringPhysicalButton(void *a1, const char *a2, ...)
{
  return _[a1 _triggeringPhysicalButton];
}

id objc_msgSend__tvTabBarShouldAutohide(void *a1, const char *a2, ...)
{
  return _[a1 _tvTabBarShouldAutohide];
}

id objc_msgSend__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episode StoreId:context:contextSortType:sampPlaybackOrder:");
}

id objc_msgSend__unmodifiedTitleForStoreItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unmodifiedTitleForStoreItemDictionary:");
}

id objc_msgSend__unregisterForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _unregisterForNotifications];
}

id objc_msgSend__unsafeDeletePodcast_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafeDeletePodcast:ctx:");
}

id objc_msgSend__unsafeFinalizeIngestion_episodeLevelCalculator_storeInfoUpdater_updateAverageCalculator_ctx_didUpdateAnyEpisodes_newlyEntitledEpisodeUUIDs_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_unsafeFinalizeIngestion:episodeLevelCalculator:storeInfoUpdater:updateAverageCalculator:ctx:didUpdateAnyEpis odes:newlyEntitledEpisodeUUIDs:");
}

id objc_msgSend__unsafeIngestEpisode_localEpisode_isNew_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafeIngestEpisode:localEpisode:isNew:");
}

id objc_msgSend__unsafe_updateAllPodcastsUserInitiated_forced_useBackgroundFetch_source_startedUpdatesCallback_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_unsafe_updateAllPodcastsUserInitiated:forced:useBackgroundFetch:source:startedUpdatesCallback:");
}

id objc_msgSend__upNextDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _upNextDidChange];
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _[a1 _update];
}

id objc_msgSend__updateActiveAccount(void *a1, const char *a2, ...)
{
  return _[a1 _updateActiveAccount];
}

id objc_msgSend__updateAirplaneMode(void *a1, const char *a2, ...)
{
  return _[a1 _updateAirplaneMode];
}

id objc_msgSend__updateAllMediaAPIPodcastsUserInitiated_source_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAllMediaAPIPodcastsUserInitiated:source:completion:");
}

id objc_msgSend__updateAllNonMediaAPIPodcastsUserInitiated_forced_source_started_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAllNonMediaAPIPodcastsUserInitiated:forced:source:started:");
}

id objc_msgSend__updateAudioRoute(void *a1, const char *a2, ...)
{
  return _[a1 _updateAudioRoute];
}

id objc_msgSend__updateAutorefreshRateSettingAndRestartTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAutorefreshRateSettingAndRestartTimer:");
}

id objc_msgSend__updateButtonFontAndTextAlignment(void *a1, const char *a2, ...)
{
  return _[a1 _updateButtonFontAndTextAlignment];
}

id objc_msgSend__updateChannelRelationship_deassociate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateChannelRelationship:deassociate:");
}

id objc_msgSend__updateColors(void *a1, const char *a2, ...)
{
  return _[a1 _updateColors];
}

id objc_msgSend__updateContainerFilters(void *a1, const char *a2, ...)
{
  return _[a1 _updateContainerFilters];
}

id objc_msgSend__updateCurrentActivityForPlayState(void *a1, const char *a2, ...)
{
  return _[a1 _updateCurrentActivityForPlayState];
}

id objc_msgSend__updateCurrentTextColor(void *a1, const char *a2, ...)
{
  return _[a1 _updateCurrentTextColor];
}

id objc_msgSend__updateDerivedPropertiesForPodcastUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDerivedPropertiesForPodcastUUIDs:");
}

id objc_msgSend__updateElapsedTimeObserversWithDurationSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateElapsedTimeObserversWithDurationSnapshot:");
}

id objc_msgSend__updateEpisodeCountsForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateEpisodeCountsForPodcastUuid:");
}

id objc_msgSend__updateFonts(void *a1, const char *a2, ...)
{
  return _[a1 _updateFonts];
}

id objc_msgSend__updateGlobalCellularWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGlobalCellularWithCompletion:");
}

id objc_msgSend__updateGlobalPolicyLimitIfMoreRestrictiveInDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGlobalPolicyLimitIfMoreRestrictiveInDefaults:");
}

id objc_msgSend__updateGradientColors(void *a1, const char *a2, ...)
{
  return _[a1 _updateGradientColors];
}

id objc_msgSend__updateIconsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _updateIconsIfNeeded];
}

id objc_msgSend__updateLoadStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLoadStatus:");
}

id objc_msgSend__updateMediaItemsWithTrackList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMediaItemsWithTrackList:");
}

id objc_msgSend__updateNowPlayingState(void *a1, const char *a2, ...)
{
  return _[a1 _updateNowPlayingState];
}

id objc_msgSend__updatePlayerPathWithRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePlayerPathWithRoute:");
}

id objc_msgSend__updatePlaylist(void *a1, const char *a2, ...)
{
  return _[a1 _updatePlaylist];
}

id objc_msgSend__updatePlaylistEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 _updatePlaylistEpisodes];
}

id objc_msgSend__updatePodcastArtworksIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _updatePodcastArtworksIfNeeded];
}

id objc_msgSend__updatePodcastWithUUID_triggerBy_userInitiated_forced_forceBootstrap_source_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:source:completion:");
}

id objc_msgSend__updatePodcastWithUUID_triggerBy_userInitiated_forced_forceBootstrap_useBackgroundFetch_source_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:completion:");
}

id objc_msgSend__updatePodcastWithUUID_triggerBy_userInitiated_forced_forceBootstrap_useBackgroundFetch_source_tryRedirectURL_startedUpdateCallback_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL :startedUpdateCallback:completion:");
}

id objc_msgSend__updatePodcastWithUUID_userInitiated_forced_useBackgroundFetch_source_startedUpdateCallback_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:startedUpdateCallback:");
}

id objc_msgSend__updatePodcastWithUUID_userInitiated_forced_useBackgroundFetch_source_tryRedirectURL_startedUpdateCallback_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:");
}

id objc_msgSend__updatePodcastWithUUID_userInitiated_useBackgroundFetch_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:userInitiated:useBackgroundFetch:source:");
}

id objc_msgSend__updatePodcastWithUUID_userInitiated_useBackgroundFetch_source_tryRedirectURL_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:userInitiated:useBackgroundFetch:source:tryRedirectURL:");
}

id objc_msgSend__updatePodcastsWithUUIDs_userInitiated_forced_useBackgroundFetch_source_startedUpdatesCallback_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_updatePodcastsWithUUIDs:userInitiated:forced:useBackgroundFetch:source:startedUpdatesCallback:");
}

id objc_msgSend__updatePodcastsWithUUIDs_userInitiated_useBackgroundFetch_source_startedUpdatesCallback_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastsWithUUIDs:userInitiated:useBackgroundFetch:source:startedUpdatesCallback:");
}

id objc_msgSend__updateReachability(void *a1, const char *a2, ...)
{
  return _[a1 _updateReachability];
}

id objc_msgSend__updateScale(void *a1, const char *a2, ...)
{
  return _[a1 _updateScale];
}

id objc_msgSend__updateSeparatorInsets(void *a1, const char *a2, ...)
{
  return _[a1 _updateSeparatorInsets];
}

id objc_msgSend__updateSettingsFromLoadedBagContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSettingsFromLoadedBagContext:");
}

id objc_msgSend__updateShadowMask(void *a1, const char *a2, ...)
{
  return _[a1 _updateShadowMask];
}

id objc_msgSend__updateSideViewHiddenForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 _updateSideViewHiddenForCurrentState];
}

id objc_msgSend__updateSideViewHiddenForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSideViewHiddenForState:");
}

id objc_msgSend__updateSortOrder(void *a1, const char *a2, ...)
{
  return _[a1 _updateSortOrder];
}

id objc_msgSend__updateSubtitleFont(void *a1, const char *a2, ...)
{
  return _[a1 _updateSubtitleFont];
}

id objc_msgSend__updateSubtitleLabelVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateSubtitleLabelVisibility];
}

id objc_msgSend__updateTableAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTableAnimated:");
}

id objc_msgSend__updateTextColorForCell_selected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTextColorForCell:selected:");
}

id objc_msgSend__updateTitle(void *a1, const char *a2, ...)
{
  return _[a1 _updateTitle];
}

id objc_msgSend__updateTitleFont(void *a1, const char *a2, ...)
{
  return _[a1 _updateTitleFont];
}

id objc_msgSend__updateTitleLabelVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateTitleLabelVisibility];
}

id objc_msgSend__updateUpNextDeleting_inContext_forced_podcastUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUpNextDeleting:inContext:forced:podcastUuids:");
}

id objc_msgSend__updateVideoViewsWithAVPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVideoViewsWithAVPlayer:");
}

id objc_msgSend__updateWithPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithPodcast:");
}

id objc_msgSend__validateFairPlayEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 _validateFairPlayEpisodes];
}

id objc_msgSend__validateFairPlayEpisodesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateFairPlayEpisodesWithCompletionHandler:");
}

id objc_msgSend__validatePlaybackRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validatePlaybackRequest:");
}

id objc_msgSend__verifyFairPlayMigrationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyFairPlayMigrationWithCompletionHandler:");
}

id objc_msgSend__willUpdateCollectionView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_willUpdateCollectionView:");
}

id objc_msgSend__withLockSetAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_withLockSetAssertion:");
}

id objc_msgSend_abbreviatedFriendlyDisplayString(void *a1, const char *a2, ...)
{
  return _[a1 abbreviatedFriendlyDisplayString];
}

id objc_msgSend_abortUpdatesIfNetworkUnreachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "abortUpdatesIfNetworkUnreachable:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acceptedDSID(void *a1, const char *a2, ...)
{
  return _[a1 acceptedDSID];
}

id objc_msgSend_acceptedDSIDText(void *a1, const char *a2, ...)
{
  return _[a1 acceptedDSIDText];
}

id objc_msgSend_acceptedDSIDTextUserDefaultsKey(void *a1, const char *a2, ...)
{
  return _[a1 acceptedDSIDTextUserDefaultsKey];
}

id objc_msgSend_acceptedDSIDUserDefaultsKey(void *a1, const char *a2, ...)
{
  return _[a1 acceptedDSIDUserDefaultsKey];
}

id objc_msgSend_accessLog(void *a1, const char *a2, ...)
{
  return _[a1 accessLog];
}

id objc_msgSend_accessLogEvent(void *a1, const char *a2, ...)
{
  return _[a1 accessLogEvent];
}

id objc_msgSend_accessTransactionClampsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessTransactionClampsWithBlock:");
}

id objc_msgSend_accountAgreedTermsVersion(void *a1, const char *a2, ...)
{
  return _[a1 accountAgreedTermsVersion];
}

id objc_msgSend_accountForRequesterUserId_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountForRequesterUserId:completionHandler:");
}

id objc_msgSend_accountFromQueueContainingDsid_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountFromQueueContainingDsid:error:");
}

id objc_msgSend_accountIdentifierForLastSync(void *a1, const char *a2, ...)
{
  return _[a1 accountIdentifierForLastSync];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_acknowledgePrivacy(void *a1, const char *a2, ...)
{
  return _[a1 acknowledgePrivacy];
}

id objc_msgSend_acknowledgementNeededForPrivacyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acknowledgementNeededForPrivacyIdentifier:");
}

id objc_msgSend_acquireWithInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithInvalidationHandler:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionBlock(void *a1, const char *a2, ...)
{
  return _[a1 actionBlock];
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return _[a1 actionButton];
}

id objc_msgSend_actionButtonFrameForViewWidth_titleOriginY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButtonFrameForViewWidth:titleOriginY:");
}

id objc_msgSend_actionButtons(void *a1, const char *a2, ...)
{
  return _[a1 actionButtons];
}

id objc_msgSend_actionButtonsContainer(void *a1, const char *a2, ...)
{
  return _[a1 actionButtonsContainer];
}

id objc_msgSend_actionController(void *a1, const char *a2, ...)
{
  return _[a1 actionController];
}

id objc_msgSend_actionHandler(void *a1, const char *a2, ...)
{
  return _[a1 actionHandler];
}

id objc_msgSend_actionObject(void *a1, const char *a2, ...)
{
  return _[a1 actionObject];
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:image:identifier:handler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _[a1 actions];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeAccount];
}

id objc_msgSend_activeDsid(void *a1, const char *a2, ...)
{
  return _[a1 activeDsid];
}

id objc_msgSend_activeList(void *a1, const char *a2, ...)
{
  return _[a1 activeList];
}

id objc_msgSend_activeListIndex(void *a1, const char *a2, ...)
{
  return _[a1 activeListIndex];
}

id objc_msgSend_activeUsers(void *a1, const char *a2, ...)
{
  return _[a1 activeUsers];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityIndicator(void *a1, const char *a2, ...)
{
  return _[a1 activityIndicator];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_actualRate(void *a1, const char *a2, ...)
{
  return _[a1 actualRate];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _[a1 adamID];
}

id objc_msgSend_adamIdNumberFromStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adamIdNumberFromStoreId:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributes:range:");
}

id objc_msgSend_addCachedHeight_forWidth_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCachedHeight:forWidth:style:");
}

id objc_msgSend_addCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCallback:");
}

id objc_msgSend_addChangeNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChangeNotifier:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletion:");
}

id objc_msgSend_addCoordinatedAnimations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCoordinatedAnimations:completion:");
}

id objc_msgSend_addCoordinatedAnimationsForAnimation_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCoordinatedAnimationsForAnimation:animations:completion:");
}

id objc_msgSend_addDeletedEpisodesObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeletedEpisodesObject:");
}

id objc_msgSend_addDerivedPropertyChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDerivedPropertyChangeHandler:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEpisodeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEpisodeObserver:");
}

id objc_msgSend_addEpisodeObserverForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEpisodeObserverForPodcast:");
}

id objc_msgSend_addEpisodeUuidToUpNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEpisodeUuidToUpNext:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addImageAttachment_onString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImageAttachment:onString:");
}

id objc_msgSend_addLayoutManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLayoutManager:");
}

id objc_msgSend_addMetricsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMetricsController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addPlayerItemToUpNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlayerItemToUpNext:");
}

id objc_msgSend_addPlayerItemsToPlayNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlayerItemsToPlayNext:");
}

id objc_msgSend_addPlayerItemsToUpNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlayerItemsToUpNext:");
}

id objc_msgSend_addPlusImage(void *a1, const char *a2, ...)
{
  return _[a1 addPlusImage];
}

id objc_msgSend_addPodcastInfoViewHeader(void *a1, const char *a2, ...)
{
  return _[a1 addPodcastInfoViewHeader];
}

id objc_msgSend_addPodcastsViewController(void *a1, const char *a2, ...)
{
  return _[a1 addPodcastsViewController];
}

id objc_msgSend_addRadioSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRadioSetting:");
}

id objc_msgSend_addResultsChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResultsChangedHandler:");
}

id objc_msgSend_addServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServiceIdentifier:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubscribeParams_forFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubscribeParams:forFeedUrl:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSubviews(void *a1, const char *a2, ...)
{
  return _[a1 addSubviews];
}

id objc_msgSend_addTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTarget_action_usingExtendedStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:usingExtendedStatus:");
}

id objc_msgSend_addTaskCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTaskCompletionBlock:");
}

id objc_msgSend_addTextContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextContainer:");
}

id objc_msgSend_addTextFieldWithConfigurationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextFieldWithConfigurationHandler:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_addToUpNextAction(void *a1, const char *a2, ...)
{
  return _[a1 addToUpNextAction];
}

id objc_msgSend_addUserAgent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUserAgent:");
}

id objc_msgSend_addedDate(void *a1, const char *a2, ...)
{
  return _[a1 addedDate];
}

id objc_msgSend_addedPlaylists(void *a1, const char *a2, ...)
{
  return _[a1 addedPlaylists];
}

id objc_msgSend_addedSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 addedSubscriptions];
}

id objc_msgSend_adjustBarHeightToSize(void *a1, const char *a2, ...)
{
  return _[a1 adjustBarHeightToSize];
}

id objc_msgSend_adjustsImageWhenAncestorFocused(void *a1, const char *a2, ...)
{
  return _[a1 adjustsImageWhenAncestorFocused];
}

id objc_msgSend_aggregateOperation_attribute_predicate_managedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateOperation:attribute:predicate:managedObjectContext:");
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _[a1 airplaneMode];
}

id objc_msgSend_airplayDetectorAirplayEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airplayDetectorAirplayEnded:");
}

id objc_msgSend_airplayDetectorAirplayStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airplayDetectorAirplayStarted:");
}

id objc_msgSend_album(void *a1, const char *a2, ...)
{
  return _[a1 album];
}

id objc_msgSend_albumName(void *a1, const char *a2, ...)
{
  return _[a1 albumName];
}

id objc_msgSend_alertController(void *a1, const char *a2, ...)
{
  return _[a1 alertController];
}

id objc_msgSend_alertControllerForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerForError:");
}

id objc_msgSend_alertControllerStyleForInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 alertControllerStyleForInterfaceIdiom];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertTitleForUnavailableReason_podcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertTitleForUnavailableReason:podcastTitle:");
}

id objc_msgSend_allActions(void *a1, const char *a2, ...)
{
  return _[a1 allActions];
}

id objc_msgSend_allEpisodesMigrationForVersion40to41In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion40to41In:");
}

id objc_msgSend_allEpisodesMigrationForVersion43to44In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion43to44In:");
}

id objc_msgSend_allEpisodesMigrationForVersion45to46In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion45to46In:");
}

id objc_msgSend_allEpisodesMigrationForVersion46to47In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion46to47In:");
}

id objc_msgSend_allEpisodesMigrationForVersion47to48In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion47to48In:");
}

id objc_msgSend_allEpisodesMigrationForVersion51to52In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion51to52In:");
}

id objc_msgSend_allEpisodesMigrationForVersion53to54In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion53to54In:");
}

id objc_msgSend_allEpisodesMigrationForVersion54to55In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion54to55In:");
}

id objc_msgSend_allEpisodesMigrationForVersion59to60In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion59to60In:");
}

id objc_msgSend_allEpisodesMigrationForVersion65to66In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion65to66In:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allPodcastsSelected(void *a1, const char *a2, ...)
{
  return _[a1 allPodcastsSelected];
}

id objc_msgSend_allPropertyChangeObserver(void *a1, const char *a2, ...)
{
  return _[a1 allPropertyChangeObserver];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:");
}

id objc_msgSend_allowReporting(void *a1, const char *a2, ...)
{
  return _[a1 allowReporting];
}

id objc_msgSend_allowsDurationUpdateFromSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsDurationUpdateFromSource:");
}

id objc_msgSend_allowsMultipleSelection(void *a1, const char *a2, ...)
{
  return _[a1 allowsMultipleSelection];
}

id objc_msgSend_alreadySubscribedErrorCode(void *a1, const char *a2, ...)
{
  return _[a1 alreadySubscribedErrorCode];
}

id objc_msgSend_alternatePaidURL(void *a1, const char *a2, ...)
{
  return _[a1 alternatePaidURL];
}

id objc_msgSend_alwaysFloating(void *a1, const char *a2, ...)
{
  return _[a1 alwaysFloating];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_dictionaryByAddingEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_dictionaryByAddingEntriesFromDictionary:");
}

id objc_msgSend_ams_filterUsingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_filterUsingTest:");
}

id objc_msgSend_ams_fullName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_fullName");
}

id objc_msgSend_ams_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isManagedAppleID");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefront");
}

id objc_msgSend_ams_underlyingError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_underlyingError");
}

id objc_msgSend_analyticsChannel(void *a1, const char *a2, ...)
{
  return _[a1 analyticsChannel];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return _[a1 animation];
}

id objc_msgSend_animationKeys(void *a1, const char *a2, ...)
{
  return _[a1 animationKeys];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appContext(void *a1, const char *a2, ...)
{
  return _[a1 appContext];
}

id objc_msgSend_appContext_evaluateAppJavaScriptInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appContext:evaluateAppJavaScriptInContext:");
}

id objc_msgSend_appController(void *a1, const char *a2, ...)
{
  return _[a1 appController];
}

id objc_msgSend_appDelegate(void *a1, const char *a2, ...)
{
  return _[a1 appDelegate];
}

id objc_msgSend_appDelegateClass(void *a1, const char *a2, ...)
{
  return _[a1 appDelegateClass];
}

id objc_msgSend_appTintColor(void *a1, const char *a2, ...)
{
  return _[a1 appTintColor];
}

id objc_msgSend_appearanceSelectedPath(void *a1, const char *a2, ...)
{
  return _[a1 appearanceSelectedPath];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_application_openURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:openURL:options:");
}

id objc_msgSend_applicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return _[a1 applicationDidEnterBackground];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_applicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _[a1 applicationWillEnterForeground];
}

id objc_msgSend_appliedInsets(void *a1, const char *a2, ...)
{
  return _[a1 appliedInsets];
}

id objc_msgSend_appliedYOffset(void *a1, const char *a2, ...)
{
  return _[a1 appliedYOffset];
}

id objc_msgSend_appliesContentFilters(void *a1, const char *a2, ...)
{
  return _[a1 appliesContentFilters];
}

id objc_msgSend_applyCachedImageForPodcast_withSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyCachedImageForPodcast:withSize:");
}

id objc_msgSend_applyShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyShowTypeSetting:");
}

id objc_msgSend_applyThemeToImageViewWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyThemeToImageViewWithKey:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 areAnimationsEnabled];
}

id objc_msgSend_areChaptersLoaded(void *a1, const char *a2, ...)
{
  return _[a1 areChaptersLoaded];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayValue(void *a1, const char *a2, ...)
{
  return _[a1 arrayValue];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return _[a1 artist];
}

id objc_msgSend_artwork(void *a1, const char *a2, ...)
{
  return _[a1 artwork];
}

id objc_msgSend_artworkBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 artworkBackgroundColor];
}

id objc_msgSend_artworkBorderColor(void *a1, const char *a2, ...)
{
  return _[a1 artworkBorderColor];
}

id objc_msgSend_artworkBorderColorForDarkBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkBorderColorForDarkBackground:");
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return _[a1 artworkCatalog];
}

id objc_msgSend_artworkDictionary_closestToSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkDictionary:closestToSize:");
}

id objc_msgSend_artworkForShow_size_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkForShow:size:completionHandler:");
}

id objc_msgSend_artworkForURL_withSize_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkForURL:withSize:completionHandler:");
}

id objc_msgSend_artworkFrameForContentViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkFrameForContentViewSize:");
}

id objc_msgSend_artworkFrameForStyle_forViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkFrameForStyle:forViewWidth:");
}

id objc_msgSend_artworkHeight(void *a1, const char *a2, ...)
{
  return _[a1 artworkHeight];
}

id objc_msgSend_artworkHeightForStyle_sizeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkHeightForStyle:sizeType:");
}

id objc_msgSend_artworkIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 artworkIdentifier];
}

id objc_msgSend_artworkKey(void *a1, const char *a2, ...)
{
  return _[a1 artworkKey];
}

id objc_msgSend_artworkPrimaryColor(void *a1, const char *a2, ...)
{
  return _[a1 artworkPrimaryColor];
}

id objc_msgSend_artworkProvider(void *a1, const char *a2, ...)
{
  return _[a1 artworkProvider];
}

id objc_msgSend_artworkRequests(void *a1, const char *a2, ...)
{
  return _[a1 artworkRequests];
}

id objc_msgSend_artworkSize(void *a1, const char *a2, ...)
{
  return _[a1 artworkSize];
}

id objc_msgSend_artworkSizeForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkSizeForStyle:");
}

id objc_msgSend_artworkSizeForViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkSizeForViewWidth:");
}

id objc_msgSend_artworkTemplateURL(void *a1, const char *a2, ...)
{
  return _[a1 artworkTemplateURL];
}

id objc_msgSend_artworkTextPrimaryColor(void *a1, const char *a2, ...)
{
  return _[a1 artworkTextPrimaryColor];
}

id objc_msgSend_artworkTextQuaternaryColor(void *a1, const char *a2, ...)
{
  return _[a1 artworkTextQuaternaryColor];
}

id objc_msgSend_artworkTextSecondaryColor(void *a1, const char *a2, ...)
{
  return _[a1 artworkTextSecondaryColor];
}

id objc_msgSend_artworkTextTertiaryColor(void *a1, const char *a2, ...)
{
  return _[a1 artworkTextTertiaryColor];
}

id objc_msgSend_artworkUrl(void *a1, const char *a2, ...)
{
  return _[a1 artworkUrl];
}

id objc_msgSend_artworkView(void *a1, const char *a2, ...)
{
  return _[a1 artworkView];
}

id objc_msgSend_artworkWidth(void *a1, const char *a2, ...)
{
  return _[a1 artworkWidth];
}

id objc_msgSend_artworkWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkWithSize:");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _[a1 ascender];
}

id objc_msgSend_ascending(void *a1, const char *a2, ...)
{
  return _[a1 ascending];
}

id objc_msgSend_assertionName(void *a1, const char *a2, ...)
{
  return _[a1 assertionName];
}

id objc_msgSend_assertionTimeout(void *a1, const char *a2, ...)
{
  return _[a1 assertionTimeout];
}

id objc_msgSend_assertionTimeoutTimer(void *a1, const char *a2, ...)
{
  return _[a1 assertionTimeoutTimer];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return _[a1 asset];
}

id objc_msgSend_assetCache(void *a1, const char *a2, ...)
{
  return _[a1 assetCache];
}

id objc_msgSend_assetForLocalFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetForLocalFile:");
}

id objc_msgSend_assetForRemoteFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetForRemoteFile:");
}

id objc_msgSend_assetTimeRange(void *a1, const char *a2, ...)
{
  return _[a1 assetTimeRange];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return _[a1 assetURL];
}

id objc_msgSend_assetUrl(void *a1, const char *a2, ...)
{
  return _[a1 assetUrl];
}

id objc_msgSend_asyncImageForKey_size_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asyncImageForKey:size:completionHandler:");
}

id objc_msgSend_asyncValueOnQueue_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asyncValueOnQueue:withCompletion:");
}

id objc_msgSend_asyncValuePromiseOnQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asyncValuePromiseOnQueue:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_attributedMessageForAlertController(void *a1, const char *a2, ...)
{
  return _[a1 attributedMessageForAlertController];
}

id objc_msgSend_attributedString(void *a1, const char *a2, ...)
{
  return _[a1 attributedString];
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringWithAttachment:");
}

id objc_msgSend_attributedStrings(void *a1, const char *a2, ...)
{
  return _[a1 attributedStrings];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _[a1 attributedText];
}

id objc_msgSend_attributedTitleForRefreshControl(void *a1, const char *a2, ...)
{
  return _[a1 attributedTitleForRefreshControl];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_attributesAtIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesAtIndex:effectiveRange:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_audioRoute(void *a1, const char *a2, ...)
{
  return _[a1 audioRoute];
}

id objc_msgSend_authenticationController(void *a1, const char *a2, ...)
{
  return _[a1 authenticationController];
}

id objc_msgSend_authenticationError(void *a1, const char *a2, ...)
{
  return _[a1 authenticationError];
}

id objc_msgSend_authenticationErrorsForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationErrorsForTransaction:");
}

id objc_msgSend_authenticationNeededTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 authenticationNeededTimestamp];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return _[a1 author];
}

id objc_msgSend_autoDownload(void *a1, const char *a2, ...)
{
  return _[a1 autoDownload];
}

id objc_msgSend_autoDownloadEnabled(void *a1, const char *a2, ...)
{
  return _[a1 autoDownloadEnabled];
}

id objc_msgSend_autoDownloadType(void *a1, const char *a2, ...)
{
  return _[a1 autoDownloadType];
}

id objc_msgSend_autoSubtitleOption(void *a1, const char *a2, ...)
{
  return _[a1 autoSubtitleOption];
}

id objc_msgSend_automaticSynchronizeOptions(void *a1, const char *a2, ...)
{
  return _[a1 automaticSynchronizeOptions];
}

id objc_msgSend_autorefreshRate(void *a1, const char *a2, ...)
{
  return _[a1 autorefreshRate];
}

id objc_msgSend_auxilaryActions(void *a1, const char *a2, ...)
{
  return _[a1 auxilaryActions];
}

id objc_msgSend_avMediaSelectionOption(void *a1, const char *a2, ...)
{
  return _[a1 avMediaSelectionOption];
}

id objc_msgSend_avPlayer(void *a1, const char *a2, ...)
{
  return _[a1 avPlayer];
}

id objc_msgSend_availableActions(void *a1, const char *a2, ...)
{
  return _[a1 availableActions];
}

id objc_msgSend_backCatalog(void *a1, const char *a2, ...)
{
  return _[a1 backCatalog];
}

id objc_msgSend_backCatalogIconForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backCatalogIconForTheme:");
}

id objc_msgSend_backCatalogPartiallyPlayedIconForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backCatalogPartiallyPlayedIconForTheme:");
}

id objc_msgSend_backOffForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backOffForTimeInterval:");
}

id objc_msgSend_backOffUntil(void *a1, const char *a2, ...)
{
  return _[a1 backOffUntil];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_backgroundColorForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColorForState:");
}

id objc_msgSend_backgroundColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColorForTheme:");
}

id objc_msgSend_backgroundFetch(void *a1, const char *a2, ...)
{
  return _[a1 backgroundFetch];
}

id objc_msgSend_backgroundTask(void *a1, const char *a2, ...)
{
  return _[a1 backgroundTask];
}

id objc_msgSend_backgroundTaskAssertion(void *a1, const char *a2, ...)
{
  return _[a1 backgroundTaskAssertion];
}

id objc_msgSend_backgroundTaskIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 backgroundTaskIdentifier];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return _[a1 backgroundView];
}

id objc_msgSend_badgeLabel(void *a1, const char *a2, ...)
{
  return _[a1 badgeLabel];
}

id objc_msgSend_badgeView(void *a1, const char *a2, ...)
{
  return _[a1 badgeView];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return _[a1 bag];
}

id objc_msgSend_bagLookupEndTime(void *a1, const char *a2, ...)
{
  return _[a1 bagLookupEndTime];
}

id objc_msgSend_bagLookupStartTime(void *a1, const char *a2, ...)
{
  return _[a1 bagLookupStartTime];
}

id objc_msgSend_bagLookupTask(void *a1, const char *a2, ...)
{
  return _[a1 bagLookupTask];
}

id objc_msgSend_barsFillBounds(void *a1, const char *a2, ...)
{
  return _[a1 barsFillBounds];
}

id objc_msgSend_barsTintColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "barsTintColorForTheme:");
}

id objc_msgSend_barsView(void *a1, const char *a2, ...)
{
  return _[a1 barsView];
}

id objc_msgSend_baseDictionary(void *a1, const char *a2, ...)
{
  return _[a1 baseDictionary];
}

id objc_msgSend_baseURLForGETAll(void *a1, const char *a2, ...)
{
  return _[a1 baseURLForGETAll];
}

id objc_msgSend_baseURLForPUTAll(void *a1, const char *a2, ...)
{
  return _[a1 baseURLForPUTAll];
}

id objc_msgSend_batchFeedFetchIsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 batchFeedFetchIsEnabled];
}

id objc_msgSend_batchUpdateRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchUpdateRequestWithEntityName:");
}

id objc_msgSend_becomeActiveMediaPlayer(void *a1, const char *a2, ...)
{
  return _[a1 becomeActiveMediaPlayer];
}

id objc_msgSend_becomeCurrent(void *a1, const char *a2, ...)
{
  return _[a1 becomeCurrent];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginAutomaticResponseLoading(void *a1, const char *a2, ...)
{
  return _[a1 beginAutomaticResponseLoading];
}

id objc_msgSend_beginBackgroundTaskWithName_expirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginBackgroundTaskWithName:expirationHandler:");
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 beginGeneratingLibraryChangeNotifications];
}

id objc_msgSend_beginLoadingArtwork(void *a1, const char *a2, ...)
{
  return _[a1 beginLoadingArtwork];
}

id objc_msgSend_beginLoadingSubtitleOptions(void *a1, const char *a2, ...)
{
  return _[a1 beginLoadingSubtitleOptions];
}

id objc_msgSend_beginObserving(void *a1, const char *a2, ...)
{
  return _[a1 beginObserving];
}

id objc_msgSend_beginObservingTranscriptIdentifierChangesForCurrentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingTranscriptIdentifierChangesForCurrentItem:");
}

id objc_msgSend_beginRefreshing(void *a1, const char *a2, ...)
{
  return _[a1 beginRefreshing];
}

id objc_msgSend_beginSeekWithDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginSeekWithDirection:");
}

id objc_msgSend_beginTaskOperation(void *a1, const char *a2, ...)
{
  return _[a1 beginTaskOperation];
}

id objc_msgSend_beginTransactionWithItemsToSyncEnumerationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransactionWithItemsToSyncEnumerationBlock:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_bestAvailableStoreCleanURL(void *a1, const char *a2, ...)
{
  return _[a1 bestAvailableStoreCleanURL];
}

id objc_msgSend_bestDescription(void *a1, const char *a2, ...)
{
  return _[a1 bestDescription];
}

id objc_msgSend_bestFeedURLExcludingRedirectURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestFeedURLExcludingRedirectURL:");
}

id objc_msgSend_bestIndexPathForObject_atIndex_fromMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestIndexPathForObject:atIndex:fromMap:");
}

id objc_msgSend_bestIndexPathForObject_atIndex_fromMap_autoremove_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestIndexPathForObject:atIndex:fromMap:autoremove:");
}

id objc_msgSend_bestSummary(void *a1, const char *a2, ...)
{
  return _[a1 bestSummary];
}

id objc_msgSend_bestTitle(void *a1, const char *a2, ...)
{
  return _[a1 bestTitle];
}

id objc_msgSend_bestUrl(void *a1, const char *a2, ...)
{
  return _[a1 bestUrl];
}

id objc_msgSend_bezierPathWithOvalInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithOvalInRect:");
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRect:");
}

id objc_msgSend_bezierPathWithRoundedRect_byRoundingCorners_cornerRadii_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:");
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:cornerRadius:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_blendColor(void *a1, const char *a2, ...)
{
  return _[a1 blendColor];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _[a1 block];
}

id objc_msgSend_blockForJSCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockForJSCallback:");
}

id objc_msgSend_blurEffectStyle(void *a1, const char *a2, ...)
{
  return _[a1 blurEffectStyle];
}

id objc_msgSend_blurredBackground(void *a1, const char *a2, ...)
{
  return _[a1 blurredBackground];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_bookmarkKeyForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarkKeyForSyncType:");
}

id objc_msgSend_bookmarkTime(void *a1, const char *a2, ...)
{
  return _[a1 bookmarkTime];
}

id objc_msgSend_bookmarksKeyForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarksKeyForSyncType:");
}

id objc_msgSend_bookmarksLastSyncKeyForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarksLastSyncKeyForSyncType:");
}

id objc_msgSend_bookmarksSyncType(void *a1, const char *a2, ...)
{
  return _[a1 bookmarksSyncType];
}

id objc_msgSend_bookmarksSyncVersionForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarksSyncVersionForSyncType:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_boundingRectWithSize_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:context:");
}

id objc_msgSend_boundingRectWithWidth_lines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithWidth:lines:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_box_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "box:");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bumpBookmarksSyncVersionToVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bumpBookmarksSyncVersionToVersion:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return _[a1 button];
}

id objc_msgSend_buttonBackgroundColorForDarkBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonBackgroundColorForDarkBackground:");
}

id objc_msgSend_buttonCallback(void *a1, const char *a2, ...)
{
  return _[a1 buttonCallback];
}

id objc_msgSend_buttonSettingWithTitle_detailText_identifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonSettingWithTitle:detailText:identifier:changeHandler:");
}

id objc_msgSend_buttonSettingWithTitle_identifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonSettingWithTitle:identifier:changeHandler:");
}

id objc_msgSend_buttonSize(void *a1, const char *a2, ...)
{
  return _[a1 buttonSize];
}

id objc_msgSend_buttonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonTapped:");
}

id objc_msgSend_buttonTitle(void *a1, const char *a2, ...)
{
  return _[a1 buttonTitle];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_buttonsFrameForActionButtonFrame_downloadButtonFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonsFrameForActionButtonFrame:downloadButtonFrame:");
}

id objc_msgSend_byteSize(void *a1, const char *a2, ...)
{
  return _[a1 byteSize];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedAssetURL(void *a1, const char *a2, ...)
{
  return _[a1 cachedAssetURL];
}

id objc_msgSend_cachedHeightForWidth_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedHeightForWidth:style:");
}

id objc_msgSend_cachedSizeThatFits(void *a1, const char *a2, ...)
{
  return _[a1 cachedSizeThatFits];
}

id objc_msgSend_cachedTextRectForBounds(void *a1, const char *a2, ...)
{
  return _[a1 cachedTextRectForBounds];
}

id objc_msgSend_cachesDirectory(void *a1, const char *a2, ...)
{
  return _[a1 cachesDirectory];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return _[a1 callStackSymbols];
}

id objc_msgSend_callWithArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callWithArguments:");
}

id objc_msgSend_callbacks(void *a1, const char *a2, ...)
{
  return _[a1 callbacks];
}

id objc_msgSend_canBecomeFocused(void *a1, const char *a2, ...)
{
  return _[a1 canBecomeFocused];
}

id objc_msgSend_canDeletePlaylistUUIDBlock(void *a1, const char *a2, ...)
{
  return _[a1 canDeletePlaylistUUIDBlock];
}

id objc_msgSend_canFocusRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canFocusRowAtIndexPath:");
}

id objc_msgSend_canMoveItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canMoveItem:");
}

id objc_msgSend_canMoveItemAtIndexToPlayNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canMoveItemAtIndexToPlayNext:");
}

id objc_msgSend_canOpenURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canOpenURL:");
}

id objc_msgSend_canRequestStoreSignIn(void *a1, const char *a2, ...)
{
  return _[a1 canRequestStoreSignIn];
}

id objc_msgSend_canScheduleSyncRequest(void *a1, const char *a2, ...)
{
  return _[a1 canScheduleSyncRequest];
}

id objc_msgSend_canScheduleTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canScheduleTransaction:error:");
}

id objc_msgSend_canSendNotification(void *a1, const char *a2, ...)
{
  return _[a1 canSendNotification];
}

id objc_msgSend_canSyncInterests(void *a1, const char *a2, ...)
{
  return _[a1 canSyncInterests];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllOperations];
}

id objc_msgSend_cancelAllRequests(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllRequests];
}

id objc_msgSend_cancelAllTransactions(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllTransactions];
}

id objc_msgSend_cancelAllTransactionsCancelCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllTransactionsCancelCode:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelType(void *a1, const char *a2, ...)
{
  return _[a1 cancelType];
}

id objc_msgSend_cancelUniversalPlaybackPositionTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelUniversalPlaybackPositionTransaction:");
}

id objc_msgSend_cancelWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelWithError:");
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _[a1 canceled];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _[a1 capHeight];
}

id objc_msgSend_capHeightToTop(void *a1, const char *a2, ...)
{
  return _[a1 capHeightToTop];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return _[a1 categories];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_cell_moreButtonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cell:moreButtonTapped:");
}

id objc_msgSend_cellClassForSettingType_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellClassForSettingType:inGroupWithIdentifier:");
}

id objc_msgSend_cellDidChangeSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidChangeSize:");
}

id objc_msgSend_cellDidPressDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidPressDelete:");
}

id objc_msgSend_cellDidPressMore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidPressMore:");
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_cellFor_specialPathBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellFor_specialPathBlock");
}

id objc_msgSend_cellHighlightedColor(void *a1, const char *a2, ...)
{
  return _[a1 cellHighlightedColor];
}

id objc_msgSend_cellIdentifierForSettingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellIdentifierForSettingType:");
}

id objc_msgSend_cellSecondaryTextColor(void *a1, const char *a2, ...)
{
  return _[a1 cellSecondaryTextColor];
}

id objc_msgSend_cellSelectedBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 cellSelectedBackgroundColor];
}

id objc_msgSend_cellSeparatorColor(void *a1, const char *a2, ...)
{
  return _[a1 cellSeparatorColor];
}

id objc_msgSend_cellTextColor(void *a1, const char *a2, ...)
{
  return _[a1 cellTextColor];
}

id objc_msgSend_changeGenerator(void *a1, const char *a2, ...)
{
  return _[a1 changeGenerator];
}

id objc_msgSend_changeHandler(void *a1, const char *a2, ...)
{
  return _[a1 changeHandler];
}

id objc_msgSend_changeIsUserDriven(void *a1, const char *a2, ...)
{
  return _[a1 changeIsUserDriven];
}

id objc_msgSend_changeItemCommand(void *a1, const char *a2, ...)
{
  return _[a1 changeItemCommand];
}

id objc_msgSend_changePositionToElapsedInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changePositionToElapsedInterval:");
}

id objc_msgSend_changeToItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeToItem:");
}

id objc_msgSend_changeToItemAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeToItemAtIndex:");
}

id objc_msgSend_changeToNextItem(void *a1, const char *a2, ...)
{
  return _[a1 changeToNextItem];
}

id objc_msgSend_changeToPreviousItem(void *a1, const char *a2, ...)
{
  return _[a1 changeToPreviousItem];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return _[a1 changeType];
}

id objc_msgSend_changedObjectID(void *a1, const char *a2, ...)
{
  return _[a1 changedObjectID];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return _[a1 changes];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _[a1 channel];
}

id objc_msgSend_channelForStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channelForStoreId:");
}

id objc_msgSend_channelItem(void *a1, const char *a2, ...)
{
  return _[a1 channelItem];
}

id objc_msgSend_channelStoreId(void *a1, const char *a2, ...)
{
  return _[a1 channelStoreId];
}

id objc_msgSend_chapters(void *a1, const char *a2, ...)
{
  return _[a1 chapters];
}

id objc_msgSend_checkAutoDownloadsForUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAutoDownloadsForUuids:");
}

id objc_msgSend_checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount_podcastsToUnsubscribeCount_newVersion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:podcastsToUnsubscribeCount:newVersion:");
}

id objc_msgSend_checkPotentialLibraryDeletionIssueForRemoteBookmarksCount_episodesToUnbookmarkCount_newVersion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "checkPotentialLibraryDeletionIssueForRemoteBookmarksCount:episodesToUnbookmarkCount:newVersion:");
}

id objc_msgSend_checkViabilityOfSyncLibraryAndUPP(void *a1, const char *a2, ...)
{
  return _[a1 checkViabilityOfSyncLibraryAndUPP];
}

id objc_msgSend_chevronImage(void *a1, const char *a2, ...)
{
  return _[a1 chevronImage];
}

id objc_msgSend_chevronView(void *a1, const char *a2, ...)
{
  return _[a1 chevronView];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 childViewControllers];
}

id objc_msgSend_clampsController(void *a1, const char *a2, ...)
{
  return _[a1 clampsController];
}

id objc_msgSend_cleanKeys(void *a1, const char *a2, ...)
{
  return _[a1 cleanKeys];
}

id objc_msgSend_cleanUpNeutralInterests(void *a1, const char *a2, ...)
{
  return _[a1 cleanUpNeutralInterests];
}

id objc_msgSend_cleanUpOldHiddenPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 cleanUpOldHiddenPodcasts];
}

id objc_msgSend_cleanedTitleStringWithPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanedTitleStringWithPrefix:");
}

id objc_msgSend_cleanupItem(void *a1, const char *a2, ...)
{
  return _[a1 cleanupItem];
}

id objc_msgSend_cleanupTemporaryResourcesDirectoryIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 cleanupTemporaryResourcesDirectoryIfNecessary];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _[a1 clear];
}

id objc_msgSend_clearAuthenticationRequest(void *a1, const char *a2, ...)
{
  return _[a1 clearAuthenticationRequest];
}

id objc_msgSend_clearBackOff(void *a1, const char *a2, ...)
{
  return _[a1 clearBackOff];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearDSIDCheckTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 clearDSIDCheckTimestamp];
}

id objc_msgSend_clearNetworkingBlocked(void *a1, const char *a2, ...)
{
  return _[a1 clearNetworkingBlocked];
}

id objc_msgSend_clearPlayQueueWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPlayQueueWithCompletionHandler:");
}

id objc_msgSend_clearPlayerManifestWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPlayerManifestWithCompletion:");
}

id objc_msgSend_clearQueueItems(void *a1, const char *a2, ...)
{
  return _[a1 clearQueueItems];
}

id objc_msgSend_clearTimestampForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTimestampForTransaction:");
}

id objc_msgSend_clearUpNextManifest(void *a1, const char *a2, ...)
{
  return _[a1 clearUpNextManifest];
}

id objc_msgSend_clearUserAcceptedSyncTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 clearUserAcceptedSyncTimestamp];
}

id objc_msgSend_clearUserCancelledSignIn(void *a1, const char *a2, ...)
{
  return _[a1 clearUserCancelledSignIn];
}

id objc_msgSend_clientClampErrorWithTransaction_retrySeconds_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientClampErrorWithTransaction:retrySeconds:underlyingError:");
}

id objc_msgSend_clientId(void *a1, const char *a2, ...)
{
  return _[a1 clientId];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closestIndexPathToRow_forIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closestIndexPathToRow:forIndexPaths:");
}

id objc_msgSend_cloudSyncBugReporter(void *a1, const char *a2, ...)
{
  return _[a1 cloudSyncBugReporter];
}

id objc_msgSend_cloudSyncController(void *a1, const char *a2, ...)
{
  return _[a1 cloudSyncController];
}

id objc_msgSend_cloudSyncIsDirty(void *a1, const char *a2, ...)
{
  return _[a1 cloudSyncIsDirty];
}

id objc_msgSend_cloudSyncVersion(void *a1, const char *a2, ...)
{
  return _[a1 cloudSyncVersion];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_collectionView_configureCell_withObject_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:configureCell:withObject:atIndexPath:");
}

id objc_msgSend_collectionView_configureReusableView_ofSupplementaryElementOfKind_forItemAtIndexPath_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:");
}

id objc_msgSend_collectionView_didEndEditingItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:didEndEditingItemAtIndexPath:");
}

id objc_msgSend_collectionView_didLongPressItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:didLongPressItemAtIndexPath:");
}

id objc_msgSend_collectionView_titleForHeaderInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:titleForHeaderInSection:");
}

id objc_msgSend_collectionView_willBeginEditingItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:willBeginEditingItemAtIndexPath:");
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewLayout];
}

id objc_msgSend_colorTheme(void *a1, const char *a2, ...)
{
  return _[a1 colorTheme];
}

id objc_msgSend_colorThemeForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorThemeForPodcastUuid:");
}

id objc_msgSend_colorView(void *a1, const char *a2, ...)
{
  return _[a1 colorView];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commandCenter(void *a1, const char *a2, ...)
{
  return _[a1 commandCenter];
}

id objc_msgSend_commandType(void *a1, const char *a2, ...)
{
  return _[a1 commandType];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_commitUniversalPlaybackPositionTransaction_domainVersion_metadataEnumerationBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitUniversalPlaybackPositionTransaction:domainVersion:metadataEnumerationBlock:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_completeAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeAndReturnError:");
}

id objc_msgSend_completeTransactionWithNewVersion_isGetTransaction_mismatch_finishedBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:");
}

id objc_msgSend_completeTransactionWithNewVersion_key_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeTransactionWithNewVersion:key:finishedBlock:");
}

id objc_msgSend_completeTransactionWithNewVersion_mismatch_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeTransactionWithNewVersion:mismatch:finishedBlock:");
}

id objc_msgSend_completedView(void *a1, const char *a2, ...)
{
  return _[a1 completedView];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_completions(void *a1, const char *a2, ...)
{
  return _[a1 completions];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compositeManifest(void *a1, const char *a2, ...)
{
  return _[a1 compositeManifest];
}

id objc_msgSend_compositeResultsController(void *a1, const char *a2, ...)
{
  return _[a1 compositeResultsController];
}

id objc_msgSend_compositingFilter(void *a1, const char *a2, ...)
{
  return _[a1 compositingFilter];
}

id objc_msgSend_concurrentMapWithStrideSize_on_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "concurrentMapWithStrideSize:on:withBlock:");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return _[a1 config];
}

id objc_msgSend_configWithSupportsMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configWithSupportsMetrics:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithFont:");
}

id objc_msgSend_configureCell_atIndexPath_withDescription_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:");
}

id objc_msgSend_configureCell_withObject_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCell:withObject:atIndexPath:");
}

id objc_msgSend_configureRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 configureRowHeight];
}

id objc_msgSend_configureSegments(void *a1, const char *a2, ...)
{
  return _[a1 configureSegments];
}

id objc_msgSend_configureSubviews(void *a1, const char *a2, ...)
{
  return _[a1 configureSubviews];
}

id objc_msgSend_conflictForSetTransaction_withData_forKey_version_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conflictForSetTransaction:withData:forKey:version:finishedBlock:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_consecutiveFeedFetchErrors(void *a1, const char *a2, ...)
{
  return _[a1 consecutiveFeedFetchErrors];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_containedView(void *a1, const char *a2, ...)
{
  return _[a1 containedView];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 containerIdentifier];
}

id objc_msgSend_containerOrder(void *a1, const char *a2, ...)
{
  return _[a1 containerOrder];
}

id objc_msgSend_containerOrderOptionArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerOrderOptionArray:");
}

id objc_msgSend_containerOrderOptionValues(void *a1, const char *a2, ...)
{
  return _[a1 containerOrderOptionValues];
}

id objc_msgSend_containerTitle(void *a1, const char *a2, ...)
{
  return _[a1 containerTitle];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_containsStringInsensitive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsStringInsensitive:");
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _[a1 contentInset];
}

id objc_msgSend_contentItem(void *a1, const char *a2, ...)
{
  return _[a1 contentItem];
}

id objc_msgSend_contentItemID(void *a1, const char *a2, ...)
{
  return _[a1 contentItemID];
}

id objc_msgSend_contentItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contentItemIdentifier];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentRectForCell_forState_rowWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentRectForCell:forState:rowWidth:");
}

id objc_msgSend_contentRectForEditControlWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentRectForEditControlWidth:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_contentsRect(void *a1, const char *a2, ...)
{
  return _[a1 contentsRect];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return _[a1 contextID];
}

id objc_msgSend_contextWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithReason:");
}

id objc_msgSend_continueActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueActivity:");
}

id objc_msgSend_continuePlaybackActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continuePlaybackActivity:");
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return _[a1 controller];
}

id objc_msgSend_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:");
}

id objc_msgSend_controllerAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerAtIndex:");
}

id objc_msgSend_controllerDidChangeContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerDidChangeContent:");
}

id objc_msgSend_controllerForDeletingStation_fromLibrary_deletionCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerForDeletingStation:fromLibrary:deletionCompletion:");
}

id objc_msgSend_controllerWillChangeContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerWillChangeContent:");
}

id objc_msgSend_controllerWithQosClass_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerWithQosClass:identifier:");
}

id objc_msgSend_controllerWithUserIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerWithUserIdentity:");
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return _[a1 controllers];
}

id objc_msgSend_convertActiveEndpointToBufferedAirPlayWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertActiveEndpointToBufferedAirPlayWithCompletion:");
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromView:");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyImageFromSourceUrl_sourceFileType_to_discardTransparency_enforceSquare_maxDimensionInPixels_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "copyImageFromSourceUrl:sourceFileType:to:discardTransparency:enforceSquare:maxDimensionInPixels:");
}

id objc_msgSend_copySettingsToSharedContainer(void *a1, const char *a2, ...)
{
  return _[a1 copySettingsToSharedContainer];
}

id objc_msgSend_copyWithPlayReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithPlayReason:");
}

id objc_msgSend_coreDataVersion(void *a1, const char *a2, ...)
{
  return _[a1 coreDataVersion];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cornerRadius];
}

id objc_msgSend_cornerRadiusForSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cornerRadiusForSize:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForFetchRequest:error:");
}

id objc_msgSend_countInfoButton(void *a1, const char *a2, ...)
{
  return _[a1 countInfoButton];
}

id objc_msgSend_countLabel(void *a1, const char *a2, ...)
{
  return _[a1 countLabel];
}

id objc_msgSend_countOfNewEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 countOfNewEpisodes];
}

id objc_msgSend_countOfNewEpisodesForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfNewEpisodesForPodcast:");
}

id objc_msgSend_countOfObjectsInEntity_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfObjectsInEntity:predicate:");
}

id objc_msgSend_countOfPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 countOfPodcasts];
}

id objc_msgSend_countOfUnplayedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 countOfUnplayedEpisodes];
}

id objc_msgSend_countOfUnplayedEpisodesForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfUnplayedEpisodesForPodcast:");
}

id objc_msgSend_countOfUnplayedRssEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 countOfUnplayedRssEpisodes];
}

id objc_msgSend_countView(void *a1, const char *a2, ...)
{
  return _[a1 countView];
}

id objc_msgSend_counterForGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 counterForGeneratingLibraryChangeNotifications];
}

id objc_msgSend_createAndSaveStationWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAndSaveStationWithTitle:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createEmptyContentController(void *a1, const char *a2, ...)
{
  return _[a1 createEmptyContentController];
}

id objc_msgSend_createEmptySectionCell(void *a1, const char *a2, ...)
{
  return _[a1 createEmptySectionCell];
}

id objc_msgSend_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:");
}

id objc_msgSend_createMoreAction(void *a1, const char *a2, ...)
{
  return _[a1 createMoreAction];
}

id objc_msgSend_createOrFindChannelFromFeedChannelItem_personalizedRequest_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrFindChannelFromFeedChannelItem:personalizedRequest:context:");
}

id objc_msgSend_createOrUpdateUPPMetadataFromUPPMediaItem_inCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrUpdateUPPMetadataFromUPPMediaItem:inCtx:");
}

id objc_msgSend_createOrUpdateUPPMetadataFromUPPRecord_inCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrUpdateUPPMetadataFromUPPRecord:inCtx:");
}

id objc_msgSend_createPersistentStoreForModel_attemptMigration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPersistentStoreForModel:attemptMigration:");
}

id objc_msgSend_createPrivateTempDirIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 createPrivateTempDirIfNeeded];
}

id objc_msgSend_createQueryObserver(void *a1, const char *a2, ...)
{
  return _[a1 createQueryObserver];
}

id objc_msgSend_createSectionCountDictionary(void *a1, const char *a2, ...)
{
  return _[a1 createSectionCountDictionary];
}

id objc_msgSend_createSectionForDarkPlacard(void *a1, const char *a2, ...)
{
  return _[a1 createSectionForDarkPlacard];
}

id objc_msgSend_createSectionForEmptyOverlay(void *a1, const char *a2, ...)
{
  return _[a1 createSectionForEmptyOverlay];
}

id objc_msgSend_createSectionForFeed(void *a1, const char *a2, ...)
{
  return _[a1 createSectionForFeed];
}

id objc_msgSend_createSectionForIsFromiTunesSync(void *a1, const char *a2, ...)
{
  return _[a1 createSectionForIsFromiTunesSync];
}

id objc_msgSend_createSectionForOtherEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 createSectionForOtherEpisodes];
}

id objc_msgSend_createSectionForPlayedToBeDeleted(void *a1, const char *a2, ...)
{
  return _[a1 createSectionForPlayedToBeDeleted];
}

id objc_msgSend_createSectionForUnplayed(void *a1, const char *a2, ...)
{
  return _[a1 createSectionForUnplayed];
}

id objc_msgSend_createSeparator(void *a1, const char *a2, ...)
{
  return _[a1 createSeparator];
}

id objc_msgSend_createSessionWithAsset_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSessionWithAsset:completion:");
}

id objc_msgSend_createVideoGlyphAttributedString(void *a1, const char *a2, ...)
{
  return _[a1 createVideoGlyphAttributedString];
}

id objc_msgSend_createWindowForApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWindowForApplication:");
}

id objc_msgSend_createWindowWithScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWindowWithScene:");
}

id objc_msgSend_createdPodcastUUID(void *a1, const char *a2, ...)
{
  return _[a1 createdPodcastUUID];
}

id objc_msgSend_crossfadeDuration(void *a1, const char *a2, ...)
{
  return _[a1 crossfadeDuration];
}

id objc_msgSend_currentAVItem(void *a1, const char *a2, ...)
{
  return _[a1 currentAVItem];
}

id objc_msgSend_currentActiveUser(void *a1, const char *a2, ...)
{
  return _[a1 currentActiveUser];
}

id objc_msgSend_currentActivity(void *a1, const char *a2, ...)
{
  return _[a1 currentActivity];
}

id objc_msgSend_currentAppContext(void *a1, const char *a2, ...)
{
  return _[a1 currentAppContext];
}

id objc_msgSend_currentAttributedStringIndex(void *a1, const char *a2, ...)
{
  return _[a1 currentAttributedStringIndex];
}

id objc_msgSend_currentChapter(void *a1, const char *a2, ...)
{
  return _[a1 currentChapter];
}

id objc_msgSend_currentChildViewController(void *a1, const char *a2, ...)
{
  return _[a1 currentChildViewController];
}

id objc_msgSend_currentDeserializer(void *a1, const char *a2, ...)
{
  return _[a1 currentDeserializer];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentFeedURL(void *a1, const char *a2, ...)
{
  return _[a1 currentFeedURL];
}

id objc_msgSend_currentIndex(void *a1, const char *a2, ...)
{
  return _[a1 currentIndex];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return _[a1 currentItem];
}

id objc_msgSend_currentKVSTransaction(void *a1, const char *a2, ...)
{
  return _[a1 currentKVSTransaction];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentManifest(void *a1, const char *a2, ...)
{
  return _[a1 currentManifest];
}

id objc_msgSend_currentManifestIndex(void *a1, const char *a2, ...)
{
  return _[a1 currentManifestIndex];
}

id objc_msgSend_currentMarqueeView(void *a1, const char *a2, ...)
{
  return _[a1 currentMarqueeView];
}

id objc_msgSend_currentMediaItem(void *a1, const char *a2, ...)
{
  return _[a1 currentMediaItem];
}

id objc_msgSend_currentMediaItemHasVideoContent(void *a1, const char *a2, ...)
{
  return _[a1 currentMediaItemHasVideoContent];
}

id objc_msgSend_currentMediaItemInitialLoadingComplete(void *a1, const char *a2, ...)
{
  return _[a1 currentMediaItemInitialLoadingComplete];
}

id objc_msgSend_currentMediaSelection(void *a1, const char *a2, ...)
{
  return _[a1 currentMediaSelection];
}

id objc_msgSend_currentPersistentHistoryTokenFromStores_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPersistentHistoryTokenFromStores:");
}

id objc_msgSend_currentPlayingElapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 currentPlayingElapsedTime];
}

id objc_msgSend_currentPlayingItem(void *a1, const char *a2, ...)
{
  return _[a1 currentPlayingItem];
}

id objc_msgSend_currentPodcastFeedURL(void *a1, const char *a2, ...)
{
  return _[a1 currentPodcastFeedURL];
}

id objc_msgSend_currentPodcastStateDescriptionFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPodcastStateDescriptionFrom:");
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _[a1 currentProcess];
}

id objc_msgSend_currentReachabilityStatus(void *a1, const char *a2, ...)
{
  return _[a1 currentReachabilityStatus];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return _[a1 currentRequest];
}

id objc_msgSend_currentSettings(void *a1, const char *a2, ...)
{
  return _[a1 currentSettings];
}

id objc_msgSend_currentShortTitle(void *a1, const char *a2, ...)
{
  return _[a1 currentShortTitle];
}

id objc_msgSend_currentStateMask(void *a1, const char *a2, ...)
{
  return _[a1 currentStateMask];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return _[a1 currentThread];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return _[a1 currentTime];
}

id objc_msgSend_currentTransaction(void *a1, const char *a2, ...)
{
  return _[a1 currentTransaction];
}

id objc_msgSend_currentlySubscribingStoreCollectionIds(void *a1, const char *a2, ...)
{
  return _[a1 currentlySubscribingStoreCollectionIds];
}

id objc_msgSend_customHeaderHeight(void *a1, const char *a2, ...)
{
  return _[a1 customHeaderHeight];
}

id objc_msgSend_customView(void *a1, const char *a2, ...)
{
  return _[a1 customView];
}

id objc_msgSend_customiseLabelAndSeparatorInsets(void *a1, const char *a2, ...)
{
  return _[a1 customiseLabelAndSeparatorInsets];
}

id objc_msgSend_darkCount(void *a1, const char *a2, ...)
{
  return _[a1 darkCount];
}

id objc_msgSend_darkDownloadsChangeWithWasDark_isDark_reason_previousExit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:");
}

id objc_msgSend_darkObserver(void *a1, const char *a2, ...)
{
  return _[a1 darkObserver];
}

id objc_msgSend_darkReason(void *a1, const char *a2, ...)
{
  return _[a1 darkReason];
}

id objc_msgSend_darkTextColor(void *a1, const char *a2, ...)
{
  return _[a1 darkTextColor];
}

id objc_msgSend_dataForSetTransaction_key_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForSetTransaction:key:version:");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataSourceTransactionContext(void *a1, const char *a2, ...)
{
  return _[a1 dataSourceTransactionContext];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithNodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithNodes:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return _[a1 databaseID];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFormatters(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatters];
}

id objc_msgSend_dateFromFormattedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromFormattedString:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateToFireNextTimer(void *a1, const char *a2, ...)
{
  return _[a1 dateToFireNextTimer];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_debugDataFileName(void *a1, const char *a2, ...)
{
  return _[a1 debugDataFileName];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_declinedAuthRequests(void *a1, const char *a2, ...)
{
  return _[a1 declinedAuthRequests];
}

id objc_msgSend_decodeAndSetPlaybackQueueForController_fromIdentifiers_enqueuer_accountLookupFailed_startPlayback_upNextQueueIntent_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "decodeAndSetPlaybackQueueForController:fromIdentifiers:enqueuer:accountLookupFailed:startPlayback:upNextQueue Intent:completion:");
}

id objc_msgSend_decodeAndSetPlaybackQueueForController_fromIdentifiers_sessionIdentifierOverride_enqueuer_accountLookupFailed_startPlayback_upNextQueueIntent_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "decodeAndSetPlaybackQueueForController:fromIdentifiers:sessionIdentifierOverride:enqueuer:accountLookupFailed :startPlayback:upNextQueueIntent:completion:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultActionButtonsXOriginForScrollFrame_andActionContainerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:");
}

id objc_msgSend_defaultArtworkForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultArtworkForStyle:");
}

id objc_msgSend_defaultAssetOptions(void *a1, const char *a2, ...)
{
  return _[a1 defaultAssetOptions];
}

id objc_msgSend_defaultCategory(void *a1, const char *a2, ...)
{
  return _[a1 defaultCategory];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfiguration];
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _[a1 defaultContext];
}

id objc_msgSend_defaultDescriptionFont(void *a1, const char *a2, ...)
{
  return _[a1 defaultDescriptionFont];
}

id objc_msgSend_defaultDomain(void *a1, const char *a2, ...)
{
  return _[a1 defaultDomain];
}

id objc_msgSend_defaultEpisodeLimit(void *a1, const char *a2, ...)
{
  return _[a1 defaultEpisodeLimit];
}

id objc_msgSend_defaultGetURL(void *a1, const char *a2, ...)
{
  return _[a1 defaultGetURL];
}

id objc_msgSend_defaultImageStoreURL(void *a1, const char *a2, ...)
{
  return _[a1 defaultImageStoreURL];
}

id objc_msgSend_defaultInstance(void *a1, const char *a2, ...)
{
  return _[a1 defaultInstance];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return _[a1 defaultMediaLibrary];
}

id objc_msgSend_defaultPlayer(void *a1, const char *a2, ...)
{
  return _[a1 defaultPlayer];
}

id objc_msgSend_defaultPodcastArtwork(void *a1, const char *a2, ...)
{
  return _[a1 defaultPodcastArtwork];
}

id objc_msgSend_defaultPollingInterval(void *a1, const char *a2, ...)
{
  return _[a1 defaultPollingInterval];
}

id objc_msgSend_defaultPropertiesThatAffectPredicate(void *a1, const char *a2, ...)
{
  return _[a1 defaultPropertiesThatAffectPredicate];
}

id objc_msgSend_defaultPropertiesToFetch(void *a1, const char *a2, ...)
{
  return _[a1 defaultPropertiesToFetch];
}

id objc_msgSend_defaultSetURL(void *a1, const char *a2, ...)
{
  return _[a1 defaultSetURL];
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return _[a1 defaultSettings];
}

id objc_msgSend_defaultShowType(void *a1, const char *a2, ...)
{
  return _[a1 defaultShowType];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_defaultSubtitleFont(void *a1, const char *a2, ...)
{
  return _[a1 defaultSubtitleFont];
}

id objc_msgSend_defaultSubtitleNumberOfLines(void *a1, const char *a2, ...)
{
  return _[a1 defaultSubtitleNumberOfLines];
}

id objc_msgSend_defaultSubtitleTextStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultSubtitleTextStyle];
}

id objc_msgSend_defaultTextColor(void *a1, const char *a2, ...)
{
  return _[a1 defaultTextColor];
}

id objc_msgSend_defaultTiteFont(void *a1, const char *a2, ...)
{
  return _[a1 defaultTiteFont];
}

id objc_msgSend_defaultTitleFont(void *a1, const char *a2, ...)
{
  return _[a1 defaultTitleFont];
}

id objc_msgSend_defaultTitleNumberOfLines(void *a1, const char *a2, ...)
{
  return _[a1 defaultTitleNumberOfLines];
}

id objc_msgSend_defaultTitleTextStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultTitleTextStyle];
}

id objc_msgSend_defaultToInitialIndexZero(void *a1, const char *a2, ...)
{
  return _[a1 defaultToInitialIndexZero];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_defaultsKey(void *a1, const char *a2, ...)
{
  return _[a1 defaultsKey];
}

id objc_msgSend_defaultsNotifier(void *a1, const char *a2, ...)
{
  return _[a1 defaultsNotifier];
}

id objc_msgSend_defaultsObserver(void *a1, const char *a2, ...)
{
  return _[a1 defaultsObserver];
}

id objc_msgSend_deferWork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferWork:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegateCancelledErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateCancelledErrorWithTransaction:underlyingError:");
}

id objc_msgSend_deleteAllContentInCtx_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllContentInCtx:error:");
}

id objc_msgSend_deleteAllInterestsBlockingCaller(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllInterestsBlockingCaller];
}

id objc_msgSend_deleteAllTopLevelStationsExcludingFolders(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllTopLevelStationsExcludingFolders];
}

id objc_msgSend_deleteAllUPPMetadata(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllUPPMetadata];
}

id objc_msgSend_deleteButton(void *a1, const char *a2, ...)
{
  return _[a1 deleteButton];
}

id objc_msgSend_deleteDuplicateVideoEpisodesForRdar59691904(void *a1, const char *a2, ...)
{
  return _[a1 deleteDuplicateVideoEpisodesForRdar59691904];
}

id objc_msgSend_deleteEpisodeAction(void *a1, const char *a2, ...)
{
  return _[a1 deleteEpisodeAction];
}

id objc_msgSend_deleteEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEpisodeUuids:");
}

id objc_msgSend_deleteEpisodeUuids_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEpisodeUuids:forced:");
}

id objc_msgSend_deleteEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEpisodes:");
}

id objc_msgSend_deleteHistoryBeforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteHistoryBeforeDate:");
}

id objc_msgSend_deleteItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteItems:");
}

id objc_msgSend_deleteItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteItemsAtIndexPaths:");
}

id objc_msgSend_deleteMediaItems_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMediaItems:completion:");
}

id objc_msgSend_deleteMigrationRegistryAtVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMigrationRegistryAtVersion:");
}

id objc_msgSend_deleteMusicSubscriptionInfoIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 deleteMusicSubscriptionInfoIfNeeded];
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_deleteOrUpdatePlaylist_ifIsDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteOrUpdatePlaylist:ifIsDefault:");
}

id objc_msgSend_deleteOrphanedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 deleteOrphanedEpisodes];
}

id objc_msgSend_deletePlayedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 deletePlayedEpisodes];
}

id objc_msgSend_deletePlayedEpisodesDefaultValue(void *a1, const char *a2, ...)
{
  return _[a1 deletePlayedEpisodesDefaultValue];
}

id objc_msgSend_deletePlayedEpisodesResolvedValue(void *a1, const char *a2, ...)
{
  return _[a1 deletePlayedEpisodesResolvedValue];
}

id objc_msgSend_deletePlayedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePlayedText:");
}

id objc_msgSend_deletePlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePlaylist:");
}

id objc_msgSend_deletePodcastWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePodcastWithUuid:");
}

id objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_deleteSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSections:withRowAnimation:");
}

id objc_msgSend_deleteStationAlertController(void *a1, const char *a2, ...)
{
  return _[a1 deleteStationAlertController];
}

id objc_msgSend_deletedEpisodeCount(void *a1, const char *a2, ...)
{
  return _[a1 deletedEpisodeCount];
}

id objc_msgSend_deletedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 deletedEpisodes];
}

id objc_msgSend_dependantPropertyKeys(void *a1, const char *a2, ...)
{
  return _[a1 dependantPropertyKeys];
}

id objc_msgSend_dependentKeys(void *a1, const char *a2, ...)
{
  return _[a1 dependentKeys];
}

id objc_msgSend_dependentPropertyKeys(void *a1, const char *a2, ...)
{
  return _[a1 dependentPropertyKeys];
}

id objc_msgSend_deprecatedImageStoreURL(void *a1, const char *a2, ...)
{
  return _[a1 deprecatedImageStoreURL];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");
}

id objc_msgSend_dequeueReusableHeaderFooterViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableHeaderFooterViewWithIdentifier:");
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:");
}

id objc_msgSend_deregister(void *a1, const char *a2, ...)
{
  return _[a1 deregister];
}

id objc_msgSend_derivedPropertiesForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "derivedPropertiesForPodcast:");
}

id objc_msgSend_derivedPropertyValueForKey_forPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "derivedPropertyValueForKey:forPodcast:");
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _[a1 descender];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionBodyTextForEpisode_html_withAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionBodyTextForEpisode:html:withAttributes:");
}

id objc_msgSend_descriptionButton(void *a1, const char *a2, ...)
{
  return _[a1 descriptionButton];
}

id objc_msgSend_descriptionButtonFrameForDescriptionFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionButtonFrameForDescriptionFrame:");
}

id objc_msgSend_descriptionCache(void *a1, const char *a2, ...)
{
  return _[a1 descriptionCache];
}

id objc_msgSend_descriptionCacheForEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionCacheForEpisodeUuid:");
}

id objc_msgSend_descriptionExclusionPathsForOrigin_descriptionWidth_buttonsFrame_titleFrame_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionExclusionPathsForOrigin:descriptionWidth:buttonsFrame:titleFrame:");
}

id objc_msgSend_descriptionFont(void *a1, const char *a2, ...)
{
  return _[a1 descriptionFont];
}

id objc_msgSend_descriptionFooterTextForEpisode_includesSeasonEpisodeType_includesDuration_includesPlayedIfPlayed_hasBodyText_unavailableReason_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "descriptionFooterTextForEpisode:includesSeasonEpisodeType:includesDuration:includesPlayedIfPlayed:hasBodyText :unavailableReason:");
}

id objc_msgSend_descriptionForEpisode_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForEpisode:options:");
}

id objc_msgSend_descriptionKeyForOptions_unavailableReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionKeyForOptions:unavailableReason:");
}

id objc_msgSend_descriptionMaxHeightForCurrentOrientation(void *a1, const char *a2, ...)
{
  return _[a1 descriptionMaxHeightForCurrentOrientation];
}

id objc_msgSend_descriptionNumberOfLinesForStyle_isTitleMultipleLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionNumberOfLinesForStyle:isTitleMultipleLines:");
}

id objc_msgSend_descriptionOriginForViewWidth_artworkFrame_buttonViewFrame_titleFrame_metadataFrame_iconViewFrame_style_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:");
}

id objc_msgSend_descriptionOriginYForTitleFrame_subtitleFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionOriginYForTitleFrame:subtitleFrame:");
}

id objc_msgSend_descriptionPrefixTextForEpisode_options_trailingNewline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionPrefixTextForEpisode:options:trailingNewline:");
}

id objc_msgSend_descriptionText(void *a1, const char *a2, ...)
{
  return _[a1 descriptionText];
}

id objc_msgSend_descriptionTextForEpisode_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionTextForEpisode:options:");
}

id objc_msgSend_descriptionTextStyle(void *a1, const char *a2, ...)
{
  return _[a1 descriptionTextStyle];
}

id objc_msgSend_descriptionTextView(void *a1, const char *a2, ...)
{
  return _[a1 descriptionTextView];
}

id objc_msgSend_descriptionView(void *a1, const char *a2, ...)
{
  return _[a1 descriptionView];
}

id objc_msgSend_descriptionWidthForViewWidth_titleFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionWidthForViewWidth:titleFrame:style:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_deserialize(void *a1, const char *a2, ...)
{
  return _[a1 deserialize];
}

id objc_msgSend_deserializeOperationDidFinish_shouldReschedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeOperationDidFinish:shouldReschedule:");
}

id objc_msgSend_destroyAndRebuildDatabase(void *a1, const char *a2, ...)
{
  return _[a1 destroyAndRebuildDatabase];
}

id objc_msgSend_detailListController_didTransitionToState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailListController:didTransitionToState:");
}

id objc_msgSend_detailListController_didUpdateFocusInContext_withAnimationCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailListController:didUpdateFocusInContext:withAnimationCoordinator:");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_determineCompositeIndexWithIndex_fromManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineCompositeIndexWithIndex:fromManifest:");
}

id objc_msgSend_determineiTunesMatchEnabledWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineiTunesMatchEnabledWithCompletion:");
}

id objc_msgSend_deviceAgreedTermsVersion(void *a1, const char *a2, ...)
{
  return _[a1 deviceAgreedTermsVersion];
}

id objc_msgSend_deviceLibraryPersistentID(void *a1, const char *a2, ...)
{
  return _[a1 deviceLibraryPersistentID];
}

id objc_msgSend_dictionariesToMerge(void *a1, const char *a2, ...)
{
  return _[a1 dictionariesToMerge];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryByDecomposingQueryStringWithURLDecode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryByDecomposingQueryStringWithURLDecode:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryToSecItemFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryToSecItemFormat:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_dictionaryWithValuesForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithValuesForKeys:");
}

id objc_msgSend_didBecomeActiveWhileMigrating(void *a1, const char *a2, ...)
{
  return _[a1 didBecomeActiveWhileMigrating];
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didDeletePersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeletePersistentId:");
}

id objc_msgSend_didDownloadFeedWithError_data_task_requestedUrl_useBackgroundFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDownloadFeedWithError:data:task:requestedUrl:useBackgroundFetch:");
}

id objc_msgSend_didEndRefreshing(void *a1, const char *a2, ...)
{
  return _[a1 didEndRefreshing];
}

id objc_msgSend_didFinishProcessingContextSaveHandlerForTests(void *a1, const char *a2, ...)
{
  return _[a1 didFinishProcessingContextSaveHandlerForTests];
}

id objc_msgSend_didFinishUpdatingAllFeeds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishUpdatingAllFeeds:");
}

id objc_msgSend_didFinishUpdatingFeedUrl_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishUpdatingFeedUrl:withError:");
}

id objc_msgSend_didLoadChapters(void *a1, const char *a2, ...)
{
  return _[a1 didLoadChapters];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didPerformActionInSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPerformActionInSheet:");
}

id objc_msgSend_didRestoreFeedUrlTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRestoreFeedUrlTask:");
}

id objc_msgSend_didRollbackStatusChangeWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRollbackStatusChangeWithCompletion:");
}

id objc_msgSend_didSelect_specialPathBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSelect_specialPathBlock");
}

id objc_msgSend_didStartUpdatingFeedUrl_cloudSyncUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartUpdatingFeedUrl:cloudSyncUrl:");
}

id objc_msgSend_dimView(void *a1, const char *a2, ...)
{
  return _[a1 dimView];
}

id objc_msgSend_dimmingView(void *a1, const char *a2, ...)
{
  return _[a1 dimmingView];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _[a1 direction];
}

id objc_msgSend_dirtyKeys(void *a1, const char *a2, ...)
{
  return _[a1 dirtyKeys];
}

id objc_msgSend_disableRefreshControlWhileEditing(void *a1, const char *a2, ...)
{
  return _[a1 disableRefreshControlWhileEditing];
}

id objc_msgSend_disableSubscriptionOnPodcastUUID_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableSubscriptionOnPodcastUUID:from:");
}

id objc_msgSend_disableSubscriptionsOnPodcastUUIDs_from_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableSubscriptionsOnPodcastUUIDs:from:context:");
}

id objc_msgSend_disableSubscriptionsWithUuids_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableSubscriptionsWithUuids:ctx:");
}

id objc_msgSend_disabledGroups(void *a1, const char *a2, ...)
{
  return _[a1 disabledGroups];
}

id objc_msgSend_disabledReason(void *a1, const char *a2, ...)
{
  return _[a1 disabledReason];
}

id objc_msgSend_diskCache(void *a1, const char *a2, ...)
{
  return _[a1 diskCache];
}

id objc_msgSend_dismissActionSheet(void *a1, const char *a2, ...)
{
  return _[a1 dismissActionSheet];
}

id objc_msgSend_dismissActionSheetsAndPopovers(void *a1, const char *a2, ...)
{
  return _[a1 dismissActionSheetsAndPopovers];
}

id objc_msgSend_dismissNowPlayingAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissNowPlayingAnimated:");
}

id objc_msgSend_dismissNowPlayingAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissNowPlayingAnimated:completion:");
}

id objc_msgSend_dismissOnTouchRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 dismissOnTouchRecognizer];
}

id objc_msgSend_dismissPopover(void *a1, const char *a2, ...)
{
  return _[a1 dismissPopover];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissWithResult:");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_displayType(void *a1, const char *a2, ...)
{
  return _[a1 displayType];
}

id objc_msgSend_distanceBetweenLabelFrames(void *a1, const char *a2, ...)
{
  return _[a1 distanceBetweenLabelFrames];
}

id objc_msgSend_distanceBetweenLabelFramesWithTitleFont_subtitleFont_multilineTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceBetweenLabelFramesWithTitleFont:subtitleFont:multilineTitle:");
}

id objc_msgSend_distanceFromIndexPath_toIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromIndexPath:toIndexPath:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_dividerBar(void *a1, const char *a2, ...)
{
  return _[a1 dividerBar];
}

id objc_msgSend_dividerColor(void *a1, const char *a2, ...)
{
  return _[a1 dividerColor];
}

id objc_msgSend_dividerView(void *a1, const char *a2, ...)
{
  return _[a1 dividerView];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_dotView(void *a1, const char *a2, ...)
{
  return _[a1 dotView];
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downButtonRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 downButtonRecognizer];
}

id objc_msgSend_downloadButtonFrameForActionButtonFrame_titleOriginY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadButtonFrameForActionButtonFrame:titleOriginY:");
}

id objc_msgSend_downloadBytes(void *a1, const char *a2, ...)
{
  return _[a1 downloadBytes];
}

id objc_msgSend_downloadDescription(void *a1, const char *a2, ...)
{
  return _[a1 downloadDescription];
}

id objc_msgSend_downloadImageForPodcastUuid_urlOptions_userInitiated_useBackgroundFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:");
}

id objc_msgSend_downloadImageForPodcastUuid_urlOptions_userInitiated_useBackgroundFetch_callback_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:callback:");
}

id objc_msgSend_downloadImageUrl_cacheKey_userInitiated_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadImageUrl:cacheKey:userInitiated:callback:");
}

id objc_msgSend_downloadOverdue(void *a1, const char *a2, ...)
{
  return _[a1 downloadOverdue];
}

id objc_msgSend_downloadPhase(void *a1, const char *a2, ...)
{
  return _[a1 downloadPhase];
}

id objc_msgSend_downloadPodcast_triggerBy_allowEpisodesTo404_isImplicitActionRequest_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadPodcast:triggerBy:allowEpisodesTo404:isImplicitActionRequest:completion:");
}

id objc_msgSend_downloadSizeLimitForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadSizeLimitForEpisode:");
}

id objc_msgSend_downloaded(void *a1, const char *a2, ...)
{
  return _[a1 downloaded];
}

id objc_msgSend_downloadedCount(void *a1, const char *a2, ...)
{
  return _[a1 downloadedCount];
}

id objc_msgSend_downloadedFileHasiPodLibraryURLWithDiscoveryPoint_path_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedFileHasiPodLibraryURLWithDiscoveryPoint:path:source:");
}

id objc_msgSend_downloadsSettingsGroup(void *a1, const char *a2, ...)
{
  return _[a1 downloadsSettingsGroup];
}

id objc_msgSend_drawInRect_blendMode_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:blendMode:alpha:");
}

id objc_msgSend_drawTextInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawTextInRect:");
}

id objc_msgSend_dryRun(void *a1, const char *a2, ...)
{
  return _[a1 dryRun];
}

id objc_msgSend_dsidCheckTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 dsidCheckTimestamp];
}

id objc_msgSend_dummyTrackCreatedButNotInList(void *a1, const char *a2, ...)
{
  return _[a1 dummyTrackCreatedButNotInList];
}

id objc_msgSend_dummyTrackList(void *a1, const char *a2, ...)
{
  return _[a1 dummyTrackList];
}

id objc_msgSend_dumpPlist(void *a1, const char *a2, ...)
{
  return _[a1 dumpPlist];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_durationLabel(void *a1, const char *a2, ...)
{
  return _[a1 durationLabel];
}

id objc_msgSend_durationSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 durationSnapshot];
}

id objc_msgSend_durationWatched(void *a1, const char *a2, ...)
{
  return _[a1 durationWatched];
}

id objc_msgSend_edgesForExtendedLayout(void *a1, const char *a2, ...)
{
  return _[a1 edgesForExtendedLayout];
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 editButtonItem];
}

id objc_msgSend_editingControlRectInBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editingControlRectInBounds:");
}

id objc_msgSend_editingStyle(void *a1, const char *a2, ...)
{
  return _[a1 editingStyle];
}

id objc_msgSend_effectForBlurEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectForBlurEffect:");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTime];
}

id objc_msgSend_elapsedTimeJumpInProgress(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeJumpInProgress];
}

id objc_msgSend_elapsedTimeObservers(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeObservers];
}

id objc_msgSend_emptyContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 emptyContentViewController];
}

id objc_msgSend_emptyContentViewControllerForCurrentPodcastState(void *a1, const char *a2, ...)
{
  return _[a1 emptyContentViewControllerForCurrentPodcastState];
}

id objc_msgSend_emptyOverlay(void *a1, const char *a2, ...)
{
  return _[a1 emptyOverlay];
}

id objc_msgSend_emptyPropertySet(void *a1, const char *a2, ...)
{
  return _[a1 emptyPropertySet];
}

id objc_msgSend_enable(void *a1, const char *a2, ...)
{
  return _[a1 enable];
}

id objc_msgSend_enableAssetDeletionIfPossible(void *a1, const char *a2, ...)
{
  return _[a1 enableAssetDeletionIfPossible];
}

id objc_msgSend_enableAssetDeletionIfPossible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableAssetDeletionIfPossible:");
}

id objc_msgSend_enableSubscriptionOnPodcastUUID_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableSubscriptionOnPodcastUUID:from:");
}

id objc_msgSend_enableSubscriptionOnPodcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableSubscriptionOnPodcastUuid:ctx:");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_enclosureURL(void *a1, const char *a2, ...)
{
  return _[a1 enclosureURL];
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedQueryStringFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodedQueryStringFromDictionary:");
}

id objc_msgSend_endAutomaticResponseLoading(void *a1, const char *a2, ...)
{
  return _[a1 endAutomaticResponseLoading];
}

id objc_msgSend_endBackgroundTask(void *a1, const char *a2, ...)
{
  return _[a1 endBackgroundTask];
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 endGeneratingLibraryChangeNotifications];
}

id objc_msgSend_endObserving(void *a1, const char *a2, ...)
{
  return _[a1 endObserving];
}

id objc_msgSend_endOfTrack(void *a1, const char *a2, ...)
{
  return _[a1 endOfTrack];
}

id objc_msgSend_endRefreshing(void *a1, const char *a2, ...)
{
  return _[a1 endRefreshing];
}

id objc_msgSend_endSeek(void *a1, const char *a2, ...)
{
  return _[a1 endSeek];
}

id objc_msgSend_endTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTimer:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_endedEpisodeUuids(void *a1, const char *a2, ...)
{
  return _[a1 endedEpisodeUuids];
}

id objc_msgSend_endpointRoute(void *a1, const char *a2, ...)
{
  return _[a1 endpointRoute];
}

id objc_msgSend_enqueueWorkBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueWorkBlock:");
}

id objc_msgSend_enqueuedByAnotherUser(void *a1, const char *a2, ...)
{
  return _[a1 enqueuedByAnotherUser];
}

id objc_msgSend_entitiesByName(void *a1, const char *a2, ...)
{
  return _[a1 entitiesByName];
}

id objc_msgSend_entitledDuration(void *a1, const char *a2, ...)
{
  return _[a1 entitledDuration];
}

id objc_msgSend_entitledEnclosureURL(void *a1, const char *a2, ...)
{
  return _[a1 entitledEnclosureURL];
}

id objc_msgSend_entitledPriceType(void *a1, const char *a2, ...)
{
  return _[a1 entitledPriceType];
}

id objc_msgSend_entitledTranscriptIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 entitledTranscriptIdentifier];
}

id objc_msgSend_entitledTranscriptProvider(void *a1, const char *a2, ...)
{
  return _[a1 entitledTranscriptProvider];
}

id objc_msgSend_entitledTranscriptSnippet(void *a1, const char *a2, ...)
{
  return _[a1 entitledTranscriptSnippet];
}

id objc_msgSend_entitlementState(void *a1, const char *a2, ...)
{
  return _[a1 entitlementState];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return _[a1 entity];
}

id objc_msgSend_entityForName_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityForName:inManagedObjectContext:");
}

id objc_msgSend_entityName(void *a1, const char *a2, ...)
{
  return _[a1 entityName];
}

id objc_msgSend_enumerateItemsInSectionAtIndex_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateItemsInSectionAtIndex:usingBlock:");
}

id objc_msgSend_enumerateItemsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateItemsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateLineFragmentsForGlyphRange_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateLineFragmentsForGlyphRange:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateSectionsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSectionsUsingBlock:");
}

id objc_msgSend_enumerateUnvisitedItemUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateUnvisitedItemUuids:");
}

id objc_msgSend_enumerateValuesForProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateValuesForProperties:usingBlock:");
}

id objc_msgSend_episode(void *a1, const char *a2, ...)
{
  return _[a1 episode];
}

id objc_msgSend_episodeAdamId(void *a1, const char *a2, ...)
{
  return _[a1 episodeAdamId];
}

id objc_msgSend_episodeAdamIds(void *a1, const char *a2, ...)
{
  return _[a1 episodeAdamIds];
}

id objc_msgSend_episodeArtworkProperties(void *a1, const char *a2, ...)
{
  return _[a1 episodeArtworkProperties];
}

id objc_msgSend_episodeCache(void *a1, const char *a2, ...)
{
  return _[a1 episodeCache];
}

id objc_msgSend_episodeCacheForStoreMediaDictionaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeCacheForStoreMediaDictionaries:");
}

id objc_msgSend_episodeCellClass(void *a1, const char *a2, ...)
{
  return _[a1 episodeCellClass];
}

id objc_msgSend_episodeDescriptionViewController_playEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeDescriptionViewController:playEpisode:");
}

id objc_msgSend_episodeDetailViewController_playEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeDetailViewController:playEpisode:");
}

id objc_msgSend_episodeForAssetUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForAssetUrl:");
}

id objc_msgSend_episodeForEnclosure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForEnclosure:");
}

id objc_msgSend_episodeForGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForGuid:");
}

id objc_msgSend_episodeForPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForPersistentID:");
}

id objc_msgSend_episodeForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForPlayerItem:");
}

id objc_msgSend_episodeForTitle_pubDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForTitle:pubDate:");
}

id objc_msgSend_episodeForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForUUID:");
}

id objc_msgSend_episodeForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForUuid:");
}

id objc_msgSend_episodeGUID(void *a1, const char *a2, ...)
{
  return _[a1 episodeGUID];
}

id objc_msgSend_episodeGuid(void *a1, const char *a2, ...)
{
  return _[a1 episodeGuid];
}

id objc_msgSend_episodeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 episodeIdentifier];
}

id objc_msgSend_episodeLimit(void *a1, const char *a2, ...)
{
  return _[a1 episodeLimit];
}

id objc_msgSend_episodeLimitDefaultValue(void *a1, const char *a2, ...)
{
  return _[a1 episodeLimitDefaultValue];
}

id objc_msgSend_episodeLimitForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeLimitForKey:");
}

id objc_msgSend_episodeList(void *a1, const char *a2, ...)
{
  return _[a1 episodeList];
}

id objc_msgSend_episodeLockup(void *a1, const char *a2, ...)
{
  return _[a1 episodeLockup];
}

id objc_msgSend_episodeMigrationForVersion0to1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion0to1:");
}

id objc_msgSend_episodeMigrationForVersion13to14_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion13to14:");
}

id objc_msgSend_episodeMigrationForVersion16to17_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion16to17:");
}

id objc_msgSend_episodeMigrationForVersion17to18_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion17to18:");
}

id objc_msgSend_episodeMigrationForVersion21to22_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion21to22:");
}

id objc_msgSend_episodeMigrationForVersion23to24_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion23to24:");
}

id objc_msgSend_episodeMigrationForVersion24to25_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion24to25:");
}

id objc_msgSend_episodeMigrationForVersion29to30_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion29to30:");
}

id objc_msgSend_episodeMigrationForVersion6to7_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion6to7:");
}

id objc_msgSend_episodeNumber(void *a1, const char *a2, ...)
{
  return _[a1 episodeNumber];
}

id objc_msgSend_episodeObjectID(void *a1, const char *a2, ...)
{
  return _[a1 episodeObjectID];
}

id objc_msgSend_episodeObserverForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeObserverForPodcastUuid:");
}

id objc_msgSend_episodeObservers(void *a1, const char *a2, ...)
{
  return _[a1 episodeObservers];
}

id objc_msgSend_episodeOrderSettingsGroup(void *a1, const char *a2, ...)
{
  return _[a1 episodeOrderSettingsGroup];
}

id objc_msgSend_episodePredicateForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodePredicateForPodcast:");
}

id objc_msgSend_episodeResultsChangedForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeResultsChangedForPodcastUuid:");
}

id objc_msgSend_episodeSection_didChangeObject_atIndex_forChangeType_newIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeSection:didChangeObject:atIndex:forChangeType:newIndex:");
}

id objc_msgSend_episodeSection_didChangeObject_atIndexPath_forChangeType_newIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeSection:didChangeObject:atIndexPath:forChangeType:newIndexPath:");
}

id objc_msgSend_episodeSerpentID(void *a1, const char *a2, ...)
{
  return _[a1 episodeSerpentID];
}

id objc_msgSend_episodeShareUrl(void *a1, const char *a2, ...)
{
  return _[a1 episodeShareUrl];
}

id objc_msgSend_episodeSortDescriptorsForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeSortDescriptorsForPodcast:");
}

id objc_msgSend_episodeStoreId(void *a1, const char *a2, ...)
{
  return _[a1 episodeStoreId];
}

id objc_msgSend_episodeSyncStorage(void *a1, const char *a2, ...)
{
  return _[a1 episodeSyncStorage];
}

id objc_msgSend_episodeType(void *a1, const char *a2, ...)
{
  return _[a1 episodeType];
}

id objc_msgSend_episodeTypeResolvedValue(void *a1, const char *a2, ...)
{
  return _[a1 episodeTypeResolvedValue];
}

id objc_msgSend_episodeUUIDs(void *a1, const char *a2, ...)
{
  return _[a1 episodeUUIDs];
}

id objc_msgSend_episodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 episodeUuid];
}

id objc_msgSend_episodeUuidForActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuidForActivity:completion:");
}

id objc_msgSend_episodeUuidForSetPlaybackQueueRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuidForSetPlaybackQueueRequestIdentifier:");
}

id objc_msgSend_episodeUuidObserver_resultsChangedForPodcast_withDeletedIds_andInsertIds_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuidObserver:resultsChangedForPodcast:withDeletedIds:andInsertIds:");
}

id objc_msgSend_episodeUuids(void *a1, const char *a2, ...)
{
  return _[a1 episodeUuids];
}

id objc_msgSend_episodeWithValue_forPropertyKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeWithValue:forPropertyKey:");
}

id objc_msgSend_episodes(void *a1, const char *a2, ...)
{
  return _[a1 episodes];
}

id objc_msgSend_episodesInLatestSeasonWithLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesInLatestSeasonWithLimit:");
}

id objc_msgSend_episodesOptionArray_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesOptionArray:defaultValue:");
}

id objc_msgSend_episodesOptionValues(void *a1, const char *a2, ...)
{
  return _[a1 episodesOptionValues];
}

id objc_msgSend_episodesToKeepDefaultValue(void *a1, const char *a2, ...)
{
  return _[a1 episodesToKeepDefaultValue];
}

id objc_msgSend_episodesToKeepSetting(void *a1, const char *a2, ...)
{
  return _[a1 episodesToKeepSetting];
}

id objc_msgSend_episodesToKeepToEpisodeLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesToKeepToEpisodeLimit:");
}

id objc_msgSend_episodesToShow(void *a1, const char *a2, ...)
{
  return _[a1 episodesToShow];
}

id objc_msgSend_episodesWithMissingAdamIdsForPodcast_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesWithMissingAdamIdsForPodcast:withContext:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorCannotGenerateInternalURL(void *a1, const char *a2, ...)
{
  return _[a1 errorCannotGenerateInternalURL];
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return _[a1 errorCode];
}

id objc_msgSend_errorComment(void *a1, const char *a2, ...)
{
  return _[a1 errorComment];
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return _[a1 errorDomain];
}

id objc_msgSend_errorLog(void *a1, const char *a2, ...)
{
  return _[a1 errorLog];
}

id objc_msgSend_errorStatusCode(void *a1, const char *a2, ...)
{
  return _[a1 errorStatusCode];
}

id objc_msgSend_errorURLDoesNotExist(void *a1, const char *a2, ...)
{
  return _[a1 errorURLDoesNotExist];
}

id objc_msgSend_errorURLInvalid(void *a1, const char *a2, ...)
{
  return _[a1 errorURLInvalid];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_estimatedHeightForWidth_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedHeightForWidth:style:");
}

id objc_msgSend_estimatedSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedSize:");
}

id objc_msgSend_evaluate_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluate:completionBlock:");
}

id objc_msgSend_evaluateDelegateBlockSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateDelegateBlockSync:");
}

id objc_msgSend_evaluateInJavaScriptContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateInJavaScriptContext:completion:");
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateWithObject:");
}

id objc_msgSend_eventId(void *a1, const char *a2, ...)
{
  return _[a1 eventId];
}

id objc_msgSend_eventWithAccessLog_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithAccessLog:dataSource:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _[a1 events];
}

id objc_msgSend_exactDescriptionSizeForOrigin_viewWidth_titleFrame_actionButtonFrame_downloadButtonFrame_style_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executeFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_executeRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeRequest:error:");
}

id objc_msgSend_existingEpisodeWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingEpisodeWithID:");
}

id objc_msgSend_exists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exists:");
}

id objc_msgSend_expandFeedUrls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expandFeedUrls:");
}

id objc_msgSend_expandedIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 expandedIndexPath];
}

id objc_msgSend_expirationBlock(void *a1, const char *a2, ...)
{
  return _[a1 expirationBlock];
}

id objc_msgSend_explicitContentBadgeTreatment(void *a1, const char *a2, ...)
{
  return _[a1 explicitContentBadgeTreatment];
}

id objc_msgSend_explicitIcon(void *a1, const char *a2, ...)
{
  return _[a1 explicitIcon];
}

id objc_msgSend_explicitIconView(void *a1, const char *a2, ...)
{
  return _[a1 explicitIconView];
}

id objc_msgSend_explicitSortOrder(void *a1, const char *a2, ...)
{
  return _[a1 explicitSortOrder];
}

id objc_msgSend_explicitTreatment(void *a1, const char *a2, ...)
{
  return _[a1 explicitTreatment];
}

id objc_msgSend_exposeActionsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exposeActionsAnimated:");
}

id objc_msgSend_exposedActions(void *a1, const char *a2, ...)
{
  return _[a1 exposedActions];
}

id objc_msgSend_externalFeedDownloader(void *a1, const char *a2, ...)
{
  return _[a1 externalFeedDownloader];
}

id objc_msgSend_fadeHeight(void *a1, const char *a2, ...)
{
  return _[a1 fadeHeight];
}

id objc_msgSend_fadeView(void *a1, const char *a2, ...)
{
  return _[a1 fadeView];
}

id objc_msgSend_fairPlayKeyLoader(void *a1, const char *a2, ...)
{
  return _[a1 fairPlayKeyLoader];
}

id objc_msgSend_fairPlayKeySession(void *a1, const char *a2, ...)
{
  return _[a1 fairPlayKeySession];
}

id objc_msgSend_fairPlayMigrationBackgroundTask(void *a1, const char *a2, ...)
{
  return _[a1 fairPlayMigrationBackgroundTask];
}

id objc_msgSend_fairPlayMigrationRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 fairPlayMigrationRetryCount];
}

id objc_msgSend_fairPlayValidationManager(void *a1, const char *a2, ...)
{
  return _[a1 fairPlayValidationManager];
}

id objc_msgSend_falsePredicate(void *a1, const char *a2, ...)
{
  return _[a1 falsePredicate];
}

id objc_msgSend_fastForward(void *a1, const char *a2, ...)
{
  return _[a1 fastForward];
}

id objc_msgSend_fastScrollTimer(void *a1, const char *a2, ...)
{
  return _[a1 fastScrollTimer];
}

id objc_msgSend_fatalSyncError(void *a1, const char *a2, ...)
{
  return _[a1 fatalSyncError];
}

id objc_msgSend_feedChangedDate(void *a1, const char *a2, ...)
{
  return _[a1 feedChangedDate];
}

id objc_msgSend_feedDeleted(void *a1, const char *a2, ...)
{
  return _[a1 feedDeleted];
}

id objc_msgSend_feedDescription(void *a1, const char *a2, ...)
{
  return _[a1 feedDescription];
}

id objc_msgSend_feedDownloadedWithError_task_requestedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedDownloadedWithError:task:requestedUrl:");
}

id objc_msgSend_feedManager(void *a1, const char *a2, ...)
{
  return _[a1 feedManager];
}

id objc_msgSend_feedProcessingQueue(void *a1, const char *a2, ...)
{
  return _[a1 feedProcessingQueue];
}

id objc_msgSend_feedSections(void *a1, const char *a2, ...)
{
  return _[a1 feedSections];
}

id objc_msgSend_feedURL(void *a1, const char *a2, ...)
{
  return _[a1 feedURL];
}

id objc_msgSend_feedURLComposer(void *a1, const char *a2, ...)
{
  return _[a1 feedURLComposer];
}

id objc_msgSend_feedURLForOptionalURL_adamID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedURLForOptionalURL:adamID:error:");
}

id objc_msgSend_feedURLIsEmpty(void *a1, const char *a2, ...)
{
  return _[a1 feedURLIsEmpty];
}

id objc_msgSend_feedUpdateAllPodcastsOnForeground(void *a1, const char *a2, ...)
{
  return _[a1 feedUpdateAllPodcastsOnForeground];
}

id objc_msgSend_feedUpdateNeedsRetry(void *a1, const char *a2, ...)
{
  return _[a1 feedUpdateNeedsRetry];
}

id objc_msgSend_feedUpdatesDisabled(void *a1, const char *a2, ...)
{
  return _[a1 feedUpdatesDisabled];
}

id objc_msgSend_feedUrl(void *a1, const char *a2, ...)
{
  return _[a1 feedUrl];
}

id objc_msgSend_feedUrlFromModernKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedUrlFromModernKey:");
}

id objc_msgSend_feedUrlsToParams(void *a1, const char *a2, ...)
{
  return _[a1 feedUrlsToParams];
}

id objc_msgSend_fetchArtwork(void *a1, const char *a2, ...)
{
  return _[a1 fetchArtwork];
}

id objc_msgSend_fetchArtworkForPodcastUuid_size_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchArtworkForPodcastUuid:size:completion:");
}

id objc_msgSend_fetchBatchSize(void *a1, const char *a2, ...)
{
  return _[a1 fetchBatchSize];
}

id objc_msgSend_fetchChannelUpdatesCheckingEntitlementsNotification(void *a1, const char *a2, ...)
{
  return _[a1 fetchChannelUpdatesCheckingEntitlementsNotification];
}

id objc_msgSend_fetchDescription(void *a1, const char *a2, ...)
{
  return _[a1 fetchDescription];
}

id objc_msgSend_fetchEntityName(void *a1, const char *a2, ...)
{
  return _[a1 fetchEntityName];
}

id objc_msgSend_fetchFeedsExpectedToUpdate(void *a1, const char *a2, ...)
{
  return _[a1 fetchFeedsExpectedToUpdate];
}

id objc_msgSend_fetchHistoryAfterToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchHistoryAfterToken:");
}

id objc_msgSend_fetchInfoCenterArtworkWith_at_of_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchInfoCenterArtworkWith:at:of:completion:");
}

id objc_msgSend_fetchLimit(void *a1, const char *a2, ...)
{
  return _[a1 fetchLimit];
}

id objc_msgSend_fetchManagedObjectModelFromDisk(void *a1, const char *a2, ...)
{
  return _[a1 fetchManagedObjectModelFromDisk];
}

id objc_msgSend_fetchOutOfDateShowUUIDsWith_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchOutOfDateShowUUIDsWith:completionHandler:");
}

id objc_msgSend_fetchOutOfDateShowUUIDsWithIncludeImplicit_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchOutOfDateShowUUIDsWithIncludeImplicit:completionHandler:");
}

id objc_msgSend_fetchPlayerItemsFor_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPlayerItemsFor:completion:");
}

id objc_msgSend_fetchPlayerItemsForPlaybackQueueRequestIdentifiers_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPlayerItemsForPlaybackQueueRequestIdentifiers:completion:");
}

id objc_msgSend_fetchPlayerItemsForPlaybackQueueRequestIdentifiers_initiatedByAnotherUser_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPlayerItemsForPlaybackQueueRequestIdentifiers:initiatedByAnotherUser:completion:");
}

id objc_msgSend_fetchPlayerItemsForStoreTrackIDs_initiatedByAnotherUser_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPlayerItemsForStoreTrackIDs:initiatedByAnotherUser:completion:");
}

id objc_msgSend_fetchPredicate(void *a1, const char *a2, ...)
{
  return _[a1 fetchPredicate];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _[a1 fetchRequest];
}

id objc_msgSend_fetchRequestInManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestInManagedObjectContext:");
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestWithEntityName:");
}

id objc_msgSend_fetchSubtitleOptions(void *a1, const char *a2, ...)
{
  return _[a1 fetchSubtitleOptions];
}

id objc_msgSend_fetchedObjects(void *a1, const char *a2, ...)
{
  return _[a1 fetchedObjects];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileExtension(void *a1, const char *a2, ...)
{
  return _[a1 fileExtension];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return _[a1 fileType];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findDuplicateItemsWithEntity_itemsToLookAtFilter_keysThatMustMatchToBeConsideredADuplicate_keysThatShouldNotBeDuplicated_keyValuesOfDuplicatedItemsToReturn_sortDescriptors_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "findDuplicateItemsWithEntity:itemsToLookAtFilter:keysThatMustMatchToBeConsideredADuplicate:keysThatShouldNotB eDuplicated:keyValuesOfDuplicatedItemsToReturn:sortDescriptors:");
}

id objc_msgSend_findEpisodeByFeedURL_guid_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEpisodeByFeedURL:guid:inContext:");
}

id objc_msgSend_findEpisodeByStoreID_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEpisodeByStoreID:inContext:");
}

id objc_msgSend_findEpisodeFromModelObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEpisodeFromModelObject:");
}

id objc_msgSend_findEpisodeWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEpisodeWithRequest:");
}

id objc_msgSend_findIndexOfCommand_inArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findIndexOfCommand:inArray:");
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return _[a1 finish];
}

id objc_msgSend_finishSuccessfulTransactionWithNewVersion_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishSuccessfulTransactionWithNewVersion:finishedBlock:");
}

id objc_msgSend_finishTaskOperationWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishTaskOperationWithResult:error:");
}

id objc_msgSend_finishWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithStatus:");
}

id objc_msgSend_finishedHandler(void *a1, const char *a2, ...)
{
  return _[a1 finishedHandler];
}

id objc_msgSend_finishedWithoutURL(void *a1, const char *a2, ...)
{
  return _[a1 finishedWithoutURL];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return _[a1 firstIndex];
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return _[a1 firstItem];
}

id objc_msgSend_firstItemIsRestricted(void *a1, const char *a2, ...)
{
  return _[a1 firstItemIsRestricted];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstTimeAvailable(void *a1, const char *a2, ...)
{
  return _[a1 firstTimeAvailable];
}

id objc_msgSend_firstTimeAvailableAsFree(void *a1, const char *a2, ...)
{
  return _[a1 firstTimeAvailableAsFree];
}

id objc_msgSend_firstTimeAvailableAsPaid(void *a1, const char *a2, ...)
{
  return _[a1 firstTimeAvailableAsPaid];
}

id objc_msgSend_firstValidIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 firstValidIndexPath];
}

id objc_msgSend_fixEmptyTextContainers(void *a1, const char *a2, ...)
{
  return _[a1 fixEmptyTextContainers];
}

id objc_msgSend_fixupDataMigrationVersion(void *a1, const char *a2, ...)
{
  return _[a1 fixupDataMigrationVersion];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_flattenedGenericObject(void *a1, const char *a2, ...)
{
  return _[a1 flattenedGenericObject];
}

id objc_msgSend_floatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatForKey:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_floating(void *a1, const char *a2, ...)
{
  return _[a1 floating];
}

id objc_msgSend_floatingContentView(void *a1, const char *a2, ...)
{
  return _[a1 floatingContentView];
}

id objc_msgSend_flushInvocations(void *a1, const char *a2, ...)
{
  return _[a1 flushInvocations];
}

id objc_msgSend_flushVisitedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 flushVisitedEpisodes];
}

id objc_msgSend_focusedView(void *a1, const char *a2, ...)
{
  return _[a1 focusedView];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_footerAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "footerAttributedString:");
}

id objc_msgSend_footerAttributedString_additionalAttributeName_additionalAttributeValue_additionalAttributeRange_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:");
}

id objc_msgSend_footerCallback(void *a1, const char *a2, ...)
{
  return _[a1 footerCallback];
}

id objc_msgSend_footerFrameForDescriptionButtonFrame_descriptionFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "footerFrameForDescriptionButtonFrame:descriptionFrame:");
}

id objc_msgSend_footerText(void *a1, const char *a2, ...)
{
  return _[a1 footerText];
}

id objc_msgSend_footerTextStyle(void *a1, const char *a2, ...)
{
  return _[a1 footerTextStyle];
}

id objc_msgSend_footerTextView(void *a1, const char *a2, ...)
{
  return _[a1 footerTextView];
}

id objc_msgSend_footerView(void *a1, const char *a2, ...)
{
  return _[a1 footerView];
}

id objc_msgSend_forceFetchLatestChannelUpdates(void *a1, const char *a2, ...)
{
  return _[a1 forceFetchLatestChannelUpdates];
}

id objc_msgSend_foreground(void *a1, const char *a2, ...)
{
  return _[a1 foreground];
}

id objc_msgSend_formatDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatDate:");
}

id objc_msgSend_forwardInvocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forwardInvocation:");
}

id objc_msgSend_forwardmostCMTimeRangeInCMTimeRanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forwardmostCMTimeRangeInCMTimeRanges:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frc(void *a1, const char *a2, ...)
{
  return _[a1 frc];
}

id objc_msgSend_frcState(void *a1, const char *a2, ...)
{
  return _[a1 frcState];
}

id objc_msgSend_freeDuration(void *a1, const char *a2, ...)
{
  return _[a1 freeDuration];
}

id objc_msgSend_freeEnclosureURL(void *a1, const char *a2, ...)
{
  return _[a1 freeEnclosureURL];
}

id objc_msgSend_freePriceType(void *a1, const char *a2, ...)
{
  return _[a1 freePriceType];
}

id objc_msgSend_freeTranscriptIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 freeTranscriptIdentifier];
}

id objc_msgSend_freeTranscriptProvider(void *a1, const char *a2, ...)
{
  return _[a1 freeTranscriptProvider];
}

id objc_msgSend_freeTranscriptSnippet(void *a1, const char *a2, ...)
{
  return _[a1 freeTranscriptSnippet];
}

id objc_msgSend_friendlyDisplayString(void *a1, const char *a2, ...)
{
  return _[a1 friendlyDisplayString];
}

id objc_msgSend_friendlyPubDateStringForEpisode_abbreviated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendlyPubDateStringForEpisode:abbreviated:");
}

id objc_msgSend_generateChangesForExistingObjects_newObjects_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateChangesForExistingObjects:newObjects:inSection:");
}

id objc_msgSend_generator(void *a1, const char *a2, ...)
{
  return _[a1 generator];
}

id objc_msgSend_generator_didChangeObject_atIndexPath_forChangeType_newIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generator:didChangeObject:atIndexPath:forChangeType:newIndexPath:");
}

id objc_msgSend_genericError(void *a1, const char *a2, ...)
{
  return _[a1 genericError];
}

id objc_msgSend_getActiveRouteWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActiveRouteWithCompletion:");
}

id objc_msgSend_getAllTasksWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllTasksWithCompletionHandler:");
}

id objc_msgSend_getAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAttribute:");
}

id objc_msgSend_getContinuationStreamsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getContinuationStreamsWithCompletionHandler:");
}

id objc_msgSend_getHomeUserIdForSharedUserId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHomeUserIdForSharedUserId:completion:");
}

id objc_msgSend_getObjectId_andIndexPath_forItemWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getObjectId:andIndexPath:forItemWithUuid:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getStoreInfoForEpisodesWithAdamIds_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStoreInfoForEpisodesWithAdamIds:callback:");
}

id objc_msgSend_getStoreInfoForPodcastWithAdamId_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStoreInfoForPodcastWithAdamId:callback:");
}

id objc_msgSend_globalDownloadPolicyRequiresMigration(void *a1, const char *a2, ...)
{
  return _[a1 globalDownloadPolicyRequiresMigration];
}

id objc_msgSend_globalImageURL(void *a1, const char *a2, ...)
{
  return _[a1 globalImageURL];
}

id objc_msgSend_globalPlaylistID(void *a1, const char *a2, ...)
{
  return _[a1 globalPlaylistID];
}

id objc_msgSend_globalRetentionPolicy(void *a1, const char *a2, ...)
{
  return _[a1 globalRetentionPolicy];
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 globallyUniqueString];
}

id objc_msgSend_goToShowAction(void *a1, const char *a2, ...)
{
  return _[a1 goToShowAction];
}

id objc_msgSend_goneDarkColor(void *a1, const char *a2, ...)
{
  return _[a1 goneDarkColor];
}

id objc_msgSend_goneDarkDetailViewController(void *a1, const char *a2, ...)
{
  return _[a1 goneDarkDetailViewController];
}

id objc_msgSend_gradientLayer(void *a1, const char *a2, ...)
{
  return _[a1 gradientLayer];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_group(void *a1, const char *a2, ...)
{
  return _[a1 group];
}

id objc_msgSend_groupFooter(void *a1, const char *a2, ...)
{
  return _[a1 groupFooter];
}

id objc_msgSend_groupSettings(void *a1, const char *a2, ...)
{
  return _[a1 groupSettings];
}

id objc_msgSend_groupTitle(void *a1, const char *a2, ...)
{
  return _[a1 groupTitle];
}

id objc_msgSend_groupWithTitle_footerText_settings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithTitle:footerText:settings:");
}

id objc_msgSend_groupWithTitle_footerText_settingsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithTitle:footerText:settingsHandler:");
}

id objc_msgSend_groupedFooterConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 groupedFooterConfiguration];
}

id objc_msgSend_groups(void *a1, const char *a2, ...)
{
  return _[a1 groups];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return _[a1 guid];
}

id objc_msgSend_halfPlayedIcon(void *a1, const char *a2, ...)
{
  return _[a1 halfPlayedIcon];
}

id objc_msgSend_handleEventsForBackgroundURLSessionFor_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEventsForBackgroundURLSessionFor:completionHandler:");
}

id objc_msgSend_handlePodcastsUrlScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePodcastsUrlScheme:");
}

id objc_msgSend_handleiTMSUrlScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleiTMSUrlScheme:");
}

id objc_msgSend_handlers(void *a1, const char *a2, ...)
{
  return _[a1 handlers];
}

id objc_msgSend_hasAccountChangedSinceLastSync(void *a1, const char *a2, ...)
{
  return _[a1 hasAccountChangedSinceLastSync];
}

id objc_msgSend_hasAuthenticatedTooRecentlyForTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAuthenticatedTooRecentlyForTransaction:error:");
}

id objc_msgSend_hasBackoff(void *a1, const char *a2, ...)
{
  return _[a1 hasBackoff];
}

id objc_msgSend_hasBeenInactiveForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenInactiveForTimeInterval:");
}

id objc_msgSend_hasBeenPlayed(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenPlayed];
}

id objc_msgSend_hasBeenPlayedForPlayState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenPlayedForPlayState:");
}

id objc_msgSend_hasBeenSynced(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenSynced];
}

id objc_msgSend_hasBookmarksSync(void *a1, const char *a2, ...)
{
  return _[a1 hasBookmarksSync];
}

id objc_msgSend_hasCommonIdentifierWithIdentifierSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCommonIdentifierWithIdentifierSet:");
}

id objc_msgSend_hasDarkPlacard(void *a1, const char *a2, ...)
{
  return _[a1 hasDarkPlacard];
}

id objc_msgSend_hasData(void *a1, const char *a2, ...)
{
  return _[a1 hasData];
}

id objc_msgSend_hasDefaultInstance(void *a1, const char *a2, ...)
{
  return _[a1 hasDefaultInstance];
}

id objc_msgSend_hasDeterminedActualGlobalCellularState(void *a1, const char *a2, ...)
{
  return _[a1 hasDeterminedActualGlobalCellularState];
}

id objc_msgSend_hasEmptySection(void *a1, const char *a2, ...)
{
  return _[a1 hasEmptySection];
}

id objc_msgSend_hasEndedVisitingEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEndedVisitingEpisode:");
}

id objc_msgSend_hasEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 hasEpisodes];
}

id objc_msgSend_hasEpisodesInTheFeed(void *a1, const char *a2, ...)
{
  return _[a1 hasEpisodesInTheFeed];
}

id objc_msgSend_hasEpisodesToBeDeleted(void *a1, const char *a2, ...)
{
  return _[a1 hasEpisodesToBeDeleted];
}

id objc_msgSend_hasFRCChanges(void *a1, const char *a2, ...)
{
  return _[a1 hasFRCChanges];
}

id objc_msgSend_hasFetchedInitialAccount(void *a1, const char *a2, ...)
{
  return _[a1 hasFetchedInitialAccount];
}

id objc_msgSend_hasHTML(void *a1, const char *a2, ...)
{
  return _[a1 hasHTML];
}

id objc_msgSend_hasInterestSyncVersion(void *a1, const char *a2, ...)
{
  return _[a1 hasInterestSyncVersion];
}

id objc_msgSend_hasItemForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasItemForKey:");
}

id objc_msgSend_hasItems(void *a1, const char *a2, ...)
{
  return _[a1 hasItems];
}

id objc_msgSend_hasLocalChanges(void *a1, const char *a2, ...)
{
  return _[a1 hasLocalChanges];
}

id objc_msgSend_hasLocalChangesToSync(void *a1, const char *a2, ...)
{
  return _[a1 hasLocalChangesToSync];
}

id objc_msgSend_hasMediaCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasMediaCharacteristic:");
}

id objc_msgSend_hasNext(void *a1, const char *a2, ...)
{
  return _[a1 hasNext];
}

id objc_msgSend_hasObjects(void *a1, const char *a2, ...)
{
  return _[a1 hasObjects];
}

id objc_msgSend_hasOnlyPaidEpisodesWithoutSubscription(void *a1, const char *a2, ...)
{
  return _[a1 hasOnlyPaidEpisodesWithoutSubscription];
}

id objc_msgSend_hasPlaylistSyncVersion(void *a1, const char *a2, ...)
{
  return _[a1 hasPlaylistSyncVersion];
}

id objc_msgSend_hasPodcastSyncV3Version(void *a1, const char *a2, ...)
{
  return _[a1 hasPodcastSyncV3Version];
}

id objc_msgSend_hasPodcastSyncVersion(void *a1, const char *a2, ...)
{
  return _[a1 hasPodcastSyncVersion];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasPrevious(void *a1, const char *a2, ...)
{
  return _[a1 hasPrevious];
}

id objc_msgSend_hasReportedThisEpisode(void *a1, const char *a2, ...)
{
  return _[a1 hasReportedThisEpisode];
}

id objc_msgSend_hasResults(void *a1, const char *a2, ...)
{
  return _[a1 hasResults];
}

id objc_msgSend_hasRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasRowAtIndexPath:");
}

id objc_msgSend_hasRowsInSectionAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasRowsInSectionAtIndex:");
}

id objc_msgSend_hasSectionNameKeyPathChanged(void *a1, const char *a2, ...)
{
  return _[a1 hasSectionNameKeyPathChanged];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasTrait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTrait:");
}

id objc_msgSend_hasUnplayedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 hasUnplayedEpisodes];
}

id objc_msgSend_hasUserRecentlyAcceptedSync(void *a1, const char *a2, ...)
{
  return _[a1 hasUserRecentlyAcceptedSync];
}

id objc_msgSend_hasVideo(void *a1, const char *a2, ...)
{
  return _[a1 hasVideo];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headerAction(void *a1, const char *a2, ...)
{
  return _[a1 headerAction];
}

id objc_msgSend_headerCallback(void *a1, const char *a2, ...)
{
  return _[a1 headerCallback];
}

id objc_msgSend_headerLabel(void *a1, const char *a2, ...)
{
  return _[a1 headerLabel];
}

id objc_msgSend_headerText(void *a1, const char *a2, ...)
{
  return _[a1 headerText];
}

id objc_msgSend_headerTitle(void *a1, const char *a2, ...)
{
  return _[a1 headerTitle];
}

id objc_msgSend_headerTitleFont(void *a1, const char *a2, ...)
{
  return _[a1 headerTitleFont];
}

id objc_msgSend_headerViewForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerViewForSection:");
}

id objc_msgSend_headerViewFrame(void *a1, const char *a2, ...)
{
  return _[a1 headerViewFrame];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _[a1 height];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_heightForRowWithDescription_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightForRowWithDescription:inGroupWithIdentifier:");
}

id objc_msgSend_heightForSeparatorInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightForSeparatorInsets:");
}

id objc_msgSend_heightForSpecialPath(void *a1, const char *a2, ...)
{
  return _[a1 heightForSpecialPath];
}

id objc_msgSend_heightForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightForStyle:");
}

id objc_msgSend_heightForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightForWidth:");
}

id objc_msgSend_heightForWidth_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightForWidth:style:");
}

id objc_msgSend_hexString(void *a1, const char *a2, ...)
{
  return _[a1 hexString];
}

id objc_msgSend_hidden(void *a1, const char *a2, ...)
{
  return _[a1 hidden];
}

id objc_msgSend_hiddenTextField(void *a1, const char *a2, ...)
{
  return _[a1 hiddenTextField];
}

id objc_msgSend_hide(void *a1, const char *a2, ...)
{
  return _[a1 hide];
}

id objc_msgSend_hideActionsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideActionsAnimated:");
}

id objc_msgSend_hideHeaderForEmptySection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideHeaderForEmptySection:");
}

id objc_msgSend_hidesFooterWhenEmpty(void *a1, const char *a2, ...)
{
  return _[a1 hidesFooterWhenEmpty];
}

id objc_msgSend_hidesPlayedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 hidesPlayedEpisodes];
}

id objc_msgSend_hidesSideViewWhenEditing(void *a1, const char *a2, ...)
{
  return _[a1 hidesSideViewWhenEditing];
}

id objc_msgSend_highlightEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightEpisodeUuid:");
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hitTest:withEvent:");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 horizontalSizeClass];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_iTunesAccountDidChangeForACAccountNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesAccountDidChangeForACAccountNotification:");
}

id objc_msgSend_iTunesAltDSID(void *a1, const char *a2, ...)
{
  return _[a1 iTunesAltDSID];
}

id objc_msgSend_iTunesMatchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 iTunesMatchEnabled];
}

id objc_msgSend_ic_privateListeningEnabledForHomeUsers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_privateListeningEnabledForHomeUsers");
}

id objc_msgSend_ic_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_sharedAccountStore");
}

id objc_msgSend_ic_storeAccountForHomeUserIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_storeAccountForHomeUserIdentifier:completion:");
}

id objc_msgSend_ic_storeAccountForStoreAccountID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_storeAccountForStoreAccountID:completion:");
}

id objc_msgSend_ic_storeAccountForStoreAccountID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_storeAccountForStoreAccountID:error:");
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return _[a1 icon];
}

id objc_msgSend_iconImageView(void *a1, const char *a2, ...)
{
  return _[a1 iconImageView];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return _[a1 iconView];
}

id objc_msgSend_iconsViewFrameForViewWidth_titleFrame_metadataFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierPromise(void *a1, const char *a2, ...)
{
  return _[a1 identifierPromise];
}

id objc_msgSend_identifierWithFeedUrl_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierWithFeedUrl:storeIdentifier:");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _[a1 identifiers];
}

id objc_msgSend_identifiersForLastEndedPlaybackItem(void *a1, const char *a2, ...)
{
  return _[a1 identifiersForLastEndedPlaybackItem];
}

id objc_msgSend_im_addAttribute_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_addAttribute:value:");
}

id objc_msgSend_im_addPropertiesWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_addPropertiesWithDictionary:");
}

id objc_msgSend_im_appendImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_appendImage:");
}

id objc_msgSend_im_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_appendString:");
}

id objc_msgSend_im_attributedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_attributedString");
}

id objc_msgSend_im_attributedStringWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_attributedStringWithAttributes:");
}

id objc_msgSend_im_distanceFromCapHeightToAscent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_distanceFromCapHeightToAscent");
}

id objc_msgSend_im_distanceFromFirstBaselineToTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_distanceFromFirstBaselineToTop");
}

id objc_msgSend_im_distanceFromLastBaselineToBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_distanceFromLastBaselineToBottom");
}

id objc_msgSend_im_focusedFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_focusedFrame");
}

id objc_msgSend_im_indexPathForFocusedCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_indexPathForFocusedCell");
}

id objc_msgSend_im_updateLabelShadow_alwaysDisplaysLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_updateLabelShadow:alwaysDisplaysLabel:");
}

id objc_msgSend_im_updateLayersForLabel_imageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_updateLayersForLabel:imageView:");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_image_inRect_withBacking_opaque_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "image:inRect:withBacking:opaque:scale:");
}

id objc_msgSend_imageFlippedForRightToLeftLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 imageFlippedForRightToLeftLayoutDirection];
}

id objc_msgSend_imageForIconKey_theme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForIconKey:theme:");
}

id objc_msgSend_imageForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForKey:");
}

id objc_msgSend_imageForKey_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForKey:size:");
}

id objc_msgSend_imageForTreatment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForTreatment:");
}

id objc_msgSend_imageInMemoryForKey_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageInMemoryForKey:size:");
}

id objc_msgSend_imageKey(void *a1, const char *a2, ...)
{
  return _[a1 imageKey];
}

id objc_msgSend_imageLoader(void *a1, const char *a2, ...)
{
  return _[a1 imageLoader];
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imagePadding(void *a1, const char *a2, ...)
{
  return _[a1 imagePadding];
}

id objc_msgSend_imageProvider(void *a1, const char *a2, ...)
{
  return _[a1 imageProvider];
}

id objc_msgSend_imageRectForContentRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageRectForContentRect:");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithCGImageRef_preserveAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImageRef:preserveAlpha:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_imageWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithSize:");
}

id objc_msgSend_immediatelyDeleteAllHiddenPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 immediatelyDeleteAllHiddenPodcasts];
}

id objc_msgSend_importContext(void *a1, const char *a2, ...)
{
  return _[a1 importContext];
}

id objc_msgSend_importDate(void *a1, const char *a2, ...)
{
  return _[a1 importDate];
}

id objc_msgSend_importRemotePodcastDicts_inContext_visitingPodcastsInCache_updatingPodcastsToAdd_updatingPodcastsToUnsubscribe_mismatch_version_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "importRemotePodcastDicts:inContext:visitingPodcastsInCache:updatingPodcastsToAdd:updatingPodcastsToUnsubscrib e:mismatch:version:");
}

id objc_msgSend_importing(void *a1, const char *a2, ...)
{
  return _[a1 importing];
}

id objc_msgSend_inFlightAuthRequests(void *a1, const char *a2, ...)
{
  return _[a1 inFlightAuthRequests];
}

id objc_msgSend_inactiveIntervalForDownloadPolicyUpgrade(void *a1, const char *a2, ...)
{
  return _[a1 inactiveIntervalForDownloadPolicyUpgrade];
}

id objc_msgSend_includesAllPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 includesAllPodcasts];
}

id objc_msgSend_incremementPlayCount(void *a1, const char *a2, ...)
{
  return _[a1 incremementPlayCount];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _[a1 index];
}

id objc_msgSend_indexForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForSection:");
}

id objc_msgSend_indexForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForValue:");
}

id objc_msgSend_indexOfController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfController:");
}

id objc_msgSend_indexOfEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfEpisode:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return _[a1 indexPath];
}

id objc_msgSend_indexPathForAvoidingSectionHeader(void *a1, const char *a2, ...)
{
  return _[a1 indexPathForAvoidingSectionHeader];
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForCell:");
}

id objc_msgSend_indexPathForClosestFocusableRowToIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForClosestFocusableRowToIndexPath:");
}

id objc_msgSend_indexPathForEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForEpisodeUuid:");
}

id objc_msgSend_indexPathForFirstFocusableRow(void *a1, const char *a2, ...)
{
  return _[a1 indexPathForFirstFocusableRow];
}

id objc_msgSend_indexPathForFirstRow(void *a1, const char *a2, ...)
{
  return _[a1 indexPathForFirstRow];
}

id objc_msgSend_indexPathForFirstRowInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForFirstRowInSection:");
}

id objc_msgSend_indexPathForFocusableRowAfterIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForFocusableRowAfterIndexPath:");
}

id objc_msgSend_indexPathForFocusableRowBeforeIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForFocusableRowBeforeIndexPath:");
}

id objc_msgSend_indexPathForGlobalIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForGlobalIndex:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_indexPathForLastRowInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForLastRowInSection:");
}

id objc_msgSend_indexPathForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForObject:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathForRowAfterIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRowAfterIndexPath:");
}

id objc_msgSend_indexPathForRowBeforeIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRowBeforeIndexPath:");
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return _[a1 indexPathForSelectedRow];
}

id objc_msgSend_indexPathForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForSetting:");
}

id objc_msgSend_indexPathIsCurrentlySelectedRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathIsCurrentlySelectedRow:");
}

id objc_msgSend_indexPathShifter(void *a1, const char *a2, ...)
{
  return _[a1 indexPathShifter];
}

id objc_msgSend_indexPathWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathWithIndex:");
}

id objc_msgSend_indexPathsForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathsForEpisode:");
}

id objc_msgSend_indexPathsForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathsForObject:");
}

id objc_msgSend_indexPathsForVisibleItems(void *a1, const char *a2, ...)
{
  return _[a1 indexPathsForVisibleItems];
}

id objc_msgSend_indexPathsForVisibleRows(void *a1, const char *a2, ...)
{
  return _[a1 indexPathsForVisibleRows];
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_indexingBlock(void *a1, const char *a2, ...)
{
  return _[a1 indexingBlock];
}

id objc_msgSend_indicatedBitrate(void *a1, const char *a2, ...)
{
  return _[a1 indicatedBitrate];
}

id objc_msgSend_infoCenter(void *a1, const char *a2, ...)
{
  return _[a1 infoCenter];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 infoDictionary];
}

id objc_msgSend_infoIcon(void *a1, const char *a2, ...)
{
  return _[a1 infoIcon];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_init_nonAppInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:nonAppInitiated:");
}

id objc_msgSend_initSupportsPlayback_supportsLocalMedia_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initSupportsPlayback:supportsLocalMedia:");
}

id objc_msgSend_initWithAVMediaSelectionOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAVMediaSelectionOption:");
}

id objc_msgSend_initWithAccessLogEvent_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccessLogEvent:dataSource:");
}

id objc_msgSend_initWithAccount_presentingViewController_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:presentingViewController:options:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithAdamID_avAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdamID:avAsset:");
}

id objc_msgSend_initWithAppBundleID_playerID_origin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppBundleID:playerID:origin:");
}

id objc_msgSend_initWithAppContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppContext:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithArtwork_blendColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArtwork:blendColor:");
}

id objc_msgSend_initWithAssetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetInfo:");
}

id objc_msgSend_initWithAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributedString:");
}

id objc_msgSend_initWithAttributedString_baseParagraphStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributedString:baseParagraphStyle:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithBlurEffectStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlurEffectStyle:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCGImageRef_preserveAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGImageRef:preserveAlpha:");
}

id objc_msgSend_initWithCMTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCMTimeRange:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCloudSyncBugReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCloudSyncBugReporter:");
}

id objc_msgSend_initWithCollectionViewLayout_compositeFetchedResultsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCollectionViewLayout:compositeFetchedResultsController:");
}

id objc_msgSend_initWithCompositeFetchedResultsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCompositeFetchedResultsController:");
}

id objc_msgSend_initWithConcurrentOperationCount_requestEncodingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConcurrentOperationCount:requestEncodingType:");
}

id objc_msgSend_initWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCondition:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContext_window_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:window:");
}

id objc_msgSend_initWithContext_window_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:window:delegate:");
}

id objc_msgSend_initWithControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControllers:");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDataSource_bagContext_andTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:bagContext:andTask:");
}

id objc_msgSend_initWithDefaultBootURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDefaultBootURL:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDomain_baseURLForGETAll_baseURLForPUTAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:baseURLForGETAll:baseURLForPUTAll:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDuration_curve_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:curve:animations:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntity:");
}

id objc_msgSend_initWithEntity_insertIntoManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntity:insertIntoManagedObjectContext:");
}

id objc_msgSend_initWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityName:");
}

id objc_msgSend_initWithEntityName_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityName:predicate:");
}

id objc_msgSend_initWithEntityName_predicate_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityName:predicate:sortDescriptors:");
}

id objc_msgSend_initWithEntityName_predicate_sortDescriptors_propertyKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityName:predicate:sortDescriptors:propertyKeys:");
}

id objc_msgSend_initWithEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisode:");
}

id objc_msgSend_initWithEpisodeAdamId_assetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisodeAdamId:assetInfo:");
}

id objc_msgSend_initWithEpisodeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisodeIdentifier:");
}

id objc_msgSend_initWithEpisodeRemovalManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisodeRemovalManager:");
}

id objc_msgSend_initWithEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisodeUuid:");
}

id objc_msgSend_initWithExpirationBlock_debugDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExpirationBlock:debugDescription:");
}

id objc_msgSend_initWithExpirationHandler_debugInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExpirationHandler:debugInfo:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithFeedUrl_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeedUrl:storeIdentifier:");
}

id objc_msgSend_initWithFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:");
}

id objc_msgSend_initWithFetchRequest_managedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:managedObjectContext:");
}

id objc_msgSend_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:");
}

id objc_msgSend_initWithFetchRequest_propertyKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:propertyKeys:");
}

id objc_msgSend_initWithFocusedView_touchAllowance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFocusedView:touchAllowance:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithHandlerQueue_taskTimeout_assertionTimeout_debugDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:");
}

id objc_msgSend_initWithHandlerQueue_taskTimeout_assertionTimeout_debugDescription_reportMetrics_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:reportMetrics:");
}

id objc_msgSend_initWithHeading_menuItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHeading:menuItems:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifiers_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifiers:block:");
}

id objc_msgSend_initWithIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIds:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithImage_highlightedImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:highlightedImage:");
}

id objc_msgSend_initWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIndexesInRange:");
}

id objc_msgSend_initWithInitialEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:");
}

id objc_msgSend_initWithInitialEpisodeUuid_fetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:fetchRequest:");
}

id objc_msgSend_initWithInitialEpisodeUuid_newestToOldest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:newestToOldest:");
}

id objc_msgSend_initWithInitialEpisodeUuid_predicateToTrack_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:");
}

id objc_msgSend_initWithInitialEpisodeUuid_sectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:sectionType:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithItems_initialIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItems:initialIndex:");
}

id objc_msgSend_initWithJSDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJSDictionary:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithKey_processor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:processor:");
}

id objc_msgSend_initWithKeysAndProcessors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeysAndProcessors:");
}

id objc_msgSend_initWithLabel_blurEffectStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLabel:blurEffectStyle:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLoggingCategory_dictionariesToMerge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLoggingCategory:dictionariesToMerge:");
}

id objc_msgSend_initWithMPObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMPObject:");
}

id objc_msgSend_initWithManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithManifest:");
}

id objc_msgSend_initWithMediaItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMediaItem:");
}

id objc_msgSend_initWithMediaQuery_initialItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMediaQuery:initialItem:");
}

id objc_msgSend_initWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:");
}

id objc_msgSend_initWithModelObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithModelObject:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:payload:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:");
}

id objc_msgSend_initWithObject_imageLoader_groupType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:imageLoader:groupType:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOption:");
}

id objc_msgSend_initWithOptionsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptionsDictionary:");
}

id objc_msgSend_initWithPlaybackQueueRef_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaybackQueueRef:");
}

id objc_msgSend_initWithPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayer:");
}

id objc_msgSend_initWithPlayer_invalidateWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayer:invalidateWhenDone:");
}

id objc_msgSend_initWithPlayerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerController:");
}

id objc_msgSend_initWithPlayerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerID:");
}

id objc_msgSend_initWithPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerItem:");
}

id objc_msgSend_initWithPlayerItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerItems:");
}

id objc_msgSend_initWithPlayerResponseItem_mediaItemMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerResponseItem:mediaItemMetadata:");
}

id objc_msgSend_initWithPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaylist:");
}

id objc_msgSend_initWithPlaylistUuid_initialEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaylistUuid:initialEpisodeUuid:");
}

id objc_msgSend_initWithPlaylistUuid_library_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaylistUuid:library:");
}

id objc_msgSend_initWithPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcast:");
}

id objc_msgSend_initWithPodcast_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcast:delegate:");
}

id objc_msgSend_initWithPodcastAdamId_assetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcastAdamId:assetInfo:");
}

id objc_msgSend_initWithPodcastAdamId_siriAssetInfo_oldestEpisode_initiatedByAnotherUser_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcastAdamId:siriAssetInfo:oldestEpisode:initiatedByAnotherUser:");
}

id objc_msgSend_initWithPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcastUuid:");
}

id objc_msgSend_initWithPodcastUuid_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcastUuid:delegate:");
}

id objc_msgSend_initWithPredicate_entityName_ctx_properties_fetchProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:entityName:ctx:properties:fetchProperties:");
}

id objc_msgSend_initWithPredicate_inCtx_extraProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:inCtx:extraProperties:");
}

id objc_msgSend_initWithPreferredLanguages_preferredMediaCharacteristics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreferredLanguages:preferredMediaCharacteristics:");
}

id objc_msgSend_initWithPrivacyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrivacyIdentifier:");
}

id objc_msgSend_initWithPrivateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrivateStyle:");
}

id objc_msgSend_initWithProperties_defaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:defaults:");
}

id objc_msgSend_initWithProperties_relationships_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:relationships:");
}

id objc_msgSend_initWithRecipient_useCase_account_urlProtocolDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecipient:useCase:account:urlProtocolDelegate:");
}

id objc_msgSend_initWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReuseIdentifier:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithShouldContinue_createdPodcastUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShouldContinue:createdPodcastUUID:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithSourceURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSourceURL:");
}

id objc_msgSend_initWithStartTime_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartTime:duration:");
}

id objc_msgSend_initWithStartTime_endTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartTime:endTime:");
}

id objc_msgSend_initWithStation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStation:");
}

id objc_msgSend_initWithStationId_assetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStationId:assetInfo:");
}

id objc_msgSend_initWithStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorage:");
}

id objc_msgSend_initWithStorage_config_cloudSyncBugReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorage:config:cloudSyncBugReporter:");
}

id objc_msgSend_initWithStorageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorageProvider:");
}

id objc_msgSend_initWithStorageProvider_cloudSyncBugReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorageProvider:cloudSyncBugReporter:");
}

id objc_msgSend_initWithStorageProviderDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorageProviderDelegate:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithString_attributes_baseParagraphStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:baseParagraphStyle:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSyncType:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTarget_action_pressType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:pressType:");
}

id objc_msgSend_initWithTitle_actionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:actionBlock:");
}

id objc_msgSend_initWithTitle_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:actionHandler:");
}

id objc_msgSend_initWithTitle_icon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:icon:");
}

id objc_msgSend_initWithTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopic:");
}

id objc_msgSend_initWithTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransaction:");
}

id objc_msgSend_initWithTransaction_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransaction:response:");
}

id objc_msgSend_initWithType_domain_URL_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:domain:URL:keys:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:options:");
}

id objc_msgSend_initWithURL_traits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:traits:");
}

id objc_msgSend_initWithURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURLString:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUpNextManifest_userManifest_loadQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUpNextManifest:userManifest:loadQueue:");
}

id objc_msgSend_initWithUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUrl:");
}

id objc_msgSend_initWithUrl_nonAppInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUrl:nonAppInitiated:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_initWithWorkQueue_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWorkQueue:identifier:");
}

id objc_msgSend_initialAutosyncNeeded(void *a1, const char *a2, ...)
{
  return _[a1 initialAutosyncNeeded];
}

id objc_msgSend_initialEpisodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 initialEpisodeUuid];
}

id objc_msgSend_initialIndex(void *a1, const char *a2, ...)
{
  return _[a1 initialIndex];
}

id objc_msgSend_initialIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 initialIndexPath];
}

id objc_msgSend_initialPlayheadPosition(void *a1, const char *a2, ...)
{
  return _[a1 initialPlayheadPosition];
}

id objc_msgSend_initialSubscribedPodcastsCount(void *a1, const char *a2, ...)
{
  return _[a1 initialSubscribedPodcastsCount];
}

id objc_msgSend_initializeFrc(void *a1, const char *a2, ...)
{
  return _[a1 initializeFrc];
}

id objc_msgSend_initiatedByAnotherUser(void *a1, const char *a2, ...)
{
  return _[a1 initiatedByAnotherUser];
}

id objc_msgSend_insertAfterContextItemID(void *a1, const char *a2, ...)
{
  return _[a1 insertAfterContextItemID];
}

id objc_msgSend_insertAfterPlayingItemWithPlaybackIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertAfterPlayingItemWithPlaybackIntent:");
}

id objc_msgSend_insertAtEndOfTracklistWithPlaybackIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertAtEndOfTracklistWithPlaybackIntent:");
}

id objc_msgSend_insertCommand(void *a1, const char *a2, ...)
{
  return _[a1 insertCommand];
}

id objc_msgSend_insertEpisodeUuids_intoPlaybackQueueAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertEpisodeUuids:intoPlaybackQueueAtPosition:");
}

id objc_msgSend_insertIntoPlaybackQueueCommand(void *a1, const char *a2, ...)
{
  return _[a1 insertIntoPlaybackQueueCommand];
}

id objc_msgSend_insertItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertItemsAtIndexPaths:");
}

id objc_msgSend_insertNewEpisodeInManagedObjectContext_canSendNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewEpisodeInManagedObjectContext:canSendNotifications:");
}

id objc_msgSend_insertNewImplicitFollowIfNeededForPlayerItem_from_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewImplicitFollowIfNeededForPlayerItem:from:completion:");
}

id objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewObjectForEntityForName:inManagedObjectContext:");
}

id objc_msgSend_insertNewPlaylistInManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewPlaylistInManagedObjectContext:");
}

id objc_msgSend_insertNewPlaylistInManagedObjectContext_uuid_defaultSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewPlaylistInManagedObjectContext:uuid:defaultSettings:");
}

id objc_msgSend_insertNewPodcastInManagedObjectContext_subscribed_feedUrl_showType_showTypeInFeed_title_author_provider_imageUrl_description_displayType_showSpecificUpsellCopy_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:showTypeInFeed:title:author:provider:image Url:description:displayType:showSpecificUpsellCopy:");
}

id objc_msgSend_insertNewPodcastInManagedObjectContext_subscribed_feedUrl_showType_title_author_provider_imageUrl_description_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:title:author:provider:imageUrl:description:");
}

id objc_msgSend_insertNewSettingsInManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewSettingsInManagedObjectContext:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertObjects_atIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObjects:atIndexes:");
}

id objc_msgSend_insertPlayerItems_intoPlaybackQueueAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertPlayerItems:intoPlaybackQueueAtPosition:");
}

id objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_insertSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSections:withRowAnimation:");
}

id objc_msgSend_insertSegmentWithTitle_atIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSegmentWithTitle:atIndex:animated:");
}

id objc_msgSend_insertSublayer_above_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSublayer:above:");
}

id objc_msgSend_insertSublayer_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSublayer:atIndex:");
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:aboveSubview:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:below:");
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:belowSubview:");
}

id objc_msgSend_insertionPosition(void *a1, const char *a2, ...)
{
  return _[a1 insertionPosition];
}

id objc_msgSend_instanceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 instanceIdentifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForEpisodesToShow(void *a1, const char *a2, ...)
{
  return _[a1 integerForEpisodesToShow];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interestSyncVersion(void *a1, const char *a2, ...)
{
  return _[a1 interestSyncVersion];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internetAvailable(void *a1, const char *a2, ...)
{
  return _[a1 internetAvailable];
}

id objc_msgSend_internetNotReachable(void *a1, const char *a2, ...)
{
  return _[a1 internetNotReachable];
}

id objc_msgSend_interruptEvent(void *a1, const char *a2, ...)
{
  return _[a1 interruptEvent];
}

id objc_msgSend_intersectOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectOrderedSet:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_invalidateArtwork(void *a1, const char *a2, ...)
{
  return _[a1 invalidateArtwork];
}

id objc_msgSend_invalidateArtworkForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateArtworkForPodcast:");
}

id objc_msgSend_invalidateAsset(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAsset];
}

id objc_msgSend_invalidateItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateItemsAtIndexPaths:");
}

id objc_msgSend_invalidateLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 invalidateLayoutMargins];
}

id objc_msgSend_invalidateLayoutWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateLayoutWithContext:");
}

id objc_msgSend_invalidatePlaybackQueue(void *a1, const char *a2, ...)
{
  return _[a1 invalidatePlaybackQueue];
}

id objc_msgSend_invalidateSizeMetrics(void *a1, const char *a2, ...)
{
  return _[a1 invalidateSizeMetrics];
}

id objc_msgSend_invalidationManager(void *a1, const char *a2, ...)
{
  return _[a1 invalidationManager];
}

id objc_msgSend_invocationWithMethodSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invocationWithMethodSignature:");
}

id objc_msgSend_invokeTaskCompletionBlocksWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeTaskCompletionBlocksWithBlock:");
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_isAValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAValue:");
}

id objc_msgSend_isAccountsChangedError(void *a1, const char *a2, ...)
{
  return _[a1 isAccountsChangedError];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAdded(void *a1, const char *a2, ...)
{
  return _[a1 isAdded];
}

id objc_msgSend_isAirplaneModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAirplaneModeEnabled];
}

id objc_msgSend_isAirplayReceiver(void *a1, const char *a2, ...)
{
  return _[a1 isAirplayReceiver];
}

id objc_msgSend_isAlwaysFocusable(void *a1, const char *a2, ...)
{
  return _[a1 isAlwaysFocusable];
}

id objc_msgSend_isAnimating(void *a1, const char *a2, ...)
{
  return _[a1 isAnimating];
}

id objc_msgSend_isAppleMusicEpisode(void *a1, const char *a2, ...)
{
  return _[a1 isAppleMusicEpisode];
}

id objc_msgSend_isAppleNewsEpisode(void *a1, const char *a2, ...)
{
  return _[a1 isAppleNewsEpisode];
}

id objc_msgSend_isAppleTVRoute(void *a1, const char *a2, ...)
{
  return _[a1 isAppleTVRoute];
}

id objc_msgSend_isAssetLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isAssetLoaded];
}

id objc_msgSend_isAudio(void *a1, const char *a2, ...)
{
  return _[a1 isAudio];
}

id objc_msgSend_isAuthenticatedDark(void *a1, const char *a2, ...)
{
  return _[a1 isAuthenticatedDark];
}

id objc_msgSend_isAuthenticatedWithQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAuthenticatedWithQueue:completionHandler:");
}

id objc_msgSend_isAuthenticationError(void *a1, const char *a2, ...)
{
  return _[a1 isAuthenticationError];
}

id objc_msgSend_isAuthenticationValidForTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAuthenticationValidForTransaction:error:");
}

id objc_msgSend_isBackCatalogItem(void *a1, const char *a2, ...)
{
  return _[a1 isBackCatalogItem];
}

id objc_msgSend_isBackgroundLight(void *a1, const char *a2, ...)
{
  return _[a1 isBackgroundLight];
}

id objc_msgSend_isBookmarked(void *a1, const char *a2, ...)
{
  return _[a1 isBookmarked];
}

id objc_msgSend_isBookmarksSyncDirtyFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBookmarksSyncDirtyFor:");
}

id objc_msgSend_isBuiltIn(void *a1, const char *a2, ...)
{
  return _[a1 isBuiltIn];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isCenteredLayout(void *a1, const char *a2, ...)
{
  return _[a1 isCenteredLayout];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return _[a1 isComplete];
}

id objc_msgSend_isContentOpaque(void *a1, const char *a2, ...)
{
  return _[a1 isContentOpaque];
}

id objc_msgSend_isCorrupt(void *a1, const char *a2, ...)
{
  return _[a1 isCorrupt];
}

id objc_msgSend_isCurrentEpisodeDownloaded(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentEpisodeDownloaded];
}

id objc_msgSend_isCurrentPlayerItem(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentPlayerItem];
}

id objc_msgSend_isDark(void *a1, const char *a2, ...)
{
  return _[a1 isDark];
}

id objc_msgSend_isDarkBackground(void *a1, const char *a2, ...)
{
  return _[a1 isDarkBackground];
}

id objc_msgSend_isDebugUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDebugUrl:");
}

id objc_msgSend_isDefaultSettingsForPlaylist_title_episodesToShow_showPlayedEpisodes_includeAllPodcasts_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDefaultSettingsForPlaylist:title:episodesToShow:showPlayedEpisodes:includeAllPodcasts:");
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _[a1 isDeleted];
}

id objc_msgSend_isDescendantOfView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDescendantOfView:");
}

id objc_msgSend_isDestructive(void *a1, const char *a2, ...)
{
  return _[a1 isDestructive];
}

id objc_msgSend_isDeviceRoute(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceRoute];
}

id objc_msgSend_isDiagnosticSubmissionAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isDiagnosticSubmissionAllowed];
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return _[a1 isDirty];
}

id objc_msgSend_isDownloaded(void *a1, const char *a2, ...)
{
  return _[a1 isDownloaded];
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return _[a1 isDragging];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isEmpty];
}

id objc_msgSend_isEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmpty:");
}

id objc_msgSend_isEmptyNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmptyNumber:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEnabledForGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledForGroupWithIdentifier:");
}

id objc_msgSend_isEntitled(void *a1, const char *a2, ...)
{
  return _[a1 isEntitled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToAttributedString:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToMediaItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToMediaItem:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToOrderedSet:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _[a1 isExecuting];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return _[a1 isExpanded];
}

id objc_msgSend_isExplicit(void *a1, const char *a2, ...)
{
  return _[a1 isExplicit];
}

id objc_msgSend_isExplicitContentAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isExplicitContentAllowed];
}

id objc_msgSend_isExplicitEpisode(void *a1, const char *a2, ...)
{
  return _[a1 isExplicitEpisode];
}

id objc_msgSend_isExplicitForStorePlatformDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExplicitForStorePlatformDictionary:");
}

id objc_msgSend_isExternalType(void *a1, const char *a2, ...)
{
  return _[a1 isExternalType];
}

id objc_msgSend_isFileExpired_inDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFileExpired:inDirectory:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isFloating(void *a1, const char *a2, ...)
{
  return _[a1 isFloating];
}

id objc_msgSend_isFocused(void *a1, const char *a2, ...)
{
  return _[a1 isFocused];
}

id objc_msgSend_isFolder(void *a1, const char *a2, ...)
{
  return _[a1 isFolder];
}

id objc_msgSend_isFromITunesSync(void *a1, const char *a2, ...)
{
  return _[a1 isFromITunesSync];
}

id objc_msgSend_isFutureWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFutureWithTimestamp:");
}

id objc_msgSend_isGlobalCellularEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isGlobalCellularEnabled];
}

id objc_msgSend_isHLSPlaylist(void *a1, const char *a2, ...)
{
  return _[a1 isHLSPlaylist];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return _[a1 isHighlighted];
}

id objc_msgSend_isHomePodRoute(void *a1, const char *a2, ...)
{
  return _[a1 isHomePodRoute];
}

id objc_msgSend_isHorizontallyCompact(void *a1, const char *a2, ...)
{
  return _[a1 isHorizontallyCompact];
}

id objc_msgSend_isHorizontallyRegular(void *a1, const char *a2, ...)
{
  return _[a1 isHorizontallyRegular];
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return _[a1 isIdle];
}

id objc_msgSend_isImplicitlyFollowed(void *a1, const char *a2, ...)
{
  return _[a1 isImplicitlyFollowed];
}

id objc_msgSend_isInPodcastDetailsUnplayedTab(void *a1, const char *a2, ...)
{
  return _[a1 isInPodcastDetailsUnplayedTab];
}

id objc_msgSend_isInUserEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 isInUserEpisodes];
}

id objc_msgSend_isInitialPrepare(void *a1, const char *a2, ...)
{
  return _[a1 isInitialPrepare];
}

id objc_msgSend_isInteractive(void *a1, const char *a2, ...)
{
  return _[a1 isInteractive];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isInternalInstall];
}

id objc_msgSend_isInvalidRouteError(void *a1, const char *a2, ...)
{
  return _[a1 isInvalidRouteError];
}

id objc_msgSend_isItunesPlaylist(void *a1, const char *a2, ...)
{
  return _[a1 isItunesPlaylist];
}

id objc_msgSend_isItunesSmartPlaylist(void *a1, const char *a2, ...)
{
  return _[a1 isItunesSmartPlaylist];
}

id objc_msgSend_isLabelMultipleLinesWithFrame_font_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLabelMultipleLinesWithFrame:font:");
}

id objc_msgSend_isLibrarySyncEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLibrarySyncEnabled];
}

id objc_msgSend_isLicenseKeyExpiredError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLicenseKeyExpiredError:");
}

id objc_msgSend_isLicenseKeyIntegrityError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLicenseKeyIntegrityError:");
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isLoaded];
}

id objc_msgSend_isLocal(void *a1, const char *a2, ...)
{
  return _[a1 isLocal];
}

id objc_msgSend_isLocalDeviceQueue(void *a1, const char *a2, ...)
{
  return _[a1 isLocalDeviceQueue];
}

id objc_msgSend_isLocalSetPlaybackQueueURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocalSetPlaybackQueueURLString:");
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMacIdiom(void *a1, const char *a2, ...)
{
  return _[a1 isMacIdiom];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isManifestRestorationOngoing(void *a1, const char *a2, ...)
{
  return _[a1 isManifestRestorationOngoing];
}

id objc_msgSend_isMedia(void *a1, const char *a2, ...)
{
  return _[a1 isMedia];
}

id objc_msgSend_isMediaItemSyncedFromiTunes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMediaItemSyncedFromiTunes:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isMigrating(void *a1, const char *a2, ...)
{
  return _[a1 isMigrating];
}

id objc_msgSend_isMissingAsset(void *a1, const char *a2, ...)
{
  return _[a1 isMissingAsset];
}

id objc_msgSend_isMissingAssetForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMissingAssetForItem:");
}

id objc_msgSend_isMissingFilePathForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMissingFilePathForItem:");
}

id objc_msgSend_isMomCompatible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMomCompatible:");
}

id objc_msgSend_isMultiplayerHost(void *a1, const char *a2, ...)
{
  return _[a1 isMultiplayerHost];
}

id objc_msgSend_isNSArray__(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNSArray__");
}

id objc_msgSend_isNSData__(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNSData__");
}

id objc_msgSend_isNSDictionary__(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNSDictionary__");
}

id objc_msgSend_isNSString__(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNSString__");
}

id objc_msgSend_isNetworkingBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkingBlocked];
}

id objc_msgSend_isNew(void *a1, const char *a2, ...)
{
  return _[a1 isNew];
}

id objc_msgSend_isNewInstall(void *a1, const char *a2, ...)
{
  return _[a1 isNewInstall];
}

id objc_msgSend_isNonFollowedShowsSyncDirty(void *a1, const char *a2, ...)
{
  return _[a1 isNonFollowedShowsSyncDirty];
}

id objc_msgSend_isNotEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isNotEmpty];
}

id objc_msgSend_isNotEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotEmpty:");
}

id objc_msgSend_isNotEmptyNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotEmptyNumber:");
}

id objc_msgSend_isNotSubscribable(void *a1, const char *a2, ...)
{
  return _[a1 isNotSubscribable];
}

id objc_msgSend_isObserving(void *a1, const char *a2, ...)
{
  return _[a1 isObserving];
}

id objc_msgSend_isOfflineAsset(void *a1, const char *a2, ...)
{
  return _[a1 isOfflineAsset];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return _[a1 isOn];
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return _[a1 isOpen];
}

id objc_msgSend_isPackagedMedia(void *a1, const char *a2, ...)
{
  return _[a1 isPackagedMedia];
}

id objc_msgSend_isPartiallyOffTheTop(void *a1, const char *a2, ...)
{
  return _[a1 isPartiallyOffTheTop];
}

id objc_msgSend_isPartiallyPlayed(void *a1, const char *a2, ...)
{
  return _[a1 isPartiallyPlayed];
}

id objc_msgSend_isPartiallyPlayedBackCatalogItem(void *a1, const char *a2, ...)
{
  return _[a1 isPartiallyPlayedBackCatalogItem];
}

id objc_msgSend_isPastAutodownloadOrEpisodeLimitDark(void *a1, const char *a2, ...)
{
  return _[a1 isPastAutodownloadOrEpisodeLimitDark];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return _[a1 isPaused];
}

id objc_msgSend_isPendingElapsedTimeChange(void *a1, const char *a2, ...)
{
  return _[a1 isPendingElapsedTimeChange];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 isPlaceholder];
}

id objc_msgSend_isPlaybackActive(void *a1, const char *a2, ...)
{
  return _[a1 isPlaybackActive];
}

id objc_msgSend_isPlaybackRequested(void *a1, const char *a2, ...)
{
  return _[a1 isPlaybackRequested];
}

id objc_msgSend_isPlayed(void *a1, const char *a2, ...)
{
  return _[a1 isPlayed];
}

id objc_msgSend_isPlayerManifestRestored(void *a1, const char *a2, ...)
{
  return _[a1 isPlayerManifestRestored];
}

id objc_msgSend_isPlayerTargetLocal(void *a1, const char *a2, ...)
{
  return _[a1 isPlayerTargetLocal];
}

id objc_msgSend_isPlayhead_resumableForDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayhead:resumableForDuration:");
}

id objc_msgSend_isPlayingEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayingEpisodeUuid:");
}

id objc_msgSend_isPlayingFromManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayingFromManifest:");
}

id objc_msgSend_isPlayingFromUpNext(void *a1, const char *a2, ...)
{
  return _[a1 isPlayingFromUpNext];
}

id objc_msgSend_isPlayingLocally(void *a1, const char *a2, ...)
{
  return _[a1 isPlayingLocally];
}

id objc_msgSend_isPlaylistSyncDirty(void *a1, const char *a2, ...)
{
  return _[a1 isPlaylistSyncDirty];
}

id objc_msgSend_isPodcastUpdatable_userInitiated_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPodcastUpdatable:userInitiated:forced:");
}

id objc_msgSend_isPresentedModally(void *a1, const char *a2, ...)
{
  return _[a1 isPresentedModally];
}

id objc_msgSend_isPrimarySubtitleDisplayer(void *a1, const char *a2, ...)
{
  return _[a1 isPrimarySubtitleDisplayer];
}

id objc_msgSend_isPrimaryUserActiveAccount(void *a1, const char *a2, ...)
{
  return _[a1 isPrimaryUserActiveAccount];
}

id objc_msgSend_isPrivateListeningEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isPrivateListeningEnabled];
}

id objc_msgSend_isRadioPlayback(void *a1, const char *a2, ...)
{
  return _[a1 isRadioPlayback];
}

id objc_msgSend_isReachable(void *a1, const char *a2, ...)
{
  return _[a1 isReachable];
}

id objc_msgSend_isReachableViaCellular(void *a1, const char *a2, ...)
{
  return _[a1 isReachableViaCellular];
}

id objc_msgSend_isRecoverableError(void *a1, const char *a2, ...)
{
  return _[a1 isRecoverableError];
}

id objc_msgSend_isRedirectURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRedirectURL:");
}

id objc_msgSend_isRefreshing(void *a1, const char *a2, ...)
{
  return _[a1 isRefreshing];
}

id objc_msgSend_isRemoteViewService(void *a1, const char *a2, ...)
{
  return _[a1 isRemoteViewService];
}

id objc_msgSend_isRequestingImmediatePlayback(void *a1, const char *a2, ...)
{
  return _[a1 isRequestingImmediatePlayback];
}

id objc_msgSend_isResetable(void *a1, const char *a2, ...)
{
  return _[a1 isResetable];
}

id objc_msgSend_isResolvingError(void *a1, const char *a2, ...)
{
  return _[a1 isResolvingError];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return _[a1 isRestricted];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isRunningOnHomepod(void *a1, const char *a2, ...)
{
  return _[a1 isRunningOnHomepod];
}

id objc_msgSend_isRunningOnInternalOS(void *a1, const char *a2, ...)
{
  return _[a1 isRunningOnInternalOS];
}

id objc_msgSend_isScanning(void *a1, const char *a2, ...)
{
  return _[a1 isScanning];
}

id objc_msgSend_isScrollEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isScrollEnabled];
}

id objc_msgSend_isSeekingOrScrubbing(void *a1, const char *a2, ...)
{
  return _[a1 isSeekingOrScrubbing];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isSeparatorHidden(void *a1, const char *a2, ...)
{
  return _[a1 isSeparatorHidden];
}

id objc_msgSend_isSerialPodcast(void *a1, const char *a2, ...)
{
  return _[a1 isSerialPodcast];
}

id objc_msgSend_isSerialShowTypeInFeed(void *a1, const char *a2, ...)
{
  return _[a1 isSerialShowTypeInFeed];
}

id objc_msgSend_isServerRevisionNewerThanClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isServerRevisionNewerThanClient:");
}

id objc_msgSend_isShadowEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isShadowEnabled];
}

id objc_msgSend_isStereoPair(void *a1, const char *a2, ...)
{
  return _[a1 isStereoPair];
}

id objc_msgSend_isStopped(void *a1, const char *a2, ...)
{
  return _[a1 isStopped];
}

id objc_msgSend_isStopping(void *a1, const char *a2, ...)
{
  return _[a1 isStopping];
}

id objc_msgSend_isStoppingLock(void *a1, const char *a2, ...)
{
  return _[a1 isStoppingLock];
}

id objc_msgSend_isStreamable(void *a1, const char *a2, ...)
{
  return _[a1 isStreamable];
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isSubscribeCommandURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscribeCommandURLString:");
}

id objc_msgSend_isSubscribedToPodcastWithFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscribedToPodcastWithFeedUrl:");
}

id objc_msgSend_isSubscribedToPodcastWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscribedToPodcastWithUuid:");
}

id objc_msgSend_isSubscribingWithFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscribingWithFeedUrl:");
}

id objc_msgSend_isSubscriptionSyncDirtyFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscriptionSyncDirtyFor:");
}

id objc_msgSend_isSupportedUrlString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSupportedUrlString:");
}

id objc_msgSend_isSyncing(void *a1, const char *a2, ...)
{
  return _[a1 isSyncing];
}

id objc_msgSend_isSystemMusicPath(void *a1, const char *a2, ...)
{
  return _[a1 isSystemMusicPath];
}

id objc_msgSend_isSystemPodcastsPath(void *a1, const char *a2, ...)
{
  return _[a1 isSystemPodcastsPath];
}

id objc_msgSend_isTabBarLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isTabBarLoaded];
}

id objc_msgSend_isTargetPlaying(void *a1, const char *a2, ...)
{
  return _[a1 isTargetPlaying];
}

id objc_msgSend_isToday(void *a1, const char *a2, ...)
{
  return _[a1 isToday];
}

id objc_msgSend_isTransactionCancelledError(void *a1, const char *a2, ...)
{
  return _[a1 isTransactionCancelledError];
}

id objc_msgSend_isUngroupedList(void *a1, const char *a2, ...)
{
  return _[a1 isUngroupedList];
}

id objc_msgSend_isUniversalPlaybackIdentifierURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUniversalPlaybackIdentifierURLString:");
}

id objc_msgSend_isUnknownItemType(void *a1, const char *a2, ...)
{
  return _[a1 isUnknownItemType];
}

id objc_msgSend_isUnplayed(void *a1, const char *a2, ...)
{
  return _[a1 isUnplayed];
}

id objc_msgSend_isUpdating(void *a1, const char *a2, ...)
{
  return _[a1 isUpdating];
}

id objc_msgSend_isUpdatingFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUpdatingFeedUrl:");
}

id objc_msgSend_isUserLoggedIn(void *a1, const char *a2, ...)
{
  return _[a1 isUserLoggedIn];
}

id objc_msgSend_isValidShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidShowTypeSetting:");
}

id objc_msgSend_isVerticalLayout(void *a1, const char *a2, ...)
{
  return _[a1 isVerticalLayout];
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return _[a1 isVideo];
}

id objc_msgSend_isVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isVideo:");
}

id objc_msgSend_isVideoPlayback(void *a1, const char *a2, ...)
{
  return _[a1 isVideoPlayback];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return _[a1 isVisible];
}

id objc_msgSend_isVisuallyPlayed(void *a1, const char *a2, ...)
{
  return _[a1 isVisuallyPlayed];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_itemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemAtIndexPath:");
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return _[a1 itemDescription];
}

id objc_msgSend_itemDescriptionHasHTML(void *a1, const char *a2, ...)
{
  return _[a1 itemDescriptionHasHTML];
}

id objc_msgSend_itemDescriptionWithoutHTML(void *a1, const char *a2, ...)
{
  return _[a1 itemDescriptionWithoutHTML];
}

id objc_msgSend_itemError(void *a1, const char *a2, ...)
{
  return _[a1 itemError];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 itemIdentifier];
}

id objc_msgSend_itemSize(void *a1, const char *a2, ...)
{
  return _[a1 itemSize];
}

id objc_msgSend_itemSummary(void *a1, const char *a2, ...)
{
  return _[a1 itemSummary];
}

id objc_msgSend_itemTitle(void *a1, const char *a2, ...)
{
  return _[a1 itemTitle];
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return _[a1 itemType];
}

id objc_msgSend_itemWithMPMediaItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithMPMediaItem:");
}

id objc_msgSend_itemWithPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithPersistentID:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_itunesTitle(void *a1, const char *a2, ...)
{
  return _[a1 itunesTitle];
}

id objc_msgSend_keepEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 keepEpisodes];
}

id objc_msgSend_keepsFeedFileInTempDirAfterDownload(void *a1, const char *a2, ...)
{
  return _[a1 keepsFeedFileInTempDirAfterDownload];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyProcessorPairProvider(void *a1, const char *a2, ...)
{
  return _[a1 keyProcessorPairProvider];
}

id objc_msgSend_keyRequestLicenseErrorDomain(void *a1, const char *a2, ...)
{
  return _[a1 keyRequestLicenseErrorDomain];
}

id objc_msgSend_keyStorage(void *a1, const char *a2, ...)
{
  return _[a1 keyStorage];
}

id objc_msgSend_keyTimes(void *a1, const char *a2, ...)
{
  return _[a1 keyTimes];
}

id objc_msgSend_keyValueStoreController_shouldScheduleTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreController:shouldScheduleTransaction:");
}

id objc_msgSend_keyValueStoreController_transaction_didCancelWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreController:transaction:didCancelWithError:");
}

id objc_msgSend_keyValueStoreController_transaction_didFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreController:transaction:didFailWithError:");
}

id objc_msgSend_keyValueStoreController_transactionDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreController:transactionDidFinish:");
}

id objc_msgSend_keyValueStoreDataCurrentRevision(void *a1, const char *a2, ...)
{
  return _[a1 keyValueStoreDataCurrentRevision];
}

id objc_msgSend_keyValueStoreDataFirstRevision(void *a1, const char *a2, ...)
{
  return _[a1 keyValueStoreDataFirstRevision];
}

id objc_msgSend_keyValueStoreDisabledErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreDisabledErrorWithTransaction:underlyingError:");
}

id objc_msgSend_keyValueStoreErrorWithCode_localizedDescription_transaction_underlyingError_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:");
}

id objc_msgSend_keyValueStoreItemIdentifierForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreItemIdentifierForItem:");
}

id objc_msgSend_keyValueStoreOperation_scheduleURLRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreOperation:scheduleURLRequest:");
}

id objc_msgSend_keyValueStoreOperationOperationDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreOperationOperationDidFinish:");
}

id objc_msgSend_keyValueStorePayload(void *a1, const char *a2, ...)
{
  return _[a1 keyValueStorePayload];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_keyWithPrefix_assetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWithPrefix:assetID:");
}

id objc_msgSend_keyedArtworkForShow_size_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyedArtworkForShow:size:completionHandler:");
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return _[a1 keys];
}

id objc_msgSend_keysAndProcessorsForAllBookkeeperKeys(void *a1, const char *a2, ...)
{
  return _[a1 keysAndProcessorsForAllBookkeeperKeys];
}

id objc_msgSend_keysAndProcessorsForBookmarksSync(void *a1, const char *a2, ...)
{
  return _[a1 keysAndProcessorsForBookmarksSync];
}

id objc_msgSend_keysAndProcessorsForCriticalBookkeeperKeys(void *a1, const char *a2, ...)
{
  return _[a1 keysAndProcessorsForCriticalBookkeeperKeys];
}

id objc_msgSend_keysAndProcessorsForInterestSync(void *a1, const char *a2, ...)
{
  return _[a1 keysAndProcessorsForInterestSync];
}

id objc_msgSend_keysAndProcessorsForNonFollowedShowsSync(void *a1, const char *a2, ...)
{
  return _[a1 keysAndProcessorsForNonFollowedShowsSync];
}

id objc_msgSend_keysAndProcessorsForSubscriptionsAndStationsSync(void *a1, const char *a2, ...)
{
  return _[a1 keysAndProcessorsForSubscriptionsAndStationsSync];
}

id objc_msgSend_keysAndProcessorsForTermsVersionSync(void *a1, const char *a2, ...)
{
  return _[a1 keysAndProcessorsForTermsVersionSync];
}

id objc_msgSend_keysForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysForTransaction:");
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_killSwitchErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "killSwitchErrorWithTransaction:underlyingError:");
}

id objc_msgSend_kindWithEpisodeKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kindWithEpisodeKind:");
}

id objc_msgSend_kindWithSeasonKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kindWithSeasonKind:");
}

id objc_msgSend_kindWithVariants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kindWithVariants:");
}

id objc_msgSend_kindWithVariants_songKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kindWithVariants:songKind:");
}

id objc_msgSend_kvsController(void *a1, const char *a2, ...)
{
  return _[a1 kvsController];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelInset(void *a1, const char *a2, ...)
{
  return _[a1 labelInset];
}

id objc_msgSend_labelSize(void *a1, const char *a2, ...)
{
  return _[a1 labelSize];
}

id objc_msgSend_labelStackViewDidChangeHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelStackViewDidChangeHeight:");
}

id objc_msgSend_languageCodeFromLocale(void *a1, const char *a2, ...)
{
  return _[a1 languageCodeFromLocale];
}

id objc_msgSend_lastAVPlayer(void *a1, const char *a2, ...)
{
  return _[a1 lastAVPlayer];
}

id objc_msgSend_lastAppUseDate(void *a1, const char *a2, ...)
{
  return _[a1 lastAppUseDate];
}

id objc_msgSend_lastBookmarkedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastBookmarkedDate];
}

id objc_msgSend_lastBookmarksSyncTimestampForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastBookmarksSyncTimestampForSyncType:");
}

id objc_msgSend_lastDatePlayed(void *a1, const char *a2, ...)
{
  return _[a1 lastDatePlayed];
}

id objc_msgSend_lastFocusedIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 lastFocusedIndexPath];
}

id objc_msgSend_lastImplicitlyFollowedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastImplicitlyFollowedDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastPlaybackPositionSaveTime(void *a1, const char *a2, ...)
{
  return _[a1 lastPlaybackPositionSaveTime];
}

id objc_msgSend_lastPlaybackSaveTime(void *a1, const char *a2, ...)
{
  return _[a1 lastPlaybackSaveTime];
}

id objc_msgSend_lastPlayerResponse(void *a1, const char *a2, ...)
{
  return _[a1 lastPlayerResponse];
}

id objc_msgSend_lastPlayingItem(void *a1, const char *a2, ...)
{
  return _[a1 lastPlayingItem];
}

id objc_msgSend_lastRecordedItemURL(void *a1, const char *a2, ...)
{
  return _[a1 lastRecordedItemURL];
}

id objc_msgSend_lastRemovedFromUpNextDate(void *a1, const char *a2, ...)
{
  return _[a1 lastRemovedFromUpNextDate];
}

id objc_msgSend_lastStoreEpisodesInfoCheckDate(void *a1, const char *a2, ...)
{
  return _[a1 lastStoreEpisodesInfoCheckDate];
}

id objc_msgSend_lastStorePodcastInfoCheckDate(void *a1, const char *a2, ...)
{
  return _[a1 lastStorePodcastInfoCheckDate];
}

id objc_msgSend_lastSyncTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 lastSyncTimestamp];
}

id objc_msgSend_lastSyncedDomainVersion(void *a1, const char *a2, ...)
{
  return _[a1 lastSyncedDomainVersion];
}

id objc_msgSend_lastTouchDate(void *a1, const char *a2, ...)
{
  return _[a1 lastTouchDate];
}

id objc_msgSend_lastUnfollowedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastUnfollowedDate];
}

id objc_msgSend_lastUserMarkedAsPlayedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastUserMarkedAsPlayedDate];
}

id objc_msgSend_latestEpisodeDate(void *a1, const char *a2, ...)
{
  return _[a1 latestEpisodeDate];
}

id objc_msgSend_latestExitFromDarkDownloads(void *a1, const char *a2, ...)
{
  return _[a1 latestExitFromDarkDownloads];
}

id objc_msgSend_latestSeasonNumber(void *a1, const char *a2, ...)
{
  return _[a1 latestSeasonNumber];
}

id objc_msgSend_latestUPPSubtask(void *a1, const char *a2, ...)
{
  return _[a1 latestUPPSubtask];
}

id objc_msgSend_launchContextWithLaunchOptions_bootURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchContextWithLaunchOptions:bootURL:");
}

id objc_msgSend_launchOptions(void *a1, const char *a2, ...)
{
  return _[a1 launchOptions];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutAttributesForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:");
}

id objc_msgSend_layoutAttributesForSupplementaryViewOfKind_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:");
}

id objc_msgSend_layoutAttributesForSupplementaryViewOfKind_withIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutManager(void *a1, const char *a2, ...)
{
  return _[a1 layoutManager];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_layoutRightViewController(void *a1, const char *a2, ...)
{
  return _[a1 layoutRightViewController];
}

id objc_msgSend_lazyAttributedDescription(void *a1, const char *a2, ...)
{
  return _[a1 lazyAttributedDescription];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leadingMarginForViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingMarginForViewWidth:");
}

id objc_msgSend_leftAccessoryView(void *a1, const char *a2, ...)
{
  return _[a1 leftAccessoryView];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leftAnchor];
}

id objc_msgSend_leftEditingAccessoryView(void *a1, const char *a2, ...)
{
  return _[a1 leftEditingAccessoryView];
}

id objc_msgSend_leftImageMaskLayer(void *a1, const char *a2, ...)
{
  return _[a1 leftImageMaskLayer];
}

id objc_msgSend_leftImageView(void *a1, const char *a2, ...)
{
  return _[a1 leftImageView];
}

id objc_msgSend_leftNavController(void *a1, const char *a2, ...)
{
  return _[a1 leftNavController];
}

id objc_msgSend_legacyFetchArtworkForPlayerItem_contentItem_atTime_ofSize_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyFetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:");
}

id objc_msgSend_legacyLibraryPath(void *a1, const char *a2, ...)
{
  return _[a1 legacyLibraryPath];
}

id objc_msgSend_legacyPlayCountForPlayState_playCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyPlayCountForPlayState:playCount:");
}

id objc_msgSend_legacyUICachedArtworkForPodcastUuid_withSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyUICachedArtworkForPodcastUuid:withSize:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lenientSharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 lenientSharedInstance];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _[a1 library];
}

id objc_msgSend_libraryDataVersion(void *a1, const char *a2, ...)
{
  return _[a1 libraryDataVersion];
}

id objc_msgSend_libraryNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 libraryNavigationController];
}

id objc_msgSend_libraryPath(void *a1, const char *a2, ...)
{
  return _[a1 libraryPath];
}

id objc_msgSend_libraryShmPath(void *a1, const char *a2, ...)
{
  return _[a1 libraryShmPath];
}

id objc_msgSend_libraryWalPath(void *a1, const char *a2, ...)
{
  return _[a1 libraryWalPath];
}

id objc_msgSend_limitReadAhead(void *a1, const char *a2, ...)
{
  return _[a1 limitReadAhead];
}

id objc_msgSend_lineBreakMode(void *a1, const char *a2, ...)
{
  return _[a1 lineBreakMode];
}

id objc_msgSend_lineFragmentRectForGlyphAtIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineFragmentRectForGlyphAtIndex:effectiveRange:");
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _[a1 lineHeight];
}

id objc_msgSend_listState(void *a1, const char *a2, ...)
{
  return _[a1 listState];
}

id objc_msgSend_listenNowEpisode(void *a1, const char *a2, ...)
{
  return _[a1 listenNowEpisode];
}

id objc_msgSend_listenNowNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 listenNowNavigationController];
}

id objc_msgSend_listenNowQueryObserver(void *a1, const char *a2, ...)
{
  return _[a1 listenNowQueryObserver];
}

id objc_msgSend_load_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "load:");
}

id objc_msgSend_loadBagContextFromIMURLBag_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadBagContextFromIMURLBag:completionBlock:");
}

id objc_msgSend_loadData(void *a1, const char *a2, ...)
{
  return _[a1 loadData];
}

id objc_msgSend_loadIfNeededAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadIfNeededAndReturnError:");
}

id objc_msgSend_loadImageForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadImageForKey:");
}

id objc_msgSend_loadQueue(void *a1, const char *a2, ...)
{
  return _[a1 loadQueue];
}

id objc_msgSend_loadSessionsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 loadSessionsIfNeeded];
}

id objc_msgSend_loadState(void *a1, const char *a2, ...)
{
  return _[a1 loadState];
}

id objc_msgSend_loadStatus(void *a1, const char *a2, ...)
{
  return _[a1 loadStatus];
}

id objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:");
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 loadViewIfNeeded];
}

id objc_msgSend_loadedDuration(void *a1, const char *a2, ...)
{
  return _[a1 loadedDuration];
}

id objc_msgSend_loading(void *a1, const char *a2, ...)
{
  return _[a1 loading];
}

id objc_msgSend_loadingScreen(void *a1, const char *a2, ...)
{
  return _[a1 loadingScreen];
}

id objc_msgSend_localAVPlayer(void *a1, const char *a2, ...)
{
  return _[a1 localAVPlayer];
}

id objc_msgSend_localAssetSupportWorkQueue(void *a1, const char *a2, ...)
{
  return _[a1 localAssetSupportWorkQueue];
}

id objc_msgSend_localLibraryUpdatesDisabled(void *a1, const char *a2, ...)
{
  return _[a1 localLibraryUpdatesDisabled];
}

id objc_msgSend_localShowMissing(void *a1, const char *a2, ...)
{
  return _[a1 localShowMissing];
}

id objc_msgSend_localizedCaseInsensitiveContainsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCaseInsensitiveContainsString:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_localizedInfoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 localizedInfoDictionary];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedStringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedUppercaseString];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockContentOffset(void *a1, const char *a2, ...)
{
  return _[a1 lockContentOffset];
}

id objc_msgSend_lockWhenCondition_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockWhenCondition:beforeDate:");
}

id objc_msgSend_lockup_moreButtonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockup:moreButtonTapped:");
}

id objc_msgSend_lockupContainer(void *a1, const char *a2, ...)
{
  return _[a1 lockupContainer];
}

id objc_msgSend_lockupDidChangeSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockupDidChangeSize:");
}

id objc_msgSend_logAndThrow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAndThrow:");
}

id objc_msgSend_logAndThrow_printStackTrace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAndThrow:printStackTrace:");
}

id objc_msgSend_logEventWithType_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logEventWithType:context:");
}

id objc_msgSend_logFile_lineNumber_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logFile:lineNumber:format:");
}

id objc_msgSend_logPrefix(void *a1, const char *a2, ...)
{
  return _[a1 logPrefix];
}

id objc_msgSend_loggingCategory(void *a1, const char *a2, ...)
{
  return _[a1 loggingCategory];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longPressRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 longPressRecognizer];
}

id objc_msgSend_longReasonTextForNoInternet(void *a1, const char *a2, ...)
{
  return _[a1 longReasonTextForNoInternet];
}

id objc_msgSend_longStringForUnavailableReason_podcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longStringForUnavailableReason:podcastTitle:");
}

id objc_msgSend_longTitles(void *a1, const char *a2, ...)
{
  return _[a1 longTitles];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_lookupDict(void *a1, const char *a2, ...)
{
  return _[a1 lookupDict];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_magicMomentPlayerItem(void *a1, const char *a2, ...)
{
  return _[a1 magicMomentPlayerItem];
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return _[a1 main];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainOrPrivateContext(void *a1, const char *a2, ...)
{
  return _[a1 mainOrPrivateContext];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainQueueContext(void *a1, const char *a2, ...)
{
  return _[a1 mainQueueContext];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mainThread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainThread:");
}

id objc_msgSend_main_configureCell_forRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "main_configureCell:forRowAtIndexPath:");
}

id objc_msgSend_main_tableView_canFocusRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "main_tableView:canFocusRowAtIndexPath:");
}

id objc_msgSend_main_tableView_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "main_tableView:cellForRowAtIndexPath:");
}

id objc_msgSend_main_tableView_didSelectRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "main_tableView:didSelectRowAtIndexPath:");
}

id objc_msgSend_main_tableView_heightForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "main_tableView:heightForRowAtIndexPath:");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_managedAssetsDirectoryURL(void *a1, const char *a2, ...)
{
  return _[a1 managedAssetsDirectoryURL];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectContext];
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectModel];
}

id objc_msgSend_managedObjectModelDefinitionURL(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectModelDefinitionURL];
}

id objc_msgSend_managedValueWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedValueWithValue:");
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return _[a1 manifest];
}

id objc_msgSend_manifestDidChange(void *a1, const char *a2, ...)
{
  return _[a1 manifestDidChange];
}

id objc_msgSend_manifestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 manifestIdentifier];
}

id objc_msgSend_manifestIndex(void *a1, const char *a2, ...)
{
  return _[a1 manifestIndex];
}

id objc_msgSend_manuallyAdded(void *a1, const char *a2, ...)
{
  return _[a1 manuallyAdded];
}

id objc_msgSend_marginBottomForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "marginBottomForStyle:");
}

id objc_msgSend_markAddedSubscriptionsAsSynced(void *a1, const char *a2, ...)
{
  return _[a1 markAddedSubscriptionsAsSynced];
}

id objc_msgSend_markAllShowsAsSynced(void *a1, const char *a2, ...)
{
  return _[a1 markAllShowsAsSynced];
}

id objc_msgSend_markAsAgreedToLatestTerms(void *a1, const char *a2, ...)
{
  return _[a1 markAsAgreedToLatestTerms];
}

id objc_msgSend_markAsBookmarked(void *a1, const char *a2, ...)
{
  return _[a1 markAsBookmarked];
}

id objc_msgSend_markAsUnbookmarked(void *a1, const char *a2, ...)
{
  return _[a1 markAsUnbookmarked];
}

id objc_msgSend_markBookmarkedAction(void *a1, const char *a2, ...)
{
  return _[a1 markBookmarkedAction];
}

id objc_msgSend_markBookmarksSyncDirty_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markBookmarksSyncDirty:for:");
}

id objc_msgSend_markEpisodeAsFirstSeen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markEpisodeAsFirstSeen:");
}

id objc_msgSend_markEverythingAsSyncedWithVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markEverythingAsSyncedWithVersion:");
}

id objc_msgSend_markPlayedAction(void *a1, const char *a2, ...)
{
  return _[a1 markPlayedAction];
}

id objc_msgSend_markPlaylistsForUpdate(void *a1, const char *a2, ...)
{
  return _[a1 markPlaylistsForUpdate];
}

id objc_msgSend_markShowsAsSyncedForPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markShowsAsSyncedForPredicate:");
}

id objc_msgSend_markSubscriptionSyncDirty_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markSubscriptionSyncDirty:for:");
}

id objc_msgSend_markUnbookmarkedAction(void *a1, const char *a2, ...)
{
  return _[a1 markUnbookmarkedAction];
}

id objc_msgSend_markUnplayedAction(void *a1, const char *a2, ...)
{
  return _[a1 markUnplayedAction];
}

id objc_msgSend_marqueeDelay(void *a1, const char *a2, ...)
{
  return _[a1 marqueeDelay];
}

id objc_msgSend_masterViewController(void *a1, const char *a2, ...)
{
  return _[a1 masterViewController];
}

id objc_msgSend_maxWidth(void *a1, const char *a2, ...)
{
  return _[a1 maxWidth];
}

id objc_msgSend_maximumContentWidth(void *a1, const char *a2, ...)
{
  return _[a1 maximumContentWidth];
}

id objc_msgSend_maximumContentWidthForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumContentWidthForStyle:");
}

id objc_msgSend_maximumLevelHeightDefault(void *a1, const char *a2, ...)
{
  return _[a1 maximumLevelHeightDefault];
}

id objc_msgSend_maximumLevelHeightMax(void *a1, const char *a2, ...)
{
  return _[a1 maximumLevelHeightMax];
}

id objc_msgSend_maximumLevelHeightMin(void *a1, const char *a2, ...)
{
  return _[a1 maximumLevelHeightMin];
}

id objc_msgSend_maximumNumberOfLines(void *a1, const char *a2, ...)
{
  return _[a1 maximumNumberOfLines];
}

id objc_msgSend_mediaItemDictionary(void *a1, const char *a2, ...)
{
  return _[a1 mediaItemDictionary];
}

id objc_msgSend_mediaItemForEpisodeWithManagedObjectID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItemForEpisodeWithManagedObjectID:");
}

id objc_msgSend_mediaItemForEpisodeWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItemForEpisodeWithUUID:");
}

id objc_msgSend_mediaItemIdentifierForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItemIdentifierForEpisode:");
}

id objc_msgSend_mediaItemIndexes(void *a1, const char *a2, ...)
{
  return _[a1 mediaItemIndexes];
}

id objc_msgSend_mediaItemMetadata(void *a1, const char *a2, ...)
{
  return _[a1 mediaItemMetadata];
}

id objc_msgSend_mediaItemMetadataForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItemMetadataForProperty:");
}

id objc_msgSend_mediaItems(void *a1, const char *a2, ...)
{
  return _[a1 mediaItems];
}

id objc_msgSend_mediaLibraryId(void *a1, const char *a2, ...)
{
  return _[a1 mediaLibraryId];
}

id objc_msgSend_mediaOptionArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaOptionArray:");
}

id objc_msgSend_mediaOptionValues(void *a1, const char *a2, ...)
{
  return _[a1 mediaOptionValues];
}

id objc_msgSend_mediaQuery(void *a1, const char *a2, ...)
{
  return _[a1 mediaQuery];
}

id objc_msgSend_mediaRemoteOptions(void *a1, const char *a2, ...)
{
  return _[a1 mediaRemoteOptions];
}

id objc_msgSend_mediaRemotePlayerPath(void *a1, const char *a2, ...)
{
  return _[a1 mediaRemotePlayerPath];
}

id objc_msgSend_mediaRequestsWWAN(void *a1, const char *a2, ...)
{
  return _[a1 mediaRequestsWWAN];
}

id objc_msgSend_mediaSelectionGroupForMediaCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaSelectionGroupForMediaCharacteristic:");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_menuWithTitle_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithTitle:children:");
}

id objc_msgSend_mergeArray_fromArray_lookupKey_updateBlock_insertBlock_deleteBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeArray:fromArray:lookupKey:updateBlock:insertBlock:deleteBlock:");
}

id objc_msgSend_mergeData_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:forKey:");
}

id objc_msgSend_mergeData_forKey_version_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:forKey:version:mismatch:");
}

id objc_msgSend_mergeData_forKey_version_mismatch_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:forKey:version:mismatch:finishedBlock:");
}

id objc_msgSend_mergeData_forKey_version_mismatch_isGetTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:forKey:version:mismatch:isGetTransaction:");
}

id objc_msgSend_mergeData_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:mismatch:");
}

id objc_msgSend_mergeLocalAndRemoteData_forKey_version_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeLocalAndRemoteData:forKey:version:mismatch:");
}

id objc_msgSend_mergeMetadataItemFromSetResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeMetadataItemFromSetResponse:");
}

id objc_msgSend_mergeMetadataItemsFromGetResponse(void *a1, const char *a2, ...)
{
  return _[a1 mergeMetadataItemsFromGetResponse];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_messageFont(void *a1, const char *a2, ...)
{
  return _[a1 messageFont];
}

id objc_msgSend_messageForAlertController(void *a1, const char *a2, ...)
{
  return _[a1 messageForAlertController];
}

id objc_msgSend_messageForEmptySection(void *a1, const char *a2, ...)
{
  return _[a1 messageForEmptySection];
}

id objc_msgSend_messageLabel(void *a1, const char *a2, ...)
{
  return _[a1 messageLabel];
}

id objc_msgSend_messageLabelWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageLabelWithFrame:");
}

id objc_msgSend_metadataChapters(void *a1, const char *a2, ...)
{
  return _[a1 metadataChapters];
}

id objc_msgSend_metadataCommandCenter(void *a1, const char *a2, ...)
{
  return _[a1 metadataCommandCenter];
}

id objc_msgSend_metadataFont(void *a1, const char *a2, ...)
{
  return _[a1 metadataFont];
}

id objc_msgSend_metadataFooterFont(void *a1, const char *a2, ...)
{
  return _[a1 metadataFooterFont];
}

id objc_msgSend_metadataFooterForEpisode_includingDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataFooterForEpisode:includingDuration:");
}

id objc_msgSend_metadataFrameForViewWidth_titleFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataFrameForViewWidth:titleFrame:style:");
}

id objc_msgSend_metadataHeaderFont(void *a1, const char *a2, ...)
{
  return _[a1 metadataHeaderFont];
}

id objc_msgSend_metadataIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 metadataIdentifier];
}

id objc_msgSend_metadataInfoCenter(void *a1, const char *a2, ...)
{
  return _[a1 metadataInfoCenter];
}

id objc_msgSend_metadataItemsFromDataSource(void *a1, const char *a2, ...)
{
  return _[a1 metadataItemsFromDataSource];
}

id objc_msgSend_metadataItemsFromKVSStorage(void *a1, const char *a2, ...)
{
  return _[a1 metadataItemsFromKVSStorage];
}

id objc_msgSend_metadataItemsToCommitToDataSource(void *a1, const char *a2, ...)
{
  return _[a1 metadataItemsToCommitToDataSource];
}

id objc_msgSend_metadataItemsToCommitToKVSStorage(void *a1, const char *a2, ...)
{
  return _[a1 metadataItemsToCommitToKVSStorage];
}

id objc_msgSend_metadataLabel(void *a1, const char *a2, ...)
{
  return _[a1 metadataLabel];
}

id objc_msgSend_metadataObject(void *a1, const char *a2, ...)
{
  return _[a1 metadataObject];
}

id objc_msgSend_metadataTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 metadataTimestamp];
}

id objc_msgSend_metadataWithValuesFromDataSourceItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataWithValuesFromDataSourceItem:");
}

id objc_msgSend_metadataWithValuesItemIdentifier_keyValueStorePayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataWithValuesItemIdentifier:keyValueStorePayload:");
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_metricDataSource(void *a1, const char *a2, ...)
{
  return _[a1 metricDataSource];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_metricsAdditionalData(void *a1, const char *a2, ...)
{
  return _[a1 metricsAdditionalData];
}

id objc_msgSend_metricsCanaryIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 metricsCanaryIdentifier];
}

id objc_msgSend_metricsContentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 metricsContentIdentifier];
}

id objc_msgSend_metricsDictionary(void *a1, const char *a2, ...)
{
  return _[a1 metricsDictionary];
}

id objc_msgSend_metricsKeys(void *a1, const char *a2, ...)
{
  return _[a1 metricsKeys];
}

id objc_msgSend_metricsPlayStartPosition(void *a1, const char *a2, ...)
{
  return _[a1 metricsPlayStartPosition];
}

id objc_msgSend_metricsPlayStartTime(void *a1, const char *a2, ...)
{
  return _[a1 metricsPlayStartTime];
}

id objc_msgSend_migrate(void *a1, const char *a2, ...)
{
  return _[a1 migrate];
}

id objc_msgSend_migrateDatabasePropertiesToSharedContainerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 migrateDatabasePropertiesToSharedContainerIfNeeded];
}

id objc_msgSend_migrateDatabaseToSharedContainerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 migrateDatabaseToSharedContainerIfNeeded];
}

id objc_msgSend_migrateDefaultPlaylistsForVersion18to19(void *a1, const char *a2, ...)
{
  return _[a1 migrateDefaultPlaylistsForVersion18to19];
}

id objc_msgSend_migrateIfNecessaryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateIfNecessaryWithCompletion:");
}

id objc_msgSend_migrateLibraryArtworkFromImageStoreWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateLibraryArtworkFromImageStoreWithCompletionHandler:");
}

id objc_msgSend_migratePlaylistDefaultsForVersion7to8(void *a1, const char *a2, ...)
{
  return _[a1 migratePlaylistDefaultsForVersion7to8];
}

id objc_msgSend_migratePlaylistsForVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migratePlaylistsForVersion:");
}

id objc_msgSend_migrateSerpentId(void *a1, const char *a2, ...)
{
  return _[a1 migrateSerpentId];
}

id objc_msgSend_migrateSettingDefaultsForVersion10to11(void *a1, const char *a2, ...)
{
  return _[a1 migrateSettingDefaultsForVersion10to11];
}

id objc_msgSend_migrateSettingDefaultsForVersion30to31(void *a1, const char *a2, ...)
{
  return _[a1 migrateSettingDefaultsForVersion30to31];
}

id objc_msgSend_migrateSettingDefaultsForVersion42to43(void *a1, const char *a2, ...)
{
  return _[a1 migrateSettingDefaultsForVersion42to43];
}

id objc_msgSend_migrateSettingDefaultsForVersion44to45(void *a1, const char *a2, ...)
{
  return _[a1 migrateSettingDefaultsForVersion44to45];
}

id objc_msgSend_migrateSettingDefaultsForVersion48to49(void *a1, const char *a2, ...)
{
  return _[a1 migrateSettingDefaultsForVersion48to49];
}

id objc_msgSend_migrateSettingDefaultsForVersion58to59(void *a1, const char *a2, ...)
{
  return _[a1 migrateSettingDefaultsForVersion58to59];
}

id objc_msgSend_migrateSettingDefaultsForVersion6to7(void *a1, const char *a2, ...)
{
  return _[a1 migrateSettingDefaultsForVersion6to7];
}

id objc_msgSend_migrateSettingDefaultsForVersion9to10(void *a1, const char *a2, ...)
{
  return _[a1 migrateSettingDefaultsForVersion9to10];
}

id objc_msgSend_migrateSettingsForVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingsForVersion:");
}

id objc_msgSend_migrateToDeltaFeedSystem(void *a1, const char *a2, ...)
{
  return _[a1 migrateToDeltaFeedSystem];
}

id objc_msgSend_migrationRegisteredAtVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrationRegisteredAtVersion:");
}

id objc_msgSend_minimumInteritemSpacing(void *a1, const char *a2, ...)
{
  return _[a1 minimumInteritemSpacing];
}

id objc_msgSend_minimumLineSpacing(void *a1, const char *a2, ...)
{
  return _[a1 minimumLineSpacing];
}

id objc_msgSend_minusOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusOrderedSet:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mockEpisode(void *a1, const char *a2, ...)
{
  return _[a1 mockEpisode];
}

id objc_msgSend_modelGenericObject(void *a1, const char *a2, ...)
{
  return _[a1 modelGenericObject];
}

id objc_msgSend_modernKeyFromFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modernKeyFromFeedUrl:");
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return _[a1 modifiedDate];
}

id objc_msgSend_moreAction(void *a1, const char *a2, ...)
{
  return _[a1 moreAction];
}

id objc_msgSend_moreButton(void *a1, const char *a2, ...)
{
  return _[a1 moreButton];
}

id objc_msgSend_moreButtonFrameForDescriptionFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moreButtonFrameForDescriptionFrame:");
}

id objc_msgSend_moreButtonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moreButtonTapped:");
}

id objc_msgSend_moreIcon(void *a1, const char *a2, ...)
{
  return _[a1 moreIcon];
}

id objc_msgSend_moreItemsAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moreItemsAvailable:");
}

id objc_msgSend_moveEpisodeFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveEpisodeFrom:to:");
}

id objc_msgSend_moveItem_afterItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItem:afterItem:");
}

id objc_msgSend_moveItemAtIndexPath_toIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtIndexPath:toIndexPath:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_moveSQLiteFilesFromDocumentsToSharedContainer(void *a1, const char *a2, ...)
{
  return _[a1 moveSQLiteFilesFromDocumentsToSharedContainer];
}

id objc_msgSend_moveSourceFile_toPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveSourceFile:toPath:");
}

id objc_msgSend_moveUserDefaultToSharedContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveUserDefaultToSharedContainer:");
}

id objc_msgSend_mt_RTLMirrorIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_RTLMirrorIfNeeded");
}

id objc_msgSend_mt_allItemsForPodcastsApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_allItemsForPodcastsApp");
}

id objc_msgSend_mt_areMarginsGenerousForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_areMarginsGenerousForWidth:");
}

id objc_msgSend_mt_baselineOriginY(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_baselineOriginY");
}

id objc_msgSend_mt_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_collectionView");
}

id objc_msgSend_mt_compactMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_compactMap:");
}

id objc_msgSend_mt_configureForDisplayingArtworkWithRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_configureForDisplayingArtworkWithRadius:");
}

id objc_msgSend_mt_enableAutomaticRTLMirroringForSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_enableAutomaticRTLMirroringForSubviews");
}

id objc_msgSend_mt_firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_firstBaselineOffsetFromTop");
}

id objc_msgSend_mt_fontDescriptorForTextStyle_contentSizeCategoryName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_fontDescriptorForTextStyle:contentSizeCategoryName:");
}

id objc_msgSend_mt_fontForTextStyle_contentSizeCategoryName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_fontForTextStyle:contentSizeCategoryName:");
}

id objc_msgSend_mt_hideNavigationBarOnFirstScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_hideNavigationBarOnFirstScreen");
}

id objc_msgSend_mt_horizontalMarginsForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_horizontalMarginsForWidth:");
}

id objc_msgSend_mt_isDarkBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_isDarkBackground");
}

id objc_msgSend_mt_isExcludedFromAutomaticRTLMirroring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_isExcludedFromAutomaticRTLMirroring");
}

id objc_msgSend_mt_isRTL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_isRTL");
}

id objc_msgSend_mt_layoutMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_layoutMargins");
}

id objc_msgSend_mt_layoutMarginsForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_layoutMarginsForWidth:");
}

id objc_msgSend_mt_leftMargin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_leftMargin");
}

id objc_msgSend_mt_offsetFromCapHeightToAscent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_offsetFromCapHeightToAscent");
}

id objc_msgSend_mt_offsetFromFirstBaselineToTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_offsetFromFirstBaselineToTop");
}

id objc_msgSend_mt_offsetFromLastBaselineToBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_offsetFromLastBaselineToBottom");
}

id objc_msgSend_mt_popToRootViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_popToRootViewControllerAnimated:completion:");
}

id objc_msgSend_mt_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_preferredFontForTextStyle:");
}

id objc_msgSend_mt_preferredFontForTextStyle_addingSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_preferredFontForTextStyle:addingSymbolicTraits:");
}

id objc_msgSend_mt_primaryTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_primaryTextColor");
}

id objc_msgSend_mt_recursivelyFindFirstViewMeetingCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_recursivelyFindFirstViewMeetingCriteria:");
}

id objc_msgSend_mt_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_rootViewController");
}

id objc_msgSend_mt_secondaryTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_secondaryTextColor");
}

id objc_msgSend_mt_selectedCellColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_selectedCellColor");
}

id objc_msgSend_mt_separatorColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_separatorColor");
}

id objc_msgSend_mt_setShouldRTLMirrorStackDepth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_setShouldRTLMirrorStackDepth:");
}

id objc_msgSend_mt_shouldRTLMirrorStackDepth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_shouldRTLMirrorStackDepth");
}

id objc_msgSend_mt_topNavigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_topNavigationController");
}

id objc_msgSend_mt_topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_topViewController");
}

id objc_msgSend_multiCheckIcon(void *a1, const char *a2, ...)
{
  return _[a1 multiCheckIcon];
}

id objc_msgSend_multiUncheckIcon(void *a1, const char *a2, ...)
{
  return _[a1 multiUncheckIcon];
}

id objc_msgSend_musicBarsStyle(void *a1, const char *a2, ...)
{
  return _[a1 musicBarsStyle];
}

id objc_msgSend_musicNowPlayingViewController(void *a1, const char *a2, ...)
{
  return _[a1 musicNowPlayingViewController];
}

id objc_msgSend_musicPlayQueue(void *a1, const char *a2, ...)
{
  return _[a1 musicPlayQueue];
}

id objc_msgSend_musicRepeatType(void *a1, const char *a2, ...)
{
  return _[a1 musicRepeatType];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableOrderedSetValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableOrderedSetValueForKey:");
}

id objc_msgSend_mutableSetValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableSetValueForKey:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nanoFriendlyDisplayString(void *a1, const char *a2, ...)
{
  return _[a1 nanoFriendlyDisplayString];
}

id objc_msgSend_naturalRect(void *a1, const char *a2, ...)
{
  return _[a1 naturalRect];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_needToMigrateDataToSharedContainer(void *a1, const char *a2, ...)
{
  return _[a1 needToMigrateDataToSharedContainer];
}

id objc_msgSend_needsArtworkUpdate(void *a1, const char *a2, ...)
{
  return _[a1 needsArtworkUpdate];
}

id objc_msgSend_needsCacheBustForFreeAndPaidUrlStorage(void *a1, const char *a2, ...)
{
  return _[a1 needsCacheBustForFreeAndPaidUrlStorage];
}

id objc_msgSend_needsCoreDataMigration(void *a1, const char *a2, ...)
{
  return _[a1 needsCoreDataMigration];
}

id objc_msgSend_needsDataMigration(void *a1, const char *a2, ...)
{
  return _[a1 needsDataMigration];
}

id objc_msgSend_needsFrozenCheck(void *a1, const char *a2, ...)
{
  return _[a1 needsFrozenCheck];
}

id objc_msgSend_needsImageStoreMigration(void *a1, const char *a2, ...)
{
  return _[a1 needsImageStoreMigration];
}

id objc_msgSend_needsMigration(void *a1, const char *a2, ...)
{
  return _[a1 needsMigration];
}

id objc_msgSend_needsMigrationToDeltaFeedUpdates(void *a1, const char *a2, ...)
{
  return _[a1 needsMigrationToDeltaFeedUpdates];
}

id objc_msgSend_needsNetworkToPlayButNoNetwork(void *a1, const char *a2, ...)
{
  return _[a1 needsNetworkToPlayButNoNetwork];
}

id objc_msgSend_needsSerpentIdEpisodeMigration(void *a1, const char *a2, ...)
{
  return _[a1 needsSerpentIdEpisodeMigration];
}

id objc_msgSend_needsToComputeLastLaunch(void *a1, const char *a2, ...)
{
  return _[a1 needsToComputeLastLaunch];
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return _[a1 needsUpdate];
}

id objc_msgSend_networkIsReachable(void *a1, const char *a2, ...)
{
  return _[a1 networkIsReachable];
}

id objc_msgSend_networkStatus(void *a1, const char *a2, ...)
{
  return _[a1 networkStatus];
}

id objc_msgSend_networkUPPEnabled(void *a1, const char *a2, ...)
{
  return _[a1 networkUPPEnabled];
}

id objc_msgSend_networkingBlockedErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkingBlockedErrorWithTransaction:underlyingError:");
}

id objc_msgSend_networkingBlockedUntil(void *a1, const char *a2, ...)
{
  return _[a1 networkingBlockedUntil];
}

id objc_msgSend_newBackgroundTaskWithExpirationHandler_debugInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newBackgroundTaskWithExpirationHandler:debugInfo:");
}

id objc_msgSend_newCellForDescriptionType_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newCellForDescriptionType:inGroupWithIdentifier:");
}

id objc_msgSend_newCellInstanceWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newCellInstanceWithReuseIdentifier:");
}

id objc_msgSend_newCommandEventWithInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newCommandEventWithInterval:");
}

id objc_msgSend_newEpisodeCount(void *a1, const char *a2, ...)
{
  return _[a1 newEpisodeCount];
}

id objc_msgSend_newKVSGetAllTransactionSinceDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newKVSGetAllTransactionSinceDomainVersion:");
}

id objc_msgSend_newKVSGetAllTransactionWithMetadataItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newKVSGetAllTransactionWithMetadataItems:");
}

id objc_msgSend_newKVSPutAllTransactionWithMetadataItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newKVSPutAllTransactionWithMetadataItems:");
}

id objc_msgSend_newKVSTransactionWithType_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newKVSTransactionWithType:keys:");
}

id objc_msgSend_newSettingsController(void *a1, const char *a2, ...)
{
  return _[a1 newSettingsController];
}

id objc_msgSend_newestEpisode(void *a1, const char *a2, ...)
{
  return _[a1 newestEpisode];
}

id objc_msgSend_newestEpisodeByAvailabiltyTime(void *a1, const char *a2, ...)
{
  return _[a1 newestEpisodeByAvailabiltyTime];
}

id objc_msgSend_newestEpisodeExcludingUuid_excludeExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestEpisodeExcludingUuid:excludeExplicit:");
}

id objc_msgSend_newestEpisodeWithFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestEpisodeWithFilter:");
}

id objc_msgSend_newestFullEpisode(void *a1, const char *a2, ...)
{
  return _[a1 newestFullEpisode];
}

id objc_msgSend_newestUserEpisodeExcludingExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestUserEpisodeExcludingExplicit:");
}

id objc_msgSend_newlyEntitledEpisodeUUIDs(void *a1, const char *a2, ...)
{
  return _[a1 newlyEntitledEpisodeUUIDs];
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return _[a1 next];
}

id objc_msgSend_nextChapter(void *a1, const char *a2, ...)
{
  return _[a1 nextChapter];
}

id objc_msgSend_nextEpisode(void *a1, const char *a2, ...)
{
  return _[a1 nextEpisode];
}

id objc_msgSend_nextEpisodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 nextEpisodeUuid];
}

id objc_msgSend_nextFocusedIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 nextFocusedIndexPath];
}

id objc_msgSend_nextFocusedView(void *a1, const char *a2, ...)
{
  return _[a1 nextFocusedView];
}

id objc_msgSend_nextItem(void *a1, const char *a2, ...)
{
  return _[a1 nextItem];
}

id objc_msgSend_nextManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextManifest:");
}

id objc_msgSend_nextMarqueeView(void *a1, const char *a2, ...)
{
  return _[a1 nextMarqueeView];
}

id objc_msgSend_nextMediaItem(void *a1, const char *a2, ...)
{
  return _[a1 nextMediaItem];
}

id objc_msgSend_nextRemote(void *a1, const char *a2, ...)
{
  return _[a1 nextRemote];
}

id objc_msgSend_noStoreAccountErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noStoreAccountErrorWithTransaction:underlyingError:");
}

id objc_msgSend_notPredicateWithSubpredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notPredicateWithSubpredicate:");
}

id objc_msgSend_notSubscribedPodcastResultsControllerWithSort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notSubscribedPodcastResultsControllerWithSort:");
}

id objc_msgSend_notYetUpdatable(void *a1, const char *a2, ...)
{
  return _[a1 notYetUpdatable];
}

id objc_msgSend_notifications(void *a1, const char *a2, ...)
{
  return _[a1 notifications];
}

id objc_msgSend_notifyCurrentItemDidChange(void *a1, const char *a2, ...)
{
  return _[a1 notifyCurrentItemDidChange];
}

id objc_msgSend_notifyObservers(void *a1, const char *a2, ...)
{
  return _[a1 notifyObservers];
}

id objc_msgSend_notifyObserversForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyObserversForPodcast:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_nowPlayingController(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingController];
}

id objc_msgSend_nowPlayingIcon(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingIcon];
}

id objc_msgSend_nowPlayingProperties(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingProperties];
}

id objc_msgSend_nowPlayingWallPaper(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingWallPaper];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numMetadataItemsFromDataSource(void *a1, const char *a2, ...)
{
  return _[a1 numMetadataItemsFromDataSource];
}

id objc_msgSend_numMetadataItemsFromKVSStorage(void *a1, const char *a2, ...)
{
  return _[a1 numMetadataItemsFromKVSStorage];
}

id objc_msgSend_numMetadataItemsToCommitToDataSource(void *a1, const char *a2, ...)
{
  return _[a1 numMetadataItemsToCommitToDataSource];
}

id objc_msgSend_numMetadataItemsToCommitToKVSStorage(void *a1, const char *a2, ...)
{
  return _[a1 numMetadataItemsToCommitToKVSStorage];
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 numberFormatter];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfBytesTransferred(void *a1, const char *a2, ...)
{
  return _[a1 numberOfBytesTransferred];
}

id objc_msgSend_numberOfColumns(void *a1, const char *a2, ...)
{
  return _[a1 numberOfColumns];
}

id objc_msgSend_numberOfDroppedVideoFrames(void *a1, const char *a2, ...)
{
  return _[a1 numberOfDroppedVideoFrames];
}

id objc_msgSend_numberOfExtraObjects(void *a1, const char *a2, ...)
{
  return _[a1 numberOfExtraObjects];
}

id objc_msgSend_numberOfGlyphs(void *a1, const char *a2, ...)
{
  return _[a1 numberOfGlyphs];
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItemsInSection:");
}

id objc_msgSend_numberOfLevels(void *a1, const char *a2, ...)
{
  return _[a1 numberOfLevels];
}

id objc_msgSend_numberOfLines(void *a1, const char *a2, ...)
{
  return _[a1 numberOfLines];
}

id objc_msgSend_numberOfMediaRequests(void *a1, const char *a2, ...)
{
  return _[a1 numberOfMediaRequests];
}

id objc_msgSend_numberOfObjects(void *a1, const char *a2, ...)
{
  return _[a1 numberOfObjects];
}

id objc_msgSend_numberOfObjectsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfObjectsInSection:");
}

id objc_msgSend_numberOfPlaceholderObjects(void *a1, const char *a2, ...)
{
  return _[a1 numberOfPlaceholderObjects];
}

id objc_msgSend_numberOfResults(void *a1, const char *a2, ...)
{
  return _[a1 numberOfResults];
}

id objc_msgSend_numberOfRowsFromIndexPath_toFromIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRowsFromIndexPath:toFromIndexPath:");
}

id objc_msgSend_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRowsInSection:");
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSections];
}

id objc_msgSend_numberOfSectionsInTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfSectionsInTableView:");
}

id objc_msgSend_numberOfServerAddressChanges(void *a1, const char *a2, ...)
{
  return _[a1 numberOfServerAddressChanges];
}

id objc_msgSend_numberOfStalls(void *a1, const char *a2, ...)
{
  return _[a1 numberOfStalls];
}

id objc_msgSend_numberValue(void *a1, const char *a2, ...)
{
  return _[a1 numberValue];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexPath:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectDictionariesInEntity_predicate_sortDescriptors_propertiesToFetch_includeObjectId_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:");
}

id objc_msgSend_objectDictionariesInEntity_predicate_sortDescriptors_propertiesToFetch_includeObjectId_limit_distinct_groupBy_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:limit:distinct:groupBy:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_withDefaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:withDefaultValue:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectForUuid_entityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForUuid:entityName:");
}

id objc_msgSend_objectInEntity_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectInEntity:predicate:");
}

id objc_msgSend_objectValue(void *a1, const char *a2, ...)
{
  return _[a1 objectValue];
}

id objc_msgSend_objectVersionPairForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectVersionPairForKey:");
}

id objc_msgSend_objectWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithID:");
}

id objc_msgSend_objects(void *a1, const char *a2, ...)
{
  return _[a1 objects];
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_objectsForKeys_notFoundMarker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsForKeys:notFoundMarker:");
}

id objc_msgSend_objectsInEntity_predicate_propertiesToFetch_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:propertiesToFetch:batchSize:");
}

id objc_msgSend_objectsInEntity_predicate_propertiesToFetch_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:propertiesToFetch:limit:");
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:");
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_returnsObjectsAsFaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:");
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_returnsObjectsAsFaults_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:");
}

id objc_msgSend_objectsToIndexPathDictionary_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsToIndexPathDictionary:inSection:");
}

id objc_msgSend_observePlaybackStartEventForRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observePlaybackStartEventForRefId:");
}

id objc_msgSend_observedBitrate(void *a1, const char *a2, ...)
{
  return _[a1 observedBitrate];
}

id objc_msgSend_observedBitrateStandardDeviation(void *a1, const char *a2, ...)
{
  return _[a1 observedBitrateStandardDeviation];
}

id objc_msgSend_observedMaxBitrate(void *a1, const char *a2, ...)
{
  return _[a1 observedMaxBitrate];
}

id objc_msgSend_observedMinBitrate(void *a1, const char *a2, ...)
{
  return _[a1 observedMinBitrate];
}

id objc_msgSend_observerWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observerWithBlock:");
}

id objc_msgSend_obtainBootURLWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "obtainBootURLWithCompletion:");
}

id objc_msgSend_obtainPermanentIDsForObjects_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "obtainPermanentIDsForObjects:error:");
}

id objc_msgSend_offSetHeight(void *a1, const char *a2, ...)
{
  return _[a1 offSetHeight];
}

id objc_msgSend_offSubtitleOption(void *a1, const char *a2, ...)
{
  return _[a1 offSubtitleOption];
}

id objc_msgSend_offerTypeAsFlagBit(void *a1, const char *a2, ...)
{
  return _[a1 offerTypeAsFlagBit];
}

id objc_msgSend_offerTypesAsFlagBits(void *a1, const char *a2, ...)
{
  return _[a1 offerTypesAsFlagBits];
}

id objc_msgSend_offers(void *a1, const char *a2, ...)
{
  return _[a1 offers];
}

id objc_msgSend_offsetIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offsetIndexPath:");
}

id objc_msgSend_oldPlaybackState(void *a1, const char *a2, ...)
{
  return _[a1 oldPlaybackState];
}

id objc_msgSend_oldestEpisodeDate(void *a1, const char *a2, ...)
{
  return _[a1 oldestEpisodeDate];
}

id objc_msgSend_oldestEpisodeExcludingExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldestEpisodeExcludingExplicit:");
}

id objc_msgSend_oldestUserEpisodeExcludingExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldestUserEpisodeExcludingExplicit:");
}

id objc_msgSend_openExternalEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openExternalEpisode:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openStoreURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openStoreURL:");
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_openURLWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURLWithOptions:");
}

id objc_msgSend_operationCount(void *a1, const char *a2, ...)
{
  return _[a1 operationCount];
}

id objc_msgSend_operationInQueueWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationInQueueWithType:");
}

id objc_msgSend_operationType(void *a1, const char *a2, ...)
{
  return _[a1 operationType];
}

id objc_msgSend_operationTypeForSET(void *a1, const char *a2, ...)
{
  return _[a1 operationTypeForSET];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _[a1 operations];
}

id objc_msgSend_option(void *a1, const char *a2, ...)
{
  return _[a1 option];
}

id objc_msgSend_optionFont(void *a1, const char *a2, ...)
{
  return _[a1 optionFont];
}

id objc_msgSend_optionSettingChanged_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionSettingChanged:value:");
}

id objc_msgSend_optionSettingWithTitle_footerText_initialValue_optionDescription_identifier_changeHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionSettingWithTitle:footerText:initialValue:optionDescription:identifier:changeHandler:");
}

id objc_msgSend_optionSettingWithTitle_headerTitle_footerText_initialValue_optionDescription_identifier_changeHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_optionsForDeletePlayedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 optionsForDeletePlayedEpisodes];
}

id objc_msgSend_optionsForLimitWithGlobalDefault(void *a1, const char *a2, ...)
{
  return _[a1 optionsForLimitWithGlobalDefault];
}

id objc_msgSend_optionsTableViewControllerWithOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsTableViewControllerWithOption:");
}

id objc_msgSend_optionsWithLongTitles_shortTitles_valueList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithLongTitles:shortTitles:valueList:");
}

id objc_msgSend_optionsWithLongTitles_shortTitles_valueList_footerTextCallback_headerTextCallback_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_orangeColor(void *a1, const char *a2, ...)
{
  return _[a1 orangeColor];
}

id objc_msgSend_order(void *a1, const char *a2, ...)
{
  return _[a1 order];
}

id objc_msgSend_orderedIconKeys(void *a1, const char *a2, ...)
{
  return _[a1 orderedIconKeys];
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_orderedSetWithOrderedSet_range_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithOrderedSet:range:copyItems:");
}

id objc_msgSend_originalPodcastFeedURL(void *a1, const char *a2, ...)
{
  return _[a1 originalPodcastFeedURL];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return _[a1 originalRequest];
}

id objc_msgSend_originalTabBarDelegate(void *a1, const char *a2, ...)
{
  return _[a1 originalTabBarDelegate];
}

id objc_msgSend_originalURLForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalURLForTask:");
}

id objc_msgSend_overrideLocalWithRemoteData_forKey_version_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideLocalWithRemoteData:forKey:version:mismatch:");
}

id objc_msgSend_pageParser(void *a1, const char *a2, ...)
{
  return _[a1 pageParser];
}

id objc_msgSend_pageTypeForReportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageTypeForReportType:");
}

id objc_msgSend_paidSubscriptionActive(void *a1, const char *a2, ...)
{
  return _[a1 paidSubscriptionActive];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 panGestureRecognizer];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_parseError(void *a1, const char *a2, ...)
{
  return _[a1 parseError];
}

id objc_msgSend_parseWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseWithData:");
}

id objc_msgSend_parser(void *a1, const char *a2, ...)
{
  return _[a1 parser];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathWithRoute_bundleID_playerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithRoute:bundleID:playerID:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_pauseLocalPlayer(void *a1, const char *a2, ...)
{
  return _[a1 pauseLocalPlayer];
}

id objc_msgSend_pausePlayerTarget(void *a1, const char *a2, ...)
{
  return _[a1 pausePlayerTarget];
}

id objc_msgSend_pauseWithInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseWithInitiator:");
}

id objc_msgSend_paused(void *a1, const char *a2, ...)
{
  return _[a1 paused];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_pcrFallback(void *a1, const char *a2, ...)
{
  return _[a1 pcrFallback];
}

id objc_msgSend_pendingDeletionPersistentIds(void *a1, const char *a2, ...)
{
  return _[a1 pendingDeletionPersistentIds];
}

id objc_msgSend_pendingDeserializations(void *a1, const char *a2, ...)
{
  return _[a1 pendingDeserializations];
}

id objc_msgSend_pendingFeedProcessingBlocks(void *a1, const char *a2, ...)
{
  return _[a1 pendingFeedProcessingBlocks];
}

id objc_msgSend_pendingRequest(void *a1, const char *a2, ...)
{
  return _[a1 pendingRequest];
}

id objc_msgSend_pendingTransactions(void *a1, const char *a2, ...)
{
  return _[a1 pendingTransactions];
}

id objc_msgSend_pendingUserDefaultArchivedData(void *a1, const char *a2, ...)
{
  return _[a1 pendingUserDefaultArchivedData];
}

id objc_msgSend_performAction(void *a1, const char *a2, ...)
{
  return _[a1 performAction];
}

id objc_msgSend_performAndWaitWithContext_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAndWaitWithContext:save:");
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 performAuthentication];
}

id objc_msgSend_performBatchUpdates_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBatchUpdates:completion:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_performBlockAndWaitWithSave_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWaitWithSave:");
}

id objc_msgSend_performDeletePodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDeletePodcast:");
}

id objc_msgSend_performDeleteStation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDeleteStation:");
}

id objc_msgSend_performFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performFetch:");
}

id objc_msgSend_performOnAvSessionQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performOnAvSessionQueue:");
}

id objc_msgSend_performOnMainQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performOnMainQueue:");
}

id objc_msgSend_performRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequest:");
}

id objc_msgSend_performRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequest:completion:");
}

id objc_msgSend_performRequest_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequest:options:completion:");
}

id objc_msgSend_performRequestAsBufferedAirPlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestAsBufferedAirPlay:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performShowSettingsForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performShowSettingsForPodcast:");
}

id objc_msgSend_performShowSettingsForStation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performShowSettingsForStation:");
}

id objc_msgSend_performSubscribe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSubscribe:");
}

id objc_msgSend_performTransactionWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTransactionWithBlock:");
}

id objc_msgSend_performUniversalPlaybackPositionSync(void *a1, const char *a2, ...)
{
  return _[a1 performUniversalPlaybackPositionSync];
}

id objc_msgSend_performUrlRequest_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUrlRequest:callback:");
}

id objc_msgSend_performWithResponseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithResponseHandler:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_persistentId(void *a1, const char *a2, ...)
{
  return _[a1 persistentId];
}

id objc_msgSend_persistentIds(void *a1, const char *a2, ...)
{
  return _[a1 persistentIds];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 persistentStoreCoordinator];
}

id objc_msgSend_pf_URLByAppendingQueryParameterKey_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_URLByAppendingQueryParameterKey:value:");
}

id objc_msgSend_pf_URLByAppendingQueryParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_URLByAppendingQueryParameters:");
}

id objc_msgSend_pf_URLByAppendingQueryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_URLByAppendingQueryString:");
}

id objc_msgSend_pf_cleanUrlToEpisodeGuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_cleanUrlToEpisodeGuid");
}

id objc_msgSend_pf_cleanUrlToStoreId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_cleanUrlToStoreId");
}

id objc_msgSend_pf_cleanUrlToStoreTrackId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_cleanUrlToStoreTrackId");
}

id objc_msgSend_pf_queryAsDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_queryAsDictionary");
}

id objc_msgSend_pf_stringWithPercentEscape(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_stringWithPercentEscape");
}

id objc_msgSend_pickRouteAndSwitchToLocalCard_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickRouteAndSwitchToLocalCard:completion:");
}

id objc_msgSend_pidToUuidMapping(void *a1, const char *a2, ...)
{
  return _[a1 pidToUuidMapping];
}

id objc_msgSend_placeholderDetailViewController(void *a1, const char *a2, ...)
{
  return _[a1 placeholderDetailViewController];
}

id objc_msgSend_placeholderWithSize_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderWithSize:completionHandler:");
}

id objc_msgSend_platformSpecificConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 platformSpecificConfiguration];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return _[a1 play];
}

id objc_msgSend_play_interruptionEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "play:interruptionEvent:");
}

id objc_msgSend_playButtonRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 playButtonRecognizer];
}

id objc_msgSend_playButtonRecognizerForHeader(void *a1, const char *a2, ...)
{
  return _[a1 playButtonRecognizerForHeader];
}

id objc_msgSend_playCommand(void *a1, const char *a2, ...)
{
  return _[a1 playCommand];
}

id objc_msgSend_playCount(void *a1, const char *a2, ...)
{
  return _[a1 playCount];
}

id objc_msgSend_playEpisodeAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEpisodeAtIndexPath:");
}

id objc_msgSend_playEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEpisodeUuid:");
}

id objc_msgSend_playEpisodeUuid_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEpisodeUuid:context:");
}

id objc_msgSend_playEpisodeUuid_context_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEpisodeUuid:context:limit:");
}

id objc_msgSend_playEpisodeUuid_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEpisodeUuid:limit:");
}

id objc_msgSend_playHandler(void *a1, const char *a2, ...)
{
  return _[a1 playHandler];
}

id objc_msgSend_playItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playItemAtIndexPath:");
}

id objc_msgSend_playItemInQueueCommand(void *a1, const char *a2, ...)
{
  return _[a1 playItemInQueueCommand];
}

id objc_msgSend_playItemWithContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playItemWithContentID:");
}

id objc_msgSend_playListenNow(void *a1, const char *a2, ...)
{
  return _[a1 playListenNow];
}

id objc_msgSend_playLocalPlayer(void *a1, const char *a2, ...)
{
  return _[a1 playLocalPlayer];
}

id objc_msgSend_playManifest_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playManifest:reason:");
}

id objc_msgSend_playManifest_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playManifest:reason:interactive:completion:");
}

id objc_msgSend_playMyPodcastsWithOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playMyPodcastsWithOrder:");
}

id objc_msgSend_playNextAction(void *a1, const char *a2, ...)
{
  return _[a1 playNextAction];
}

id objc_msgSend_playPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playPodcastUuid:");
}

id objc_msgSend_playPodcastUuid_order_limit_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playPodcastUuid:order:limit:error:");
}

id objc_msgSend_playQueue(void *a1, const char *a2, ...)
{
  return _[a1 playQueue];
}

id objc_msgSend_playQueue_didChangeAVPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playQueue:didChangeAVPlayer:");
}

id objc_msgSend_playQueue_didChangeDurationSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playQueue:didChangeDurationSnapshot:");
}

id objc_msgSend_playQueue_didChangeElapsedTime_forItem_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playQueue:didChangeElapsedTime:forItem:atIndex:");
}

id objc_msgSend_playQueue_didChangeFromPlayState_toPlayState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playQueue:didChangeFromPlayState:toPlayState:");
}

id objc_msgSend_playQueue_didChangePlayingItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playQueue:didChangePlayingItem:");
}

id objc_msgSend_playQueue_didUpdateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playQueue:didUpdateQueue:");
}

id objc_msgSend_playQueueType(void *a1, const char *a2, ...)
{
  return _[a1 playQueueType];
}

id objc_msgSend_playReason(void *a1, const char *a2, ...)
{
  return _[a1 playReason];
}

id objc_msgSend_playRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 playRecognizer];
}

id objc_msgSend_playState(void *a1, const char *a2, ...)
{
  return _[a1 playState];
}

id objc_msgSend_playStateFromHasBeenPlayed_andPlayCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStateFromHasBeenPlayed:andPlayCount:");
}

id objc_msgSend_playStateManuallySet(void *a1, const char *a2, ...)
{
  return _[a1 playStateManuallySet];
}

id objc_msgSend_playStateSource(void *a1, const char *a2, ...)
{
  return _[a1 playStateSource];
}

id objc_msgSend_playStationUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStationUuid:");
}

id objc_msgSend_playStationUuid_episodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStationUuid:episodeUuid:");
}

id objc_msgSend_playStationUuid_episodeUuid_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStationUuid:episodeUuid:limit:");
}

id objc_msgSend_playStationUuid_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStationUuid:limit:");
}

id objc_msgSend_playStatusImageForDarkBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStatusImageForDarkBackground:");
}

id objc_msgSend_playStatusImageForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStatusImageForTheme:");
}

id objc_msgSend_playStatusView(void *a1, const char *a2, ...)
{
  return _[a1 playStatusView];
}

id objc_msgSend_playStatusViewFrameForViewWidth_titleFrame_artworkFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStatusViewFrameForViewWidth:titleFrame:artworkFrame:");
}

id objc_msgSend_playWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithContext:");
}

id objc_msgSend_playWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithContext:completion:");
}

id objc_msgSend_playWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithReason:");
}

id objc_msgSend_playWithReason_interruptEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithReason:interruptEvent:");
}

id objc_msgSend_playback(void *a1, const char *a2, ...)
{
  return _[a1 playback];
}

id objc_msgSend_playbackContext(void *a1, const char *a2, ...)
{
  return _[a1 playbackContext];
}

id objc_msgSend_playbackDestination(void *a1, const char *a2, ...)
{
  return _[a1 playbackDestination];
}

id objc_msgSend_playbackNewestToOldest(void *a1, const char *a2, ...)
{
  return _[a1 playbackNewestToOldest];
}

id objc_msgSend_playbackOrder(void *a1, const char *a2, ...)
{
  return _[a1 playbackOrder];
}

id objc_msgSend_playbackPositionController(void *a1, const char *a2, ...)
{
  return _[a1 playbackPositionController];
}

id objc_msgSend_playbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 playbackQueue];
}

id objc_msgSend_playbackQueueController(void *a1, const char *a2, ...)
{
  return _[a1 playbackQueueController];
}

id objc_msgSend_playbackQueueIdentifierForPodcastAdamId_sampPlaybackOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueIdentifierForPodcastAdamId:sampPlaybackOrder:");
}

id objc_msgSend_playbackQueueWithAccountInfoForIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueWithAccountInfoForIdentifiers:");
}

id objc_msgSend_playbackQueueWithAccountInfoForManifest_queueStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueWithAccountInfoForManifest:queueStatus:");
}

id objc_msgSend_playbackQueueWithAccountInfoForPlayerItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueWithAccountInfoForPlayerItems:");
}

id objc_msgSend_playbackQueueWithDsid_forIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueWithDsid:forIdentifiers:");
}

id objc_msgSend_playbackRate(void *a1, const char *a2, ...)
{
  return _[a1 playbackRate];
}

id objc_msgSend_playbackRequestURLWithDSID_baseRequestURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackRequestURLWithDSID:baseRequestURLString:");
}

id objc_msgSend_playbackSessionData(void *a1, const char *a2, ...)
{
  return _[a1 playbackSessionData];
}

id objc_msgSend_playbackSessionID(void *a1, const char *a2, ...)
{
  return _[a1 playbackSessionID];
}

id objc_msgSend_playbackSpeed(void *a1, const char *a2, ...)
{
  return _[a1 playbackSpeed];
}

id objc_msgSend_playbackStartDate(void *a1, const char *a2, ...)
{
  return _[a1 playbackStartDate];
}

id objc_msgSend_playbackStartOffset(void *a1, const char *a2, ...)
{
  return _[a1 playbackStartOffset];
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return _[a1 playbackState];
}

id objc_msgSend_playbackType(void *a1, const char *a2, ...)
{
  return _[a1 playbackType];
}

id objc_msgSend_playbackViewController(void *a1, const char *a2, ...)
{
  return _[a1 playbackViewController];
}

id objc_msgSend_playedText(void *a1, const char *a2, ...)
{
  return _[a1 playedText];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return _[a1 player];
}

id objc_msgSend_player_didStopWithReason_initiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "player:didStopWithReason:initiator:");
}

id objc_msgSend_player_willStopWithReason_initiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "player:willStopWithReason:initiator:");
}

id objc_msgSend_playerController(void *a1, const char *a2, ...)
{
  return _[a1 playerController];
}

id objc_msgSend_playerFailure_shouldShowDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerFailure:shouldShowDialog:");
}

id objc_msgSend_playerID(void *a1, const char *a2, ...)
{
  return _[a1 playerID];
}

id objc_msgSend_playerItem(void *a1, const char *a2, ...)
{
  return _[a1 playerItem];
}

id objc_msgSend_playerItems(void *a1, const char *a2, ...)
{
  return _[a1 playerItems];
}

id objc_msgSend_playerItemsFromPodcastStorePlatformDictionary_oldestEpisode_restricted_initiatedByAnotherUser_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "playerItemsFromPodcastStorePlatformDictionary:oldestEpisode:restricted:initiatedByAnotherUser:");
}

id objc_msgSend_playerItemsNeedLoading(void *a1, const char *a2, ...)
{
  return _[a1 playerItemsNeedLoading];
}

id objc_msgSend_playerPath(void *a1, const char *a2, ...)
{
  return _[a1 playerPath];
}

id objc_msgSend_playerPaused(void *a1, const char *a2, ...)
{
  return _[a1 playerPaused];
}

id objc_msgSend_playerResponse(void *a1, const char *a2, ...)
{
  return _[a1 playerResponse];
}

id objc_msgSend_playerState(void *a1, const char *a2, ...)
{
  return _[a1 playerState];
}

id objc_msgSend_playhead(void *a1, const char *a2, ...)
{
  return _[a1 playhead];
}

id objc_msgSend_playing(void *a1, const char *a2, ...)
{
  return _[a1 playing];
}

id objc_msgSend_playingEpisodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 playingEpisodeUuid];
}

id objc_msgSend_playingItem(void *a1, const char *a2, ...)
{
  return _[a1 playingItem];
}

id objc_msgSend_playingItemIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 playingItemIndexPath];
}

id objc_msgSend_playingUuid(void *a1, const char *a2, ...)
{
  return _[a1 playingUuid];
}

id objc_msgSend_playlist(void *a1, const char *a2, ...)
{
  return _[a1 playlist];
}

id objc_msgSend_playlistForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistForUuid:");
}

id objc_msgSend_playlistIfDefault(void *a1, const char *a2, ...)
{
  return _[a1 playlistIfDefault];
}

id objc_msgSend_playlistPropertiesObserver(void *a1, const char *a2, ...)
{
  return _[a1 playlistPropertiesObserver];
}

id objc_msgSend_playlistSettings(void *a1, const char *a2, ...)
{
  return _[a1 playlistSettings];
}

id objc_msgSend_playlistSettings_didChangeLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistSettings:didChangeLayout:");
}

id objc_msgSend_playlistSettingsDidChangeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistSettingsDidChangeSetting:");
}

id objc_msgSend_playlistSyncDirtyFlag(void *a1, const char *a2, ...)
{
  return _[a1 playlistSyncDirtyFlag];
}

id objc_msgSend_playlistSyncVersion(void *a1, const char *a2, ...)
{
  return _[a1 playlistSyncVersion];
}

id objc_msgSend_playlistUuid(void *a1, const char *a2, ...)
{
  return _[a1 playlistUuid];
}

id objc_msgSend_playlists(void *a1, const char *a2, ...)
{
  return _[a1 playlists];
}

id objc_msgSend_plusButtonImageView(void *a1, const char *a2, ...)
{
  return _[a1 plusButtonImageView];
}

id objc_msgSend_podcast(void *a1, const char *a2, ...)
{
  return _[a1 podcast];
}

id objc_msgSend_podcastActionController(void *a1, const char *a2, ...)
{
  return _[a1 podcastActionController];
}

id objc_msgSend_podcastAdamID(void *a1, const char *a2, ...)
{
  return _[a1 podcastAdamID];
}

id objc_msgSend_podcastAdamId(void *a1, const char *a2, ...)
{
  return _[a1 podcastAdamId];
}

id objc_msgSend_podcastCacheInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastCacheInContext:");
}

id objc_msgSend_podcastCount(void *a1, const char *a2, ...)
{
  return _[a1 podcastCount];
}

id objc_msgSend_podcastDataSource(void *a1, const char *a2, ...)
{
  return _[a1 podcastDataSource];
}

id objc_msgSend_podcastDeleteAction(void *a1, const char *a2, ...)
{
  return _[a1 podcastDeleteAction];
}

id objc_msgSend_podcastEpisode(void *a1, const char *a2, ...)
{
  return _[a1 podcastEpisode];
}

id objc_msgSend_podcastExistsInStoreWithFeedUrl_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastExistsInStoreWithFeedUrl:completion:");
}

id objc_msgSend_podcastFeedUrl(void *a1, const char *a2, ...)
{
  return _[a1 podcastFeedUrl];
}

id objc_msgSend_podcastForFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastForFeedUrl:");
}

id objc_msgSend_podcastForStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastForStoreId:");
}

id objc_msgSend_podcastForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastForUuid:");
}

id objc_msgSend_podcastGroupCellDidTapInfoButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastGroupCellDidTapInfoButton:");
}

id objc_msgSend_podcastHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 podcastHeaderView];
}

id objc_msgSend_podcastImageSize(void *a1, const char *a2, ...)
{
  return _[a1 podcastImageSize];
}

id objc_msgSend_podcastInfoViewController(void *a1, const char *a2, ...)
{
  return _[a1 podcastInfoViewController];
}

id objc_msgSend_podcastInfoViewDidExpand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastInfoViewDidExpand:");
}

id objc_msgSend_podcastInfoViewWasTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastInfoViewWasTapped:");
}

id objc_msgSend_podcastMigrationForVersion11to12_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion11to12:");
}

id objc_msgSend_podcastMigrationForVersion14to15_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion14to15:");
}

id objc_msgSend_podcastMigrationForVersion19to20_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion19to20:");
}

id objc_msgSend_podcastMigrationForVersion20to21_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion20to21:");
}

id objc_msgSend_podcastMigrationForVersion24to25_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion24to25:");
}

id objc_msgSend_podcastMigrationForVersion25to26_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion25to26:");
}

id objc_msgSend_podcastMigrationForVersion26to27_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion26to27:");
}

id objc_msgSend_podcastMigrationForVersion27to28_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion27to28:");
}

id objc_msgSend_podcastMigrationForVersion28to29_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion28to29:");
}

id objc_msgSend_podcastMigrationForVersion32to33_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion32to33:");
}

id objc_msgSend_podcastMigrationForVersion34to35_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion34to35:");
}

id objc_msgSend_podcastMigrationForVersion35to36_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion35to36:");
}

id objc_msgSend_podcastMigrationForVersion36to37_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion36to37:");
}

id objc_msgSend_podcastMigrationForVersion38to39_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion38to39:");
}

id objc_msgSend_podcastMigrationForVersion41to42_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion41to42:");
}

id objc_msgSend_podcastMigrationForVersion42to43_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion42to43:");
}

id objc_msgSend_podcastMigrationForVersion44to45_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion44to45:");
}

id objc_msgSend_podcastMigrationForVersion49to50_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion49to50:");
}

id objc_msgSend_podcastMigrationForVersion50to51_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion50to51:");
}

id objc_msgSend_podcastMigrationForVersion55to56_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion55to56:");
}

id objc_msgSend_podcastMigrationForVersion56to57_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion56to57:");
}

id objc_msgSend_podcastMigrationForVersion57to58_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion57to58:");
}

id objc_msgSend_podcastMigrationForVersion58to59_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion58to59:");
}

id objc_msgSend_podcastMigrationForVersion59to60_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion59to60:");
}

id objc_msgSend_podcastMigrationForVersion62to63_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion62to63:");
}

id objc_msgSend_podcastMigrationForVersion66to67_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion66to67:");
}

id objc_msgSend_podcastMigrationForVersion6to7_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion6to7:");
}

id objc_msgSend_podcastMigrationForVersion8to9_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion8to9:");
}

id objc_msgSend_podcastMigrationForVersion9to10_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion9to10:");
}

id objc_msgSend_podcastPID(void *a1, const char *a2, ...)
{
  return _[a1 podcastPID];
}

id objc_msgSend_podcastPlayAction(void *a1, const char *a2, ...)
{
  return _[a1 podcastPlayAction];
}

id objc_msgSend_podcastPlaylistSettingsForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastPlaylistSettingsForUuid:");
}

id objc_msgSend_podcastRefreshAction(void *a1, const char *a2, ...)
{
  return _[a1 podcastRefreshAction];
}

id objc_msgSend_podcastSettingsAction(void *a1, const char *a2, ...)
{
  return _[a1 podcastSettingsAction];
}

id objc_msgSend_podcastSettingsViewController(void *a1, const char *a2, ...)
{
  return _[a1 podcastSettingsViewController];
}

id objc_msgSend_podcastState(void *a1, const char *a2, ...)
{
  return _[a1 podcastState];
}

id objc_msgSend_podcastStoreId(void *a1, const char *a2, ...)
{
  return _[a1 podcastStoreId];
}

id objc_msgSend_podcastStorePlatformDictionaryFromSiriAssetInfo_podcastAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:");
}

id objc_msgSend_podcastUUID(void *a1, const char *a2, ...)
{
  return _[a1 podcastUUID];
}

id objc_msgSend_podcastUrlForStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUrlForStoreId:");
}

id objc_msgSend_podcastUuid(void *a1, const char *a2, ...)
{
  return _[a1 podcastUuid];
}

id objc_msgSend_podcastUuidForFeedUrlString_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUuidForFeedUrlString:ctx:");
}

id objc_msgSend_podcastUuidForSetPlaybackQueueRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUuidForSetPlaybackQueueRequestIdentifier:");
}

id objc_msgSend_podcastUuids(void *a1, const char *a2, ...)
{
  return _[a1 podcastUuids];
}

id objc_msgSend_podcasts(void *a1, const char *a2, ...)
{
  return _[a1 podcasts];
}

id objc_msgSend_podcastsDomainVersion(void *a1, const char *a2, ...)
{
  return _[a1 podcastsDomainVersion];
}

id objc_msgSend_podcastsObserver(void *a1, const char *a2, ...)
{
  return _[a1 podcastsObserver];
}

id objc_msgSend_pollingInterval(void *a1, const char *a2, ...)
{
  return _[a1 pollingInterval];
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 popoverPresentationController];
}

id objc_msgSend_populateEpisodeDictionary(void *a1, const char *a2, ...)
{
  return _[a1 populateEpisodeDictionary];
}

id objc_msgSend_populateLocationPropertiesWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateLocationPropertiesWithPath:");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_postData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postData:");
}

id objc_msgSend_postManifestDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 postManifestDidChangeNotification];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postNotificationName_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:userInfo:");
}

id objc_msgSend_postPlaybackStateChangeNotificationWithOldState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postPlaybackStateChangeNotificationWithOldState:");
}

id objc_msgSend_postProcessFeedHookWithParams_podcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postProcessFeedHookWithParams:podcastUuid:ctx:");
}

id objc_msgSend_preProcessFeedHook_requestUrl_needsUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preProcessFeedHook:requestUrl:needsUpdate:");
}

id objc_msgSend_preProcessFeedHookWithParams_feed_requestUrl_needsUpdate_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preProcessFeedHookWithParams:feed:requestUrl:needsUpdate:ctx:");
}

id objc_msgSend_preProcessHookDeniedUpdate(void *a1, const char *a2, ...)
{
  return _[a1 preProcessHookDeniedUpdate];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_predicateForAllBookmarkedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAllBookmarkedEpisodes];
}

id objc_msgSend_predicateForAllEpisodesIncludingHiddenOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAllEpisodesIncludingHiddenOnPodcastUuid:");
}

id objc_msgSend_predicateForAllEpisodesOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:");
}

id objc_msgSend_predicateForAllEpisodesOnPodcastUuid_includeNonAudioEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:");
}

id objc_msgSend_predicateForAreMediaAPI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAreMediaAPI:");
}

id objc_msgSend_predicateForAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAudio:");
}

id objc_msgSend_predicateForBacklog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBacklog:");
}

id objc_msgSend_predicateForBookmarkedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 predicateForBookmarkedEpisodes];
}

id objc_msgSend_predicateForBookmarkedEpisodesExcludingUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBookmarkedEpisodesExcludingUUIDs:");
}

id objc_msgSend_predicateForBookmarksOnlyInLocalAndBeforeLastSyncWithRemoteBookmarksUUIDs_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBookmarksOnlyInLocalAndBeforeLastSyncWithRemoteBookmarksUUIDs:");
}

id objc_msgSend_predicateForBookmarksSyncType(void *a1, const char *a2, ...)
{
  return _[a1 predicateForBookmarksSyncType];
}

id objc_msgSend_predicateForDateKey_isGreaterThanDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDateKey:isGreaterThanDate:");
}

id objc_msgSend_predicateForDateKey_isGreaterThanOrEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDateKey:isGreaterThanOrEqualToDate:");
}

id objc_msgSend_predicateForDateKey_isLessThanDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDateKey:isLessThanDate:");
}

id objc_msgSend_predicateForDateKey_isLessThanOrEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDateKey:isLessThanOrEqualToDate:");
}

id objc_msgSend_predicateForDownloadBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDownloadBehavior:");
}

id objc_msgSend_predicateForDownloaded_excludeHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDownloaded:excludeHidden:");
}

id objc_msgSend_predicateForEntitledEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 predicateForEntitledEpisodes];
}

id objc_msgSend_predicateForEpisodeGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeGuid:");
}

id objc_msgSend_predicateForEpisodeGuid_onFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeGuid:onFeedURL:");
}

id objc_msgSend_predicateForEpisodeStoreTrackId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeStoreTrackId:");
}

id objc_msgSend_predicateForEpisodeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeType:");
}

id objc_msgSend_predicateForEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeUuid:");
}

id objc_msgSend_predicateForEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeUuids:");
}

id objc_msgSend_predicateForEpisodesInFeedForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesInFeedForPodcastUuid:");
}

id objc_msgSend_predicateForEpisodesInSearchResults(void *a1, const char *a2, ...)
{
  return _[a1 predicateForEpisodesInSearchResults];
}

id objc_msgSend_predicateForEpisodesIsFromiTunesSyncOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:");
}

id objc_msgSend_predicateForEpisodesOnPodcastUuid_deletePlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:");
}

id objc_msgSend_predicateForEpisodesOnUnplayedTab(void *a1, const char *a2, ...)
{
  return _[a1 predicateForEpisodesOnUnplayedTab];
}

id objc_msgSend_predicateForEpisodesOnUnplayedTabOnPodcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesOnUnplayedTabOnPodcastUuid:ctx:");
}

id objc_msgSend_predicateForEpisodesWhichNeedEntitlementStateUpdate(void *a1, const char *a2, ...)
{
  return _[a1 predicateForEpisodesWhichNeedEntitlementStateUpdate];
}

id objc_msgSend_predicateForEpisodesWhichNeedEntitlementStateUpdateForShowUUID_subscriptionState_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesWhichNeedEntitlementStateUpdateForShowUUID:subscriptionState:");
}

id objc_msgSend_predicateForEpisodesWithSeasonNumbersOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:");
}

id objc_msgSend_predicateForExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForExplicit:");
}

id objc_msgSend_predicateForExternalType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForExternalType:");
}

id objc_msgSend_predicateForFeedDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForFeedDeleted:");
}

id objc_msgSend_predicateForFilteringEpisodesWithEmptyPlayState(void *a1, const char *a2, ...)
{
  return _[a1 predicateForFilteringEpisodesWithEmptyPlayState];
}

id objc_msgSend_predicateForFlag_isTrue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForFlag:isTrue:");
}

id objc_msgSend_predicateForHasBeenSynced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForHasBeenSynced:");
}

id objc_msgSend_predicateForHiddenOrImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 predicateForHiddenOrImplicitlyFollowedPodcasts];
}

id objc_msgSend_predicateForHiddenPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 predicateForHiddenPodcasts];
}

id objc_msgSend_predicateForIdentifer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForIdentifer:");
}

id objc_msgSend_predicateForIsFromiTunesSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForIsFromiTunesSync:");
}

id objc_msgSend_predicateForIsNew_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForIsNew:");
}

id objc_msgSend_predicateForListenNow(void *a1, const char *a2, ...)
{
  return _[a1 predicateForListenNow];
}

id objc_msgSend_predicateForListenNowForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForListenNowForPodcastUuid:");
}

id objc_msgSend_predicateForListenNowLatestEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 predicateForListenNowLatestEpisodes];
}

id objc_msgSend_predicateForMetadataFirstSyncEligible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForMetadataFirstSyncEligible:");
}

id objc_msgSend_predicateForNilLastDatePlayed(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNilLastDatePlayed];
}

id objc_msgSend_predicateForNilLastUserMarkedAsPlayedDate(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNilLastUserMarkedAsPlayedDate];
}

id objc_msgSend_predicateForNilValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNilValueForKey:");
}

id objc_msgSend_predicateForNilValueOrEmptyStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNilValueOrEmptyStringForKey:");
}

id objc_msgSend_predicateForNonNilLastDatePlayed(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNonNilLastDatePlayed];
}

id objc_msgSend_predicateForNonNilLastUserMarkedAsPlayedDate(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNonNilLastUserMarkedAsPlayedDate];
}

id objc_msgSend_predicateForNotHiddenNotImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNotHiddenNotImplicitlyFollowedPodcasts];
}

id objc_msgSend_predicateForNotHiddenPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNotHiddenPodcasts];
}

id objc_msgSend_predicateForNotImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNotImplicitlyFollowedPodcasts];
}

id objc_msgSend_predicateForNotSubscribedAndNotHiddenAndNotImplicitlyFollowed(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNotSubscribedAndNotHiddenAndNotImplicitlyFollowed];
}

id objc_msgSend_predicateForOtherEpisodesOnPodcastUuid_baseEpisodesPredicate_deletePlayedEpisodes_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForOtherEpisodesOnPodcastUuid:baseEpisodesPredicate:deletePlayedEpisodes:");
}

id objc_msgSend_predicateForPeriodicallyUpdatablePodcasts(void *a1, const char *a2, ...)
{
  return _[a1 predicateForPeriodicallyUpdatablePodcasts];
}

id objc_msgSend_predicateForPersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPersistentId:");
}

id objc_msgSend_predicateForPlayStateManuallySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPlayStateManuallySet:");
}

id objc_msgSend_predicateForPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPlayed:");
}

id objc_msgSend_predicateForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcast:");
}

id objc_msgSend_predicateForPodcast_sectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcast:sectionType:");
}

id objc_msgSend_predicateForPodcastIsNotHidden(void *a1, const char *a2, ...)
{
  return _[a1 predicateForPodcastIsNotHidden];
}

id objc_msgSend_predicateForPodcastIsSubscribed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastIsSubscribed:");
}

id objc_msgSend_predicateForPodcastStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastStoreId:");
}

id objc_msgSend_predicateForPodcastUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastUUID:");
}

id objc_msgSend_predicateForPodcastUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastUuids:");
}

id objc_msgSend_predicateForPodcastWithFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastWithFeedUrl:");
}

id objc_msgSend_predicateForPodcastsNeedingRetry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastsNeedingRetry:");
}

id objc_msgSend_predicateForPreviouslyPlayedHidingFutureTimestamps(void *a1, const char *a2, ...)
{
  return _[a1 predicateForPreviouslyPlayedHidingFutureTimestamps];
}

id objc_msgSend_predicateForPubDateLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPubDateLimit:");
}

id objc_msgSend_predicateForRSSEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 predicateForRSSEpisodes];
}

id objc_msgSend_predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid_deletePlayedEpisodes_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:");
}

id objc_msgSend_predicateForRecentlyUnfollowedOlderThanCutoffDate(void *a1, const char *a2, ...)
{
  return _[a1 predicateForRecentlyUnfollowedOlderThanCutoffDate];
}

id objc_msgSend_predicateForSaved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSaved:");
}

id objc_msgSend_predicateForSeasonNumberWithNoEpisodeNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSeasonNumberWithNoEpisodeNumber:");
}

id objc_msgSend_predicateForSettings(void *a1, const char *a2, ...)
{
  return _[a1 predicateForSettings];
}

id objc_msgSend_predicateForStationEligibleEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 predicateForStationEligibleEpisodes];
}

id objc_msgSend_predicateForStations(void *a1, const char *a2, ...)
{
  return _[a1 predicateForStations];
}

id objc_msgSend_predicateForSubscribedAndNotHidden(void *a1, const char *a2, ...)
{
  return _[a1 predicateForSubscribedAndNotHidden];
}

id objc_msgSend_predicateForSubscribedPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 predicateForSubscribedPodcasts];
}

id objc_msgSend_predicateForSubscriptionSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSubscriptionSyncType:");
}

id objc_msgSend_predicateForSuppressAutoDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSuppressAutoDownload:");
}

id objc_msgSend_predicateForSyncablePodcastsForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSyncablePodcastsForSyncType:");
}

id objc_msgSend_predicateForUnplayedTabFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForUnplayedTabFlag:");
}

id objc_msgSend_predicateForUserEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForUserEpisode:");
}

id objc_msgSend_predicateForUserEpisodesOnPodcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForUserEpisodesOnPodcastUuid:ctx:");
}

id objc_msgSend_predicateForUserEpisodesOnPodcastUuid_episodeLimit_deletePlayedEpisodes_limitToDownloadBehaviorAutomatic_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:");
}

id objc_msgSend_predicateForVisuallyPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForVisuallyPlayed:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithValue:");
}

id objc_msgSend_preferencesURL(void *a1, const char *a2, ...)
{
  return _[a1 preferencesURL];
}

id objc_msgSend_preferredFocusedView(void *a1, const char *a2, ...)
{
  return _[a1 preferredFocusedView];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredIntervals(void *a1, const char *a2, ...)
{
  return _[a1 preferredIntervals];
}

id objc_msgSend_prepareAssetForFairPlayPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareAssetForFairPlayPlayback:");
}

id objc_msgSend_prepareAssetForFairPlayPlayback_legacy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareAssetForFairPlayPlayback_legacy:");
}

id objc_msgSend_prepareForPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForPlatform:");
}

id objc_msgSend_prepareForPopoverPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForPopoverPresentation:");
}

id objc_msgSend_prepareForReuse(void *a1, const char *a2, ...)
{
  return _[a1 prepareForReuse];
}

id objc_msgSend_preprocessFeedWithDataHashingBlock_feedCreationBlock_url_useBackgroundFetch_source_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preprocessFeedWithDataHashingBlock:feedCreationBlock:url:useBackgroundFetch:source:");
}

id objc_msgSend_presentAddPodcastUIWithUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAddPodcastUIWithUrl:");
}

id objc_msgSend_presentAlertIfNeeded_presentationCompletion_actionCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAlertIfNeeded:presentationCompletion:actionCompletion:");
}

id objc_msgSend_presentAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAnimated:completion:");
}

id objc_msgSend_presentAvailableActionsFromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAvailableActionsFromView:");
}

id objc_msgSend_presentLaunchAlertIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 presentLaunchAlertIfNeeded];
}

id objc_msgSend_presentNowPlayingAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentNowPlayingAnimated:");
}

id objc_msgSend_presentPodcast_episodeUuid_episodeNotAvailable_podcastTab_startPlayback_animated_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentPodcast:episodeUuid:episodeNotAvailable:podcastTab:startPlayback:animated:");
}

id objc_msgSend_presentStation_new_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentStation:new:");
}

id objc_msgSend_presentStationWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentStationWithTitle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return _[a1 presentationLayer];
}

id objc_msgSend_presentationSize(void *a1, const char *a2, ...)
{
  return _[a1 presentationSize];
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return _[a1 presentationStyle];
}

id objc_msgSend_presentationType(void *a1, const char *a2, ...)
{
  return _[a1 presentationType];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presentingButton(void *a1, const char *a2, ...)
{
  return _[a1 presentingButton];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_prettyShortStringWithDuration_abbreviated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyShortStringWithDuration:abbreviated:");
}

id objc_msgSend_prettyShortStringWithDuration_includeTimeRemainingPhrase_abbreviated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:");
}

id objc_msgSend_prettyStringWithDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyStringWithDuration:");
}

id objc_msgSend_previous(void *a1, const char *a2, ...)
{
  return _[a1 previous];
}

id objc_msgSend_previousBounds(void *a1, const char *a2, ...)
{
  return _[a1 previousBounds];
}

id objc_msgSend_previousChapter(void *a1, const char *a2, ...)
{
  return _[a1 previousChapter];
}

id objc_msgSend_previousItem(void *a1, const char *a2, ...)
{
  return _[a1 previousItem];
}

id objc_msgSend_previousMediaItem(void *a1, const char *a2, ...)
{
  return _[a1 previousMediaItem];
}

id objc_msgSend_previousNumberOfLines(void *a1, const char *a2, ...)
{
  return _[a1 previousNumberOfLines];
}

id objc_msgSend_previousPlayingEpisodeUuid(void *a1, const char *a2, ...)
{
  return _[a1 previousPlayingEpisodeUuid];
}

id objc_msgSend_previousRemote(void *a1, const char *a2, ...)
{
  return _[a1 previousRemote];
}

id objc_msgSend_previousTargetSize(void *a1, const char *a2, ...)
{
  return _[a1 previousTargetSize];
}

id objc_msgSend_previouslyFocusedIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 previouslyFocusedIndexPath];
}

id objc_msgSend_previouslyFocusedView(void *a1, const char *a2, ...)
{
  return _[a1 previouslyFocusedView];
}

id objc_msgSend_priceType(void *a1, const char *a2, ...)
{
  return _[a1 priceType];
}

id objc_msgSend_priceTypeIsPSUB(void *a1, const char *a2, ...)
{
  return _[a1 priceTypeIsPSUB];
}

id objc_msgSend_primaryText(void *a1, const char *a2, ...)
{
  return _[a1 primaryText];
}

id objc_msgSend_primaryTextColorForDarkBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryTextColorForDarkBackground:");
}

id objc_msgSend_primaryTextColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryTextColorForTheme:");
}

id objc_msgSend_privacyAcknowledgementNeeded(void *a1, const char *a2, ...)
{
  return _[a1 privacyAcknowledgementNeeded];
}

id objc_msgSend_privatePathForDownload(void *a1, const char *a2, ...)
{
  return _[a1 privatePathForDownload];
}

id objc_msgSend_privateQueueContext(void *a1, const char *a2, ...)
{
  return _[a1 privateQueueContext];
}

id objc_msgSend_processAssertion(void *a1, const char *a2, ...)
{
  return _[a1 processAssertion];
}

id objc_msgSend_processChangeAtIndexPath_forChangeType_newIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processChangeAtIndexPath:forChangeType:newIndexPath:");
}

id objc_msgSend_processFeed_podcastUUID_requestUrl_useBackgroundFetch_needsUpdate_source_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processFeed:podcastUUID:requestUrl:useBackgroundFetch:needsUpdate:source:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processLatestPersistentHistoryTransactions(void *a1, const char *a2, ...)
{
  return _[a1 processLatestPersistentHistoryTransactions];
}

id objc_msgSend_processPendingKeyInvalidations(void *a1, const char *a2, ...)
{
  return _[a1 processPendingKeyInvalidations];
}

id objc_msgSend_processResults(void *a1, const char *a2, ...)
{
  return _[a1 processResults];
}

id objc_msgSend_processingCompletion(void *a1, const char *a2, ...)
{
  return _[a1 processingCompletion];
}

id objc_msgSend_processor(void *a1, const char *a2, ...)
{
  return _[a1 processor];
}

id objc_msgSend_processorForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processorForKey:");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_promiseWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithResult:");
}

id objc_msgSend_promptAccountAuthenticationWithDebugReason_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptAccountAuthenticationWithDebugReason:forced:");
}

id objc_msgSend_promptBeforePerformingIntentAsBufferedAirPlayForRoute_provider_queueStatus_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptBeforePerformingIntentAsBufferedAirPlayForRoute:provider:queueStatus:completion:");
}

id objc_msgSend_promptBeforePerformingRequestAsBufferedAirPlay_queueStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptBeforePerformingRequestAsBufferedAirPlay:queueStatus:");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_propertiesForMediaItem(void *a1, const char *a2, ...)
{
  return _[a1 propertiesForMediaItem];
}

id objc_msgSend_propertiesToFetchAssetURL(void *a1, const char *a2, ...)
{
  return _[a1 propertiesToFetchAssetURL];
}

id objc_msgSend_propertyDictionaryForSearchItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyDictionaryForSearchItem:");
}

id objc_msgSend_propertyKeys(void *a1, const char *a2, ...)
{
  return _[a1 propertyKeys];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertySetWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertySetWithProperties:");
}

id objc_msgSend_propertySetWithRelationships_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertySetWithRelationships:");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_proxyShouldShowDialogForReason_podcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyShouldShowDialogForReason:podcastTitle:");
}

id objc_msgSend_prunePersistentHistory(void *a1, const char *a2, ...)
{
  return _[a1 prunePersistentHistory];
}

id objc_msgSend_pubDate(void *a1, const char *a2, ...)
{
  return _[a1 pubDate];
}

id objc_msgSend_pubDateFromStoreMediaDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pubDateFromStoreMediaDictionary:");
}

id objc_msgSend_purgeExternalCookies(void *a1, const char *a2, ...)
{
  return _[a1 purgeExternalCookies];
}

id objc_msgSend_purgeSubscriptionMetadata(void *a1, const char *a2, ...)
{
  return _[a1 purgeSubscriptionMetadata];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryObserver(void *a1, const char *a2, ...)
{
  return _[a1 queryObserver];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queueCommandCustomStatusForRequestStatus_queueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueCommandCustomStatusForRequestStatus:queueType:");
}

id objc_msgSend_queueCommandStatusForRequestStatus_queueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueCommandStatusForRequestStatus:queueType:");
}

id objc_msgSend_queueSectionProperties(void *a1, const char *a2, ...)
{
  return _[a1 queueSectionProperties];
}

id objc_msgSend_queuedInvocations(void *a1, const char *a2, ...)
{
  return _[a1 queuedInvocations];
}

id objc_msgSend_quickCheckForNeedsContainerMigration(void *a1, const char *a2, ...)
{
  return _[a1 quickCheckForNeedsContainerMigration];
}

id objc_msgSend_radioGroup(void *a1, const char *a2, ...)
{
  return _[a1 radioGroup];
}

id objc_msgSend_radioGroupWithInitialValue_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radioGroupWithInitialValue:changeHandler:");
}

id objc_msgSend_radioOptionWithTitle_radioGroup_value_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radioOptionWithTitle:radioGroup:value:identifier:");
}

id objc_msgSend_radioStation(void *a1, const char *a2, ...)
{
  return _[a1 radioStation];
}

id objc_msgSend_radioStationHash(void *a1, const char *a2, ...)
{
  return _[a1 radioStationHash];
}

id objc_msgSend_radioStationName(void *a1, const char *a2, ...)
{
  return _[a1 radioStationName];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rateForPlaybackSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rateForPlaybackSpeed:");
}

id objc_msgSend_reachability(void *a1, const char *a2, ...)
{
  return _[a1 reachability];
}

id objc_msgSend_reachabilityChangedFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reachabilityChangedFrom:to:");
}

id objc_msgSend_reachabilityForInternetConnection(void *a1, const char *a2, ...)
{
  return _[a1 reachabilityForInternetConnection];
}

id objc_msgSend_readableWidth(void *a1, const char *a2, ...)
{
  return _[a1 readableWidth];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_reasonForNoInternet(void *a1, const char *a2, ...)
{
  return _[a1 reasonForNoInternet];
}

id objc_msgSend_reasonForNotPlayable(void *a1, const char *a2, ...)
{
  return _[a1 reasonForNotPlayable];
}

id objc_msgSend_reasonLabel(void *a1, const char *a2, ...)
{
  return _[a1 reasonLabel];
}

id objc_msgSend_reasonTextForNoInternet(void *a1, const char *a2, ...)
{
  return _[a1 reasonTextForNoInternet];
}

id objc_msgSend_recalculateAllPlaylists(void *a1, const char *a2, ...)
{
  return _[a1 recalculateAllPlaylists];
}

id objc_msgSend_recalculateEpisodeCounts(void *a1, const char *a2, ...)
{
  return _[a1 recalculateEpisodeCounts];
}

id objc_msgSend_recalculateUpNextForShowWithFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recalculateUpNextForShowWithFeedUrl:");
}

id objc_msgSend_receiveOn_loader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveOn:loader:");
}

id objc_msgSend_recognizerWithTarget_action_pressType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recognizerWithTarget:action:pressType:");
}

id objc_msgSend_record(void *a1, const char *a2, ...)
{
  return _[a1 record];
}

id objc_msgSend_recordEvent_dataSource_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEvent:dataSource:data:");
}

id objc_msgSend_recordEvent_dataSource_data_topic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEvent:dataSource:data:topic:");
}

id objc_msgSend_recordEvent_topic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEvent:topic:");
}

id objc_msgSend_recordMTPlayerMetricsForCurrentItemWithCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMTPlayerMetricsForCurrentItemWithCurrentTime:");
}

id objc_msgSend_recordMetrics(void *a1, const char *a2, ...)
{
  return _[a1 recordMetrics];
}

id objc_msgSend_recordMetricsEventForAccessLog_playerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetricsEventForAccessLog:playerItem:");
}

id objc_msgSend_recordMetricsEventForErrorLog_withEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetricsEventForErrorLog:withEpisode:");
}

id objc_msgSend_recordMetricsEventForType_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetricsEventForType:withData:");
}

id objc_msgSend_recordMetricsForCurrentItem(void *a1, const char *a2, ...)
{
  return _[a1 recordMetricsForCurrentItem];
}

id objc_msgSend_recordUserAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordUserAction:");
}

id objc_msgSend_recordUserAction_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordUserAction:dataSource:");
}

id objc_msgSend_recordUserAction_dataSource_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordUserAction:dataSource:withData:");
}

id objc_msgSend_recordedPlayEventsForCurrentItem(void *a1, const char *a2, ...)
{
  return _[a1 recordedPlayEventsForCurrentItem];
}

id objc_msgSend_rectForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectForRowAtIndexPath:");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_redirectURL(void *a1, const char *a2, ...)
{
  return _[a1 redirectURL];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _[a1 refresh];
}

id objc_msgSend_refreshContentsOfUpdatedOrInsertedPlaylists(void *a1, const char *a2, ...)
{
  return _[a1 refreshContentsOfUpdatedOrInsertedPlaylists];
}

id objc_msgSend_refreshControl(void *a1, const char *a2, ...)
{
  return _[a1 refreshControl];
}

id objc_msgSend_refreshControlTextColor(void *a1, const char *a2, ...)
{
  return _[a1 refreshControlTextColor];
}

id objc_msgSend_refreshDelegate(void *a1, const char *a2, ...)
{
  return _[a1 refreshDelegate];
}

id objc_msgSend_refreshObject_mergeChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshObject:mergeChanges:");
}

id objc_msgSend_refreshSettings(void *a1, const char *a2, ...)
{
  return _[a1 refreshSettings];
}

id objc_msgSend_registerAVSessionCategoryAndMode(void *a1, const char *a2, ...)
{
  return _[a1 registerAVSessionCategoryAndMode];
}

id objc_msgSend_registerActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerActions:");
}

id objc_msgSend_registerBackgroundCompletion_forSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerBackgroundCompletion:forSession:");
}

id objc_msgSend_registerCacheAtURL_ofType_urgency_requiresAppTermination_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerCacheAtURL:ofType:urgency:requiresAppTermination:withCompletion:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:");
}

id objc_msgSend_registerClass_forHeaderFooterViewReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forHeaderFooterViewReuseIdentifier:");
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:");
}

id objc_msgSend_registerCollectionViewClasses(void *a1, const char *a2, ...)
{
  return _[a1 registerCollectionViewClasses];
}

id objc_msgSend_registerDataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDataProvider:");
}

id objc_msgSend_registerDefaults(void *a1, const char *a2, ...)
{
  return _[a1 registerDefaults];
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_registerForArtworkChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForArtworkChangeNotifications];
}

id objc_msgSend_registerForArtworkChangeNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForArtworkChangeNotifications:");
}

id objc_msgSend_registerItemForTypeIdentifier_loadHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerItemForTypeIdentifier:loadHandler:");
}

id objc_msgSend_registerManifestForRestoration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerManifestForRestoration:");
}

id objc_msgSend_registerNowPlayingDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerNowPlayingDelegate:");
}

id objc_msgSend_registerSupportedQueueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSupportedQueueType:");
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return _[a1 reload];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_reloadDataSource(void *a1, const char *a2, ...)
{
  return _[a1 reloadDataSource];
}

id objc_msgSend_reloadGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadGroupWithIdentifier:");
}

id objc_msgSend_reloadHandler(void *a1, const char *a2, ...)
{
  return _[a1 reloadHandler];
}

id objc_msgSend_reloadIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 reloadIfNeeded];
}

id objc_msgSend_reloadPlaylist(void *a1, const char *a2, ...)
{
  return _[a1 reloadPlaylist];
}

id objc_msgSend_reloadRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_reloadSectionForDarkPlacardIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 reloadSectionForDarkPlacardIfNeeded];
}

id objc_msgSend_reloadSectionForEmptyOverlayIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 reloadSectionForEmptyOverlayIfNeeded];
}

id objc_msgSend_reloadSectionHeaderForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSectionHeaderForSection:");
}

id objc_msgSend_reloadSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSections:withRowAnimation:");
}

id objc_msgSend_remainingBackgroundTime(void *a1, const char *a2, ...)
{
  return _[a1 remainingBackgroundTime];
}

id objc_msgSend_remainingView(void *a1, const char *a2, ...)
{
  return _[a1 remainingView];
}

id objc_msgSend_remoteSkipBackward_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSkipBackward:");
}

id objc_msgSend_remoteSkipForward_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSkipForward:");
}

id objc_msgSend_remoteSkipPreference(void *a1, const char *a2, ...)
{
  return _[a1 remoteSkipPreference];
}

id objc_msgSend_removalAllFairPlayKeysWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removalAllFairPlayKeysWithCompletion:");
}

id objc_msgSend_remove(void *a1, const char *a2, ...)
{
  return _[a1 remove];
}

id objc_msgSend_removeAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAccount:withCompletionHandler:");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllKeyDataWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllKeyDataWithCompletion:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAnimationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAnimationForKey:");
}

id objc_msgSend_removeChangeNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChangeNotifier:");
}

id objc_msgSend_removeChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChildViewController:");
}

id objc_msgSend_removeDismissRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 removeDismissRecognizer];
}

id objc_msgSend_removeEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisode:");
}

id objc_msgSend_removeEpisode_inBulkTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisode:inBulkTransaction:");
}

id objc_msgSend_removeEpisodeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisodeAtIndex:");
}

id objc_msgSend_removeEpisodeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisodeObserver:");
}

id objc_msgSend_removeEpisodeObserverForPodcasts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisodeObserverForPodcasts:");
}

id objc_msgSend_removeEpisodesForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisodesForUuid:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromPlaybackQueueCommand(void *a1, const char *a2, ...)
{
  return _[a1 removeFromPlaybackQueueCommand];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeFromUpNext(void *a1, const char *a2, ...)
{
  return _[a1 removeFromUpNext];
}

id objc_msgSend_removeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeGestureRecognizer:");
}

id objc_msgSend_removeIndexPath_forObject_fromMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIndexPath:forObject:fromMap:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeItemWithContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemWithContentID:");
}

id objc_msgSend_removeItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItems:");
}

id objc_msgSend_removeItemsWithPrefx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemsWithPrefx:");
}

id objc_msgSend_removeKeyDataForStoreTrackID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKeyDataForStoreTrackID:");
}

id objc_msgSend_removeKeyFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKeyFor:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeMetadataForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeMetadataForPodcastUuid:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePlayedDownloadsSetting(void *a1, const char *a2, ...)
{
  return _[a1 removePlayedDownloadsSetting];
}

id objc_msgSend_removePlaylistsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePlaylistsObject:");
}

id objc_msgSend_removePodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePodcast:");
}

id objc_msgSend_removeSettingAtIndex_fromGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSettingAtIndex:fromGroupWithIdentifier:");
}

id objc_msgSend_removeSubscribeParamsForFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSubscribeParamsForFeedUrl:");
}

id objc_msgSend_removeTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTarget:");
}

id objc_msgSend_reorderCommand(void *a1, const char *a2, ...)
{
  return _[a1 reorderCommand];
}

id objc_msgSend_reorderItemWithContentId_afterItemWithContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reorderItemWithContentId:afterItemWithContentID:");
}

id objc_msgSend_reorderLocalPodcastsToMatchRemote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reorderLocalPodcastsToMatchRemote:");
}

id objc_msgSend_reorderQueueCommand(void *a1, const char *a2, ...)
{
  return _[a1 reorderQueueCommand];
}

id objc_msgSend_repeatCommand(void *a1, const char *a2, ...)
{
  return _[a1 repeatCommand];
}

id objc_msgSend_repeatType(void *a1, const char *a2, ...)
{
  return _[a1 repeatType];
}

id objc_msgSend_replaceIntent(void *a1, const char *a2, ...)
{
  return _[a1 replaceIntent];
}

id objc_msgSend_replicationPadding(void *a1, const char *a2, ...)
{
  return _[a1 replicationPadding];
}

id objc_msgSend_report(void *a1, const char *a2, ...)
{
  return _[a1 report];
}

id objc_msgSend_report_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "report:userInfo:");
}

id objc_msgSend_reportBookmarksSyncIssue_bookmarksSyncType_version_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportBookmarksSyncIssue:bookmarksSyncType:version:userInfo:");
}

id objc_msgSend_reportIfLocalAssetHasiPodLibraryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportIfLocalAssetHasiPodLibraryURL:");
}

id objc_msgSend_reportImportingRemotePodcast_withLocalPodcast_shouldAddPodcast_shouldUnsubscribeLocalPodcast_shouldUpdateSettings_mismatch_version_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "reportImportingRemotePodcast:withLocalPodcast:shouldAddPodcast:shouldUnsubscribeLocalPodcast:shouldUpdateSett ings:mismatch:version:");
}

id objc_msgSend_reportKeyIntegrityError(void *a1, const char *a2, ...)
{
  return _[a1 reportKeyIntegrityError];
}

id objc_msgSend_reportMetrics(void *a1, const char *a2, ...)
{
  return _[a1 reportMetrics];
}

id objc_msgSend_reportPlaybackFromStore_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportPlaybackFromStore:reason:");
}

id objc_msgSend_reportStatsForPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 reportStatsForPodcasts];
}

id objc_msgSend_reportStopReason_withInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportStopReason:withInitiator:");
}

id objc_msgSend_reportSubscriptionsSyncIssue_subscriptionSyncType_version_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportSubscriptionsSyncIssue:subscriptionSyncType:version:userInfo:");
}

id objc_msgSend_reportSyncAuthenticationErrorFor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportSyncAuthenticationErrorFor:error:");
}

id objc_msgSend_reportWithMarker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportWithMarker:");
}

id objc_msgSend_reportWithType_userInfo_location_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportWithType:userInfo:location:reason:");
}

id objc_msgSend_reportedItemVersionForIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 reportedItemVersionForIdentifier];
}

id objc_msgSend_reportingStringForPlayReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingStringForPlayReason:");
}

id objc_msgSend_representedBundleDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 representedBundleDisplayName];
}

id objc_msgSend_representedElementKind(void *a1, const char *a2, ...)
{
  return _[a1 representedElementKind];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_request_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request:");
}

id objc_msgSend_requestError(void *a1, const char *a2, ...)
{
  return _[a1 requestError];
}

id objc_msgSend_requestIdentifierForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestIdentifierForPlayerItem:");
}

id objc_msgSend_requestIdentifiersForManifest_queueStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestIdentifiersForManifest:queueStatus:");
}

id objc_msgSend_requestImageWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImageWithCompletionHandler:");
}

id objc_msgSend_requestMediaLibraryReadTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestMediaLibraryReadTransaction:");
}

id objc_msgSend_requestMediaLibraryWriteTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestMediaLibraryWriteTransaction:");
}

id objc_msgSend_requestMediaLibraryWriteTransaction_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestMediaLibraryWriteTransaction:completion:");
}

id objc_msgSend_requestParams(void *a1, const char *a2, ...)
{
  return _[a1 requestParams];
}

id objc_msgSend_requestResponseController(void *a1, const char *a2, ...)
{
  return _[a1 requestResponseController];
}

id objc_msgSend_requestSecureDeletionOf_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSecureDeletionOf:completionHandler:");
}

id objc_msgSend_requestStatusForMediaRemoteStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestStatusForMediaRemoteStatus:");
}

id objc_msgSend_requestWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithContext:");
}

id objc_msgSend_requestWithParams_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithParams:callback:");
}

id objc_msgSend_requesterDsid(void *a1, const char *a2, ...)
{
  return _[a1 requesterDsid];
}

id objc_msgSend_requestsAreNonAppInitiated(void *a1, const char *a2, ...)
{
  return _[a1 requestsAreNonAppInitiated];
}

id objc_msgSend_requiresMigration(void *a1, const char *a2, ...)
{
  return _[a1 requiresMigration];
}

id objc_msgSend_requiresStartDelayToAvoidClampErrors(void *a1, const char *a2, ...)
{
  return _[a1 requiresStartDelayToAvoidClampErrors];
}

id objc_msgSend_rescheduleTransactionWithFinishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rescheduleTransactionWithFinishedBlock:");
}

id objc_msgSend_rescheduleTransactionWithNewVersion_key_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rescheduleTransactionWithNewVersion:key:finishedBlock:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetAcceptedCredentials(void *a1, const char *a2, ...)
{
  return _[a1 resetAcceptedCredentials];
}

id objc_msgSend_resetAccountIdentifierForLastSync(void *a1, const char *a2, ...)
{
  return _[a1 resetAccountIdentifierForLastSync];
}

id objc_msgSend_resetAllSubscriptionSyncVersion(void *a1, const char *a2, ...)
{
  return _[a1 resetAllSubscriptionSyncVersion];
}

id objc_msgSend_resetBookmarksSync(void *a1, const char *a2, ...)
{
  return _[a1 resetBookmarksSync];
}

id objc_msgSend_resetCache(void *a1, const char *a2, ...)
{
  return _[a1 resetCache];
}

id objc_msgSend_resetCommand(void *a1, const char *a2, ...)
{
  return _[a1 resetCommand];
}

id objc_msgSend_resetForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetForSyncType:");
}

id objc_msgSend_resetGoDarkWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetGoDarkWithReason:");
}

id objc_msgSend_resetIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 resetIfNeeded];
}

id objc_msgSend_resetInterestSync(void *a1, const char *a2, ...)
{
  return _[a1 resetInterestSync];
}

id objc_msgSend_resetKeychainItem(void *a1, const char *a2, ...)
{
  return _[a1 resetKeychainItem];
}

id objc_msgSend_resetMetadataToInitialState(void *a1, const char *a2, ...)
{
  return _[a1 resetMetadataToInitialState];
}

id objc_msgSend_resetNonFollowedShowsSync(void *a1, const char *a2, ...)
{
  return _[a1 resetNonFollowedShowsSync];
}

id objc_msgSend_resetPlaylistSyncVersion(void *a1, const char *a2, ...)
{
  return _[a1 resetPlaylistSyncVersion];
}

id objc_msgSend_resetSubscriptionsLastSyncTimestampFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetSubscriptionsLastSyncTimestampFor:");
}

id objc_msgSend_resetSubscriptionsSyncVersionFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetSubscriptionsSyncVersionFor:");
}

id objc_msgSend_resetToInitialState(void *a1, const char *a2, ...)
{
  return _[a1 resetToInitialState];
}

id objc_msgSend_resetToInitialStateForced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetToInitialStateForced:");
}

id objc_msgSend_resetToInitialStateIfIncomplete(void *a1, const char *a2, ...)
{
  return _[a1 resetToInitialStateIfIncomplete];
}

id objc_msgSend_resetToInitialStateIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 resetToInitialStateIfNeeded];
}

id objc_msgSend_resetUppLastSyncTimeAndDomainVersion(void *a1, const char *a2, ...)
{
  return _[a1 resetUppLastSyncTimeAndDomainVersion];
}

id objc_msgSend_resetVersionForAllFeedUrls(void *a1, const char *a2, ...)
{
  return _[a1 resetVersionForAllFeedUrls];
}

id objc_msgSend_resetVersionForFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetVersionForFeedUrl:");
}

id objc_msgSend_resetableImportContext(void *a1, const char *a2, ...)
{
  return _[a1 resetableImportContext];
}

id objc_msgSend_resettingToInitialState(void *a1, const char *a2, ...)
{
  return _[a1 resettingToInitialState];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_resizableImageWithCapInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizableImageWithCapInsets:");
}

id objc_msgSend_resizedArtworkURLString_withDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizedArtworkURLString:withDimension:");
}

id objc_msgSend_resolveActivePlayerPathWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveActivePlayerPathWithCompletion:");
}

id objc_msgSend_resolveAvailabilityDate(void *a1, const char *a2, ...)
{
  return _[a1 resolveAvailabilityDate];
}

id objc_msgSend_resolveError_transaction_resolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveError:transaction:resolution:");
}

id objc_msgSend_resolveWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveWithCompletion:");
}

id objc_msgSend_resolvedColor(void *a1, const char *a2, ...)
{
  return _[a1 resolvedColor];
}

id objc_msgSend_resolvedEnclosureUrl(void *a1, const char *a2, ...)
{
  return _[a1 resolvedEnclosureUrl];
}

id objc_msgSend_resolvedFeedURL(void *a1, const char *a2, ...)
{
  return _[a1 resolvedFeedURL];
}

id objc_msgSend_resolvedSyncClass(void *a1, const char *a2, ...)
{
  return _[a1 resolvedSyncClass];
}

id objc_msgSend_resolvedSyncController(void *a1, const char *a2, ...)
{
  return _[a1 resolvedSyncController];
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 resourceSpecifier];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_responseDomainVersion(void *a1, const char *a2, ...)
{
  return _[a1 responseDomainVersion];
}

id objc_msgSend_responseItem(void *a1, const char *a2, ...)
{
  return _[a1 responseItem];
}

id objc_msgSend_responseTrackList(void *a1, const char *a2, ...)
{
  return _[a1 responseTrackList];
}

id objc_msgSend_responseTypeForTransaction_withData_forKey_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseTypeForTransaction:withData:forKey:mismatch:");
}

id objc_msgSend_restorationCompletions(void *a1, const char *a2, ...)
{
  return _[a1 restorationCompletions];
}

id objc_msgSend_restorationQueue(void *a1, const char *a2, ...)
{
  return _[a1 restorationQueue];
}

id objc_msgSend_restoreActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreActivity:completion:");
}

id objc_msgSend_restoreBackgroundDownloadTasksWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreBackgroundDownloadTasksWithCompletion:");
}

id objc_msgSend_restoreFromUserActivity_startPlayback_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreFromUserActivity:startPlayback:reason:interactive:completion:");
}

id objc_msgSend_restoreFromUserActivity_withManifest_startPlayback_reason_interactive_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreFromUserActivity:withManifest:startPlayback:reason:interactive:completion:");
}

id objc_msgSend_restorePlayerManifestWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restorePlayerManifestWithCompletion:");
}

id objc_msgSend_restoreSelection(void *a1, const char *a2, ...)
{
  return _[a1 restoreSelection];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _[a1 result];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_results_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "results:");
}

id objc_msgSend_resultsAreFrozen(void *a1, const char *a2, ...)
{
  return _[a1 resultsAreFrozen];
}

id objc_msgSend_resultsChangedWithDeletedIds_insertIds_updatedIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultsChangedWithDeletedIds:insertIds:updatedIds:");
}

id objc_msgSend_resultsController(void *a1, const char *a2, ...)
{
  return _[a1 resultsController];
}

id objc_msgSend_resultsControllerWithSort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultsControllerWithSort:");
}

id objc_msgSend_resumeAnimating(void *a1, const char *a2, ...)
{
  return _[a1 resumeAnimating];
}

id objc_msgSend_resyncWhenDone(void *a1, const char *a2, ...)
{
  return _[a1 resyncWhenDone];
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return _[a1 retainArguments];
}

id objc_msgSend_retrieveArtwork_withSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveArtwork:withSize:");
}

id objc_msgSend_retrieveArtwork_withSize_atTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveArtwork:withSize:atTime:");
}

id objc_msgSend_retrySeconds(void *a1, const char *a2, ...)
{
  return _[a1 retrySeconds];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 reuseIdentifier];
}

id objc_msgSend_reuseIdentifierForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reuseIdentifierForItemAtIndexPath:");
}

id objc_msgSend_reuseIdentifierForRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reuseIdentifierForRow:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rewind(void *a1, const char *a2, ...)
{
  return _[a1 rewind];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_rightNavController(void *a1, const char *a2, ...)
{
  return _[a1 rightNavController];
}

id objc_msgSend_rightViewControllerTopMargin(void *a1, const char *a2, ...)
{
  return _[a1 rightViewControllerTopMargin];
}

id objc_msgSend_rollbackIfNecessaryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rollbackIfNecessaryWithCompletion:");
}

id objc_msgSend_rollbackMigrationV40IfNeededInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rollbackMigrationV40IfNeededInContext:");
}

id objc_msgSend_rootNavController(void *a1, const char *a2, ...)
{
  return _[a1 rootNavController];
}

id objc_msgSend_rootNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 rootNavigationController];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_route(void *a1, const char *a2, ...)
{
  return _[a1 route];
}

id objc_msgSend_routeName(void *a1, const char *a2, ...)
{
  return _[a1 routeName];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rowAnimation(void *a1, const char *a2, ...)
{
  return _[a1 rowAnimation];
}

id objc_msgSend_rowHeight(void *a1, const char *a2, ...)
{
  return _[a1 rowHeight];
}

id objc_msgSend_runCoreDataMigration(void *a1, const char *a2, ...)
{
  return _[a1 runCoreDataMigration];
}

id objc_msgSend_runDataMigration(void *a1, const char *a2, ...)
{
  return _[a1 runDataMigration];
}

id objc_msgSend_runImageFormatMigration(void *a1, const char *a2, ...)
{
  return _[a1 runImageFormatMigration];
}

id objc_msgSend_runImageStoreMigration(void *a1, const char *a2, ...)
{
  return _[a1 runImageStoreMigration];
}

id objc_msgSend_runImageStorePathMigration(void *a1, const char *a2, ...)
{
  return _[a1 runImageStorePathMigration];
}

id objc_msgSend_runMigrationForPodcast_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMigrationForPodcast:version:");
}

id objc_msgSend_runMigrationOnAllEpisodesForVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMigrationOnAllEpisodesForVersion:");
}

id objc_msgSend_runMigrationOnEpisodesByPodcastForVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMigrationOnEpisodesByPodcastForVersion:");
}

id objc_msgSend_runQueryInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runQueryInContext:");
}

id objc_msgSend_runQueryWithPodcastPredicate_episodePredicate_channelPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runQueryWithPodcastPredicate:episodePredicate:channelPredicate:");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return _[a1 save];
}

id objc_msgSend_saveController(void *a1, const char *a2, ...)
{
  return _[a1 saveController];
}

id objc_msgSend_saveDelegate(void *a1, const char *a2, ...)
{
  return _[a1 saveDelegate];
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return _[a1 saveInCurrentBlock];
}

id objc_msgSend_saveNewPlaylists(void *a1, const char *a2, ...)
{
  return _[a1 saveNewPlaylists];
}

id objc_msgSend_saveSubscriptionMetadata(void *a1, const char *a2, ...)
{
  return _[a1 saveSubscriptionMetadata];
}

id objc_msgSend_saveToUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 saveToUserDefaults];
}

id objc_msgSend_saved(void *a1, const char *a2, ...)
{
  return _[a1 saved];
}

id objc_msgSend_savedSections(void *a1, const char *a2, ...)
{
  return _[a1 savedSections];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scalesBackwards(void *a1, const char *a2, ...)
{
  return _[a1 scalesBackwards];
}

id objc_msgSend_scanWithRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanWithRate:");
}

id objc_msgSend_scanning(void *a1, const char *a2, ...)
{
  return _[a1 scanning];
}

id objc_msgSend_schedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedule:");
}

id objc_msgSend_schedule_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedule:completion:");
}

id objc_msgSend_scheduleDefaultDeferralDeadline(void *a1, const char *a2, ...)
{
  return _[a1 scheduleDefaultDeferralDeadline];
}

id objc_msgSend_scheduleEpisodeStateGetWithFeedUrls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleEpisodeStateGetWithFeedUrls:");
}

id objc_msgSend_scheduleEpisodeStatePutWithFeedUrls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleEpisodeStatePutWithFeedUrls:");
}

id objc_msgSend_scheduleGetTransactionWithKeys_processor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleGetTransactionWithKeys:processor:");
}

id objc_msgSend_scheduleSetTransactionWithKeys_processor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleSetTransactionWithKeys:processor:");
}

id objc_msgSend_scheduleStoreURLRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleStoreURLRequest:");
}

id objc_msgSend_scheduleTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTransaction:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_scoreFromModifiedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoreFromModifiedDate:");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_scrollRate(void *a1, const char *a2, ...)
{
  return _[a1 scrollRate];
}

id objc_msgSend_scrollRectToVisible_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollRectToVisible:animated:");
}

id objc_msgSend_scrollToLatestIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToLatestIfNeeded:");
}

id objc_msgSend_scrollToRowAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_scrubbing(void *a1, const char *a2, ...)
{
  return _[a1 scrubbing];
}

id objc_msgSend_searchUrlForSearchText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchUrlForSearchText:");
}

id objc_msgSend_seasonNumber(void *a1, const char *a2, ...)
{
  return _[a1 seasonNumber];
}

id objc_msgSend_seasonNumbers(void *a1, const char *a2, ...)
{
  return _[a1 seasonNumbers];
}

id objc_msgSend_seasonSortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return _[a1 seasonSortDescriptorsForSortOrder];
}

id objc_msgSend_seasonTrailerInSeason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonTrailerInSeason:");
}

id objc_msgSend_secItemFormatToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secItemFormatToDictionary:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_secondaryText(void *a1, const char *a2, ...)
{
  return _[a1 secondaryText];
}

id objc_msgSend_secondaryTextColorForDarkBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryTextColorForDarkBackground:");
}

id objc_msgSend_secondaryTextColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryTextColorForTheme:");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionAtIndex:");
}

id objc_msgSend_sectionDidChangeContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionDidChangeContent:");
}

id objc_msgSend_sectionFooterFloatingDisabled(void *a1, const char *a2, ...)
{
  return _[a1 sectionFooterFloatingDisabled];
}

id objc_msgSend_sectionFooterFont(void *a1, const char *a2, ...)
{
  return _[a1 sectionFooterFont];
}

id objc_msgSend_sectionForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionForIndex:");
}

id objc_msgSend_sectionForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionForType:");
}

id objc_msgSend_sectionHeaderIndexPathForItemIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionHeaderIndexPathForItemIndexPath:");
}

id objc_msgSend_sectionHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 sectionHeaderView];
}

id objc_msgSend_sectionHeaderViewForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionHeaderViewForIndexPath:");
}

id objc_msgSend_sectionIndexForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionIndexForType:");
}

id objc_msgSend_sectionNameKeyPath(void *a1, const char *a2, ...)
{
  return _[a1 sectionNameKeyPath];
}

id objc_msgSend_sectionType(void *a1, const char *a2, ...)
{
  return _[a1 sectionType];
}

id objc_msgSend_sectionTypeForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionTypeForIndex:");
}

id objc_msgSend_sectionWillChangeContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWillChangeContent:");
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _[a1 sections];
}

id objc_msgSend_secureDownloadRenewalManager(void *a1, const char *a2, ...)
{
  return _[a1 secureDownloadRenewalManager];
}

id objc_msgSend_secureKeyLoader(void *a1, const char *a2, ...)
{
  return _[a1 secureKeyLoader];
}

id objc_msgSend_seekCommand(void *a1, const char *a2, ...)
{
  return _[a1 seekCommand];
}

id objc_msgSend_segmentsDownloadedDuration(void *a1, const char *a2, ...)
{
  return _[a1 segmentsDownloadedDuration];
}

id objc_msgSend_selectAppearancePathIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 selectAppearancePathIfNecessary];
}

id objc_msgSend_selectFeaturedTab(void *a1, const char *a2, ...)
{
  return _[a1 selectFeaturedTab];
}

id objc_msgSend_selectItemAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectItemWithUuid_forceScroll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectItemWithUuid:forceScroll:");
}

id objc_msgSend_selectMediaOption_inMediaSelectionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectMediaOption:inMediaSelectionGroup:");
}

id objc_msgSend_selectMediaOptionAutomaticallyInMediaSelectionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectMediaOptionAutomaticallyInMediaSelectionGroup:");
}

id objc_msgSend_selectRoute_operation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectRoute:operation:completion:");
}

id objc_msgSend_selectRowAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectSearchTabAndFocusSearchField(void *a1, const char *a2, ...)
{
  return _[a1 selectSearchTabAndFocusSearchField];
}

id objc_msgSend_selectedBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 selectedBackgroundColor];
}

id objc_msgSend_selectedBackgroundColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedBackgroundColorForTheme:");
}

id objc_msgSend_selectedIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedIndex];
}

id objc_msgSend_selectedIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 selectedIndexPath];
}

id objc_msgSend_selectedMediaOptionInMediaSelectionGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedMediaOptionInMediaSelectionGroup:");
}

id objc_msgSend_selectedTab(void *a1, const char *a2, ...)
{
  return _[a1 selectedTab];
}

id objc_msgSend_selectedUuid(void *a1, const char *a2, ...)
{
  return _[a1 selectedUuid];
}

id objc_msgSend_selectorForRefreshControl(void *a1, const char *a2, ...)
{
  return _[a1 selectorForRefreshControl];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return _[a1 semanticContentAttribute];
}

id objc_msgSend_sendCommand_toDestination_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:toDestination:withOptions:completion:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendPlaybackQueue_toDestination_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPlaybackQueue:toDestination:withOptions:completion:");
}

id objc_msgSend_sendStopRequestForStreamingLicenseIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 sendStopRequestForStreamingLicenseIfNecessary];
}

id objc_msgSend_sendSubviewToBack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSubviewToBack:");
}

id objc_msgSend_sentNotification(void *a1, const char *a2, ...)
{
  return _[a1 sentNotification];
}

id objc_msgSend_separator(void *a1, const char *a2, ...)
{
  return _[a1 separator];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 separatorColor];
}

id objc_msgSend_separatorColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorColorForTheme:");
}

id objc_msgSend_separatorInset(void *a1, const char *a2, ...)
{
  return _[a1 separatorInset];
}

id objc_msgSend_separatorInsets(void *a1, const char *a2, ...)
{
  return _[a1 separatorInsets];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _[a1 serialQueue];
}

id objc_msgSend_serializer(void *a1, const char *a2, ...)
{
  return _[a1 serializer];
}

id objc_msgSend_serpentIdFromAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serpentIdFromAdamId:");
}

id objc_msgSend_serverAddress(void *a1, const char *a2, ...)
{
  return _[a1 serverAddress];
}

id objc_msgSend_serverClampErrorWithTransaction_retrySeconds_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverClampErrorWithTransaction:retrySeconds:underlyingError:");
}

id objc_msgSend_serverResponse(void *a1, const char *a2, ...)
{
  return _[a1 serverResponse];
}

id objc_msgSend_serverRevisionNewerThanClientKeys(void *a1, const char *a2, ...)
{
  return _[a1 serverRevisionNewerThanClientKeys];
}

id objc_msgSend_sessionCompletionHandler(void *a1, const char *a2, ...)
{
  return _[a1 sessionCompletionHandler];
}

id objc_msgSend_sessionDelegate(void *a1, const char *a2, ...)
{
  return _[a1 sessionDelegate];
}

id objc_msgSend_sessionForBackgroundDownloads(void *a1, const char *a2, ...)
{
  return _[a1 sessionForBackgroundDownloads];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sessionIdentifier];
}

id objc_msgSend_sessionIdentifierDidChange(void *a1, const char *a2, ...)
{
  return _[a1 sessionIdentifierDidChange];
}

id objc_msgSend_sessionIdentifierOverride(void *a1, const char *a2, ...)
{
  return _[a1 sessionIdentifierOverride];
}

id objc_msgSend_sessionTaskStateReloaded(void *a1, const char *a2, ...)
{
  return _[a1 sessionTaskStateReloaded];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAVPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAVPlayer:");
}

id objc_msgSend_setAccessLogEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessLogEvent:");
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setAccountAgreedTermsVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountAgreedTermsVersion:");
}

id objc_msgSend_setAccountIdentifierForLastSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountIdentifierForLastSync:");
}

id objc_msgSend_setAccountOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountOverride:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionBlock:");
}

id objc_msgSend_setActionButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionButtons:");
}

id objc_msgSend_setActionController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionController:");
}

id objc_msgSend_setActionObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionObject:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActiveAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveAccount:");
}

id objc_msgSend_setActiveNotificationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveNotificationName:");
}

id objc_msgSend_setActiveRoute_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveRoute:completion:");
}

id objc_msgSend_setActivityIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityIndicator:");
}

id objc_msgSend_setAddPodcastsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddPodcastsViewController:");
}

id objc_msgSend_setAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdded:");
}

id objc_msgSend_setAddedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddedDate:");
}

id objc_msgSend_setAddedPlaylists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddedPlaylists:");
}

id objc_msgSend_setAddedSubscriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddedSubscriptions:");
}

id objc_msgSend_setAdjustContentOffsetForRefreshControlAsNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustContentOffsetForRefreshControlAsNeeded:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAdjustsImageWhenAncestorFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageWhenAncestorFocused:");
}

id objc_msgSend_setAdjustsImageWhenDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageWhenDisabled:");
}

id objc_msgSend_setAdjustsImageWhenHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageWhenHighlighted:");
}

id objc_msgSend_setAirPlayedContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirPlayedContent:");
}

id objc_msgSend_setAlbum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlbum:");
}

id objc_msgSend_setAlertController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlertController:");
}

id objc_msgSend_setAllPodcastsSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllPodcastsSelected:");
}

id objc_msgSend_setAllPropertyChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllPropertyChangeObserver:");
}

id objc_msgSend_setAllowDefaultMenuButtonBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowDefaultMenuButtonBehavior:");
}

id objc_msgSend_setAllowKeyForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowKeyForValue:");
}

id objc_msgSend_setAllowServerDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowServerDialogs:");
}

id objc_msgSend_setAllowedItemIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedItemIdentifiers:");
}

id objc_msgSend_setAllowedPressTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedPressTypes:");
}

id objc_msgSend_setAllowedTouchTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedTouchTypes:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAllowsGroupBlending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupBlending:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAllowsNonContiguousLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsNonContiguousLayout:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlphaOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlphaOffset:");
}

id objc_msgSend_setAlwaysBounceHorizontal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceHorizontal:");
}

id objc_msgSend_setAlwaysFocusable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysFocusable:");
}

id objc_msgSend_setAnalyticsChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalyticsChannel:");
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchorPoint:");
}

id objc_msgSend_setAnimating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimating:");
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationDuration:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setAppController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppController:");
}

id objc_msgSend_setArgument_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArgument:atIndex:");
}

id objc_msgSend_setArrayValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArrayValue:");
}

id objc_msgSend_setArtist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtist:");
}

id objc_msgSend_setArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtwork:");
}

id objc_msgSend_setArtworkBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkBackgroundColor:");
}

id objc_msgSend_setArtworkHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkHeight:");
}

id objc_msgSend_setArtworkKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkKey:");
}

id objc_msgSend_setArtworkPrimaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkPrimaryColor:");
}

id objc_msgSend_setArtworkProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkProvider:");
}

id objc_msgSend_setArtworkRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkRequests:");
}

id objc_msgSend_setArtworkTemplateURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTemplateURL:");
}

id objc_msgSend_setArtworkTextPrimaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTextPrimaryColor:");
}

id objc_msgSend_setArtworkTextQuaternaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTextQuaternaryColor:");
}

id objc_msgSend_setArtworkTextSecondaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTextSecondaryColor:");
}

id objc_msgSend_setArtworkTextTertiaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTextTertiaryColor:");
}

id objc_msgSend_setArtworkUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkUrl:");
}

id objc_msgSend_setArtworkView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkView:");
}

id objc_msgSend_setArtworkWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkWidth:");
}

id objc_msgSend_setAssetStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetStatus:");
}

id objc_msgSend_setAssetURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetURL:");
}

id objc_msgSend_setAssetUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetUrl:");
}

id objc_msgSend_setAttributedStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedStrings:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAttributedTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedTitle:");
}

id objc_msgSend_setAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudio:");
}

id objc_msgSend_setAuthenticatedDark_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticatedDark:");
}

id objc_msgSend_setAuthenticationNeededTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationNeededTimestamp:");
}

id objc_msgSend_setAuthenticationRequest(void *a1, const char *a2, ...)
{
  return _[a1 setAuthenticationRequest];
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setAuthor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthor:");
}

id objc_msgSend_setAutoDownloadEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoDownloadEnabled:");
}

id objc_msgSend_setAutoDownloadType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoDownloadType:");
}

id objc_msgSend_setAutoResumePlaybackQueueAndStartPlayback_playerController_forceLocal_reason_interactive_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "setAutoResumePlaybackQueueAndStartPlayback:playerController:forceLocal:reason:interactive:completion:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutorefreshRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutorefreshRate:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAuxilaryActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuxilaryActions:");
}

id objc_msgSend_setAvPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvPlayer:");
}

id objc_msgSend_setAvailableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailableActions:");
}

id objc_msgSend_setAvoidenceEnabled_forSectionHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvoidenceEnabled:forSectionHeaderView:");
}

id objc_msgSend_setAvoiding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvoiding:");
}

id objc_msgSend_setBackCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackCatalog:");
}

id objc_msgSend_setBackOffUntil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackOffUntil:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:forState:");
}

id objc_msgSend_setBackgroundImage_forToolbarPosition_barMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:forToolbarPosition:barMetrics:");
}

id objc_msgSend_setBackgroundTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundTask:");
}

id objc_msgSend_setBackgroundTaskAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundTaskAssertion:");
}

id objc_msgSend_setBackgroundTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundTaskIdentifier:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBadgeValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeValue:");
}

id objc_msgSend_setBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBag:");
}

id objc_msgSend_setBagContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagContext:");
}

id objc_msgSend_setBagLookupEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagLookupEndTime:");
}

id objc_msgSend_setBagLookupStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagLookupStartTime:");
}

id objc_msgSend_setBagLookupTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagLookupTask:");
}

id objc_msgSend_setBagSpecifiedPollingInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagSpecifiedPollingInterval:");
}

id objc_msgSend_setBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarButtonItem:");
}

id objc_msgSend_setBarsStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarsStyle:");
}

id objc_msgSend_setBaseURLForGETAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseURLForGETAll:");
}

id objc_msgSend_setBaseURLForPUTAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseURLForPUTAll:");
}

id objc_msgSend_setBaselineAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaselineAdjustment:");
}

id objc_msgSend_setBlendColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlendColor:");
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlock:");
}

id objc_msgSend_setBlurEffectStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlurEffectStyle:");
}

id objc_msgSend_setBlurRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlurRadius:");
}

id objc_msgSend_setBlurredArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlurredArtwork:");
}

id objc_msgSend_setBookmarkTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBookmarkTime:");
}

id objc_msgSend_setBookmarksSyncVersion_syncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBookmarksSyncVersion:syncType:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounceStyle:");
}

id objc_msgSend_setBounces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounces:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setBufferedTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBufferedTimeRange:");
}

id objc_msgSend_setButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButton:");
}

id objc_msgSend_setButtonBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonBlock:");
}

id objc_msgSend_setButtonCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonCallback:");
}

id objc_msgSend_setButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonItem:");
}

id objc_msgSend_setButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonTitle:");
}

id objc_msgSend_setButtonTitle_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonTitle:target:action:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByteSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByteSize:");
}

id objc_msgSend_setCachedExpandedRowSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedExpandedRowSize:");
}

id objc_msgSend_setCachedSizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedSizeThatFits:");
}

id objc_msgSend_setCachedTextRectForBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedTextRectForBounds:");
}

id objc_msgSend_setCanDeletePlaylistUUIDBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanDeletePlaylistUUIDBlock:");
}

id objc_msgSend_setCanRequestStoreSignIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanRequestStoreSignIn:");
}

id objc_msgSend_setCancelType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelType:");
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanceled:");
}

id objc_msgSend_setCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategories:");
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:");
}

id objc_msgSend_setCausalityObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCausalityObserver:");
}

id objc_msgSend_setCell_enabled_withDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCell:enabled:withDescription:");
}

id objc_msgSend_setCellFor_specialPathBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellFor_specialPathBlock:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setChangeGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeGenerator:");
}

id objc_msgSend_setChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeHandler:");
}

id objc_msgSend_setChangeIsUserDriven_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeIsUserDriven:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setChannelPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannelPredicate:");
}

id objc_msgSend_setChannelResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannelResults:");
}

id objc_msgSend_setChannelStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannelStoreId:");
}

id objc_msgSend_setChapterMetadataMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChapterMetadataMode:");
}

id objc_msgSend_setChapters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChapters:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCleanedTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCleanedTitle:");
}

id objc_msgSend_setClearButtonMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClearButtonMode:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCloudSyncBugReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncBugReporter:");
}

id objc_msgSend_setCloudSyncController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncController:");
}

id objc_msgSend_setCloudSyncIsDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncIsDirty:");
}

id objc_msgSend_setCloudSyncVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncVersion:");
}

id objc_msgSend_setCollectionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionIdentifier:");
}

id objc_msgSend_setColorTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTheme:");
}

id objc_msgSend_setColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColors:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCompletions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletions:");
}

id objc_msgSend_setCompositeManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositeManifest:");
}

id objc_msgSend_setCompositeResultsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositeResultsController:");
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositingFilter:");
}

id objc_msgSend_setConditionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConditionBlock:");
}

id objc_msgSend_setConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfig:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConsecutiveFeedFetchErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConsecutiveFeedFetchErrors:");
}

id objc_msgSend_setContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainer:");
}

id objc_msgSend_setContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerIdentifier:");
}

id objc_msgSend_setContainerOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerOrder:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentMotionRotation_translation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMotionRotation:translation:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setContentOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOpaque:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContentVerticalAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentVerticalAlignment:");
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContents:");
}

id objc_msgSend_setContentsCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsCenter:");
}

id objc_msgSend_setContentsRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsRect:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setControlState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlState:animated:");
}

id objc_msgSend_setControlState_withAnimationCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlState:withAnimationCoordinator:");
}

id objc_msgSend_setController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setController:");
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerCurve:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCorrupt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCorrupt:");
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCount:");
}

id objc_msgSend_setCounterForGeneratingLibraryChangeNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCounterForGeneratingLibraryChangeNotifications:");
}

id objc_msgSend_setCurrentActiveUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentActiveUser:");
}

id objc_msgSend_setCurrentActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentActivity:");
}

id objc_msgSend_setCurrentDeserializer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentDeserializer:");
}

id objc_msgSend_setCurrentEpisodeDownloaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentEpisodeDownloaded:");
}

id objc_msgSend_setCurrentIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentIndex:");
}

id objc_msgSend_setCurrentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentItem:");
}

id objc_msgSend_setCurrentKVSTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentKVSTransaction:");
}

id objc_msgSend_setCurrentManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentManifest:");
}

id objc_msgSend_setCurrentMediaItemInitialLoadingComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentMediaItemInitialLoadingComplete:");
}

id objc_msgSend_setCurrentMediaItemPresentationSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentMediaItemPresentationSize:");
}

id objc_msgSend_setCurrentPlaybackSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPlaybackSessionIdentifier:");
}

id objc_msgSend_setCurrentPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPlayerItem:");
}

id objc_msgSend_setCurrentPodcastFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPodcastFeedURL:");
}

id objc_msgSend_setCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTime:");
}

id objc_msgSend_setCurrentTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTransaction:");
}

id objc_msgSend_setCustomHeaderHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomHeaderHeight:");
}

id objc_msgSend_setDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDSID:");
}

id objc_msgSend_setDSIDCheckTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 setDSIDCheckTimestamp];
}

id objc_msgSend_setDark_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDark:");
}

id objc_msgSend_setDarkCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDarkCount:");
}

id objc_msgSend_setDarkCountLocal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDarkCountLocal:");
}

id objc_msgSend_setDarkReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDarkReason:");
}

id objc_msgSend_setDataAccessQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataAccessQueue:");
}

id objc_msgSend_setDataDetectorTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataDetectorTypes:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDataSourceTransactionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSourceTransactionContext:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDateToFireNextTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateToFireNextTimer:");
}

id objc_msgSend_setDebugReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugReason:");
}

id objc_msgSend_setDefaultInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultInstance:");
}

id objc_msgSend_setDefaultMetricsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultMetricsController:");
}

id objc_msgSend_setDefaultSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultSettings:");
}

id objc_msgSend_setDefaultsNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultsNotifier:");
}

id objc_msgSend_setDefaultsObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultsObserver:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeleteButtonBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteButtonBlock:");
}

id objc_msgSend_setDeletePlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeletePlayedEpisodes:");
}

id objc_msgSend_setDeleteStationAlertController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteStationAlertController:");
}

id objc_msgSend_setDeletedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeletedEpisodes:");
}

id objc_msgSend_setDerivedPropertyValue_forKey_forPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDerivedPropertyValue:forKey:forPodcast:");
}

id objc_msgSend_setDescriptionFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDescriptionFont:");
}

id objc_msgSend_setDescriptionText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDescriptionText:");
}

id objc_msgSend_setDescriptionTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDescriptionTextColor:");
}

id objc_msgSend_setDescriptionTextHighlightColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDescriptionTextHighlightColor:");
}

id objc_msgSend_setDestinationScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationScale:");
}

id objc_msgSend_setDestructive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestructive:");
}

id objc_msgSend_setDeviceAgreedTermsVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceAgreedTermsVersion:");
}

id objc_msgSend_setDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDictionary:");
}

id objc_msgSend_setDidBecomeActiveWhileMigrating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidBecomeActiveWhileMigrating:");
}

id objc_msgSend_setDidSelect_specialPathBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidSelect_specialPathBlock:");
}

id objc_msgSend_setDim_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDim:");
}

id objc_msgSend_setDisablePlaybackStateValidation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisablePlaybackStateValidation:");
}

id objc_msgSend_setDisabledReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabledReason:");
}

id objc_msgSend_setDisplayType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayType:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setDownButtonRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownButtonRecognizer:");
}

id objc_msgSend_setDownloadBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadBehavior:");
}

id objc_msgSend_setDownloadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadIdentifier:");
}

id objc_msgSend_setDownloaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloaded:");
}

id objc_msgSend_setDownloadedCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadedCount:");
}

id objc_msgSend_setDownloadsSettingsGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadsSettingsGroup:");
}

id objc_msgSend_setDryRun_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDryRun:");
}

id objc_msgSend_setDsidCheckTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDsidCheckTimestamp:");
}

id objc_msgSend_setDummyTrackCreatedButNotInList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDummyTrackCreatedButNotInList:");
}

id objc_msgSend_setDummyTrackList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDummyTrackList:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setDurationSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDurationSnapshot:");
}

id objc_msgSend_setEarliestEpisodeAvailabilityDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEarliestEpisodeAvailabilityDate:");
}

id objc_msgSend_setEdgesForExtendedLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdgesForExtendedLayout:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:");
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:animated:");
}

id objc_msgSend_setEditingStyleFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditingStyleFlags:");
}

id objc_msgSend_setEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffect:");
}

id objc_msgSend_setElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTime:");
}

id objc_msgSend_setElapsedTime_playbackRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTime:playbackRate:");
}

id objc_msgSend_setElapsedTimeJumpInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTimeJumpInProgress:");
}

id objc_msgSend_setEligibleForHandoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForHandoff:");
}

id objc_msgSend_setEligibleForPublicIndexing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForPublicIndexing:");
}

id objc_msgSend_setEligibleForSearch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForSearch:");
}

id objc_msgSend_setEmptyContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmptyContentViewController:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnclosureURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnclosureURL:");
}

id objc_msgSend_setEndAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndAction:");
}

id objc_msgSend_setEndedEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndedEpisodeUuids:");
}

id objc_msgSend_setEndpointRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointRoute:");
}

id objc_msgSend_setEnqueuedByAnotherUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnqueuedByAnotherUser:");
}

id objc_msgSend_setEntitledDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledDuration:");
}

id objc_msgSend_setEntitledEnclosureURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledEnclosureURL:");
}

id objc_msgSend_setEntitledPriceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledPriceType:");
}

id objc_msgSend_setEntitledTranscriptIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledTranscriptIdentifier:");
}

id objc_msgSend_setEntitledTranscriptProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledTranscriptProvider:");
}

id objc_msgSend_setEntitledTranscriptSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledTranscriptSnippet:");
}

id objc_msgSend_setEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntity:");
}

id objc_msgSend_setEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisode:");
}

id objc_msgSend_setEpisodeAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeAdamID:");
}

id objc_msgSend_setEpisodeAdamIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeAdamIds:");
}

id objc_msgSend_setEpisodeCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeCount:");
}

id objc_msgSend_setEpisodeGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeGUID:");
}

id objc_msgSend_setEpisodeGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeGuid:");
}

id objc_msgSend_setEpisodeLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeLevel:");
}

id objc_msgSend_setEpisodeLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeLimit:");
}

id objc_msgSend_setEpisodeList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeList:");
}

id objc_msgSend_setEpisodeNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeNumber:");
}

id objc_msgSend_setEpisodeObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeObservers:");
}

id objc_msgSend_setEpisodeOrderSettingsGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeOrderSettingsGroup:");
}

id objc_msgSend_setEpisodePredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodePredicate:");
}

id objc_msgSend_setEpisodeResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeResults:");
}

id objc_msgSend_setEpisodeSerpentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeSerpentID:");
}

id objc_msgSend_setEpisodeShareUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeShareUrl:");
}

id objc_msgSend_setEpisodeSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeSortDescriptors:");
}

id objc_msgSend_setEpisodeStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeStoreId:");
}

id objc_msgSend_setEpisodeTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeTitle:");
}

id objc_msgSend_setEpisodeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeType:");
}

id objc_msgSend_setEpisodeUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeUUID:");
}

id objc_msgSend_setEpisodeUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeUUIDs:");
}

id objc_msgSend_setEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeUuid:");
}

id objc_msgSend_setEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeUuids:");
}

id objc_msgSend_setEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodes:");
}

id objc_msgSend_setEpisodesToKeepSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodesToKeepSetting:");
}

id objc_msgSend_setEpisodesToShow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodesToShow:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorCode:");
}

id objc_msgSend_setErrorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorDomain:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventType:");
}

id objc_msgSend_setExcludeUnentitled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludeUnentitled:");
}

id objc_msgSend_setExclusionPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExclusionPaths:");
}

id objc_msgSend_setExpanded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpanded:");
}

id objc_msgSend_setExpirationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationBlock:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExplicit:");
}

id objc_msgSend_setExplicitSortOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExplicitSortOrder:");
}

id objc_msgSend_setExplicitTreatment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExplicitTreatment:");
}

id objc_msgSend_setExportableSessionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportableSessionTypes:");
}

id objc_msgSend_setExtendedInterfaceCreator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtendedInterfaceCreator:");
}

id objc_msgSend_setExtendedLanguageTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtendedLanguageTag:");
}

id objc_msgSend_setExternalFeedDownloader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExternalFeedDownloader:");
}

id objc_msgSend_setExternalMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExternalMetadata:");
}

id objc_msgSend_setExternalType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExternalType:");
}

id objc_msgSend_setFadeHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFadeHeight:");
}

id objc_msgSend_setFairPlayInvalidationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFairPlayInvalidationManager:");
}

id objc_msgSend_setFairPlayKeyLoader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFairPlayKeyLoader:");
}

id objc_msgSend_setFairPlayKeySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFairPlayKeySession:");
}

id objc_msgSend_setFairPlayMigrationBackgroundTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFairPlayMigrationBackgroundTask:");
}

id objc_msgSend_setFastScrollTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFastScrollTimer:");
}

id objc_msgSend_setFatalSyncError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFatalSyncError:");
}

id objc_msgSend_setFeedChangedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedChangedDate:");
}

id objc_msgSend_setFeedDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedDeleted:");
}

id objc_msgSend_setFeedProcessingQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedProcessingQueue:");
}

id objc_msgSend_setFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedURL:");
}

id objc_msgSend_setFeedUpdateNeedsRetry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedUpdateNeedsRetry:");
}

id objc_msgSend_setFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedUrl:");
}

id objc_msgSend_setFetchBatchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchBatchSize:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFetchOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchOffset:");
}

id objc_msgSend_setFetchPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchPredicate:");
}

id objc_msgSend_setFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRequest:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFilteringDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilteringDisabled:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFinishedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinishedHandler:");
}

id objc_msgSend_setFirstItemIsRestricted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstItemIsRestricted:");
}

id objc_msgSend_setFirstTimeAvailableAsFree_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstTimeAvailableAsFree:");
}

id objc_msgSend_setFirstTimeAvailableAsPaid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstTimeAvailableAsPaid:");
}

id objc_msgSend_setFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFittingSize:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setFloat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFloat:forKey:");
}

id objc_msgSend_setFloating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFloating:");
}

id objc_msgSend_setFloatingContentDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFloatingContentDelegate:");
}

id objc_msgSend_setFocusedSizeIncrease_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFocusedSizeIncrease:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFooterCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterCallback:");
}

id objc_msgSend_setFooterText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterText:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFrc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrc:");
}

id objc_msgSend_setFrcState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrcState:");
}

id objc_msgSend_setFreeDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeDuration:");
}

id objc_msgSend_setFreeEnclosureURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeEnclosureURL:");
}

id objc_msgSend_setFreePriceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreePriceType:");
}

id objc_msgSend_setFreeTranscriptIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeTranscriptIdentifier:");
}

id objc_msgSend_setFreeTranscriptProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeTranscriptProvider:");
}

id objc_msgSend_setFreeTranscriptSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeTranscriptSnippet:");
}

id objc_msgSend_setGeneratedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeneratedDate:");
}

id objc_msgSend_setGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGenerator:");
}

id objc_msgSend_setGlobalCellularEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlobalCellularEnabled:");
}

id objc_msgSend_setGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroup:");
}

id objc_msgSend_setGroupFooter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupFooter:");
}

id objc_msgSend_setGroupSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupSettings:");
}

id objc_msgSend_setGroupTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupTitle:");
}

id objc_msgSend_setGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroups:");
}

id objc_msgSend_setGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuid:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHasBeenPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenPlayed:");
}

id objc_msgSend_setHasBeenRemovedFromParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenRemovedFromParentViewController:");
}

id objc_msgSend_setHasBeenSynced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenSynced:");
}

id objc_msgSend_setHasFRCChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasFRCChanges:");
}

id objc_msgSend_setHasFetchedInitialAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasFetchedInitialAccount:");
}

id objc_msgSend_setHasReportedThisEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasReportedThisEpisode:");
}

id objc_msgSend_setHasResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasResults:");
}

id objc_msgSend_setHeaderAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderAction:");
}

id objc_msgSend_setHeaderCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderCallback:");
}

id objc_msgSend_setHeaderTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderTitle:");
}

id objc_msgSend_setHeightForSpecialPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeightForSpecialPath:");
}

id objc_msgSend_setHeightTracksTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeightTracksTextView:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHiddenTextField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHiddenTextField:");
}

id objc_msgSend_setHighlightBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightBackgroundColor:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setITunesMatchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setITunesMatchEnabled:");
}

id objc_msgSend_setIconImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconImageView:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentifiersForLastEndedPlaybackItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifiersForLastEndedPlaybackItem:");
}

id objc_msgSend_setIgnoreServerTrustEvaluation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreServerTrustEvaluation:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:forState:");
}

id objc_msgSend_setImageKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageKey:");
}

id objc_msgSend_setImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageURL:");
}

id objc_msgSend_setImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageView:");
}

id objc_msgSend_setImportDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImportDate:");
}

id objc_msgSend_setImportSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImportSource:");
}

id objc_msgSend_setImporting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImporting:");
}

id objc_msgSend_setIncludesAllPodcasts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludesAllPodcasts:");
}

id objc_msgSend_setIndex_forCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndex:forCount:");
}

id objc_msgSend_setIndexPathForAvoidingSectionHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexPathForAvoidingSectionHeader:");
}

id objc_msgSend_setIndexPathShifter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexPathShifter:");
}

id objc_msgSend_setIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorStyle:");
}

id objc_msgSend_setInitialEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialEpisodeUuid:");
}

id objc_msgSend_setInitialIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialIndex:");
}

id objc_msgSend_setInitialIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialIndexPath:");
}

id objc_msgSend_setInitialPlayheadPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialPlayheadPosition:");
}

id objc_msgSend_setInitialSubscribedPodcastsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialSubscribedPodcastsCount:");
}

id objc_msgSend_setInitiatedByAnotherUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitiatedByAnotherUser:");
}

id objc_msgSend_setInsetsContentViewsToSafeArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsetsContentViewsToSafeArea:");
}

id objc_msgSend_setInstanceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstanceIdentifier:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setInterLevelSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterLevelSpacing:");
}

id objc_msgSend_setInteractive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractive:");
}

id objc_msgSend_setInterest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterest:");
}

id objc_msgSend_setInterruptEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptEvent:");
}

id objc_msgSend_setInvalidationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationManager:");
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsActive:");
}

id objc_msgSend_setIsBookmarked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBookmarked:");
}

id objc_msgSend_setIsBookmarksMigrationRecoveredEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBookmarksMigrationRecoveredEpisode:");
}

id objc_msgSend_setIsBuiltIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBuiltIn:");
}

id objc_msgSend_setIsComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsComplete:");
}

id objc_msgSend_setIsDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDirty:");
}

id objc_msgSend_setIsExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsExplicit:");
}

id objc_msgSend_setIsFolder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFolder:");
}

id objc_msgSend_setIsFromITunesSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFromITunesSync:");
}

id objc_msgSend_setIsGenius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsGenius:");
}

id objc_msgSend_setIsHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsHidden:");
}

id objc_msgSend_setIsHiddenOrImplicitlyFollowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsHiddenOrImplicitlyFollowed:");
}

id objc_msgSend_setIsIdleScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsIdleScreen:");
}

id objc_msgSend_setIsInitialPrepare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInitialPrepare:");
}

id objc_msgSend_setIsItunesU_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsItunesU:");
}

id objc_msgSend_setIsLive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLive:");
}

id objc_msgSend_setIsLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLoaded:");
}

id objc_msgSend_setIsManifestRestorationOngoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsManifestRestorationOngoing:");
}

id objc_msgSend_setIsMigrating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsMigrating:");
}

id objc_msgSend_setIsMissingAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsMissingAsset:");
}

id objc_msgSend_setIsMusicPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsMusicPlaylist:");
}

id objc_msgSend_setIsNew_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsNew:");
}

id objc_msgSend_setIsNotSubscribeable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsNotSubscribeable:");
}

id objc_msgSend_setIsObserving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsObserving:");
}

id objc_msgSend_setIsOnTheGo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsOnTheGo:");
}

id objc_msgSend_setIsPlaylistSyncDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPlaylistSyncDirty:");
}

id objc_msgSend_setIsRadioPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRadioPlayback:");
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRunning:");
}

id objc_msgSend_setIsSerialPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSerialPodcast:");
}

id objc_msgSend_setIsSleepingOnStartDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSleepingOnStartDelay:");
}

id objc_msgSend_setIsSmart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSmart:");
}

id objc_msgSend_setIsStopped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsStopped:");
}

id objc_msgSend_setIsStopping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsStopping:");
}

id objc_msgSend_setIsUngroupedList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUngroupedList:");
}

id objc_msgSend_setIsVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsVideo:");
}

id objc_msgSend_setIsVideoPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsVideoPlayback:");
}

id objc_msgSend_setItemDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemDescription:");
}

id objc_msgSend_setItemDescriptionHasHTML_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemDescriptionHasHTML:");
}

id objc_msgSend_setItemDescriptionWithoutHTML_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemDescriptionWithoutHTML:");
}

id objc_msgSend_setItemError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemError:");
}

id objc_msgSend_setItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemIdentifier:");
}

id objc_msgSend_setItemKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemKind:");
}

id objc_msgSend_setItemProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemProperties:");
}

id objc_msgSend_setItemSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemSize:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setItunesSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItunesSubtitle:");
}

id objc_msgSend_setItunesTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItunesTitle:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyPath:");
}

id objc_msgSend_setKeyStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyStorage:");
}

id objc_msgSend_setKeyTimes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyTimes:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setKeychainData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeychainData:");
}

id objc_msgSend_setKvsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKvsController:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLastAppUseDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastAppUseDate:");
}

id objc_msgSend_setLastBookmarkedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastBookmarkedDate:");
}

id objc_msgSend_setLastBookmarksSyncTimestamp_syncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastBookmarksSyncTimestamp:syncType:");
}

id objc_msgSend_setLastDatePlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastDatePlayed:");
}

id objc_msgSend_setLastFetchedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastFetchedDate:");
}

id objc_msgSend_setLastFocusedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastFocusedIndexPath:");
}

id objc_msgSend_setLastLaunchFromDatabase(void *a1, const char *a2, ...)
{
  return _[a1 setLastLaunchFromDatabase];
}

id objc_msgSend_setLastPlaybackPositionSaveTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPlaybackPositionSaveTime:");
}

id objc_msgSend_setLastPlaybackSaveTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPlaybackSaveTime:");
}

id objc_msgSend_setLastPlayedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPlayedDate:");
}

id objc_msgSend_setLastPlayingItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPlayingItem:");
}

id objc_msgSend_setLastRecordedItemURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastRecordedItemURL:");
}

id objc_msgSend_setLastRemovedFromUpNextDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastRemovedFromUpNextDate:");
}

id objc_msgSend_setLastStoreEpisodesInfoCheckDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastStoreEpisodesInfoCheckDate:");
}

id objc_msgSend_setLastStorePodcastInfoCheckDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastStorePodcastInfoCheckDate:");
}

id objc_msgSend_setLastSyncTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastSyncTimestamp:");
}

id objc_msgSend_setLastUnfollowedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUnfollowedDate:");
}

id objc_msgSend_setLastUserMarkedAsPlayedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUserMarkedAsPlayedDate:");
}

id objc_msgSend_setLatestEpisodeAvailabilityDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestEpisodeAvailabilityDate:");
}

id objc_msgSend_setLatestEpisodeAvailabilityTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestEpisodeAvailabilityTime:");
}

id objc_msgSend_setLatestPersistentHistoryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestPersistentHistoryToken:");
}

id objc_msgSend_setLatestUPPSubtask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestUPPSubtask:");
}

id objc_msgSend_setLaunchOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchOptions:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setLayoutMarginsFollowReadableWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMarginsFollowReadableWidth:");
}

id objc_msgSend_setLeftNavController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftNavController:");
}

id objc_msgSend_setLeftView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftView:");
}

id objc_msgSend_setLeftViewMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftViewMode:");
}

id objc_msgSend_setLevelCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevelCornerRadius:");
}

id objc_msgSend_setLevelWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevelWidth:");
}

id objc_msgSend_setLibraryDataVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLibraryDataVersion:");
}

id objc_msgSend_setLibraryImageStoreType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLibraryImageStoreType:");
}

id objc_msgSend_setLimitReadAhead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLimitReadAhead:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineFragmentPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineFragmentPadding:");
}

id objc_msgSend_setListState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListState:");
}

id objc_msgSend_setListenNowEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListenNowEpisode:");
}

id objc_msgSend_setListenNowQueryObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListenNowQueryObserver:");
}

id objc_msgSend_setLoadQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadQueue:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLongPressRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongPressRecognizer:");
}

id objc_msgSend_setLongTitles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongTitles:");
}

id objc_msgSend_setMagicMomentPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMagicMomentPlayerItem:");
}

id objc_msgSend_setMainBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMainBlock:");
}

id objc_msgSend_setManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:");
}

id objc_msgSend_setManifest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:completion:");
}

id objc_msgSend_setManifest_startPlayback_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:startPlayback:context:completion:");
}

id objc_msgSend_setManifest_startPlayback_forceLocal_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:startPlayback:forceLocal:context:completion:");
}

id objc_msgSend_setManifest_startPlayback_forceLocal_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:startPlayback:forceLocal:reason:interactive:completion:");
}

id objc_msgSend_setManifest_startPlayback_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:startPlayback:reason:interactive:completion:");
}

id objc_msgSend_setManifestAsDryRun_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifestAsDryRun:reason:completion:");
}

id objc_msgSend_setManifestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifestIdentifier:");
}

id objc_msgSend_setManifestIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifestIndex:");
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMask:");
}

id objc_msgSend_setMaskView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaskView:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaxTitleWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxTitleWidth:");
}

id objc_msgSend_setMaxWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxWidth:");
}

id objc_msgSend_setMaximumFractionDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumFractionDigits:");
}

id objc_msgSend_setMaximumLevelHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumLevelHeight:");
}

id objc_msgSend_setMaximumNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumNumberOfLines:");
}

id objc_msgSend_setMaximumPrimaryColumnWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumPrimaryColumnWidth:");
}

id objc_msgSend_setMediaItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaItemDictionary:");
}

id objc_msgSend_setMediaItemIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaItemIndexes:");
}

id objc_msgSend_setMediaItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaItems:");
}

id objc_msgSend_setMediaLibraryId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaLibraryId:");
}

id objc_msgSend_setMediaRemoteController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaRemoteController:");
}

id objc_msgSend_setMediaSelectionCriteria_forMediaCharacteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaSelectionCriteria:forMediaCharacteristic:");
}

id objc_msgSend_setMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaType:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMessageLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageLabel:");
}

id objc_msgSend_setMetadataCommandCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataCommandCenter:");
}

id objc_msgSend_setMetadataFirstSyncEligible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataFirstSyncEligible:");
}

id objc_msgSend_setMetadataIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataIdentifier:");
}

id objc_msgSend_setMetadataInfoCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataInfoCenter:");
}

id objc_msgSend_setMetadataItemsFromDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataItemsFromDataSource:");
}

id objc_msgSend_setMetadataItemsFromKVSStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataItemsFromKVSStorage:");
}

id objc_msgSend_setMetadataItemsToCommitToDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataItemsToCommitToDataSource:");
}

id objc_msgSend_setMetadataItemsToCommitToKVSStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataItemsToCommitToKVSStorage:");
}

id objc_msgSend_setMetadataTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataTimestamp:");
}

id objc_msgSend_setMetricDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricDataSource:");
}

id objc_msgSend_setMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetrics:");
}

id objc_msgSend_setMetricsPlayStartPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsPlayStartPosition:");
}

id objc_msgSend_setMetricsPlayStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsPlayStartTime:");
}

id objc_msgSend_setMigrationToDeltaFeedUpdatesComplete(void *a1, const char *a2, ...)
{
  return _[a1 setMigrationToDeltaFeedUpdatesComplete];
}

id objc_msgSend_setMinimumBackgroundFetchInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumBackgroundFetchInterval:");
}

id objc_msgSend_setMinimumInteritemSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumInteritemSpacing:");
}

id objc_msgSend_setMinimumLevelHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumLevelHeight:");
}

id objc_msgSend_setMinimumLineSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumLineSpacing:");
}

id objc_msgSend_setMinimumPrimaryColumnWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumPrimaryColumnWidth:");
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumScaleFactor:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModifiedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiedDate:");
}

id objc_msgSend_setModifiedDateScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiedDateScore:");
}

id objc_msgSend_setMultipleSelectionBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultipleSelectionBackgroundView:");
}

id objc_msgSend_setMusicBarsStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMusicBarsStyle:");
}

id objc_msgSend_setMusicRepeatType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMusicRepeatType:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNaturalRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNaturalRect:");
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNavigationBarHidden:");
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNavigationController:");
}

id objc_msgSend_setNeedsArtworkUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsArtworkUpdate:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsFocusUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsFocusUpdate];
}

id objc_msgSend_setNeedsFrozenCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsFrozenCheck:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsReloadForSignificantRequestChange(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsReloadForSignificantRequestChange];
}

id objc_msgSend_setNeedsSyncing(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsSyncing];
}

id objc_msgSend_setNeedsUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsUpdate:");
}

id objc_msgSend_setNetworkStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkStatus:");
}

id objc_msgSend_setNetworkUPPEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkUPPEnabled:");
}

id objc_msgSend_setNetworkingBlocked(void *a1, const char *a2, ...)
{
  return _[a1 setNetworkingBlocked];
}

id objc_msgSend_setNetworkingBlockedUntil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkingBlockedUntil:");
}

id objc_msgSend_setNextEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextEpisodeUuid:");
}

id objc_msgSend_setNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotifications:");
}

id objc_msgSend_setNowPlayingWallPaper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNowPlayingWallPaper:");
}

id objc_msgSend_setNumMetadataItemsFromDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumMetadataItemsFromDataSource:");
}

id objc_msgSend_setNumMetadataItemsFromKVSStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumMetadataItemsFromKVSStorage:");
}

id objc_msgSend_setNumMetadataItemsToCommitToDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumMetadataItemsToCommitToDataSource:");
}

id objc_msgSend_setNumMetadataItemsToCommitToKVSStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumMetadataItemsToCommitToKVSStorage:");
}

id objc_msgSend_setNumberOfColumns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfColumns:");
}

id objc_msgSend_setNumberOfLevels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLevels:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfResults:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setNumberValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberValue:");
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObjects:");
}

id objc_msgSend_setObserver(void *a1, const char *a2, ...)
{
  return _[a1 setObserver];
}

id objc_msgSend_setOfferTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOfferTypes:");
}

id objc_msgSend_setOldPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOldPlaybackState:");
}

id objc_msgSend_setOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOn:");
}

id objc_msgSend_setOn_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOn:animated:");
}

id objc_msgSend_setOnOffLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnOffLabel:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOpen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpen:");
}

id objc_msgSend_setOpen_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpen:animated:");
}

id objc_msgSend_setOperationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperationType:");
}

id objc_msgSend_setOptionSelectedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptionSelectedBlock:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrder:");
}

id objc_msgSend_setOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrigin:");
}

id objc_msgSend_setOriginalPodcastFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalPodcastFeedURL:");
}

id objc_msgSend_setOriginalTabBarDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalTabBarDelegate:");
}

id objc_msgSend_setOverscanCompensation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverscanCompensation:");
}

id objc_msgSend_setPageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPageType:");
}

id objc_msgSend_setParagraphSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParagraphSpacing:");
}

id objc_msgSend_setParagraphSpacingBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParagraphSpacingBefore:");
}

id objc_msgSend_setParentMediaLibraryId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentMediaLibraryId:");
}

id objc_msgSend_setPartiallyOffTheTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPartiallyOffTheTop:");
}

id objc_msgSend_setPassthroughViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassthroughViews:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPendingDeserializations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingDeserializations:");
}

id objc_msgSend_setPendingElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingElapsedTime:");
}

id objc_msgSend_setPendingElapsedTimeChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingElapsedTimeChange:");
}

id objc_msgSend_setPendingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingRequest:");
}

id objc_msgSend_setPendingUserDefaultArchivedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingUserDefaultArchivedData:");
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermittedArrowDirections:");
}

id objc_msgSend_setPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentID:");
}

id objc_msgSend_setPersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentId:");
}

id objc_msgSend_setPersistentIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentIds:");
}

id objc_msgSend_setPersonalizeRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonalizeRequests:");
}

id objc_msgSend_setPidToUuidMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPidToUuidMapping:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPlaceholderDetailViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholderDetailViewController:");
}

id objc_msgSend_setPlayButtonRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayButtonRecognizer:");
}

id objc_msgSend_setPlayButtonRecognizerForHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayButtonRecognizerForHeader:");
}

id objc_msgSend_setPlayCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayCount:");
}

id objc_msgSend_setPlayReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayReason:");
}

id objc_msgSend_setPlayState_manually_forUserActionOnEpisode_saveChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayState:manually:forUserActionOnEpisode:saveChanges:");
}

id objc_msgSend_setPlayState_manually_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayState:manually:source:");
}

id objc_msgSend_setPlayStateManuallySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayStateManuallySet:");
}

id objc_msgSend_setPlayable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayable:");
}

id objc_msgSend_setPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayback:");
}

id objc_msgSend_setPlaybackDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackDestination:");
}

id objc_msgSend_setPlaybackOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackOrder:");
}

id objc_msgSend_setPlaybackPositionController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackPositionController:");
}

id objc_msgSend_setPlaybackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackQueue:");
}

id objc_msgSend_setPlaybackQueueCommand(void *a1, const char *a2, ...)
{
  return _[a1 setPlaybackQueueCommand];
}

id objc_msgSend_setPlaybackQueueController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackQueueController:");
}

id objc_msgSend_setPlaybackQueueDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackQueueDataSource:");
}

id objc_msgSend_setPlaybackQueueForRequest_playerController_siriAssetInfo_enqueuer_savePlayHistory_startPlayback_forceLocal_isMagicMoment_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "setPlaybackQueueForRequest:playerController:siriAssetInfo:enqueuer:savePlayHistory:startPlayback:forceLocal:i sMagicMoment:completion:");
}

id objc_msgSend_setPlaybackSessionCommand(void *a1, const char *a2, ...)
{
  return _[a1 setPlaybackSessionCommand];
}

id objc_msgSend_setPlaybackSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackSpeed:");
}

id objc_msgSend_setPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackState:");
}

id objc_msgSend_setPlaybackViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackViewController:");
}

id objc_msgSend_setPlayed_manually_forUserActionOnEpisode_saveChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayed:manually:forUserActionOnEpisode:saveChanges:");
}

id objc_msgSend_setPlayed_manually_forUserActionOnEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayed:manually:forUserActionOnEpisodeUuid:");
}

id objc_msgSend_setPlayed_manually_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayed:manually:source:");
}

id objc_msgSend_setPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:");
}

id objc_msgSend_setPlayerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerController:");
}

id objc_msgSend_setPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerItem:");
}

id objc_msgSend_setPlayerItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerItems:");
}

id objc_msgSend_setPlayerItemsNeedLoading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerItemsNeedLoading:");
}

id objc_msgSend_setPlayerManifestRestored_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerManifestRestored:");
}

id objc_msgSend_setPlayerPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerPath:");
}

id objc_msgSend_setPlayerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerResponse:");
}

id objc_msgSend_setPlayerRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerRoute:");
}

id objc_msgSend_setPlayhead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayhead:");
}

id objc_msgSend_setPlayingItemProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayingItemProperties:");
}

id objc_msgSend_setPlayingUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayingUuid:");
}

id objc_msgSend_setPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylist:");
}

id objc_msgSend_setPlaylistName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylistName:");
}

id objc_msgSend_setPlaylistPropertiesObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylistPropertiesObserver:");
}

id objc_msgSend_setPlaylistSyncDirtyFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylistSyncDirtyFlag:");
}

id objc_msgSend_setPlaylistSyncVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylistSyncVersion:");
}

id objc_msgSend_setPlaylistUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylistUuid:");
}

id objc_msgSend_setPlusButtonImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlusButtonImageView:");
}

id objc_msgSend_setPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcast:");
}

id objc_msgSend_setPodcastActionController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastActionController:");
}

id objc_msgSend_setPodcastAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastAdamID:");
}

id objc_msgSend_setPodcastAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastAdamId:");
}

id objc_msgSend_setPodcastFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastFeedUrl:");
}

id objc_msgSend_setPodcastHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastHeaderView:");
}

id objc_msgSend_setPodcastInfoViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastInfoViewController:");
}

id objc_msgSend_setPodcastPersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastPersistentId:");
}

id objc_msgSend_setPodcastPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastPredicate:");
}

id objc_msgSend_setPodcastResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastResults:");
}

id objc_msgSend_setPodcastSettingsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastSettingsViewController:");
}

id objc_msgSend_setPodcastSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastSortDescriptors:");
}

id objc_msgSend_setPodcastState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastState:");
}

id objc_msgSend_setPodcastStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastStoreId:");
}

id objc_msgSend_setPodcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastTitle:");
}

id objc_msgSend_setPodcastUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastUUID:");
}

id objc_msgSend_setPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastUuid:");
}

id objc_msgSend_setPodcastUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastUuids:");
}

id objc_msgSend_setPodcasts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcasts:");
}

id objc_msgSend_setPodcastsDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastsDomainVersion:");
}

id objc_msgSend_setPodcastsObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastsObserver:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setPreferredIntervals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredIntervals:");
}

id objc_msgSend_setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredMaxLayoutWidth:");
}

id objc_msgSend_setPreferredSubtitleLanguageCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredSubtitleLanguageCode:");
}

id objc_msgSend_setPresentationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationType:");
}

id objc_msgSend_setPresentingButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingButton:");
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:");
}

id objc_msgSend_setPreviousBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousBounds:");
}

id objc_msgSend_setPreviousNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousNumberOfLines:");
}

id objc_msgSend_setPreviousPlayingEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousPlayingEpisodeUuid:");
}

id objc_msgSend_setPreviousTargetSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousTargetSize:");
}

id objc_msgSend_setPriceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriceType:");
}

id objc_msgSend_setPriceTypeChangedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriceTypeChangedDate:");
}

id objc_msgSend_setPrimaryCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryCategory:");
}

id objc_msgSend_setPrimaryText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryText:");
}

id objc_msgSend_setPrimitiveValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimitiveValue:forKey:");
}

id objc_msgSend_setProcessAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessAssertion:");
}

id objc_msgSend_setProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessor:");
}

id objc_msgSend_setProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfile:");
}

id objc_msgSend_setPromptTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptTitle:");
}

id objc_msgSend_setPropertiesFromPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesFromPodcast:");
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToFetch:");
}

id objc_msgSend_setPropertiesToUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToUpdate:");
}

id objc_msgSend_setPropertyKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertyKeys:");
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvider:");
}

id objc_msgSend_setPubDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPubDate:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setQueryObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryObserver:");
}

id objc_msgSend_setQueueItemProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueueItemProperties:");
}

id objc_msgSend_setQueuePriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueuePriority:");
}

id objc_msgSend_setQueueSectionProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueueSectionProperties:");
}

id objc_msgSend_setQueuedInvocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueuedInvocations:");
}

id objc_msgSend_setRadioGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRadioGroup:");
}

id objc_msgSend_setRadioStation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRadioStation:");
}

id objc_msgSend_setRadioStationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRadioStationName:");
}

id objc_msgSend_setReachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReachable:");
}

id objc_msgSend_setRecorded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecorded:");
}

id objc_msgSend_setRecordedPlayEventsForCurrentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordedPlayEventsForCurrentItem:");
}

id objc_msgSend_setRefreshControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshControl:");
}

id objc_msgSend_setRefreshing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshing:");
}

id objc_msgSend_setRelationshipKeyPathsForPrefetching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelationshipKeyPathsForPrefetching:");
}

id objc_msgSend_setRemembersLastFocusedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemembersLastFocusedIndexPath:");
}

id objc_msgSend_setRemotePlaybackQueue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemotePlaybackQueue:completion:");
}

id objc_msgSend_setRemoteViewService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteViewService:");
}

id objc_msgSend_setRemovePlayedDownloadsSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovePlayedDownloadsSetting:");
}

id objc_msgSend_setRemovePlayedDownloadsSetting_forPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovePlayedDownloadsSetting:forPodcastUuid:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setRepeatCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepeatCount:");
}

id objc_msgSend_setRepeatType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepeatType:");
}

id objc_msgSend_setReportMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportMetrics:");
}

id objc_msgSend_setReportedItemVersionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportedItemVersionForIdentifier:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequestParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestParams:");
}

id objc_msgSend_setRequestResponseController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestResponseController:");
}

id objc_msgSend_setResettingToInitialState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResettingToInitialState:");
}

id objc_msgSend_setResolvingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResolvingError:");
}

id objc_msgSend_setResponseDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseDomainVersion:");
}

id objc_msgSend_setResponseItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseItem:");
}

id objc_msgSend_setRestorationCompletions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestorationCompletions:");
}

id objc_msgSend_setRestorationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestorationIdentifier:");
}

id objc_msgSend_setRestorationQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestorationQueue:");
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResult:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setResyncWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResyncWhenDone:");
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsDistinctResults:");
}

id objc_msgSend_setReturnsObjectsAsFaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsObjectsAsFaults:");
}

id objc_msgSend_setRightNavController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightNavController:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRoutePickerButtonStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoutePickerButtonStyle:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRunning:");
}

id objc_msgSend_setSaveDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSaveDelegate:");
}

id objc_msgSend_setSaved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSaved:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setScrollsToTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollsToTop:");
}

id objc_msgSend_setSeasonNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeasonNumber:");
}

id objc_msgSend_setSecondaryText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryText:");
}

id objc_msgSend_setSectionInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionInset:");
}

id objc_msgSend_setSectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionType:");
}

id objc_msgSend_setSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSections:");
}

id objc_msgSend_setSecureDownloadRenewalManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecureDownloadRenewalManager:");
}

id objc_msgSend_setSecureKeyLoader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecureKeyLoader:");
}

id objc_msgSend_setSelectable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectable:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSelected_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:animated:");
}

id objc_msgSend_setSelectedBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedBackgroundView:");
}

id objc_msgSend_setSelectedIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedIndex:");
}

id objc_msgSend_setSelectedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedIndexPath:");
}

id objc_msgSend_setSelectedTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedTab:");
}

id objc_msgSend_setSelectedUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedUuid:");
}

id objc_msgSend_setSelectionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionHandler:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSelectionTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionTintColor:");
}

id objc_msgSend_setSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelector:");
}

id objc_msgSend_setSentNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSentNotification:");
}

id objc_msgSend_setSeparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparator:");
}

id objc_msgSend_setSeparatorColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorColor:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setSerialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSerialQueue:");
}

id objc_msgSend_setSerpentIdMigrationComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSerpentIdMigrationComplete:");
}

id objc_msgSend_setServerRevisionNewerThanClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerRevisionNewerThanClient:");
}

id objc_msgSend_setSessionCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionCompletionHandler:");
}

id objc_msgSend_setSessionDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionDelegate:");
}

id objc_msgSend_setSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionIdentifier:");
}

id objc_msgSend_setSessionTaskStateReloaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionTaskStateReloaded:");
}

id objc_msgSend_setSettingsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettingsController:");
}

id objc_msgSend_setSettingsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettingsHandler:");
}

id objc_msgSend_setSettingsNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettingsNavigationController:");
}

id objc_msgSend_setSetupHelper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetupHelper:");
}

id objc_msgSend_setShadowBlur_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowBlur:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowExpansion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowExpansion:");
}

id objc_msgSend_setShadowImage_forToolbarPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowImage:forToolbarPosition:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowPath:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShadowVerticalOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowVerticalOffset:");
}

id objc_msgSend_setShiftedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShiftedIndexPath:");
}

id objc_msgSend_setShortTitles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortTitles:");
}

id objc_msgSend_setShouldAuthenticate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAuthenticate:");
}

id objc_msgSend_setShouldFindSomethingToPlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldFindSomethingToPlay:");
}

id objc_msgSend_setShouldIgnoreDNU_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIgnoreDNU:");
}

id objc_msgSend_setShouldShowNowPlaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowNowPlaying:");
}

id objc_msgSend_setShouldSuppressUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSuppressUserInfo:");
}

id objc_msgSend_setShowAnimatedBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowAnimatedBackground:");
}

id objc_msgSend_setShowListShowsAllShows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowListShowsAllShows:");
}

id objc_msgSend_setShowOnlyRssContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowOnlyRssContent:");
}

id objc_msgSend_setShowPlacardForRemovePlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowPlacardForRemovePlayedEpisodes:");
}

id objc_msgSend_setShowPlacardForSavedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowPlacardForSavedEpisodes:");
}

id objc_msgSend_setShowPlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowPlayedEpisodes:");
}

id objc_msgSend_setShowSettingsGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowSettingsGroup:");
}

id objc_msgSend_setShowSpecificUpsellCopy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowSpecificUpsellCopy:");
}

id objc_msgSend_setShowTypeInFeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowTypeInFeed:");
}

id objc_msgSend_setShowTypeRadioGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowTypeRadioGroup:");
}

id objc_msgSend_setShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowTypeSetting:");
}

id objc_msgSend_setShowingDefaultImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowingDefaultImage:");
}

id objc_msgSend_setShowsArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsArtwork:");
}

id objc_msgSend_setShowsDescriptionButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsDescriptionButton:");
}

id objc_msgSend_setShowsExplicitIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsExplicitIcon:");
}

id objc_msgSend_setShowsFooterTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsFooterTextView:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsPlayState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsPlayState:");
}

id objc_msgSend_setShowsPubDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsPubDate:");
}

id objc_msgSend_setShowsSeparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsSeparator:");
}

id objc_msgSend_setShowsSeperator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsSeperator:");
}

id objc_msgSend_setShowsTitleWhileLoading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsTitleWhileLoading:");
}

id objc_msgSend_setShowsTouchWhenHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsTouchWhenHighlighted:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setShuffleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShuffleType:");
}

id objc_msgSend_setSideView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSideView:");
}

id objc_msgSend_setSinceDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSinceDomainVersion:");
}

id objc_msgSend_setSingleGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSingleGroup:");
}

id objc_msgSend_setSiriAnalyticsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriAnalyticsController:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSortAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortAscending:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setSortOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortOrder:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRect:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSpecialPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecialPath:");
}

id objc_msgSend_setSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeed:");
}

id objc_msgSend_setSpinner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpinner:");
}

id objc_msgSend_setStartDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartDelay:");
}

id objc_msgSend_setStartPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartPlayback:");
}

id objc_msgSend_setStartedEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartedEpisodeUuids:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStation:");
}

id objc_msgSend_setStationActionController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStationActionController:");
}

id objc_msgSend_setStationSettingsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStationSettingsViewController:");
}

id objc_msgSend_setStorageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorageProvider:");
}

id objc_msgSend_setStoreBothFreeAndPaidUrlsPreviousBootup(void *a1, const char *a2, ...)
{
  return _[a1 setStoreBothFreeAndPaidUrlsPreviousBootup];
}

id objc_msgSend_setStoreCleanURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreCleanURL:");
}

id objc_msgSend_setStoreCollectionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreCollectionId:");
}

id objc_msgSend_setStorePodcastDownloader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorePodcastDownloader:");
}

id objc_msgSend_setStoreReportingParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreReportingParams:");
}

id objc_msgSend_setStoreResponseDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreResponseDelegate:");
}

id objc_msgSend_setStoreShortURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreShortURL:");
}

id objc_msgSend_setStoreTrackId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreTrackId:");
}

id objc_msgSend_setStreamCacheObserverToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamCacheObserverToken:");
}

id objc_msgSend_setStreamUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamUrl:");
}

id objc_msgSend_setStrongDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStrongDelegate:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSublayerTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSublayerTransform:");
}

id objc_msgSend_setSubscribedSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscribedSetting:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSubtitleDisplayType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleDisplayType:");
}

id objc_msgSend_setSubtitleFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleFont:");
}

id objc_msgSend_setSubtitleText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleText:");
}

id objc_msgSend_setSubtitleTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleTextColor:");
}

id objc_msgSend_setSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuccess:");
}

id objc_msgSend_setSupportedPlaybackRates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedPlaybackRates:");
}

id objc_msgSend_setSupportedSessionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedSessionTypes:");
}

id objc_msgSend_setSupportsContinuationStreams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsContinuationStreams:");
}

id objc_msgSend_setSupportsLocalMedia_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsLocalMedia:");
}

id objc_msgSend_setSupportsMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsMetrics:");
}

id objc_msgSend_setSupportsPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsPlayback:");
}

id objc_msgSend_setSupportsRepeat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsRepeat:");
}

id objc_msgSend_setSupportsShuffle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsShuffle:");
}

id objc_msgSend_setSuppressAutoDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuppressAutoDownload:");
}

id objc_msgSend_setSuppressMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuppressMetrics:");
}

id objc_msgSend_setSwipeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeEnabled:");
}

id objc_msgSend_setSwipeGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeGesture:");
}

id objc_msgSend_setSwipeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeState:");
}

id objc_msgSend_setSwipeToDeleteButtonColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeToDeleteButtonColor:");
}

id objc_msgSend_setSwipedCellIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipedCellIndexPath:");
}

id objc_msgSend_setSyncDirtyFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncDirtyFlag:");
}

id objc_msgSend_setSyncHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncHandler:");
}

id objc_msgSend_setSyncStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncStartTime:");
}

id objc_msgSend_setSyncTaskEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncTaskEndTime:");
}

id objc_msgSend_setSyncTaskStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncTaskStartTime:");
}

id objc_msgSend_setSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncType:");
}

id objc_msgSend_setSyncVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncVersion:");
}

id objc_msgSend_setSyncVersionFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncVersionFlags:");
}

id objc_msgSend_setSynchronizeTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSynchronizeTask:");
}

id objc_msgSend_setTabBarHidden_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTabBarHidden:animated:");
}

id objc_msgSend_setTabBarLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTabBarLoaded:");
}

id objc_msgSend_setTabBarObservedScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTabBarObservedScrollView:");
}

id objc_msgSend_setTableFooterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableFooterView:");
}

id objc_msgSend_setTableHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableHeaderView:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTargetElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetElapsedTime:");
}

id objc_msgSend_setTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTask:");
}

id objc_msgSend_setTaskAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskAssertion:");
}

id objc_msgSend_setTaskDebugDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskDebugDescription:");
}

id objc_msgSend_setTaskInvalidationDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskInvalidationDisabled:");
}

id objc_msgSend_setTemporarySubtitleOverrideType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemporarySubtitleOverrideType:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAttributes:");
}

id objc_msgSend_setTextChangedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextChangedBlock:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContainerInset:");
}

id objc_msgSend_setTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextView:");
}

id objc_msgSend_setTimeObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeObservers:");
}

id objc_msgSend_setTimeOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeOffset:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTimestampForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestampForTransaction:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forSegmentAtIndex:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleBlock:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTitleFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleFont:");
}

id objc_msgSend_setTitleForAlertControllerBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleForAlertControllerBlock:");
}

id objc_msgSend_setTitleText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleText:");
}

id objc_msgSend_setTitleTextAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleTextAttributes:");
}

id objc_msgSend_setToggle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToggle:");
}

id objc_msgSend_setToggleChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToggleChanged:");
}

id objc_msgSend_setTopAlignLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopAlignLabel:");
}

id objc_msgSend_setTouchInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchInsets:");
}

id objc_msgSend_setTrackList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackList:");
}

id objc_msgSend_setTrackNum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackNum:");
}

id objc_msgSend_setTracklistRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTracklistRange:");
}

id objc_msgSend_setTracksDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTracksDefault:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransactionAuthor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionAuthor:");
}

id objc_msgSend_setTransactionClamps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionClamps:");
}

id objc_msgSend_setTransactionDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionDescription:");
}

id objc_msgSend_setTransactionProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionProcessor:");
}

id objc_msgSend_setTranscriptIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranscriptIdentifier:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUIApplicationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUIApplicationState:");
}

id objc_msgSend_setUPPDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUPPDomainVersion:");
}

id objc_msgSend_setUPPStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUPPStore:");
}

id objc_msgSend_setUberArtworkTextPrimaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberArtworkTextPrimaryColor:");
}

id objc_msgSend_setUberArtworkTextQuaternaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberArtworkTextQuaternaryColor:");
}

id objc_msgSend_setUberArtworkTextSecondaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberArtworkTextSecondaryColor:");
}

id objc_msgSend_setUberArtworkTextTertiaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberArtworkTextTertiaryColor:");
}

id objc_msgSend_setUberBackgroundImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberBackgroundImageURL:");
}

id objc_msgSend_setUberBackgroundJoeColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberBackgroundJoeColor:");
}

id objc_msgSend_setUnfocusedShadowExpansion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnfocusedShadowExpansion:");
}

id objc_msgSend_setUnfocusedShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnfocusedShadowOpacity:");
}

id objc_msgSend_setUnfocusedShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnfocusedShadowRadius:");
}

id objc_msgSend_setUnfocusedShadowVerticalOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnfocusedShadowVerticalOffset:");
}

id objc_msgSend_setUnknownItemDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnknownItemDescription:");
}

id objc_msgSend_setUnknownItemType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnknownItemType:");
}

id objc_msgSend_setUnplayedCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnplayedCount:");
}

id objc_msgSend_setUnplayedTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnplayedTab:");
}

id objc_msgSend_setUpButtonRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpButtonRecognizer:");
}

id objc_msgSend_setUpNextController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpNextController:");
}

id objc_msgSend_setUpNextManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpNextManifest:");
}

id objc_msgSend_setUpNextQueueIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpNextQueueIntent:");
}

id objc_msgSend_setUpNextResultsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpNextResultsController:");
}

id objc_msgSend_setUpdateAvg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateAvg:");
}

id objc_msgSend_setUpdateCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateCount:");
}

id objc_msgSend_setUpdateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateInterval:");
}

id objc_msgSend_setUpdateOperationQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateOperationQueue:");
}

id objc_msgSend_setUpdateStdDev_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateStdDev:");
}

id objc_msgSend_setUpdatedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatedDate:");
}

id objc_msgSend_setUpdatedFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatedFeedURL:");
}

id objc_msgSend_setUppDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUppDataSource:");
}

id objc_msgSend_setUppLastSyncTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUppLastSyncTime:");
}

id objc_msgSend_setUppSyncDirtyFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUppSyncDirtyFlag:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setUrlSessionDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrlSessionDelegate:");
}

id objc_msgSend_setUrlToOpenWhenApplicationHasFinishedLaunching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrlToOpenWhenApplicationHasFinishedLaunching:");
}

id objc_msgSend_setUseLightStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseLightStyle:");
}

id objc_msgSend_setUseShadowImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseShadowImage:");
}

id objc_msgSend_setUserAcceptedSyncTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 setUserAcceptedSyncTimestamp];
}

id objc_msgSend_setUserAcceptedSyncTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserAcceptedSyncTimestamp:");
}

id objc_msgSend_setUserCancelledSignIn(void *a1, const char *a2, ...)
{
  return _[a1 setUserCancelledSignIn];
}

id objc_msgSend_setUserCancelledSignInBackOffUntil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserCancelledSignInBackOffUntil:");
}

id objc_msgSend_setUserDriven_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserDriven:");
}

id objc_msgSend_setUserEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserEpisode:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInfoValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfoValue:forKey:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInterfaceStyle:");
}

id objc_msgSend_setUserManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserManifest:");
}

id objc_msgSend_setUserSpinnerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserSpinnerView:");
}

id objc_msgSend_setUserSwitchEffectView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserSwitchEffectView:");
}

id objc_msgSend_setUserSwitchLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserSwitchLabel:");
}

id objc_msgSend_setUserSwitchSnapshotView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserSwitchSnapshotView:");
}

id objc_msgSend_setUti_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUti:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setUuidOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuidOrder:");
}

id objc_msgSend_setUuidSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuidSet:");
}

id objc_msgSend_setUuidToManagedObjectIDMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuidToManagedObjectIDMap:");
}

id objc_msgSend_setUuidToPlayerItemMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuidToPlayerItemMap:");
}

id objc_msgSend_setValidationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValidationManager:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forProperty:");
}

id objc_msgSend_setValue_forSettingWithIdentifier_inGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forSettingWithIdentifier:inGroup:");
}

id objc_msgSend_setValueSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueSet:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setValuesForKeysWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesForKeysWithDictionary:");
}

id objc_msgSend_setVc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVc:");
}

id objc_msgSend_setVersion_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:forKey:");
}

id objc_msgSend_setVerticalLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalLayout:");
}

id objc_msgSend_setVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideo:");
}

id objc_msgSend_setVideoViewWeakReferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoViewWeakReferences:");
}

id objc_msgSend_setVideoViewsNeedPlayerUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoViewsNeedPlayerUpdate:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllers:");
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisible:");
}

id objc_msgSend_setWebpageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWebpageURL:");
}

id objc_msgSend_setWidthTracksTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidthTracksTextView:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_setWindowLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowLevel:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_setWorkQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkQueue:");
}

id objc_msgSend_setWriteToAssetLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWriteToAssetLibrary:");
}

id objc_msgSend_setZIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZIndex:");
}

id objc_msgSend_setZPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZPosition:");
}

id objc_msgSend_set_layoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_layoutMargins:");
}

id objc_msgSend_settingAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingAtIndexPath:");
}

id objc_msgSend_settingFont(void *a1, const char *a2, ...)
{
  return _[a1 settingFont];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsController(void *a1, const char *a2, ...)
{
  return _[a1 settingsController];
}

id objc_msgSend_settingsController_addedGroup_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:addedGroup:atIndex:");
}

id objc_msgSend_settingsController_didChangeHeaderAction_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:didChangeHeaderAction:inGroupWithIdentifier:");
}

id objc_msgSend_settingsController_didChangeSettingValueAtIndex_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:didChangeSettingValueAtIndex:inGroupWithIdentifier:");
}

id objc_msgSend_settingsController_reloadedGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:reloadedGroupWithIdentifier:");
}

id objc_msgSend_settingsController_removedGroupAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:removedGroupAtIndex:");
}

id objc_msgSend_settingsController_removedSettingAtIndex_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:removedSettingAtIndex:inGroupWithIdentifier:");
}

id objc_msgSend_settingsDelegate(void *a1, const char *a2, ...)
{
  return _[a1 settingsDelegate];
}

id objc_msgSend_settingsForDownloadsGroup(void *a1, const char *a2, ...)
{
  return _[a1 settingsForDownloadsGroup];
}

id objc_msgSend_settingsForPrivateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForPrivateStyle:");
}

id objc_msgSend_settingsForShowGroup(void *a1, const char *a2, ...)
{
  return _[a1 settingsForShowGroup];
}

id objc_msgSend_settingsHandler(void *a1, const char *a2, ...)
{
  return _[a1 settingsHandler];
}

id objc_msgSend_settingsNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 settingsNavigationController];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return _[a1 setup];
}

id objc_msgSend_setupActions(void *a1, const char *a2, ...)
{
  return _[a1 setupActions];
}

id objc_msgSend_setupAfterBecomingActive(void *a1, const char *a2, ...)
{
  return _[a1 setupAfterBecomingActive];
}

id objc_msgSend_setupCell(void *a1, const char *a2, ...)
{
  return _[a1 setupCell];
}

id objc_msgSend_setupChildViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 setupChildViewControllers];
}

id objc_msgSend_setupColumnWidth(void *a1, const char *a2, ...)
{
  return _[a1 setupColumnWidth];
}

id objc_msgSend_setupFRC(void *a1, const char *a2, ...)
{
  return _[a1 setupFRC];
}

id objc_msgSend_setupFocus(void *a1, const char *a2, ...)
{
  return _[a1 setupFocus];
}

id objc_msgSend_setupHelper(void *a1, const char *a2, ...)
{
  return _[a1 setupHelper];
}

id objc_msgSend_setupIncludeAllCell(void *a1, const char *a2, ...)
{
  return _[a1 setupIncludeAllCell];
}

id objc_msgSend_setupNetworkMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 setupNetworkMonitoring];
}

id objc_msgSend_setupPlayerNotifications(void *a1, const char *a2, ...)
{
  return _[a1 setupPlayerNotifications];
}

id objc_msgSend_setupSubviews(void *a1, const char *a2, ...)
{
  return _[a1 setupSubviews];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return _[a1 setupView];
}

id objc_msgSend_shadowColor(void *a1, const char *a2, ...)
{
  return _[a1 shadowColor];
}

id objc_msgSend_shadowSize(void *a1, const char *a2, ...)
{
  return _[a1 shadowSize];
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return _[a1 shareURL];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 sharedAnalytics];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedCacheDirectory(void *a1, const char *a2, ...)
{
  return _[a1 sharedCacheDirectory];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedDocumentsDirectory(void *a1, const char *a2, ...)
{
  return _[a1 sharedDocumentsDirectory];
}

id objc_msgSend_sharedDownloaders(void *a1, const char *a2, ...)
{
  return _[a1 sharedDownloaders];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInterfaceFactory(void *a1, const char *a2, ...)
{
  return _[a1 sharedInterfaceFactory];
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return _[a1 sharedLogger];
}

id objc_msgSend_sharedPlayer(void *a1, const char *a2, ...)
{
  return _[a1 sharedPlayer];
}

id objc_msgSend_shiftedIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 shiftedIndexPath];
}

id objc_msgSend_shortTitles(void *a1, const char *a2, ...)
{
  return _[a1 shortTitles];
}

id objc_msgSend_shouldAuthenticate(void *a1, const char *a2, ...)
{
  return _[a1 shouldAuthenticate];
}

id objc_msgSend_shouldContinue(void *a1, const char *a2, ...)
{
  return _[a1 shouldContinue];
}

id objc_msgSend_shouldFindSomethingToPlay(void *a1, const char *a2, ...)
{
  return _[a1 shouldFindSomethingToPlay];
}

id objc_msgSend_shouldForceAuthenticationForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForceAuthenticationForTransaction:");
}

id objc_msgSend_shouldNotContinueResult(void *a1, const char *a2, ...)
{
  return _[a1 shouldNotContinueResult];
}

id objc_msgSend_shouldPresentNowPlayingForItem_presentationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPresentNowPlayingForItem:presentationType:");
}

id objc_msgSend_shouldShowNowPlaying(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowNowPlaying];
}

id objc_msgSend_shouldShowNowPlayingGlyphWhenPaused(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowNowPlayingGlyphWhenPaused];
}

id objc_msgSend_shouldShowPodcastsTermsScreen(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowPodcastsTermsScreen];
}

id objc_msgSend_shouldShowWelcome(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowWelcome];
}

id objc_msgSend_shouldSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSync:");
}

id objc_msgSend_shouldSyncInReadOnlyMode(void *a1, const char *a2, ...)
{
  return _[a1 shouldSyncInReadOnlyMode];
}

id objc_msgSend_showActionSheetWithActions_fromButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showActionSheetWithActions:fromButton:");
}

id objc_msgSend_showAddPodcastsSheet(void *a1, const char *a2, ...)
{
  return _[a1 showAddPodcastsSheet];
}

id objc_msgSend_showAddPodcastsUI(void *a1, const char *a2, ...)
{
  return _[a1 showAddPodcastsUI];
}

id objc_msgSend_showCount(void *a1, const char *a2, ...)
{
  return _[a1 showCount];
}

id objc_msgSend_showDebugUI(void *a1, const char *a2, ...)
{
  return _[a1 showDebugUI];
}

id objc_msgSend_showDeleteStationUI(void *a1, const char *a2, ...)
{
  return _[a1 showDeleteStationUI];
}

id objc_msgSend_showDialogForReason_podcastTitle_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showDialogForReason:podcastTitle:completion:");
}

id objc_msgSend_showEditTitleUI(void *a1, const char *a2, ...)
{
  return _[a1 showEditTitleUI];
}

id objc_msgSend_showInternetUnreachableDialog(void *a1, const char *a2, ...)
{
  return _[a1 showInternetUnreachableDialog];
}

id objc_msgSend_showInternetUnreachableDialogWithAcknowledmentBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showInternetUnreachableDialogWithAcknowledmentBlock:");
}

id objc_msgSend_showListShowsAllShowsKey(void *a1, const char *a2, ...)
{
  return _[a1 showListShowsAllShowsKey];
}

id objc_msgSend_showOverKeyWindowUserSwitchState_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showOverKeyWindowUserSwitchState:completion:");
}

id objc_msgSend_showPlayedEpisodes(void *a1, const char *a2, ...)
{
  return _[a1 showPlayedEpisodes];
}

id objc_msgSend_showSettings_changedEpisodeLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedEpisodeLimit:");
}

id objc_msgSend_showSettings_changedNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedNotifications:");
}

id objc_msgSend_showSettings_changedRemovePlayedDownloads_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedRemovePlayedDownloads:");
}

id objc_msgSend_showSettings_changedShowType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedShowType:");
}

id objc_msgSend_showSettings_changedSubscribed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedSubscribed:");
}

id objc_msgSend_showSettingsGroup(void *a1, const char *a2, ...)
{
  return _[a1 showSettingsGroup];
}

id objc_msgSend_showSpecificUpsellCopy(void *a1, const char *a2, ...)
{
  return _[a1 showSpecificUpsellCopy];
}

id objc_msgSend_showSubscriptionFailureDialog_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSubscriptionFailureDialog:error:");
}

id objc_msgSend_showType(void *a1, const char *a2, ...)
{
  return _[a1 showType];
}

id objc_msgSend_showTypeFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeFromString:");
}

id objc_msgSend_showTypeInFeed(void *a1, const char *a2, ...)
{
  return _[a1 showTypeInFeed];
}

id objc_msgSend_showTypeInFeedResolvedValue(void *a1, const char *a2, ...)
{
  return _[a1 showTypeInFeedResolvedValue];
}

id objc_msgSend_showTypeRadioGroup(void *a1, const char *a2, ...)
{
  return _[a1 showTypeRadioGroup];
}

id objc_msgSend_showTypeSetting(void *a1, const char *a2, ...)
{
  return _[a1 showTypeSetting];
}

id objc_msgSend_showTypeUserSetting(void *a1, const char *a2, ...)
{
  return _[a1 showTypeUserSetting];
}

id objc_msgSend_showViewController_sender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showViewController:sender:");
}

id objc_msgSend_showsArtwork(void *a1, const char *a2, ...)
{
  return _[a1 showsArtwork];
}

id objc_msgSend_showsArtworkForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsArtworkForStyle:");
}

id objc_msgSend_showsArtworkInCells(void *a1, const char *a2, ...)
{
  return _[a1 showsArtworkInCells];
}

id objc_msgSend_showsDescriptionButton(void *a1, const char *a2, ...)
{
  return _[a1 showsDescriptionButton];
}

id objc_msgSend_showsFooterTextView(void *a1, const char *a2, ...)
{
  return _[a1 showsFooterTextView];
}

id objc_msgSend_showsMoreButton(void *a1, const char *a2, ...)
{
  return _[a1 showsMoreButton];
}

id objc_msgSend_showsPlayState(void *a1, const char *a2, ...)
{
  return _[a1 showsPlayState];
}

id objc_msgSend_showsPubDate(void *a1, const char *a2, ...)
{
  return _[a1 showsPubDate];
}

id objc_msgSend_showsSeperator(void *a1, const char *a2, ...)
{
  return _[a1 showsSeperator];
}

id objc_msgSend_shuffleCommand(void *a1, const char *a2, ...)
{
  return _[a1 shuffleCommand];
}

id objc_msgSend_shuffleMode(void *a1, const char *a2, ...)
{
  return _[a1 shuffleMode];
}

id objc_msgSend_shuffleType(void *a1, const char *a2, ...)
{
  return _[a1 shuffleType];
}

id objc_msgSend_sideView(void *a1, const char *a2, ...)
{
  return _[a1 sideView];
}

id objc_msgSend_sideViewFrameForContentViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sideViewFrameForContentViewSize:");
}

id objc_msgSend_simulateMemoryWarning(void *a1, const char *a2, ...)
{
  return _[a1 simulateMemoryWarning];
}

id objc_msgSend_sinceDomainVersion(void *a1, const char *a2, ...)
{
  return _[a1 sinceDomainVersion];
}

id objc_msgSend_sinceDomainVersionForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinceDomainVersionForTransaction:");
}

id objc_msgSend_siriAnalyticsController(void *a1, const char *a2, ...)
{
  return _[a1 siriAnalyticsController];
}

id objc_msgSend_siriAssetInfo(void *a1, const char *a2, ...)
{
  return _[a1 siriAssetInfo];
}

id objc_msgSend_siriDonator(void *a1, const char *a2, ...)
{
  return _[a1 siriDonator];
}

id objc_msgSend_siriDumper(void *a1, const char *a2, ...)
{
  return _[a1 siriDumper];
}

id objc_msgSend_siriMultiUserConnection(void *a1, const char *a2, ...)
{
  return _[a1 siriMultiUserConnection];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeCacheKeyForLabel_width_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeCacheKeyForLabel:width:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeWithAttributes:");
}

id objc_msgSend_sizeWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeWithFont:");
}

id objc_msgSend_skipBackwardCommand(void *a1, const char *a2, ...)
{
  return _[a1 skipBackwardCommand];
}

id objc_msgSend_skipForwardCommand(void *a1, const char *a2, ...)
{
  return _[a1 skipForwardCommand];
}

id objc_msgSend_snapshotViewAfterScreenUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotViewAfterScreenUpdates:");
}

id objc_msgSend_song(void *a1, const char *a2, ...)
{
  return _[a1 song];
}

id objc_msgSend_sortAscending(void *a1, const char *a2, ...)
{
  return _[a1 sortAscending];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortDescriptors(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptors];
}

id objc_msgSend_sortDescriptorsForAllPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForAllPodcasts];
}

id objc_msgSend_sortDescriptorsForDateAddedAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForDateAddedAscending:");
}

id objc_msgSend_sortDescriptorsForDownloadedDateAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForDownloadedDateAscending:");
}

id objc_msgSend_sortDescriptorsForFirstTimeAvailableAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForFirstTimeAvailableAscending:");
}

id objc_msgSend_sortDescriptorsForLastBookmarkedDateAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForLastBookmarkedDateAscending:");
}

id objc_msgSend_sortDescriptorsForListenNow(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForListenNow];
}

id objc_msgSend_sortDescriptorsForManualOrder(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForManualOrder];
}

id objc_msgSend_sortDescriptorsForPlayOrder(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForPlayOrder];
}

id objc_msgSend_sortDescriptorsForPlayOrderByEpisodeNumber(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForPlayOrderByEpisodeNumber];
}

id objc_msgSend_sortDescriptorsForPlayOrderByPubDate(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForPlayOrderByPubDate];
}

id objc_msgSend_sortDescriptorsForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPodcastUuid:");
}

id objc_msgSend_sortDescriptorsForPubDateAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPubDateAscending:");
}

id objc_msgSend_sortDescriptorsForRecentlyPlayed(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForRecentlyPlayed];
}

id objc_msgSend_sortDescriptorsForRecentlyUnfollowed(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForRecentlyUnfollowed];
}

id objc_msgSend_sortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForSortOrder];
}

id objc_msgSend_sortDescriptorsForSortType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForSortType:");
}

id objc_msgSend_sortDescriptorsForTitle(void *a1, const char *a2, ...)
{
  return _[a1 sortDescriptorsForTitle];
}

id objc_msgSend_sortDescriptorsForTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForTitle:");
}

id objc_msgSend_sortOrder(void *a1, const char *a2, ...)
{
  return _[a1 sortOrder];
}

id objc_msgSend_sortOrderAscForShowType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortOrderAscForShowType:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedArrayWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayWithOptions:usingComparator:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_sourceList_didSelectItemUuid_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceList:didSelectItemUuid:atIndexPath:");
}

id objc_msgSend_sourceList_didUpdateSelectedItemUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceList:didUpdateSelectedItemUuid:");
}

id objc_msgSend_specialPath(void *a1, const char *a2, ...)
{
  return _[a1 specialPath];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return _[a1 spinner];
}

id objc_msgSend_splitViewController(void *a1, const char *a2, ...)
{
  return _[a1 splitViewController];
}

id objc_msgSend_standardDeviationForEpisodes_standardDeviation_average_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardDeviationForEpisodes:standardDeviation:average:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_standupEmptyContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 standupEmptyContentViewController];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAllProcessors(void *a1, const char *a2, ...)
{
  return _[a1 startAllProcessors];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return _[a1 startAnimation];
}

id objc_msgSend_startBackgroundTask(void *a1, const char *a2, ...)
{
  return _[a1 startBackgroundTask];
}

id objc_msgSend_startDelay(void *a1, const char *a2, ...)
{
  return _[a1 startDelay];
}

id objc_msgSend_startDonation(void *a1, const char *a2, ...)
{
  return _[a1 startDonation];
}

id objc_msgSend_startDownloadForPodcastStoreId_triggerBy_feedUrl_useBackgroundFetch_source_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownloadForPodcastStoreId:triggerBy:feedUrl:useBackgroundFetch:source:");
}

id objc_msgSend_startDownloadTaskForFeedURL_userInitiated_useBackgroundFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownloadTaskForFeedURL:userInitiated:useBackgroundFetch:");
}

id objc_msgSend_startIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 startIfNeeded];
}

id objc_msgSend_startIndex(void *a1, const char *a2, ...)
{
  return _[a1 startIndex];
}

id objc_msgSend_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:");
}

id objc_msgSend_startKeyRequestWithSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startKeyRequestWithSession:completion:");
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return _[a1 startListening];
}

id objc_msgSend_startNotifier(void *a1, const char *a2, ...)
{
  return _[a1 startNotifier];
}

id objc_msgSend_startObserveringPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 startObserveringPodcasts];
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return _[a1 startObserving];
}

id objc_msgSend_startObservingPlaybackState(void *a1, const char *a2, ...)
{
  return _[a1 startObservingPlaybackState];
}

id objc_msgSend_startPlayback(void *a1, const char *a2, ...)
{
  return _[a1 startPlayback];
}

id objc_msgSend_startProcessors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startProcessors:");
}

id objc_msgSend_startProcessorsForFeedUpdates(void *a1, const char *a2, ...)
{
  return _[a1 startProcessorsForFeedUpdates];
}

id objc_msgSend_startTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimer:");
}

id objc_msgSend_startUPPSyncTimer(void *a1, const char *a2, ...)
{
  return _[a1 startUPPSyncTimer];
}

id objc_msgSend_startVisitingEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startVisitingEpisode:");
}

id objc_msgSend_startedEpisodeUuids(void *a1, const char *a2, ...)
{
  return _[a1 startedEpisodeUuids];
}

id objc_msgSend_startingIndexForDisplay(void *a1, const char *a2, ...)
{
  return _[a1 startingIndexForDisplay];
}

id objc_msgSend_startupTime(void *a1, const char *a2, ...)
{
  return _[a1 startupTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_station(void *a1, const char *a2, ...)
{
  return _[a1 station];
}

id objc_msgSend_stationActionController(void *a1, const char *a2, ...)
{
  return _[a1 stationActionController];
}

id objc_msgSend_stationDeleteAction(void *a1, const char *a2, ...)
{
  return _[a1 stationDeleteAction];
}

id objc_msgSend_stationPlayAction(void *a1, const char *a2, ...)
{
  return _[a1 stationPlayAction];
}

id objc_msgSend_stationRefreshAction(void *a1, const char *a2, ...)
{
  return _[a1 stationRefreshAction];
}

id objc_msgSend_stationResultsController(void *a1, const char *a2, ...)
{
  return _[a1 stationResultsController];
}

id objc_msgSend_stationSettingsAction(void *a1, const char *a2, ...)
{
  return _[a1 stationSettingsAction];
}

id objc_msgSend_stationSettingsViewController(void *a1, const char *a2, ...)
{
  return _[a1 stationSettingsViewController];
}

id objc_msgSend_stationUuid(void *a1, const char *a2, ...)
{
  return _[a1 stationUuid];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_statusCodeForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCodeForTask:");
}

id objc_msgSend_statusWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusWithCode:");
}

id objc_msgSend_statusWithCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusWithCode:error:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_stopKeyRequestWithSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopKeyRequestWithSession:completion:");
}

id objc_msgSend_stopListening(void *a1, const char *a2, ...)
{
  return _[a1 stopListening];
}

id objc_msgSend_stopNotifier(void *a1, const char *a2, ...)
{
  return _[a1 stopNotifier];
}

id objc_msgSend_stopObservingChanges(void *a1, const char *a2, ...)
{
  return _[a1 stopObservingChanges];
}

id objc_msgSend_stopObservingPlaybackState(void *a1, const char *a2, ...)
{
  return _[a1 stopObservingPlaybackState];
}

id objc_msgSend_stopWithReason_initiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWithReason:initiator:");
}

id objc_msgSend_stopped(void *a1, const char *a2, ...)
{
  return _[a1 stopped];
}

id objc_msgSend_storageProvider(void *a1, const char *a2, ...)
{
  return _[a1 storageProvider];
}

id objc_msgSend_storeAccountDidChange(void *a1, const char *a2, ...)
{
  return _[a1 storeAccountDidChange];
}

id objc_msgSend_storeAccountMismatchErrorWithPreviousStoreAccountText_currentStoreAccontText_transaction_underlyingError_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "storeAccountMismatchErrorWithPreviousStoreAccountText:currentStoreAccontText:transaction:underlyingError:");
}

id objc_msgSend_storeAccountSessionExpiredWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeAccountSessionExpiredWithTransaction:underlyingError:");
}

id objc_msgSend_storeAdamID(void *a1, const char *a2, ...)
{
  return _[a1 storeAdamID];
}

id objc_msgSend_storeBookkeeperPreferences(void *a1, const char *a2, ...)
{
  return _[a1 storeBookkeeperPreferences];
}

id objc_msgSend_storeCleanURL(void *a1, const char *a2, ...)
{
  return _[a1 storeCleanURL];
}

id objc_msgSend_storeCleanURLForAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCleanURLForAdamID:");
}

id objc_msgSend_storeCloudAlbumID(void *a1, const char *a2, ...)
{
  return _[a1 storeCloudAlbumID];
}

id objc_msgSend_storeCloudID(void *a1, const char *a2, ...)
{
  return _[a1 storeCloudID];
}

id objc_msgSend_storeCollectionId(void *a1, const char *a2, ...)
{
  return _[a1 storeCollectionId];
}

id objc_msgSend_storeCollectionIdForRedirectURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCollectionIdForRedirectURL:");
}

id objc_msgSend_storeGenericErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeGenericErrorWithTransaction:underlyingError:");
}

id objc_msgSend_storeId(void *a1, const char *a2, ...)
{
  return _[a1 storeId];
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storeIdentifier];
}

id objc_msgSend_storeLoggedOutErrorWithPreviousStoreAccountText_transaction_underlyingError_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeLoggedOutErrorWithPreviousStoreAccountText:transaction:underlyingError:");
}

id objc_msgSend_storeMediaDictionariesToPlayerItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMediaDictionariesToPlayerItems:");
}

id objc_msgSend_storeMediaDictionariesToPlayerItems_initiatedByAnotherUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMediaDictionariesToPlayerItems:initiatedByAnotherUser:");
}

id objc_msgSend_storeMediaDictionaryFromStorePlatformDictionary_artworkSize_restricted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:");
}

id objc_msgSend_storeMediaDictionaryFromStorePlatformDictionary_artworkSize_restricted_isNotSubscribeable_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:isNotSubscribeable:");
}

id objc_msgSend_storePlatformDictionaryHasChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storePlatformDictionaryHasChildren:");
}

id objc_msgSend_storePodcastDownloader(void *a1, const char *a2, ...)
{
  return _[a1 storePodcastDownloader];
}

id objc_msgSend_storePurchasedAdamID(void *a1, const char *a2, ...)
{
  return _[a1 storePurchasedAdamID];
}

id objc_msgSend_storeReportingParams(void *a1, const char *a2, ...)
{
  return _[a1 storeReportingParams];
}

id objc_msgSend_storeResponseDelegate(void *a1, const char *a2, ...)
{
  return _[a1 storeResponseDelegate];
}

id objc_msgSend_storeShortURL(void *a1, const char *a2, ...)
{
  return _[a1 storeShortURL];
}

id objc_msgSend_storeSubscriptionAdamID(void *a1, const char *a2, ...)
{
  return _[a1 storeSubscriptionAdamID];
}

id objc_msgSend_storeTrackId(void *a1, const char *a2, ...)
{
  return _[a1 storeTrackId];
}

id objc_msgSend_storeValidationErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeValidationErrorWithTransaction:underlyingError:");
}

id objc_msgSend_storedUuid(void *a1, const char *a2, ...)
{
  return _[a1 storedUuid];
}

id objc_msgSend_streamCacheObserverToken(void *a1, const char *a2, ...)
{
  return _[a1 streamCacheObserverToken];
}

id objc_msgSend_streamCacheURLAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamCacheURLAndReturnError:");
}

id objc_msgSend_streamURL(void *a1, const char *a2, ...)
{
  return _[a1 streamURL];
}

id objc_msgSend_streamUrl(void *a1, const char *a2, ...)
{
  return _[a1 streamUrl];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAddingPercentEscapesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEscapesUsingEncoding:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByRemovingNewlineCharacters(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingNewlineCharacters];
}

id objc_msgSend_stringByRemovingPercentEscapes(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingPercentEscapes];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_stringBySmartlyStrippingHTML(void *a1, const char *a2, ...)
{
  return _[a1 stringBySmartlyStrippingHTML];
}

id objc_msgSend_stringByStrippingHTML(void *a1, const char *a2, ...)
{
  return _[a1 stringByStrippingHTML];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForContainerOrder_short_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForContainerOrder:short:");
}

id objc_msgSend_stringForEpisodes_short_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForEpisodes:short:defaultValue:");
}

id objc_msgSend_stringForGlobalDefaultLimit(void *a1, const char *a2, ...)
{
  return _[a1 stringForGlobalDefaultLimit];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringForMedia_short_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForMedia:short:");
}

id objc_msgSend_stringForNewEpisodeCount_titleCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForNewEpisodeCount:titleCase:");
}

id objc_msgSend_stringForUnplayedEpisodeCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForUnplayedEpisodeCount:");
}

id objc_msgSend_stringForUnplayedEpisodeCount_titleCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForUnplayedEpisodeCount:titleCase:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromDictionary_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDictionary:forKey:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithBytesize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithBytesize:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithDuration_unitsStyle_includeTimeRemainingPhrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithDuration:unitsStyle:includeTimeRemainingPhrase:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_styleForWidth_showsArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "styleForWidth:showsArtwork:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_subscribeAction(void *a1, const char *a2, ...)
{
  return _[a1 subscribeAction];
}

id objc_msgSend_subscribeCommandStatusForErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeCommandStatusForErrorCode:");
}

id objc_msgSend_subscribeFooterText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeFooterText:");
}

id objc_msgSend_subscribeFromCloudToPodcasts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeFromCloudToPodcasts:");
}

id objc_msgSend_subscribeToLifecycleEventNotifications(void *a1, const char *a2, ...)
{
  return _[a1 subscribeToLifecycleEventNotifications];
}

id objc_msgSend_subscribeToPodcastWithFeedUrl_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToPodcastWithFeedUrl:completion:");
}

id objc_msgSend_subscribeToPodcastWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToPodcastWithParams:");
}

id objc_msgSend_subscribeToPodcastWithStorePlatformDictionary_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToPodcastWithStorePlatformDictionary:completion:");
}

id objc_msgSend_subscribeToShowWithPodcastStoreId_account_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToShowWithPodcastStoreId:account:completion:");
}

id objc_msgSend_subscribeWithCommandURL_siriAssetInfo_requester_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeWithCommandURL:siriAssetInfo:requester:completion:");
}

id objc_msgSend_subscribed(void *a1, const char *a2, ...)
{
  return _[a1 subscribed];
}

id objc_msgSend_subscribedPodcastResultsControllerWithSort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribedPodcastResultsControllerWithSort:");
}

id objc_msgSend_subscribedSetting(void *a1, const char *a2, ...)
{
  return _[a1 subscribedSetting];
}

id objc_msgSend_subscriptionActive(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionActive];
}

id objc_msgSend_subscriptionControllerErrorDomain(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionControllerErrorDomain];
}

id objc_msgSend_subscriptionKeyForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionKeyForSyncType:");
}

id objc_msgSend_subscriptionSyncProcessorSyncKeys(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionSyncProcessorSyncKeys];
}

id objc_msgSend_subscriptionsLastSyncTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionsLastSyncTimestamp];
}

id objc_msgSend_subscriptionsLastSyncTimestampFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionsLastSyncTimestampFor:");
}

id objc_msgSend_subscriptionsSyncVersionFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionsSyncVersionFor:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_subtitleDisplayType(void *a1, const char *a2, ...)
{
  return _[a1 subtitleDisplayType];
}

id objc_msgSend_subtitleFont(void *a1, const char *a2, ...)
{
  return _[a1 subtitleFont];
}

id objc_msgSend_subtitleHeightForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleHeightForWidth:");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabel];
}

id objc_msgSend_subtitleMaxWidth(void *a1, const char *a2, ...)
{
  return _[a1 subtitleMaxWidth];
}

id objc_msgSend_subtitleNumberOfLines(void *a1, const char *a2, ...)
{
  return _[a1 subtitleNumberOfLines];
}

id objc_msgSend_subtitleOptions(void *a1, const char *a2, ...)
{
  return _[a1 subtitleOptions];
}

id objc_msgSend_subtitleOriginYForTitleFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleOriginYForTitleFrame:");
}

id objc_msgSend_subtitleStringForArtist_album_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleStringForArtist:album:");
}

id objc_msgSend_subtitleText(void *a1, const char *a2, ...)
{
  return _[a1 subtitleText];
}

id objc_msgSend_subtitleTextColor(void *a1, const char *a2, ...)
{
  return _[a1 subtitleTextColor];
}

id objc_msgSend_subtitleTextStyle(void *a1, const char *a2, ...)
{
  return _[a1 subtitleTextStyle];
}

id objc_msgSend_subtitleView(void *a1, const char *a2, ...)
{
  return _[a1 subtitleView];
}

id objc_msgSend_subviewOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviewOfClass:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return _[a1 success];
}

id objc_msgSend_successfulGetTransaction_withData_forKey_version_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successfulGetTransaction:withData:forKey:version:finishedBlock:");
}

id objc_msgSend_successfulSetTransaction_withData_forKey_version_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successfulSetTransaction:withData:forKey:version:finishedBlock:");
}

id objc_msgSend_superLayoutAttributesForSupplementaryViewOfKind_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:");
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return _[a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supplementaryViewForElementKind_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supplementaryViewForElementKind:atIndexPath:");
}

id objc_msgSend_supportedActivityTypes(void *a1, const char *a2, ...)
{
  return _[a1 supportedActivityTypes];
}

id objc_msgSend_supportsBatchInsertion(void *a1, const char *a2, ...)
{
  return _[a1 supportsBatchInsertion];
}

id objc_msgSend_supportsChapterArtwork(void *a1, const char *a2, ...)
{
  return _[a1 supportsChapterArtwork];
}

id objc_msgSend_supportsEpisodeArtwork(void *a1, const char *a2, ...)
{
  return _[a1 supportsEpisodeArtwork];
}

id objc_msgSend_supportsImageStore(void *a1, const char *a2, ...)
{
  return _[a1 supportsImageStore];
}

id objc_msgSend_supportsLocalMedia(void *a1, const char *a2, ...)
{
  return _[a1 supportsLocalMedia];
}

id objc_msgSend_supportsMetrics(void *a1, const char *a2, ...)
{
  return _[a1 supportsMetrics];
}

id objc_msgSend_supportsPlayback(void *a1, const char *a2, ...)
{
  return _[a1 supportsPlayback];
}

id objc_msgSend_supportsSubscription(void *a1, const char *a2, ...)
{
  return _[a1 supportsSubscription];
}

id objc_msgSend_suppressAutomaticDownloadsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 suppressAutomaticDownloadsIfNeeded];
}

id objc_msgSend_suppressEpisodesWithBasisDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suppressEpisodesWithBasisDate:");
}

id objc_msgSend_suppressMetrics(void *a1, const char *a2, ...)
{
  return _[a1 suppressMetrics];
}

id objc_msgSend_swipeBegan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swipeBegan:");
}

id objc_msgSend_swipeEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swipeEnded:");
}

id objc_msgSend_swipeState(void *a1, const char *a2, ...)
{
  return _[a1 swipeState];
}

id objc_msgSend_swipedCellIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 swipedCellIndexPath];
}

id objc_msgSend_switchBitrate(void *a1, const char *a2, ...)
{
  return _[a1 switchBitrate];
}

id objc_msgSend_switchSettingChanged_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchSettingChanged:value:");
}

id objc_msgSend_switchSettingWithTitle_initialValue_identifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchSettingWithTitle:initialValue:identifier:changeHandler:");
}

id objc_msgSend_switchToTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchToTab:");
}

id objc_msgSend_swizzleMethodsForMetrics(void *a1, const char *a2, ...)
{
  return _[a1 swizzleMethodsForMetrics];
}

id objc_msgSend_sync(void *a1, const char *a2, ...)
{
  return _[a1 sync];
}

id objc_msgSend_syncAllBookkeeperKeys(void *a1, const char *a2, ...)
{
  return _[a1 syncAllBookkeeperKeys];
}

id objc_msgSend_syncCriticalBookkeeperKeysShouldSyncCleanKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncCriticalBookkeeperKeysShouldSyncCleanKeys:");
}

id objc_msgSend_syncDictionaryToMetricsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncDictionaryToMetricsDictionary:");
}

id objc_msgSend_syncDirtyFlag(void *a1, const char *a2, ...)
{
  return _[a1 syncDirtyFlag];
}

id objc_msgSend_syncEverything(void *a1, const char *a2, ...)
{
  return _[a1 syncEverything];
}

id objc_msgSend_syncEverythingIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 syncEverythingIfNeeded];
}

id objc_msgSend_syncFlagsForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncFlagsForSyncType:");
}

id objc_msgSend_syncInProgress(void *a1, const char *a2, ...)
{
  return _[a1 syncInProgress];
}

id objc_msgSend_syncMergeIsFromCloud(void *a1, const char *a2, ...)
{
  return _[a1 syncMergeIsFromCloud];
}

id objc_msgSend_syncMultipleKeysAndProcessors_shouldSyncCleanKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncMultipleKeysAndProcessors:shouldSyncCleanKeys:");
}

id objc_msgSend_syncMusicSubscriptionInformation(void *a1, const char *a2, ...)
{
  return _[a1 syncMusicSubscriptionInformation];
}

id objc_msgSend_syncNonFollowedShows(void *a1, const char *a2, ...)
{
  return _[a1 syncNonFollowedShows];
}

id objc_msgSend_syncNonFollowedShowsIfSyncDirty(void *a1, const char *a2, ...)
{
  return _[a1 syncNonFollowedShowsIfSyncDirty];
}

id objc_msgSend_syncStartTime(void *a1, const char *a2, ...)
{
  return _[a1 syncStartTime];
}

id objc_msgSend_syncStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncStringForKey:");
}

id objc_msgSend_syncSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 syncSubscriptions];
}

id objc_msgSend_syncTaskEndTime(void *a1, const char *a2, ...)
{
  return _[a1 syncTaskEndTime];
}

id objc_msgSend_syncTaskStartTime(void *a1, const char *a2, ...)
{
  return _[a1 syncTaskStartTime];
}

id objc_msgSend_syncTermsVersion(void *a1, const char *a2, ...)
{
  return _[a1 syncTermsVersion];
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return _[a1 syncType];
}

id objc_msgSend_syncValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncValueForKey:");
}

id objc_msgSend_syncVersion(void *a1, const char *a2, ...)
{
  return _[a1 syncVersion];
}

id objc_msgSend_syncVersionFlags(void *a1, const char *a2, ...)
{
  return _[a1 syncVersionFlags];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeImmediatelyWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeImmediatelyWithCompletionBlock:");
}

id objc_msgSend_synchronizeTask(void *a1, const char *a2, ...)
{
  return _[a1 synchronizeTask];
}

id objc_msgSend_synchronizeWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeWithCompletionHandler:");
}

id objc_msgSend_synchronouslyMarkAsHiddenAllPodcastsWithoutResettingSyncVersions(void *a1, const char *a2, ...)
{
  return _[a1 synchronouslyMarkAsHiddenAllPodcastsWithoutResettingSyncVersions];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemRoute(void *a1, const char *a2, ...)
{
  return _[a1 systemRoute];
}

id objc_msgSend_systemServiceProxy(void *a1, const char *a2, ...)
{
  return _[a1 systemServiceProxy];
}

id objc_msgSend_tabBar(void *a1, const char *a2, ...)
{
  return _[a1 tabBar];
}

id objc_msgSend_tabBarController(void *a1, const char *a2, ...)
{
  return _[a1 tabBarController];
}

id objc_msgSend_tabBarController_didSelectViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarController:didSelectViewController:");
}

id objc_msgSend_tabBarController_shouldSelectViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarController:shouldSelectViewController:");
}

id objc_msgSend_tableFooterView(void *a1, const char *a2, ...)
{
  return _[a1 tableFooterView];
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 tableHeaderView];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tableView_canFocusRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:canFocusRowAtIndexPath:");
}

id objc_msgSend_tableView_didSelectRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:didSelectRowAtIndexPath:");
}

id objc_msgSend_tableView_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:numberOfRowsInSection:");
}

id objc_msgSend_tableView_titleForHeaderInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:titleForHeaderInSection:");
}

id objc_msgSend_tableViewFrame(void *a1, const char *a2, ...)
{
  return _[a1 tableViewFrame];
}

id objc_msgSend_takeValuesFromDefaultSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeValuesFromDefaultSettings:");
}

id objc_msgSend_targetElapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 targetElapsedTime];
}

id objc_msgSend_targetForRefreshControl(void *a1, const char *a2, ...)
{
  return _[a1 targetForRefreshControl];
}

id objc_msgSend_targetXOffsetForExposedActions(void *a1, const char *a2, ...)
{
  return _[a1 targetXOffsetForExposedActions];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _[a1 task];
}

id objc_msgSend_task_didFailWithError_orStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "task:didFailWithError:orStatusCode:");
}

id objc_msgSend_taskAssertion(void *a1, const char *a2, ...)
{
  return _[a1 taskAssertion];
}

id objc_msgSend_taskDebugDescription(void *a1, const char *a2, ...)
{
  return _[a1 taskDebugDescription];
}

id objc_msgSend_taskInvalidationDisabled(void *a1, const char *a2, ...)
{
  return _[a1 taskInvalidationDisabled];
}

id objc_msgSend_taskTimeout(void *a1, const char *a2, ...)
{
  return _[a1 taskTimeout];
}

id objc_msgSend_taskTimeoutTimer(void *a1, const char *a2, ...)
{
  return _[a1 taskTimeoutTimer];
}

id objc_msgSend_tearDownEmptyContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 tearDownEmptyContentViewController];
}

id objc_msgSend_tearDownPlayerNotifications(void *a1, const char *a2, ...)
{
  return _[a1 tearDownPlayerNotifications];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return _[a1 temporaryDirectory];
}

id objc_msgSend_temporarySubtitleOverrideType(void *a1, const char *a2, ...)
{
  return _[a1 temporarySubtitleOverrideType];
}

id objc_msgSend_terminateWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 terminateWithSuccess];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textAlignment(void *a1, const char *a2, ...)
{
  return _[a1 textAlignment];
}

id objc_msgSend_textAttributes(void *a1, const char *a2, ...)
{
  return _[a1 textAttributes];
}

id objc_msgSend_textChanged(void *a1, const char *a2, ...)
{
  return _[a1 textChanged];
}

id objc_msgSend_textChangedBlock(void *a1, const char *a2, ...)
{
  return _[a1 textChangedBlock];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return _[a1 textContainer];
}

id objc_msgSend_textContainerChangedGeometry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textContainerChangedGeometry:");
}

id objc_msgSend_textContainerInset(void *a1, const char *a2, ...)
{
  return _[a1 textContainerInset];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return _[a1 textField];
}

id objc_msgSend_textField_shouldChangeCharactersInRange_replacementString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textField:shouldChangeCharactersInRange:replacementString:");
}

id objc_msgSend_textFieldDidBeginEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldDidBeginEditing:");
}

id objc_msgSend_textFieldDidEndEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldDidEndEditing:");
}

id objc_msgSend_textFieldShouldBeginEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldShouldBeginEditing:");
}

id objc_msgSend_textFieldShouldClear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldShouldClear:");
}

id objc_msgSend_textFieldShouldEndEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldShouldEndEditing:");
}

id objc_msgSend_textFieldShouldReturn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldShouldReturn:");
}

id objc_msgSend_textFont(void *a1, const char *a2, ...)
{
  return _[a1 textFont];
}

id objc_msgSend_textForUnplayedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textForUnplayedShort:");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return _[a1 textProperties];
}

id objc_msgSend_textRectForBounds_limitedToNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textRectForBounds:limitedToNumberOfLines:");
}

id objc_msgSend_textSettingChanged_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textSettingChanged:value:");
}

id objc_msgSend_textSettingWithInitialValue_placeholder_identifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textSettingWithInitialValue:placeholder:identifier:changeHandler:");
}

id objc_msgSend_textSizeForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textSizeForWidth:");
}

id objc_msgSend_textStackFrameForContentViewSize_artworkFrame_sideViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textStackFrameForContentViewSize:artworkFrame:sideViewFrame:");
}

id objc_msgSend_textStackView(void *a1, const char *a2, ...)
{
  return _[a1 textStackView];
}

id objc_msgSend_textStackViewClass(void *a1, const char *a2, ...)
{
  return _[a1 textStackViewClass];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _[a1 textView];
}

id objc_msgSend_textViewMaxXForArtworkFrame_sideViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewMaxXForArtworkFrame:sideViewFrame:");
}

id objc_msgSend_textViewMinXForArtworkFrame_sideViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewMinXForArtworkFrame:sideViewFrame:");
}

id objc_msgSend_thenWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thenWithBlock:");
}

id objc_msgSend_threadDictionary(void *a1, const char *a2, ...)
{
  return _[a1 threadDictionary];
}

id objc_msgSend_thumbRectForOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbRectForOffset:");
}

id objc_msgSend_thumbRectForOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbRectForOn:");
}

id objc_msgSend_timeChapters(void *a1, const char *a2, ...)
{
  return _[a1 timeChapters];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeObservers(void *a1, const char *a2, ...)
{
  return _[a1 timeObservers];
}

id objc_msgSend_timeRemaining(void *a1, const char *a2, ...)
{
  return _[a1 timeRemaining];
}

id objc_msgSend_timeRemainingStringForEpisode_abbreviated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeRemainingStringForEpisode:abbreviated:");
}

id objc_msgSend_timeString(void *a1, const char *a2, ...)
{
  return _[a1 timeString];
}

id objc_msgSend_timedMetadataIfAvailable(void *a1, const char *a2, ...)
{
  return _[a1 timedMetadataIfAvailable];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_timeoutIntervalForResource(void *a1, const char *a2, ...)
{
  return _[a1 timeoutIntervalForResource];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_timestampBoundByNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampBoundByNow:");
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_tintColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColorForTheme:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleExclusionPathsForButtonViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleExclusionPathsForButtonViewFrame:");
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return _[a1 titleFont];
}

id objc_msgSend_titleForAlertController(void *a1, const char *a2, ...)
{
  return _[a1 titleForAlertController];
}

id objc_msgSend_titleForAlertControllerBlock(void *a1, const char *a2, ...)
{
  return _[a1 titleForAlertControllerBlock];
}

id objc_msgSend_titleForCancelAction(void *a1, const char *a2, ...)
{
  return _[a1 titleForCancelAction];
}

id objc_msgSend_titleForCurrentPodcasts(void *a1, const char *a2, ...)
{
  return _[a1 titleForCurrentPodcasts];
}

id objc_msgSend_titleHeightForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleHeightForWidth:");
}

id objc_msgSend_titleImage(void *a1, const char *a2, ...)
{
  return _[a1 titleImage];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_titleNumberOfLines(void *a1, const char *a2, ...)
{
  return _[a1 titleNumberOfLines];
}

id objc_msgSend_titleNumberOfLinesForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleNumberOfLinesForStyle:");
}

id objc_msgSend_titleOriginXForViewWidth_artworkFrame_buttonFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleOriginXForViewWidth:artworkFrame:buttonFrame:style:");
}

id objc_msgSend_titleOriginYForArtworkFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleOriginYForArtworkFrame:style:");
}

id objc_msgSend_titleSizeForViewWidth_titleOrigin_artworkFrame_buttonViewFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:");
}

id objc_msgSend_titleTextColor(void *a1, const char *a2, ...)
{
  return _[a1 titleTextColor];
}

id objc_msgSend_titleTextStyle(void *a1, const char *a2, ...)
{
  return _[a1 titleTextStyle];
}

id objc_msgSend_titleTextView(void *a1, const char *a2, ...)
{
  return _[a1 titleTextView];
}

id objc_msgSend_titleView(void *a1, const char *a2, ...)
{
  return _[a1 titleView];
}

id objc_msgSend_toJSONString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toJSONString:");
}

id objc_msgSend_toggle(void *a1, const char *a2, ...)
{
  return _[a1 toggle];
}

id objc_msgSend_toggleAllPodcastsSelected(void *a1, const char *a2, ...)
{
  return _[a1 toggleAllPodcastsSelected];
}

id objc_msgSend_toggleOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleOn:");
}

id objc_msgSend_toggleOn_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleOn:animated:");
}

id objc_msgSend_togglePlayPause(void *a1, const char *a2, ...)
{
  return _[a1 togglePlayPause];
}

id objc_msgSend_togglePodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "togglePodcastUuid:");
}

id objc_msgSend_toggleUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleUuid:");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_tombstone(void *a1, const char *a2, ...)
{
  return _[a1 tombstone];
}

id objc_msgSend_topAlignLabel(void *a1, const char *a2, ...)
{
  return _[a1 topAlignLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topLevelPlaylistsExcludingFoldersPredicate(void *a1, const char *a2, ...)
{
  return _[a1 topLevelPlaylistsExcludingFoldersPredicate];
}

id objc_msgSend_topLevelPlaylistsPredicate(void *a1, const char *a2, ...)
{
  return _[a1 topLevelPlaylistsPredicate];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_totalDuration(void *a1, const char *a2, ...)
{
  return _[a1 totalDuration];
}

id objc_msgSend_totalEpisodeCount(void *a1, const char *a2, ...)
{
  return _[a1 totalEpisodeCount];
}

id objc_msgSend_totalItemCount(void *a1, const char *a2, ...)
{
  return _[a1 totalItemCount];
}

id objc_msgSend_totalUnplayedCount(void *a1, const char *a2, ...)
{
  return _[a1 totalUnplayedCount];
}

id objc_msgSend_touchAllMigrationVersions(void *a1, const char *a2, ...)
{
  return _[a1 touchAllMigrationVersions];
}

id objc_msgSend_touchCoreDataMigrationVersion(void *a1, const char *a2, ...)
{
  return _[a1 touchCoreDataMigrationVersion];
}

id objc_msgSend_touchInsets(void *a1, const char *a2, ...)
{
  return _[a1 touchInsets];
}

id objc_msgSend_touchLibraryMigrationVersion(void *a1, const char *a2, ...)
{
  return _[a1 touchLibraryMigrationVersion];
}

id objc_msgSend_trackIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 trackIdentifiers];
}

id objc_msgSend_trackNum(void *a1, const char *a2, ...)
{
  return _[a1 trackNum];
}

id objc_msgSend_tracklist(void *a1, const char *a2, ...)
{
  return _[a1 tracklist];
}

id objc_msgSend_tracklistRange(void *a1, const char *a2, ...)
{
  return _[a1 tracklistRange];
}

id objc_msgSend_tracksDefault(void *a1, const char *a2, ...)
{
  return _[a1 tracksDefault];
}

id objc_msgSend_tracksTiledArtworkCatalogWithRows_columns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tracksTiledArtworkCatalogWithRows:columns:");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitOverrides(void *a1, const char *a2, ...)
{
  return _[a1 traitOverrides];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_transaction_didProcessResponseWithDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transaction:didProcessResponseWithDomainVersion:");
}

id objc_msgSend_transaction_willProcessResponseWithDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transaction:willProcessResponseWithDomainVersion:");
}

id objc_msgSend_transactionCancelledErrorWithTransaction_code_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCancelledErrorWithTransaction:code:underlyingError:");
}

id objc_msgSend_transactionCancelledErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCancelledErrorWithTransaction:underlyingError:");
}

id objc_msgSend_transactionClamps(void *a1, const char *a2, ...)
{
  return _[a1 transactionClamps];
}

id objc_msgSend_transactionDescription(void *a1, const char *a2, ...)
{
  return _[a1 transactionDescription];
}

id objc_msgSend_transactionMissingDomainErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionMissingDomainErrorWithTransaction:underlyingError:");
}

id objc_msgSend_transactionMissingURLErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionMissingURLErrorWithTransaction:underlyingError:");
}

id objc_msgSend_transactionNumber(void *a1, const char *a2, ...)
{
  return _[a1 transactionNumber];
}

id objc_msgSend_transactionProcessor(void *a1, const char *a2, ...)
{
  return _[a1 transactionProcessor];
}

id objc_msgSend_transactionTimeoutErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionTimeoutErrorWithTransaction:underlyingError:");
}

id objc_msgSend_transcriptIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 transcriptIdentifier];
}

id objc_msgSend_transcriptProvider(void *a1, const char *a2, ...)
{
  return _[a1 transcriptProvider];
}

id objc_msgSend_transferDuration(void *a1, const char *a2, ...)
{
  return _[a1 transferDuration];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 transitionCoordinator];
}

id objc_msgSend_translateIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "translateIndexPath:");
}

id objc_msgSend_truePredicate(void *a1, const char *a2, ...)
{
  return _[a1 truePredicate];
}

id objc_msgSend_tvm_enumerateItemsInSectionAtIndex_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvm_enumerateItemsInSectionAtIndex:usingBlock:");
}

id objc_msgSend_tvm_enumerateItemsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvm_enumerateItemsUsingBlock:");
}

id objc_msgSend_tvm_enumerateSectionsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvm_enumerateSectionsUsingBlock:");
}

id objc_msgSend_tvp_sortedSubtitleAVMediaSelectionOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvp_sortedSubtitleAVMediaSelectionOptions");
}

id objc_msgSend_tvs_MD5String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvs_MD5String");
}

id objc_msgSend_tvs_stringByRemovingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvs_stringByRemovingCharactersInSet:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uberArtworkTextPrimaryColor(void *a1, const char *a2, ...)
{
  return _[a1 uberArtworkTextPrimaryColor];
}

id objc_msgSend_uberArtworkTextQuaternaryColor(void *a1, const char *a2, ...)
{
  return _[a1 uberArtworkTextQuaternaryColor];
}

id objc_msgSend_uberArtworkTextSecondaryColor(void *a1, const char *a2, ...)
{
  return _[a1 uberArtworkTextSecondaryColor];
}

id objc_msgSend_uberArtworkTextTertiaryColor(void *a1, const char *a2, ...)
{
  return _[a1 uberArtworkTextTertiaryColor];
}

id objc_msgSend_uberBackgroundImageURL(void *a1, const char *a2, ...)
{
  return _[a1 uberBackgroundImageURL];
}

id objc_msgSend_uberBackgroundJoeColor(void *a1, const char *a2, ...)
{
  return _[a1 uberBackgroundJoeColor];
}

id objc_msgSend_uiShared(void *a1, const char *a2, ...)
{
  return _[a1 uiShared];
}

id objc_msgSend_unarchivedIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 unarchivedIdentifiers];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unavailableReasonForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unavailableReasonForEpisode:");
}

id objc_msgSend_unbox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unbox:");
}

id objc_msgSend_uncalculatedLevel(void *a1, const char *a2, ...)
{
  return _[a1 uncalculatedLevel];
}

id objc_msgSend_unionOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionOrderedSet:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeS toreId:sampPlaybackOrder:");
}

id objc_msgSend_universalStore(void *a1, const char *a2, ...)
{
  return _[a1 universalStore];
}

id objc_msgSend_unknownErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unknownErrorWithTransaction:underlyingError:");
}

id objc_msgSend_unknownItemDescription(void *a1, const char *a2, ...)
{
  return _[a1 unknownItemDescription];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unlockWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockWithCondition:");
}

id objc_msgSend_unplayedCount(void *a1, const char *a2, ...)
{
  return _[a1 unplayedCount];
}

id objc_msgSend_unplayedIcon(void *a1, const char *a2, ...)
{
  return _[a1 unplayedIcon];
}

id objc_msgSend_unplayedSections(void *a1, const char *a2, ...)
{
  return _[a1 unplayedSections];
}

id objc_msgSend_unplayedTab(void *a1, const char *a2, ...)
{
  return _[a1 unplayedTab];
}

id objc_msgSend_unsafeBookmarkEpisode_onTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeBookmarkEpisode:onTimestamp:");
}

id objc_msgSend_unsafeBookmarkEpisode_onTimestamp_shouldDownloadEpisode_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeBookmarkEpisode:onTimestamp:shouldDownloadEpisode:from:");
}

id objc_msgSend_unsafeCategoriesWithRelationshipToPodcastAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeCategoriesWithRelationshipToPodcastAdamID:");
}

id objc_msgSend_unsafeDidBumpLastDatePlayedFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeDidBumpLastDatePlayedFor:");
}

id objc_msgSend_unsafeEnableSubscriptionOnPodcastUUID_from_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeEnableSubscriptionOnPodcastUUID:from:context:");
}

id objc_msgSend_unsafeEpisodePlayedBeyondThresholdForFirstTime_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeEpisodePlayedBeyondThresholdForFirstTime:from:");
}

id objc_msgSend_unsafeIngestFeedCategory_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeIngestFeedCategory:ctx:");
}

id objc_msgSend_unsafeIngestPage(void *a1, const char *a2, ...)
{
  return _[a1 unsafeIngestPage];
}

id objc_msgSend_unsafeInterestForAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeInterestForAdamID:");
}

id objc_msgSend_unsafeRemoveEpisodeFromBookmarks_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeRemoveEpisodeFromBookmarks:from:");
}

id objc_msgSend_unsafeRemoveFromBookmarksEpisodes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeRemoveFromBookmarksEpisodes:context:");
}

id objc_msgSend_unsafeUpdateEpisode_forRemoteEpisodeDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeUpdateEpisode:forRemoteEpisodeDictionary:");
}

id objc_msgSend_unsafeUpdateEpisodeLevelsWithShowUUID_on_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeUpdateEpisodeLevelsWithShowUUID:on:");
}

id objc_msgSend_unsafeUpdateEpisodeShowTypeSpecificLevelsWithShowUUID_on_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeUpdateEpisodeShowTypeSpecificLevelsWithShowUUID:on:");
}

id objc_msgSend_unsafeUpdateRelatedFieldsIfUpNextChangedForPodcast_upNextResult_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeUpdateRelatedFieldsIfUpNextChangedForPodcast:upNextResult:ctx:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsubscribeAction(void *a1, const char *a2, ...)
{
  return _[a1 unsubscribeAction];
}

id objc_msgSend_unsubscribeFromLifecycleEventNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unsubscribeFromLifecycleEventNotifications];
}

id objc_msgSend_unsupportedClient(void *a1, const char *a2, ...)
{
  return _[a1 unsupportedClient];
}

id objc_msgSend_unsuppressAutomaticDownloadsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 unsuppressAutomaticDownloadsIfNeeded];
}

id objc_msgSend_unvisitedPodcastsToUnsubscribeIn_mismatch_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unvisitedPodcastsToUnsubscribeIn:mismatch:version:");
}

id objc_msgSend_upButtonRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 upButtonRecognizer];
}

id objc_msgSend_upNextController(void *a1, const char *a2, ...)
{
  return _[a1 upNextController];
}

id objc_msgSend_upNextForPodcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextForPodcastUuid:ctx:");
}

id objc_msgSend_upNextForPodcastUuid_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextForPodcastUuid:excludeExplicit:ctx:");
}

id objc_msgSend_upNextManifest(void *a1, const char *a2, ...)
{
  return _[a1 upNextManifest];
}

id objc_msgSend_upNextOffset(void *a1, const char *a2, ...)
{
  return _[a1 upNextOffset];
}

id objc_msgSend_upNextQueueIntent(void *a1, const char *a2, ...)
{
  return _[a1 upNextQueueIntent];
}

id objc_msgSend_upNextResultsController(void *a1, const char *a2, ...)
{
  return _[a1 upNextResultsController];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return _[a1 update];
}

id objc_msgSend_updateAccountForLastSync(void *a1, const char *a2, ...)
{
  return _[a1 updateAccountForLastSync];
}

id objc_msgSend_updateActionSheet(void *a1, const char *a2, ...)
{
  return _[a1 updateActionSheet];
}

id objc_msgSend_updateActionSheetsAndPopovers(void *a1, const char *a2, ...)
{
  return _[a1 updateActionSheetsAndPopovers];
}

id objc_msgSend_updateAdamId_forEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAdamId:forEpisode:");
}

id objc_msgSend_updateAdamIdForPodcast_withFeedURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAdamIdForPodcast:withFeedURLs:");
}

id objc_msgSend_updateAllPlaylistsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAllPlaylistsWithCompletion:");
}

id objc_msgSend_updateAllPodcastsTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAllPodcastsTo:");
}

id objc_msgSend_updateArtwork(void *a1, const char *a2, ...)
{
  return _[a1 updateArtwork];
}

id objc_msgSend_updateArtworkAsync(void *a1, const char *a2, ...)
{
  return _[a1 updateArtworkAsync];
}

id objc_msgSend_updateArtworkForShow_useBackgroundFetch_fetchUberImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateArtworkForShow:useBackgroundFetch:fetchUberImage:");
}

id objc_msgSend_updateArtworkNowPlayingIndicator(void *a1, const char *a2, ...)
{
  return _[a1 updateArtworkNowPlayingIndicator];
}

id objc_msgSend_updateAttributes_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAttributes:forIndexPath:");
}

id objc_msgSend_updateAttributes_withTopAlignmentGuide_andLastYOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAttributes:withTopAlignmentGuide:andLastYOrigin:");
}

id objc_msgSend_updateAvg(void *a1, const char *a2, ...)
{
  return _[a1 updateAvg];
}

id objc_msgSend_updateAvoidingSectingHeader_forFocusedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAvoidingSectingHeader:forFocusedIndexPath:");
}

id objc_msgSend_updateAvoidingSectingHeaderForFocusedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAvoidingSectingHeaderForFocusedIndexPath:");
}

id objc_msgSend_updateBookmarkWithSuggestedTime_forElapsedTime_duration_playbackOfMediaItemIsEnding_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBookmarkWithSuggestedTime:forElapsedTime:duration:playbackOfMediaItemIsEnding:");
}

id objc_msgSend_updateCacheForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheForEpisode:");
}

id objc_msgSend_updateCachedLayoutAttributesForElementsInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCachedLayoutAttributesForElementsInRect:");
}

id objc_msgSend_updateCellPresentationAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCellPresentationAttributes:");
}

id objc_msgSend_updateCellShadows_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCellShadows:animated:");
}

id objc_msgSend_updateCollectionViewForUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCollectionViewForUpdates:");
}

id objc_msgSend_updateCollectionViewForUpdates_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCollectionViewForUpdates:animated:");
}

id objc_msgSend_updateColors(void *a1, const char *a2, ...)
{
  return _[a1 updateColors];
}

id objc_msgSend_updateColorsForBarsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateColorsForBarsView:");
}

id objc_msgSend_updateContainerOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContainerOrder:");
}

id objc_msgSend_updateCount(void *a1, const char *a2, ...)
{
  return _[a1 updateCount];
}

id objc_msgSend_updateCurrentRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 updateCurrentRowHeight];
}

id objc_msgSend_updateCursorPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCursorPosition:");
}

id objc_msgSend_updateDRMKeysForDownloadsWithUrlProtocolDelegate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDRMKeysForDownloadsWithUrlProtocolDelegate:completionHandler:");
}

id objc_msgSend_updateDarkPlacard(void *a1, const char *a2, ...)
{
  return _[a1 updateDarkPlacard];
}

id objc_msgSend_updateDarkReason(void *a1, const char *a2, ...)
{
  return _[a1 updateDarkReason];
}

id objc_msgSend_updateDescriptionText(void *a1, const char *a2, ...)
{
  return _[a1 updateDescriptionText];
}

id objc_msgSend_updateDisabledReason(void *a1, const char *a2, ...)
{
  return _[a1 updateDisabledReason];
}

id objc_msgSend_updateEnabled(void *a1, const char *a2, ...)
{
  return _[a1 updateEnabled];
}

id objc_msgSend_updateEntitlementState(void *a1, const char *a2, ...)
{
  return _[a1 updateEntitlementState];
}

id objc_msgSend_updateEpisode_andPlayerItem_withElapsedTime_andDuration_onMediaItemWillChange_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisode:andPlayerItem:withElapsedTime:andDuration:onMediaItemWillChange:");
}

id objc_msgSend_updateEpisode_withUPPMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisode:withUPPMetadata:");
}

id objc_msgSend_updateEpisodeForPlayerUpdateForceSave_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisodeForPlayerUpdateForceSave:");
}

id objc_msgSend_updateEpisodeObserverForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisodeObserverForPodcast:");
}

id objc_msgSend_updateEpisodesForSettings_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisodesForSettings:ctx:");
}

id objc_msgSend_updateEpisodesMetadataIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 updateEpisodesMetadataIdentifiers];
}

id objc_msgSend_updateFeedForFeedUrl_cloudSyncFeedUrl_podcastStoreId_triggerBy_userInitiated_forceBootstrap_useBackgroundFetch_source_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "updateFeedForFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetc h:source:completion:");
}

id objc_msgSend_updateFeedForFeedUrl_cloudSyncFeedUrl_podcastStoreId_triggerBy_userInitiated_forceBootstrap_useBackgroundFetch_source_isSubscribing_feedDownloadedHook_preProcessFeedHook_postProcessFeedHook_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "updateFeedForFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetc h:source:isSubscribing:feedDownloadedHook:preProcessFeedHook:postProcessFeedHook:completion:");
}

id objc_msgSend_updateFlagsForPodcastUuid_predicateForUnplayedTab_predicateForUserEpisodes_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFlagsForPodcastUuid:predicateForUnplayedTab:predicateForUserEpisodes:");
}

id objc_msgSend_updateFollowButton(void *a1, const char *a2, ...)
{
  return _[a1 updateFollowButton];
}

id objc_msgSend_updateFonts(void *a1, const char *a2, ...)
{
  return _[a1 updateFonts];
}

id objc_msgSend_updateFooterText(void *a1, const char *a2, ...)
{
  return _[a1 updateFooterText];
}

id objc_msgSend_updateFooterTextViewVisbility(void *a1, const char *a2, ...)
{
  return _[a1 updateFooterTextViewVisbility];
}

id objc_msgSend_updateGlobalDownloadPolicyIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 updateGlobalDownloadPolicyIfNecessary];
}

id objc_msgSend_updateIconView(void *a1, const char *a2, ...)
{
  return _[a1 updateIconView];
}

id objc_msgSend_updateIcons(void *a1, const char *a2, ...)
{
  return _[a1 updateIcons];
}

id objc_msgSend_updateIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 updateIdentifiers];
}

id objc_msgSend_updateIfNeededLayoutMarginsForViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIfNeededLayoutMarginsForViewWidth:");
}

id objc_msgSend_updateImageForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateImageForPodcast:");
}

id objc_msgSend_updateIsCurrentPlayerItemState(void *a1, const char *a2, ...)
{
  return _[a1 updateIsCurrentPlayerItemState];
}

id objc_msgSend_updateLabelsTextColorForFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLabelsTextColorForFocused:");
}

id objc_msgSend_updateLastTouchDate(void *a1, const char *a2, ...)
{
  return _[a1 updateLastTouchDate];
}

id objc_msgSend_updateLaunchCommandsWithConfigurationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLaunchCommandsWithConfigurationHandler:");
}

id objc_msgSend_updateListState(void *a1, const char *a2, ...)
{
  return _[a1 updateListState];
}

id objc_msgSend_updateListStateAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateListStateAnimated:");
}

id objc_msgSend_updateLocalCacheIfNeededWithData_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLocalCacheIfNeededWithData:version:");
}

id objc_msgSend_updateMetadataText(void *a1, const char *a2, ...)
{
  return _[a1 updateMetadataText];
}

id objc_msgSend_updateMoreButtonVisibility(void *a1, const char *a2, ...)
{
  return _[a1 updateMoreButtonVisibility];
}

id objc_msgSend_updateNotificationSettingsToMatchSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNotificationSettingsToMatchSubscription:");
}

id objc_msgSend_updateNowPlayingDurationSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 updateNowPlayingDurationSnapshot];
}

id objc_msgSend_updateNowPlayingTabVisibility(void *a1, const char *a2, ...)
{
  return _[a1 updateNowPlayingTabVisibility];
}

id objc_msgSend_updateOperationQueue(void *a1, const char *a2, ...)
{
  return _[a1 updateOperationQueue];
}

id objc_msgSend_updateOverlayForIsNew(void *a1, const char *a2, ...)
{
  return _[a1 updateOverlayForIsNew];
}

id objc_msgSend_updateOverlayForSelectedOrIsNew(void *a1, const char *a2, ...)
{
  return _[a1 updateOverlayForSelectedOrIsNew];
}

id objc_msgSend_updatePlayStatusIcons(void *a1, const char *a2, ...)
{
  return _[a1 updatePlayStatusIcons];
}

id objc_msgSend_updatePlayStatusViewImage(void *a1, const char *a2, ...)
{
  return _[a1 updatePlayStatusViewImage];
}

id objc_msgSend_updatePlaybackPositionWithEpisodeStoreId_completed_position_account_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaybackPositionWithEpisodeStoreId:completed:position:account:completion:");
}

id objc_msgSend_updatePlaybackSettingIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updatePlaybackSettingIfNeeded];
}

id objc_msgSend_updatePlaybackState(void *a1, const char *a2, ...)
{
  return _[a1 updatePlaybackState];
}

id objc_msgSend_updatePlaylist_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylist:inContext:");
}

id objc_msgSend_updatePlaylistWithUuid_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylistWithUuid:inContext:");
}

id objc_msgSend_updatePlaylistWithUuid_inContext_applyAdditionalChangesBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylistWithUuid:inContext:applyAdditionalChangesBlock:");
}

id objc_msgSend_updatePlaylistsWithUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylistsWithUuids:");
}

id objc_msgSend_updatePlaylistsWithUuids_context_applyAdditionalChangesBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:");
}

id objc_msgSend_updatePodcastCount(void *a1, const char *a2, ...)
{
  return _[a1 updatePodcastCount];
}

id objc_msgSend_updatePodcastWithEpisodeAdamId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithEpisodeAdamId:completion:");
}

id objc_msgSend_updatePodcastWithStoreId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithStoreId:completion:");
}

id objc_msgSend_updatePodcastWithUUID_userInitiated_forced_forceBootstrap_source_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithUUID:userInitiated:forced:forceBootstrap:source:completion:");
}

id objc_msgSend_updatePodcastWithUUID_userInitiated_source_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithUUID:userInitiated:source:completion:");
}

id objc_msgSend_updatePodcastWithUuid_withFeed_originalFeedUrl_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithUuid:withFeed:originalFeedUrl:source:");
}

id objc_msgSend_updatePodcastsToAdd_addingPodcastIfNeeded_hasLocalPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastsToAdd:addingPodcastIfNeeded:hasLocalPodcast:");
}

id objc_msgSend_updatePodcastsToUnsubscribe_remotePodcast_localPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastsToUnsubscribe:remotePodcast:localPodcast:");
}

id objc_msgSend_updatePopover(void *a1, const char *a2, ...)
{
  return _[a1 updatePopover];
}

id objc_msgSend_updatePredicate(void *a1, const char *a2, ...)
{
  return _[a1 updatePredicate];
}

id objc_msgSend_updatePredicateDuration(void *a1, const char *a2, ...)
{
  return _[a1 updatePredicateDuration];
}

id objc_msgSend_updatePreferredSkipDurationsFromUserDefaults_forCommandCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePreferredSkipDurationsFromUserDefaults:forCommandCenter:");
}

id objc_msgSend_updateRefreshControlEnabledState(void *a1, const char *a2, ...)
{
  return _[a1 updateRefreshControlEnabledState];
}

id objc_msgSend_updateRefreshEnabledState(void *a1, const char *a2, ...)
{
  return _[a1 updateRefreshEnabledState];
}

id objc_msgSend_updateRemoteSkipPreferenceFromDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRemoteSkipPreferenceFromDefaults:");
}

id objc_msgSend_updateRowHeight(void *a1, const char *a2, ...)
{
  return _[a1 updateRowHeight];
}

id objc_msgSend_updateSetting_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSetting:value:");
}

id objc_msgSend_updateSettingForSettingValueChangeByUpdatingCellAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:");
}

id objc_msgSend_updateSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettings:");
}

id objc_msgSend_updateSettingsForLocalPodcast_remotePodcast_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingsForLocalPodcast:remotePodcast:ctx:");
}

id objc_msgSend_updateSettingsIfNeededForLocalPodcast_remotePodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingsIfNeededForLocalPodcast:remotePodcast:");
}

id objc_msgSend_updateShowSetting_forSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateShowSetting:forSettings:");
}

id objc_msgSend_updateSizeIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updateSizeIfNeeded];
}

id objc_msgSend_updateStdDev(void *a1, const char *a2, ...)
{
  return _[a1 updateStdDev];
}

id objc_msgSend_updateStoreInfoForEpisodesAndPodcast_skipPodcastLastCheckDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStoreInfoForEpisodesAndPodcast:skipPodcastLastCheckDate:");
}

id objc_msgSend_updateStoreInfoForEpisodesInPodcast_withEpisodeIds_andEpisodesWithGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStoreInfoForEpisodesInPodcast:withEpisodeIds:andEpisodesWithGuid:");
}

id objc_msgSend_updateStoreInfoForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStoreInfoForPodcast:");
}

id objc_msgSend_updateSubscriptionsLastSyncTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 updateSubscriptionsLastSyncTimestamp];
}

id objc_msgSend_updateSubscriptionsLastSyncTimestampFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSubscriptionsLastSyncTimestampFor:");
}

id objc_msgSend_updateSubscriptionsSyncVersionFor_newValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSubscriptionsSyncVersionFor:newValue:");
}

id objc_msgSend_updateSubtitleOptions(void *a1, const char *a2, ...)
{
  return _[a1 updateSubtitleOptions];
}

id objc_msgSend_updateSubtitleOptionsAndSelection(void *a1, const char *a2, ...)
{
  return _[a1 updateSubtitleOptionsAndSelection];
}

id objc_msgSend_updateTTMLIDFrom_toNewID_hasDownloadedContent_forEpisodeAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTTMLIDFrom:toNewID:hasDownloadedContent:forEpisodeAdamID:");
}

id objc_msgSend_updateTextColors(void *a1, const char *a2, ...)
{
  return _[a1 updateTextColors];
}

id objc_msgSend_updateTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTitle:");
}

id objc_msgSend_updateTitleFontIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updateTitleFontIfNeeded];
}

id objc_msgSend_updateTitleIncludingIcons(void *a1, const char *a2, ...)
{
  return _[a1 updateTitleIncludingIcons];
}

id objc_msgSend_updateTranscriptInformation_transcriptSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTranscriptInformation:transcriptSource:");
}

id objc_msgSend_updateUPPEpisodeUuid_bookmarkTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUPPEpisodeUuid:bookmarkTime:");
}

id objc_msgSend_updateUPPIdentifierIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updateUPPIdentifierIfNeeded];
}

id objc_msgSend_updateUPPMetadata_fromUPPRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUPPMetadata:fromUPPRecord:");
}

id objc_msgSend_updateUPPTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 updateUPPTimestamp];
}

id objc_msgSend_updateUnplayedBadgeCount(void *a1, const char *a2, ...)
{
  return _[a1 updateUnplayedBadgeCount];
}

id objc_msgSend_updateUnplayedCount(void *a1, const char *a2, ...)
{
  return _[a1 updateUnplayedCount];
}

id objc_msgSend_updateWithModelObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithModelObject:");
}

id objc_msgSend_updateWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithObject:");
}

id objc_msgSend_updateWithPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPlayerItem:");
}

id objc_msgSend_updateWithPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPodcast:");
}

id objc_msgSend_updatedEpisodeCount(void *a1, const char *a2, ...)
{
  return _[a1 updatedEpisodeCount];
}

id objc_msgSend_updatedFeedURL(void *a1, const char *a2, ...)
{
  return _[a1 updatedFeedURL];
}

id objc_msgSend_updatedProperties(void *a1, const char *a2, ...)
{
  return _[a1 updatedProperties];
}

id objc_msgSend_updaterType(void *a1, const char *a2, ...)
{
  return _[a1 updaterType];
}

id objc_msgSend_updatesContainChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesContainChanges:");
}

id objc_msgSend_updatesContainsDeleteSection_sectionCountDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesContainsDeleteSection:sectionCountDict:");
}

id objc_msgSend_updatesContainsInsertSection_sectionCountDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesContainsInsertSection:sectionCountDict:");
}

id objc_msgSend_updatingCount(void *a1, const char *a2, ...)
{
  return _[a1 updatingCount];
}

id objc_msgSend_upgradeToAlternatePaidVersionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 upgradeToAlternatePaidVersionIfNeeded];
}

id objc_msgSend_upgradeToLocalEpisodeBackedItemWithEpisodeUUID_podcastUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upgradeToLocalEpisodeBackedItemWithEpisodeUUID:podcastUUID:");
}

id objc_msgSend_uppDataSource(void *a1, const char *a2, ...)
{
  return _[a1 uppDataSource];
}

id objc_msgSend_uppLastSyncTime(void *a1, const char *a2, ...)
{
  return _[a1 uppLastSyncTime];
}

id objc_msgSend_uppMetadataForMetadataIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppMetadataForMetadataIdentifier:");
}

id objc_msgSend_uppSyncDirtyFlag(void *a1, const char *a2, ...)
{
  return _[a1 uppSyncDirtyFlag];
}

id objc_msgSend_uppercaseStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseStringWithLocale:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_urlRawString(void *a1, const char *a2, ...)
{
  return _[a1 urlRawString];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return _[a1 urlRequest];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return _[a1 urlString];
}

id objc_msgSend_urlToOpenWhenApplicationHasFinishedLaunching(void *a1, const char *a2, ...)
{
  return _[a1 urlToOpenWhenApplicationHasFinishedLaunching];
}

id objc_msgSend_useBackgroundFetch(void *a1, const char *a2, ...)
{
  return _[a1 useBackgroundFetch];
}

id objc_msgSend_useBackgroundFetchForFeedDownloads(void *a1, const char *a2, ...)
{
  return _[a1 useBackgroundFetchForFeedDownloads];
}

id objc_msgSend_useLayoutForSkinnyPhones(void *a1, const char *a2, ...)
{
  return _[a1 useLayoutForSkinnyPhones];
}

id objc_msgSend_useSelfSizingCells(void *a1, const char *a2, ...)
{
  return _[a1 useSelfSizingCells];
}

id objc_msgSend_userAcceptedSyncTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 userAcceptedSyncTimestamp];
}

id objc_msgSend_userActivityContainsPlayhead(void *a1, const char *a2, ...)
{
  return _[a1 userActivityContainsPlayhead];
}

id objc_msgSend_userCanceledAuth(void *a1, const char *a2, ...)
{
  return _[a1 userCanceledAuth];
}

id objc_msgSend_userCancelledSignInBackOffUntil(void *a1, const char *a2, ...)
{
  return _[a1 userCancelledSignInBackOffUntil];
}

id objc_msgSend_userClampErrorWithTransaction_retrySeconds_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userClampErrorWithTransaction:retrySeconds:underlyingError:");
}

id objc_msgSend_userDeleted(void *a1, const char *a2, ...)
{
  return _[a1 userDeleted];
}

id objc_msgSend_userDeviceName(void *a1, const char *a2, ...)
{
  return _[a1 userDeviceName];
}

id objc_msgSend_userEpisode(void *a1, const char *a2, ...)
{
  return _[a1 userEpisode];
}

id objc_msgSend_userHasSomePodcasts(void *a1, const char *a2, ...)
{
  return _[a1 userHasSomePodcasts];
}

id objc_msgSend_userId(void *a1, const char *a2, ...)
{
  return _[a1 userId];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInfoValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfoValueForKey:");
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return _[a1 userInitiated];
}

id objc_msgSend_userInterfaceLayoutDirectionForSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirectionForSemanticContentAttribute:");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_userManifest(void *a1, const char *a2, ...)
{
  return _[a1 userManifest];
}

id objc_msgSend_userSpinnerView(void *a1, const char *a2, ...)
{
  return _[a1 userSpinnerView];
}

id objc_msgSend_userSwitchEffectView(void *a1, const char *a2, ...)
{
  return _[a1 userSwitchEffectView];
}

id objc_msgSend_userSwitchLabel(void *a1, const char *a2, ...)
{
  return _[a1 userSwitchLabel];
}

id objc_msgSend_userSwitchOverlayWindow(void *a1, const char *a2, ...)
{
  return _[a1 userSwitchOverlayWindow];
}

id objc_msgSend_userSwitchSnapshotView(void *a1, const char *a2, ...)
{
  return _[a1 userSwitchSnapshotView];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_usesCleanEpisodeTitles(void *a1, const char *a2, ...)
{
  return _[a1 usesCleanEpisodeTitles];
}

id objc_msgSend_uti(void *a1, const char *a2, ...)
{
  return _[a1 uti];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_uuidOrder(void *a1, const char *a2, ...)
{
  return _[a1 uuidOrder];
}

id objc_msgSend_uuidSet(void *a1, const char *a2, ...)
{
  return _[a1 uuidSet];
}

id objc_msgSend_uuidToManagedObjectIDMap(void *a1, const char *a2, ...)
{
  return _[a1 uuidToManagedObjectIDMap];
}

id objc_msgSend_uuidToPlayerItemMap(void *a1, const char *a2, ...)
{
  return _[a1 uuidToPlayerItemMap];
}

id objc_msgSend_uuids(void *a1, const char *a2, ...)
{
  return _[a1 uuids];
}

id objc_msgSend_validIndexPathsForIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validIndexPathsForIndexPaths:");
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return _[a1 validate];
}

id objc_msgSend_validateDataFromSuccessfulSetTransaction_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateDataFromSuccessfulSetTransaction:forKey:");
}

id objc_msgSend_validateDownloadedEpisodesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateDownloadedEpisodesWithCompletion:");
}

id objc_msgSend_validatedIdNumberFromStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validatedIdNumberFromStoreId:");
}

id objc_msgSend_validationError(void *a1, const char *a2, ...)
{
  return _[a1 validationError];
}

id objc_msgSend_validationManager(void *a1, const char *a2, ...)
{
  return _[a1 validationManager];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForIndex:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_valueSet(void *a1, const char *a2, ...)
{
  return _[a1 valueSet];
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGRect:");
}

id objc_msgSend_valueWithCGSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGSize:");
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCompletion:");
}

id objc_msgSend_vc(void *a1, const char *a2, ...)
{
  return _[a1 vc];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _[a1 vendorID];
}

id objc_msgSend_verboseDisplayString(void *a1, const char *a2, ...)
{
  return _[a1 verboseDisplayString];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_versionForGetTransaction_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionForGetTransaction:key:");
}

id objc_msgSend_versionForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionForKey:");
}

id objc_msgSend_versionMismatch(void *a1, const char *a2, ...)
{
  return _[a1 versionMismatch];
}

id objc_msgSend_vibrantImageView(void *a1, const char *a2, ...)
{
  return _[a1 vibrantImageView];
}

id objc_msgSend_videoIcon(void *a1, const char *a2, ...)
{
  return _[a1 videoIcon];
}

id objc_msgSend_videoViewWeakReferences(void *a1, const char *a2, ...)
{
  return _[a1 videoViewWeakReferences];
}

id objc_msgSend_videoViewsNeedPlayerUpdate(void *a1, const char *a2, ...)
{
  return _[a1 videoViewsNeedPlayerUpdate];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_viewDescriptionAction(void *a1, const char *a2, ...)
{
  return _[a1 viewDescriptionAction];
}

id objc_msgSend_viewDidLoad(void *a1, const char *a2, ...)
{
  return _[a1 viewDidLoad];
}

id objc_msgSend_viewStoreDescriptionAction(void *a1, const char *a2, ...)
{
  return _[a1 viewStoreDescriptionAction];
}

id objc_msgSend_visible(void *a1, const char *a2, ...)
{
  return _[a1 visible];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _[a1 visibleCells];
}

id objc_msgSend_visibleSupplementaryViewsOfKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleSupplementaryViewsOfKind:");
}

id objc_msgSend_visualEffectContainerView(void *a1, const char *a2, ...)
{
  return _[a1 visualEffectContainerView];
}

id objc_msgSend_waitingForScroll(void *a1, const char *a2, ...)
{
  return _[a1 waitingForScroll];
}

id objc_msgSend_waitsAfterPreparingMediaItems(void *a1, const char *a2, ...)
{
  return _[a1 waitsAfterPreparingMediaItems];
}

id objc_msgSend_wallpaperViewForVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wallpaperViewForVariant:");
}

id objc_msgSend_wasCanceled(void *a1, const char *a2, ...)
{
  return _[a1 wasCanceled];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _[a1 webpageURL];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitelistedClasses(void *a1, const char *a2, ...)
{
  return _[a1 whitelistedClasses];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_willConnectScene(void *a1, const char *a2, ...)
{
  return _[a1 willConnectScene];
}

id objc_msgSend_willDeletePersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willDeletePersistentId:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _[a1 workQueue];
}

id objc_msgSend_workQueueConcurrent(void *a1, const char *a2, ...)
{
  return _[a1 workQueueConcurrent];
}

id objc_msgSend_wrapperRevision(void *a1, const char *a2, ...)
{
  return _[a1 wrapperRevision];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToKeychain(void *a1, const char *a2, ...)
{
  return _[a1 writeToKeychain];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:error:");
}

id objc_msgSend_writingDirectionOfLine_maximumLinesShown_withWidth_lineBreakMode_cacheLayoutInfo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writingDirectionOfLine:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:");
}