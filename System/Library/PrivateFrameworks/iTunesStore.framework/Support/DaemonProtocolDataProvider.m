@interface DaemonProtocolDataProvider
- (BOOL)processDictionary:(id)a3 error:(id *)a4;
- (id)willBeginProcessingDictionaryHandler;
- (void)_presentDialog:(id)a3;
- (void)dealloc;
- (void)setWillBeginProcessingDictionaryHandler:(id)a3;
@end

@implementation DaemonProtocolDataProvider

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DaemonProtocolDataProvider;
  -[DaemonProtocolDataProvider dealloc](&v3, "dealloc");
}

- (void)_presentDialog:(id)a3
{
  v4 = -[DaemonDialogOperation initWithDialog:](objc_alloc(&OBJC_CLASS___DaemonDialogOperation), "initWithDialog:", a3);
  -[DaemonDialogOperation setDisplaysOnLockscreen:]( v4,  "setDisplaysOnLockscreen:",  objc_msgSend( -[DaemonProtocolDataProvider authenticationContext](self, "authenticationContext"),  "displaysOnLockScreen"));
  objc_msgSend(+[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue"), "addOperation:", v4);
}

- (BOOL)processDictionary:(id)a3 error:(id *)a4
{
  id v7 = [self->_willBeginProcessingDictionaryHandler copy];
  if (v7)
  {
    v8 = v7;
    (*((void (**)(void))v7 + 2))();
  }

  v27 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___DaemonProtocolDataProvider;
  unsigned __int8 v26 = -[DaemonProtocolDataProvider processDictionary:error:](&v22, "processDictionary:error:", a3, &v27);
  uint64_t v9 = SSErrorSessionPropertyFailureType;
  id v10 = [a3 objectForKey:SSErrorSessionPropertyFailureType];
  if (v10)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___ErrorHandlerSession);
    -[ErrorHandlerSession setValue:forSessionProperty:](v11, "setValue:forSessionProperty:", v10, v9);
    uint64_t v12 = 0LL;
    v28[0] = SSErrorSessionPropertyCustomerMessage;
    v28[1] = SSErrorSessionPropertyCustomerMessageTitle;
    v28[2] = SSErrorSessionPropertyNextActionURL;
    v28[3] = SSErrorSessionPropertyFailureClientInfo;
    do
    {
      uint64_t v13 = v28[v12];
      id v14 = [a3 objectForKey:v13];
      if (v14) {
        -[ErrorHandlerSession setValue:forSessionProperty:](v11, "setValue:forSessionProperty:", v14, v13);
      }
      ++v12;
    }

    while (v12 != 4);
    v15 = dispatch_semaphore_create(0LL);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10015BE90;
    v21[3] = &unk_10034FD10;
    v21[5] = v15;
    v21[6] = &v23;
    v21[4] = self;
    objc_msgSend( +[ErrorHandlerManager errorHandlerManager](ErrorHandlerManager, "errorHandlerManager"),  "openSession:withCompletionBlock:",  v11,  v21);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v15);
  }

  id v16 = -[DaemonProtocolDataProvider authenticatedAccountDSID](self, "authenticatedAccountDSID");
  if (!v16)
  {
    id v16 = objc_msgSend( -[DaemonProtocolDataProvider authenticationContext](self, "authenticationContext"),  "requiredUniqueIdentifier");
    if (!v16) {
      id v16 = objc_msgSend( objc_msgSend( +[SSAccountStore defaultStore](SSAccountStore, "defaultStore"),  "activeAccount"),  "uniqueIdentifier");
    }
  }

  +[SSVSubscriptionStatusCoordinator updateWithResponseDictionary:accountIdentifier:]( &OBJC_CLASS___SSVSubscriptionStatusCoordinator,  "updateWithResponseDictionary:accountIdentifier:",  a3,  v16);
  v17 = v24;
  int v18 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = v27;
    int v18 = *((unsigned __int8 *)v17 + 24);
  }

  BOOL v19 = v18 != 0;
  _Block_object_dispose(&v23, 8);
  return v19;
}

- (id)willBeginProcessingDictionaryHandler
{
  return self->_willBeginProcessingDictionaryHandler;
}

- (void)setWillBeginProcessingDictionaryHandler:(id)a3
{
}

@end