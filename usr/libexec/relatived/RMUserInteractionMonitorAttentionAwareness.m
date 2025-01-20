@interface RMUserInteractionMonitorAttentionAwareness
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (RMUserInteractionMonitorAttentionAwareness)init;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)startUserInteractionUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)stopUserInteractionUpdates;
@end

@implementation RMUserInteractionMonitorAttentionAwareness

- (RMUserInteractionMonitorAttentionAwareness)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RMUserInteractionMonitorAttentionAwareness;
  v2 = -[RMUserInteractionMonitorAttentionAwareness init](&v15, "init");
  if (v2)
  {
    v3 = (void *)objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessConfiguration);
    [v3 setIdentifier:@"com.apple.relatived"];
    [v3 setEventMask:4094];
    [v3 setAttentionLostTimeout:0.1];
    v4 = objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessClient);
    -[RMUserInteractionMonitorAttentionAwareness setAttentionAwarenessClient:](v2, "setAttentionAwarenessClient:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient]( v2,  "attentionAwarenessClient"));
    id v14 = 0LL;
    unsigned int v6 = [v5 setConfiguration:v3 shouldReset:0 error:&v14];
    id v7 = v14;

    if (v6)
    {
      objc_initWeak(location, v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient]( v2,  "attentionAwarenessClient"));
      v9 = &_dispatch_main_q;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000039A4;
      v12[3] = &unk_10001C628;
      objc_copyWeak(&v13, location);
      [v8 setEventHandlerWithQueue:&_dispatch_main_q block:v12];

      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }

    else
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C668);
      }
      v10 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[RMUserInteractionMonitorAttentionAwareness] Error setting attention awareness config: %{public}@",  (uint8_t *)location,  0xCu);
      }

      -[RMUserInteractionMonitorAttentionAwareness setAttentionAwarenessClient:]( v2,  "setAttentionAwarenessClient:",  0LL);
    }
  }

  return v2;
}

- (void)startUserInteractionUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMUserInteractionMonitorAttentionAwareness;
  -[RMUserInteractionMonitor startUserInteractionUpdatesToQueue:withHandler:]( &v9,  "startUserInteractionUpdatesToQueue:withHandler:",  a3,  a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient]( self,  "attentionAwarenessClient"));

  if (v5)
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C668);
    }
    unsigned int v6 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[RMUserInteractionMonitorAttentionAwareness] Starting user interaction monitoring",  v8,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient]( self,  "attentionAwarenessClient"));
    [v7 resumeWithError:0];
  }

- (void)stopUserInteractionUpdates
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RMUserInteractionMonitorAttentionAwareness;
  -[RMUserInteractionMonitor stopUserInteractionUpdates](&v7, "stopUserInteractionUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient]( self,  "attentionAwarenessClient"));

  if (v3)
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C668);
    }
    v4 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[RMUserInteractionMonitorAttentionAwareness] Stopping user interaction monitoring",  v6,  2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMUserInteractionMonitorAttentionAwareness attentionAwarenessClient]( self,  "attentionAwarenessClient"));
    [v5 suspendWithError:0];
  }

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end