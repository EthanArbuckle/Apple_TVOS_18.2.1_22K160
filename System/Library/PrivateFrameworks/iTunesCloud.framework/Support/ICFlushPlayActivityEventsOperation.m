@interface ICFlushPlayActivityEventsOperation
- (ICFlushPlayActivityEventsOperation)init;
- (ICFlushPlayActivityEventsOperation)initWithPlayActivityTable:(id)a3;
- (void)execute;
@end

@implementation ICFlushPlayActivityEventsOperation

- (ICFlushPlayActivityEventsOperation)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ICFlushPlayActivityEventsOperation;
  return -[ICFlushPlayActivityEventsOperation init](&v4, "init");
}

- (ICFlushPlayActivityEventsOperation)initWithPlayActivityTable:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"ICFlushPlayActivityEventsOperation.m" lineNumber:29 description:@"initWithPlayActivityController called with nil playActivityTable"];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ICFlushPlayActivityEventsOperation;
  v7 = -[ICFlushPlayActivityEventsOperation init](&v11, "init");
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_table, a3);
  }

  return v8;
}

- (void)execute
{
  if (-[ICFlushPlayActivityEventsOperation isCancelled](self, "isCancelled"))
  {
    -[ICFlushPlayActivityEventsOperation finish](self, "finish");
  }

  else
  {
    v35[0] = 0LL;
    v35[1] = v35;
    v35[2] = 0x3032000000LL;
    v35[3] = sub_10004BA88;
    v35[4] = sub_10004BA98;
    id v36 = 0LL;
    v33[0] = 0LL;
    v33[1] = v33;
    v33[2] = 0x2020000000LL;
    char v34 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10004BAA0;
    v28[3] = &unk_1001A2F40;
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICFlushPlayActivityEventsOperation.serialQueue", 0LL);
    v29 = v3;
    v30 = self;
    v31 = v33;
    v32 = v35;
    objc_super v4 = objc_retainBlock(v28);
    uint64_t v22 = 0LL;
    v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    v25 = sub_10004BA88;
    v26 = sub_10004BA98;
    id v27 = 0LL;
    v20[0] = 0LL;
    v20[1] = v20;
    v20[2] = 0x3032000000LL;
    v20[3] = sub_10004BA88;
    v20[4] = sub_10004BA98;
    id v21 = 0LL;
    v5 = self->_table;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004BC28;
    v16[3] = &unk_1001A4DC0;
    id v6 = v5;
    v17 = v6;
    v18 = &v22;
    v19 = v20;
    -[ICPlayActivityTable performTransactionWithBlock:](v6, "performTransactionWithBlock:", v16);
    id v7 = [(id)v23[5] count];
    if (v7)
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v38 = 0x2020000000LL;
      id v39 = v7;
      v8 = (void *)v23[5];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10004BC9C;
      v10[3] = &unk_1001A3058;
      objc_super v11 = v6;
      v12 = v3;
      p___int128 buf = &buf;
      v13 = self;
      v14 = v4;
      [v8 enumerateObjectsUsingBlock:v10];

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      v9 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Unexpected empty store account IDs, finishing.",  (uint8_t *)&buf,  0xCu);
      }

      ((void (*)(void *, void, uint64_t, uint64_t))v4[2])(v4, 0LL, 1LL, 1LL);
    }

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
  }

- (void).cxx_destruct
{
}

@end