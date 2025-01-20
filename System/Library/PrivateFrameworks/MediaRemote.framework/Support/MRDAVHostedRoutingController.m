@interface MRDAVHostedRoutingController
+ (id)_expectedSuffixForNewEndpointWithGroupLeader:(id)a3 outputDevices:(id)a4;
- (id)_createGroupsFrom:(id)a3 availableOutputDevices:(id)a4;
- (id)_createNativeGroupForLocalDeviceFromNativeOutputDevice:(id)a3 availableOutputDevices:(id)a4;
- (id)_maybeAddNativeGroupToGroups:(id)a3 availableOutputDevices:(id)a4;
- (id)_onQueue_makeExternalDeviceTransportForEndpoint:(id)a3 designatedGroupLeader:(id)a4;
- (id)_sortNativeGroupToEnd:(id)a3;
- (id)makeEndpointWithOutputDevices:(id)a3 options:(unint64_t)a4;
- (void)_logEndpointsChanged:(id)a3 oldEndpoints:(id)a4;
- (void)_onQueue_reloadEndpoints;
- (void)_onQueue_reloadWithOutputDevices:(id)a3;
@end

@implementation MRDAVHostedRoutingController

- (id)makeEndpointWithOutputDevices:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_10005B3A0;
  v19 = sub_10005B3B0;
  id v20 = 0LL;
  serialQueue = (dispatch_queue_s *)self->super._serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10005B3B8;
  v11[3] = &unk_10039BD10;
  v11[4] = self;
  id v12 = v6;
  v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(serialQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)_onQueue_makeExternalDeviceTransportForEndpoint:(id)a3 designatedGroupLeader:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  switch((unint64_t)[v6 transportType])
  {
    case 1uLL:
    case 5uLL:
      if ([v5 connectionType] == (id)5)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue([v5 outputDevices]);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 groupID]);

        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outputDevices", 0));
        id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            unint64_t v14 = 0LL;
            do
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue([v6 uid]);
              unsigned int v17 = [v15 containsUID:v16];

              if (v17)
              {
                uint64_t v18 = objc_claimAutoreleasedReturnValue([v15 groupID]);

                id v9 = (void *)v18;
              }

              unint64_t v14 = (char *)v14 + 1;
            }

            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }

          while (v12);
        }
      }

      else
      {
        id v9 = 0LL;
      }

      id v19 = objc_msgSend( [MRAVOutputDeviceTransport alloc],  "initWithOutputDevice:groupID:connectionType:",  v6,  v9,  objc_msgSend(v5, "connectionType"));

      break;
    case 2uLL:
      id v21 = objc_alloc(&OBJC_CLASS___MRRapportTransport);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v5 outputDevices]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
      id v19 = [v21 initWithOutputDevice:v23 proxyOutputDevice:v6];

      break;
    case 3uLL:
      id v20 = (__objc2_class *)&OBJC_CLASS___MRIDSCompanionTransport;
      goto LABEL_21;
    case 4uLL:
      id v20 = &OBJC_CLASS___MRDIDSTransport;
      goto LABEL_21;
    case 6uLL:
      id v20 = &OBJC_CLASS___MRDGroupSessionTransport;
      goto LABEL_21;
    case 7uLL:
      id v20 = &OBJC_CLASS___MRDMRRelayTransport;
LABEL_21:
      id v19 = [[v20 alloc] initWithOutputDevice:v6];
      break;
    default:
      id v19 = 0LL;
      break;
  }

  return v19;
}

- (void)_onQueue_reloadEndpoints
{
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint outputDevices](self->super._localEndpoint, "outputDevices"));
  id v4 = -[NSArray mutableCopy](self->super._distantOutputDevices, "mutableCopy");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController deviceInfo](self, "deviceInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceUID]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController deviceInfo](self, "deviceInfo"));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v8 airPlayGroupUID]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController deviceInfo](self, "deviceInfo"));
  unsigned __int8 v10 = [v9 isGroupLeader];

  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_10005BFDC;
  v84[3] = &unk_10039BD38;
  unsigned __int8 v85 = v10;
  v84[4] = self;
  int v64 = sub_10005BFDC((uint64_t)v84);
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  id v11 = v3;
  id v12 = [v11 countByEnumeratingWithState:&v80 objects:v88 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v81;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v81 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)i);
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uid]);
        [v16 isLocalDevice];
        if ([v17 length]) {
          [v5 addObject:v17];
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v80 objects:v88 count:16];
    }

    while (v13);
  }

  v60 = v11;

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
  id v19 = [v18 clusterStatus];

  v62 = v4;
  v63 = self;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[MRDHostedRoutingController filterOutputDevices:remoteControllableOnly:]( self,  "filterOutputDevices:remoteControllableOnly:",  v4,  1LL));
  id v20 = [obj countByEnumeratingWithState:&v76 objects:v87 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v77;
    if (v19 == (id)2) {
      int v23 = 1;
    }
    else {
      int v23 = v64 ^ 1;
    }
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v77 != v22) {
          objc_enumerationMutation(obj);
        }
        __int128 v25 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)j);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uid]);
        if ([v5 containsObject:v26])
        {

          if (!v23) {
            continue;
          }
        }

        else
        {
          unsigned int v27 = [v25 containsUID:v7];

          if ((v27 & v64) == 1 && v19 != (id)2) {
            continue;
          }
        }

        if ([v25 isProxyGroupPlayer])
        {
          if ([v25 containsUID:v7] && v19 != (id)2)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
            unsigned int v31 = [v30 supportMultiplayerHost];

            if (!v31) {
              continue;
            }
          }
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue([v25 groupID]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:v32]);
        if (!v33)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          [v66 setObject:v33 forKeyedSubscript:v32];
        }

        [v33 addObject:v25];
      }

      id v21 = [obj countByEnumeratingWithState:&v76 objects:v87 count:16];
    }

    while (v21);
  }

  v34 = v63;
  v35 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedRoutingController _createGroupsFrom:availableOutputDevices:]( v63,  "_createGroupsFrom:availableOutputDevices:",  v66,  obj));
  v36 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedRoutingController _maybeAddNativeGroupToGroups:availableOutputDevices:]( v63,  "_maybeAddNativeGroupToGroups:availableOutputDevices:",  v35,  obj));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "msv_map:", &stru_10039BD78));
  v57 = (void *)objc_claimAutoreleasedReturnValue( -[MRDHostedExternalDeviceManager disconnectUndiscoverableEndpoints:]( v63->super._externalDeviceManager,  "disconnectUndiscoverableEndpoints:"));
  v59 = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVHostedRoutingController _sortNativeGroupToEnd:](v63, "_sortNativeGroupToEnd:", v36));
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id v38 = [v37 countByEnumeratingWithState:&v72 objects:v86 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v73;
    do
    {
      for (k = 0LL; k != v39; k = (char *)k + 1)
      {
        if (*(void *)v73 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)k);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 externalDevice]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v42 distantEndpoint]);
        [v43 hostedExternalDeviceEndpointDidChange:v44];
      }

      id v39 = [v37 countByEnumeratingWithState:&v72 objects:v86 count:16];
    }

    while (v39);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "msv_map:", &stru_10039BD98));
  if (v64)
  {
    v46 = objc_alloc(&OBJC_CLASS___MRAVDistantEndpoint);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint descriptor](v63->super._localEndpoint, "descriptor"));
    v48 = -[MRAVDistantEndpoint initWithDescriptor:](v46, "initWithDescriptor:", v47);
    uint64_t v49 = objc_claimAutoreleasedReturnValue([v45 arrayByAddingObject:v48]);

    v45 = (void *)v49;
    v34 = v63;
  }

  -[MRDAVHostedRoutingController _logEndpointsChanged:oldEndpoints:]( v34,  "_logEndpointsChanged:oldEndpoints:",  v45,  v34->super._distantEndpoints);
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "msv_map:", &stru_10039BDB8));
  objc_storeStrong((id *)&v34->super._availableEndpoints, v50);
  objc_storeStrong((id *)&v34->super._distantEndpoints, v45);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](v34->super._weakObservers, "allObjects"));
  v52 = v34;
  observerCalloutQueue = (dispatch_queue_s *)v34->super._observerCalloutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005C070;
  block[3] = &unk_100399880;
  id v68 = v51;
  v69 = v52;
  id v70 = v50;
  id v71 = v45;
  id v54 = v45;
  id v55 = v50;
  id v56 = v51;
  dispatch_async(observerCalloutQueue, block);
}

- (id)_createGroupsFrom:(id)a3 availableOutputDevices:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005C238;
  v8[3] = &unk_10039BDE0;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "msv_compactMap:", v8));

  return v6;
}

- (id)_maybeAddNativeGroupToGroups:(id)a3 availableOutputDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "msv_firstWhere:", &stru_10039BE20));
  id v11 = (void *)v9;
  id v12 = v8;
  if (!v9)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v14 = [v13 supportMultiplayerHost];

    if (v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDHostedRoutingController discoverySession](self, "discoverySession"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nativeOutputDevice]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVHostedRoutingController _createNativeGroupForLocalDeviceFromNativeOutputDevice:availableOutputDevices:]( self,  "_createNativeGroupForLocalDeviceFromNativeOutputDevice:availableOutputDevices:",  v16,  v7));

      if (v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObject:v11]);

        goto LABEL_9;
      }

      uint64_t v19 = MRLogCategoryDiscovery(v17, v18);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "No NativeGroup", (uint8_t *)&v25, 2u);
      }
    }

    id v11 = 0LL;
    id v12 = v8;
  }

- (id)_sortNativeGroupToEnd:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_10039BEA0];
}

- (id)_createNativeGroupForLocalDeviceFromNativeOutputDevice:(id)a3 availableOutputDevices:(id)a4
{
  id v6 = (os_log_s *)a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v9 = [v8 supportMultiplayerHost];

  if (v9)
  {
    if (v6)
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "msv_firstWhere:", &stru_10039BEC0));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRDAVOutputContextManager sharedManager]( &OBJC_CLASS___MRDAVOutputContextManager,  "sharedManager"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 outputContextForOutputDevice:v6]);

      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 contextID]);
      if (v14)
      {
        uint64_t v15 = objc_alloc(&OBJC_CLASS___MRConcreteEndpoint);
        if (v11) {
          v16 = v11;
        }
        else {
          v16 = v6;
        }
        v33 = v16;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
        uint64_t v18 = -[MRConcreteEndpoint initWithDesignatedGroupLeader:outputDevices:preferredSuffix:]( v15,  "initWithDesignatedGroupLeader:outputDevices:preferredSuffix:",  v6,  v17,  v14);

        id v20 = (void *)objc_claimAutoreleasedReturnValue( -[MRDHostedRoutingController _onQueue_makeLocalHostedExternalDeviceForEndpoint:didCreate:]( self,  "_onQueue_makeLocalHostedExternalDeviceForEndpoint:didCreate:",  v18,  &v28));
        if (v28)
        {
          uint64_t v21 = _MRLogForCategory(0LL, v19);
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRConcreteEndpoint uniqueIdentifier](v18, "uniqueIdentifier"));
            v24 = (void *)objc_claimAutoreleasedReturnValue([v20 externalDevice]);
            *(_DWORD *)buf = 138412546;
            v30 = v23;
            __int16 v31 = 2112;
            v32 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[HostedRoutingController] Create nativeEndpoint for endpoint=%@ externalDevice=%@",  buf,  0x16u);
          }
        }

        int v25 = -[MRDAVHostedRoutingControllerGroup initWithEndpoint:externalDevice:]( objc_alloc(&OBJC_CLASS___MRDAVHostedRoutingControllerGroup),  "initWithEndpoint:externalDevice:",  v18,  v20);
      }

      else
      {
        int v25 = 0LL;
      }
    }

    else
    {
      uint64_t v26 = _MRLogForCategory(0LL, v10);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[HostedRoutingController] Unable to create nativeGroup: no nativeOutputDevice",  buf,  2u);
      }

      int v25 = 0LL;
    }
  }

  else
  {
    int v25 = 0LL;
  }

  return v25;
}

+ (id)_expectedSuffixForNewEndpointWithGroupLeader:(id)a3 outputDevices:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_firstWhere:", &stru_10039BEE0));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 groupID]);
  uint64_t v7 = MRComputeGroupContextID();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 outputContextForOutputDevice:v5]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 contextID]);
  }

  return v8;
}

- (void)_onQueue_reloadWithOutputDevices:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDAVHostedRoutingController;
  -[MRDHostedRoutingController _onQueue_reloadWithOutputDevices:](&v4, "_onQueue_reloadWithOutputDevices:", a3);
  -[MRDAVHostedRoutingController _onQueue_reloadEndpoints](self, "_onQueue_reloadEndpoints");
}

- (void)_logEndpointsChanged:(id)a3 oldEndpoints:(id)a4
{
  if (a4) {
    id v5 = a4;
  }
  else {
    id v5 = &__NSArray0__struct;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 changeDescriptionTo:a3 keyBlock:&stru_10039BF20 isUpdatedBlock:&stru_10039BF60 descriptionBlock:&stru_10039BFA0]);
  if (v6)
  {
    uint64_t v7 = MRLogCategoryDiscoveryUpdates();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      uint64_t v10 = self;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Endpoints changed\n%{public}@",  (uint8_t *)&v9,  0x16u);
    }
  }
}

@end