@interface SHServerResponseContextBuilder
- (void)loadContextForClientIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SHServerResponseContextBuilder

- (void)loadContextForClientIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_group_create();
  v8 = dispatch_queue_create("com.apple.ShazamKit.serverResponseContextBuilder.dispatch", 0LL);
  v9 = objc_alloc_init(&OBJC_CLASS___SHServerResponseContext);
  v10 = v9;
  if (v7)
  {
    dispatch_group_enter(v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F5DC;
    block[3] = &unk_10006CE28;
    v11 = v10;
    v25 = v11;
    v12 = v7;
    v26 = v12;
    dispatch_async(v8, block);
    dispatch_group_enter(v12);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000F708;
    v20[3] = &unk_10006CE00;
    v13 = v11;
    v21 = v13;
    id v22 = v5;
    v14 = v12;
    v23 = v14;
    dispatch_async(v8, v20);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000F83C;
    v17[3] = &unk_10006CEF0;
    id v19 = v6;
    v18 = v13;
    dispatch_group_notify(v14, v8, v17);
  }

  else
  {
    uint64_t v15 = sh_log_object(v9);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to create dispatch group while loading context",  buf,  2u);
    }

    (*((void (**)(id, SHServerResponseContext *))v6 + 2))(v6, v10);
  }
}

@end