@interface ConversationViewCoordinator
- (void)displayPluginSnippetWithIdentifier:(id)a3 viewIdentifier:(id)a4 data:(id)a5 bundleName:(id)a6 viewId:(id)a7 responseViewId:(id)a8 refIdentifier:(id)a9 snippetItemType:(id)a10;
@end

@implementation ConversationViewCoordinator

- (void)displayPluginSnippetWithIdentifier:(id)a3 viewIdentifier:(id)a4 data:(id)a5 bundleName:(id)a6 viewId:(id)a7 responseViewId:(id)a8 refIdentifier:(id)a9 snippetItemType:(id)a10
{
  uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v112 = v16;
  uint64_t v109 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v111 = v17;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v113 = self;
  swift_retain(self);
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  uint64_t v108 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  unint64_t v25 = v24;

  uint64_t v107 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  v27 = v26;

  uint64_t v106 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  v29 = v28;

  if (v21)
  {
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    v32 = v31;

    if (v22) {
      goto LABEL_3;
    }
LABEL_6:
    v34 = 0LL;
    if (v23) {
      goto LABEL_4;
    }
LABEL_7:
    v36 = 0LL;
    goto LABEL_8;
  }

  uint64_t v30 = 0LL;
  v32 = 0LL;
  if (!v22) {
    goto LABEL_6;
  }
LABEL_3:
  static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
  v34 = v33;

  if (!v23) {
    goto LABEL_7;
  }
LABEL_4:
  static String._unconditionallyBridgeFromObjectiveC(_:)(a10);
  v36 = v35;

LABEL_8:
  uint64_t v100 = v30;
  v37 = (_TtC6SiriTV27ConversationViewCoordinator *)v111;
  uint64_t v38 = v108;
  sub_4E568( v110,  (uint64_t)v112,  v109,  v111,  v108,  v25,  v107,  (uint64_t)v27,  v106,  (uint64_t)v29,  v100,  (uint64_t)v32,  v101,  v102,  v103,  v104,  v105,  (uint64_t)a10,  v106,  v107,  v108,  v109,  v110,  v111);
  swift_bridgeObjectRelease(v27, v39, v40, v41, v42, v43, v44, v45, v88, v94);
  swift_bridgeObjectRelease(v29, v46, v47, v48, v49, v50, v51, v52, v89, v95);
  swift_bridgeObjectRelease(v36, v53, v54, v55, v56, v57, v58, v59, v90, v96);
  swift_bridgeObjectRelease(v34, v60, v61, v62, v63, v64, v65, v66, v91, v97);
  swift_bridgeObjectRelease(v32, v67, v68, v69, v70, v71, v72, v73, v92, v98);
  sub_DA84(v38, v25);
  swift_release(v113);
  swift_bridgeObjectRelease(v112, v74, v75, v76, v77, v78, v79, v80, v93, v99);
  swift_bridgeObjectRelease(v37, v81, v82, v83, v84, v85, v86, v87, a9, a10);
}

@end