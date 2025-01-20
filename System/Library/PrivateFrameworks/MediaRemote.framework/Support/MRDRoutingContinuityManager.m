@interface MRDRoutingContinuityManager
- (BOOL)shouldIgnorePredictedRoutesSync;
- (MRAVEndpoint)activeSystemEndpoint;
- (MRDRoutingContinuityManager)init;
- (MSVTimer)pausePredictedRoutesTimer;
- (id)_calculateDesiredPredictedRouteOutputDeviceUIDs;
- (void)_pausePredicatedRoutesSync;
- (void)_reevaluatePredictedRoutes;
- (void)setActiveSystemEndpoint:(id)a3;
- (void)setPausePredictedRoutesTimer:(id)a3;
- (void)setShouldIgnorePredictedRoutesSync:(BOOL)a3;
@end

@implementation MRDRoutingContinuityManager

- (MRDRoutingContinuityManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MRDRoutingContinuityManager;
  v2 = -[MRDRoutingContinuityManager init](&v25, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v4 = kMRMediaRemoteActiveSystemEndpointDidChangeNotification;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10004D460;
    v23[3] = &unk_10039B878;
    v5 = v2;
    v24 = v5;
    id v6 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v23];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v8 = kMRDeviceInfoDidChangeNotification;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10004D4D8;
    v21[3] = &unk_10039B878;
    v9 = v5;
    v22 = v9;
    id v10 = [v7 addObserverForName:v8 object:0 queue:0 usingBlock:v21];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v12 = MRAVOutputContextModificationRequestToClearPredictedRoutesNotifications;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10004D4E0;
    v19[3] = &unk_10039B878;
    v13 = v9;
    v20 = v13;
    id v14 = [v11 addObserverForName:v12 object:0 queue:0 usingBlock:v19];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10004D528;
    v17[3] = &unk_100399250;
    v18 = v13;
    [v15 addMediaRemoteSeverStartedHandler:v17];
  }

  return v2;
}

- (void)setActiveSystemEndpoint:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_activeSystemEndpoint = (id *)&v6->_activeSystemEndpoint;
  activeSystemEndpoint = v6->_activeSystemEndpoint;
  v9 = (MRAVEndpoint *)v5;
  id v10 = activeSystemEndpoint;
  if (v10 == v9)
  {
  }

  else
  {
    v11 = v10;
    unsigned __int8 v12 = -[MRAVEndpoint isEqual:](v9, "isEqual:", v10);

    if ((v12 & 1) == 0)
    {
      if (v6->_endpointOutputDevicesDidChangeToken)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v13 removeObserver:v6->_endpointOutputDevicesDidChangeToken];

        id endpointOutputDevicesDidChangeToken = v6->_endpointOutputDevicesDidChangeToken;
        v6->_id endpointOutputDevicesDidChangeToken = 0LL;
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([*p_activeSystemEndpoint debugName]);

      if (v15)
      {
        uint64_t v17 = _MRLogForCategory(0LL, v16);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (objc_class *)objc_opt_class(v6);
          v20 = NSStringFromClass(v19);
          id v21 = (id)objc_claimAutoreleasedReturnValue(v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue([*p_activeSystemEndpoint debugName]);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](v9, "debugName"));
          *(_DWORD *)buf = 138544130;
          id v35 = v21;
          __int16 v36 = 2114;
          v37 = @"activeSystemEndpoint";
          __int16 v38 = 2112;
          v39 = v22;
          __int16 v40 = 2112;
          v41 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ from <%@> to <%@>",  buf,  0x2Au);
        }
      }

      else
      {
        uint64_t v24 = _MRLogForCategory(0LL, v16);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v25 = (objc_class *)objc_opt_class(v6);
          v26 = NSStringFromClass(v25);
          id v27 = (id)objc_claimAutoreleasedReturnValue(v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](v9, "debugName"));
          *(_DWORD *)buf = 138543874;
          id v35 = v27;
          __int16 v36 = 2114;
          v37 = @"activeSystemEndpoint";
          __int16 v38 = 2112;
          v39 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  buf,  0x20u);
        }
      }

      objc_storeStrong((id *)&v6->_activeSystemEndpoint, a3);
      if (*p_activeSystemEndpoint)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v30 = v6->_activeSystemEndpoint;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_10004D8EC;
        v33[3] = &unk_10039B878;
        v33[4] = v6;
        uint64_t v31 = objc_claimAutoreleasedReturnValue( [v29 addObserverForName:MRAVEndpointOutputDevicesDidChangeNotification object:v30 queue:0 usingBlock:v33]);
        id v32 = v6->_endpointOutputDevicesDidChangeToken;
        v6->_id endpointOutputDevicesDidChangeToken = (id)v31;
      }

      -[MRDRoutingContinuityManager _reevaluatePredictedRoutes](v6, "_reevaluatePredictedRoutes");
    }
  }

  objc_sync_exit(v6);
}

- (MRAVEndpoint)activeSystemEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeSystemEndpoint;
  objc_sync_exit(v2);

  return v3;
}

- (id)_calculateDesiredPredictedRouteOutputDeviceUIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceInfo]);

  id v5 = &MSVWeakLinkStringConstant_ptr;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if (![v6 supportTopologyHealing])
  {
    v22 = 0LL;
LABEL_20:

    goto LABEL_21;
  }

  unsigned int v7 = [v4 isAirPlayActive];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 leaderDeviceInfo]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 groupedDevices]);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10004DD1C;
    v45[3] = &unk_10039B8A0;
    id v10 = v4;
    id v46 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "msv_compactMap:", v45));

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10004DD9C;
    v43[3] = &unk_10039B8C8;
    id v12 = v10;
    id v44 = v12;
    id v13 = sub_10004DD9C((uint64_t)v43);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v14 || [v11 count])
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 outputDevices]);

      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_10004DEF4;
      v41[3] = &unk_10039AC00;
      id v17 = v12;
      id v42 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "msv_firstWhere:", v41));

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10004DF74;
      v39[3] = &unk_10039AC00;
      id v19 = v17;
      id v40 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "msv_firstWhere:", v39));

      id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "msv_compactMap:", &stru_10039B8E8));
      v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      if ([v19 supportsTwoHop])
      {
        -[NSMutableArray addObjectsFromArray:](v22, "addObjectsFromArray:", v11);
        if (v14) {
          -[NSMutableArray addObject:](v22, "addObject:", v14);
        }
        if (v18)
        {
          -[NSMutableArray addObjectsFromArray:](v22, "addObjectsFromArray:", v21);
        }

        else
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceUID]);
          -[NSMutableArray addObject:](v22, "addObject:", v24);
        }

        id v5 = &MSVWeakLinkStringConstant_ptr;
      }

      else
      {
        id v5 = &MSVWeakLinkStringConstant_ptr;
        if (!v20)
        {
          -[NSMutableArray addObjectsFromArray:](v22, "addObjectsFromArray:", v11);
          if (v14) {
            -[NSMutableArray addObject:](v22, "addObject:", v14);
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceUID]);
          -[NSMutableArray addObject:](v22, "addObject:", v23);
        }
      }
    }

    else
    {
      v22 = 0LL;
    }

    id v6 = v46;
    goto LABEL_20;
  }

  v22 = 0LL;
LABEL_21:
  objc_super v25 = (void *)objc_claimAutoreleasedReturnValue([v5[243] currentSettings]);
  unsigned int v26 = [v25 supportRoutingContinuity];

  if (v26)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRoutingContinuityManager activeSystemEndpoint](self, "activeSystemEndpoint"));
    unsigned __int8 v28 = [v27 isLocalEndpoint];

    if ((v28 & 1) == 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRoutingContinuityManager activeSystemEndpoint](self, "activeSystemEndpoint"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 resolvedOutputDevices]);
      v34 = _NSConcreteStackBlock;
      uint64_t v35 = 3221225472LL;
      __int16 v36 = sub_10004DFDC;
      v37 = &unk_10039AC00;
      id v38 = v4;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "msv_filter:", &v34));
      uint64_t v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "msv_compactMap:", &stru_10039B908, v34, v35, v36, v37));

      v22 = (NSMutableArray *)v32;
    }
  }

  return v22;
}

- (void)_reevaluatePredictedRoutes
{
  if (!-[MRDRoutingContinuityManager shouldIgnorePredictedRoutesSync](self, "shouldIgnorePredictedRoutesSync"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRoutingContinuityManager _calculateDesiredPredictedRouteOutputDeviceUIDs]( self,  "_calculateDesiredPredictedRouteOutputDeviceUIDs"));
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSSet);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 predictedOutputDeviceUIDs]);
    unsigned int v7 = -[NSSet initWithArray:](v4, "initWithArray:", v6);

    uint64_t v8 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v3);
    if (v7 == v8)
    {
    }

    else
    {
      unsigned __int8 v9 = -[NSSet isEqual:](v7, "isEqual:", v8);

      if ((v9 & 1) == 0)
      {
        id v10 = objc_alloc(&OBJC_CLASS___MRRequestDetails);
        v11 = (objc_class *)objc_opt_class(self);
        id v12 = NSStringFromClass(v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v14 = -[MRRequestDetails initWithName:requestID:reason:]( v10,  "initWithName:requestID:reason:",  @"Set predicted routes when being airplayed to by a group",  0LL,  v13);

        v15 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDeviceUIDs:]( objc_alloc(&OBJC_CLASS___MRGroupTopologyModificationRequest),  "initWithRequestDetails:type:outputDeviceUIDs:",  v14,  3LL,  v3);
        -[MRGroupTopologyModificationRequest setShouldModifyPredictedRoutes:]( v15,  "setShouldModifyPredictedRoutes:",  1LL);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_10004E218;
        v18[3] = &unk_100399508;
        id v19 = v14;
        id v17 = v14;
        [v16 modifyTopologyWithRequest:v15 withReplyQueue:&_dispatch_main_q completion:v18];
      }
    }
  }

- (void)_pausePredicatedRoutesSync
{
  uint64_t v3 = MRLogCategoryDiscovery(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = 0x4024000000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDRoutingContinuityManager] Pausing PredictedRoutesSync for %lf seconds...",  buf,  0xCu);
  }

  id v5 = self;
  objc_sync_enter(v5);
  id v6 = objc_alloc(&OBJC_CLASS___MSVTimer);
  unsigned int v7 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004E440;
  v9[3] = &unk_100399250;
  v9[4] = v5;
  uint64_t v8 = -[MSVTimer initWithInterval:queue:block:](v6, "initWithInterval:queue:block:", &_dispatch_main_q, v9, 10.0);
  -[MRDRoutingContinuityManager setPausePredictedRoutesTimer:](v5, "setPausePredictedRoutesTimer:", v8);

  objc_sync_exit(v5);
}

- (void)setPausePredictedRoutesTimer:(id)a3
{
  uint64_t v4 = (MSVTimer *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  pausePredictedRoutesTimer = v5->_pausePredictedRoutesTimer;
  v5->_pausePredictedRoutesTimer = v4;

  objc_sync_exit(v5);
  -[MRDRoutingContinuityManager _reevaluatePredictedRoutes](v5, "_reevaluatePredictedRoutes");
}

- (MSVTimer)pausePredictedRoutesTimer
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_pausePredictedRoutesTimer;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)shouldIgnorePredictedRoutesSync
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRoutingContinuityManager pausePredictedRoutesTimer](self, "pausePredictedRoutesTimer"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)setShouldIgnorePredictedRoutesSync:(BOOL)a3
{
  self->_shouldIgnorePredictedRoutesSync = a3;
}

- (void).cxx_destruct
{
}

@end