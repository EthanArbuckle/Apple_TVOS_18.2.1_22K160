@interface KatanaSubscriptionCoordinator
+ (_TtC9appstored29KatanaSubscriptionCoordinator)shared;
- (BOOL)migrateSubscriptionStateWithAccount:(id)a3 logKey:(id)a4;
- (BOOL)removeStaleSubscriptionInfoWithLogKey:(id)a3;
- (BOOL)updateSubscriptionInfoWithEntitlement:(id)a3 account:(id)a4 logKey:(id)a5;
- (_TtC9appstored29KatanaSubscriptionCoordinator)init;
- (id)subscriptionInfoDictionaryWithAccount:(id)a3 onlyReturnForPreviouslySubscribedAccount:(BOOL)a4 logKey:(id)a5;
@end

@implementation KatanaSubscriptionCoordinator

- (_TtC9appstored29KatanaSubscriptionCoordinator)init
{
  return (_TtC9appstored29KatanaSubscriptionCoordinator *)sub_10001E070();
}

+ (_TtC9appstored29KatanaSubscriptionCoordinator)shared
{
  if (qword_100458028 != -1) {
    swift_once(&qword_100458028, sub_10001E1F0);
  }
  return (_TtC9appstored29KatanaSubscriptionCoordinator *)(id)qword_1004628C0;
}

- (BOOL)migrateSubscriptionStateWithAccount:(id)a3 logKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10001E260(v6, v7);

  return v9 & 1;
}

- (BOOL)removeStaleSubscriptionInfoWithLogKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001EF20(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (id)subscriptionInfoDictionaryWithAccount:(id)a3 onlyReturnForPreviouslySubscribedAccount:(BOOL)a4 logKey:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  sub_1000223C8(v8, v9, (uint64_t)v50);
  sub_100026CD4((uint64_t)v50, (uint64_t)v124, &qword_100458D78);
  if (!v6
    || (sub_100026CD4((uint64_t)v50, (uint64_t)v87, &qword_100458D78), sub_100026C6C((uint64_t)v87) == 1)
    || v88 == 2)
  {
    sub_100026CD4((uint64_t)v50, (uint64_t)&v51, &qword_100458D78);
    if (sub_100026C6C((uint64_t)&v51) == 1)
    {
LABEL_11:

      return 0LL;
    }

    char v49 = !v6;
    uint64_t v11 = v51;
    char v86 = v52;
    uint64_t v12 = v53;
    __int128 v13 = v55;
    uint64_t v14 = v56;
    uint64_t v15 = v58;
    uint64_t v16 = v60;
    uint64_t v17 = v62;
    uint64_t v18 = v64;
    uint64_t v19 = v66;
    uint64_t v20 = v68;
    __int128 v21 = v72;
    uint64_t v46 = v70;
    uint64_t v47 = v73;
    __int128 v22 = v75;
    uint64_t v48 = v76;
    char v23 = v84 & 1;
    char v24 = v80 & 1;
    char v25 = v77 & 1;
    __int128 v26 = v78;
    char v27 = v74 & 1;
    char v28 = v71 & 1;
    uint64_t v45 = v79;
    char v29 = v69 & 1;
    char v30 = v67 & 1;
    char v31 = v65 & 1;
    char v32 = v63 & 1;
    __int128 v34 = v81;
    __int128 v33 = v82;
    char v35 = v61 & 1;
    char v36 = v59 & 1;
    uint64_t v37 = v83;
    char v38 = v57 & 1;
    char v39 = v54 & 1;
    char v40 = v52 & 1;
    char v41 = v85;
  }

  else
  {
    char v49 = v88 & 1;
    sub_100026CD4((uint64_t)v124, (uint64_t)&v89, &qword_100458D78);
    char v41 = v123;
    char v23 = v122;
    __int128 v34 = v119;
    __int128 v33 = v120;
    uint64_t v37 = v121;
    char v24 = v118;
    __int128 v26 = v116;
    char v25 = v115;
    __int128 v22 = v113;
    uint64_t v47 = v111;
    uint64_t v48 = v114;
    char v27 = v112;
    __int128 v21 = v110;
    uint64_t v45 = v117;
    uint64_t v46 = v108;
    char v28 = v109;
    uint64_t v20 = v106;
    char v29 = v107;
    uint64_t v19 = v104;
    char v30 = v105;
    uint64_t v18 = v102;
    char v31 = v103;
    uint64_t v17 = v100;
    char v32 = v101;
    uint64_t v16 = v98;
    char v35 = v99;
    uint64_t v15 = v96;
    char v36 = v97;
    uint64_t v14 = v94;
    char v38 = v95;
    __int128 v13 = v93;
    uint64_t v12 = v91;
    char v39 = v92;
    uint64_t v11 = v89;
    char v40 = v90;
  }

  uint64_t v89 = v11;
  char v90 = v40;
  uint64_t v91 = v12;
  char v92 = v39;
  __int128 v93 = v13;
  uint64_t v94 = v14;
  char v95 = v38;
  uint64_t v96 = v15;
  char v97 = v36;
  uint64_t v98 = v16;
  char v99 = v35;
  uint64_t v100 = v17;
  char v101 = v32;
  uint64_t v102 = v18;
  char v103 = v31;
  uint64_t v104 = v19;
  char v105 = v30;
  uint64_t v106 = v20;
  char v107 = v29;
  uint64_t v108 = v46;
  char v109 = v28;
  __int128 v110 = v21;
  uint64_t v111 = v47;
  char v112 = v27;
  __int128 v113 = v22;
  uint64_t v114 = v48;
  char v115 = v25;
  __int128 v116 = v26;
  uint64_t v117 = v45;
  char v118 = v24;
  __int128 v119 = v34;
  __int128 v120 = v33;
  uint64_t v121 = v37;
  char v122 = v23;
  char v123 = v41;
  if ((v49 & 1) == 0)
  {
    sub_100026B64( (uint64_t)v50,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_100026BF8);
    goto LABEL_11;
  }

  uint64_t v42 = sub_10001F690(v9);
  sub_100026B64( (uint64_t)v50,  (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_100026BF8);

  if (v42)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v42);
    return isa;
  }

  return 0LL;
}

- (BOOL)updateSubscriptionInfoWithEntitlement:(id)a3 account:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = self;
  LOBYTE(v7) = sub_10001FF0C(v7, v10, v11);

  return v7 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9appstored29KatanaSubscriptionCoordinator_hardwareBundlePromoScenarios));
  v3 = (char *)self + OBJC_IVAR____TtC9appstored29KatanaSubscriptionCoordinator_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end