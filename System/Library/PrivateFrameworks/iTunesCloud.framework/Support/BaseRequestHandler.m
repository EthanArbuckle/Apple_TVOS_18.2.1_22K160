@interface BaseRequestHandler
+ (BOOL)supportsAccountlessHandling;
+ (BaseRequestHandler)accountlessHandler;
+ (NSArray)managedConfigurations;
+ (NSMutableDictionary)handlers;
+ (OS_dispatch_queue)globalSerialQueue;
+ (id)deleteHandlerForConfiguration:(id)a3;
+ (id)handlerForConfiguration:(id)a3;
- (BOOL)isActive;
- (BaseRequestHandler)init;
- (BaseRequestHandler)initWithConfiguration:(id)a3;
- (ICConnectionConfiguration)configuration;
- (ICDBackgroundTaskScheduling)taskScheduler;
- (ICUserIdentity)userIdentity;
- (ICUserIdentityStore)userIdentityStore;
- (ML3MusicLibrary)musicLibrary;
- (id)description;
- (void)onCalloutQueue:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setTaskScheduler:(id)a3;
@end

@implementation BaseRequestHandler

- (BaseRequestHandler)init
{
  return 0LL;
}

- (BaseRequestHandler)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___BaseRequestHandler;
  v6 = -[BaseRequestHandler init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 userIdentity]);
    userIdentity = v7->_userIdentity;
    v7->_userIdentity = (ICUserIdentity *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 userIdentityStore]);
    userIdentityStore = v7->_userIdentityStore;
    v7->_userIdentityStore = (ICUserIdentityStore *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v7->_userIdentity));
    musicLibrary = v7->_musicLibrary;
    v7->_musicLibrary = (ML3MusicLibrary *)v12;
  }

  return v7;
}

- (void)onCalloutQueue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000255C0;
    block[3] = &unk_1001A6BE0;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountDSID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: [dsid=%@, active=%d]>",  v5,  self,  v8,  self->_active));

  return v9;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_userIdentityStore;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (ICDBackgroundTaskScheduling)taskScheduler
{
  return self->_taskScheduler;
}

- (void)setTaskScheduler:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

+ (OS_dispatch_queue)globalSerialQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025D04;
  block[3] = &unk_1001A21F8;
  void block[4] = a1;
  if (qword_1001DB5B8 != -1) {
    dispatch_once(&qword_1001DB5B8, block);
  }
  return (OS_dispatch_queue *)(id)qword_1001DB5B0;
}

+ (NSMutableDictionary)handlers
{
  return 0LL;
}

+ (id)handlerForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_1000259B8;
  v19 = sub_1000259C8;
  id v20 = 0LL;
  id v6 = objc_msgSend((id)objc_opt_class(a1, v5), "globalSerialQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025BF4;
  block[3] = &unk_1001A2220;
  id v12 = v4;
  v13 = &v15;
  id v14 = a1;
  id v8 = v4;
  dispatch_sync(v7, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

+ (id)deleteHandlerForConfiguration:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000LL;
    uint64_t v17 = sub_1000259B8;
    v18 = sub_1000259C8;
    id v19 = 0LL;
    id v6 = objc_msgSend((id)objc_opt_class(a1, v4), "globalSerialQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100025A6C;
    block[3] = &unk_1001A2220;
    id v13 = a1;
    id v11 = v5;
    id v12 = &v14;
    dispatch_sync(v7, block);

    id v8 = (id)v15[5];
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

+ (NSArray)managedConfigurations
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_1000259B8;
  id v12 = sub_1000259C8;
  id v13 = 0LL;
  id v3 = objc_msgSend((id)objc_opt_class(a1, a2), "globalSerialQueue");
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000259D0;
  v7[3] = &unk_1001A2248;
  v7[4] = &v8;
  v7[5] = a1;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

+ (BOOL)supportsAccountlessHandling
{
  return 0;
}

+ (BaseRequestHandler)accountlessHandler
{
  return 0LL;
}

@end