@interface MRDStreamCapacityManager
+ (id)sharedManager;
- (BOOL)willStartingPlaybackToOutputDevicesInterrupt:(id)a3;
- (MRDNowPlayingPlayerClient)bestStreamToInterrupt;
- (MRDStreamCapacityManager)init;
- (id)_willStartingPlaybackToOutputDevicesInterrupt:(id)a3;
- (id)allStreams;
- (id)allStreamsExcludingLocal;
- (id)canActivateStreamWithPlayerPath:(id)a3;
- (id)description;
- (id)streamsActivelyUsingSlot;
- (id)streamsThatCountTowardsCapacity;
- (int64_t)activeStreamCount;
- (int64_t)maxStreamCapacity;
- (int64_t)remainingStreamCapacity;
- (void)_handlePlaybackStateDidChange:(id)a3;
- (void)interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath:(id)a3 reason:(id)a4 completion:(id)a5;
@end

@implementation MRDStreamCapacityManager

+ (id)sharedManager
{
  if (qword_1003FDC38 != -1) {
    dispatch_once(&qword_1003FDC38, &stru_10039A768);
  }
  return (id)qword_1003FDC30;
}

- (MRDStreamCapacityManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDStreamCapacityManager;
  v2 = -[MRDStreamCapacityManager init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_handlePlaybackStateDidChange:" name:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0];
  }

  return v2;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager streamsActivelyUsingSlot](self, "streamsActivelyUsingSlot"));
  v4 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v5 = [v3 count];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  else {
    v7 = &stru_1003AE680;
  }
  v31 = -[NSMutableString initWithFormat:]( v4,  "initWithFormat:",  @"Currently playing %ld %@ streams (max = %ld).\n",  v5,  v7,  -[MRDStreamCapacityManager maxStreamCapacity](self, "maxStreamCapacity"));

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v3;
  id v32 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceInfo]);
        v11 = objc_alloc(&OBJC_CLASS___NSMutableString);
        v33 = v9;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 origin]);
        uint64_t v13 = (int)[v12 identifier];
        v14 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceUID]);
        v16 = -[NSMutableString initWithFormat:](v11, "initWithFormat:", @"origin-%ld %@ (%@)", v13, v14, v15);

        v17 = (void *)objc_claimAutoreleasedReturnValue([v10 groupedDevices]);
        id v18 = [v17 count];

        if (v18) {
          -[NSMutableString appendString:](v16, "appendString:", @" + ");
        }
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        v19 = (void *)objc_claimAutoreleasedReturnValue([v10 groupedDevices]);
        id v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v35;
          do
          {
            for (j = 0LL; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v35 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
              v25 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
              v26 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceUID]);
              -[NSMutableString appendFormat:](v16, "appendFormat:", @"%@ (%@) + ", v25, v26);
            }

            id v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }

          while (v21);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue([v33 activeContent]);
        -[NSMutableString appendFormat:](v31, "appendFormat:", @"%@ on %@\n", v27, v16);
      }

      id v32 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }

    while (v32);
  }

  return v31;
}

- (id)canActivateStreamWithPlayerPath:(id)a3
{
  v4 = (__CFString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  v8 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"canActivateStreamWithPlayerPath",  v7);
  v10 = v8;
  if (v4) {
    -[NSMutableString appendFormat:](v8, "appendFormat:", @" for %@", v4);
  }
  uint64_t v11 = _MRLogForCategory(10LL, v9);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v75 = (const __CFString *)v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_10002BEC0;
  v72[3] = &unk_10039A7F8;
  v72[4] = self;
  v73 = &stru_10039A7A8;
  uint64_t v13 = objc_retainBlock(v72);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_10002BF34;
  v70[3] = &unk_10039A7F8;
  v70[4] = self;
  v71 = &stru_10039A7A8;
  v14 = objc_retainBlock(v70);
  if ((((uint64_t (*)(void *, __CFString *))v13[2])(v13, v4) & 1) == 0)
  {
    uint64_t v26 = _MRLogForCategory(10LL, v15);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v27 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v27)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v23 timeIntervalSinceDate:v5];
        *(_DWORD *)buf = 138544386;
        v75 = @"canActivateStreamWithPlayerPath";
        __int16 v76 = 2114;
        v77 = v7;
        __int16 v78 = 2112;
        v79 = @"PlayerPath does not take up a slot thus is always allowed to activate";
        __int16 v80 = 2114;
        v81 = v4;
        __int16 v82 = 2048;
        uint64_t v83 = v28;
        v25 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        goto LABEL_14;
      }

- (void)interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

  v14 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath",  v13);
  uint64_t v16 = v14;
  if (v8) {
    -[NSMutableString appendFormat:](v14, "appendFormat:", @" for %@", v8);
  }
  if (v9) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" because %@", v9);
  }
  uint64_t v17 = _MRLogForCategory(10LL, v15);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10002C338;
  v34[3] = &unk_10039A820;
  id v19 = v8;
  id v35 = v19;
  uint64_t v36 = @"interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath";
  id v20 = v13;
  id v37 = v20;
  id v21 = v11;
  id v38 = v21;
  id v22 = v10;
  id v39 = v22;
  v23 = objc_retainBlock(v34);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[MRDStreamCapacityManager canActivateStreamWithPlayerPath:]( self,  "canActivateStreamWithPlayerPath:",  v19));
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager bestStreamToInterrupt](self, "bestStreamToInterrupt"));
    if (v25)
    {
      id v26 = objc_alloc(&OBJC_CLASS___MRNowPlayingRequest);
      id v31 = v9;
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v25 playerPath]);
      uint64_t v28 = (NSError *)[v26 initWithPlayerPath:v27];

      v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint32_t v30 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@<%@>",  @"interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath",  v31);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v30,  kMRMediaRemoteOptionRemoteControlInterfaceIdentifier);

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_10002C6A8;
      v32[3] = &unk_100399DA8;
      v33 = v23;
      -[NSError sendCommand:options:queue:completion:]( v28,  "sendCommand:options:queue:completion:",  1LL,  v29,  &_dispatch_main_q,  v32);

      id v9 = v31;
    }

    else
    {
      uint64_t v28 = -[NSError initWithMRError:description:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:description:",  29LL,  @"Could not find a best stream to interrupt");
      ((void (*)(void *, void, NSError *))v23[2])(v23, 0LL, v28);
    }
  }

  else
  {
    ((void (*)(void *, void, void))v23[2])(v23, 0LL, 0LL);
  }
}

- (MRDNowPlayingPlayerClient)bestStreamToInterrupt
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  v6 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"bestStreamToInterrupt",  v5);
  uint64_t v8 = _MRLogForCategory(10LL, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = (const __CFString *)v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager allStreamsExcludingLocal](self, "allStreamsExcludingLocal"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msv_compactMap:", &stru_10039A860));

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sortedArrayUsingComparator:&stru_10039A8A0]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerPath]);
  uint64_t v16 = _MRLogForCategory(10LL, v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 playerPath]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v20 timeIntervalSinceDate:v3];
      *(_DWORD *)buf = 138544130;
      v25 = @"bestStreamToInterrupt";
      __int16 v26 = 2114;
      BOOL v27 = v5;
      __int16 v28 = 2112;
      v29 = v19;
      __int16 v30 = 2048;
      uint64_t v31 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds",  buf,  0x2Au);

LABEL_8:
    }
  }

  else if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v19 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 138543874;
    v25 = @"bestStreamToInterrupt";
    __int16 v26 = 2114;
    BOOL v27 = v5;
    __int16 v28 = 2048;
    v29 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
    goto LABEL_8;
  }

  return (MRDNowPlayingPlayerClient *)v13;
}

- (id)_willStartingPlaybackToOutputDevicesInterrupt:(id)a3
{
  id v4 = a3;
  if (-[MRDStreamCapacityManager remainingStreamCapacity](self, "remainingStreamCapacity") < 1)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager streamsThatCountTowardsCapacity](self, "streamsThatCountTowardsCapacity"));
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v34;
      BOOL v27 = v9;
      id v28 = v4;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          if ([v14 containsActiveStream])
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceInfo]);
            __int128 v29 = 0u;
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            id v16 = v4;
            id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v30;
              while (2)
              {
                for (j = 0LL; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v30 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)j);
                  if ([v15 containsDevice:v21])
                  {
                    id v22 = objc_alloc(&OBJC_CLASS___NSString);
                    v23 = (void *)objc_claimAutoreleasedReturnValue([v14 activeContent]);
                    uint64_t v24 = -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"Already playing <%@> to specified device <%@>",  v23,  v21);

                    id v8 = [[MSVPair alloc] initWithFirst:&__kCFBooleanFalse second:v24];
                    id v4 = v28;
                    goto LABEL_23;
                  }
                }

                id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }

            id v9 = v27;
            id v4 = v28;
            uint64_t v12 = v26;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }

      while (v11);
    }

    id v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager description](self, "description"));
    id v6 = objc_alloc(&OBJC_CLASS___MSVPair);
    uint64_t v7 = &__kCFBooleanTrue;
  }

  else
  {
    id v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Number of currently activeStreams (%ld) is less that capacity (%ld).",  -[MRDStreamCapacityManager activeStreamCount](self, "activeStreamCount"),  -[MRDStreamCapacityManager maxStreamCapacity](self, "maxStreamCapacity"));
    id v6 = objc_alloc(&OBJC_CLASS___MSVPair);
    uint64_t v7 = &__kCFBooleanFalse;
  }

  id v8 = [v6 initWithFirst:v7 second:v5];

LABEL_23:
  return v8;
}

- (BOOL)willStartingPlaybackToOutputDevicesInterrupt:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  id v8 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"willStartingPlaybackToOutputDevicesInterrupt",  v7);
  id v10 = v8;
  if (v4) {
    -[NSMutableString appendFormat:](v8, "appendFormat:", @" for %@", v4);
  }
  uint64_t v11 = _MRLogForCategory(10LL, v9);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = (const __CFString *)v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[MRDStreamCapacityManager _willStartingPlaybackToOutputDevicesInterrupt:]( self,  "_willStartingPlaybackToOutputDevicesInterrupt:",  v4));
  uint64_t v15 = _MRLogForCategory(10LL, v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 second]);
    *(_DWORD *)buf = 138543874;
    uint64_t v41 = @"willStartingPlaybackToOutputDevicesInterrupt";
    __int16 v42 = 2114;
    v43 = v7;
    __int16 v44 = 2112;
    id v45 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 first]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 BOOLValue]));

  uint64_t v21 = _MRLogForCategory(10LL, v20);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (!v19)
  {
    if (v4)
    {
      if (!v23) {
        goto LABEL_21;
      }
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v24 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544130;
      uint64_t v41 = @"willStartingPlaybackToOutputDevicesInterrupt";
      __int16 v42 = 2114;
      v43 = v7;
      __int16 v44 = 2114;
      id v45 = v4;
      __int16 v46 = 2048;
      id v47 = v31;
      __int128 v32 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      __int128 v33 = v22;
      uint32_t v34 = 42;
    }

    else
    {
      if (!v23) {
        goto LABEL_21;
      }
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v24 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = @"willStartingPlaybackToOutputDevicesInterrupt";
      __int16 v42 = 2114;
      v43 = v7;
      __int16 v44 = 2048;
      id v45 = v36;
      __int128 v32 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      __int128 v33 = v22;
      uint32_t v34 = 32;
    }

    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
    goto LABEL_20;
  }

  if (v4)
  {
    if (v23)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v13 first]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v24 BOOLValue]));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v26 timeIntervalSinceDate:v5];
      *(_DWORD *)buf = 138544386;
      uint64_t v41 = @"willStartingPlaybackToOutputDevicesInterrupt";
      __int16 v42 = 2114;
      v43 = v7;
      __int16 v44 = 2112;
      id v45 = v25;
      __int16 v46 = 2114;
      id v47 = v4;
      __int16 v48 = 2048;
      uint64_t v49 = v27;
      id v28 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      __int128 v29 = v22;
      uint32_t v30 = 52;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);

LABEL_20:
    }
  }

  else if (v23)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v13 first]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v24 BOOLValue]));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v26 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 138544130;
    uint64_t v41 = @"willStartingPlaybackToOutputDevicesInterrupt";
    __int16 v42 = 2114;
    v43 = v7;
    __int16 v44 = 2112;
    id v45 = v25;
    __int16 v46 = 2048;
    id v47 = v35;
    id v28 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    __int128 v29 = v22;
    uint32_t v30 = 42;
    goto LABEL_16;
  }

- (int64_t)activeStreamCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager streamsActivelyUsingSlot](self, "streamsActivelyUsingSlot"));
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (int64_t)maxStreamCapacity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  id v3 = [v2 maxStreamCapacity];

  return (int64_t)v3;
}

- (int64_t)remainingStreamCapacity
{
  int64_t v3 = -[MRDStreamCapacityManager maxStreamCapacity](self, "maxStreamCapacity");
  return v3 - -[MRDStreamCapacityManager activeStreamCount](self, "activeStreamCount");
}

- (id)allStreams
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 nowPlayingServer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 originClients]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_filter:", &stru_10039A8E0));

  return v5;
}

- (id)allStreamsExcludingLocal
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager allStreams](self, "allStreams"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "msv_filter:", &stru_10039A900));

  return v3;
}

- (id)streamsThatCountTowardsCapacity
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v4 = [v3 reserveSlotForLocal];

  if ((v4 & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager allStreamsExcludingLocal](self, "allStreamsExcludingLocal"));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager allStreams](self, "allStreams"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msv_firstWhere:", &stru_10039A920));

    if (!v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingServer]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localOriginClient]);
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 arrayByAddingObject:v9]);

      id v5 = (void *)v10;
    }
  }

  return v5;
}

- (id)streamsActivelyUsingSlot
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDStreamCapacityManager streamsThatCountTowardsCapacity](self, "streamsThatCountTowardsCapacity"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "msv_filter:", &stru_10039A940));

  return v3;
}

- (void)_handlePlaybackStateDidChange:(id)a3
{
  id v17 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
  unsigned int v8 = [v7 isLocallyHosted];

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 client]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    uint64_t v11 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
    unsigned int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey]);
      unsigned int v15 = [v14 BOOLValue];

      if (v15)
      {
        id v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ just started playing",  v6);
        -[MRDStreamCapacityManager interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath:reason:completion:]( self,  "interruptBestStreamIfNecessaryToActivateStreamWithPlayerPath:reason:completion:",  v6,  v16,  0LL);
      }
    }
  }
}

@end