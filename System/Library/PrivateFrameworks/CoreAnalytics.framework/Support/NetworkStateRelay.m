@interface NetworkStateRelay
- (NWPathEvaluator)primaryPathEvaluator;
- (NetworkStateRelay)initWithMonitoring:(NetworkingStateDelegate *)a3 withWiFiStateRelay:(id)a4 withTelephonyStateRelay:(id)a5;
- (id).cxx_construct;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerForNetworkChanges;
- (void)setPrimaryPathEvaluator:(id)a3;
- (void)updatePrimaryNetworkInterfaceType:(optional<NWInterfaceType>)a3;
@end

@implementation NetworkStateRelay

- (NetworkStateRelay)initWithMonitoring:(NetworkingStateDelegate *)a3 withWiFiStateRelay:(id)a4 withTelephonyStateRelay:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NetworkStateRelay;
  v11 = -[NetworkStateRelay init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    v11->delegate = a3;
    objc_storeStrong((id *)&v11->_wiFiStateRelay, a4);
    objc_storeStrong((id *)&v12->_telephonyStateRelay, a5);
    dispatch_queue_t v13 = dispatch_queue_create("analyticsd.NetworkingStateResolver.NetworkStateRelay.myQueue", 0LL);
    fObj = v12->_stateRelayQueue.fObj.fObj;
    v12->_stateRelayQueue.fObj.fObj = (OS_dispatch_object *)v13;

    -[NetworkStateRelay registerForNetworkChanges](v12, "registerForNetworkChanges");
  }

  return v12;
}

- (void)dealloc
{
  fObj = self->_stateRelayQueue.fObj.fObj;
  p_stateRelayQueue = &self->_stateRelayQueue;
  if (fObj)
  {
    id v5 = sub_10000B718((id *)&p_stateRelayQueue->fObj.fObj);
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100084B4C;
    block[3] = &unk_100127CD0;
    block[4] = self;
    dispatch_sync(v6, block);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NetworkStateRelay;
  -[NetworkStateRelay dealloc](&v7, "dealloc");
}

- (void)registerForNetworkChanges
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NWParameters);
  [v5 prohibitNetworkAgentsWithDomain:@"NetworkExtension" type:@"VPN"];
  [v5 prohibitNetworkAgentsWithDomain:@"NetworkExtension" type:@"AOVPN"];
  [v5 prohibitNetworkAgentsWithDomain:@"NetworkExtension" type:@"AppVPN"];
  v3 = -[NWPathEvaluator initWithEndpoint:parameters:]( objc_alloc(&OBJC_CLASS___NWPathEvaluator),  "initWithEndpoint:parameters:",  0LL,  v5);
  primaryPathEvaluator = self->_primaryPathEvaluator;
  self->_primaryPathEvaluator = v3;

  -[NWPathEvaluator addObserver:forKeyPath:options:context:]( self->_primaryPathEvaluator,  "addObserver:forKeyPath:options:context:",  self,  @"path",  5LL,  0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = sub_10000B718((id *)&self->_stateRelayQueue.fObj.fObj);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100084D58;
  v11[3] = &unk_10012A8D0;
  objc_copyWeak(&v13, &location);
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)updatePrimaryNetworkInterfaceType:(optional<NWInterfaceType>)a3
{
  BOOL var1 = a3.var1;
  int64_t v4 = a3.var0.var1;
  memset(&v11, 170, sizeof(v11));
  sub_100005064(&v11, "<unknown>");
  if (var1)
  {
    v6 = "WiredEthernet";
    switch(v4)
    {
      case 0LL:
        v6 = "Other";
        goto LABEL_9;
      case 1LL:
        std::string::assign(&v11, "WiFi");
        wiFiStateRelay = self->_wiFiStateRelay;
        if (!wiFiStateRelay
          || !-[WiFiStateRelay wiFiActiveAndUsingPersonalHotspot](wiFiStateRelay, "wiFiActiveAndUsingPersonalHotspot"))
        {
          break;
        }

        v6 = "PersonalHotspot";
LABEL_9:
        std::string::assign(&v11, v6);
        break;
      case 2LL:
        v6 = "Cellular";
        goto LABEL_9;
      case 3LL:
        goto LABEL_9;
      case 4LL:
        v6 = "Loopback";
        goto LABEL_9;
      default:
        break;
    }
  }

  delegate = self->delegate;
  else {
    std::string __p = v11;
  }
  char v13 = 1;
  (*((void (**)(id *__return_ptr, NetworkingStateDelegate *, std::string *))delegate->var0 + 2))( &v10,  delegate,  &__p);
  id v9 = v10;
  id v10 = 0LL;
}

- (NWPathEvaluator)primaryPathEvaluator
{
  return self->_primaryPathEvaluator;
}

- (void)setPrimaryPathEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
  fObj = self->_stateRelayQueue.fObj.fObj;
  self->_stateRelayQueue.fObj.fObj = 0LL;

  objc_storeStrong((id *)&self->_telephonyStateRelay, 0LL);
  objc_storeStrong((id *)&self->_wiFiStateRelay, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0LL;
  return self;
}

@end