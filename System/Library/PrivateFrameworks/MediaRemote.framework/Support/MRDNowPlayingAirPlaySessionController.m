@interface MRDNowPlayingAirPlaySessionController
- (BOOL)isStartingNowPlayingSession;
- (void)_findEndpointContainingGroupID:(id)a3 andDeviceID:(id)a4 requestID:(id)a5 completion:(id)a6;
- (void)resumeNowPlayingSesion;
- (void)setStartingNowPlayingSession:(BOOL)a3;
- (void)startNowPlayingSessionWithCompletion:(id)a3;
- (void)stopNowPlayingSesion;
@end

@implementation MRDNowPlayingAirPlaySessionController

- (void)startNowPlayingSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingServer]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localOriginClient]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfoDataSource]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceInfo]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceUID]);
  v14 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"startNowPlayingSession",  v6);
  v16 = v14;
  if (v13) {
    -[NSMutableString appendFormat:](v14, "appendFormat:", @" for %@", v13);
  }
  uint64_t v17 = _MRLogForCategory(10LL, v15);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v137 = (const __CFString *)v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRDNowPlayingAirPlaySessionController setStartingNowPlayingSession:](self, "setStartingNowPlayingSession:", 1LL);
  v19 = objc_alloc(&OBJC_CLASS___MRDNowPlayingAirPlaySessionEvents);
  id v20 = [v12 clusterType];
  v98 = v12;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v12 modelID]);
  v22 = -[MRDNowPlayingAirPlaySessionEvents initWithClusterType:modelID:](v19, "initWithClusterType:modelID:", v20, v21);

  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472LL;
  v128[2] = sub_10006AF48;
  v128[3] = &unk_10039C7E0;
  v99 = v22;
  v129 = v99;
  v130 = @"startNowPlayingSession";
  id v23 = v6;
  id v131 = v23;
  id v24 = v13;
  id v132 = v24;
  id v25 = v7;
  id v133 = v25;
  id v97 = v4;
  v134 = self;
  id v135 = v97;
  v26 = objc_retainBlock(v128);
  id v27 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v28 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@<%@>",  @"startNowPlayingSession",  v23);
  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472LL;
  v126[2] = sub_10006B458;
  v126[3] = &unk_100399530;
  v29 = v26;
  id v127 = v29;
  id v30 = [v27 initWithTimeout:v28 reason:v126 handler:15.0];

  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472LL;
  v123[2] = sub_10006B46C;
  v123[3] = &unk_10039C808;
  id v96 = v30;
  id v124 = v96;
  v31 = v29;
  id v125 = v31;
  v32 = objc_retainBlock(v123);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
  LODWORD(v30) = [v33 needsCommandRedirection];

  if (!(_DWORD)v30)
  {
    v94 = v31;
    id v95 = v25;
    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472LL;
    v117[2] = sub_10006B4CC;
    v117[3] = &unk_10039C830;
    v44 = v99;
    v118 = (MRPlayerPath *)v44;
    v93 = v32;
    v45 = v32;
    id v122 = v45;
    v119 = self;
    id v46 = v24;
    id v120 = v46;
    id v47 = v23;
    id v121 = v47;
    v48 = objc_retainBlock(v117);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingAirPlaySessionEvents sourceOutputContext](v44, "sourceOutputContext"));
    [v49 start];

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue([v50 outputContextForOutputDeviceUID:v46]);

    v92 = v51;
    if (!v51)
    {
      v81 = -[NSError initWithMRError:description:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:description:",  32LL,  @"Failed to query output context for local device");
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingAirPlaySessionEvents sourceOutputContext](v44, "sourceOutputContext"));
      [v82 endWithError:v81];

      ((void (*)(void *, void, NSError *))v45[2])(v45, 0LL, v81);
      v31 = v94;
      v35 = v95;
      v43 = v99;
      v41 = v97;
      v42 = v98;
LABEL_19:

      v40 = v118;
      v32 = v93;
      goto LABEL_20;
    }

    id v89 = v45;
    id v90 = v23;
    v86 = v48;
    id v88 = v24;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingAirPlaySessionEvents sourceOutputContext](v44, "sourceOutputContext"));
    [v52 end];

    uint64_t v54 = _MRLogForCategory(10LL, v53);
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v137 = @"startNowPlayingSession";
      __int16 v138 = 2114;
      id v139 = v47;
      __int16 v140 = 2112;
      v141 = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
    }

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString outputDevices](v51, "outputDevices"));
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472LL;
    v115[2] = sub_10006B7E0;
    v115[3] = &unk_10039AC00;
    v57 = (NSError *)v46;
    v116 = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "msv_firstWhere:", v115));

    v59 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v60 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@<%@>",  @"startNowPlayingSession",  v47);
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472LL;
    v110[2] = sub_10006B7EC;
    v110[3] = &unk_10039C880;
    id v61 = v58;
    id v111 = v61;
    v62 = v44;
    v112 = v62;
    v63 = v51;
    v113 = v63;
    v64 = v60;
    v114 = v64;
    v65 = objc_retainBlock(v110);
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472LL;
    v105[2] = sub_10006B9B4;
    v105[3] = &unk_10039C880;
    id v87 = v61;
    id v106 = v87;
    v107 = v57;
    v66 = v62;
    v108 = v66;
    v85 = v64;
    v109 = v85;
    v91 = objc_retainBlock(v105);
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472LL;
    v103[2] = sub_10006BBDC;
    v103[3] = &unk_10039C8A8;
    v104 = v66;
    v67 = objc_retainBlock(v103);
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v69 = (void *)objc_claimAutoreleasedReturnValue([v68 nowPlayingServer]);
    v70 = (void *)objc_claimAutoreleasedReturnValue([v69 localOriginClient]);
    v71 = (void *)objc_claimAutoreleasedReturnValue([v70 deviceInfoDataSource]);
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 deviceInfo]);
    unsigned int v73 = ([v72 clusterType] - 1) & 0xFFFFFFFD;

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString outputDevices](v63, "outputDevices"));
    id v75 = [v74 count];

    if (v73)
    {
      id v76 = v97;
      v42 = v98;
      v31 = v94;
      v35 = v95;
      v77 = v89;
      v78 = v65;
      if ((unint64_t)v75 >= 2)
      {
        id v79 = [v65 copy];
        -[NSMutableArray addObject:](v59, "addObject:", v79);

        v80 = v91;
LABEL_17:
        id v83 = [v80 copy];
        -[NSMutableArray addObject:](v59, "addObject:", v83);
      }
    }

    else
    {
      v80 = v65;
      id v76 = v97;
      v42 = v98;
      v31 = v94;
      v35 = v95;
      v77 = v89;
      v78 = v65;
      if (v75) {
        goto LABEL_17;
      }
    }

    id v84 = [v67 copy];
    -[NSMutableArray addObject:](v59, "addObject:", v84);

    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472LL;
    v100[2] = sub_10006BCAC;
    v100[3] = &unk_10039C8D0;
    v48 = v86;
    v101 = v86;
    id v102 = v77;
    MRPerformAsyncOperationsUntilError(v59, v100);

    v81 = v116;
    v43 = v99;
    id v24 = v88;
    id v23 = v90;
    v41 = v76;
    goto LABEL_19;
  }

  v35 = v25;
  uint64_t v36 = _MRLogForCategory(10LL, v34);
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v137 = @"startNowPlayingSession";
    __int16 v138 = 2114;
    id v139 = v23;
    __int16 v140 = 2112;
    v141 = @"Returning local origin because device requires command redirection";
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v38 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  v40 = -[MRPlayerPath initWithOrigin:client:player:](v38, "initWithOrigin:client:player:", v39, 0LL, 0LL);

  ((void (*)(void *, MRPlayerPath *, void))v32[2])(v32, v40, 0LL);
  v41 = v97;
  v42 = v98;
  v43 = v99;
LABEL_20:
}

- (void)stopNowPlayingSesion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localOriginClient]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceInfoDataSource]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceUID]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

  v12 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"stopNowPlayingSession",  v11);
  v14 = v12;
  if (v8) {
    -[NSMutableString appendFormat:](v12, "appendFormat:", @" for %@", v8);
  }
  uint64_t v15 = _MRLogForCategory(10LL, v13);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = (const __CFString *)v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v18 = _MRLogForCategory(10LL, v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v21 timeIntervalSinceDate:v9];
      *(_DWORD *)buf = 138544130;
      v29 = @"stopNowPlayingSession";
      __int16 v30 = 2114;
      v31 = v11;
      __int16 v32 = 2114;
      v33 = v8;
      __int16 v34 = 2048;
      uint64_t v35 = v22;
      id v23 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v24 = v19;
      uint32_t v25 = 42;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    }
  }

  else if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v21 timeIntervalSinceDate:v9];
    *(_DWORD *)buf = 138543874;
    v29 = @"stopNowPlayingSession";
    __int16 v30 = 2114;
    v31 = v11;
    __int16 v32 = 2048;
    v33 = v26;
    id v23 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v24 = v19;
    uint32_t v25 = 32;
    goto LABEL_10;
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v27 postNotificationName:@"MRDNowPlayingAirPlaySessionStopped" object:self];
}

- (void)resumeNowPlayingSesion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 nowPlayingServer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localOriginClient]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfoDataSource]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceUID]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

  v11 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"resumeNowPlayingSession",  v10);
  uint64_t v13 = v11;
  if (v7) {
    -[NSMutableString appendFormat:](v11, "appendFormat:", @" for %@", v7);
  }
  uint64_t v14 = _MRLogForCategory(10LL, v12);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = (const __CFString *)v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v17 = _MRLogForCategory(10LL, v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v19)
    {
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v20 timeIntervalSinceDate:v8];
      *(_DWORD *)buf = 138544130;
      id v27 = @"resumeNowPlayingSession";
      __int16 v28 = 2114;
      v29 = v10;
      __int16 v30 = 2114;
      v31 = v7;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      uint64_t v22 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v23 = v18;
      uint32_t v24 = 42;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
  }

  else if (v19)
  {
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v20 timeIntervalSinceDate:v8];
    *(_DWORD *)buf = 138543874;
    id v27 = @"resumeNowPlayingSession";
    __int16 v28 = 2114;
    v29 = v10;
    __int16 v30 = 2048;
    v31 = v25;
    uint64_t v22 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v23 = v18;
    uint32_t v24 = 32;
    goto LABEL_10;
  }
}

- (void)_findEndpointContainingGroupID:(id)a3 andDeviceID:(id)a4 requestID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v14 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"startNowPlayingSession.findEndpointContainingGroupID",  v11);
  uint64_t v16 = v14;
  if (v9) {
    -[NSMutableString appendFormat:](v14, "appendFormat:", @" for %@", v9);
  }
  uint64_t v17 = _MRLogForCategory(10LL, v15);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10006C5B8;
  v44[3] = &unk_10039A820;
  id v19 = v9;
  id v45 = v19;
  id v46 = @"startNowPlayingSession.findEndpointContainingGroupID";
  id v20 = v11;
  id v47 = v20;
  id v48 = v13;
  id v49 = v12;
  id v34 = v12;
  id v33 = v13;
  uint64_t v21 = objc_retainBlock(v44);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10006C92C;
  v39[3] = &unk_10039C918;
  id v40 = v10;
  v41 = @"startNowPlayingSession.findEndpointContainingGroupID";
  id v22 = v20;
  id v42 = v22;
  id v43 = v19;
  id v23 = v19;
  id v24 = v10;
  uint32_t v25 = objc_retainBlock(v39);
  id v26 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
  id v27 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@<%@> looking for localDevice with groupID=%@",  @"startNowPlayingSession.findEndpointContainingGroupID",  v22,  v23);
  qos_class_t v28 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v28, 0LL);
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10006CC50;
  v35[3] = &unk_10039C940;
  uint64_t v36 = @"startNowPlayingSession.findEndpointContainingGroupID";
  id v37 = v22;
  id v38 = v21;
  v31 = v21;
  id v32 = v22;
  [v26 searchEndpointsWithPredicate:v25 timeout:v27 reason:v30 queue:v35 completion:7.0];
}

- (BOOL)isStartingNowPlayingSession
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL startingNowPlayingSession = v2->_startingNowPlayingSession;
  objc_sync_exit(v2);

  return startingNowPlayingSession;
}

- (void)setStartingNowPlayingSession:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v4->_BOOL startingNowPlayingSession = v3;
  objc_sync_exit(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v7 = v5;
  if (v3) {
    v6 = @"MRDNowPlayingAirplaySessionStarting";
  }
  else {
    v6 = @"MRDNowPlayingAirplaySessionStarted";
  }
  [v5 postNotificationName:v6 object:v4];
}

@end