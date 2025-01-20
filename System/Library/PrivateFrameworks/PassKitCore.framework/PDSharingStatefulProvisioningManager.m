@interface PDSharingStatefulProvisioningManager
- (BOOL)_isPassProvisioningComplete:(id)a3;
- (PDSharingStatefulProvisioningManager)init;
- (PDSharingStatefulProvisioningManager)initWithQueue:(id)a3 replyQueue:(id)a4 databaseManager:(id)a5 delegate:(id)a6;
- (id)operations;
- (id)pendingShares;
- (void)_enumerateOperations:(id)a3;
- (void)_operationDidTimeout:(id)a3;
- (void)_recalculateOperations;
- (void)addOperation:(id)a3;
- (void)channelEndpointWasTerminatedRemotely:(id)a3;
- (void)didReceiverActivationCodeFailureForShare:(id)a3 attemptsRemaining:(unint64_t)a4 transportIdentifier:(id)a5;
- (void)passAddedOrUpdated:(id)a3;
- (void)userDidEnterActivationCodeForShare:(id)a3 activationCode:(id)a4;
- (void)userDidTerminatePendingShareActivationForShare:(id)a3;
@end

@implementation PDSharingStatefulProvisioningManager

- (PDSharingStatefulProvisioningManager)init
{
  return 0LL;
}

- (PDSharingStatefulProvisioningManager)initWithQueue:(id)a3 replyQueue:(id)a4 databaseManager:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDSharingStatefulProvisioningManager;
  v15 = -[PDSharingStatefulProvisioningManager init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_replyQueue, a4);
    objc_storeStrong((id *)&v16->_databaseManager, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    operations = v16->_operations;
    v16->_operations = v17;
  }

  return v16;
}

- (id)operations
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008E08;
  v6[3] = &unk_1006391D0;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = v7;
  -[PDSharingStatefulProvisioningManager _enumerateOperations:](self, "_enumerateOperations:", v6);
  id v4 = -[NSMutableArray copy](v3, "copy");

  return v4;
}

- (id)pendingShares
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passSharesWithNoPass](self->_databaseManager, "passSharesWithNoPass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pk_objectsPassingTest:", &stru_100639210));

  return v3;
}

- (void)didReceiverActivationCodeFailureForShare:(id)a3 attemptsRemaining:(unint64_t)a4 transportIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100008F50;
  v13[3] = &unk_100639288;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)passAddedOrUpdated:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000093E0;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_operationDidTimeout:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_operations, "indexOfObjectIdenticalTo:", v4);
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v5;
    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 shareIdentifier]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 transportIdentifier]);
      uint64_t v11 = PKSharingLoggableMailboxAddress(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v16 = 138412546;
      unint64_t v17 = v9;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "StatefulProvisioningManager: Operation timed out for share: '%@' transportIdentifier: '%@'",  (uint8_t *)&v16,  0x16u);
    }

    -[NSMutableArray removeObjectAtIndex:](self->_operations, "removeObjectAtIndex:", v6);
    id v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 completion]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError pkSharingError:](&OBJC_CLASS___NSError, "pkSharingError:", 4LL));
    ((void (**)(void, void, void *))v13)[2](v13, 0LL, v14);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained provisioningOperationsDidUpdate];
  }
}

- (void)userDidTerminatePendingShareActivationForShare:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000099EC;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)userDidEnterActivationCodeForShare:(id)a3 activationCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009D60;
  block[3] = &unk_100639350;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)channelEndpointWasTerminatedRemotely:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100009F6C;
  v7[3] = &unk_1006392B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A2E4;
  v7[3] = &unk_1006392B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_enumerateOperations:(id)a3
{
  id v4 = (void (**)(id, void *, _BYTE *))a3;
  -[PDSharingStatefulProvisioningManager _recalculateOperations](self, "_recalculateOperations");
  id v5 = (char *)-[NSMutableArray count](self->_operations, "count");
  if (v5)
  {
    id v6 = v5;
    for (unint64_t i = 0LL; i < (unint64_t)v6; ++i)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_operations, "objectAtIndexedSubscript:", i));
      id v9 = objc_autoreleasePoolPush();
      v4[2](v4, v8, &v10);
      objc_autoreleasePoolPop(v9);
      if (v10)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_operations, "removeObjectAtIndex:", i--);
        --v6;
      }
    }
  }
}

- (void)_recalculateOperations
{
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray pk_objectsPassingTest:](self->_operations, "pk_objectsPassingTest:", &stru_1006393E0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pk_arrayByApplyingBlock:", &stru_100639420));
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v24 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingStatefulProvisioningManager pendingShares](self, "pendingShares"));
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (unint64_t i = 0LL; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 credentialShares]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 channelTransportIdentifier]);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          unsigned __int8 v15 = [v3 containsObject:v14];

          if ((v15 & 1) == 0)
          {
            int v16 = objc_alloc_init(&OBJC_CLASS___PDSharingStatefulProvisioningOperation);
            unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
            -[PDSharingStatefulProvisioningOperation setShareIdentifier:](v16, "setShareIdentifier:", v17);

            -[PDSharingStatefulProvisioningOperation setTransportIdentifier:](v16, "setTransportIdentifier:", v13);
            -[PDSharingStatefulProvisioningOperation setCompletion:](v16, "setCompletion:", &stru_100639460);
            -[PDSharingStatefulProvisioningOperation setIsWaitingOnUserAction:]( v16,  "setIsWaitingOnUserAction:",  [v10 status] == (id)5);
            __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 activationOptions]);
            -[PDSharingStatefulProvisioningOperation setRequiresSenderActivationVerification:]( v16,  "setRequiresSenderActivationVerification:",  v18 != 0LL);

            v19 = (void *)objc_claimAutoreleasedReturnValue([v10 activationOptions]);
            objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v19 activationCode]);

            -[PDSharingStatefulProvisioningOperation setIsForegroundOperation:]( v16,  "setIsForegroundOperation:",  v20 == 0LL);
            -[NSMutableArray addObject:](v4, "addObject:", v16);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v7);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v25 arrayByAddingObjectsFromArray:v4]);
  v22 = (NSMutableArray *)[v21 mutableCopy];
  operations = v24->_operations;
  v24->_operations = v22;
}

- (BOOL)_isPassProvisioningComplete:(id)a3
{
  id v3 = a3;
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end