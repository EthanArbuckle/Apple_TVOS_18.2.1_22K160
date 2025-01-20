@interface PBUserPresentationService
+ (BOOL)_isPaymentSheetRequest:(id)a3;
+ (void)_getViewServiceInfoForRequest:(id)a3 serviceName:(id *)a4 className:(id *)a5;
- (BOOL)isPaymentSheetOnlyService;
- (NSMutableDictionary)queueDialogContextByRequest;
- (NSMutableDictionary)queueDismissalCompletionByRequest;
- (NSMutableDictionary)queuePendingMessageRepliesByRequest;
- (NSMutableDictionary)queuePendingMessagesByRequest;
- (NSMutableDictionary)queueViewControllersByRequest;
- (OS_dispatch_queue)accessQueue;
- (PBSystemServiceConnection)remoteConnection;
- (PBUserPresentationService)init;
- (PBUserPresentationService)initWithRemoteConnection:(id)a3;
- (void)_callMessageReply:(id)a3 forRequest:(id)a4 success:(BOOL)a5 result:(id)a6 error:(id)a7;
- (void)_handleClientDismissalWithContext:(id)a3 dismissalContext:(id)a4;
- (void)_handleCreatedRemoteViewController:(id)a3 forRequest:(id)a4;
- (void)_queueCallHandlersForRequest:(id)a3 withReason:(unint64_t)a4 result:(id)a5 error:(id)a6;
- (void)_queueSendPendingMessagesForRequest:(id)a3;
- (void)dealloc;
- (void)dialogManager:(id)a3 didCancelDialogWithContext:(id)a4 dismissalContext:(id)a5;
- (void)dialogManager:(id)a3 willDismissDialogWithContext:(id)a4 dismissalContext:(id)a5;
- (void)dismissUIWithRequest:(id)a3;
- (void)invalidate;
- (void)messageUIWithRequest:(id)a3 message:(id)a4 reply:(id)a5;
- (void)presentUIWithRequest:(id)a3 completion:(id)a4;
- (void)setIsPaymentSheetOnlyService:(BOOL)a3;
@end

@implementation PBUserPresentationService

- (PBUserPresentationService)init
{
  return 0LL;
}

- (PBUserPresentationService)initWithRemoteConnection:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PBUserPresentationService;
  v5 = -[PBUserPresentationService init](&v28, "init");
  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteConnection]);
    v8 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"com.apple.PineBoard.UserPresentation-%d",  [v7 processIdentifier]);

    v9 = v8;
    v10 = -[NSString UTF8String](v9, "UTF8String");
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create(v10, v12);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v5->_remoteConnection, v4);
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queueDialogContextByRequest = v5->_queueDialogContextByRequest;
    v5->_queueDialogContextByRequest = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queueDismissalCompletionByRequest = v5->_queueDismissalCompletionByRequest;
    v5->_queueDismissalCompletionByRequest = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queueViewControllersByRequest = v5->_queueViewControllersByRequest;
    v5->_queueViewControllersByRequest = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queuePendingMessagesByRequest = v5->_queuePendingMessagesByRequest;
    v5->_queuePendingMessagesByRequest = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queuePendingMessageRepliesByRequest = v5->_queuePendingMessageRepliesByRequest;
    v5->_queuePendingMessageRepliesByRequest = v23;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001420CC;
    block[3] = &unk_1003CFF08;
    v27 = v5;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBUserPresentationService;
  -[PBUserPresentationService dealloc](&v4, "dealloc");
}

- (void)invalidate
{
  id v3 = sub_1000844A0();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "userPresentationService invalidated %@",  buf,  0xCu);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001422B4;
  block[3] = &unk_1003CFEB8;
  void block[4] = self;
  v7 = v5;
  v12 = v7;
  dispatch_sync(accessQueue, block);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001423EC;
  v9[3] = &unk_1003CFF08;
  v10 = v7;
  v8 = v7;
  BSDispatchMain(v9);
}

- (void)presentUIWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000844A0();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "presentUI (service) %@", (uint8_t *)&buf, 0xCu);
  }

  if (!self->_isPaymentSheetOnlyService
    || ([(id)objc_opt_class(self) _isPaymentSheetRequest:v6] & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___PBSUserPresentationRequest);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      id v60 = 0LL;
      id v61 = 0LL;
      [(id)objc_opt_class(self) _getViewServiceInfoForRequest:v6 serviceName:&v61 className:&v60];
      id v11 = v61;
      id v12 = v60;
    }

    else
    {
      id v11 = 0LL;
      id v12 = 0LL;
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v67 = 0x3032000000LL;
    v68 = sub_100142C04;
    v69 = sub_100142C14;
    id v70 = 0LL;
    v58[0] = 0LL;
    v58[1] = v58;
    v58[2] = 0x3032000000LL;
    v58[3] = sub_100142C04;
    v58[4] = sub_100142C14;
    id v59 = 0LL;
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
      && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v11, v14) & 1) != 0))
    {
      objc_initWeak(location, self);
      v15 = objc_alloc(&OBJC_CLASS____PBUserPresentationUIProvider);
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_100142C2C;
      v55[3] = &unk_1003D8F68;
      objc_copyWeak(&v57, location);
      id v16 = v6;
      id v56 = v16;
      v17 = -[_PBUserPresentationUIProvider initWithServiceName:className:viewServicePrepareHandler:]( v15,  "initWithServiceName:className:viewServicePrepareHandler:",  v11,  v12,  v55);
      v18 = objc_alloc(&OBJC_CLASS___PBDialogContext);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
      v21 = -[PBDialogContext initWithIdentifier:provider:](v18, "initWithIdentifier:provider:", v20, v17);

      accessQueue = (dispatch_queue_s *)self->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100142C7C;
      block[3] = &unk_1003D8FB8;
      void block[4] = self;
      id v50 = v16;
      v51 = v21;
      id v52 = v7;
      v53 = v58;
      p___int128 buf = &buf;
      v23 = v21;
      dispatch_sync(accessQueue, block);

      objc_destroyWeak(&v57);
      objc_destroyWeak(location);
    }

    else
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PineBoardServicesErrorDomain,  400LL,  0LL));
      v25 = *(void **)(*((void *)&buf + 1) + 40LL);
      *(void *)(*((void *)&buf + 1) + 40LL) = v24;
    }

    if (*(void *)(*((void *)&buf + 1) + 40LL))
    {
      id v26 = sub_1000844A0();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_super v28 = *(void **)(*((void *)&buf + 1) + 40LL);
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "presentUI (service) failed - presentation error: %@",  (uint8_t *)location,  0xCu);
      }

      if (v7)
      {
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
        v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_100142E80;
        v46[3] = &unk_1003D07B8;
        id v47 = v7;
        v48 = &buf;
        dispatch_async(v30, v46);
      }
    }

    else
    {
      objc_initWeak(location, self);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_100142EB0;
      v42[3] = &unk_1003D9008;
      id v43 = v6;
      v44 = v58;
      objc_copyWeak(&v45, location);
      BSDispatchMain(v42);
      objc_destroyWeak(&v45);

      objc_destroyWeak(location);
    }

    _Block_object_dispose(v58, 8);

    _Block_object_dispose(&buf, 8);
    goto LABEL_23;
  }

  NSErrorUserInfoKey v71 = NSDebugDescriptionErrorKey;
  v72 = @"This user presentation service only allows payment sheet requests.";
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PineBoardServicesErrorDomain,  400LL,  v31));

  id v32 = sub_1000844A0();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_100285FB8((uint64_t)v12, v33, v34, v35, v36, v37, v38, v39);
  }

  if (v7)
  {
    dispatch_queue_global_t v40 = dispatch_get_global_queue(21LL, 0LL);
    v41 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v40);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_100142BDC;
    v62[3] = &unk_1003D2560;
    id v64 = v7;
    id v12 = v12;
    id v63 = v12;
    dispatch_async(v41, v62);

    id v11 = v64;
LABEL_23:
  }
}

- (void)messageUIWithRequest:(id)a3 message:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000844A0();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "messageUI (service) %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100143364;
  block[3] = &unk_1003D9030;
  void block[4] = self;
  id v14 = v8;
  id v22 = v14;
  p___int128 buf = &buf;
  id v15 = v9;
  id v23 = v15;
  id v16 = v10;
  id v24 = v16;
  dispatch_sync(accessQueue, block);
  if (v16 && *(_BYTE *)(*((void *)&buf + 1) + 24LL))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10014342C;
    v19[3] = &unk_1003D0110;
    id v20 = v16;
    dispatch_async(v18, v19);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)dismissUIWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000844A0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "dismissUI (service) %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100142C04;
  id v26 = sub_100142C14;
  id v27 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100143678;
  block[3] = &unk_1003D0AD8;
  p___int128 buf = &buf;
  void block[4] = self;
  id v8 = v4;
  id v21 = v8;
  dispatch_sync(accessQueue, block);
  if (*(void *)(*((void *)&buf + 1) + 40LL))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1001436CC;
    v17[3] = &unk_1003D0210;
    v19 = &buf;
    v18 = (os_log_s *)v8;
    BSDispatchMain(v17);
    id v9 = v18;
  }

  else
  {
    id v10 = sub_1000844A0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100286020((uint64_t)v8, v9, v11, v12, v13, v14, v15, v16);
    }
  }

  _Block_object_dispose(&buf, 8);
}

- (void)dialogManager:(id)a3 willDismissDialogWithContext:(id)a4 dismissalContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = sub_1000844A0();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "presentUI (service) willDismissDialogWithContext called",  v11,  2u);
  }

  -[PBUserPresentationService _handleClientDismissalWithContext:dismissalContext:]( self,  "_handleClientDismissalWithContext:dismissalContext:",  v8,  v7);
}

- (void)dialogManager:(id)a3 didCancelDialogWithContext:(id)a4 dismissalContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = sub_1000844A0();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "presentUI (service) didCancelDialogWithContext called",  v11,  2u);
  }

  -[PBUserPresentationService _handleClientDismissalWithContext:dismissalContext:]( self,  "_handleClientDismissalWithContext:dismissalContext:",  v8,  v7);
}

+ (void)_getViewServiceInfoForRequest:(id)a3 serviceName:(id *)a4 className:(id *)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 options]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:PBSUPRDialogTypeKey]);
  if (![v8 isEqualToString:PBSUPRDialogTypeCustom])
  {
    unsigned int v11 = [v8 isEqualToString:PBSUPRDialogTypePaymentSheet];
    if (v11) {
      id v10 = @"com.apple.CompanionViewService";
    }
    else {
      id v10 = 0LL;
    }
    if (v11) {
      id v9 = @"CSVSPaymentSheetViewController";
    }
    else {
      id v9 = 0LL;
    }
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:PBSUPRDialogCustomViewControllerClassNameKey]);
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:PBSUPRDialogCustomViewServiceNameKey]);
  if (a5) {
LABEL_11:
  }
    *a5 = -[__CFString copy](v9, "copy");
LABEL_12:
  if (a4) {
    *a4 = -[__CFString copy](v10, "copy");
  }
}

+ (BOOL)_isPaymentSheetRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___PBSUserPresentationRequest);
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 options]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bs_safeStringForKey:", PBSUPRDialogTypeKey));

  LOBYTE(v9) = [v10 isEqualToString:PBSUPRDialogTypePaymentSheet];
  return (char)v9;
}

- (void)_handleCreatedRemoteViewController:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100143B48;
  v11[3] = &unk_1003D0378;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(accessQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_handleClientDismissalWithContext:(id)a3 dismissalContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);

  if (v8)
  {
    uint64_t v9 = 4LL;
  }

  else if ([v7 dismissedByClient])
  {
    uint64_t v9 = 2LL;
  }

  else
  {
    uint64_t v9 = 3LL;
  }

  objc_initWeak(&location, self);
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100143CC8;
  block[3] = &unk_1003D9058;
  objc_copyWeak(v16, &location);
  v16[1] = (id)v9;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)_callMessageReply:(id)a3 forRequest:(id)a4 success:(BOOL)a5 result:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100143FEC;
  uint64_t v34 = sub_100144014;
  id v35 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014402C;
  block[3] = &unk_1003D9080;
  void block[4] = self;
  id v17 = v13;
  id v27 = v17;
  id v18 = v12;
  id v28 = v18;
  v29 = &v30;
  dispatch_sync(accessQueue, block);
  if (v31[5])
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001440DC;
    v21[3] = &unk_1003D90A8;
    uint64_t v24 = &v30;
    BOOL v25 = a5;
    id v22 = v14;
    id v23 = v15;
    dispatch_async(v20, v21);
  }

  _Block_object_dispose(&v30, 8);
}

- (void)_queueSendPendingMessagesForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queueViewControllersByRequest, "objectForKey:", v4));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuePendingMessagesByRequest, "objectForKey:", v4));
    id v7 = [v6 copy];

    -[NSMutableDictionary removeObjectForKey:](self->_queuePendingMessagesByRequest, "removeObjectForKey:", v4);
    id v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_queuePendingMessageRepliesByRequest,  "objectForKey:",  v4));
    if (!v8)
    {
      id v8 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  0x10000LL,  1LL);
      -[NSMutableDictionary setObject:forKey:](self->_queuePendingMessageRepliesByRequest, "setObject:forKey:", v8, v4);
    }

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 reply]);

          if (v14)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 reply]);
            -[NSHashTable addObject:](v8, "addObject:", v15);
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v10);
    }

    objc_initWeak(location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1001443E8;
    v18[3] = &unk_1003D03C8;
    objc_copyWeak(&v22, location);
    id v16 = v9;
    id v19 = v16;
    id v20 = v5;
    id v21 = v4;
    BSDispatchMain(v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }

  else
  {
    id v17 = sub_1000844A0();
    id v16 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Leaving message in queue, no view controller for request %@",  (uint8_t *)location,  0xCu);
    }
  }
}

- (void)_queueCallHandlersForRequest:(id)a3 withReason:(unint64_t)a4 result:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_1000844A0();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v33 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Cleanup in _queueCallHandlersForRequest for %@",  buf,  0xCu);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuePendingMessageRepliesByRequest, "objectForKey:", v10));
  -[NSMutableDictionary removeObjectForKey:](self->_queuePendingMessageRepliesByRequest, "removeObjectForKey:", v10);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuePendingMessagesByRequest, "objectForKey:", v10));
  -[NSMutableDictionary removeObjectForKey:](self->_queuePendingMessagesByRequest, "removeObjectForKey:", v10);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queueDismissalCompletionByRequest, "objectForKey:", v10));
  -[NSMutableDictionary removeObjectForKey:](self->_queueDismissalCompletionByRequest, "removeObjectForKey:", v10);
  -[NSMutableDictionary removeObjectForKey:](self->_queueDialogContextByRequest, "removeObjectForKey:", v10);
  -[NSMutableDictionary removeObjectForKey:](self->_queueViewControllersByRequest, "removeObjectForKey:", v10);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1001448D4;
  v25[3] = &unk_1003D90F8;
  id v26 = v15;
  id v27 = v16;
  id v30 = v17;
  unint64_t v31 = a4;
  id v28 = v11;
  id v29 = v12;
  id v20 = v12;
  id v21 = v11;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  dispatch_async(v19, v25);
}

- (PBSystemServiceConnection)remoteConnection
{
  return (PBSystemServiceConnection *)objc_loadWeakRetained((id *)&self->_remoteConnection);
}

- (BOOL)isPaymentSheetOnlyService
{
  return self->_isPaymentSheetOnlyService;
}

- (void)setIsPaymentSheetOnlyService:(BOOL)a3
{
  self->_isPaymentSheetOnlyService = a3;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSMutableDictionary)queueDialogContextByRequest
{
  return self->_queueDialogContextByRequest;
}

- (NSMutableDictionary)queueDismissalCompletionByRequest
{
  return self->_queueDismissalCompletionByRequest;
}

- (NSMutableDictionary)queueViewControllersByRequest
{
  return self->_queueViewControllersByRequest;
}

- (NSMutableDictionary)queuePendingMessagesByRequest
{
  return self->_queuePendingMessagesByRequest;
}

- (NSMutableDictionary)queuePendingMessageRepliesByRequest
{
  return self->_queuePendingMessageRepliesByRequest;
}

- (void).cxx_destruct
{
}

@end