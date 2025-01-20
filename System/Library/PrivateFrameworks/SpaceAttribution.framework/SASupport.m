@interface SASupport
+ (BOOL)isFileCloned:(const char *)a3;
+ (BOOL)isFilePurgeable:(const char *)a3;
+ (BOOL)isItemMountedOnSystemVolume:(id)a3;
+ (BOOL)targetDeviceIsHomePod;
+ (BOOL)targetDeviceIsIpad;
+ (BOOL)targetDeviceIsWatch;
+ (BOOL)volumeSupportsAttributionTags:(id)a3;
+ (BOOL)volumeSupportsCloneMapping:(id)a3;
+ (id)getEnterpriseVolumesPaths;
+ (id)getFSPurgeableDataOnVolumes:(id)a3;
+ (id)getPathOfNodeID:(unint64_t)a3 FSid:(fsid *)a4;
+ (id)getPathOfiNode:(unint64_t)a3 inVolume:(statfs *)a4;
+ (id)getResolvedURL:(id)a3;
+ (id)getURLMountPoint:(id)a3;
+ (id)getVolumesPaths;
+ (int)enableDirStatInfoForPath:(id)a3 withOptions:(int64_t)a4 andGetInfo:(id *)a5;
+ (int)enableDirStatsForPath:(id)a3 withOptions:(int64_t)a4;
+ (int)getDirStatInfoForPath:(id)a3 withOptions:(int64_t)a4 info:(id *)a5;
+ (unint64_t)getCloneDstreamIDForPath:(id)a3;
+ (unint64_t)getDirStatKeyForOriginID:(unint64_t)a3 ofMount:(char *)a4;
+ (unint64_t)getFSPurgeableOnVolume:(id)a3 purgeableUrgency:(unint64_t)a4;
+ (unint64_t)getINodeForDirStatKey:(unint64_t)a3 ofMount:(char *)a4;
+ (unint64_t)getInodeIDForPath:(id)a3;
+ (void)getLSAppRecordForBundle:(id)a3 reply:(id)a4;
+ (void)getVolSizeFromAttrList:(const char *)a3 completionHandler:(id)a4;
+ (void)markTimeEndForPhase:(id)a3;
+ (void)markTimeStartForPhase:(id)a3;
@end

@implementation SASupport

+ (BOOL)isItemMountedOnSystemVolume:(id)a3
{
  id v3 = a3;
  uint64_t v4 = statfs((const char *)[v3 fileSystemRepresentation], &v8);
  if ((_DWORD)v4)
  {
    uint64_t v5 = SALog(v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100030A38();
    }

    LOBYTE(v6) = 0;
  }

  else
  {
    LODWORD(v6) = (BYTE1(v8.f_flags) >> 6) & 1;
  }

  return (char)v6;
}

+ (int)enableDirStatsForPath:(id)a3 withOptions:(int64_t)a4
{
  char v4 = a4;
  uint64_t v5 = (const char *)[a3 fileSystemRepresentation];
  int v6 = (int)v5;
  __int128 v36 = 0u;
  __int128 v35 = 0u;
  if ((v4 & 1) != 0) {
    uint64_t v7 = 284LL;
  }
  else {
    uint64_t v7 = 28LL;
  }
  __int128 v34 = 0uLL;
  __int128 v33 = 0uLL;
  __int128 v32 = 0uLL;
  __int128 v31 = 0uLL;
  __int128 v30 = 0uLL;
  __int128 v29 = 0uLL;
  __int128 v28 = 0uLL;
  __int128 v27 = 0uLL;
  __int128 v26 = 0uLL;
  __int128 v25 = 0uLL;
  __int128 v24 = 0uLL;
  __int128 v23 = 0uLL;
  __int128 v22 = 0uLL;
  __int128 v21 = 0uLL;
  v20[0] = 0x100000001LL;
  v20[1] = v7;
  uint64_t v8 = fsctl(v5, 0xC1104A71uLL, v20, 1u);
  if (!(_DWORD)v8)
  {
    uint64_t v18 = SALog(v8);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100030AE4();
    }
    int v10 = 0;
    goto LABEL_11;
  }

  v9 = __error();
  int v10 = *v9;
  if (*v9 != 2)
  {
    uint64_t v11 = SALog(v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100030B60(v6, v10, v12, v13, v14, v15, v16, v17);
    }
LABEL_11:
  }

  return v10;
}

+ (id)getPathOfiNode:(unint64_t)a3 inVolume:(statfs *)a4
{
  if (fsgetpath(v6, 0x400uLL, &a4->f_fsid, a3) < 1) {
    char v4 = 0LL;
  }
  else {
    char v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v6,  4LL));
  }
  return v4;
}

+ (unint64_t)getDirStatKeyForOriginID:(unint64_t)a3 ofMount:(char *)a4
{
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v21 = 0u;
  __int128 v20 = 0u;
  __int128 v19 = 0u;
  __int128 v18 = 0u;
  __int128 v17 = 0u;
  __int128 v16 = 0u;
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  __int128 v10 = 0u;
  v8[2] = 0LL;
  __int128 v9 = 0u;
  v8[0] = 1LL;
  v8[1] = 3LL;
  v8[3] = a3;
  uint64_t v4 = fsctl(a4, 0xC1104A71uLL, v8, 1u);
  if (!(_DWORD)v4) {
    return v9;
  }
  uint64_t v5 = SALog(v4);
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100030BD4();
  }

  return 0LL;
}

+ (unint64_t)getINodeForDirStatKey:(unint64_t)a3 ofMount:(char *)a4
{
  __int128 v24 = 0u;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v21 = 0u;
  __int128 v20 = 0u;
  __int128 v19 = 0u;
  __int128 v18 = 0u;
  __int128 v17 = 0u;
  __int128 v16 = 0u;
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  v8[0] = 1LL;
  v8[1] = 33LL;
  __int128 v10 = a3;
  uint64_t v4 = fsctl(a4, 0xC1104A71uLL, v8, 0);
  if (!(_DWORD)v4) {
    return *((void *)&v9 + 1);
  }
  uint64_t v5 = SALog(v4);
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100030C40();
  }

  return 0LL;
}

+ (int)getDirStatInfoForPath:(id)a3 withOptions:(int64_t)a4 info:(id *)a5
{
  char v6 = a4;
  __int128 v29 = 0u;
  memset(v30, 0, sizeof(v30));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v25 = 1LL;
  uint64_t v26 = 1LL;
  id v7 = a3;
  uint64_t v8 = fsctl((const char *)objc_msgSend(v7, "fileSystemRepresentation", 1), 0xC1104A71uLL, &v25, 1u);
  if ((_DWORD)v8)
  {
    __int128 v9 = __error();
    int v10 = *v9;
    if (*v9 != 45)
    {
      uint64_t v11 = SALog(v9);
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100030E3C((int)v7, v10, v12, v13, v14, v15, v16, v17);
      }
    }

    goto LABEL_20;
  }

  if ((v26 & 4) == 0)
  {
    uint64_t v18 = SALog(v8);
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100030CAC();
    }
LABEL_19:

    int v10 = 93;
    goto LABEL_20;
  }

  if ((~(_BYTE)v27 & 3) != 0)
  {
    uint64_t v21 = SALog(v8);
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100030DD8();
    }
    goto LABEL_19;
  }

  if ((v26 & 0x10) != 0)
  {
    uint64_t v22 = SALog(v8);
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100030D74();
    }
    goto LABEL_19;
  }

  if ((v6 & 1) != 0 && (v26 & 0x100) != 0)
  {
    uint64_t v20 = SALog(v8);
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100030D10();
    }
    goto LABEL_19;
  }

  int v10 = 0;
  if (a5)
  {
    unint64_t v24 = v28;
    a5->var0 = v30[0].i64[0];
    *(int8x16_t *)&a5->var1 = vextq_s8(*(int8x16_t *)((char *)v30 + 8), *(int8x16_t *)((char *)v30 + 8), 8uLL);
    a5->var3 = v24;
  }

+ (int)enableDirStatInfoForPath:(id)a3 withOptions:(int64_t)a4 andGetInfo:(id *)a5
{
  id v7 = a3;
  int v8 = +[SASupport enableDirStatsForPath:withOptions:]( &OBJC_CLASS___SASupport,  "enableDirStatsForPath:withOptions:",  v7,  a4);
  if (!v8) {
    int v8 = +[SASupport getDirStatInfoForPath:withOptions:info:]( &OBJC_CLASS___SASupport,  "getDirStatInfoForPath:withOptions:info:",  v7,  a4,  a5);
  }

  return v8;
}

+ (BOOL)targetDeviceIsIpad
{
  if (qword_10005AA30 != -1) {
    dispatch_once(&qword_10005AA30, &stru_10004CAB8);
  }
  return byte_10005AA28;
}

+ (BOOL)targetDeviceIsHomePod
{
  if (qword_10005AA40 != -1) {
    dispatch_once(&qword_10005AA40, &stru_10004CAD8);
  }
  return byte_10005AA38;
}

+ (void)markTimeStartForPhase:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AA48;
  objc_sync_enter(v4);
  if (!qword_10005AA48)
  {
    uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    char v6 = (void *)qword_10005AA48;
    qword_10005AA48 = (uint64_t)v5;
  }

  id v7 = objc_opt_new(&OBJC_CLASS___SATimeVal);
  gettimeofday(-[SATimeVal getTimeValAddr](v7, "getTimeValAddr"), 0LL);
  uint64_t v8 = SALog([(id)qword_10005AA48 setObject:v7 forKeyedSubscript:v3]);
  __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "START: App Sizer %@", (uint8_t *)&v10, 0xCu);
  }

  objc_sync_exit(v4);
}

+ (void)markTimeEndForPhase:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AA48;
  objc_sync_enter(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AA48 objectForKeyedSubscript:v3]);

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AA48 objectForKeyedSubscript:v3]);
    id v8 = [v7 timeVal];
    int v10 = v9;

    uint64_t v11 = gettimeofday(&v18, 0LL);
    uint64_t tv_usec = v18.tv_usec;
    __darwin_time_t tv_sec = v18.tv_sec;
    uint64_t v14 = SALog(v11);
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v3;
      __int16 v21 = 2048;
      double v22 = (float)((float)(1000000 * (tv_sec - (uint64_t)v8) - v10 + tv_usec) / 1000000.0);
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "END: App Sizer %@ (%lf)", buf, 0x16u);
    }

    [(id)qword_10005AA48 removeObjectForKey:v3];
  }

  else
  {
    uint64_t v16 = SALog(v6);
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100030EB0();
    }
  }

  objc_sync_exit(v4);
}

+ (BOOL)volumeSupportsAttributionTags:(id)a3
{
  __int128 v11 = xmmword_10003C614;
  uint64_t v12 = 0LL;
  LODWORD(v10) = 0;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = a3;
  uint64_t v4 = getattrlist((const char *)objc_msgSend(v3, "UTF8String", 0, 0, 0, 0, v10), &v11, &v8, 0x24uLL, 0);
  if ((_DWORD)v4)
  {
    uint64_t v5 = SALog(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100030F14();
    }

    LOBYTE(v6) = 0;
  }

  else
  {
    LODWORD(v6) = (BYTE10(v9) >> 6) & 1;
  }

  return (char)v6;
}

+ (BOOL)volumeSupportsCloneMapping:(id)a3
{
  __int128 v11 = xmmword_10003C614;
  uint64_t v12 = 0LL;
  LODWORD(v10) = 0;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = a3;
  uint64_t v4 = getattrlist((const char *)objc_msgSend(v3, "UTF8String", 0, 0, 0, 0, v10), &v11, &v8, 0x24uLL, 0);
  if ((_DWORD)v4)
  {
    uint64_t v5 = SALog(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100030F78();
    }

    LOBYTE(v6) = 0;
  }

  else
  {
    LODWORD(v6) = (BYTE7(v9) >> 2) & 1;
  }

  return (char)v6;
}

+ (id)getResolvedURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]), v5, v5))
  {
    bzero(v14, 0x420uLL);
    id v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path", xmmword_10003C62C, 0));
    id v7 = (const char *)[v6 fileSystemRepresentation];

    uint64_t v8 = getattrlist(v7, &v13, v14, 0x420uLL, 0);
    if ((v8 & 0x80000000) != 0)
    {
      uint64_t v11 = SALog(v8);
      __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100030FDC();
      }
      id v10 = 0LL;
    }

    else
    {
      if (!v15[1])
      {
        id v10 = 0LL;
        goto LABEL_12;
      }

      __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  (char *)v15 + v15[0]));
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v9, 1LL));
    }
  }

  else
  {
    id v10 = v4;
  }

+ (id)getURLMountPoint:(id)a3
{
  id v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path", xmmword_10003C644, 0));
  uint64_t v5 = (const char *)[v4 fileSystemRepresentation];

  uint64_t v6 = getattrlist(v5, &v11, v12, 0x40CuLL, 1u);
  if ((v6 & 0x80000000) != 0)
  {
    uint64_t v8 = SALog(v6);
    __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100031064();
    }

    goto LABEL_7;
  }

  if (!v13[1])
  {
LABEL_7:
    id v7 = 0LL;
    return v7;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  (char *)v13 + v13[0]));
  return v7;
}

+ (BOOL)targetDeviceIsWatch
{
  if (qword_10005AA58 != -1) {
    dispatch_once(&qword_10005AA58, &stru_10004CAF8);
  }
  return byte_10005AA50;
}

+ (void)getLSAppRecordForBundle:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(id, id, id))a4;
  id v6 = a3;
  id v9 = 0LL;
  id v7 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v9];

  id v8 = v9;
  v5[2](v5, v8, v7);
}

+ (id)getPathOfNodeID:(unint64_t)a3 FSid:(fsid *)a4
{
  if (fsgetpath(v11, 0x400uLL, a4, a3) < 0)
  {
    id v6 = __error();
    int v7 = *v6;
    uint64_t v8 = SALog(v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000310EC(v7, a3, v9);
    }

    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
  }

  return v5;
}

+ (id)getFSPurgeableDataOnVolumes:(id)a3
{
  id v3 = a3;
  uint64_t v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v3;
  id v22 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v33;
    id v4 = &selRef_setWithObjects_;
    uint64_t v5 = &APFSOverProvModel_ptr;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v6;
        uint64_t v7 = *(void *)(*((void *)&v32 + 1) + 8 * v6);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id v25 = (id)objc_claimAutoreleasedReturnValue([&off_1000501E8 allKeys]);
        id v8 = [v25 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v29;
          do
          {
            __int128 v11 = 0LL;
            id v24 = v9;
            do
            {
              if (*(void *)v29 != v10) {
                objc_enumerationMutation(v25);
              }
              uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v11);
              context = objc_autoreleasePoolPush();
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([&off_1000501E8 objectForKeyedSubscript:v12]);
              id v14 = [v13 longLongValue];

              id v15 = [v4 + 473 getFSPurgeableOnVolume:v7 purgeableUrgency:v14];
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v26, "valueForKey:", v7));
              if (v16)
              {
                int v17 = (void *)objc_claimAutoreleasedReturnValue([v5[42] numberWithUnsignedLongLong:v15]);
                [v16 setObject:v17 forKey:v12];
              }

              else
              {
                timeval v18 = (void *)objc_claimAutoreleasedReturnValue([v5[42] numberWithUnsignedLongLong:v15]);
                int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v18,  v12,  0LL));

                id v4 = &selRef_setWithObjects_;
                uint64_t v5 = &APFSOverProvModel_ptr;
                id v9 = v24;
                -[NSMutableDictionary setValue:forKey:](v26, "setValue:forKey:", v17, v7);
              }

              objc_autoreleasePoolPop(context);
              __int128 v11 = (char *)v11 + 1;
            }

            while (v9 != v11);
            id v9 = [v25 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }

          while (v9);
        }

        uint64_t v6 = v23 + 1;
      }

      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v22);
  }

  return v26;
}

+ (unint64_t)getFSPurgeableOnVolume:(id)a3 purgeableUrgency:(unint64_t)a4
{
  uint64_t v28 = 0LL;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v13 = 0LL;
  __int128 v15 = 0u;
  unint64_t v14 = a4;
  id v5 = a3;
  uint64_t v6 = fsctl( (const char *)objc_msgSend( v5,  "fileSystemRepresentation",  __PAIR128__(v14, 0),  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),  0xC0E84A70uLL,  &v13,  1u);
  if ((v6 & 0x80000000) != 0)
  {
    uint64_t v8 = SALog(v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = __error();
      __int128 v11 = strerror(*v10);
      *(_DWORD *)buf = 138412802;
      id v30 = v5;
      __int16 v31 = 2048;
      unint64_t v32 = a4;
      __int16 v33 = 2080;
      __int128 v34 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Failed to get FSPurgeable data of urgency (%llu) with error: %s",  buf,  0x20u);
    }

    unint64_t v7 = 0LL;
  }

  else
  {
    unint64_t v7 = v22;
  }

  return v7;
}

+ (BOOL)isFilePurgeable:(const char *)a3
{
  uint64_t v3 = fsctl(a3, 0x40084A47uLL, v7, 1u);
  if (!(_DWORD)v3) {
    return (v7[1] & 0xE) != 0;
  }
  uint64_t v4 = SALog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10003116C(v5);
  }

  return 0;
}

+ (BOOL)isFileCloned:(const char *)a3
{
  uint64_t v3 = fsctl(a3, 0x40104A0EuLL, v8, 1u);
  if ((_DWORD)v3)
  {
    uint64_t v4 = SALog(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000311E0(v5);
    }

    LOBYTE(v6) = 0;
  }

  else
  {
    return (v8[0] >> 1) & 1;
  }

  return v6;
}

+ (unint64_t)getInodeIDForPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = stat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0), &v9);
  if ((_DWORD)v4)
  {
    uint64_t v5 = SALog(v4);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100031254();
    }

    __darwin_ino64_t st_ino = 0LL;
  }

  else
  {
    __darwin_ino64_t st_ino = v9.st_ino;
  }

  return st_ino;
}

+ (unint64_t)getCloneDstreamIDForPath:(id)a3
{
  uint64_t v3 = fsctl((const char *)[a3 fileSystemRepresentation], 0x40104A0EuLL, v7, 1u);
  if (!(_DWORD)v3) {
    return v7[1];
  }
  uint64_t v4 = SALog(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000311E0(v5);
  }

  return 0LL;
}

+ (void)getVolSizeFromAttrList:(const char *)a3 completionHandler:(id)a4
{
  v17[2] = 0LL;
  v17[0] = 5LL;
  v17[1] = 2692743172LL;
  uint64_t v5 = (void (**)(id, uint64_t, uint64_t, void *))a4;
  uint64_t v6 = getattrlist(a3, v17, v13, 0x1CuLL, 1u);
  int v7 = v6;
  uint64_t v8 = SALog(v6);
  stat v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int128 v19 = "+[SASupport getVolSizeFromAttrList:completionHandler:]";
      __int16 v20 = 2080;
      __int128 v21 = a3;
      __int16 v22 = 2048;
      uint64_t v23 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s: Can't get volume size for %s (err %li)",  buf,  0x20u);
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v7,  0LL));
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000312B8((uint64_t)a3, (uint64_t)v13, v10);
    }

    __int128 v11 = 0LL;
  }

  if (v15 <= v16) {
    unint64_t v12 = v16;
  }
  else {
    unint64_t v12 = v15;
  }
  v5[2](v5, v12, v14, v11);
}

+ (id)getVolumesPaths
{
  if (qword_10005AA68 != -1) {
    dispatch_once(&qword_10005AA68, &stru_10004CB18);
  }
  return (id)qword_10005AA60;
}

+ (id)getEnterpriseVolumesPaths
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SASupport getVolumesPaths](&OBJC_CLASS___SASupport, "getVolumesPaths"));
  __int16 v20 = 0;
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)qword_10005AA70;
  qword_10005AA70 = (uint64_t)v3;

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      stat v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v16 + 1) + 8LL * (void)v9);
        uint64_t v11 = fsctl((const char *)objc_msgSend(v10, "fileSystemRepresentation", (void)v16), 0x40024A6CuLL, &v20, 0);
        if ((_DWORD)v11)
        {
          uint64_t v12 = SALog(v11);
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            sub_1000313E4(v21, &v22, v13);
          }
        }

        else if (v20 == 576)
        {
          [(id)qword_10005AA70 addObject:v10];
        }

        stat v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }

    while (v7);
  }

  id v14 = (id)qword_10005AA70;
  return v14;
}

@end