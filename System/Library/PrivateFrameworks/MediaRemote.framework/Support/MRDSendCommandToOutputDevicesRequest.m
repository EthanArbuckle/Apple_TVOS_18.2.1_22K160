@interface MRDSendCommandToOutputDevicesRequest
+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 details:(id)a7 completion:(id)a8;
+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 playerPath:(id)a6 timeout:(double)a7 details:(id)a8 completion:(id)a9;
- (BOOL)_doesRequestContainLocalDeviceUID:(id)a3;
- (BOOL)_isRequestForCompanionOrigin:(id)a3;
- (BOOL)_isRequestForCurrentCongifuration:(id)a3;
- (BOOL)_isRequestForLocalOrigin:(id)a3;
- (id)_resolveOutputDevices:(id)a3;
- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 details:(id)a7 completion:(id)a8;
- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 playerPath:(id)a6 timeout:(double)a7 details:(id)a8 completion:(id)a9;
@end

@implementation MRDSendCommandToOutputDevicesRequest

+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 playerPath:(id)a6 timeout:(double)a7 details:(id)a8 completion:(id)a9
{
  uint64_t v14 = *(void *)&a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10013F24C;
  v22[3] = &unk_1003A2568;
  v23 = objc_alloc_init(&OBJC_CLASS___MRDSendCommandToOutputDevicesRequest);
  id v24 = v15;
  id v20 = v15;
  v21 = v23;
  -[MRDSendCommandToOutputDevicesRequest _sendCommand:withOptions:toNewEndpointContainingOutputDeviceUIDs:playerPath:timeout:details:completion:]( v21,  "_sendCommand:withOptions:toNewEndpointContainingOutputDeviceUIDs:playerPath:timeout:details:completion:",  v14,  v19,  v18,  v17,  v16,  v22,  a7);
}

+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 details:(id)a7 completion:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10013F360;
  v19[3] = &unk_1003A1F38;
  id v20 = objc_alloc_init(&OBJC_CLASS___MRDSendCommandToOutputDevicesRequest);
  id v21 = v13;
  id v17 = v13;
  id v18 = v20;
  -[MRDSendCommandToOutputDevicesRequest _sendCommand:withOptions:toEachEndpointContainingOutputDeviceUIDs:timeout:details:completion:]( v18,  "_sendCommand:withOptions:toEachEndpointContainingOutputDeviceUIDs:timeout:details:completion:",  v12,  v16,  v15,  v14,  v19,  a6);
}

- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 playerPath:(id)a6 timeout:(double)a7 details:(id)a8 completion:(id)a9
{
  uint64_t v14 = *(void *)&a3;
  id v80 = a4;
  id v16 = a5;
  id v76 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = objc_alloc(&OBJC_CLASS___MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceInfo]);
  v22 = -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics initWithDetails:deviceInfo:numberOfRequestedOutputDeviceUIDs:timeout:]( v19,  "initWithDetails:deviceInfo:numberOfRequestedOutputDeviceUIDs:timeout:",  v17,  v21,  [v16 count],  a7);

  v23 = (void *)MRMediaRemoteCopyCommandDescription(v14);
  -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics setCommandString:](v22, "setCommandString:", v23);

  -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics setCommand:](v22, "setCommand:", v14);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v25 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v17 requestID]);
  v27 = -[NSMutableString initWithFormat:]( v25,  "initWithFormat:",  @"%@<%@>",  @"sendCommandToNewEndpointContainingOutputDeviceUIDs",  v26);

  if (v16) {
    -[NSMutableString appendFormat:](v27, "appendFormat:", @" for %@", v16);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue([v17 reason]);

  if (v28)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([v17 reason]);
    -[NSMutableString appendFormat:](v27, "appendFormat:", @" because %@", v30);
  }

  uint64_t v31 = _MRLogForCategory(10LL, v29);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v126 = v27;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472LL;
  v119[2] = sub_10013FC78;
  v119[3] = &unk_1003A2590;
  v120 = @"sendCommandToNewEndpointContainingOutputDeviceUIDs";
  id v33 = v17;
  id v121 = v33;
  id v84 = v24;
  id v122 = v84;
  v34 = v22;
  v123 = v34;
  id v83 = v18;
  id v124 = v83;
  v35 = objc_retainBlock(v119);
  id v36 = (id)objc_claimAutoreleasedReturnValue( -[MRDSendCommandToOutputDevicesRequest _resolveOutputDevices:]( self,  "_resolveOutputDevices:",  v16));
  v37 = v36;
  v38 = (NSString *)v16;
  v82 = v16;
  if (v36 != v16)
  {
    unsigned __int8 v39 = [v36 isEqual:v16];

    if ((v39 & 1) != 0) {
      goto LABEL_13;
    }
    v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Resolving to outputDeviceUIDs: %@",  v37);
    uint64_t v41 = _MRLogForCategory(10LL, v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v33 name]);
      v44 = self;
      v45 = (void *)objc_claimAutoreleasedReturnValue([v33 requestID]);
      *(_DWORD *)buf = 138543874;
      v126 = v43;
      __int16 v127 = 2114;
      v128 = v45;
      __int16 v129 = 2112;
      v130 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);

      self = v44;
    }
  }

LABEL_13:
  id v46 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v33 requestReasonID]);
  qos_class_t v48 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v48, 0LL);
  v50 = self;
  v51 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472LL;
  v117[2] = sub_1001400F4;
  v117[3] = &unk_100399530;
  v52 = v35;
  id v118 = v52;
  id v53 = [v46 initWithTimeout:v47 reason:v51 queue:v117 handler:a7];

  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472LL;
  v114[2] = sub_100140160;
  v114[3] = &unk_1003A2568;
  id v75 = v53;
  id v115 = v75;
  v79 = v52;
  id v116 = v79;
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472LL;
  v112[2] = sub_1001401C0;
  v112[3] = &unk_100399530;
  v54 = objc_retainBlock(v114);
  id v113 = v54;
  v55 = objc_retainBlock(v112);
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472LL;
  v105[2] = sub_10014022C;
  v105[3] = &unk_1003A25E0;
  v56 = v34;
  v106 = v56;
  id v78 = v33;
  id v107 = v78;
  id v77 = v76;
  id v108 = v77;
  int v111 = v14;
  id v57 = v80;
  id v109 = v57;
  v81 = v55;
  id v110 = v81;
  v74 = objc_retainBlock(v105);
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472LL;
  v102[2] = sub_100140574;
  v102[3] = &unk_1003A2608;
  v102[4] = v50;
  id v58 = v37;
  id v103 = v58;
  v59 = v56;
  v104 = v59;
  v60 = objc_retainBlock(v102);
  uint64_t v61 = ((uint64_t (*)(void))v60[2])();
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics sendCommand](v59, "sendCommand"));
    [v63 start];

    v64 = (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)[[MRNowPlayingRequest alloc] initWithOrigin:v62];
    qos_class_t v65 = qos_class_self();
    dispatch_queue_global_t v66 = dispatch_get_global_queue(v65, 0LL);
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472LL;
    v99[2] = sub_100140604;
    v99[3] = &unk_100399DD0;
    v100 = v59;
    v101 = v54;
    -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics sendCommand:options:queue:completion:]( v64,  "sendCommand:options:queue:completion:",  v14,  v57,  v67,  v99);

    v68 = v78;
    v69 = v81;
    v70 = v74;
  }

  else
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue( -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics createPartialEndpoint]( v59,  "createPartialEndpoint"));
    [v71 start];

    if (-[MRDSendCommandToOutputDevicesRequest _isRequestForCurrentCongifuration:]( v50,  "_isRequestForCurrentCongifuration:",  v58))
    {
      -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics setRequestForCurrentConfiguration:]( v59,  "setRequestForCurrentConfiguration:",  1LL);
      v72 = (void *)objc_claimAutoreleasedReturnValue( -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics createEndpointWithCurrentTopology]( v59,  "createEndpointWithCurrentTopology"));
      [v72 start];

      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472LL;
      v95[2] = sub_1001406A4;
      v95[3] = &unk_1003A2658;
      v96 = v59;
      v70 = v74;
      v97 = v74;
      v98 = v54;
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472LL;
      v92[2] = sub_1001407BC;
      v92[3] = &unk_10039A2C8;
      v93 = v96;
      v69 = v81;
      v94 = v81;
      v68 = v78;
      +[MRDCreateEndpointFromCurrentTopologyRequest createEndpointWithCurrentTopologyWithTimeout:details:previewCallback:completion:]( &OBJC_CLASS___MRDCreateEndpointFromCurrentTopologyRequest,  "createEndpointWithCurrentTopologyWithTimeout:details:previewCallback:completion:",  v78,  v95,  v92,  a7);

      v64 = v96;
    }

    else
    {
      -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics setRequestContainsLocalDeviceUID:]( v59,  "setRequestContainsLocalDeviceUID:",  -[MRDSendCommandToOutputDevicesRequest _doesRequestContainLocalDeviceUID:]( v50,  "_doesRequestContainLocalDeviceUID:",  v58));
      v73 = (void *)objc_claimAutoreleasedReturnValue( -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics createOptimizedEndpoint]( v59,  "createOptimizedEndpoint"));
      [v73 start];

      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472LL;
      v88[2] = sub_100140838;
      v88[3] = &unk_1003A2658;
      v89 = v59;
      v70 = v74;
      v90 = v74;
      v91 = v54;
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472LL;
      v85[2] = sub_100140950;
      v85[3] = &unk_10039A3A8;
      v86 = v89;
      v69 = v81;
      v87 = v81;
      v68 = v78;
      +[MRDCreateOptimizedEndpointRequest createOptimizedEndpointWithOutputDeviceUIDs:timeout:details:previewCallback:completion:]( &OBJC_CLASS___MRDCreateOptimizedEndpointRequest,  "createOptimizedEndpointWithOutputDeviceUIDs:timeout:details:previewCallback:completion:",  v58,  v78,  v88,  v85,  a7);

      v64 = v89;
    }
  }
}

- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 details:(id)a7 completion:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v88 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = objc_alloc(&OBJC_CLASS___MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceInfo]);
  id v20 = -[MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics initWithDetails:deviceInfo:numberOfRequestedOutputDeviceUIDs:timeout:]( v17,  "initWithDetails:deviceInfo:numberOfRequestedOutputDeviceUIDs:timeout:",  v15,  v19,  [v14 count],  a6);

  id v21 = (void *)MRMediaRemoteCopyCommandDescription(v12);
  -[MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics setCommandString:](v20, "setCommandString:", v21);

  unsigned int v84 = v12;
  -[MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics setCommand:](v20, "setCommand:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v23 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 requestID]);
  v25 = -[NSMutableString initWithFormat:]( v23,  "initWithFormat:",  @"%@<%@>",  @"sendCommandToEachEndpointContainingOutputDeviceUIDs",  v24);

  if (v14) {
    -[NSMutableString appendFormat:](v25, "appendFormat:", @" for %@", v14);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue([v15 reason]);

  if (v26)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v15 reason]);
    -[NSMutableString appendFormat:](v25, "appendFormat:", @" because %@", v28);
  }

  uint64_t v29 = _MRLogForCategory(10LL, v27);
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v122 = v25;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472LL;
  v115[2] = sub_1001411DC;
  v115[3] = &unk_1003A2720;
  id v116 = @"sendCommandToEachEndpointContainingOutputDeviceUIDs";
  id v31 = v15;
  id v117 = v31;
  id v86 = v22;
  id v118 = v86;
  id v80 = v20;
  v119 = v80;
  id v85 = v16;
  id v120 = v85;
  v32 = objc_retainBlock(v115);
  id v33 = (id)objc_claimAutoreleasedReturnValue( -[MRDSendCommandToOutputDevicesRequest _resolveOutputDevices:]( self,  "_resolveOutputDevices:",  v14));
  v34 = v33;
  v35 = (NSString *)v14;
  if (v33 != v14)
  {
    unsigned __int8 v36 = [v33 isEqual:v14];

    if ((v36 & 1) != 0) {
      goto LABEL_13;
    }
    v35 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Resolving to outputDeviceUIDs: %@",  v34);
    uint64_t v38 = _MRLogForCategory(10LL, v37);
    unsigned __int8 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = v14;
      uint64_t v41 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v31 name]);
      v42 = self;
      v43 = (void *)objc_claimAutoreleasedReturnValue([v31 requestID]);
      *(_DWORD *)buf = 138543874;
      id v122 = v41;
      __int16 v123 = 2114;
      id v124 = v43;
      __int16 v125 = 2112;
      v126 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);

      self = v42;
      id v14 = v40;
    }
  }

LABEL_13:
  v87 = v14;
  v44 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v45 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  id v46 = self;
  v47 = (void *)objc_claimAutoreleasedReturnValue([v31 requestReasonID]);
  qos_class_t v48 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v48, 0LL);
  v50 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472LL;
  v112[2] = sub_1001415D4;
  v112[3] = &unk_10039BAB8;
  v51 = v44;
  id v113 = v51;
  v52 = v32;
  id v114 = v52;
  id v53 = [v45 initWithTimeout:v47 reason:v50 queue:v112 handler:a6];

  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472LL;
  v109[2] = sub_100141660;
  v109[3] = &unk_1003A1F38;
  id v54 = v53;
  v55 = v46;
  id v82 = v54;
  id v110 = v54;
  id v83 = v52;
  id v111 = v83;
  v56 = objc_retainBlock(v109);
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472LL;
  v102[2] = sub_1001416C0;
  v102[3] = &unk_1003A27B0;
  id v57 = v80;
  id v103 = v57;
  id v58 = v31;
  id v104 = v58;
  unsigned int v108 = v84;
  id v89 = v88;
  id v105 = v89;
  v81 = v51;
  v106 = v81;
  v59 = v56;
  id v107 = v59;
  id v78 = objc_retainBlock(v102);
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472LL;
  v99[2] = sub_100141C88;
  v99[3] = &unk_1003A2608;
  void v99[4] = v55;
  id v60 = v34;
  id v100 = v60;
  uint64_t v61 = v57;
  v101 = v61;
  v62 = objc_retainBlock(v99);
  uint64_t v63 = ((uint64_t (*)(void))v62[2])();
  v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
  v79 = v58;
  if (v64)
  {
    -[MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics setNumberOfEndpoints:]( v61,  "setNumberOfEndpoints:",  1LL);
    qos_class_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics sendCommands](v61, "sendCommands"));
    [v65 start];

    id v66 = [[MRNowPlayingRequest alloc] initWithOrigin:v64];
    qos_class_t v67 = qos_class_self();
    dispatch_queue_global_t v68 = dispatch_get_global_queue(v67, 0LL);
    v69 = (__CFString *)objc_claimAutoreleasedReturnValue(v68);
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472LL;
    v96[2] = sub_100141D34;
    v96[3] = &unk_100399DD0;
    v70 = (id *)&v97;
    v97 = v61;
    v71 = (id *)&v98;
    v98 = v59;
    [v66 sendCommand:v84 options:v89 queue:v69 completion:v96];
    v72 = v78;
  }

  else
  {
    id v66 = [[MRAVReconnaissanceSession alloc] initWithOutputDeviceUIDs:v60 outputDeviceGroupID:0 features:8 details:v58];
    [v66 setShouldWaitForUnanimousEndpoints:0];
    [v66 setReturnPartialResults:1];
    -[MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics setRequestContainsLocalDeviceUID:]( v61,  "setRequestContainsLocalDeviceUID:",  -[MRDSendCommandToOutputDevicesRequest _doesRequestContainLocalDeviceUID:]( v55,  "_doesRequestContainLocalDeviceUID:",  v60));
    id v73 = v60;
    v74 = v59;
    id v75 = v58;
    id v76 = (void *)objc_claimAutoreleasedReturnValue( -[MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics discoverOutputDevices]( v61,  "discoverOutputDevices"));
    [v76 start];

    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_100141E0C;
    v90[3] = &unk_1003A2818;
    v70 = (id *)&v91;
    v91 = v61;
    v71 = &v92;
    id v92 = v87;
    v93 = @"sendCommandToEachEndpointContainingOutputDeviceUIDs";
    id v77 = v75;
    v59 = v74;
    id v60 = v73;
    id v94 = v77;
    v72 = v78;
    v95 = v78;
    [v66 beginSearchWithTimeout:v90 endpointsCompletion:5.0];

    v69 = (__CFString *)v93;
  }
}

- (id)_resolveOutputDevices:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "msv_map:", &stru_1003A2838));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001423B8;
  v10[3] = &unk_1003A2860;
  id v11 = v5;
  id v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "msv_map:", v10));

  return v8;
}

- (BOOL)_isRequestForCurrentCongifuration:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 += objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "length", (void)v12);
        }

        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
      BOOL v10 = v7 == 0;
    }

    else
    {
      BOOL v10 = 1;
    }
  }

  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)_isRequestForLocalOrigin:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceUID]);
  BOOL v7 = 0;
  if (!v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "msv_firstWhere:", &stru_1003A28A0));

    if (v8) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (BOOL)_isRequestForCompanionOrigin:(id)a3
{
  id v3 = a3;
  id v4 = -[MROrigin initWithIdentifier:type:displayName:]( objc_alloc(&OBJC_CLASS___MROrigin),  "initWithIdentifier:type:displayName:",  1129140302LL,  1LL,  &stru_1003AE680);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nowPlayingServer]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 originClientForOrigin:v4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInfo]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100142780;
  v12[3] = &unk_10039B1C0;
  id v13 = v8;
  id v9 = v8;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "msv_firstWhere:", v12));

  return v10 != 0LL;
}

- (BOOL)_doesRequestContainLocalDeviceUID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001428B4;
  v9[3] = &unk_10039B1C0;
  id v10 = v5;
  id v6 = v5;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "msv_firstWhere:", v9));

  return v7 != 0LL;
}

@end