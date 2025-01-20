@interface URLResponseDecoder
- (URLResponseDecoder)init;
- (id)resultFromResult:(id)a3 error:(id *)a4;
@end

@implementation URLResponseDecoder

- (URLResponseDecoder)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___URLResponseDecoder;
  v2 = -[URLResponseDecoder init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.URLResponseDecoder", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    requestProperties = v2->_requestProperties;
    v2->_requestProperties = v7;
  }

  return v2;
}

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___URLResponseDecoder;
  id v5 = -[URLResponseDecoder resultFromResult:error:](&v13, "resultFromResult:error:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001BA698;
    v10[3] = &unk_1003E9DC0;
    id v11 = v6;
    v12 = self;
    dispatch_sync(dispatchQueue, v10);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end