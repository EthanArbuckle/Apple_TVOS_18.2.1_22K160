@interface SACloneTreeWalker
+ (BOOL)isNodeID:(unint64_t)a3 oldestForDStreamID:(unint64_t)a4 forVolPath:(id)a5;
+ (id)getBundlesSetByPathForNodeID:(unint64_t)a3 forFsid:(fsid)a4 andPathList:(id)a5;
+ (id)getBundlesSetOfInode:(unint64_t)a3 withDirKey:(unint64_t)a4 andTag:(unint64_t)a5 inVolume:(statfs *)a6 usingPathList:(id)a7 andDirKeyCache:(id)a8;
+ (id)getDirInfoByDirKey:(unint64_t)a3 inVolume:(statfs *)a4 usingPathList:(id)a5 andDirKeyCache:(id)a6;
+ (void)addAttributedCloneToBundleSet:(id)a3 withCloneSize:(int64_t)a4 withPurgeableSize:(unint64_t)a5 onCloneData:(id)a6;
+ (void)addClonePathOfCloneID:(unint64_t)a3 FSId:(fsid *)a4 dataSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 dirStatKey:(unint64_t)a7 attributionTag:(unint64_t)a8 bundleSet:(id)a9 cloneData:(id)a10;
+ (void)addPurgeableCloneOfSize:(unint64_t)a3 isPurgeable:(BOOL)a4 withDirInfo:(id)a5 onCloneData:(id)a6;
+ (void)newFromAPFS:(unint64_t)a3 inVolume:(statfs *)a4 reply:(id)a5;
+ (void)processCloneMapOnVol:(id)a3 pathList:(id)a4 appSizeBreakdownList:(id)a5 dirKeyCache:(id)a6 collectClonesPaths:(BOOL)a7 reply:(id)a8;
+ (void)updateAppSizeBreakdownList:(unint64_t)a3 FSId:(fsid *)a4 dataSize:(unint64_t)a5 attributionTag:(unint64_t)a6 bundleSet:(id)a7 appSizeBreakdownList:(id)a8 pathList:(id)a9;
@end

@implementation SACloneTreeWalker

+ (void)newFromAPFS:(unint64_t)a3 inVolume:(statfs *)a4 reply:(id)a5
{
  id v7 = a5;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  __int128 v27 = 0u;
  __int128 v26 = 0u;
  __int128 v25 = 0u;
  __int128 v24 = 0u;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v21 = 0u;
  __int128 v20 = 0u;
  __int128 v19 = 0u;
  __int128 v18 = 0u;
  __int128 v17 = 0u;
  __int128 v16 = 0u;
  __int128 v14 = 0u;
  uint64_t v12 = 1LL;
  unint64_t v13 = 33LL;
  __int128 v15 = a3;
  uint64_t v8 = fsctl(a4->f_mntonname, 0xC1104A71uLL, &v12, 1u);
  if ((_DWORD)v8)
  {
    uint64_t v9 = SALog(v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003144C(v10);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4866LL,  0LL));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v11);
  }

  else
  {
    (*((void (**)(id, unint64_t, unint64_t, void))v7 + 2))( v7,  (v13 >> 2) & 1,  (v13 >> 3) & 1,  0LL);
  }
}

+ (id)getBundlesSetByPathForNodeID:(unint64_t)a3 forFsid:(fsid)a4 andPathList:(id)a5
{
  fsid v10 = a4;
  id v6 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SASupport getPathOfNodeID:FSid:](&OBJC_CLASS___SASupport, "getPathOfNodeID:FSid:", a3, &v10));
  if (v7) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 getBundlesSetForPath:v7]);
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

+ (id)getDirInfoByDirKey:(unint64_t)a3 inVolume:(statfs *)a4 usingPathList:(id)a5 andDirKeyCache:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v11 = v10;
  objc_sync_enter(v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  objc_sync_exit(v11);
  if (!v13)
  {
    f_mntonname = a4->f_mntonname;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    uint64_t v33 = 1LL;
    unint64_t v34 = 33LL;
    __int128 v36 = a3;
    uint64_t v15 = fsctl(a4->f_mntonname, 0xC1104A71uLL, &v33, 1u);
    if ((_DWORD)v15)
    {
      unint64_t v16 = a3;
LABEL_4:
      uint64_t v17 = SALog(v15);
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100031530(v16, v18);
      }

      id v13 = 0LL;
    }

    else
    {
      int v20 = 0;
      unint64_t v16 = a3;
      while (1)
      {
        v20 |= (v34 >> 3) & 1;
        if ((v34 & 4) != 0)
        {
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v16));
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v9 getBundlesSetForDirStatID:v21]);

          if (v22)
          {
            id v13 = +[SADirCacheElement newWithBundleSet:purgeable:cacheFolder:]( &OBJC_CLASS___SADirCacheElement,  "newWithBundleSet:purgeable:cacheFolder:",  v22,  v20 & 1,  0LL);

            goto LABEL_18;
          }
        }

        unint64_t v16 = *((void *)&v36 + 1);
        if (!*((void *)&v36 + 1)) {
          break;
        }
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        uint64_t v33 = 1LL;
        unint64_t v34 = 33LL;
        *(void *)&__int128 v36 = v16;
        uint64_t v15 = fsctl(f_mntonname, 0xC1104A71uLL, &v33, 1u);
        if ((_DWORD)v15) {
          goto LABEL_4;
        }
      }

      uint64_t v23 = SALog(v15);
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_1000314CC(a3, v24, v25, v26, v27, v28, v29, v30);
      }

      id v13 = +[SADirCacheElement newWithBundleSet:purgeable:cacheFolder:]( &OBJC_CLASS___SADirCacheElement,  "newWithBundleSet:purgeable:cacheFolder:",  0LL,  0LL,  0LL);
LABEL_18:
      if (v13)
      {
        id v31 = v11;
        objc_sync_enter(v31);
        [v31 setObject:v13 forKey:v32];
        objc_sync_exit(v31);
      }
    }
  }

  return v13;
}

+ (id)getBundlesSetOfInode:(unint64_t)a3 withDirKey:(unint64_t)a4 andTag:(unint64_t)a5 inVolume:(statfs *)a6 usingPathList:(id)a7 andDirKeyCache:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  if (a4)
  {
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1 getDirInfoByDirKey:a4 inVolume:a6 usingPathList:v14 andDirKeyCache:v15]);
    uint64_t v17 = v16;
    if (v16)
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 bundlesSet]);

      if (v18)
      {
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 bundlesSet]);

        goto LABEL_11;
      }
    }
  }

  if (a5
    && (uint64_t v20 = objc_claimAutoreleasedReturnValue( +[SAAttributionTag getBundleIdForTag:onVolumeName:]( &OBJC_CLASS___SAAttributionTag,  "getBundleIdForTag:onVolumeName:",  a5,  a6->f_mntonname))) != 0)
  {
    __int128 v21 = (void *)v20;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v20));
  }

  else
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( [a1 getBundlesSetByPathForNodeID:a3 forFsid:*(void *)&a6->f_fsid andPathList:v14]);
    if (!v19) {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"com.apple.fakeapp.SystemData"));
    }
  }

+ (void)addClonePathOfCloneID:(unint64_t)a3 FSId:(fsid *)a4 dataSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 dirStatKey:(unint64_t)a7 attributionTag:(unint64_t)a8 bundleSet:(id)a9 cloneData:(id)a10
{
  id v20 = a9;
  id v16 = a10;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SASupport getPathOfNodeID:FSid:](&OBJC_CLASS___SASupport, "getPathOfNodeID:FSid:", a3, a4));
  if (v17)
  {
    id v18 = +[SACloneInfo newWithDataSize:cloneSize:purgeableSize:dirStatKey:attributionTag:clonePath:]( &OBJC_CLASS___SACloneInfo,  "newWithDataSize:cloneSize:purgeableSize:dirStatKey:attributionTag:clonePath:",  a5,  a5,  a6,  a7,  a8,  v17);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v20]);
    [v19 addCloneInfo:v18];
  }
}

+ (void)updateAppSizeBreakdownList:(unint64_t)a3 FSId:(fsid *)a4 dataSize:(unint64_t)a5 attributionTag:(unint64_t)a6 bundleSet:(id)a7 appSizeBreakdownList:(id)a8 pathList:(id)a9
{
  id v18 = a7;
  id v14 = a8;
  id v15 = a9;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SASupport getPathOfNodeID:FSid:](&OBJC_CLASS___SASupport, "getPathOfNodeID:FSid:", a3, a4));
  if (v16)
  {
    if (a6)
    {
      [v14 updateTagsWithCloneSize:a5 bundleId:v18];
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 findAncestorOfPath:v16]);
      [v14 updatePath:v17 cloneSize:a5 bundleId:v18];
    }
  }
}

+ (void)addAttributedCloneToBundleSet:(id)a3 withCloneSize:(int64_t)a4 withPurgeableSize:(unint64_t)a5 onCloneData:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  id v13 = +[SACloneSize newWithDataSize:cloneSize:purgeableSize:]( &OBJC_CLASS___SACloneSize,  "newWithDataSize:cloneSize:purgeableSize:",  a4,  a4,  a5);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

    [v12 updateWithSizeInfo:v13];
    id v10 = v12;
  }

  else
  {
    [v9 setObject:v13 forKeyedSubscript:v10];
  }
}

+ (void)addPurgeableCloneOfSize:(unint64_t)a3 isPurgeable:(BOOL)a4 withDirInfo:(id)a5 onCloneData:(id)a6
{
  BOOL v7 = a4;
  id v16 = a5;
  id v9 = a6;
  if (v16)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v16 bundlesSet]);

    if (v10)
    {
      id v11 = objc_opt_new(&OBJC_CLASS___SACloneSize);
      if (v7) {
        -[SACloneSize setDataSize:](v11, "setDataSize:", (char *)-[SACloneSize dataSize](v11, "dataSize") + a3);
      }
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v16 bundlesSet]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v12]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v16 bundlesSet]);
      if (v13)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
        [v15 updateWithSizeInfo:v11];
      }

      else
      {
        [v9 setObject:v11 forKeyedSubscript:v14];
      }
    }
  }
}

+ (void)processCloneMapOnVol:(id)a3 pathList:(id)a4 appSizeBreakdownList:(id)a5 dirKeyCache:(id)a6 collectClonesPaths:(BOOL)a7 reply:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v90 = a5;
  id v94 = a6;
  id v16 = (void (**)(id, void, void *))a8;
  uint64_t v17 = SALog(v16);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100031794((uint64_t)v14, v18, v19, v20, v21, v22, v23, v24);
  }

  bzero(&v101, 0x878uLL);
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  100LL));
  id v25 = v14;
  if (statfs((const char *)[v25 UTF8String], &v101))
  {
    uint64_t v26 = __error();
    uint64_t v27 = *v26;
    uint64_t v28 = SALog(v26);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100031728(v27, v29, v30);
    }

    NSErrorDomain v31 = NSPOSIXErrorDomain;
    uint64_t v32 = v27;
LABEL_7:
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v31,  v32,  0LL));
    v16[2](v16, 0LL, v33);

    unint64_t v34 = 0LL;
    __int128 v35 = 0LL;
    __int128 v36 = 0LL;
    goto LABEL_16;
  }

  __int128 v37 = (char *)malloc(0x1D4C0uLL);
  if (!v37)
  {
    uint64_t v44 = SALog(0LL);
    __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_1000315C8(v45);
    }

    NSErrorDomain v31 = NSPOSIXErrorDomain;
    uint64_t v32 = 12LL;
    goto LABEL_7;
  }

  uint64_t v95 = 0x100000001LL;
  uint64_t v99 = 0x1D4C000000000LL;
  v100 = v37;
  v78 = v37;
  uint64_t v96 = 0LL;
  unint64_t v97 = 0LL;
  __int128 v98 = xmmword_10003C670;
  uint64_t v38 = fsctl(v101.f_mntonname, 0xC0384A74uLL, &v95, 1u);
  if ((_DWORD)v38)
  {
    int v39 = v38;
    unint64_t v34 = 0LL;
    __int128 v35 = 0LL;
    goto LABEL_11;
  }

  uint64_t v76 = (uint64_t)v25;
  v77 = v16;
  uint64_t v46 = 0LL;
  unint64_t v47 = 0LL;
  uint64_t v91 = 0LL;
  __int128 v35 = 0LL;
  unint64_t v48 = 0LL;
  uint64_t v88 = 0LL;
  uint64_t v89 = 0LL;
  uint64_t v87 = 0LL;
  unint64_t v34 = 0LL;
  int v79 = !v9;
  int v93 = 1;
  do
  {
    if (HIDWORD(v99)) {
      BOOL v49 = 1;
    }
    else {
      BOOL v49 = v46 == 0;
    }
    if (!v49)
    {
      if ((v93 & 1) != 0) {
        uint64_t v65 = 0LL;
      }
      else {
        uint64_t v65 = v91;
      }
      if ((v93 & 1) != 0) {
        uint64_t v66 = v91;
      }
      else {
        uint64_t v66 = 0LL;
      }
      uint64_t v67 = objc_claimAutoreleasedReturnValue( [a1 getBundlesSetOfInode:v48 withDirKey:v88 andTag:v89 inVolume:&v101 usingPathList:v15 andDirKeyCache:v94]);

      if (!v35 || ([v35 cacheFolder] & 1) == 0)
      {
        [a1 addAttributedCloneToBundleSet:v67 withCloneSize:v65 withPurgeableSize:v66 onCloneData:v86];
        if (!((v90 == 0LL) | v93 & 1)) {
          [a1 updateAppSizeBreakdownList:v48 FSId:&v101.f_fsid dataSize:v65 attributionTag:v89 bundleSet:v67 appSizeBreakdownList:v90 pathList:v15];
        }
      }

      if (((v79 | v93) & 1) == 0) {
        [a1 addClonePathOfCloneID:v48 FSId:&v101.f_fsid dataSize:v65 purgeableSize:v66 dirStatKey:v87 attributionTag:v89 bundleSet:v67 cloneData:v86];
      }
      __int128 v36 = 0LL;
      unint64_t v34 = (void *)v67;
      id v25 = (id)v76;
      id v16 = v77;
      goto LABEL_15;
    }

    if (HIDWORD(v99) < 0x18)
    {
      id v25 = (id)v76;
      id v16 = v77;
      if (!HIDWORD(v99))
      {
        uint64_t v68 = SALog(v38);
        v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
          sub_100031644(v76, v69, v70, v71, v72, v73, v74, v75);
        }
      }

      NSErrorDomain v42 = NSPOSIXErrorDomain;
      uint64_t v43 = 5LL;
      goto LABEL_14;
    }

    uint64_t v50 = v46;
    if (HIDWORD(v99) != 24)
    {
      uint64_t v51 = 0LL;
      v81 = v100;
      unint64_t v82 = HIDWORD(v99);
      v80 = v100 + 48;
      int v85 = 24;
      v52 = v34;
      while (1)
      {
        v53 = &v81[v51];
        if (v50 && *(void *)v53 != v50)
        {
          uint64_t v54 = v91;
          if ((v93 & 1) != 0) {
            uint64_t v55 = 0LL;
          }
          else {
            uint64_t v55 = v91;
          }
          if ((v93 & 1) == 0) {
            uint64_t v54 = 0LL;
          }
          uint64_t v92 = v54;
          unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( [a1 getBundlesSetOfInode:v48 withDirKey:v88 andTag:v89 inVolume:&v101 usingPathList:v15 andDirKeyCache:v94]);

          if (!v35 || ([v35 cacheFolder] & 1) == 0)
          {
            [a1 addAttributedCloneToBundleSet:v34 withCloneSize:v55 withPurgeableSize:v92 onCloneData:v86];
            if (!((v90 == 0LL) | v93 & 1)) {
              [a1 updateAppSizeBreakdownList:v48 FSId:&v101.f_fsid dataSize:v55 attributionTag:v89 bundleSet:v34 appSizeBreakdownList:v90 pathList:v15];
            }
          }

          if (((v79 | v93) & 1) == 0) {
            [a1 addClonePathOfCloneID:v48 FSId:&v101.f_fsid dataSize:v55 purgeableSize:v92 dirStatKey:v87 attributionTag:v89 bundleSet:v34 cloneData:v86];
          }
          uint64_t v87 = 0LL;
          uint64_t v88 = 0LL;
          uint64_t v89 = 0LL;
          unint64_t v48 = 0LL;
          int v93 = 1;
        }

        else
        {
          unint64_t v34 = v52;
        }

        uint64_t v91 = *((void *)v53 + 1);
        int v83 = *((void *)v53 + 2);
        uint64_t v84 = *(void *)v53;
        if (*((void *)v53 + 2)) {
          break;
        }
LABEL_71:
        uint64_t v50 = v84;
        uint64_t v51 = (v85 + 32 * v83);
        v52 = v34;
        int v85 = v51 + 24;
        if (v51 + 24 >= v82) {
          goto LABEL_72;
        }
      }

      v56 = &v80[v51];
      uint64_t v57 = *((void *)v53 + 2);
      while (2)
      {
        unint64_t v47 = *((void *)v56 - 3);
        uint64_t v58 = *((void *)v56 - 1);
        uint64_t v59 = *(void *)v56 & 1LL;

        if (v58
          && (v60 = (void *)objc_claimAutoreleasedReturnValue( [a1 getDirInfoByDirKey:v58 inVolume:&v101 usingPathList:v15 andDirKeyCache:v94])) != 0)
        {
          __int128 v35 = v60;
          if (([v60 cacheFolder] & 1) == 0)
          {
            [a1 addPurgeableCloneOfSize:v91 isPurgeable:v59 withDirInfo:v35 onCloneData:v86];
            int v61 = [v35 purgeable] ? 1 : v59;
            LOBYTE(v59) = v61 != 0;
            if (v90)
            {
              if (v61)
              {
                uint64_t v62 = *((void *)v56 - 2);
                v63 = (void *)objc_claimAutoreleasedReturnValue([v35 bundlesSet]);
                [a1 updateAppSizeBreakdownList:v47 FSId:&v101.f_fsid dataSize:v91 attributionTag:v62 bundleSet:v63 appSizeBreakdownList:v90 pathList:v15];

                unint64_t v34 = 0LL;
                goto LABEL_67;
              }
            }
          }

          unint64_t v34 = 0LL;
          if ((v59 & 1) != 0)
          {
LABEL_67:
            v56 += 32;
            if (!--v57) {
              goto LABEL_71;
            }
            continue;
          }
        }

        else if (*((void *)v56 - 2))
        {
          unint64_t v34 = 0LL;
          __int128 v35 = 0LL;
          if (v59)
          {
            __int128 v35 = 0LL;
            goto LABEL_67;
          }
        }

        else
        {
          unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( [a1 getBundlesSetByPathForNodeID:v47 forFsid:*(void *)&v101.f_fsid andPathList:v15]);
          __int128 v35 = 0LL;
          if (v59) {
            goto LABEL_67;
          }
        }

        break;
      }

      v64 = (void *)objc_claimAutoreleasedReturnValue([v35 bundlesSet]);
      if (v64 || *((void *)v56 - 2))
      {

LABEL_64:
        if (v48 - 1 >= v47)
        {
          int v93 = 0;
          uint64_t v88 = v58;
          uint64_t v89 = *((void *)v56 - 2);
          uint64_t v87 = *((void *)v56 - 1);
          unint64_t v48 = v47;
          goto LABEL_67;
        }
      }

      else if (v34)
      {
        goto LABEL_64;
      }

      int v93 = 0;
      goto LABEL_67;
    }

+ (BOOL)isNodeID:(unint64_t)a3 oldestForDStreamID:(unint64_t)a4 forVolPath:(id)a5
{
  id v7 = a5;
  bzero(&v34, 0x878uLL);
  id v8 = v7;
  if (statfs((const char *)[v8 UTF8String], &v34))
  {
    BOOL v9 = __error();
    int v10 = *v9;
    uint64_t v11 = SALog(v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100031888(v10, v12, v13);
    }
LABEL_4:

    BOOL v14 = 0;
    goto LABEL_35;
  }

  id v15 = (char *)malloc(0x1D4C0uLL);
  if (!v15)
  {
    uint64_t v20 = SALog(0LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000317F8(v12);
    }
    goto LABEL_4;
  }

  v29[0] = 0x100000001LL;
  uint64_t v33 = v15;
  __int128 v32 = xmmword_10003C680;
  unint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  v29[1] = a4;
  HIDWORD(v32) = 120000;
  uint64_t v16 = fsctl(v34.f_mntonname, 0xC0384A74uLL, v29, 1u);
  if ((_DWORD)v16)
  {
    unint64_t v17 = -1LL;
LABEL_8:
    uint64_t v18 = SALog(v16);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000316A8();
    }
  }

  else
  {
    unint64_t v21 = 0LL;
    unint64_t v17 = -1LL;
    while (HIDWORD(v32) >= 0x18)
    {
      if (HIDWORD(v32) != 24)
      {
        uint64_t v22 = 0LL;
        int v23 = 24;
        while (*(void *)&v33[v22] == a4)
        {
          uint64_t v24 = *(void *)&v33[v22 + 16];
          if (v24)
          {
            id v25 = &v33[v22 + 24];
            uint64_t v26 = v24;
            while (1)
            {
              unint64_t v21 = *(void *)v25;
              if ((v25[24] & 1) == 0 && v21 < v17)
              {
                unint64_t v17 = *(void *)v25;
                if (v21 < a3) {
                  break;
                }
              }

              v25 += 32;
              if (!--v26) {
                goto LABEL_26;
              }
            }

            unint64_t v17 = *(void *)v25;
            goto LABEL_29;
          }

@end