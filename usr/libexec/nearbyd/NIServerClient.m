@interface NIServerClient
+ (id)delegateProxyWithConnection:(id)a3;
- (NIServerClient)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (void)dealloc;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4;
- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4;
- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4;
- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4;
- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4;
- (void)didStartAcwgRanging:(int64_t)a3;
- (void)didSuspendAcwgRanging:(int64_t)a3;
- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4;
- (void)didUpdateHealthStatus:(int64_t)a3;
- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3;
- (void)didUpdateLocalDiscoveryToken:(id)a3;
- (void)didUpdateMotionState:(int64_t)a3;
- (void)didUpdateNearbyObjects:(id)a3;
- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5;
- (void)relayDCKMessage:(id)a3;
- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)setConnection:(id)a3;
- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4;
- (void)systemDidUpdateState:(id)a3;
- (void)uwbSessionDidFailWithError:(id)a3;
- (void)uwbSessionDidInvalidateWithError:(id)a3;
- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4;
- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4;
@end

@implementation NIServerClient

+ (id)delegateProxyWithConnection:(id)a3
{
  id v3 = a3;
  v4 = -[NIServerClient initWithConnection:](objc_alloc(&OBJC_CLASS___NIServerClient), "initWithConnection:", v3);

  return v4;
}

- (NIServerClient)initWithConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"NIServerClient.mm", 23, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NIServerClient;
  v7 = -[NIServerClient init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_connection, a3);
    v9 = -[PRNSXPCConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___PRNSXPCConnection),  "initWithConnection:",  v8->_connection);
    connWrapper = v8->_connWrapper;
    v8->_connWrapper = (UWBSessionDelegateProxyProtocol *)v9;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NIServerClient;
  -[NIServerClient dealloc](&v3, "dealloc");
}

- (void)setConnection:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  v5 = -[PRNSXPCConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___PRNSXPCConnection),  "initWithConnection:",  self->_connection);
  connWrapper = self->_connWrapper;
  self->_connWrapper = (UWBSessionDelegateProxyProtocol *)v5;
}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100026F10;
  v7[3] = &unk_1007A2950;
  id v8 = v4;
  id v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100027008;
  v7[3] = &unk_1007A2950;
  id v8 = v4;
  id v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100027104;
  v9[3] = &unk_1007A2978;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v9);
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000271FC;
  v7[3] = &unk_1007A2950;
  id v8 = v4;
  id v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000272B8;
  v5[3] = &unk_1007A2998;
  v5[4] = a3;
  *(double *)&v5[5] = a4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v5);
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100027378;
  v5[3] = &unk_1007A2998;
  v5[4] = a3;
  *(double *)&v5[5] = a4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v5);
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100027474;
  v7[3] = &unk_1007A2950;
  id v8 = v4;
  id v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connWrapper = self->_connWrapper;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000275D8;
  v15[3] = &unk_1007A29C0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v15);
}

- (void)didUpdateMotionState:(int64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100027694;
  v4[3] = &unk_1007A29E0;
  v4[4] = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v4);
}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002774C;
  v4[3] = &unk_1007A29E0;
  v4[4] = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v4);
}

- (void)relayDCKMessage:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100027844;
  v7[3] = &unk_1007A2950;
  id v8 = v4;
  id v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100027970;
  v11[3] = &unk_1007A2A08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v11);
}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100027A68;
  v7[3] = &unk_1007A2950;
  id v8 = v4;
  id v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  id v6 = a4;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100027B68;
  v9[3] = &unk_1007A2A30;
  BOOL v11 = a3;
  id v10 = v6;
  id v8 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v9);
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100027C98;
  v11[3] = &unk_1007A2A08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v11);
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100027D50;
  v4[3] = &unk_1007A2A50;
  BOOL v5 = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v4);
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100027E7C;
  v11[3] = &unk_1007A2A08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v11);
}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100027FA8;
  v11[3] = &unk_1007A2A08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v11);
}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connWrapper = self->_connWrapper;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000280D4;
  v11[3] = &unk_1007A2A08;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v11);
}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  connWrapper = self->_connWrapper;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100028190;
  v5[3] = &unk_1007A2A70;
  unsigned int v6 = a3;
  v5[4] = a4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v5);
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002824C;
  v4[3] = &unk_1007A29E0;
  void v4[4] = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v4);
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  connWrapper = self->_connWrapper;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100028304;
  v4[3] = &unk_1007A29E0;
  void v4[4] = a3;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v4);
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  id v6 = a4;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100028404;
  v9[3] = &unk_1007A2A98;
  unsigned int v11 = a3;
  id v10 = v6;
  id v8 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v9);
}

- (void)systemDidUpdateState:(id)a3
{
  id v4 = a3;
  connWrapper = self->_connWrapper;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100028500;
  v7[3] = &unk_1007A2950;
  id v8 = v4;
  id v6 = v4;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v7);
}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  id v6 = a4;
  connWrapper = self->_connWrapper;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100028600;
  v9[3] = &unk_1007A2A30;
  BOOL v11 = a3;
  id v10 = v6;
  id v8 = v6;
  -[UWBSessionDelegateProxyProtocol actOnRemoteObjectAndScheduleBarrierBlock:]( connWrapper,  "actOnRemoteObjectAndScheduleBarrierBlock:",  v9);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end