@interface PDPaymentSafariCardImportManager
- (PDPaymentSafariCardImportManager)initWithWebService:(id)a3 webServiceQueue:(id)a4 databaseManager:(id)a5;
- (void)_associateCredentialsForItem:(id)a3;
- (void)_cleanupQueueResources;
- (void)_popEligibilityQueue;
- (void)_processEligibilityItem:(id)a3;
- (void)processSafariCredentialEligibility:(id)a3 completion:(id)a4;
@end

@implementation PDPaymentSafariCardImportManager

- (PDPaymentSafariCardImportManager)initWithWebService:(id)a3 webServiceQueue:(id)a4 databaseManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPaymentSafariCardImportManager;
  v12 = -[PDPaymentSafariCardImportManager init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_webService, a3);
    objc_storeStrong((id *)&v13->_webServiceQueue, a4);
    objc_storeStrong((id *)&v13->_databaseManager, a5);
  }

  return v13;
}

- (void)processSafariCredentialEligibility:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PDDefaultQueue();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061F40;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)_popEligibilityQueue
{
  id v3 = PDDefaultQueue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000621F8;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_cleanupQueueResources
{
  eligibilityItems = self->_eligibilityItems;
  self->_eligibilityItems = 0LL;

  provisioningController = self->_provisioningController;
  self->_provisioningController = 0LL;
}

- (void)_processEligibilityItem:(id)a3
{
  id v4 = a3;
  provisioningController = self->_provisioningController;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (provisioningController)
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Safari Import: Provisioning controller exists, associating immediately",  (uint8_t *)buf,  2u);
    }

    -[PDPaymentSafariCardImportManager _associateCredentialsForItem:](self, "_associateCredentialsForItem:", v4);
  }

  else
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Safari Import: Creating provisioning controller",  (uint8_t *)buf,  2u);
    }

    objc_initWeak(buf, self);
    webServiceQueue = self->_webServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000624AC;
    block[3] = &unk_10063D6D8;
    block[4] = self;
    objc_copyWeak(&v12, buf);
    id v11 = v4;
    dispatch_async((dispatch_queue_t)webServiceQueue, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

- (void)_associateCredentialsForItem:(id)a3
{
  id v4 = a3;
  webServiceQueue = self->_webServiceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000629F4;
  v7[3] = &unk_1006392B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)webServiceQueue, v7);
}

- (void).cxx_destruct
{
}

@end