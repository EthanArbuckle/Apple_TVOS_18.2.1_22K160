@interface NIServerSystemConfigurator
+ (id)sharedInstance;
- (id).cxx_construct;
- (id)_initInternal;
- (id)_internalPrintableState;
- (id)printableState;
- (void)_relayBlockToClients:(id)a3;
- (void)_updateAggregatedClientInfo;
- (void)activate;
- (void)addClient:(id)a3 identifier:(id)a4;
- (void)clientWithIdentifier:(id)a3 notifiedPassiveAccessIntent:(unsigned int)a4;
- (void)clientWithIdentifier:(id)a3 notifiedResourceUsageLimitExceeded:(BOOL)a4 forSessionConfigurationType:(Class)a5;
- (void)clientWithIdentifier:(id)a3 requestedPrewarmUWB:(BOOL)a4 prewarmSecureElementChannel:(BOOL)a5;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)removeClientWithIdentifier:(id)a3;
@end

@implementation NIServerSystemConfigurator

+ (id)sharedInstance
{
  if (qword_1007FB110 != -1) {
    dispatch_once(&qword_1007FB110, &stru_1007B7918);
  }
  return (id)qword_1007FB108;
}

- (id)_initInternal
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#configurator,_initInternal", buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NIServerSystemConfigurator;
  v4 = -[NIServerSystemConfigurator init](&v13, "init");
  if (v4)
  {
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.nearbyd.system.configurator", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v9 = (dispatch_queue_s *)v4->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100229C64;
    block[3] = &unk_1007A3000;
    v12 = v4;
    dispatch_sync(v9, block);
  }

  return v4;
}

- (void)activate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100229E54;
  block[3] = &unk_1007A3000;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)addClient:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022A0A4;
  block[3] = &unk_1007B14B8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

- (void)removeClientWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10022A348;
  v7[3] = &unk_1007A2248;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)clientWithIdentifier:(id)a3 requestedPrewarmUWB:(BOOL)a4 prewarmSecureElementChannel:(BOOL)a5
{
  id v8 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022A530;
  block[3] = &unk_1007B51E8;
  void block[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_sync(queue, block);
}

- (void)clientWithIdentifier:(id)a3 notifiedResourceUsageLimitExceeded:(BOOL)a4 forSessionConfigurationType:(Class)a5
{
  id v8 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022A86C;
  block[3] = &unk_1007B7940;
  void block[4] = self;
  id v12 = v8;
  Class v13 = a5;
  BOOL v14 = a4;
  id v10 = v8;
  dispatch_sync(queue, block);
}

- (void)clientWithIdentifier:(id)a3 notifiedPassiveAccessIntent:(unsigned int)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022AC18;
  block[3] = &unk_1007B6578;
  void block[4] = self;
  id v10 = v6;
  unsigned int v11 = a4;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (id)printableState
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10022AEF8;
  id v10 = sub_10022AF08;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10022AF10;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_10022AEF8;
  v18 = sub_10022AF08;
  v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_autoreleasePoolPush();
  id v4 = (void *)v15[5];
  BOOL activated = self->_activated;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NISystemState descriptionInternal](self->_systemState, "descriptionInternal"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Activated: %d. System state: %@",  activated,  v6));
  [v4 addObject:v7];

  uint64_t v8 = (void *)v15[5];
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Aggregated info from %d clients: %@",  -[NSMutableDictionary count](self->_clientInfo, "count"),  self->_aggregatedClientInfo));
  [v8 addObject:v9];

  clientInfo = self->_clientInfo;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10022B118;
  v13[3] = &unk_1007B7968;
  v13[4] = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientInfo, "enumerateKeysAndObjectsUsingBlock:", v13);
  objc_autoreleasePoolPop(v3);
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)_updateAggregatedClientInfo
{
  id v3 = -[ConfiguratorClientInfo copy](self->_aggregatedClientInfo, "copy");
  id v4 = objc_opt_new(&OBJC_CLASS___ConfiguratorClientInfo);
  aggregatedClientInfo = self->_aggregatedClientInfo;
  self->_aggregatedClientInfo = v4;

  clientInfo = self->_clientInfo;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10022B5F4;
  v30[3] = &unk_1007B7990;
  v30[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientInfo, "enumerateKeysAndObjectsUsingBlock:", v30);
  id v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = self->_aggregatedClientInfo;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#configurator,Aggregated info - new: %@",  (uint8_t *)&buf,  0xCu);
  }

  id v9 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#configurator,Aggregated info - old: %@",  (uint8_t *)&buf,  0xCu);
  }

  unsigned int v10 = -[NSMutableDictionary count](self->_clientInfo, "count");
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x2020000000LL;
  int v35 = 0;
  id v11 = self->_clientInfo;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10022B600;
  v28[3] = &unk_1007B79B8;
  v28[4] = &buf;
  unsigned int v29 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v28);
  if (+[NIPlatformInfo supportsUWB](&OBJC_CLASS___NIPlatformInfo, "supportsUWB"))
  {
    -[ConfiguratorClientInfo prewarmUWB](self->_aggregatedClientInfo, "prewarmUWB");
    [v3 prewarmUWB];
  }

  if (+[NIPlatformInfo supportsUWB](&OBJC_CLASS___NIPlatformInfo, "supportsUWB")
    && -[ConfiguratorClientInfo prewarmSecureElementChannel](self->_aggregatedClientInfo, "prewarmSecureElementChannel")
    && ([v3 prewarmSecureElementChannel] & 1) == 0)
  {
    unint64_t v12 = -[NISystemState uwbPreciseDistanceAvailability](self->_systemState, "uwbPreciseDistanceAvailability");
    Class v13 = (os_log_s *)qword_1008000A0;
    BOOL v14 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)v26 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#configurator,Prewarm UWB-SE secure channel will be deferred until UWB is available",  v26,  2u);
      }
    }

    else
    {
      if (v14)
      {
        *(_WORD *)v26 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#configurator,Prewarming UWB-SE secure channel...",  v26,  2u);
      }

      v15 = sub_100288340();
      int v16 = sub_100288580((uint64_t)v15);
      v17 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        sub_1002BEFAC(v16, v26);
        v18 = v27 >= 0 ? v26 : *(uint8_t **)v26;
        *(_DWORD *)v31 = 136315138;
        v32 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#configurator,Prewarming UWB-SE secure channel... DONE. Status: %s",  v31,  0xCu);
        if (v27 < 0) {
          operator delete(*(void **)v26);
        }
      }
    }
  }

  unsigned int v19 = -[ConfiguratorClientInfo carKeyRangingLimitExceeded](self->_aggregatedClientInfo, "carKeyRangingLimitExceeded");
  if (v19 != [v3 carKeyRangingLimitExceeded])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10022B6FC;
    v25[3] = &unk_1007B79E0;
    v25[4] = self;
    -[NIServerSystemConfigurator _relayBlockToClients:](self, "_relayBlockToClients:", v25);
  }

  unsigned int v20 = -[ConfiguratorClientInfo acwgRangingLimitExceeded](self->_aggregatedClientInfo, "acwgRangingLimitExceeded");
  if (v20 != [v3 acwgRangingLimitExceeded])
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10022B76C;
    v24[3] = &unk_1007B79E0;
    v24[4] = self;
    -[NIServerSystemConfigurator _relayBlockToClients:](self, "_relayBlockToClients:", v24);
  }

  unsigned int v21 = -[ConfiguratorClientInfo passiveAccessIntent](self->_aggregatedClientInfo, "passiveAccessIntent");
  if (v21 != [v3 passiveAccessIntent])
  {
    v22 = sub_100288340();
    sub_100288590( (uint64_t)v22,  -[ConfiguratorClientInfo passiveAccessIntent](self->_aggregatedClientInfo, "passiveAccessIntent"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10022B7DC;
    v23[3] = &unk_1007B79E0;
    v23[4] = self;
    -[NIServerSystemConfigurator _relayBlockToClients:](self, "_relayBlockToClients:", v23);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)_relayBlockToClients:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_clients, "keyEnumerator"));
  while (1)
  {
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nextObject]);
    if (!v5) {
      break;
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_clients, "objectForKey:", v5));
    if (v6) {
      v7[2](v7, v6);
    }
  }
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  id v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000065CC(v18, off_1007B7AE0[a3]);
    int v8 = v19;
    id v9 = (void **)v18[0];
    sub_1000065CC(__p, off_1007B7B08[a4]);
    unsigned int v10 = v18;
    if (v8 < 0) {
      unsigned int v10 = v9;
    }
    if (v17 >= 0) {
      id v11 = __p;
    }
    else {
      id v11 = (void **)__p[0];
    }
    *(_DWORD *)__int128 buf = 136315394;
    unsigned int v21 = v10;
    __int16 v22 = 2080;
    v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#configurator,Ranging service updated state: %s. Cause: %s",  buf,  0x16u);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    if (v19 < 0) {
      operator delete(v18[0]);
    }
  }

  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10022BAC4;
  v13[3] = &unk_1007B14E0;
  v13[4] = self;
  int v14 = a3;
  int v15 = a4;
  dispatch_async(queue, v13);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  return self;
}

@end