@interface NIServerHomeDeviceService
+ (id)sharedInstance;
- (id)_initInternal;
- (id)_internalPrintableState;
- (id)printableState;
- (void)_processCommonConfiguration;
- (void)addServiceClient:(id)a3 identifier:(id)a4 configuration:(id)a5;
- (void)removeServiceClientWithIdentifier:(id)a3;
@end

@implementation NIServerHomeDeviceService

+ (id)sharedInstance
{
  if (qword_1007F9618 != -1) {
    dispatch_once(&qword_1007F9618, &stru_1007B49E0);
  }
  return (id)qword_1007F9610;
}

- (id)_initInternal
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceService;
  v2 = -[NIServerHomeDeviceService init](&v17, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nearbyd.home-device-service", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    configurations = v2->_configurations;
    v2->_configurations = v9;

    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
      || (v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults")),
          unsigned int v12 = [v11 BOOLForKey:@"EnableStateDump"],
          v11,
          v12))
    {
      v13 = v2->_queue;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1001AF3B8;
      v15[3] = &unk_1007B1E00;
      v16 = v2;
      os_state_add_handler(v13, v15);
    }
  }

  return v2;
}

- (void)addServiceClient:(id)a3 identifier:(id)a4 configuration:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v11)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001AF4E0;
    block[3] = &unk_1007B1AA0;
    block[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v11;
    dispatch_sync(queue, block);
  }
}

- (void)removeServiceClientWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001AF6F8;
  v7[3] = &unk_1007A2248;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)printableState
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1001AF894;
  v10 = sub_1001AF8A4;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001AF8AC;
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
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = objc_autoreleasePoolPush();
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d clients",  -[NSMapTable count](self->_clients, "count")));
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (void)_processCommonConfiguration
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 3LL;
  configurations = self->_configurations;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001AFAC0;
  v7[3] = &unk_1007B4A08;
  void v7[4] = &v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](configurations, "enumerateKeysAndObjectsUsingBlock:", v7);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator"));
  dispatch_queue_t v5 = 0LL;
  while (1)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 nextObject]);

    if (!v6) {
      break;
    }
    dispatch_queue_t v5 = v6;
    if ((objc_opt_respondsToSelector(v6, "didUpdateMinimumPreferredUpdateRate:") & 1) != 0)
    {
      dispatch_queue_t v5 = v6;
      [v6 didUpdateMinimumPreferredUpdateRate:v9[3]];
    }
  }

  _Block_object_dispose(&v8, 8);
}

- (void).cxx_destruct
{
}

@end