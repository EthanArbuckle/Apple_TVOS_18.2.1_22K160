@interface MRDCreateHostedEndpointRequest
+ (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (void)_createHostedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (void)_maybeSendCommandPreviewForOutputDeviceUID:(id)a3 details:(id)a4;
- (void)_searchForBuddyLeaderWithTimeout:(double)a3 details:(id)a4 completion:(id)a5;
- (void)_searchForContextUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
@end

@implementation MRDCreateHostedEndpointRequest

+ (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006E740;
  v14[3] = &unk_10039C9F0;
  v15 = objc_alloc_init(&OBJC_CLASS___MRDCreateHostedEndpointRequest);
  id v16 = v9;
  id v12 = v9;
  v13 = v15;
  -[MRDCreateHostedEndpointRequest _createHostedEndpointWithOutputDeviceUIDs:timeout:details:completion:]( v13,  "_createHostedEndpointWithOutputDeviceUIDs:timeout:details:completion:",  v11,  v10,  v14,  a4);
}

- (void)_createHostedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc(&OBJC_CLASS___MRDCreateHostedEndpointAnalytics);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 requestID]);
  v14 = -[MRDCreateHostedEndpointAnalytics initWithRequestID:](v12, "initWithRequestID:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 requestID]);
  v17 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"CreateHostedEndpointWithOutputDeviceUIDs",  v16);
  v19 = v17;
  if (v9) {
    -[NSMutableString appendFormat:](v17, "appendFormat:", @" for %@", v9);
  }
  uint64_t v20 = _MRLogForCategory(10LL, v18);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v78 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_10006ECC0;
  v70[3] = &unk_10039CA18;
  id v22 = v9;
  id v71 = v22;
  v72 = @"CreateHostedEndpointWithOutputDeviceUIDs";
  id v23 = v16;
  id v73 = v23;
  id v51 = v15;
  id v74 = v51;
  v24 = v14;
  v75 = v24;
  id v50 = v11;
  id v76 = v50;
  v25 = objc_retainBlock(v70);
  id v26 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v10 requestReasonID]);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_10006F08C;
  v68[3] = &unk_100399530;
  v28 = v25;
  id v69 = v28;
  id v29 = [v26 initWithTimeout:v27 reason:v68 handler:a4];

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_10006F0A0;
  v65[3] = &unk_10039A0A0;
  id v30 = v29;
  id v66 = v30;
  v31 = v28;
  id v67 = v31;
  v32 = objc_retainBlock(v65);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if (![v33 supportMultiplayerHost])
  {

    goto LABEL_12;
  }

  id v34 = [v22 count];

  if (!v34)
  {
LABEL_12:
    v41 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 2LL);
    ((void (*)(void *, void, NSError *))v32[2])(v32, 0LL, v41);

    goto LABEL_15;
  }

  id v47 = v23;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_10006F100;
  v59[3] = &unk_10039CA68;
  v59[4] = self;
  id v35 = v22;
  id v60 = v35;
  id v44 = v10;
  id v61 = v44;
  v43 = v32;
  id v63 = v43;
  v36 = v24;
  v62 = v36;
  double v64 = a4;
  v46 = objc_retainBlock(v59);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 deviceInfo]);

  uint64_t v39 = objc_claimAutoreleasedReturnValue([v38 deviceUID]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v38 clusterID]);
  v45 = (void *)v39;
  if ((([v35 containsObject:v39] & 1) != 0
     || [v35 containsObject:v48])
    && (([v38 clusterType] - 1) & 0xFFFFFFFD) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCreateHostedEndpointAnalytics searchForBuddy](v36, "searchForBuddy"));
    [v42 start];

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_10006F450;
    v52[3] = &unk_10039CAB8;
    v53 = v36;
    id v54 = v35;
    double v58 = a4;
    id v55 = v44;
    v56 = v43;
    v40 = v46;
    v57 = v46;
    -[MRDCreateHostedEndpointRequest _searchForBuddyLeaderWithTimeout:details:completion:]( self,  "_searchForBuddyLeaderWithTimeout:details:completion:",  v55,  v52,  a4);
  }

  else
  {
    v40 = v46;
    ((void (*)(void *))v46[2])(v46);
  }

  id v23 = v47;

LABEL_15:
}

- (void)_maybeSendCommandPreviewForOutputDeviceUID:(id)a3 details:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInfo]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if (objc_msgSend( v8,  "containsDevice:",  *(void *)(*((void *)&v16 + 1) + 8 * (void)i),  (void)v16))
        {
          v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  @"CreateHostedEndpointWithOutputDeviceUIDs.sendCommandPreview",  kMRMediaRemoteOptionRemoteControlInterfaceIdentifier);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v6 requestID]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v15,  kMRMediaRemoteOptionCommandID);

          +[MRDAVOutputContextExternalDevice _sendCommandPreview:options:playerPath:]( &OBJC_CLASS___MRDAVOutputContextExternalDevice,  "_sendCommandPreview:options:playerPath:",  0LL,  v14,  0LL);
          goto LABEL_11;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

- (void)_searchForBuddyLeaderWithTimeout:(double)a3 details:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v9 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 requestID]);
  id v11 = -[NSMutableString initWithFormat:]( v9,  "initWithFormat:",  @"%@<%@>",  @"CreateHostedEndpointWithOutputDeviceUIDs.searchForBuddyLeader",  v10);

  uint64_t v13 = _MRLogForCategory(10LL, v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10006FA84;
  v29[3] = &unk_10039A4C8;
  id v30 = @"CreateHostedEndpointWithOutputDeviceUIDs.searchForBuddyLeader";
  id v15 = v6;
  id v31 = v15;
  id v16 = v8;
  id v32 = v16;
  id v17 = v7;
  id v33 = v17;
  __int128 v18 = objc_retainBlock(v29);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceInfo]);

  if ((([v20 clusterType] - 1) & 0xFFFFFFFD) != 0)
  {
    ((void (*)(void *, void, void))v18[2])(v18, 0LL, 0LL);
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceUID]);
    id v22 = objc_alloc(&OBJC_CLASS___MRAVReconnaissanceSession);
    id v34 = v21;
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    id v24 = [v22 initWithOutputDeviceUIDs:v23 outputDeviceGroupID:0 features:8 details:v15];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10006FC80;
    v26[3] = &unk_10039CB08;
    id v27 = v21;
    v28 = v18;
    id v25 = v21;
    [v24 beginSearchWithTimeout:v26 completion:3.0];
  }
}

- (void)_searchForContextUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v13 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 requestID]);
  id v15 = -[NSMutableString initWithFormat:]( v13,  "initWithFormat:",  @"%@<%@>",  @"CreateHostedEndpointWithOutputDeviceUIDs.searchForContextID",  v14);

  if (v9) {
    -[NSMutableString appendFormat:](v15, "appendFormat:", @" for %@", v9);
  }
  uint64_t v17 = _MRLogForCategory(10LL, v16);
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000700B0;
  v34[3] = &unk_10039A4C8;
  id v35 = @"CreateHostedEndpointWithOutputDeviceUIDs.searchForContextID";
  id v36 = v10;
  id v37 = v12;
  id v38 = v11;
  id v19 = v11;
  id v20 = v12;
  id v21 = v10;
  id v22 = objc_retainBlock(v34);
  id v23 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000702AC;
  v32[3] = &qword_10039CB30;
  id v33 = v9;
  id v24 = v9;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 requestReasonID]);
  qos_class_t v26 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v26, 0LL);
  v28 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100070318;
  v30[3] = &unk_10039CB58;
  id v31 = v22;
  id v29 = v22;
  [v23 searchEndpointsWithPredicate:v32 timeout:v25 reason:v28 queue:v30 completion:a4];
}

@end