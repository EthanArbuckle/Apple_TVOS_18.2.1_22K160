@interface MRDCreateEndpointRequest
+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (id)_createEndpointForOutputDeviceUIDs:(id)a3;
- (int64_t)_calculateOperationTypeForEndpoint:(id)a3;
- (void)createEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
@end

@implementation MRDCreateEndpointRequest

+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10012DFB8;
  v14[3] = &unk_10039B6F0;
  v15 = objc_alloc_init(&OBJC_CLASS___MRDCreateEndpointRequest);
  id v16 = v9;
  id v12 = v9;
  v13 = v15;
  -[MRDCreateEndpointRequest createEndpointWithOutputDeviceUIDs:timeout:details:completion:]( v13,  "createEndpointWithOutputDeviceUIDs:timeout:details:completion:",  v11,  v10,  v14,  a4);
}

- (void)createEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_alloc(&OBJC_CLASS___MRDCreateEndpointAnalytics);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 requestID]);
  v15 = -[MRDCreateEndpointAnalytics initWithRequestID:](v13, "initWithRequestID:", v14);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v17 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 requestID]);
  v19 = -[NSMutableString initWithFormat:]( v17,  "initWithFormat:",  @"%@<%@>",  @"CreateEndpointWithOutputDeviceUIDs",  v18);

  if (v10) {
    -[NSMutableString appendFormat:](v19, "appendFormat:", @" for %@", v10);
  }
  uint64_t v21 = _MRLogForCategory(10LL, v20);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v74 = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_10012E5A8;
  v67[3] = &unk_10039CB80;
  v68 = @"CreateEndpointWithOutputDeviceUIDs";
  id v23 = v11;
  id v69 = v23;
  id v24 = v16;
  id v70 = v24;
  v25 = v15;
  v71 = v25;
  id v26 = v12;
  id v72 = v26;
  v27 = objc_retainBlock(v67);
  id v28 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v23 requestReasonID]);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_10012E7B0;
  v65[3] = &unk_100399530;
  v30 = v27;
  id v66 = v30;
  id v31 = [v28 initWithTimeout:v29 reason:v65 handler:a4];

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_10012E7C4;
  v62[3] = &unk_10039A0A0;
  id v32 = v31;
  id v63 = v32;
  v51 = v30;
  id v64 = v51;
  v33 = objc_retainBlock(v62);
  v34 = v10;
  v35 = (void *)objc_claimAutoreleasedReturnValue( -[MRDCreateEndpointRequest _createEndpointForOutputDeviceUIDs:]( self,  "_createEndpointForOutputDeviceUIDs:",  v10));
  int64_t v36 = -[MRDCreateEndpointRequest _calculateOperationTypeForEndpoint:]( self,  "_calculateOperationTypeForEndpoint:",  v35);
  -[MRDCreateEndpointAnalytics setOperationType:](v25, "setOperationType:", v36);
  switch(v36)
  {
    case 0LL:
      -[MRDCreateEndpointAnalytics setOperationTypeString:](v25, "setOperationTypeString:", @"None");
      v37 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 47LL);
      ((void (*)(void *, void, NSError *))v33[2])(v33, 0LL, v37);
      goto LABEL_12;
    case 1LL:
      -[MRDCreateEndpointAnalytics setOperationTypeString:]( v25,  "setOperationTypeString:",  @"CreateHostedEndpoint");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCreateEndpointAnalytics createHostedEndpoint](v25, "createHostedEndpoint"));
      [v38 start];

      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_10012E824;
      v59[3] = &unk_10039C9F0;
      v60 = v25;
      v61 = v33;
      +[MRDCreateHostedEndpointRequest createHostedEndpointWithOutputDeviceUIDs:timeout:details:completion:]( &OBJC_CLASS___MRDCreateHostedEndpointRequest,  "createHostedEndpointWithOutputDeviceUIDs:timeout:details:completion:",  v34,  v23,  v59,  a4);

      v39 = v60;
      goto LABEL_10;
    case 2LL:
      -[MRDCreateEndpointAnalytics setOperationTypeString:]( v25,  "setOperationTypeString:",  @"CreateRemoteHostedEndpoint");
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCreateEndpointAnalytics createRemoteHostedEndpoint](v25, "createRemoteHostedEndpoint"));
      [v40 start];

      id v49 = v24;
      v41 = (void *)objc_claimAutoreleasedReturnValue([v35 groupLeader]);
      id v42 = v26;
      v43 = (void *)objc_claimAutoreleasedReturnValue([v41 uid]);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = sub_10012E8A0;
      v56[3] = &unk_10039CA90;
      v57 = v25;
      v58 = v33;
      +[MRDCreateRemoteHostedEndpointRequest createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:withOutputDeviceUIDs:timeout:details:completion:]( &OBJC_CLASS___MRDCreateRemoteHostedEndpointRequest,  "createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:withOutputDeviceUIDs:timeout:details:completion:",  v43,  v34,  v23,  v56,  a4);

      id v26 = v42;
      id v24 = v49;

      v39 = v57;
LABEL_10:

      break;
    case 3LL:
      -[MRDCreateEndpointAnalytics setOperationTypeString:]( v25,  "setOperationTypeString:",  @"ModifyOutputContext");
      id v50 = v26;
      id v44 = v24;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MRDCreateEndpointAnalytics modifyOutputContext](v25, "modifyOutputContext"));
      [v45 start];

      v37 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDeviceUIDs:]( objc_alloc(&OBJC_CLASS___MRGroupTopologyModificationRequest),  "initWithRequestDetails:type:outputDeviceUIDs:",  v23,  3LL,  v34);
      -[NSError setSuppressErrorDialog:](v37, "setSuppressErrorDialog:", 1LL);
      qos_class_t v46 = qos_class_self();
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(v46, 0LL);
      v48 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_10012E91C;
      v52[3] = &unk_10039D908;
      v53 = v25;
      v55 = v33;
      id v54 = v35;
      [v54 modifyTopologyWithRequest:v37 withReplyQueue:v48 completion:v52];

      id v24 = v44;
      id v26 = v50;

LABEL_12:
      break;
    default:
      -[MRDCreateEndpointAnalytics setOperationTypeString:](v25, "setOperationTypeString:", @"?");
      break;
  }
}

- (id)_createEndpointForOutputDeviceUIDs:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 routingServer]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hostedRoutingService]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 hostedRoutingController]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 makeEndpointWithOutputDeviceUIDs:v3 options:190]);
  return v8;
}

- (int64_t)_calculateOperationTypeForEndpoint:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v5 = [v4 supportPTOTRefactorPart1];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    if ([v6 supportMultiplayerHost])
    {
      if ([v3 connectionType] == (id)1)
      {

LABEL_10:
        int64_t v7 = 1LL;
        goto LABEL_16;
      }

      id v8 = [v3 connectionType];

      if (v8 == (id)6) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 designatedGroupLeader]);
    unsigned __int8 v10 = [v9 supportsMultiplayer];

    uint64_t v11 = 3LL;
    if (!v3) {
      uint64_t v11 = 0LL;
    }
    if ((v10 & 1) != 0) {
      int64_t v7 = 2LL;
    }
    else {
      int64_t v7 = v11;
    }
  }

  else if (v3)
  {
    int64_t v7 = 3LL;
  }

  else
  {
    int64_t v7 = 0LL;
  }

@end