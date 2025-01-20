@interface MRDCreateEndpointFromCurrentTopologyRequest
+ (void)createEndpointWithCurrentTopologyWithTimeout:(double)a3 details:(id)a4 previewCallback:(id)a5 completion:(id)a6;
- (void)_createEndpointWithCurrentTopologyWithTimeout:(double)a3 details:(id)a4 previewCallback:(id)a5 completion:(id)a6;
- (void)searchEndpointsForMyGroupLeaderWithTimeout:(double)a3 details:(id)a4 completion:(id)a5;
@end

@implementation MRDCreateEndpointFromCurrentTopologyRequest

+ (void)createEndpointWithCurrentTopologyWithTimeout:(double)a3 details:(id)a4 previewCallback:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10002009C;
  v14[3] = &unk_10039A2C8;
  v15 = objc_alloc_init(&OBJC_CLASS___MRDCreateEndpointFromCurrentTopologyRequest);
  id v16 = v9;
  id v12 = v9;
  v13 = v15;
  -[MRDCreateEndpointFromCurrentTopologyRequest _createEndpointWithCurrentTopologyWithTimeout:details:previewCallback:completion:]( v13,  "_createEndpointWithCurrentTopologyWithTimeout:details:previewCallback:completion:",  v11,  v10,  v14,  a3);
}

- (void)_createEndpointWithCurrentTopologyWithTimeout:(double)a3 details:(id)a4 previewCallback:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc(&OBJC_CLASS___MRDCreateEndpointWithCurrentTopologyAnalytics);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
  v14 = -[MRDCreateEndpointWithCurrentTopologyAnalytics initWithRequestID:](v12, "initWithRequestID:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v16 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
  v18 = -[NSMutableString initWithFormat:]( v16,  "initWithFormat:",  @"%@<%@>",  @"createEndpointWithCurrentTopology",  v17);

  uint64_t v20 = _MRLogForCategory(10LL, v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v95 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_100020780;
  v88[3] = &unk_10039A2F0;
  v89 = @"createEndpointWithCurrentTopology";
  id v22 = v9;
  id v90 = v22;
  id v58 = v15;
  id v91 = v58;
  id v59 = v11;
  id v93 = v59;
  v23 = v14;
  v92 = v23;
  v24 = objc_retainBlock(v88);
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_1000209AC;
  v84[3] = &unk_10039A318;
  v85 = @"createEndpointWithCurrentTopology";
  id v25 = v22;
  id v86 = v25;
  id v57 = v10;
  id v87 = v57;
  v26 = objc_retainBlock(v84);
  id v27 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v25 requestReasonID]);
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_100020B08;
  v82[3] = &unk_100399530;
  v29 = v24;
  id v83 = v29;
  id v30 = [v27 initWithTimeout:v28 reason:v82 handler:a3];

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_100020B1C;
  v79[3] = &unk_10039A0A0;
  id v56 = v30;
  id v80 = v56;
  v31 = v29;
  id v81 = v31;
  v55 = objc_retainBlock(v79);
  id v32 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v25 requestReasonID]);
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_100020B7C;
  v77[3] = &unk_100399530;
  v34 = v26;
  id v78 = v34;
  id v35 = [v32 initWithTimeout:v33 reason:v77 handler:0.0];

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_100020B90;
  v74[3] = &unk_10039A340;
  id v36 = v35;
  id v75 = v36;
  v37 = v34;
  id v76 = v37;
  v38 = objc_retainBlock(v74);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 deviceInfo]);

  -[MRDCreateEndpointWithCurrentTopologyAnalytics setAirplayActive:]( v23,  "setAirplayActive:",  [v40 isAirPlayActive]);
  if ([v40 isAirPlayActive]
    && ([v40 groupContainsDiscoverableGroupLeader] & 1) == 0)
  {
    v54 = v31;
    -[MRDCreateEndpointWithCurrentTopologyAnalytics setUndiscoverableGroupLeader:]( v23,  "setUndiscoverableGroupLeader:",  1LL);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v40 leaderDeviceInfo]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 groupedDevices]);

    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue([v40 leaderDeviceInfo]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 groupedDevices]);
      v43 = (MRDCreateEndpointWithCurrentTopologyAnalytics *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "msv_map:", &stru_10039A380));

      -[MRDCreateEndpointWithCurrentTopologyAnalytics setContainsLeaderInfo:](v23, "setContainsLeaderInfo:", 1LL);
      v48 = (void *)objc_claimAutoreleasedReturnValue( -[MRDCreateEndpointWithCurrentTopologyAnalytics createOptimizedEndpoint]( v23,  "createOptimizedEndpoint"));
      [v48 start];

      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472LL;
      v71[2] = sub_100020BF8;
      v71[3] = &unk_10039A3A8;
      v72 = v23;
      v42 = v55;
      v73 = v55;
      +[MRDCreateOptimizedEndpointRequest createOptimizedEndpointWithOutputDeviceUIDs:timeout:details:previewCallback:completion:]( &OBJC_CLASS___MRDCreateOptimizedEndpointRequest,  "createOptimizedEndpointWithOutputDeviceUIDs:timeout:details:previewCallback:completion:",  v43,  v25,  v38,  v71,  a3);

      v49 = v72;
    }

    else
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCreateEndpointWithCurrentTopologyAnalytics discoverGroup](v23, "discoverGroup"));
      [v50 start];

      id v51 = objc_alloc(&OBJC_CLASS___MRAVReconnaissanceSession);
      v52 = (void *)objc_claimAutoreleasedReturnValue([v40 groupUID]);
      v43 = (MRDCreateEndpointWithCurrentTopologyAnalytics *)[v51 initWithOutputDeviceUIDs:0 outputDeviceGroupID:v52 features:1 details:v25];

      -[MRDCreateEndpointWithCurrentTopologyAnalytics setReturnPartialResults:](v43, "setReturnPartialResults:", 1LL);
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_100020C74;
      v64[3] = &unk_10039A458;
      v65 = v23;
      id v66 = v40;
      double v70 = a3;
      id v67 = v25;
      v68 = v38;
      v42 = v55;
      v69 = v55;
      -[MRDCreateEndpointWithCurrentTopologyAnalytics beginSearchWithTimeout:completion:]( v43,  "beginSearchWithTimeout:completion:",  v64,  3.0);

      v49 = v65;
    }

    v31 = v54;
  }

  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCreateEndpointWithCurrentTopologyAnalytics findMyGroupLeader](v23, "findMyGroupLeader"));
    [v41 start];

    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100020EB4;
    v60[3] = &unk_10039A4A0;
    v61 = v23;
    v62 = v38;
    v42 = v55;
    v63 = v55;
    -[MRDCreateEndpointFromCurrentTopologyRequest searchEndpointsForMyGroupLeaderWithTimeout:details:completion:]( self,  "searchEndpointsForMyGroupLeaderWithTimeout:details:completion:",  v25,  v60,  a3);

    v43 = v61;
  }
}

- (void)searchEndpointsForMyGroupLeaderWithTimeout:(double)a3 details:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfo]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v13 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 requestID]);
  v15 = -[NSMutableString initWithFormat:]( v13,  "initWithFormat:",  @"%@<%@>",  @"searchEndpointsForMyGroupLeader",  v14);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceUID]);
  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceUID]);
    -[NSMutableString appendFormat:](v15, "appendFormat:", @" for %@", v18);
  }

  uint64_t v19 = _MRLogForCategory(10LL, v17);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v15;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100021280;
  v32[3] = &unk_10039A4C8;
  v33 = @"searchEndpointsForMyGroupLeader";
  id v21 = v8;
  id v34 = v21;
  id v22 = v12;
  id v35 = v22;
  id v23 = v9;
  id v36 = v23;
  v24 = objc_retainBlock(v32);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceUID]);

  if (v25)
  {
    id v26 = objc_alloc(&OBJC_CLASS___MRAVReconnaissanceSession);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceUID]);
    v37 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
    id v29 = [v26 initWithOutputDeviceUIDs:v28 outputDeviceGroupID:0 features:8 details:v21];

    [v29 setWaitForCompleteClusters:1];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000214A4;
    v30[3] = &unk_10039A4F0;
    v30[4] = self;
    v31 = v24;
    [v29 beginSearchWithTimeout:v30 endpointsCompletion:a3];
  }

  else
  {
    id v29 = (id)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    ((void (*)(void *, id, void))v24[2])(v24, v29, 0LL);
  }
}

@end