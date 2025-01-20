@interface PDExpressPassManager
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (PDExpressPassManager)init;
- (id)createCurrentNotificationRegistrationState;
- (void)accessTerminalDidLockForType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5 withContent:(id)a6;
- (void)accessTerminalDidUnlockForType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5 withContent:(id)a6;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)receivedSecureExpressTransactionEvent:(id)a3;
- (void)secureElementExpressConfigurationDidFail;
- (void)secureElementExpressConfigurationNeedsUpdate;
@end

@implementation PDExpressPassManager

- (PDExpressPassManager)init
{
  return 0LL;
}

- (void)secureElementExpressConfigurationNeedsUpdate
{
  if (a1)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "PKExpressPassManager: sanitizing express passes",  v3,  2u);
    }
  }

- (void)secureElementExpressConfigurationDidFail
{
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "PKExpressPassManager: express configuration failed, resetting express state.",  v4,  2u);
  }
}

- (void)accessTerminalDidLockForType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5 withContent:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)PDOSTransactionCreate("PDExpressPassManager");
  v14 = (dispatch_queue_s *)PDExpressTransactionQueue();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10014F1E0;
  v19[3] = &unk_100639B18;
  id v20 = v13;
  v21 = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  int64_t v25 = a3;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, v19);
}

- (void)accessTerminalDidUnlockForType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5 withContent:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)PDOSTransactionCreate("PDExpressPassManager");
  v14 = (dispatch_queue_s *)PDExpressTransactionQueue();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10014F308;
  v19[3] = &unk_100639B18;
  id v20 = v13;
  v21 = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  int64_t v25 = a3;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, v19);
}

- (void)receivedSecureExpressTransactionEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)PDOSTransactionCreate("PDExpressPassManager");
  v6 = (dispatch_queue_s *)PDExpressTransactionQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014F3D8;
  block[3] = &unk_100639350;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(&OBJC_CLASS___PDNotificationStreamRegistrationState);
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v3, "addObject:", PKDarwinNotificationEventLostModeStateChanged);
  -[PDNotificationStreamRegistrationState setNotificationNames:forStream:]( v2,  "setNotificationNames:forStream:",  v3,  0LL);

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v6 = a3;
  accessQueue = self->_accessQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10015151C;
  v9[3] = &unk_1006392B0;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)accessQueue, v9);
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return (a3 < 6) & (0x23u >> a3);
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end