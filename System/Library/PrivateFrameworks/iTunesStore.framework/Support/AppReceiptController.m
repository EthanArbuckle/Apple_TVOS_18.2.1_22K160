@interface AppReceiptController
+ (BOOL)connectionHasEntitlement:(id)a3;
+ (id)sharedController;
+ (void)getApplicationReceiptPathWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)refreshAllReceipts:(id)a3 connection:(id)a4;
+ (void)refreshAppReceipt:(id)a3 connection:(id)a4;
- (AppReceiptController)init;
- (id)_operationQueue;
- (void)_addOperation:(id)a3;
- (void)_dispatchAsync:(id)a3;
- (void)dealloc;
@end

@implementation AppReceiptController

- (AppReceiptController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AppReceiptController;
  v2 = -[AppReceiptController init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.AppReceiptController", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_operationQueue)
  {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v3 removeKeepAliveOperationQueue:self->_operationQueue];

    -[ISOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppReceiptController;
  -[AppReceiptController dealloc](&v4, "dealloc");
}

+ (BOOL)connectionHasEntitlement:(id)a3
{
  id v4 = a3;
  char HasEntitlement = SSXPCConnectionHasEntitlement(v4, kSSITunesStorePrivateEntitlement);
  if ((HasEntitlement & 1) == 0)
  {
    objc_super v6 = (void *)SSXPCConnectionCopyClientIdentifier(v4, 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v14 = 138412546;
      id v15 = (id)objc_opt_class(a1);
      __int16 v16 = 2112;
      v17 = v6;
      id v11 = v15;
      v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  16LL,  "[%@]: Cannot register unentitled event monitor: %@",  &v14,  22);

      if (!v12)
      {
LABEL_14:

        goto LABEL_15;
      }

      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
      free(v12);
      SSFileLog(v7, @"%@");
    }

    goto LABEL_14;
  }

+ (void)getApplicationReceiptPathWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10012EB88;
  v11[3] = &unk_10034AD58;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"getApplicationReceiptPathWithMessage:connection:" forMessage:700];
  [v4 addObserver:a1 selector:"refreshAllReceipts:connection:" forMessage:117];
  [v4 addObserver:a1 selector:"refreshAppReceipt:connection:" forMessage:10011];
}

+ (void)refreshAllReceipts:(id)a3 connection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(id)objc_opt_class(a1) connectionHasEntitlement:v5];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v13 = 138412290;
      id v14 = (id)objc_opt_class(a1);
      id v11 = v14;
      id v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  2LL,  "[%@]:  Responding to XPC -- NOOP SSXPCMessageRefreshAllAppReceipts",  &v13,  12);

      if (!v12)
      {
LABEL_14:

        return;
      }

      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
      free(v12);
      SSFileLog(v7, @"%@");
    }

    goto LABEL_14;
  }

+ (void)refreshAppReceipt:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (xpc_dictionary_get_BOOL(v6, "3")) {
    uint64_t v8 = 8LL;
  }
  else {
    uint64_t v8 = 0LL;
  }
  if (xpc_dictionary_get_BOOL(v6, "2")) {
    uint64_t v9 = v8 | 2;
  }
  else {
    uint64_t v9 = v8;
  }
  BOOL v10 = xpc_dictionary_get_BOOL(v6, "1");
  if ((SSXPCConnectionHasEntitlement(v7, kSSITunesStorePrivateEntitlement) & 1) != 0
    || SSXPCConnectionHasEntitlement(v7, kSSStoreKitEntitlementClientOverride))
  {
    id v11 = objc_alloc((Class)sub_1001468B8());
    xpc_object_t value = xpc_dictionary_get_value(v6, "4");
    int v13 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v14 = [v11 initWithXPCEncoding:v13];

    if (v14)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 storeExternalVersion]);
      if (v15
        && (__int16 v16 = (void *)v15,
            v17 = (void *)objc_claimAutoreleasedReturnValue([v14 storeItemIdentifier]),
            v17,
            v16,
            v17))
      {
        uint64_t v18 = 0LL;
      }

      else
      {
        uint64_t v18 = v9 | v10 | 4;
      }

      v20 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient clientIdentifier](v20, "clientIdentifier"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[AppReceiptController sharedController](&OBJC_CLASS___AppReceiptController, "sharedController"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10012F2C0;
      v30[3] = &unk_10034F6A0;
      id v31 = v14;
      id v32 = v26;
      uint64_t v36 = v18;
      id v33 = v6;
      id v34 = v7;
      id v35 = v27;
      id v28 = v27;
      id v29 = v26;
      id v19 = v14;
      [v28 _dispatchAsync:v30];

      goto LABEL_28;
    }
  }

  id v19 = (id)SSXPCConnectionCopyClientIdentifier(v7, 0LL);
  if ([v19 length])
  {
    v20 = (XPCClient *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v20) {
      v20 = (XPCClient *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v21 = -[XPCClient shouldLog](v20, "shouldLog");
    else {
      LODWORD(v22) = v21;
    }
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[XPCClient OSLogObject](v20, "OSLogObject"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      int v37 = 138412546;
      id v38 = (id)objc_opt_class(a1);
      __int16 v39 = 2112;
      id v40 = v19;
      id v24 = v38;
      v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  2LL,  "[%@]: Responding to XPC -- NOOP SKXPCMessageRefreshReceipt [%@]",  &v37,  22);

      if (!v25)
      {
LABEL_28:

        goto LABEL_29;
      }

      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
      free(v25);
      SSFileLog(v20, @"%@");
    }

    goto LABEL_28;
  }

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012F450;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A34D8 != -1) {
    dispatch_once(&qword_1003A34D8, block);
  }
  return (id)qword_1003A34D0;
}

- (void)_addOperation:(id)a3
{
  id v4 = a3;
  objc_setAssociatedObject(v4, "com.apple.itunesstore.AppReceiptController.self", self, (void *)0x301);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AppReceiptController _operationQueue](self, "_operationQueue"));
  [v5 addOperation:v4];
}

- (void)_dispatchAsync:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v5 takeKeepAliveAssertion:@"com.apple.itunesstored.ReceiptRevocation"];

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012F588;
  block[3] = &unk_10034ACB8;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, block);
}

- (id)_operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    id v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[ISOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v6 addKeepAliveOperationQueue:self->_operationQueue];

    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void).cxx_destruct
{
}

@end