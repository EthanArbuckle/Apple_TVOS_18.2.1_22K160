@interface MRDLightweightReconnaissanceSession
+ (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
@end

@implementation MRDLightweightReconnaissanceSession

+ (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  v13 = (dispatch_queue_s *)a6;
  id v14 = a7;
  if (!v13)
  {
    v13 = &_dispatch_main_q;
    v15 = &_dispatch_main_q;
  }

  uint64_t v131 = 0LL;
  v132 = &v131;
  uint64_t v133 = 0x3032000000LL;
  v134 = sub_10001D4D8;
  v135 = sub_10001D4E8;
  id v136 = 0LL;
  uint64_t v125 = 0LL;
  v126 = &v125;
  uint64_t v127 = 0x3032000000LL;
  v128 = sub_10001D4D8;
  v129 = sub_10001D4E8;
  id v130 = (id)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:]( &OBJC_CLASS___MRAVRoutingDiscoverySession,  "discoverySessionWithEndpointFeatures:",  8LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 requestID]);
  uint64_t v119 = 0LL;
  v120 = &v119;
  uint64_t v121 = 0x3032000000LL;
  v122 = sub_10001D4D8;
  v123 = sub_10001D4E8;
  id v92 = v11;
  id v124 = v92;
  v18 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID",  v17);
  v19 = (__CFString *)v18;
  if (v120[5]) {
    -[NSMutableString appendFormat:](v18, "appendFormat:", @" for %@", v120[5]);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue([v12 reason]);

  if (v20)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v12 reason]);
    -[__CFString appendFormat:](v19, "appendFormat:", @" because %@", v22);
  }

  uint64_t v23 = _MRLogForCategory(10LL, v21);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v138 = v19;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472LL;
  v109[2] = sub_10001D4F0;
  v109[3] = &unk_10039A078;
  v115 = &v119;
  v110 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
  id v25 = v17;
  id v111 = v25;
  id v90 = v16;
  id v112 = v90;
  v88 = v13;
  v113 = v88;
  id v89 = v14;
  id v114 = v89;
  v116 = &v125;
  v117 = &v131;
  id v118 = a1;
  v26 = objc_retainBlock(v109);
  id v27 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v28 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@<%@>",  @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID",  v25);
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472LL;
  v107[2] = sub_10001D9F4;
  v107[3] = &unk_100399530;
  v29 = v26;
  id v108 = v29;
  id v30 = [v27 initWithTimeout:v28 reason:v107 handler:a4];

  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472LL;
  v104[2] = sub_10001DA10;
  v104[3] = &unk_10039A0A0;
  id v31 = v30;
  id v105 = v31;
  v91 = v29;
  id v106 = v91;
  v32 = objc_retainBlock(v104);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 deviceInfo]);

  v35 = (void *)v120[5];
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MRAVOutputDevice localDeviceUID](&OBJC_CLASS___MRAVOutputDevice, "localDeviceUID"));
  if ([v35 compare:v36 options:1]) {
    goto LABEL_14;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceUID]);
  BOOL v38 = v37 == 0LL;

  if (!v38)
  {
    v39 = objc_alloc(&OBJC_CLASS___NSString);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceUID]);
    v36 = -[NSString initWithFormat:]( v39,  "initWithFormat:",  @"substituting deviceUID <%@> for outputDeviceUID...",  v40);

    uint64_t v42 = _MRLogForCategory(10LL, v41);
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v138 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
      __int16 v139 = 2114;
      id v140 = v25;
      __int16 v141 = 2112;
      v142 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
    }

    uint64_t v44 = objc_claimAutoreleasedReturnValue([v34 deviceUID]);
    v45 = (void *)v120[5];
    v120[5] = v44;

LABEL_14:
  }

  if (!v120[5])
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceUID]);
    BOOL v47 = v46 == 0LL;

    if (!v47)
    {
      v48 = objc_alloc(&OBJC_CLASS___NSString);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v34 deviceUID]);
      v50 = -[NSString initWithFormat:]( v48,  "initWithFormat:",  @"substituting deviceUID <%@> for outputDeviceUID...",  v49);

      uint64_t v52 = _MRLogForCategory(10LL, v51);
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v138 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
        __int16 v139 = 2114;
        id v140 = v25;
        __int16 v141 = 2112;
        v142 = v50;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
      }

      uint64_t v54 = objc_claimAutoreleasedReturnValue([v34 deviceUID]);
      v55 = (void *)v120[5];
      v120[5] = v54;
    }
  }

  if (!v120[5])
  {
    v56 = objc_alloc(&OBJC_CLASS___NSString);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVOutputDevice localDeviceUID](&OBJC_CLASS___MRAVOutputDevice, "localDeviceUID"));
    v58 = -[NSString initWithFormat:]( v56,  "initWithFormat:",  @"substituting deviceUID <%@> for outputDeviceUID...",  v57);

    uint64_t v60 = _MRLogForCategory(10LL, v59);
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v138 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
      __int16 v139 = 2114;
      id v140 = v25;
      __int16 v141 = 2112;
      v142 = v58;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
    }

    uint64_t v62 = objc_claimAutoreleasedReturnValue(+[MRAVOutputDevice localDeviceUID](&OBJC_CLASS___MRAVOutputDevice, "localDeviceUID"));
    v63 = (void *)v120[5];
    v120[5] = v62;
  }

  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472LL;
  v100[2] = sub_10001DA70;
  v100[3] = &unk_10039A0C8;
  v101 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
  id v64 = v25;
  id v102 = v64;
  id v65 = v34;
  id v103 = v65;
  v66 = objc_retainBlock(v100);
  id v67 = (id)objc_claimAutoreleasedReturnValue( +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:]( &OBJC_CLASS___MRAVLocalEndpoint,  "sharedLocalEndpointForRoutingContextWithUID:",  0LL));
  v68 = (void *)v120[5];
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVOutputDevice localDeviceUID](&OBJC_CLASS___MRAVOutputDevice, "localDeviceUID"));
  LODWORD(v68) = [v68 compare:v69 options:1] == 0;

  if (!(_DWORD)v68)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue([v65 deviceUID]);
    unsigned int v72 = [v71 isEqualToString:v120[5]];

    if (v72)
    {
      uint64_t v74 = _MRLogForCategory(10LL, v73);
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v138 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
        __int16 v139 = 2114;
        id v140 = v64;
        __int16 v141 = 2112;
        v142 = @"searching for localDeviceUID, using localEndpoint...";
LABEL_37:
        _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
        goto LABEL_38;
      }

      goto LABEL_38;
    }

    v77 = (void *)objc_claimAutoreleasedReturnValue([v65 identifier]);
    unsigned int v78 = [v77 isEqualToString:v120[5]];

    if (v78)
    {
      uint64_t v80 = _MRLogForCategory(10LL, v79);
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v138 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
        __int16 v139 = 2114;
        id v140 = v64;
        __int16 v141 = 2112;
        v142 = @"searching for localIdentifier, using localEndpoint...";
        goto LABEL_37;
      }

      goto LABEL_38;
    }

    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472LL;
    v99[2] = sub_10001DC74;
    v99[3] = &unk_10039A0F0;
    v99[4] = &v119;
    v81 = (void *)objc_claimAutoreleasedReturnValue([v67 outputDevicesMatchingPredicate:v99]);
    BOOL v82 = [v81 count] == 0;

    if (!v82)
    {
      uint64_t v84 = _MRLogForCategory(10LL, v83);
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v138 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
        __int16 v139 = 2114;
        id v140 = v64;
        __int16 v141 = 2112;
        v142 = @"found device in localEndpoint, using localEndpoint...";
        goto LABEL_37;
      }

      goto LABEL_38;
    }

LABEL_40:
    id v67 = a1;
    objc_sync_enter(v67);
    [(id)v126[5] setDiscoveryMode:3];
    v85 = (void *)v126[5];
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472LL;
    v94[2] = sub_10001DC88;
    v94[3] = &unk_10039A118;
    v98 = &v119;
    v95 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
    id v96 = v64;
    v97 = v32;
    uint64_t v86 = objc_claimAutoreleasedReturnValue([v85 addEndpointsChangedCallback:v94]);
    v87 = (void *)v132[5];
    v132[5] = v86;

    objc_sync_exit(v67);
    goto LABEL_41;
  }

  uint64_t v76 = _MRLogForCategory(10LL, v70);
  v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v138 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
    __int16 v139 = 2114;
    id v140 = v64;
    __int16 v141 = 2112;
    v142 = @"searching for local, using localEndpoint...";
    goto LABEL_37;
  }

@end