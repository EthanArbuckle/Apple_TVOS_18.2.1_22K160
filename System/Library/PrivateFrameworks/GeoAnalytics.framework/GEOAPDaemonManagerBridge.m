@interface GEOAPDaemonManagerBridge
- (BOOL)_hasEvalEntitlement;
- (BOOL)_hasTelemetryEntitlement;
- (void)dealloc;
- (void)flushEvalData;
- (void)flushUploadHistoryWithCompletion:(id)a3;
- (void)reportDailySettings:(id)a3 completion:(id)a4;
- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7;
- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5;
- (void)runAggregationTasks;
- (void)setEvalMode:(BOOL)a3;
- (void)showEvalData;
- (void)showHistoryOfAge:(unsigned int)a3;
- (void)showInflight;
- (void)showUploadCounts:(id)a3;
- (void)streamEvalData;
@end

@implementation GEOAPDaemonManagerBridge

- (void)dealloc
{
  id v3 = sub_10000A67C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "goodbye connection %p", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GEOAPDaemonManagerBridge;
  -[GEOAPDaemonManagerBridge dealloc](&v5, "dealloc");
}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = sub_10000A67C();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315138;
    v19 = "-[GEOAPDaemonManagerBridge reportDailyUsageCountType:usageString:usageBool:appId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v18, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
  [v17 reportDailyUsageCountType:v10 usageString:v14 usageBool:v13 appId:v12 completion:v11];
}

- (void)reportDailySettings:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_10000A67C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    id v11 = "-[GEOAPDaemonManagerBridge reportDailySettings:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
  [v9 reportDailySettings:v6 completion:v5];
}

- (BOOL)_hasTelemetryEntitlement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_conn, "valueForEntitlement:", GEOAPTelemetryEntitlement));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_10000A67C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v18 = "-[GEOAPDaemonManagerBridge reportLogMsg:uploadBatchId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (GEOBatchIDIsTelemetryData(a4)
    && !-[GEOAPDaemonManagerBridge _hasTelemetryEntitlement](self, "_hasTelemetryEntitlement"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000ABF0;
    block[3] = &unk_1000286C8;
    id v16 = v9;
    dispatch_async(v14, block);

    id v12 = v16;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
    [v12 reportLogMsg:v8 uploadBatchId:a4 completion:v9];
  }
}

- (BOOL)_hasEvalEntitlement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self->_conn, "valueForEntitlement:", GEOAPEvalEntitlement));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)runAggregationTasks
{
  id v3 = sub_10000A67C();
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[GEOAPDaemonManagerBridge runAggregationTasks]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  if (-[GEOAPDaemonManagerBridge _hasEvalEntitlement](self, "_hasEvalEntitlement"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
    [v5 runAggregationTasks];
  }

  else
  {
    id v6 = sub_10000A67C();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEBUG,  "eval entitlement is required for this operation",  (uint8_t *)&v7,  2u);
    }
  }
}

- (void)setEvalMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000A67C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    id v10 = "-[GEOAPDaemonManagerBridge setEvalMode:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v9, 0xCu);
  }

  if (-[GEOAPDaemonManagerBridge _hasEvalEntitlement](self, "_hasEvalEntitlement"))
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
    [v7 setEvalMode:v3];
  }

  else
  {
    id v8 = sub_10000A67C();
    int v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEBUG,  "eval entitlement is required for this operation",  (uint8_t *)&v9,  2u);
    }
  }
}

- (void)showEvalData
{
  if (-[GEOAPDaemonManagerBridge _hasEvalEntitlement](self, "_hasEvalEntitlement"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GEOAPXPCClientExporting));
    -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", v3);

    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy"));
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000AFB8;
    block[3] = &unk_1000288C0;
    id v10 = v4;
    int v7 = v4;
    dispatch_async(v6, block);
  }

  else
  {
    id v8 = sub_10000A67C();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "eval entitlement is required for this operation",  buf,  2u);
    }
  }
}

- (void)streamEvalData
{
  if (-[GEOAPDaemonManagerBridge _hasEvalEntitlement](self, "_hasEvalEntitlement"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GEOAPXPCClientExporting));
    -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", v3);

    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy"));
    objc_initWeak(location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000B3D8;
    v13[3] = &unk_100028A40;
    id v5 = v4;
    id v14 = v5;
    objc_copyWeak(&v15, location);
    -[NSXPCConnection setInterruptionHandler:](self->_conn, "setInterruptionHandler:", v13);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000B44C;
    v10[3] = &unk_100028A40;
    id v6 = v5;
    id v11 = v6;
    objc_copyWeak(&v12, location);
    -[NSXPCConnection setInvalidationHandler:](self->_conn, "setInvalidationHandler:", v10);
    id v7 = sub_1000168E0();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    sub_100016BC4((uint64_t)v8, v6);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);

    objc_destroyWeak(location);
  }

  else
  {
    id v9 = sub_10000A67C();
    id v6 = (id)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEBUG,  "eval entitlement is required for this operation",  (uint8_t *)location,  2u);
    }
  }
}

- (void)flushEvalData
{
  id v3 = sub_10000A67C();
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[GEOAPDaemonManagerBridge flushEvalData]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  if (-[GEOAPDaemonManagerBridge _hasEvalEntitlement](self, "_hasEvalEntitlement"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
    [v5 flushEvalData];
  }

  else
  {
    id v6 = sub_10000A67C();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEBUG,  "eval entitlement is required for this operation",  (uint8_t *)&v7,  2u);
    }
  }
}

- (void)showInflight
{
  if (-[GEOAPDaemonManagerBridge _hasEvalEntitlement](self, "_hasEvalEntitlement"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GEOAPXPCMapsDebugPanelExporting));
    -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", v3);

    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000B718;
    v10[3] = &unk_100028A68;
    id v11 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000B758;
    v8[3] = &unk_1000288C0;
    id v9 = v11;
    id v6 = (os_log_s *)v11;
    [v5 showInflightUploadsWithVisitorBlock:v10 completion:v8];
  }

  else
  {
    id v7 = sub_10000A67C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "eval entitlement is required for this operation",  buf,  2u);
    }
  }
}

- (void)showHistoryOfAge:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[GEOAPDaemonManagerBridge _hasEvalEntitlement](self, "_hasEvalEntitlement"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GEOAPXPCMapsDebugPanelExporting));
    -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_conn, "remoteObjectProxy"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000B8BC;
    v12[3] = &unk_100028A90;
    id v13 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000B900;
    v10[3] = &unk_1000288C0;
    id v11 = v13;
    id v8 = (os_log_s *)v13;
    [v7 showHistoryOfAge:v3 withVisitorBlock:v12 completion:v10];
  }

  else
  {
    id v9 = sub_10000A67C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "eval entitlement is required for this operation",  buf,  2u);
    }
  }
}

- (void)flushUploadHistoryWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
  [v4 flushUploadHistoryWithCompletion:v3];
}

- (void)showUploadCounts:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPServiceManager sharedManager](&OBJC_CLASS___GEOAPServiceManager, "sharedManager"));
  [v4 showUploadCounts:v3];
}

- (void).cxx_destruct
{
}

@end