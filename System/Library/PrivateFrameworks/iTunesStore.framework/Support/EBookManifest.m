@interface EBookManifest
+ (id)purchasedBookManifest;
+ (id)sharedPurchasedBookManifest;
+ (id)syncedBookManifest;
- (EBookManifest)init;
- (EBookManifest)initWithManifestPath:(id)a3;
- (NSString)manifestPath;
- (id)_entries;
- (id)_manifest;
- (id)bookPathForAdamID:(id)a3 withPublicationVersion:(id)a4;
- (id)bookPathPermalink:(id)a3;
- (id)manifestEntriesWithProperty:(id)a3 equalToValue:(id)a4 limitCount:(int64_t)a5;
- (void)_invalidateAfterExternalChange;
- (void)addManifestEntries:(id)a3;
- (void)addManifestEntry:(id)a3;
- (void)dealloc;
- (void)removeManifestEntryWithDownloadPermalink:(id)a3;
- (void)removeManifestEntryWithStoreItemID:(id)a3;
- (void)synchronizeData;
@end

@implementation EBookManifest

- (EBookManifest)init
{
  return -[EBookManifest initWithManifestPath:](self, "initWithManifestPath:", 0LL);
}

- (EBookManifest)initWithManifestPath:(id)a3
{
  if (![a3 length]) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"EBookManifest.m",  35LL,  @"Empty path");
  }
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___EBookManifest;
  v6 = -[EBookManifest init](&v9, "init");
  if (v6)
  {
    v6->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.EBookManifest", 0LL);
    v6->_manifestPath = (NSString *)[a3 copy];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_1000E3764,  @"com.apple.books.plist.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.books.plist.changed", 0LL);
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___EBookManifest;
  -[EBookManifest dealloc](&v4, "dealloc");
}

+ (id)purchasedBookManifest
{
  if (qword_1003A33D0 != -1) {
    dispatch_once(&qword_1003A33D0, &stru_10034E2A0);
  }
  return (id)qword_1003A33C8;
}

+ (id)sharedPurchasedBookManifest
{
  if (qword_1003A33E0 != -1) {
    dispatch_once(&qword_1003A33E0, &stru_10034E2C0);
  }
  return (id)qword_1003A33D8;
}

+ (id)syncedBookManifest
{
  if (qword_1003A33F0 != -1) {
    dispatch_once(&qword_1003A33F0, &stru_10034E2E0);
  }
  return (id)qword_1003A33E8;
}

- (void)addManifestEntry:(id)a3
{
  objc_super v4 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  -[EBookManifest addManifestEntries:](self, "addManifestEntries:", v4);
}

- (void)addManifestEntries:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000E3A90;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (id)bookPathPermalink:(id)a3
{
  if (a3
    && (id v3 = -[EBookManifest manifestEntriesWithProperty:equalToValue:limitCount:]( self,  "manifestEntriesWithProperty:equalToValue:limitCount:",  @"iTunesU Permlink",  a3,  1),  [v3 count] == (id)1)
    && (id v4 = [v3 objectAtIndex:0]) != 0)
  {
    return [v4 objectForKey:@"Path"];
  }

  else
  {
    return 0LL;
  }

- (id)bookPathForAdamID:(id)a3 withPublicationVersion:(id)a4
{
  if (a3
    && (id v5 = -[EBookManifest manifestEntriesWithProperty:equalToValue:limitCount:]( self,  "manifestEntriesWithProperty:equalToValue:limitCount:",  @"s",  a3,  1),  [v5 count] == (id)1)
    && (id v6 = [v5 objectAtIndex:0]) != 0
    && (v7 = v6,
        objc_msgSend( objc_msgSend(v6, "objectForKey:", @"Publication Version"),  "isEqualToNumber:",  a4)))
  {
    return [v7 objectForKey:@"Path"];
  }

  else
  {
    return 0LL;
  }

- (id)manifestEntriesWithProperty:(id)a3 equalToValue:(id)a4 limitCount:(int64_t)a5
{
  id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E3D98;
  block[3] = &unk_10034BA08;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = v9;
  block[8] = a5;
  dispatch_sync(dispatchQueue, block);
  return v9;
}

- (NSString)manifestPath
{
  return self->_manifestPath;
}

- (void)removeManifestEntryWithStoreItemID:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000E3F2C;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)removeManifestEntryWithDownloadPermalink:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000E4150;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)synchronizeData
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E4374;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (id)_entries
{
  id v2 = -[EBookManifest _manifest](self, "_manifest");
  id result = [v2 objectForKey:@"Books"];
  if (!result) {
    return [v2 objectForKey:@"Purchases"];
  }
  return result;
}

- (void)_invalidateAfterExternalChange
{
  id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  id v6 = (os_log_s *)[v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    uint64_t v7 = objc_opt_class(self);
    manifestPath = self->_manifestPath;
    int v13 = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    v16 = manifestPath;
    uint64_t v9 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Invalidating after external change: %@",  &v13,  22);
    if (v9)
    {
      v10 = (void *)v9;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
      free(v10);
      SSFileLog(v3, @"%@");
    }
  }

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E47A4;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)_manifest
{
  id result = self->_manifest;
  if (!result)
  {
    unsigned int v4 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    if (-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", self->_manifestPath))
    {
      uint64_t v22 = 0LL;
      uint64_t v5 = -[NSData initWithContentsOfFile:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfFile:options:error:",  self->_manifestPath,  0LL,  &v22);
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = (NSMutableDictionary *) +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  2LL,  0LL,  &v22);
        self->_manifest = v7;
        if (!v7)
        {
          id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v8) {
            id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v9 = [v8 shouldLog];
          else {
            LODWORD(v10) = v9;
          }
          v11 = (os_log_s *)[v8 OSLogObject];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v10 = v10;
          }
          else {
            v10 &= 2u;
          }
          if ((_DWORD)v10)
          {
            uint64_t v12 = objc_opt_class(self);
            int v23 = 138412546;
            uint64_t v24 = v12;
            __int16 v25 = 2112;
            uint64_t v26 = v22;
            uint64_t v13 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Could not unserialize data: %@",  &v23,  22);
            if (v13)
            {
              uint64_t v14 = (void *)v13;
              +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
              free(v14);
              SSFileLog(v8, @"%@");
            }
          }

          self->_manifest = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        }

        goto LABEL_30;
      }

      id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v16 = [v15 shouldLog];
      else {
        LODWORD(v17) = v16;
      }
      v18 = (os_log_s *)[v15 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = v17;
      }
      else {
        v17 &= 2u;
      }
      if ((_DWORD)v17)
      {
        uint64_t v19 = objc_opt_class(self);
        int v23 = 138412546;
        uint64_t v24 = v19;
        __int16 v25 = 2112;
        uint64_t v26 = v22;
        uint64_t v20 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Could not read data: %@",  &v23,  22);
        if (v20)
        {
          v21 = (void *)v20;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v20, 4LL);
          free(v21);
          SSFileLog(v15, @"%@");
        }
      }
    }

    self->_manifest = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
LABEL_30:

    return self->_manifest;
  }

  return result;
}

@end