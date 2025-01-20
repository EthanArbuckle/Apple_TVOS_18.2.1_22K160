@interface MRDPauseOutputDevicesRequest
+ (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
- (id)_calculateDevicesInGroup:(id)a3;
- (id)_calculateOperationForEndpoint:(id)a3 outputDeviceUIDs:(id)a4;
- (id)_calculateRelevantOutputDevicesInGroup:(id)a3 outputDeviceUIDs:(id)a4;
- (void)_discoverOutputDevices:(id)a3 completion:(id)a4;
- (void)_pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_performOperation:(id)a3 details:(id)a4 completion:(id)a5;
- (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation MRDPauseOutputDevicesRequest

+ (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(&OBJC_CLASS___MRDPauseOutputDevicesRequest);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007D644;
  v16[3] = &unk_10039D380;
  id v17 = v10;
  id v18 = a1;
  id v15 = v10;
  -[MRDPauseOutputDevicesRequest pauseOutputDeviceUIDs:details:queue:completion:]( v14,  "pauseOutputDeviceUIDs:details:queue:completion:",  v13,  v12,  v11,  v16);
}

- (void)pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = objc_alloc(&OBJC_CLASS___MRDPauseOutputDevicesRequestReport);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 requestID]);
  v16 = -[MRDPauseOutputDevicesRequestReport initWithOutputDevices:requestID:]( v14,  "initWithOutputDevices:requestID:",  v10,  v15);
  report = self->_report;
  self->_report = v16;

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v19 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v11 requestID]);
  v21 = -[NSMutableString initWithFormat:]( v19,  "initWithFormat:",  @"%@<%@>",  @"MRDPauseOutputDevicesRequest.pauseOutputDeviceUIDs",  v20);

  if (v10) {
    -[NSMutableString appendFormat:](v21, "appendFormat:", @" for %@", v10);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue([v11 reason]);

  if (v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v11 reason]);
    -[NSMutableString appendFormat:](v21, "appendFormat:", @" because %@", v24);
  }

  uint64_t v25 = _MRLogForCategory(10LL, v23);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10007D8EC;
  v32[3] = &unk_10039D3A8;
  v32[4] = self;
  id v33 = v11;
  id v35 = v10;
  id v36 = v12;
  id v34 = v18;
  id v27 = v10;
  id v28 = v12;
  id v29 = v18;
  id v30 = v11;
  v31 = objc_retainBlock(v32);
  -[MRDPauseOutputDevicesRequest _pauseOutputDeviceUIDs:details:queue:completion:]( self,  "_pauseOutputDeviceUIDs:details:queue:completion:",  v27,  v30,  v13,  v31);
}

- (void)_pauseOutputDeviceUIDs:(id)a3 details:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (dispatch_queue_s *)a5;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  id v15 = -[MRDPauseOutputDevicesRequestEndpointOperation initWithEndpoint:]( objc_alloc(&OBJC_CLASS___MRDPauseOutputDevicesRequestEndpointOperation),  "initWithEndpoint:",  0LL);
  -[MRDPauseOutputDevicesRequestReport addOperation:](self->_report, "addOperation:", v15);
  -[MRDPauseOutputDevicesRequestEndpointOperation startEvent:](v15, "startEvent:", @"discover");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10007DF70;
  v20[3] = &unk_10039D3F8;
  v21 = v15;
  v22 = self;
  id v23 = v11;
  v24 = v14;
  id v25 = v10;
  id v16 = v10;
  id v17 = v14;
  id v18 = v11;
  v19 = v15;
  -[MRDPauseOutputDevicesRequest _discoverOutputDevices:completion:]( self,  "_discoverOutputDevices:completion:",  v16,  v20);
  dispatch_group_notify(v17, v13, v12);
}

- (void)_discoverOutputDevices:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[MRAVReconnaissanceSession alloc] initWithOutputDeviceUIDs:v6 outputDeviceGroupID:0 features:8];

  [v7 setWaitForCompleteClusters:1];
  [v7 setShouldWaitForUnanimousEndpoints:0];
  [v7 setReturnPartialResults:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10007E828;
  v9[3] = &unk_10039B790;
  id v10 = v5;
  id v8 = v5;
  [v7 beginSearchWithTimeout:v9 endpointsCompletion:3.0];
}

- (id)_calculateDevicesInGroup:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 resolvedOutputDevices]);
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableSet addObject:](v4, "addObject:", *(void *)(*((void *)&v23 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v7);
  }

  if ([v3 isLocalEndpoint])
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resolvedOutputDevices", 0));
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
          if ([v15 isLocalDevice])
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uid]);
            id v17 = [v16 length];

            if (v17)
            {
              -[NSMutableSet addObject:](v4, "addObject:", v15);
              goto LABEL_20;
            }
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

- (id)_calculateRelevantOutputDevicesInGroup:(id)a3 outputDeviceUIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v19 = v5;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 outputDevices]);
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v11);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v13 = v6;
        id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v22;
          do
          {
            id v17 = 0LL;
            do
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([v12 containsUID:*(void *)(*((void *)&v21 + 1) + 8 * (void)v17)]) {
                -[NSMutableSet addObject:](v7, "addObject:", v12);
              }
              id v17 = (char *)v17 + 1;
            }

            while (v15 != v17);
            id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }

          while (v15);
        }

        id v11 = (char *)v11 + 1;
      }

      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v9);
  }

  return v7;
}

- (id)_calculateOperationForEndpoint:(id)a3 outputDeviceUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___MRDPauseOutputDevicesRequestOperation);
  -[MRDPauseOutputDevicesRequestOperation setType:](v8, "setType:", 0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPauseOutputDevicesRequest _calculateDevicesInGroup:](self, "_calculateDevicesInGroup:", v6));
  -[MRDPauseOutputDevicesRequestOperation setDevicesInGroup:](v8, "setDevicesInGroup:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDPauseOutputDevicesRequest _calculateRelevantOutputDevicesInGroup:outputDeviceUIDs:]( self,  "_calculateRelevantOutputDevicesInGroup:outputDeviceUIDs:",  v6,  v7));
  -[MRDPauseOutputDevicesRequestOperation setRelevantOutputDevices:](v8, "setRelevantOutputDevices:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPauseOutputDevicesRequestOperation relevantOutputDevices](v8, "relevantOutputDevices"));
  id v12 = [v11 count];

  if (!v12)
  {
    uint64_t v18 = 0LL;
    id v17 = @"no relevant outputDevices";
    goto LABEL_17;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPauseOutputDevicesRequestOperation devicesInGroup](v8, "devicesInGroup"));
  id v14 = [v13 count];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPauseOutputDevicesRequestOperation relevantOutputDevices](v8, "relevantOutputDevices"));
  id v16 = [v15 count];

  if (v14 != v16)
  {
    if ([v6 groupContainsDiscoverableGroupLeader])
    {
      id v17 = @"discoverable group leader";
LABEL_11:
      uint64_t v18 = 2LL;
      goto LABEL_17;
    }

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 designatedGroupLeader]);
    if ([v19 isRemoteControllable])
    {
    }

    else
    {
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 designatedGroupLeader]);
      unsigned __int8 v21 = [v20 canRelayCommunicationChannel];

      if ((v21 & 1) != 0)
      {
        id v17 = @"relayable group leader";
        goto LABEL_11;
      }
    }

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v6 designatedGroupLeader]);
    if ([v22 isRemoteControllable])
    {
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 resolvedOutputDevices]);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "msv_filter:", &stru_10039D418));
      id v25 = [v24 count];

      if (v25)
      {
        id v17 = @"undiscoverable remote controllable group leader but relay available";
        uint64_t v18 = 4LL;
        goto LABEL_17;
      }
    }

    else
    {
    }

    id v17 = @"undiscoverable group leader";
    uint64_t v18 = 3LL;
    goto LABEL_17;
  }

  id v17 = @"all devices in group need to pause";
  uint64_t v18 = 1LL;
LABEL_17:
  -[MRDPauseOutputDevicesRequestOperation setReason:](v8, "setReason:", v17);
  -[MRDPauseOutputDevicesRequestOperation setType:](v8, "setType:", v18);

  return v8;
}

- (void)_performOperation:(id)a3 details:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  uint64_t v10 = objc_alloc(&OBJC_CLASS___NSString);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 endpoint]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 debugName]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 pauseOperation]);
  unint64_t v14 = (unint64_t)[v13 type];
  if (v14 > 4) {
    id v15 = @"?";
  }
  else {
    id v15 = off_10039D620[v14];
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 pauseOperation]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 relevantOutputDevices]);
  uint64_t v18 = -[NSString initWithFormat:](v10, "initWithFormat:", @"Endpoint %@ will %@ %@", v12, v15, v17);

  uint64_t v20 = _MRLogForCategory(10LL, v19);
  unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v8 requestID]);
    *(_DWORD *)buf = 138543874;
    v90 = @"MRDPauseOutputDevicesRequest.pauseOutputDeviceUIDs";
    __int16 v91 = 2114;
    v92 = v22;
    __int16 v93 = 2112;
    v94 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 pauseOperation]);
  id v24 = [v23 type];

  switch((unint64_t)v24)
  {
    case 0uLL:
      v9[2](v9);
      break;
    case 1uLL:
      [v7 startEvent:@"pause"];
      id v25 = objc_alloc(&OBJC_CLASS___MRNowPlayingRequest);
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v7 endpoint]);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 origin]);
      __int128 v28 = (MRGroupTopologyModificationRequest *)[v25 initWithOrigin:v27];

      v87[0] = kMRMediaRemoteOptionContextID;
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v8 requestID]);
      v88[0] = v29;
      v87[1] = kMRMediaRemoteOptionRemoteControlInterfaceIdentifier;
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 reason]);
      v88[1] = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  2LL));

      qos_class_t v32 = qos_class_self();
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(v32, 0LL);
      id v34 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472LL;
      v84[2] = sub_10007F61C;
      v84[3] = &unk_100399DD0;
      id v85 = v7;
      v86 = v9;
      -[MRGroupTopologyModificationRequest sendCommand:options:queue:completion:]( v28,  "sendCommand:options:queue:completion:",  1LL,  v31,  v34,  v84);

      goto LABEL_10;
    case 2uLL:
      uint64_t v35 = MRGroupTopologyModificationRequestTypeDescription(2LL);
      id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      [v7 startEvent:v36];

      v37 = objc_alloc(&OBJC_CLASS___MRGroupTopologyModificationRequest);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v7 pauseOperation]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 relevantOutputDevices]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 allObjects]);
      __int128 v28 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]( v37,  "initWithRequestDetails:type:outputDevices:",  v8,  2LL,  v40);

      -[MRGroupTopologyModificationRequest setSuppressErrorDialog:](v28, "setSuppressErrorDialog:", 1LL);
      v41 = (void *)objc_claimAutoreleasedReturnValue([v7 endpoint]);
      qos_class_t v42 = qos_class_self();
      dispatch_queue_global_t v43 = dispatch_get_global_queue(v42, 0LL);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472LL;
      v81[2] = sub_10007F674;
      v81[3] = &unk_10039BAB8;
      id v82 = v7;
      v83 = v9;
      [v41 modifyTopologyWithRequest:v28 withReplyQueue:v44 completion:v81];

LABEL_10:
      break;
    case 3uLL:
      [v7 startEvent:@"removeFromParentGroup"];
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 routingServer]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v7 pauseOperation]);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v47 relevantOutputDeviceUIDs]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 allObjects]);
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472LL;
      v78[2] = sub_10007F6D4;
      v78[3] = &unk_10039BAB8;
      id v79 = v7;
      v80 = v9;
      [v46 removeOutputDeviceUIDsFromParentGroup:v49 details:v8 completion:v78];

      v50 = v79;
      goto LABEL_18;
    case 4uLL:
      v51 = (void *)objc_claimAutoreleasedReturnValue([v7 pauseOperation]);
      v52 = (void *)objc_claimAutoreleasedReturnValue([v51 devicesInGroup]);
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "msv_filter:", &stru_10039D438));

      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472LL;
      v76[2] = sub_10007F728;
      v76[3] = &unk_10039AC00;
      id v54 = v7;
      id v77 = v54;
      uint64_t v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "msv_firstWhere:", v76));
      v56 = (void *)v55;
      if (!v55) {
        v56 = (void *)objc_claimAutoreleasedReturnValue([v53 firstObject]);
      }
      v71 = v53;
      [v54 startEvent:@"createRelayEndpointForOutputDeviceUIDs"];
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      v58 = (void *)objc_claimAutoreleasedReturnValue([v57 routingServer]);
      v70 = v56;
      v59 = (void *)objc_claimAutoreleasedReturnValue([v56 uid]);
      v60 = (void *)objc_claimAutoreleasedReturnValue([v58 createTransientEndpointForOutputDeviceUID:v59 details:v8]);

      [v54 endEvent:@"createRelayEndpointForOutputDeviceUIDs" withError:0];
      if (v60)
      {
        BOOL v69 = v55 == 0;
        v61 = objc_alloc(&OBJC_CLASS___MRGroupTopologyModificationRequest);
        v62 = (void *)objc_claimAutoreleasedReturnValue([v54 pauseOperation]);
        v63 = (void *)objc_claimAutoreleasedReturnValue([v62 relevantOutputDeviceUIDs]);
        v64 = (void *)objc_claimAutoreleasedReturnValue([v63 allObjects]);
        v65 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDeviceUIDs:]( v61,  "initWithRequestDetails:type:outputDeviceUIDs:",  v8,  2LL,  v64);

        -[MRGroupTopologyModificationRequest setSuppressErrorDialog:](v65, "setSuppressErrorDialog:", 1LL);
        [v54 startEvent:@"modifyRelayEndpoint"];
        qos_class_t v66 = qos_class_self();
        dispatch_queue_global_t v67 = dispatch_get_global_queue(v66, 0LL);
        v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472LL;
        v72[2] = sub_10007F7A4;
        v72[3] = &unk_10039D460;
        BOOL v75 = v69;
        id v73 = v54;
        v74 = v9;
        [v60 modifyTopologyWithRequest:v65 withReplyQueue:v68 completion:v72];
      }

      else
      {
        v9[2](v9);
      }

      v50 = v71;
LABEL_18:

      break;
    default:
      break;
  }
}

- (void).cxx_destruct
{
}

@end