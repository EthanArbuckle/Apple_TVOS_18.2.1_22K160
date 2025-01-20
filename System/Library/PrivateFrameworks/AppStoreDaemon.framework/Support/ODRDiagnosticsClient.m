@interface ODRDiagnosticsClient
- (void)allRegisteredODRAppsWithReply:(id)a3;
- (void)assetsForBundleID:(id)a3 withReply:(id)a4;
- (void)cancelMaintenanceWithReply:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 withCompletion:(id)a4;
- (void)expireAssetURLSForBundleIDs:(id)a3 withReply:(id)a4;
- (void)fakeWorkWithCount:(id)a3 reply:(id)a4;
- (void)fetchManifestForAdamID:(id)a3 externalVersionID:(id)a4 variant:(id)a5 withFetchCompletion:(id)a6;
- (void)getSimulatedBandwidthWithReply:(id)a3;
- (void)getSpaceReductionWithReply:(id)a3;
- (void)loadSourceURL:(id)a3 intoDestinationURL:(id)a4 isUrgent:(BOOL)a5 isStreaming:(BOOL)a6 withRequestCompletion:(id)a7;
- (void)manifestDictionaryForBundleID:(id)a3 withReply:(id)a4;
- (void)nonPurgeableAssetsWithReply:(id)a3;
- (void)pauseRequestWithUUID:(id)a3 withCompletion:(id)a4;
- (void)performMaintenanceWithReply:(id)a3;
- (void)prefetchAndRequestSourceURL:(id)a3 intoDestinationURL:(id)a4 withCompletion:(id)a5;
- (void)prefetchSourceURL:(id)a3 intoDestinationURL:(id)a4 withPrefetchCompletion:(id)a5;
- (void)prefetchThenRequestSourceURL:(id)a3 intoDestinationURL:(id)a4 withCompletion:(id)a5;
- (void)purgeAllAssetsForApplication:(id)a3 withRequestCompletion:(id)a4;
- (void)purgeAllAssetsForApplications:(id)a3 withRequestCompletion:(id)a4;
- (void)purgeAssetWithIdentifier:(id)a3 withRequestCompletion:(id)a4;
- (void)purgeBytes:(int64_t)a3 odrOnly:(BOOL)a4 urgency:(int)a5 withReply:(id)a6;
- (void)purgeableAssetsWithReply:(id)a3;
- (void)registerManifest:(id)a3 forBundleID:(id)a4 withRequestCompletion:(id)a5;
- (void)resumeRequestWithUUID:(id)a3 withCompletion:(id)a4;
- (void)setLoggingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setSampler:(id)a3 enabled:(BOOL)a4 samplingInterval:(double)a5 reply:(id)a6;
- (void)setSimulatedBandwidth:(unint64_t)a3 withReply:(id)a4;
- (void)setSpaceReduction:(unint64_t)a3 withReply:(id)a4;
- (void)statusWithReply:(id)a3;
- (void)testPurgeBytes:(int64_t)a3 urgency:(int)a4 withReply:(id)a5;
@end

@implementation ODRDiagnosticsClient

- (void)manifestDictionaryForBundleID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_1002C28A8;
  v19 = sub_1002C28B8;
  id v20 = 0LL;
  v7 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002C28C0;
  v12[3] = &unk_1003EED90;
  id v11 = v8;
  id v13 = v11;
  v14 = &v15;
  [v10 readUsingSession:v12];

  v6[2](v6, v16[5], 0LL);
  _Block_object_dispose(&v15, 8);
}

- (void)allRegisteredODRAppsWithReply:(id)a3
{
  v3 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_1002C28A8;
  id v11 = sub_1002C28B8;
  id v12 = 0LL;
  id v4 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002C2B78;
  v6[3] = &unk_1003E9BB8;
  v6[4] = &v7;
  [v5 readUsingSession:v6];

  v3[2](v3, v8[5], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)assetsForBundleID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v81 = (void (**)(id, void *, void))a4;
  uint64_t v112 = 0LL;
  v113 = &v112;
  uint64_t v114 = 0x3032000000LL;
  v115 = sub_1002C28A8;
  v116 = sub_1002C28B8;
  id v117 = 0LL;
  uint64_t v106 = 0LL;
  v107 = &v106;
  uint64_t v108 = 0x3032000000LL;
  v109 = sub_1002C28A8;
  v110 = sub_1002C28B8;
  id v111 = 0LL;
  v79 = v5;
  v6 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472LL;
  v102[2] = sub_1002C3524;
  v102[3] = &unk_1003F0040;
  v104 = &v112;
  id v80 = v7;
  id v103 = v80;
  v105 = &v106;
  [v9 readUsingSession:v102];

  id v10 = (id)v107[5];
  if (self)
  {
    v92 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    __int128 v118 = 0u;
    __int128 v119 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v118 objects:v126 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v119;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v119 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v118 + 1) + 8LL * (void)i);
          id v16 = sub_10023AC24(v15);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v92,  "objectForKeyedSubscript:",  v17));

          if (!v18) {
            v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray addObject:](v18, "addObject:", v15);
          id v19 = sub_10023AC24(v15);
          id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v92, "setObject:forKeyedSubscript:", v18, v20);
        }

        id v12 = [v11 countByEnumeratingWithState:&v118 objects:v126 count:16];
      }

      while (v12);
    }
  }

  else
  {
    v92 = 0LL;
  }

  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  obunint64_t j = (id)v113[5];
  id v86 = [obj countByEnumeratingWithState:&v98 objects:v125 count:16];
  if (v86)
  {
    uint64_t v83 = *(void *)v99;
    do
    {
      v91 = 0LL;
      do
      {
        if (*(void *)v99 != v83) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v98 + 1) + 8LL * (void)v91);
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        v123[0] = @"bundleID";
        id v22 = sub_1001F7970(v21);
        v90 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v124[0] = v90;
        v123[1] = @"size";
        id v23 = sub_1001F7C8C(v21);
        v89 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v124[1] = v89;
        v123[2] = @"lastUsedDate";
        uint64_t v24 = objc_claimAutoreleasedReturnValue([v21 valueForProperty:@"last_used_date"]);
        v88 = (void *)v24;
        v25 = @"-Unknown-";
        if (v24) {
          v25 = (const __CFString *)v24;
        }
        v124[2] = v25;
        v123[3] = @"isOnDevice";
        v26 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_1001F8338(v21));
        v87 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v124[3] = v87;
        v123[4] = @"purgeable";
        v27 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_1001F7C0C(v21));
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        v124[4] = v28;
        v123[5] = @"isStreamable";
        id v29 = sub_1001F7AFC(v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v124[5] = v30;
        v123[6] = @"pinCount";
        v31 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", sub_1001F7BA8(v21));
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v124[6] = v32;
        v123[7] = @"chunkSize";
        id v33 = sub_1001F7994(v21);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v124[7] = v34;
        v123[8] = @"md5";
        id v35 = sub_1001F7B84(v21);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v124[8] = v36;
        v123[9] = @"downloadPriority";
        id v37 = sub_1001F79DC(v21);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v124[9] = v38;
        v123[10] = @"downloadIdentifier";
        id v39 = sub_1001F79B8(v21);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v124[10] = v40;
        v123[11] = @"humanReadablePurgeReason";
        v41 = sub_100195C68(v21);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v124[11] = v42;
        v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v124,  v123,  12LL));
        [v93 addEntriesFromDictionary:v43];

        id v44 = sub_1001F7B20(v21);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

        if (v45)
        {
          id v46 = sub_1001F7B20(v21);
          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue([v47 absoluteString]);
          [v93 setObject:v48 forKeyedSubscript:@"localURL"];
        }

        id v49 = sub_1001F7AB4(v21);
        id v50 = (id)objc_claimAutoreleasedReturnValue(v49);
        v51 = v50;
        if (self)
        {
          uint64_t v52 = (uint64_t)[v50 count];
          v53 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
          v54 = v53;
          if (v52 < 1)
          {
            -[NSMutableString appendFormat:](v53, "appendFormat:", @"No hashes");
          }

          else
          {
            for (unint64_t j = 0LL; j != v52; ++j)
            {
              uint64_t v56 = objc_claimAutoreleasedReturnValue([v51 objectAtIndex:j]);
              v57 = (void *)v56;
              if (j >= v52 - 1) {
                v58 = @"%@";
              }
              else {
                v58 = @"%@, ";
              }
              -[NSMutableString appendFormat:](v54, "appendFormat:", v58, v56);
            }
          }
        }

        else
        {
          v54 = 0LL;
        }

        [v93 setObject:v54 forKeyedSubscript:@"Hashes"];
        id v59 = sub_1001F7A00(v21);
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v59));
        [v93 setObject:v60 forKeyedSubscript:@"effectivelyAlwaysPreserve"];

        v61 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_1001F7A40(v21));
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        [v93 setObject:v62 forKeyedSubscript:@"effectivePreservationPriority"];

        if ((_DWORD)v59)
        {
          v63 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          __int128 v96 = 0u;
          __int128 v97 = 0u;
          __int128 v94 = 0u;
          __int128 v95 = 0u;
          id v64 = sub_1001F7970(v21);
          v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v92, "objectForKeyedSubscript:", v65));

          id v67 = [v66 countByEnumeratingWithState:&v94 objects:v122 count:16];
          if (v67)
          {
            uint64_t v68 = *(void *)v95;
            do
            {
              for (k = 0LL; k != v67; k = (char *)k + 1)
              {
                if (*(void *)v95 != v68) {
                  objc_enumerationMutation(v66);
                }
                v70 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)k);
                if (sub_10023AC48(v70))
                {
                  id v71 = sub_10023AC88(v70);
                  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
                  -[NSMutableArray addObject:](v63, "addObject:", v72);
                }
              }

              id v67 = [v66 countByEnumeratingWithState:&v94 objects:v122 count:16];
            }

            while (v67);
          }

          [v93 setObject:v63 forKeyedSubscript:@"-PreservingTags-"];
        }

        id v73 = sub_1001F7970(v21);
        v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v92, "objectForKeyedSubscript:", v74));

        id v76 = sub_1002B86C0(v75, &stru_1003F1550);
        v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
        [v93 setObject:v77 forKeyedSubscript:@"tags"];
        [v84 addObject:v93];

        v91 = (char *)v91 + 1;
      }

      while (v91 != v86);
      id v78 = [obj countByEnumeratingWithState:&v98 objects:v125 count:16];
      id v86 = v78;
    }

    while (v78);
  }

  v81[2](v81, v84, 0LL);
  _Block_object_dispose(&v106, 8);

  _Block_object_dispose(&v112, 8);
}

- (void)expireAssetURLSForBundleIDs:(id)a3 withReply:(id)a4
{
  id v10 = (void (**)(id, void))a4;
  id v5 = a3;
  id v6 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = sub_1001CA028((uint64_t)v7, v5);

  if (v8)
  {
    v10[2](v10, 0LL);
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  900LL,  0LL));
    ((void (**)(id, void *))v10)[2](v10, v9);
  }
}

- (void)fakeWorkWithCount:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  uint64_t v7 = ASDLogHandleForCategory(19LL);
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9[0] = 67109120;
    v9[1] = [v5 intValue];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Creating [%d] fake work items.",  (uint8_t *)v9,  8u);
  }

  v6[2](v6);
}

- (void)statusWithReply:(id)a3
{
  uint64_t v15 = (void (**)(id, id, void))a3;
  id v3 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1001CC358((uint64_t)v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  [(id)qword_1004625A0 lock];
  if ([(id)qword_100462598 count])
  {
    [v6 appendString:@"\n\nSamplers :\n"];
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100462598 allKeys]);
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100462598 objectForKey:v11]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentStatsString]);
          [v6 appendFormat:@"\t%@ : %@", v11, v13];
        }

        id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }

    [v6 appendString:@"\n"];
  }

  [(id)qword_1004625A0 unlock];
  id v14 = [v6 copy];
  v15[2](v15, v14, 0LL);
}

- (void)performMaintenanceWithReply:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  id v3 = sub_100185E88((uint64_t)&OBJC_CLASS___ODRBackgroundMaintenance);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100186078((uint64_t)v4);

  v5[2](v5, 0LL);
}

- (void)cancelMaintenanceWithReply:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  id v3 = sub_100185E88((uint64_t)&OBJC_CLASS___ODRBackgroundMaintenance);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100185F6C(v4);

  v5[2](v5, 0LL);
}

- (void)setLoggingEnabled:(BOOL)a3 reply:(id)a4
{
  NSErrorUserInfoKey v7 = NSDebugDescriptionErrorKey;
  id v8 = @"No longer supported - logging is always on.";
  id v4 = (void (**)(id, void, void *))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  108LL,  v5));
  v4[2](v4, 0LL, v6);
}

- (void)setSampler:(id)a3 enabled:(BOOL)a4 samplingInterval:(double)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v18 = a3;
  uint64_t v9 = (void (**)(id, void *, void))a6;
  [(id)qword_1004625A0 lock];
  if ([v18 isEqualToString:@"memory"])
  {
    id v10 = (void *)qword_100462598;
    if (v8)
    {
      if (!qword_100462598)
      {
        uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v12 = (void *)qword_100462598;
        qword_100462598 = (uint64_t)v11;

        id v10 = (void *)qword_100462598;
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"memory"]);
      id v14 = v13;
      if (v13)
      {
        sub_10027D4B4(v13);
        [(id)qword_100462598 removeObjectForKey:@"memory"];
      }

      uint64_t v15 = sub_10027D2EC(objc_alloc(&OBJC_CLASS___ODRMemorySampler), a5);

      [(id)qword_100462598 setObject:v15 forKey:@"memory"];
      sub_10027D36C(v15);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sampler '%@' enabled with %f sampling interval.",  v18,  *(void *)&a5));
      v9[2](v9, v16, 0LL);
    }

    else
    {
      __int128 v17 = (double *)objc_claimAutoreleasedReturnValue([(id)qword_100462598 objectForKey:@"memory"]);
      uint64_t v15 = v17;
      if (v17)
      {
        sub_10027D4B4(v17);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sampler '%@' disabled.",  v18));
        v9[2](v9, v16, 0LL);
      }

      else
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  113LL,  0LL));
        ((void (**)(id, void *, void *))v9)[2](v9, @"Sampler not found", v16);
      }
    }
  }

  else
  {
    uint64_t v15 = (double *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  112LL,  0LL));
    ((void (**)(id, void *, double *))v9)[2](v9, @"Unknown sampler", v15);
  }

  [(id)qword_1004625A0 unlock];
}

- (void)loadSourceURL:(id)a3 intoDestinationURL:(id)a4 isUrgent:(BOOL)a5 isStreaming:(BOOL)a6 withRequestCompletion:(id)a7
{
  id v8 = a7;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  3000LL,  0LL));
  (*((void (**)(id, id))a7 + 2))(v8, v9);
}

- (void)cancelRequestWithUUID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  3000LL,  0LL));
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)pauseRequestWithUUID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  3000LL,  0LL));
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)resumeRequestWithUUID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  3000LL,  0LL));
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)fetchManifestForAdamID:(id)a3 externalVersionID:(id)a4 variant:(id)a5 withFetchCompletion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = sub_1002D941C(objc_alloc(&OBJC_CLASS___ODRMutableApplication), @"com.apple.TVAppStore");
  sub_1002DB674((uint64_t)v13, v9);
  sub_1002DB7B8((uint64_t)v13, v10);
  sub_1002DB5F0((uint64_t)v13, v11);
  id v14 = sub_1001E6DFC(objc_alloc(&OBJC_CLASS___ODRManifestRequestTask), v13);
  objc_initWeak(&location, v14);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002C40FC;
  v16[3] = &unk_1003EEDB8;
  objc_copyWeak(&v18, &location);
  id v15 = v12;
  id v17 = v15;
  [v14 setCompletionBlock:v16];
  sub_1001E2DEC((uint64_t)&OBJC_CLASS___ODRTaskQueue, v14, -1LL);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)registerManifest:(id)a3 forBundleID:(id)a4 withRequestCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    uint64_t v12 = ASDLogHandleForCategory(19LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v21 = [v7 length];
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[Diagnostics] Importing %{iec-bytes}lu manifest for %{public}@",  buf,  0x16u);
    }

    id v14 = sub_100290554(objc_alloc(&OBJC_CLASS___ODRApplicationImportTask), v11);
    __int128 v16 = sub_10020C9E0(objc_alloc(&OBJC_CLASS___ODRManifest), (uint64_t)v7, v8, 0LL);
    if (v14) {
      objc_setProperty_atomic(v14, v15, v16, 48LL);
    }
    objc_initWeak((id *)buf, v14);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002C4428;
    v17[3] = &unk_1003EEDB8;
    objc_copyWeak(&v19, (id *)buf);
    id v18 = v9;
    [v14 setCompletionBlock:v17];
    sub_1001E2DEC((uint64_t)&OBJC_CLASS___ODRTaskQueue, v14, -1LL);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }
}

- (void)purgeableAssetsWithReply:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_1002C28A8;
  uint64_t v13 = sub_1002C28B8;
  id v14 = 0LL;
  id v4 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002C45F8;
  v8[3] = &unk_1003E9BB8;
  v8[4] = &v9;
  [v5 readUsingSession:v8];

  id v6 = (void *)v10[5];
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( NSMutableString,  "stringWithFormat:",  @"\nAsset Packs : %lu asset packs are purgeable.\n\n",  [v6 count]));
    v3[2](v3, v7, 0LL);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  900LL,  0LL));
    ((void (**)(id, void *, void *))v3)[2](v3, 0LL, v7);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)nonPurgeableAssetsWithReply:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_1002C28A8;
  uint64_t v13 = sub_1002C28B8;
  id v14 = 0LL;
  id v4 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002C4798;
  v8[3] = &unk_1003E9BB8;
  v8[4] = &v9;
  [v5 readUsingSession:v8];

  id v6 = (void *)v10[5];
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( NSMutableString,  "stringWithFormat:",  @"\nAsset Packs : %lu asset packs are not purgeable.\n\n",  [v6 count]));
    v3[2](v3, v7, 0LL);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"_OnDemandResourcesErrorDomain",  900LL,  0LL));
    ((void (**)(id, void *, void *))v3)[2](v3, 0LL, v7);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)purgeBytes:(int64_t)a3 odrOnly:(BOOL)a4 urgency:(int)a5 withReply:(id)a6
{
  BOOL v7 = a4;
  uint64_t v12 = (void (**)(id, id *, void))a6;
  id v9 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  id v10 = (id *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = sub_1001C9CF8(v10, a3, v7, a5);

  v12[2](v12, v11, 0LL);
}

- (void)testPurgeBytes:(int64_t)a3 urgency:(int)a4 withReply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v14 = 0LL;
  BOOL v7 = (void (**)(id, NSMutableString *, void))a5;
  id v8 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = sub_1001CB7CC(v9, v5, a3, &v14);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v13 = [v11 count];
  -[NSMutableString appendFormat:]( v12,  "appendFormat:",  @"\nAsset Packs Purge Test : %lu asset packs to purge for urgency %d (requested bytes : %lld; actual bytes : %lld).\n\n",
    v13,
    v5,
    a3,
    v14);
  v7[2](v7, v12, 0LL);
}

- (void)purgeAllAssetsForApplication:(id)a3 withRequestCompletion:(id)a4
{
  id v8 = a3;
  uint64_t v5 = (void (**)(id, void))a4;
  id v6 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1001CBE18((uint64_t)v7, v8, 2LL);

  v5[2](v5, 0LL);
}

- (void)purgeAllAssetsForApplications:(id)a3 withRequestCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v10);
        id v12 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        sub_1001CBE18((uint64_t)v13, v11, 2LL);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  v6[2](v6, 0LL);
}

- (void)purgeAssetWithIdentifier:(id)a3 withRequestCompletion:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, void))a4;
  id v6 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1001CC040((uint64_t)v7, v8, 2LL);

  v5[2](v5, 0LL);
}

- (void)getSimulatedBandwidthWithReply:(id)a3
{
  id v5 = a3;
  id v4 = sub_100231EC0((uint64_t)&OBJC_CLASS___ODRSimulatedDownloadsManager);
  (*((void (**)(id, id, void))a3 + 2))(v5, v4, 0LL);
}

- (void)setSimulatedBandwidth:(unint64_t)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  sub_100231E50((uint64_t)&OBJC_CLASS___ODRSimulatedDownloadsManager, a3);
  id v5 = sub_100231EC0((uint64_t)&OBJC_CLASS___ODRSimulatedDownloadsManager);
  v6[2](v6, v5, 0LL);
}

- (void)getSpaceReductionWithReply:(id)a3
{
  uint64_t v3 = qword_100462590;
  id v4 = a3;
  if (v3) {
    uint64_t v5 = *(void *)(v3 + 8);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = v4;
  (*((void (**)(id, uint64_t, void))v4 + 2))(v4, v5, 0LL);
}

- (void)setSpaceReduction:(unint64_t)a3 withReply:(id)a4
{
  id v7 = (void (**)(id, unint64_t, void))a4;
  if (a3) {
    uint64_t v5 = sub_10025F414(objc_alloc(&OBJC_CLASS___ODRSpaceReduction), a3);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (void *)qword_100462590;
  qword_100462590 = (uint64_t)v5;

  v7[2](v7, a3, 0LL);
}

- (void)prefetchAndRequestSourceURL:(id)a3 intoDestinationURL:(id)a4 withCompletion:(id)a5
{
}

- (void)prefetchSourceURL:(id)a3 intoDestinationURL:(id)a4 withPrefetchCompletion:(id)a5
{
}

- (void)prefetchThenRequestSourceURL:(id)a3 intoDestinationURL:(id)a4 withCompletion:(id)a5
{
}

@end