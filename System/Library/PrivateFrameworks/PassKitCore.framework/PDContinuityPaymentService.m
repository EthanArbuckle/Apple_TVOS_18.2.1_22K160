@interface PDContinuityPaymentService
- (PDContinuityPaymentService)initWithConnection:(id)a3;
- (PDContinuityPaymentService)initWithConnection:(id)a3 server:(id)a4;
- (PKIDSManager)idsManager;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)canMakePaymentsWithRemoteDevicesWithHandler:(id)a3;
- (void)cancelRemotePaymentRequest:(id)a3 handler:(id)a4;
- (void)clearConnectionReference;
- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3;
- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)fetchRemoteDevicesWithHandler:(id)a3;
- (void)hasRemoteDevicesWithHandler:(id)a3;
- (void)managerDevicesDidChange:(id)a3;
- (void)presentContinuityPaymentInterfaceWithRequestIdentifier:(id)a3 handler:(id)a4;
- (void)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 handler:(id)a6;
- (void)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendPaymentSetupRequest:(id)a3 appDisplayName:(id)a4 handler:(id)a5;
- (void)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendRemotePaymentRequest:(id)a3 handler:(id)a4;
- (void)setIdsManager:(id)a3;
- (void)updatePaymentDevicesWithHandler:(id)a3;
@end

@implementation PDContinuityPaymentService

- (PDContinuityPaymentService)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDContinuityPaymentService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDContinuityPaymentService;
  v8 = -[PDContinuityPaymentService initWithConnection:](&v23, "initWithConnection:", v6);
  if (v8)
  {
    v9 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v6);
    whitelist = v8->_whitelist;
    v8->_whitelist = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    requests = v8->_requests;
    v8->_requests = v11;

    uint64_t v13 = sub_10002A820((uint64_t)v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = sub_100016B80((uint64_t)v14);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    remoteInterfacePresenter = v8->_remoteInterfacePresenter;
    v8->_remoteInterfacePresenter = (PDRemoteInterfacePresenter *)v16;

    uint64_t v18 = PKContinuityPaymentServiceInterface();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v6 setRemoteObjectInterface:v19];

    uint64_t v20 = PDContinuityPaymentServiceInterface();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    [v6 setExportedInterface:v21];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDContinuityPaymentService;
  id v2 = -[PDContinuityPaymentService remoteObjectProxy](&v4, "remoteObjectProxy");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDContinuityPaymentService;
  id v3 = -[PDContinuityPaymentService remoteObjectProxyWithErrorHandler:](&v5, "remoteObjectProxyWithErrorHandler:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)clearConnectionReference
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = self->_requests;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v7);
        uint64_t Object = PKLogFacilityTypeGetObject(8LL);
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Connection cleared, cancelling outstanding remote payment requests",  buf,  2u);
        }

        id v11 =  -[PKIDSManager cancelRemotePaymentRequest:completion:]( self->_idsManager,  "cancelRemotePaymentRequest:completion:",  v8,  0LL);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDContinuityPaymentService;
  -[PDContinuityPaymentService clearConnectionReference](&v12, "clearConnectionReference");
}

- (void)setIdsManager:(id)a3
{
  id v5 = (PKIDSManager *)a3;
  p_idsManager = &self->_idsManager;
  idsManager = self->_idsManager;
  uint64_t v8 = v5;
  if (idsManager != v5)
  {
    if (idsManager) {
      -[PKIDSManager removeDelegate:](idsManager, "removeDelegate:", self);
    }
    objc_storeStrong((id *)&self->_idsManager, a3);
    if (*p_idsManager) {
      -[PKIDSManager addDelegate:](*p_idsManager, "addDelegate:", self);
    }
  }
}

- (void)updatePaymentDevicesWithHandler:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  if (!-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    || (idsManager = self->_idsManager) == 0LL)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v7) {
      v7[2](v7, v6);
    }

    goto LABEL_8;
  }

  -[PKIDSManager discoverRemoteDevicesWithProximity:](idsManager, "discoverRemoteDevicesWithProximity:", 1LL);
  id v5 = v7;
  if (v7)
  {
    v7[2](v7, 0LL);
LABEL_8:
    id v5 = v7;
  }
}

- (void)sendPaymentSetupRequest:(id)a3 appDisplayName:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && (idsManager = self->_idsManager) != 0LL)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10031C01C;
    v14[3] = &unk_1006424D0;
    id v15 = v10;
    id v12 =  -[PKIDSManager sendSetupRequest:appDisplayName:completion:]( idsManager,  "sendSetupRequest:appDisplayName:completion:",  v8,  v9,  v14);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendRemotePaymentRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && self->_idsManager)
  {
    -[NSMutableSet addObject:](self->_requests, "addObject:", v6);
    idsManager = self->_idsManager;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10031C14C;
    v11[3] = &unk_1006424D0;
    id v12 = v7;
    id v9 =  -[PKIDSManager sendRemotePaymentRequest:completion:]( idsManager,  "sendRemotePaymentRequest:completion:",  v6,  v11);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
  }
}

- (void)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && (idsManager = self->_idsManager) != 0LL)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10031C278;
    v14[3] = &unk_1006424D0;
    id v15 = v10;
    id v12 =  -[PKIDSManager sendPayment:forRemotePaymentRequest:completion:]( idsManager,  "sendPayment:forRemotePaymentRequest:completion:",  v8,  v9,  v14);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && (idsManager = self->_idsManager) != 0LL)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10031C3A4;
    v14[3] = &unk_1006424D0;
    id v15 = v10;
    id v12 =  -[PKIDSManager sendPaymentHostUpdate:forRemotePaymentRequest:completion:]( idsManager,  "sendPaymentHostUpdate:forRemotePaymentRequest:completion:",  v8,  v9,  v14);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && (idsManager = self->_idsManager) != 0LL)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10031C4D0;
    v14[3] = &unk_1006424D0;
    id v15 = v10;
    id v12 =  -[PKIDSManager sendPaymentClientUpdate:forRemotePaymentRequest:completion:]( idsManager,  "sendPaymentClientUpdate:forRemotePaymentRequest:completion:",  v8,  v9,  v14);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && (idsManager = self->_idsManager) != 0LL)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10031C5FC;
    v14[3] = &unk_1006424D0;
    id v15 = v10;
    id v12 =  -[PKIDSManager sendPaymentResult:forRemotePaymentRequest:completion:]( idsManager,  "sendPaymentResult:forRemotePaymentRequest:completion:",  v8,  v9,  v14);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(&OBJC_CLASS___PKPaymentAuthorizationResult);
  -[PKPaymentAuthorizationResult setStatus:](v10, "setStatus:", a3);
  -[PDContinuityPaymentService sendPaymentResult:forRemotePaymentRequest:handler:]( self,  "sendPaymentResult:forRemotePaymentRequest:handler:",  v10,  v9,  v8);
}

- (void)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 handler:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && (idsManager = self->_idsManager) != 0LL)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10031C7CC;
    v17[3] = &unk_100641F00;
    id v18 = v13;
    id v15 =  -[PKIDSManager requestInstrumentThumbnail:forRemoteDevice:size:completion:]( idsManager,  "requestInstrumentThumbnail:forRemoteDevice:size:completion:",  v11,  v12,  v17,  width,  height);
  }

  else
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v13) {
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v16);
    }
  }
}

- (void)presentContinuityPaymentInterfaceWithRequestIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && (idsManager = self->_idsManager) != 0LL)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKIDSManager requestForIdentifier:](idsManager, "requestForIdentifier:", v6));
    if (v9)
    {
      remoteInterfacePresenter = self->_remoteInterfacePresenter;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10031C940;
      v12[3] = &unk_10063B3A0;
      id v13 = v7;
      sub_1001ADAC0((uint64_t)remoteInterfacePresenter, (uint64_t)v9, (uint64_t)v12);
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  1LL,  0LL));
      if (v7) {
        (*((void (**)(id, void *))v7 + 2))(v7, v11);
      }
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v9);
    }
  }
}

- (void)cancelRemotePaymentRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
    && self->_idsManager)
  {
    -[NSMutableSet removeObject:](self->_requests, "removeObject:", v6);
    idsManager = self->_idsManager;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10031CAF4;
    v11[3] = &unk_1006424D0;
    id v12 = v7;
    id v9 =  -[PKIDSManager cancelRemotePaymentRequest:completion:]( idsManager,  "cancelRemotePaymentRequest:completion:",  v6,  v11);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
  }
}

- (void)hasRemoteDevicesWithHandler:(id)a3
{
  id v7 = (void (**)(id, void, void *))a3;
  if ((-[PKEntitlementWhitelist inAppPayments](self->_whitelist, "inAppPayments") & 1) == 0
    && !-[PKEntitlementWhitelist supportsWebPayments](self->_whitelist, "supportsWebPayments")
    || (idsManager = self->_idsManager) == 0LL)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (v7) {
      v7[2](v7, 0LL, v6);
    }

    goto LABEL_9;
  }

  id v5 = v7;
  if (v7)
  {
    ((void (**)(id, id, void *))v7)[2]( v7,  -[PKIDSManager hasRemoteDevices](idsManager, "hasRemoteDevices"),  0LL);
LABEL_9:
    id v5 = v7;
  }
}

- (void)canMakePaymentsWithRemoteDevicesWithHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (((-[PKEntitlementWhitelist inAppPayments](self->_whitelist, "inAppPayments") & 1) != 0
     || -[PKEntitlementWhitelist supportsWebPayments](self->_whitelist, "supportsWebPayments"))
    && (idsManager = self->_idsManager) != 0LL)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKIDSManager remoteDevices](idsManager, "remoteDevices", 0LL));
    uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) canMakePayments])
          {
            uint64_t v7 = 1LL;
            goto LABEL_17;
          }
        }

        uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (void)fetchRemoteDevicesWithHandler:(id)a3
{
  uint64_t v8 = (void (**)(void))a3;
  if ((-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess") & 1) == 0
    && !-[PKEntitlementWhitelist inAppPaymentsPrivate](self->_whitelist, "inAppPaymentsPrivate")
    || (idsManager = self->_idsManager) == 0LL)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  0LL));
    if (!v8)
    {
LABEL_9:

      id v5 = v8;
      goto LABEL_10;
    }

    uint64_t v7 = v8[2];
LABEL_8:
    v7();
    goto LABEL_9;
  }

  id v5 = v8;
  if (v8)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKIDSManager remoteDevices](idsManager, "remoteDevices"));
    uint64_t v7 = v8[2];
    goto LABEL_8;
  }

- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDContinuityPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
  [v8 didReceivePayment:v7 forRemotePaymentRequest:v6];
}

- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDContinuityPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
  [v8 didReceivePaymentResult:v7 forRemotePaymentRequest:v6];
}

- (void)didReceivePaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDContinuityPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
  [v8 didReceivePaymentHostUpdate:v7 forRemotePaymentRequest:v6];
}

- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[PDContinuityPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
  [v8 didReceivePaymentClientUpdate:v7 forRemotePaymentRequest:v6];
}

- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDContinuityPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
  [v5 didReceiveCancellationForRemotePaymentRequest:v4];
}

- (void)managerDevicesDidChange:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PDContinuityPaymentService remoteObjectProxy](self, "remoteObjectProxy"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteDevices]);

  [v6 didReceiveUpdatedPaymentDevices:v5];
}

- (PKIDSManager)idsManager
{
  return self->_idsManager;
}

- (void).cxx_destruct
{
}

@end