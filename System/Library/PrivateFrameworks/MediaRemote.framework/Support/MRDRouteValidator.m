@interface MRDRouteValidator
- (MRAVEndpoint)activeSystemEndpoint;
- (MRAVEndpoint)localEndpoint;
- (MRDRouteRecommendationDemotionController)demotionController;
- (MRDRouteRecommendationOutputContextLogic)outputContextLogic;
- (MRDRouteRecommendationSuppressionController)suppressionController;
- (MRDRouteValidator)init;
- (NSLock)activeSystemEndpointLock;
- (OS_dispatch_queue)queue;
- (void)_bestRecommendationIn:(id)a3 primaryBundleIdentifier:(id)a4 activeSystemEndpoint:(id)a5 completion:(id)a6;
- (void)_fetchActiveSystemEndpoint:(id)a3;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_refreshActiveSystemEndpoint:(id)a3;
- (void)bestRecommendationIn:(id)a3 primaryBundleIdentifier:(id)a4 eligibleToShowRecommendationsOutsideApp:(BOOL)a5 completion:(id)a6;
- (void)evaluateRecommendations:(id)a3 localOutputContextHasAirPlay:(BOOL)a4 primaryBundleIdentifier:(id)a5 activeSystemEndpoint:(id)a6 completion:(id)a7;
- (void)setActiveSystemEndpoint:(id)a3;
- (void)setActiveSystemEndpointLock:(id)a3;
- (void)setDemotionController:(id)a3;
- (void)setOutputContextLogic:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSuppressionController:(id)a3;
@end

@implementation MRDRouteValidator

- (MRDRouteValidator)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRDRouteValidator;
  v2 = -[MRDRouteValidator init](&v17, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MRDRouteRecommendationOutputContextLogic);
    outputContextLogic = v2->_outputContextLogic;
    v2->_outputContextLogic = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[MRDRouteRecommendationSuppressionController controller]( &OBJC_CLASS___MRDRouteRecommendationSuppressionController,  "controller"));
    suppressionController = v2->_suppressionController;
    v2->_suppressionController = (MRDRouteRecommendationSuppressionController *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[MRDRouteRecommendationDemotionController controller]( &OBJC_CLASS___MRDRouteRecommendationDemotionController,  "controller"));
    demotionController = v2->_demotionController;
    v2->_demotionController = (MRDRouteRecommendationDemotionController *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSLock);
    activeSystemEndpointLock = v2->_activeSystemEndpointLock;
    v2->_activeSystemEndpointLock = v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mediaremote.MRDRouteValidator", v12);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:v2 selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];
  }

  return v2;
}

- (void)bestRecommendationIn:(id)a3 primaryBundleIdentifier:(id)a4 eligibleToShowRecommendationsOutsideApp:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v14 = _MRLogForCategory(13LL, v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v10 count];
    objc_super v17 = @"NO";
    *(_DWORD *)buf = 134218498;
    id v27 = v16;
    __int16 v28 = 2112;
    if (v7) {
      objc_super v17 = @"YES";
    }
    id v29 = v11;
    __int16 v30 = 2112;
    v31 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].RV bestRecommendationIn: %lu recommendation(s) | bundleID: %@ | outsideApp: %@ ",  buf,  0x20u);
  }

  if ([v10 count])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100061CF8;
    v21[3] = &unk_10039C1F8;
    v21[4] = self;
    BOOL v25 = v7;
    id v24 = v12;
    id v22 = v10;
    id v23 = v11;
    -[MRDRouteValidator _fetchActiveSystemEndpoint:](self, "_fetchActiveSystemEndpoint:", v21);
  }

  else
  {
    uint64_t v19 = _MRLogForCategory(13LL, v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].RV received 0 interactive recommendations.",  buf,  2u);
    }
  }
}

- (MRAVEndpoint)activeSystemEndpoint
{
  v3 = self->_activeSystemEndpoint;
  -[NSLock unlock](self->_activeSystemEndpointLock, "unlock");
  return v3;
}

- (void)_fetchActiveSystemEndpoint:(id)a3
{
  uint64_t v5 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteValidator activeSystemEndpoint](self, "activeSystemEndpoint"));
  if (v4)
  {
    if (v5) {
      v5[2](v5, v4);
    }
  }

  else
  {
    -[MRDRouteValidator _refreshActiveSystemEndpoint:](self, "_refreshActiveSystemEndpoint:", v5);
  }
}

- (void)_refreshActiveSystemEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteValidator activeSystemEndpointLock](self, "activeSystemEndpointLock"));
  [v5 lock];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteValidator queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100061FF4;
  v8[3] = &unk_10039C220;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  MRAVEndpointResolveActiveSystemEndpointWithType(0LL, v6, v8, 7.0);
}

- (void)_bestRecommendationIn:(id)a3 primaryBundleIdentifier:(id)a4 activeSystemEndpoint:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteValidator localEndpoint](self, "localEndpoint"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRIRRoute routeWithEndpoint:](&OBJC_CLASS___MRIRRoute, "routeWithEndpoint:", v14));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nodes]);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100062434;
  v33[3] = &unk_10039C288;
  id v34 = v16;
  id v17 = v16;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "msv_filter:", v33));

  BOOL v19 = -[MRDRouteRecommendationOutputContextLogic localOutputContextHasDeviceOfType:]( self->_outputContextLogic,  "localOutputContextHasDeviceOfType:",  1LL);
  id v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  v26 = sub_10006279C;
  id v27 = &unk_10039C2D0;
  id v28 = v10;
  id v29 = v11;
  BOOL v32 = v19;
  __int16 v30 = self;
  id v31 = v12;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = objc_retainBlock(&v24);
  -[MRDRouteValidator evaluateRecommendations:localOutputContextHasAirPlay:primaryBundleIdentifier:activeSystemEndpoint:completion:]( self,  "evaluateRecommendations:localOutputContextHasAirPlay:primaryBundleIdentifier:activeSystemEndpoint:completion:",  v18,  v19,  v22,  v21,  v23,  v24,  v25,  v26,  v27);
}

- (void)evaluateRecommendations:(id)a3 localOutputContextHasAirPlay:(BOOL)a4 primaryBundleIdentifier:(id)a5 activeSystemEndpoint:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  if (v17)
  {
    id v41 = v12;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_100062FE8;
    v50[3] = &unk_10039C2F8;
    id v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "msv_suffixFromIndex:", 1));
    id v51 = v38;
    v52 = self;
    BOOL v56 = a4;
    id v40 = v13;
    id v53 = v13;
    id v39 = v14;
    id v18 = v14;
    id v54 = v18;
    id v37 = v15;
    id v19 = v15;
    id v55 = v19;
    id v20 = objc_retainBlock(v50);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 route]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 routeIdentifier]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 componentsSeparatedByString:@"|"]);

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v17 route]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 nodes]);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MRIRRoute routeWithEndpoint:](&OBJC_CLASS___MRIRRoute, "routeWithEndpoint:", v18));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 nodes]);

    if ([v25 isEqualToSet:v27])
    {
      uint64_t v29 = _MRLogForCategory(13LL, v28);
      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].RV ase is routed to same devices in recommendation. skipping recommendation.",  buf,  2u);
      }

      id v31 = v20;
      ((void (*)(void *))v20[2])(v20);
      id v14 = v39;
      id v13 = v40;
      BOOL v32 = v38;
    }

    else
    {
      id v36 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteValidator queue](self, "queue"));
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_1000630B8;
      v42[3] = &unk_10039C348;
      id v43 = v23;
      id v44 = v18;
      BOOL v49 = a4;
      v47 = v20;
      id v45 = v25;
      id v48 = v19;
      id v46 = v17;
      [v36 searchOutputDevices:v43 reason:@"coriander" timeout:v35 queue:v42 completion:7.0];

      id v14 = v39;
      id v13 = v40;
      BOOL v32 = v38;
      id v31 = v20;
    }

    id v15 = v37;

    id v12 = v41;
  }

  else
  {
    uint64_t v33 = _MRLogForCategory(13LL, v16);
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].RV no recommendations left. giving up",  buf,  2u);
    }

    (*((void (**)(id, void, void, void, void, void, void, void))v15 + 2))( v15,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
  }
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey]);
  unsigned int v7 = [v6 intValue];

  if (!v7)
  {
    uint64_t v9 = _MRLogForCategory(13LL, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].RV _handleActiveSystemEndpointDidChangeNotification: %@",  (uint8_t *)&v11,  0xCu);
    }

    -[MRDRouteValidator _refreshActiveSystemEndpoint:](self, "_refreshActiveSystemEndpoint:", 0LL);
  }
}

- (MRAVEndpoint)localEndpoint
{
  return (MRAVEndpoint *)+[MRAVLocalEndpoint sharedLocalEndpoint]( &OBJC_CLASS___MRAVLocalEndpoint,  "sharedLocalEndpoint");
}

- (void)setActiveSystemEndpoint:(id)a3
{
}

- (NSLock)activeSystemEndpointLock
{
  return self->_activeSystemEndpointLock;
}

- (void)setActiveSystemEndpointLock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MRDRouteRecommendationOutputContextLogic)outputContextLogic
{
  return self->_outputContextLogic;
}

- (void)setOutputContextLogic:(id)a3
{
}

- (MRDRouteRecommendationSuppressionController)suppressionController
{
  return self->_suppressionController;
}

- (void)setSuppressionController:(id)a3
{
}

- (MRDRouteRecommendationDemotionController)demotionController
{
  return self->_demotionController;
}

- (void)setDemotionController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end