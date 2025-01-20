@interface TIImageCacheServer
+ (id)sharedInstance;
- (BOOL)_isValidItem:(id)a3;
- (BOOL)_isValidKey:(id)a3 group:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (TIImageCacheServer)init;
- (id)_bundleIdForConnection:(id)a3;
- (void)_createImageCacheIfNecessary;
- (void)_logInvalidConnection;
- (void)cacheItem:(id)a3 key:(id)a4 group:(id)a5;
- (void)dealloc;
@end

@implementation TIImageCacheServer

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000039BC;
  block[3] = &unk_100014728;
  block[4] = a1;
  if (qword_10001E200 != -1) {
    dispatch_once(&qword_10001E200, block);
  }
  return (id)qword_10001E1F8;
}

- (TIImageCacheServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TIImageCacheServer;
  v2 = -[TIImageCacheServer init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TextInput.image-cache-server", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v8 = -[NSXPCListener initWithMachServiceName:](v7, "initWithMachServiceName:", TIImageCacheServiceName);
    listener = v2->_listener;
    v2->_listener = v8;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_dispatchQueue);
    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (void)dealloc
{
  imageCache = self->_imageCache;
  self->_imageCache = 0LL;

  invalidBundles = self->_invalidBundles;
  self->_invalidBundles = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TIImageCacheServer;
  -[TIImageCacheServer dealloc](&v5, "dealloc");
}

- (id)_bundleIdForConnection:(id)a3
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 _xpcConnection]);
  v4 = (void *)xpc_connection_copy_bundle_id();

  if (v4)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
    free(v4);
  }

  else
  {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003CC4;
  v11[3] = &unk_100014750;
  v11[4] = &v12;
  TIDispatchSync(&_dispatch_main_q, v11);
  if (!*((_BYTE *)v13 + 24)) {
    goto LABEL_6;
  }
  if (!self->_invalidBundles)
  {
LABEL_8:
    [v5 setExportedObject:self];
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TIImageCaching));
    [v5 setExportedInterface:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIImageCacheServer dispatchQueue](self, "dispatchQueue"));
    [v5 _setQueue:v9];

    [v5 resume];
    BOOL v7 = 1;
    goto LABEL_9;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIImageCacheServer _bundleIdForConnection:](self, "_bundleIdForConnection:", v5));
  if (!v6 || (-[NSMutableSet containsObject:](self->_invalidBundles, "containsObject:", v6) & 1) == 0)
  {

    goto LABEL_8;
  }

LABEL_6:
  BOOL v7 = 0;
LABEL_9:
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_createImageCacheIfNecessary
{
  if (!self->_imageCache)
  {
    dispatch_queue_attr_t v3 = -[TIImageCacheClient initWithLocalAccess:]( objc_alloc(&OBJC_CLASS___TIImageCacheClient),  "initWithLocalAccess:",  1LL);
    imageCache = self->_imageCache;
    self->_imageCache = v3;
  }

- (BOOL)_isValidKey:(id)a3 group:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 isEqualToString:@"Candidates"])
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000LL;
    char v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100003E50;
    v10[3] = &unk_100014778;
    id v11 = v6;
    uint64_t v12 = &v13;
    TIDispatchSync(&_dispatch_main_q, v10);
    int v8 = *((unsigned __int8 *)v14 + 24);

    _Block_object_dispose(&v13, 8);
    if (!v8) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v7 = 1;
    goto LABEL_6;
  }

- (BOOL)_isValidItem:(id)a3
{
  id v3 = a3;
  [v3 size];
  BOOL v7 = 0;
  if (v4 > 0.0)
  {
    [v3 size];
    if (v5 > 0.0)
    {
      [v3 scale];
      if (v6 >= 1.0)
      {
        [v3 format];
      }
    }
  }

  return v7;
}

- (void)_logInvalidConnection
{
  if (!self->_invalidBundles)
  {
    id v3 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 1LL);
    invalidBundles = self->_invalidBundles;
    self->_invalidBundles = v3;
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIImageCacheServer _bundleIdForConnection:](self, "_bundleIdForConnection:"));
  if (v5) {
    -[NSMutableSet addObject:](self->_invalidBundles, "addObject:", v5);
  }
}

- (void)cacheItem:(id)a3 key:(id)a4 group:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        -[TIImageCacheServer _createImageCacheIfNecessary](self, "_createImageCacheIfNecessary");
        if ((-[TIImageCacheClient imageExistsForKey:inGroup:]( self->_imageCache,  "imageExistsForKey:inGroup:",  v8,  v9) & 1) == 0)
        {
          if (-[TIImageCacheServer _isValidKey:group:](self, "_isValidKey:group:", v8, v9)
            && -[TIImageCacheServer _isValidItem:](self, "_isValidItem:", v10))
          {
            -[TIImageCacheClient storeImageDataForKey:inGroup:item:]( self->_imageCache,  "storeImageDataForKey:inGroup:item:",  v8,  v9,  v10);
          }

          else
          {
            -[TIImageCacheServer _logInvalidConnection](self, "_logInvalidConnection");
          }
        }
      }
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end