@interface MTMediaLibraryTransactionManager
- (MTMediaLibraryTransactionManager)init;
- (OS_dispatch_queue)serialQueue;
- (int64_t)counterForGeneratingLibraryChangeNotifications;
- (void)_beginGeneratingLibraryChangeNotifications;
- (void)_endGeneratingLibraryChangeNotifications;
- (void)beginGeneratingLibraryChangeNotifications:(id)a3;
- (void)endGeneratingLibraryChangeNotifications:(id)a3;
- (void)requestMediaLibraryReadTransaction:(id)a3;
- (void)requestMediaLibraryWriteTransaction:(id)a3;
- (void)requestMediaLibraryWriteTransaction:(id)a3 completion:(id)a4;
- (void)setCounterForGeneratingLibraryChangeNotifications:(int64_t)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation MTMediaLibraryTransactionManager

- (MTMediaLibraryTransactionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTMediaLibraryTransactionManager;
  v2 = -[MTMediaLibraryTransactionManager init](&v5, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MTMediaLibraryManager", 0LL);
    -[MTMediaLibraryTransactionManager setSerialQueue:](v2, "setSerialQueue:", v3);

    -[MTMediaLibraryTransactionManager setCounterForGeneratingLibraryChangeNotifications:]( v2,  "setCounterForGeneratingLibraryChangeNotifications:",  0LL);
  }

  return v2;
}

- (void)requestMediaLibraryWriteTransaction:(id)a3
{
}

- (void)requestMediaLibraryWriteTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTMediaLibraryTransactionManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C84F8;
  block[3] = &unk_100243DE0;
  objc_copyWeak(&v14, &location);
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)requestMediaLibraryReadTransaction:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTMediaLibraryTransactionManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8694;
  block[3] = &unk_1002400E8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)_beginGeneratingLibraryChangeNotifications
{
  uint64_t v3 = _MTLogCategoryMediaLibrary(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134217984;
    int64_t v12 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications]( self,  "counterForGeneratingLibraryChangeNotifications");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "will beginGeneratingLibraryChangeNotifications: %li",  (uint8_t *)&v11,  0xCu);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  [v5 beginGeneratingLibraryChangeNotifications];

  id v6 = -[MTMediaLibraryTransactionManager setCounterForGeneratingLibraryChangeNotifications:]( self,  "setCounterForGeneratingLibraryChangeNotifications:",  (char *)-[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications]( self,  "counterForGeneratingLibraryChangeNotifications")
       + 1);
  uint64_t v8 = _MTLogCategoryMediaLibrary(v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int64_t v10 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications]( self,  "counterForGeneratingLibraryChangeNotifications");
    int v11 = 134217984;
    int64_t v12 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "did beginGeneratingLibraryChangeNotifications: %li",  (uint8_t *)&v11,  0xCu);
  }
}

- (void)_endGeneratingLibraryChangeNotifications
{
  int64_t v3 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications]( self,  "counterForGeneratingLibraryChangeNotifications");
  if (!v3)
  {
    uint64_t v5 = _MTLogCategoryMediaLibrary(0LL, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "attempting to endGeneratingLibraryChangeNotifications when already ended -- could result in unbalanced calls",  (uint8_t *)&v16,  2u);
    }
  }

  uint64_t v7 = _MTLogCategoryMediaLibrary(v3, v4);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int64_t v9 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications]( self,  "counterForGeneratingLibraryChangeNotifications");
    int v16 = 134217984;
    int64_t v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "will endGeneratingLibraryChangeNotifications: %ld",  (uint8_t *)&v16,  0xCu);
  }

  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  [v10 endGeneratingLibraryChangeNotifications];

  id v11 = -[MTMediaLibraryTransactionManager setCounterForGeneratingLibraryChangeNotifications:]( self,  "setCounterForGeneratingLibraryChangeNotifications:",  (char *)-[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications]( self,  "counterForGeneratingLibraryChangeNotifications")
        - 1);
  uint64_t v13 = _MTLogCategoryMediaLibrary(v11, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int64_t v15 = -[MTMediaLibraryTransactionManager counterForGeneratingLibraryChangeNotifications]( self,  "counterForGeneratingLibraryChangeNotifications");
    int v16 = 134217984;
    int64_t v17 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "will endGeneratingLibraryChangeNotifications: %ld",  (uint8_t *)&v16,  0xCu);
  }
}

- (void)beginGeneratingLibraryChangeNotifications:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTMediaLibraryTransactionManager serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C8A2C;
  v7[3] = &unk_1002405F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)endGeneratingLibraryChangeNotifications:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTMediaLibraryTransactionManager serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C8AF4;
  v7[3] = &unk_100240138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (int64_t)counterForGeneratingLibraryChangeNotifications
{
  return self->_counterForGeneratingLibraryChangeNotifications;
}

- (void)setCounterForGeneratingLibraryChangeNotifications:(int64_t)a3
{
  self->_counterForGeneratingLibraryChangeNotifications = a3;
}

- (void).cxx_destruct
{
}

@end