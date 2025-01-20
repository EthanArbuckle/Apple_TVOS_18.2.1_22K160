@interface MRDCreateOptimizedEndpointRequest
+ (void)createOptimizedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 previewCallback:(id)a6 completion:(id)a7;
- (void)_createOptimizedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 previewCallback:(id)a6 completion:(id)a7;
- (void)searchEndpointsForLocalDeviceWithTimeout:(double)a3 details:(id)a4 completion:(id)a5;
@end

@implementation MRDCreateOptimizedEndpointRequest

+ (void)createOptimizedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 previewCallback:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100049EFC;
  v17[3] = &unk_10039A3A8;
  v18 = objc_alloc_init(&OBJC_CLASS___MRDCreateOptimizedEndpointRequest);
  id v19 = v11;
  id v15 = v11;
  v16 = v18;
  -[MRDCreateOptimizedEndpointRequest _createOptimizedEndpointWithOutputDeviceUIDs:timeout:details:previewCallback:completion:]( v16,  "_createOptimizedEndpointWithOutputDeviceUIDs:timeout:details:previewCallback:completion:",  v14,  v13,  v12,  v17,  a4);
}

- (void)_createOptimizedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 previewCallback:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = objc_alloc(&OBJC_CLASS___MRDCreateOptimizedEndpointAnalytics);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v12 requestID]);
  v17 = -[MRDCreateOptimizedEndpointAnalytics initWithRequestID:](v15, "initWithRequestID:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceInfo]);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v21 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v12 requestID]);
  v23 = -[NSMutableString initWithFormat:]( v21,  "initWithFormat:",  @"%@<%@>",  @"createOptimizedEndpointWithOutputDeviceUIDs",  v22);

  uint64_t v25 = _MRLogForCategory(10LL, v24);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v94 = v23;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472LL;
  v91[2] = sub_10004A51C;
  v91[3] = &unk_10039B608;
  id v27 = v11;
  id v92 = v27;
  v28 = objc_retainBlock(v91);
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472LL;
  v89[2] = sub_10004A648;
  v89[3] = &unk_10039B608;
  id v29 = v27;
  id v90 = v29;
  v53 = objc_retainBlock(v89);
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472LL;
  v86[2] = sub_10004A810;
  v86[3] = &unk_100399E98;
  id v30 = v29;
  id v87 = v30;
  id v31 = v19;
  id v88 = v31;
  v32 = objc_retainBlock(v86);
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_10004A90C;
  v77[3] = &unk_10039B6A8;
  v78 = @"createOptimizedEndpointWithOutputDeviceUIDs";
  id v33 = v12;
  id v79 = v33;
  id v57 = v20;
  id v80 = v57;
  v34 = v17;
  v81 = v34;
  id v56 = v14;
  id v83 = v56;
  v54 = v28;
  id v84 = v54;
  id v35 = v30;
  id v82 = v35;
  id v55 = v13;
  id v85 = v55;
  v36 = objc_retainBlock(v77);
  id v37 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v33 requestReasonID]);
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_10004B160;
  v75[3] = &unk_100399530;
  v39 = v36;
  id v76 = v39;
  id v40 = [v37 initWithTimeout:v38 reason:v75 handler:a4];

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_10004B174;
  v72[3] = &unk_10039A0A0;
  id v41 = v40;
  id v73 = v41;
  v52 = v39;
  id v74 = v52;
  v42 = objc_retainBlock(v72);
  if (((unsigned int (*)(void *))v32[2])(v32))
  {
    -[MRDCreateOptimizedEndpointAnalytics setRequestContainsLocal:](v34, "setRequestContainsLocal:", 1LL);
    v43 = (void *)objc_claimAutoreleasedReturnValue( -[MRDCreateOptimizedEndpointAnalytics searchEndpointsForLocalDevice]( v34,  "searchEndpointsForLocalDevice"));
    [v43 start];

    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_10004B1D4;
    v64[3] = &unk_10039B740;
    v65 = v34;
    v44 = v53;
    v69 = v53;
    v66 = @"createOptimizedEndpointWithOutputDeviceUIDs";
    id v67 = v33;
    double v71 = a4;
    id v68 = v31;
    id v70 = v42;
    v45 = v42;
    -[MRDCreateOptimizedEndpointRequest searchEndpointsForLocalDeviceWithTimeout:details:completion:]( self,  "searchEndpointsForLocalDeviceWithTimeout:details:completion:",  v67,  v64,  a4);

    v46 = v65;
  }

  else
  {
    v45 = [[MRAVReconnaissanceSession alloc] initWithOutputDeviceUIDs:v35 outputDeviceGroupID:0 features:8 details:v33];
    [v45 setShouldWaitForUnanimousEndpoints:0];
    [v45 setReturnPartialResults:1];
    id v47 = v31;
    v48 = v32;
    id v49 = v35;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCreateOptimizedEndpointAnalytics discoverOutputDevices](v34, "discoverOutputDevices"));
    [v50 start];

    id v35 = v49;
    v32 = v48;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_10004B7C0;
    v58[3] = &unk_10039B768;
    v59 = v34;
    id v60 = v35;
    double v63 = a4;
    id v61 = v33;
    id v62 = v42;
    v46 = v42;
    [v45 beginSearchWithTimeout:v58 endpointsCompletion:a4];

    id v31 = v47;
    v44 = v53;
  }
}

- (void)searchEndpointsForLocalDeviceWithTimeout:(double)a3 details:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceInfo]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v12 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 requestID]);
  id v14 = -[NSMutableString initWithFormat:]( v12,  "initWithFormat:",  @"%@<%@>",  @"searchEndpointsForLocalDevice",  v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceUID]);
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceUID]);
    -[NSMutableString appendFormat:](v14, "appendFormat:", @" for %@", v17);
  }

  uint64_t v18 = _MRLogForCategory(10LL, v16);
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10004BC78;
  v31[3] = &unk_10039A4C8;
  v32 = @"searchEndpointsForLocalDevice";
  id v20 = v7;
  id v33 = v20;
  id v21 = v11;
  id v34 = v21;
  id v22 = v8;
  id v35 = v22;
  v23 = objc_retainBlock(v31);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceUID]);

  if (v24)
  {
    id v25 = objc_alloc(&OBJC_CLASS___MRAVReconnaissanceSession);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceUID]);
    v36 = v26;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
    id v28 = [v25 initWithOutputDeviceUIDs:v27 outputDeviceGroupID:0 features:8 details:v20];

    [v28 setWaitForCompleteClusters:1];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10004BE9C;
    v29[3] = &unk_10039B790;
    id v30 = v23;
    [v28 beginSearchWithTimeout:v29 endpointsCompletion:a3];
  }

  else
  {
    id v28 = (id)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    ((void (*)(void *, id, void))v23[2])(v23, v28, 0LL);
  }
}

@end