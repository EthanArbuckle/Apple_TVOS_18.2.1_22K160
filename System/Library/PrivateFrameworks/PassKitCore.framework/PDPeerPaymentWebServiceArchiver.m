@interface PDPeerPaymentWebServiceArchiver
- (PDPeerPaymentWebServiceArchiver)initWithQueue:(id)a3;
- (void)archiveContext:(id)a3;
@end

@implementation PDPeerPaymentWebServiceArchiver

- (PDPeerPaymentWebServiceArchiver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDPeerPaymentWebServiceArchiver;
  v6 = -[PDPeerPaymentWebServiceArchiver init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)archiveContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003C120C;
    block[3] = &unk_100639300;
    v11 = (os_log_s *)v4;
    dispatch_async((dispatch_queue_t)queue, block);
    v7 = v11;
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(11LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Error: We don't support archiving nil contexts!",  v9,  2u);
    }
  }
}

- (void).cxx_destruct
{
}

@end