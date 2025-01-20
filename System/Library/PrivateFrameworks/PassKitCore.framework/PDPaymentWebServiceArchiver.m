@interface PDPaymentWebServiceArchiver
- (PDPaymentWebServiceArchiver)initWithQueue:(id)a3 webServiceCoordinator:(id)a4;
- (void)archiveBackgroundContext:(id)a3;
- (void)archiveContext:(id)a3;
@end

@implementation PDPaymentWebServiceArchiver

- (PDPaymentWebServiceArchiver)initWithQueue:(id)a3 webServiceCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDPaymentWebServiceArchiver;
  v9 = -[PDPaymentWebServiceArchiver init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_coordinator, a4);
  }

  return v10;
}

- (void)archiveContext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002B4F8;
    block[3] = &unk_1006392B0;
    v11 = (os_log_s *)v4;
    objc_super v12 = self;
    dispatch_async((dispatch_queue_t)queue, block);
    id v7 = v11;
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Error: We don't support archiving nil contexts!",  v9,  2u);
    }
  }
}

- (void)archiveBackgroundContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B5F8;
  block[3] = &unk_100639300;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void).cxx_destruct
{
}

@end