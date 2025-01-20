@interface PDAuxiliaryCapabilityManager
- (PDAuxiliaryCapabilityManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 secureElement:(id)a5 pushNotificationManager:(id)a6 iSO18013Manager:(id)a7 barcodeCertManager:(id)a8 subcredentialManager:(id)a9;
- (id)pushNotificationTopics;
- (void)addDelegate:(id)a3;
- (void)checkAllAuxiliaryRegistrationRequirements;
- (void)didFailToDecryptRemoteAssets:(id)a3 forPass:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)passAddedOrUpdated:(id)a3 oldPass:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)registerAuxiliaryCapabilitiesForPass:(id)a3 force:(BOOL)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5;
- (void)registerLocalAuxiliaryCapabilities:(id)a3 withPass:(id)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
@end

@implementation PDAuxiliaryCapabilityManager

- (PDAuxiliaryCapabilityManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 secureElement:(id)a5 pushNotificationManager:(id)a6 iSO18013Manager:(id)a7 barcodeCertManager:(id)a8 subcredentialManager:(id)a9
{
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v16 = a8;
  id v17 = a9;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___PDAuxiliaryCapabilityManager;
  v18 = -[PDAuxiliaryCapabilityManager init](&v34, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_webServiceCoordinator, a4);
    objc_storeStrong((id *)&v19->_secureElement, a5);
    objc_storeStrong((id *)&v19->_pushNotificationManager, a6);
    -[PDPushNotificationManager registerConsumer:](v19->_pushNotificationManager, "registerConsumer:", v19);
    objc_storeStrong((id *)&v19->_iso1813Manager, a7);
    objc_storeStrong((id *)&v19->_barcodeCertManager, a8);
    objc_storeStrong((id *)&v19->_subcredentialManager, a9);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passd.auxiliarycapabilitymangager", 0LL);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    delegates = v19->_delegates;
    v19->_delegates = (NSHashTable *)v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    registerCompletionHandlersForPass = v19->_registerCompletionHandlersForPass;
    v19->_registerCompletionHandlersForPass = v24;

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v27 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    PDScheduledActivityClientRegister(@"PDAuxiliaryCapabilityManager", v19, v27);

    sub_1003993CC((uint64_t)v19);
  }

  return v19;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003995DC;
  v7[3] = &unk_1006392B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100399664;
  v7[3] = &unk_1006392B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)passAddedOrUpdated:(id)a3 oldPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003998A8;
  block[3] = &unk_100639350;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)didFailToDecryptRemoteAssets:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 count];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
    *(_DWORD *)buf = 134218242;
    id v22 = v10;
    __int16 v23 = 2112;
    v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Evaluating %lu undecryptable assets on %@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 auxiliaryRegistrationRequirements]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceDecryptionRequirements]);

  if ([v13 count])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pk_indexDictionaryByApplyingBlock:", &stru_100659CD8));
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10039A18C;
    v16[3] = &unk_10063B060;
    id v17 = v6;
    id v18 = v14;
    v19 = self;
    id v20 = v7;
    id v9 = v14;
    dispatch_async((dispatch_queue_t)queue, v16);
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No available device decryption requirements, nothing to be done",  buf,  2u);
  }
}

- (void)checkAllAuxiliaryRegistrationRequirements
{
}

- (void)registerLocalAuxiliaryCapabilities:(id)a3 withPass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, id, void))a5;
  if (![v8 count])
  {
    id v11 = +[NSMapTable pk_createStrongPointerPersonalityToStrongObjects]( &OBJC_CLASS___NSMapTable,  "pk_createStrongPointerPersonalityToStrongObjects");
    id v12 = +[NSMapTable pk_createStrongPointerPersonalityToStrongObjects]( &OBJC_CLASS___NSMapTable,  "pk_createStrongPointerPersonalityToStrongObjects");
    v10[2](v10, v11, v12, 0LL);
  }

  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10039A930;
  v17[3] = &unk_10063B440;
  id v18 = v9;
  v19 = self;
  id v20 = v8;
  id v21 = v10;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_async((dispatch_queue_t)queue, v17);
}

- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v6 = a3;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10039BE74;
  v9[3] = &unk_1006392B0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, v9);
}

- (void)registerAuxiliaryCapabilitiesForPass:(id)a3 force:(BOOL)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10039C150;
  block[3] = &unk_10063DA48;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
}

- (id)pushNotificationTopics
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v3, "addObject:", @"com.apple.pay.auxiliary.registration.requirement.prod");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( self->_webServiceCoordinator,  "sharedWebServiceContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 regions]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003A0EAC;
  v9[3] = &unk_10065A380;
  id v10 = v3;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = -[NSMutableSet copy](v6, "copy");
  return v7;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDAuxiliaryCapabilityManager pushNotificationTopics](self, "pushNotificationTopics"));
  unsigned int v7 = [v6 containsObject:v5];

  if (v7) {
    sub_10039A464((uint64_t)self, 1);
  }
}

- (void).cxx_destruct
{
}

@end