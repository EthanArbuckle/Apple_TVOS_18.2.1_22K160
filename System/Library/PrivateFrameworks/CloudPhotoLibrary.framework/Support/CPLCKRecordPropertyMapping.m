@interface CPLCKRecordPropertyMapping
+ (CPLCKRecordPropertyMapping)sharedInstance;
+ (NSSet)allSupportedClasses;
+ (NSSet)commonProperties;
- (BOOL)doesRecordClassSupportSparseRecords:(Class)a3;
- (BOOL)getPairedProperties:(id *)a3 andCKKeys:(id *)a4 forCKKey:(id)a5;
- (BOOL)getPairedProperties:(id *)a3 andCKKeys:(id *)a4 forProperty:(id)a5;
- (BOOL)isKeyReadOnly:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldSplitIndirectRecordForKey:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdateKeyOnBothRecords:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdateKeyOnPrivateRecord:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdateKeyOnSharedRecord:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdatePropertyOnPrivateRecord:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdatePropertyOnSharedRecord:(id)a3 recordClass:(Class)a4;
- (NSDictionary)allPrivateCKKeys;
- (NSDictionary)allPrivateProperties;
- (NSDictionary)allResourcesCKKeys;
- (NSDictionary)allSharedAndPrivateCKKeys;
- (NSDictionary)allSharedCKKeys;
- (NSDictionary)allSharedProperties;
- (NSDictionary)propertiesKeysPairings;
- (id)allTranslatedPropertiesForClass:(Class)a3;
- (id)initSharedInstance;
@end

@implementation CPLCKRecordPropertyMapping

+ (CPLCKRecordPropertyMapping)sharedInstance
{
  if (qword_100296240 != -1) {
    dispatch_once(&qword_100296240, &stru_100240C28);
  }
  return (CPLCKRecordPropertyMapping *)(id)qword_100296238;
}

+ (NSSet)commonProperties
{
  if (qword_100296280 != -1) {
    dispatch_once(&qword_100296280, &stru_100240E60);
  }
  return (NSSet *)(id)qword_100296278;
}

+ (NSSet)allSupportedClasses
{
  if (qword_100296250 != -1) {
    dispatch_once(&qword_100296250, &stru_100240C48);
  }
  return (NSSet *)(id)qword_100296248;
}

- (id)initSharedInstance
{
  v165.receiver = self;
  v165.super_class = (Class)&OBJC_CLASS___CPLCKRecordPropertyMapping;
  v73 = -[CPLCKRecordPropertyMapping init](&v165, "init");
  if (v73)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v78 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v76 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v74 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v163[0] = 0LL;
    v163[1] = v163;
    v163[2] = 0x3032000000LL;
    v163[3] = sub_100068DCC;
    v163[4] = sub_100068DDC;
    id v164 = 0LL;
    v161[0] = 0LL;
    v161[1] = v161;
    v161[2] = 0x3032000000LL;
    v161[3] = sub_100068DCC;
    v161[4] = sub_100068DDC;
    id v162 = 0LL;
    v160[0] = 0LL;
    v160[1] = v160;
    v160[2] = 0x2050000000LL;
    v160[3] = 0LL;
    v158[0] = 0LL;
    v158[1] = v158;
    v158[2] = 0x3032000000LL;
    v158[3] = sub_100068DCC;
    v158[4] = sub_100068DDC;
    id v159 = 0LL;
    v156[0] = 0LL;
    v156[1] = v156;
    v156[2] = 0x3032000000LL;
    v156[3] = sub_100068DCC;
    v156[4] = sub_100068DDC;
    id v157 = 0LL;
    v154[0] = 0LL;
    v154[1] = v154;
    v154[2] = 0x3032000000LL;
    v154[3] = sub_100068DCC;
    v154[4] = sub_100068DDC;
    id v155 = 0LL;
    v152[0] = 0LL;
    v152[1] = v152;
    v152[2] = 0x3032000000LL;
    v152[3] = sub_100068DCC;
    v152[4] = sub_100068DDC;
    id v153 = 0LL;
    v150[0] = 0LL;
    v150[1] = v150;
    v150[2] = 0x3032000000LL;
    v150[3] = sub_100068DCC;
    v150[4] = sub_100068DDC;
    id v151 = 0LL;
    v148[0] = 0LL;
    v148[1] = v148;
    v148[2] = 0x2020000000LL;
    char v149 = 0;
    v147[0] = 0LL;
    v147[1] = v147;
    v147[2] = 0x2020000000LL;
    v147[3] = 0LL;
    v145[0] = 0LL;
    v145[1] = v145;
    v145[2] = 0x3032000000LL;
    v145[3] = sub_100068DCC;
    v145[4] = sub_100068DDC;
    id v146 = 0LL;
    v143[0] = 0LL;
    v143[1] = v143;
    v143[2] = 0x3032000000LL;
    v143[3] = sub_100068DCC;
    v143[4] = sub_100068DDC;
    id v144 = 0LL;
    v133[0] = _NSConcreteStackBlock;
    v133[1] = 3221225472LL;
    v133[2] = sub_100068DE4;
    v133[3] = &unk_100240C70;
    v137 = v160;
    v138 = v158;
    v139 = v156;
    v69 = v3;
    v134 = v69;
    v67 = v4;
    v135 = v67;
    v140 = v163;
    v141 = v161;
    v142 = v145;
    v65 = v6;
    v136 = v65;
    v7 = objc_retainBlock(v133);
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472LL;
    v130[2] = sub_100068EF0;
    v130[3] = &unk_10023DD58;
    v132 = v160;
    v64 = v5;
    v131 = v64;
    v81 = objc_retainBlock(v130);
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472LL;
    v125[2] = sub_10006905C;
    v125[3] = &unk_100240CC0;
    v127 = v154;
    v128 = v150;
    v129 = v152;
    v8 = v7;
    id v126 = v8;
    v80 = objc_retainBlock(v125);
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472LL;
    v119[2] = sub_1000690C4;
    v119[3] = &unk_100240CE8;
    v123 = v154;
    v124 = v150;
    v9 = v78;
    v120 = v9;
    v63 = v76;
    v121 = v63;
    v61 = v8;
    id v122 = v61;
    v72 = objc_retainBlock(v119);
    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472LL;
    v118[2] = sub_100069164;
    v118[3] = &unk_100240D10;
    v118[4] = v163;
    v118[5] = v143;
    v118[6] = v145;
    v10 = objc_retainBlock(v118);
    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472LL;
    v117[2] = sub_1000691EC;
    v117[3] = &unk_10023DD30;
    v117[4] = v143;
    v11 = objc_retainBlock(v117);
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472LL;
    v114[2] = sub_100069200;
    v114[3] = &unk_100240D38;
    v12 = v10;
    id v115 = v12;
    v13 = v11;
    id v116 = v13;
    v71 = objc_retainBlock(v114);
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472LL;
    v105[2] = sub_100069230;
    v105[3] = &unk_100240D60;
    v108 = v143;
    SEL v113 = a2;
    v14 = v73;
    v106 = v14;
    v109 = v161;
    v110 = v148;
    v111 = v152;
    v62 = v74;
    v107 = v62;
    v112 = v160;
    v15 = objc_retainBlock(v105);
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472LL;
    v96[2] = sub_10006930C;
    v96[3] = &unk_100240D88;
    v98 = v154;
    v99 = v160;
    SEL v104 = a2;
    v16 = v14;
    v97 = v16;
    v100 = v163;
    v101 = v161;
    v102 = v150;
    v103 = v148;
    v17 = objc_retainBlock(v96);
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472LL;
    v88[2] = sub_10006938C;
    v88[3] = &unk_100240DB0;
    v90 = v148;
    SEL v95 = a2;
    v79 = v16;
    v89 = v79;
    v91 = v163;
    v92 = v158;
    v93 = v161;
    v94 = v156;
    v18 = objc_retainBlock(v88);
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472LL;
    v85[2] = sub_1000693F8;
    v85[3] = &unk_100240DD8;
    v87 = v147;
    v77 = v17;
    id v86 = v77;
    v19 = objc_retainBlock(v85);
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472LL;
    v82[2] = sub_10006942C;
    v82[3] = &unk_100240E00;
    v84 = v147;
    v75 = v18;
    id v83 = v75;
    v20 = objc_retainBlock(v82);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___CPLContainerRelationChange);
    ((void (*)(void *, uint64_t))v80[2])(v80, v21);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025AF50);
    v184 = @"itemId";
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v184, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v22);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025AF68);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025AF80);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v81[2])();
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___CPLAlbumChange);
    ((void (*)(void *, uint64_t))v80[2])(v80, v23);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025AF98);
    v183 = @"parentId";
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v183, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v24);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025AFB0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025AFC8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025AFE0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025AFF8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B010);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B028);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B040);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B058);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B070);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B088);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B0A0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B0B8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B0D0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B0E8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B100);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B118);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B130);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B148);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v81[2])();
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___CPLMemoryChange);
    ((void (*)(void *, uint64_t))v80[2])(v80, v25);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B160);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B178);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B190);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B1A8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B1C0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B1D8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B1F0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B208);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B220);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B238);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B250);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B268);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B280);
    v182 = @"createDate";
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v182, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v26);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B298);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B2B0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B2C8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B2E0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B2F8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B310);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B328);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B340);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B358);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B370);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B388);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B3A0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B3B8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B3D0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B3E8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B400);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B418);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B430);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B448);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B460);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B478);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B490);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B4A8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B4C0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B4D8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B4F0);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v81[2])();
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___CPLFaceCropChange);
    ((void (*)(void *, uint64_t))v80[2])(v80, v27);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B508);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B520);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B538);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B550);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B568);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B580);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B598);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B5B0);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v81[2])();
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___CPLPersonChange);
    ((void (*)(void *, uint64_t))v80[2])(v80, v28);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B5C8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B5E0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B5F8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B610);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B628);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B640);
    v13[2](v13);
    if (+[CPLPersonChange serverSupportsAssetSortOrder]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsAssetSortOrder"))
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B658);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B670);
      v13[2](v13);
    }

    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B688);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B6A0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B6B8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B6D0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B6E8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B700);
    v13[2](v13);
    if (+[CPLPersonChange serverSupportsDetectionType]( &OBJC_CLASS___CPLPersonChange,  "serverSupportsDetectionType"))
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B718);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B730);
      v13[2](v13);
    }

    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B748);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B760);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v81[2])();
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___CPLSuggestionChange);
    ((void (*)(void *, uint64_t))v80[2])(v80, v29);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B778);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B790);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B7A8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B7C0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B7D8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B7F0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B808);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B820);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B838);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B850);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B868);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B880);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B898);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B8B0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B8C8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B8E0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B8F8);
    v181 = @"createDate";
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v181, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v30);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B910);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B928);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B940);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B958);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B970);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B988);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B9A0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B9B8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025B9D0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025B9E8);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v81[2])();
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___CPLSocialGroupChange);
    ((void (*)(void *, uint64_t))v80[2])(v80, v31);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BA00);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BA18);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BA30);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BA48);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BA60);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BA78);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BA90);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BAA8);
    v13[2](v13);
    ((void (*)(void *, void *))v12[2])(v12, &__NSArray0__struct);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BAC0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BAD8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BAF0);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v81[2])();
    uint64_t v32 = objc_opt_class(&OBJC_CLASS___CPLMasterChange);
    ((void (*)(void *, uint64_t))v72[2])(v72, v32);
    ((void (*)(void *, uint64_t))v19[2])(v19, 8LL);
    ((void (*)(void *, _UNKNOWN **))v71[2])(v71, &off_10025BB08);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2LL);
    ((void (*)(void *, void))v77[2])(v77, 0LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BB20);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BB38);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BB50);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BB68);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BB80);
    v180 = @"originalCreationDate";
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v180, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v33);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BB98);
    v179 = @"importDate";
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v179, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v34);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BBB0);
    v178 = @"importGroupId";
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v178, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v35);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BBC8);
    v177 = @"mediaMetaDataType";
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v177, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v36);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BBE0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BBF8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BC10);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BC28);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BC40);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BC58);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BC70);
    v176 = @"originatingFingerprint";
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v176, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v37);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BC88);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BCA0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BCB8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BCD0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BCE8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BD00);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BD18);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BD30);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BD48);
    v175 = @"codec";
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v175, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v38);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BD60);
    v13[2](v13);
    ((void (*)(void *, void))v75[2])(v75, 0LL);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v81[2])();
    uint64_t v39 = objc_opt_class(&OBJC_CLASS___CPLAssetChange);
    ((void (*)(void *, uint64_t))v72[2])(v72, v39);
    ((void (*)(void *, uint64_t))v19[2])(v19, 8LL);
    ((void (*)(void *, _UNKNOWN **))v71[2])(v71, &off_10025BD78);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BD90);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BDA8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BDC0);
    v174 = @"syndicationId";
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v174, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v40);

    v13[2](v13);
    if (+[CPLAssetChange serverSupportsSharedLibrarySharingState]( &OBJC_CLASS___CPLAssetChange,  "serverSupportsSharedLibrarySharingState"))
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BDD8);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BDF0);
      v13[2](v13);
    }

    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BE08);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BE20);
    v13[2](v13);
    if (+[CPLAssetChange serverSupportsLastViewedDate]( &OBJC_CLASS___CPLAssetChange,  "serverSupportsLastViewedDate"))
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BE38);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BE50);
      v13[2](v13);
    }

    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BE68);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BE80);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BE98);
    v173 = @"lastSharedDate";
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v173, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v41);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BEB0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BEC8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BEE0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BEF8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BF10);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BF28);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BF40);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BF58);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BF70);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BF88);
    v13[2](v13);
    ((void (*)(void *, void *))v12[2])(v12, &__NSArray0__struct);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BFA0);
    v13[2](v13);
    ((void (*)(void *, uint64_t))v77[2])(v77, 1LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BFB8);
    v172[0] = @"assetDate";
    v172[1] = @"assetDateEnc";
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v172, 2LL));
    ((void (*)(void *, void *))v15[2])(v15, v42);

    v13[2](v13);
    ((void (*)(void *, uint64_t))v75[2])(v75, 1LL);
    ((void (*)(void *, void))v77[2])(v77, 0LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025BFD0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025BFE8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C000);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C018);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C030);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C048);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C060);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C078);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C090);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C0A8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C0C0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C0D8);
    v13[2](v13);
    ((void (*)(void *, void))v75[2])(v75, 0LL);
    ((void (*)(void *, void))v77[2])(v77, 0LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C0F0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C108);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C120);
    v171 = @"addedDate";
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v171, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v43);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C138);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C150);
    v13[2](v13);
    if (+[CPLAssetChange serverSupportsDeletedByUserIdentifier]( &OBJC_CLASS___CPLAssetChange,  "serverSupportsDeletedByUserIdentifier"))
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C168);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C180);
      v13[2](v13);
    }

    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C198);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C1B0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C1C8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C1E0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C1F8);
    v170 = @"burstId";
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v170, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v44);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C210);
    v169 = @"mediaGroupId";
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v169, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v45);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C228);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C240);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C258);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C270);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C288);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C2A0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C2B8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C2D0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C2E8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C300);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C318);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C330);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C348);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C360);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C378);
    v168 = @"timeZoneOffset";
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v168, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v46);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C390);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C3A8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C3C0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C3D8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C3F0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C408);
    v13[2](v13);
    ((void (*)(void *, void))v75[2])(v75, 0LL);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *, uint64_t))v19[2])(v19, 8LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C420);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C438);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C450);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C468);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C480);
    v167[0] = @"duration";
    v167[1] = @"durationEnc";
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v167, 2LL));
    ((void (*)(void *, void *))v15[2])(v15, v47);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C498);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C4B0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C4C8);
    v166 = @"adjustedMediaMetaDataStrType";
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v166, 1LL));
    ((void (*)(void *, void *))v15[2])(v15, v48);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C4E0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C4F8);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *, uint64_t))v19[2])(v19, 32LL);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_10025C510);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_10025C528);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v81[2])();
    allPrivateProperties = v79->_allPrivateProperties;
    v79->_allPrivateProperties = &v69->super;
    v70 = v69;

    allPrivateCKKeys = v79->_allPrivateCKKeys;
    v79->_allPrivateCKKeys = &v67->super;
    v68 = v67;

    propertiesKeysPairings = v79->_propertiesKeysPairings;
    v79->_propertiesKeysPairings = &v65->super;
    v66 = v65;

    allSharedProperties = v79->_allSharedProperties;
    v79->_allSharedProperties = &v9->super;
    v53 = v9;

    allSharedAndPrivateCKKeys = v79->_allSharedAndPrivateCKKeys;
    v79->_allSharedAndPrivateCKKeys = &v62->super;
    v55 = v62;

    allSharedCKKeys = v79->_allSharedCKKeys;
    v79->_allSharedCKKeys = &v63->super;
    v57 = v63;

    allResourcesCKKeys = v79->_allResourcesCKKeys;
    v79->_allResourcesCKKeys = &v64->super;
    v59 = v64;

    _Block_object_dispose(v143, 8);
    _Block_object_dispose(v145, 8);

    _Block_object_dispose(v147, 8);
    _Block_object_dispose(v148, 8);
    _Block_object_dispose(v150, 8);

    _Block_object_dispose(v152, 8);
    _Block_object_dispose(v154, 8);

    _Block_object_dispose(v156, 8);
    _Block_object_dispose(v158, 8);

    _Block_object_dispose(v160, 8);
    _Block_object_dispose(v161, 8);

    _Block_object_dispose(v163, 8);
  }

  return v73;
}

- (BOOL)getPairedProperties:(id *)a3 andCKKeys:(id *)a4 forProperty:(id)a5
{
  id v8 = a5;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v9 = self->_propertiesKeysPairings;
  id v10 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (objc_msgSend(v14, "hasProperty:", v8, (void)v17))
        {
          *a3 = (id)objc_claimAutoreleasedReturnValue([v14 properties]);
          *a4 = (id)objc_claimAutoreleasedReturnValue([v14 ckKeys]);
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }

      id v11 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)getPairedProperties:(id *)a3 andCKKeys:(id *)a4 forCKKey:(id)a5
{
  id v8 = a5;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v9 = self->_propertiesKeysPairings;
  id v10 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (objc_msgSend(v14, "hasCKKey:", v8, (void)v17))
        {
          *a3 = (id)objc_claimAutoreleasedReturnValue([v14 properties]);
          *a4 = (id)objc_claimAutoreleasedReturnValue([v14 ckKeys]);
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }

      id v11 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (id)allTranslatedPropertiesForClass:(Class)a3
{
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_allPrivateProperties, "objectForKeyedSubscript:"));
  if (!v6) {
    sub_100194DDC((uint64_t)a3, (uint64_t)a2, (uint64_t)self);
  }
  v7 = (void *)v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_allSharedProperties, "objectForKeyedSubscript:", a3));
  if ([v8 count])
  {
    id v9 = [v7 mutableCopy];
    [v9 unionSet:v8];
  }

  else
  {
    id v9 = v7;
  }

  return v9;
}

- (BOOL)shouldUpdatePropertyOnPrivateRecord:(id)a3 recordClass:(Class)a4
{
  allPrivateProperties = self->_allPrivateProperties;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](allPrivateProperties, "objectForKeyedSubscript:", a4));
  LOBYTE(allPrivateProperties) = [v7 containsObject:v6];

  return (char)allPrivateProperties;
}

- (BOOL)shouldUpdatePropertyOnSharedRecord:(id)a3 recordClass:(Class)a4
{
  allSharedProperties = self->_allSharedProperties;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](allSharedProperties, "objectForKeyedSubscript:", a4));
  LOBYTE(allSharedProperties) = [v7 containsObject:v6];

  return (char)allSharedProperties;
}

- (BOOL)isKeyReadOnly:(id)a3 recordClass:(Class)a4
{
  uint64_t v4 = qword_100296260;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_100296260, &stru_100240E20);
  }
  unsigned __int8 v6 = [(id)qword_100296258 containsObject:v5];

  return v6;
}

- (BOOL)doesRecordClassSupportSparseRecords:(Class)a3
{
  return objc_opt_class(&OBJC_CLASS___CPLAssetChange) == (void)a3;
}

- (BOOL)shouldSplitIndirectRecordForKey:(id)a3 recordClass:(Class)a4
{
  id v6 = a3;
  if ((Class)objc_opt_class(&OBJC_CLASS___CPLMasterChange) == a4
    || -[CPLCKRecordPropertyMapping shouldUpdateKeyOnBothRecords:recordClass:]( self,  "shouldUpdateKeyOnBothRecords:recordClass:",  v6,  a4))
  {
    BOOL v7 = 0;
  }

  else
  {
    BOOL v7 = -[CPLCKRecordPropertyMapping shouldUpdateKeyOnPrivateRecord:recordClass:]( self,  "shouldUpdateKeyOnPrivateRecord:recordClass:",  v6,  a4);
  }

  return v7;
}

- (BOOL)shouldUpdateKeyOnBothRecords:(id)a3 recordClass:(Class)a4
{
  id v6 = a3;
  if ((Class)objc_opt_class(&OBJC_CLASS___CPLMasterChange) == a4
    || (v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_allSharedAndPrivateCKKeys,  "objectForKeyedSubscript:",  a4)),  unsigned __int8 v8 = [v7 containsObject:v6],  v7,  (v8 & 1) != 0))
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    id v10 = sub_1000662B8();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    unsigned __int8 v9 = [v11 containsObject:v6];
  }

  return v9;
}

- (BOOL)shouldUpdateKeyOnPrivateRecord:(id)a3 recordClass:(Class)a4
{
  id v6 = a3;
  if (-[CPLCKRecordPropertyMapping shouldUpdateKeyOnBothRecords:recordClass:]( self,  "shouldUpdateKeyOnBothRecords:recordClass:",  v6,  a4))
  {
    unsigned __int8 v7 = 1;
  }

  else
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_allPrivateCKKeys, "objectForKeyedSubscript:", a4));
    unsigned __int8 v7 = [v8 containsObject:v6];
  }

  return v7;
}

- (BOOL)shouldUpdateKeyOnSharedRecord:(id)a3 recordClass:(Class)a4
{
  id v6 = a3;
  if ((Class)objc_opt_class(&OBJC_CLASS___CPLMasterChange) == a4)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_allSharedCKKeys, "objectForKeyedSubscript:", a4));
    if ([v7 containsObject:v6])
    {
      unsigned __int8 v8 = 1;
    }

    else
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_allResourcesCKKeys, "objectForKeyedSubscript:", a4));
      if ([v9 containsObject:v6])
      {
        unsigned __int8 v8 = 1;
      }

      else
      {
        id v10 = sub_1000662B8();
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        unsigned __int8 v8 = [v11 containsObject:v6];
      }
    }
  }

  return v8;
}

- (NSDictionary)allPrivateProperties
{
  return self->_allPrivateProperties;
}

- (NSDictionary)allPrivateCKKeys
{
  return self->_allPrivateCKKeys;
}

- (NSDictionary)allResourcesCKKeys
{
  return self->_allResourcesCKKeys;
}

- (NSDictionary)propertiesKeysPairings
{
  return self->_propertiesKeysPairings;
}

- (NSDictionary)allSharedProperties
{
  return self->_allSharedProperties;
}

- (NSDictionary)allSharedCKKeys
{
  return self->_allSharedCKKeys;
}

- (NSDictionary)allSharedAndPrivateCKKeys
{
  return self->_allSharedAndPrivateCKKeys;
}

- (void).cxx_destruct
{
}

@end