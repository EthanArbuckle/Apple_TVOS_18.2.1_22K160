@interface _PBHomeUIServiceClientConduit
+ (id)_homeUIManager;
- (BSInvalidatable)homeUIObservationHandle;
- (PBSSystemHomeUIServiceClientInterface)delegate;
- (_PBHomeUIServiceClientConduit)init;
- (id)fetchCurrentHomeUIStreamState;
- (void)dealloc;
- (void)homeUIManager:(id)a3 streamStateDidUpdate:(id)a4;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation _PBHomeUIServiceClientConduit

- (_PBHomeUIServiceClientConduit)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____PBHomeUIServiceClientConduit;
  v2 = -[_PBHomeUIServiceClientConduit init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    id v4 = [(id)objc_opt_class(v2) _homeUIManager];
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 addObserver:v3]);
    homeUIObservationHandle = v3->_homeUIObservationHandle;
    v3->_homeUIObservationHandle = (BSInvalidatable *)v6;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PBHomeUIServiceClientConduit;
  -[_PBHomeUIServiceClientConduit dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  homeUIObservationHandle = self->_homeUIObservationHandle;
  self->_homeUIObservationHandle = 0LL;
}

- (id)fetchCurrentHomeUIStreamState
{
  id v3 = [(id)objc_opt_class(self) _homeUIManager];
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10006C6F4;
  v20 = sub_10006C704;
  id v21 = 0LL;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_10006C71C;
  v13 = &unk_1003D0210;
  v15 = &v16;
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v14 = v4;
  dispatch_sync(&_dispatch_main_q, &v10);

  v5 = (void *)v17[5];
  if (!v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[PBSSystemHomeUIStreamState inactiveState]( &OBJC_CLASS___PBSSystemHomeUIStreamState,  "inactiveState",  v10,  v11,  v12,  v13));
    v7 = (void *)v17[5];
    v17[5] = v6;

    v5 = (void *)v17[5];
  }

  id v8 = v5;

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (void)homeUIManager:(id)a3 streamStateDidUpdate:(id)a4
{
}

+ (id)_homeUIManager
{
  return (id)objc_claimAutoreleasedReturnValue( +[PBHomeUIManager sharedInstance]( &OBJC_CLASS___PBHomeUIManager,  "sharedInstance"));
}

- (PBSSystemHomeUIServiceClientInterface)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (BSInvalidatable)homeUIObservationHandle
{
  return self->_homeUIObservationHandle;
}

- (void).cxx_destruct
{
}

@end