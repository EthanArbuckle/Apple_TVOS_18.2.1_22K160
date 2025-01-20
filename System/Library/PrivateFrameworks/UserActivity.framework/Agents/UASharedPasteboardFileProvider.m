@interface UASharedPasteboardFileProvider
- (BOOL)locked;
- (NSMutableDictionary)providerRequests;
- (NSOperationQueue)_providedItemsOperationQueue;
- (NSURL)_providedItemsURL;
- (UASharedPasteboardFileProvider)initWithURL:(id)a3;
- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5;
- (void)setLocked:(BOOL)a3;
- (void)setProviderRequests:(id)a3;
- (void)unlockWithError:(id)a3;
@end

@implementation UASharedPasteboardFileProvider

- (UASharedPasteboardFileProvider)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UASharedPasteboardFileProvider;
  v6 = -[UASharedPasteboardFileProvider init](&v11, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    providedItemsOperationQueue = v6->_providedItemsOperationQueue;
    v6->_providedItemsOperationQueue = v7;

    objc_storeStrong((id *)&v6->_providedItemsURL, a3);
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[UASharedPasteboardFileProvider setProviderRequests:](v6, "setProviderRequests:", v9);

    -[UASharedPasteboardFileProvider setLocked:](v6, "setLocked:", 1LL);
  }

  return v6;
}

- (void)unlockWithError:(id)a3
{
  id v4 = a3;
  -[UASharedPasteboardFileProvider setLocked:](self, "setLocked:", 0LL);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardFileProvider providerRequests](self, "providerRequests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);

  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v17 = v8;
    do
    {
      objc_super v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardFileProvider providerRequests](self, "providerRequests", v17));
        v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);

        if (v14)
        {
          os_log_t v15 = sub_100039584(@"pasteboard-server");
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = v12;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Unlocking reader %@", buf, 0xCu);
          }

          ((void (**)(void, id))v14)[2](v14, v4);
        }

        objc_super v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v9);
  }
}

- (void)_provideItemAtURL:(id)a3 toReaderWithID:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  os_log_t v9 = sub_100039584(@"pasteboard-server");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "providing item to reader %@",  (uint8_t *)&v15,  0xCu);
  }

  if (-[UASharedPasteboardFileProvider locked](self, "locked"))
  {
    os_log_t v11 = sub_100039584(@"pasteboard-server");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Currently locked, saving callback for when unlocked",  (uint8_t *)&v15,  2u);
    }

    id v13 = objc_retainBlock(v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardFileProvider providerRequests](self, "providerRequests"));
    [v14 setObject:v13 forKeyedSubscript:v7];
  }

  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }
}

- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_log_t v8 = sub_100039584(@"pasteboard-server");
  os_log_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)os_log_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "_provideItemAtURL called without readerID, creating UUID to act as readerID",  v11,  2u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  -[UASharedPasteboardFileProvider _provideItemAtURL:toReaderWithID:completionHandler:]( self,  "_provideItemAtURL:toReaderWithID:completionHandler:",  v7,  v10,  v6);
}

- (NSOperationQueue)_providedItemsOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSURL)_providedItemsURL
{
  return (NSURL *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSMutableDictionary)providerRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProviderRequests:(id)a3
{
}

- (BOOL)locked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void).cxx_destruct
{
}

@end