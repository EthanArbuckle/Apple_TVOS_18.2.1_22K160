@interface URLRequestProperties
- (URLRequestProperties)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation URLRequestProperties

- (URLRequestProperties)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___URLRequestProperties;
  v2 = -[URLRequestProperties init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.URLRequestProperties", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v2->_KBSyncType = 0LL;
    v2->_requestMethod = 2LL;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = sub_100293AEC;
  v13 = sub_100293AFC;
  v14 = -[URLRequestProperties init]( +[URLRequestProperties allocWithZone:](&OBJC_CLASS___URLRequestProperties, "allocWithZone:"),  "init");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100294BDC;
  block[3] = &unk_1003EF3E8;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void).cxx_destruct
{
}

@end