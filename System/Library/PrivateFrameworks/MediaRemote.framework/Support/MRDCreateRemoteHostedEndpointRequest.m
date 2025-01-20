@interface MRDCreateRemoteHostedEndpointRequest
+ (void)createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:(id)a3 withOutputDeviceUIDs:(id)a4 timeout:(double)a5 details:(id)a6 completion:(id)a7;
- (void)_createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:(id)a3 withOutputDeviceUIDs:(id)a4 timeout:(double)a5 details:(id)a6 completion:(id)a7;
- (void)_searchForGroupUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
@end

@implementation MRDCreateRemoteHostedEndpointRequest

+ (void)createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:(id)a3 withOutputDeviceUIDs:(id)a4 timeout:(double)a5 details:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100070478;
  v17[3] = &unk_10039CA90;
  v18 = objc_alloc_init(&OBJC_CLASS___MRDCreateRemoteHostedEndpointRequest);
  id v19 = v11;
  id v15 = v11;
  v16 = v18;
  -[MRDCreateRemoteHostedEndpointRequest _createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:withOutputDeviceUIDs:timeout:details:completion:]( v16,  "_createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:withOutputDeviceUIDs:timeout:details:completion:",  v14,  v13,  v12,  v17,  a5);
}

- (void)_createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:(id)a3 withOutputDeviceUIDs:(id)a4 timeout:(double)a5 details:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v57 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = objc_alloc(&OBJC_CLASS___MRDCreateRemoteHostedEndpointAnalytics);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 requestID]);
  v16 = -[MRDCreateRemoteHostedEndpointAnalytics initWithRequestID:](v14, "initWithRequestID:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v18 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 requestID]);
  v20 = -[NSMutableString initWithFormat:]( v18,  "initWithFormat:",  @"%@<%@>",  @"createRemoteHostedEndpointForGroupLeaderWithOutputDeviceUIDs",  v19);

  if (v11) {
    -[NSMutableString appendFormat:](v20, "appendFormat:", @" for %@", v11);
  }
  if (v57) {
    -[NSMutableString appendFormat:](v20, "appendFormat:", @" because %@", v57);
  }
  uint64_t v22 = _MRLogForCategory(10LL, v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v82 = v20;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_100070AC0;
  v73[3] = &unk_10039CB80;
  v74 = @"createRemoteHostedEndpointForGroupLeaderWithOutputDeviceUIDs";
  id v24 = v12;
  id v75 = v24;
  id v56 = v17;
  id v76 = v56;
  v25 = v16;
  v77 = v25;
  id v55 = v13;
  id v78 = v55;
  v26 = objc_retainBlock(v73);
  id v27 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v24 requestReasonID]);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_100070CD0;
  v71[3] = &unk_100399530;
  v29 = v26;
  id v72 = v29;
  id v30 = [v27 initWithTimeout:v28 reason:v71 handler:a5];

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_100070CE4;
  v68[3] = &unk_10039A0A0;
  id v53 = v30;
  id v69 = v53;
  v54 = v29;
  id v70 = v54;
  v31 = objc_retainBlock(v68);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 routingServer]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 hostedRoutingService]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 hostedRoutingController]);

  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 availableOutputDevices]);
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_100070D44;
  v66[3] = &unk_10039AC00;
  id v37 = v11;
  id v67 = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "msv_firstWhere:", v66));

  if (!v38)
  {
    v50 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 47LL);
LABEL_13:
    v45 = v50;
    ((void (*)(void *, void, NSError *))v31[2])(v31, 0LL, v50);
    goto LABEL_16;
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 primaryID]);

  if (!v39)
  {
    v50 = -[NSError initWithMRError:description:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:description:",  39LL,  @"No primaryID");
    goto LABEL_13;
  }

  id v51 = v37;
  v40 = (void *)objc_claimAutoreleasedReturnValue( -[MRDCreateRemoteHostedEndpointAnalytics createTransientExternalDevice]( v25,  "createTransientExternalDevice"));
  [v40 start];

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 routingServer]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 hostedRoutingService]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 hostedRoutingController]);
  v45 = (NSError *)objc_claimAutoreleasedReturnValue([v44 makeTransientExternalDeviceToOutputDevice:v38]);

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue( -[MRDCreateRemoteHostedEndpointAnalytics createTransientExternalDevice]( v25,  "createTransientExternalDevice"));
    [v46 end];

    v47 = (void *)objc_claimAutoreleasedReturnValue( -[MRDCreateRemoteHostedEndpointAnalytics connectToTransientExternalDevice]( v25,  "connectToTransientExternalDevice"));
    [v47 start];

    v80[0] = @"createRemoteHostedEndpointForGroupLeaderWithOutputDeviceUIDs";
    v79[0] = MRExternalDeviceConnectionReasonUserInfoKey;
    v79[1] = MRExternalDeviceConnectionCorrelationIDUserInfoKey;
    v48 = (void *)objc_claimAutoreleasedReturnValue([v24 requestID]);
    v80[1] = v48;
    v49 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v80,  v79,  2LL));

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_100070D50;
    v58[3] = &unk_10039CBD0;
    v59 = v25;
    v60 = v45;
    id v61 = v57;
    v62 = self;
    double v65 = a5;
    id v63 = v24;
    v64 = v31;
    -[NSError connectWithOptions:userInfo:completion:](v60, "connectWithOptions:userInfo:completion:", 0LL, v49, v58);
  }

  else
  {
    v49 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 127LL);
    ((void (*)(void *, void, NSError *))v31[2])(v31, 0LL, v49);
  }

  id v37 = v51;
LABEL_16:
}

- (void)_searchForGroupUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v13 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 requestID]);
  id v15 = -[NSMutableString initWithFormat:](v13, "initWithFormat:", @"%@<%@>", @"searchForGroupID", v14);

  if (v9) {
    -[NSMutableString appendFormat:](v15, "appendFormat:", @" for %@", v9);
  }
  uint64_t v17 = _MRLogForCategory(10LL, v16);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100071370;
  v34[3] = &unk_10039A4C8;
  v35 = @"searchForGroupID";
  id v36 = v10;
  id v37 = v12;
  id v38 = v11;
  id v19 = v11;
  id v20 = v12;
  id v21 = v10;
  uint64_t v22 = objc_retainBlock(v34);
  id v23 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10007156C;
  v32[3] = &qword_10039CB30;
  id v33 = v9;
  id v24 = v9;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v21 requestReasonID]);
  qos_class_t v26 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v26, 0LL);
  v28 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000715D4;
  v30[3] = &unk_10039CB58;
  id v31 = v22;
  v29 = v22;
  [v23 searchEndpointsWithPredicate:v32 timeout:v25 reason:v28 queue:v30 completion:a4];
}

@end