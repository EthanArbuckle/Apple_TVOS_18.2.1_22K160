@interface TVMusicCachedLibraryRequest
+ (TVMusicCachedLibraryRequest)sharedInstance;
- (NSMutableDictionary)identifierMap;
- (OS_dispatch_queue)serialQueue;
- (TVMusicCachedLibraryRequest)init;
- (void)_handleResponse:(id)a3 identifier:(id)a4;
- (void)clearCacheForIdentifier:(id)a3;
- (void)getResponseForIdentifier:(id)a3 completion:(id)a4;
- (void)performRequest:(id)a3 withIdentifier:(id)a4 ignoreCache:(BOOL)a5 completion:(id)a6;
- (void)setIdentifierMap:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation TVMusicCachedLibraryRequest

+ (TVMusicCachedLibraryRequest)sharedInstance
{
  if (qword_1002BE8A8 != -1) {
    dispatch_once(&qword_1002BE8A8, &stru_10026ADA0);
  }
  return (TVMusicCachedLibraryRequest *)(id)qword_1002BE8A0;
}

- (TVMusicCachedLibraryRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicCachedLibraryRequest;
  v2 = -[TVMusicCachedLibraryRequest init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    identifierMap = v2->_identifierMap;
    v2->_identifierMap = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TVMusic.TVMusicCachedLibraryResponse", 0LL);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)performRequest:(id)a3 withIdentifier:(id)a4 ignoreCache:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVMusicCachedLibraryRequest serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004BF88;
  block[3] = &unk_10026ADF0;
  block[4] = self;
  id v18 = v11;
  BOOL v21 = a5;
  id v19 = v10;
  id v20 = v12;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(v13, block);
}

- (void)clearCacheForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVMusicCachedLibraryRequest serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004C348;
  v7[3] = &unk_100268B30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)getResponseForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVMusicCachedLibraryRequest serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C488;
  block[3] = &unk_100268BE8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_handleResponse:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVMusicCachedLibraryRequest serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C5EC;
  block[3] = &unk_1002691D8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSMutableDictionary)identifierMap
{
  return self->_identifierMap;
}

- (void)setIdentifierMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end