@interface AKPeerIDSAnisetteService
+ (id)sharedService;
- (AKPeerIDSAnisetteService)init;
- (id)_activePairedTinkerDevice;
- (void)_handleIncomingCommandMessage:(id)a3 completion:(id)a4;
- (void)_mhq_handleIncomingReplyMessage:(id)a3;
- (void)_performRemoteCommand:(unint64_t)a3 argument:(id)a4 completion:(id)a5;
- (void)_replyToCommandMessageWithInternalID:(id)a3 didSucceed:(BOOL)a4 returnData:(id)a5 error:(id)a6 completion:(id)a7;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)startListeningForMessagesFromPairedDevice;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation AKPeerIDSAnisetteService

+ (id)sharedService
{
  return 0LL;
}

- (AKPeerIDSAnisetteService)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AKPeerIDSAnisetteService;
  v2 = -[AKPeerIDSAnisetteService init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ak.idsq", v4);
    messageHandlingQueue = v2->_messageHandlingQueue;
    v2->_messageHandlingQueue = (OS_dispatch_queue *)v5;

    v7 = (IDSService *)[objc_alloc((Class)sub_10003244C()) initWithService:@"com.apple.private.alloy.anisette"];
    messageSendingService = v2->_messageSendingService;
    v2->_messageSendingService = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    completionsByInternalMessageID = v2->_completionsByInternalMessageID;
    v2->_completionsByInternalMessageID = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    internalMessageIDsByTransportID = v2->_internalMessageIDsByTransportID;
    v2->_internalMessageIDsByTransportID = v11;

    -[IDSService addDelegate:queue:](v2->_messageSendingService, "addDelegate:queue:", v2, v2->_messageHandlingQueue);
  }

  return v2;
}

- (void)startListeningForMessagesFromPairedDevice
{
  uint64_t v2 = _AKLogSystem(self);
  dispatch_queue_attr_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Listening for messages from paired device...",  v4,  2u);
  }
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = _AKTrafficLogSubsystem(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10013125C();
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100033344;
  v11[3] = &unk_1001C7AE8;
  id v12 = v6;
  id v10 = v6;
  -[AKPeerIDSAnisetteService _performRemoteCommand:argument:completion:]( self,  "_performRemoteCommand:argument:completion:",  1LL,  v9,  v11);
}

- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v15 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v15));
  id v8 = v15;
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = _AKLogSystem(v8);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100131354();
    }
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100033568;
  v13[3] = &unk_1001C7AE8;
  id v14 = v6;
  id v12 = v6;
  -[AKPeerIDSAnisetteService _performRemoteCommand:argument:completion:]( self,  "_performRemoteCommand:argument:completion:",  6LL,  v7,  v13);
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _AKLogSystem(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1001314D4();
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100033834;
  v11[3] = &unk_1001C7AE8;
  id v12 = v6;
  id v10 = v6;
  -[AKPeerIDSAnisetteService _performRemoteCommand:argument:completion:]( self,  "_performRemoteCommand:argument:completion:",  4LL,  v7,  v11);
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100131548();
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000338F8;
  v8[3] = &unk_1001C7AE8;
  id v9 = v4;
  id v7 = v4;
  -[AKPeerIDSAnisetteService _performRemoteCommand:argument:completion:]( self,  "_performRemoteCommand:argument:completion:",  5LL,  0LL,  v8);
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1001315BC();
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000339BC;
  v8[3] = &unk_1001C7AE8;
  id v9 = v4;
  id v7 = v4;
  -[AKPeerIDSAnisetteService _performRemoteCommand:argument:completion:]( self,  "_performRemoteCommand:argument:completion:",  3LL,  0LL,  v8);
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100131630();
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100033A90;
  v11[3] = &unk_1001C7AE8;
  id v12 = v6;
  id v10 = v6;
  -[AKPeerIDSAnisetteService _performRemoteCommand:argument:completion:]( self,  "_performRemoteCommand:argument:completion:",  2LL,  v7,  v11);
}

- (void)_performRemoteCommand:(unint64_t)a3 argument:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = _AKLogSystem(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1001316A4(a3, v11);
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___AKCommandMessage);
  -[AKCommandMessage setCommand:](v12, "setCommand:", a3);
  -[AKCommandMessage setArgument:](v12, "setArgument:", v9);

  id v13 = sub_10003289C();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v29[0] = v14;
  v30[0] = &__kCFBooleanTrue;
  id v15 = sub_100032948();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v29[1] = v16;
  v30[1] = &__kCFBooleanFalse;
  id v17 = sub_1000329F4();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v29[2] = v18;
  v30[2] = &off_1001D8CF8;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));

  messageHandlingQueue = (dispatch_queue_s *)self->_messageHandlingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033D24;
  block[3] = &unk_1001C6E88;
  v25 = v12;
  v26 = self;
  id v27 = v19;
  id v28 = v8;
  id v21 = v8;
  id v22 = v19;
  v23 = v12;
  dispatch_async(messageHandlingQueue, block);
}

- (id)_activePairedTinkerDevice
{
  return 0LL;
}

- (void)_replyToCommandMessageWithInternalID:(id)a3 didSucceed:(BOOL)a4 returnData:(id)a5 error:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  uint64_t v16 = _AKLogSystem(v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100131798();
  }

  v18 = objc_alloc_init(&OBJC_CLASS___AKReplyMessage);
  -[AKReplyMessage setReplyToID:](v18, "setReplyToID:", v12);
  -[AKReplyMessage setDidSucceed:](v18, "setDidSucceed:", v10);
  -[AKReplyMessage setReturnData:](v18, "setReturnData:", v15);

  -[AKReplyMessage setError:](v18, "setError:", v14);
  id v19 = sub_10003289C();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v35[0] = v20;
  v36[0] = &__kCFBooleanTrue;
  id v21 = sub_100032948();
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v35[1] = v22;
  v36[1] = &__kCFBooleanFalse;
  id v23 = sub_1000329F4();
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v35[2] = v24;
  v36[2] = &off_1001D8CF8;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  3LL));

  messageHandlingQueue = (dispatch_queue_s *)self->_messageHandlingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000342CC;
  block[3] = &unk_1001C6E88;
  v31 = v18;
  v32 = self;
  id v33 = v25;
  id v34 = v13;
  id v27 = v13;
  id v28 = v25;
  v29 = v18;
  dispatch_async(messageHandlingQueue, block);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = _AKLogSystem(v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v14)
  {
    if (a6)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Success sending message with Transport ID %@!",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100131884();
      }

      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_internalMessageIDsByTransportID,  "objectForKeyedSubscript:",  v14));
      if (v18)
      {
        id v19 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_completionsByInternalMessageID,  "objectForKeyedSubscript:",  v18));
        -[NSMutableDictionary removeObjectForKey:](self->_completionsByInternalMessageID, "removeObjectForKey:", v18);
        -[NSMutableDictionary removeObjectForKey:](self->_internalMessageIDsByTransportID, "removeObjectForKey:", v14);
        if (v19)
        {
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
          id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_1000346B0;
          v23[3] = &unk_1001C7258;
          id v19 = v19;
          id v25 = v19;
          id v24 = v15;
          dispatch_async(v21, v23);
        }
      }

      else
      {
        uint64_t v22 = _AKLogSystem(0LL);
        id v19 = (id)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "No internal message ID exists for transport ID %@, so we're ignoring the send failure.",  buf,  0xCu);
        }
      }
    }
  }

  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    sub_100131858();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a5;
  if ((id)+[_AKMessage typeForMessageWithTransportRepresentation:]( &OBJC_CLASS____AKMessage,  "typeForMessageWithTransportRepresentation:",  v8) == (id)1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_AKMessage messageFromTransportRepresentation:]( &OBJC_CLASS___AKReplyMessage,  "messageFromTransportRepresentation:",  v8));

    uint64_t v11 = _AKLogSystem(v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    id v13 = "Received reply message from paired device: %@";
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_AKMessage messageFromTransportRepresentation:]( &OBJC_CLASS___AKCommandMessage,  "messageFromTransportRepresentation:",  v8));

    uint64_t v15 = _AKLogSystem(v14);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    id v13 = "Received command message from paired device: %@";
  }

  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
LABEL_7:

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  if (v16)
  {
    id v17 = (id)os_transaction_create("com.apple.authkit.peer-as.txn");
    if ([v9 type] == (id)1)
    {
      -[AKPeerIDSAnisetteService _mhq_handleIncomingReplyMessage:](self, "_mhq_handleIncomingReplyMessage:", v9);
    }

    else
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000348E0;
      v19[3] = &unk_1001C7B10;
      v19[4] = self;
      id v20 = v16;
      id v17 = v17;
      id v21 = v17;
      -[AKPeerIDSAnisetteService _handleIncomingCommandMessage:completion:]( self,  "_handleIncomingCommandMessage:completion:",  v9,  v19);
    }
  }

  else
  {
    uint64_t v18 = _AKLogSystem(0LL);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_100131900();
    }
  }
}

- (void)_handleIncomingCommandMessage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 command];
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
    *(_DWORD *)buf = 138412290;
    v52 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Handling command from paired device: %@",  buf,  0xCu);
  }

  if (v7)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 argument]);
    id v13 = objc_alloc_init(&OBJC_CLASS___AKNativeAnisetteService);
    uint64_t v15 = v13;
    switch((unint64_t)v7)
    {
      case 1uLL:
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v14);
        if ((objc_opt_isKindOfClass(v12, v16) & 1) == 0) {
          goto LABEL_18;
        }
        id v17 = [v12 BOOLValue];
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472LL;
        v49[2] = sub_100034EC0;
        v49[3] = &unk_1001C7B38;
        id v50 = v6;
        -[AKNativeAnisetteService fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]( v15,  "fetchAnisetteDataAndProvisionIfNecessary:withCompletion:",  v17,  v49);
        id v18 = v50;
        break;
      case 2uLL:
        uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString, v14);
        if ((objc_opt_isKindOfClass(v12, v25) & 1) == 0) {
          goto LABEL_18;
        }
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_100034F80;
        v41[3] = &unk_1001C7B38;
        id v42 = v6;
        -[AKNativeAnisetteService legacyAnisetteDataForDSID:withCompletion:]( v15,  "legacyAnisetteDataForDSID:withCompletion:",  v12,  v41);
        id v18 = v42;
        break;
      case 3uLL:
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_100034F44;
        v47[3] = &unk_1001C6990;
        id v48 = v6;
        -[AKNativeAnisetteService provisionAnisetteWithCompletion:](v15, "provisionAnisetteWithCompletion:", v47);
        id v18 = v48;
        break;
      case 4uLL:
        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSData, v14);
        if ((objc_opt_isKindOfClass(v12, v26) & 1) == 0)
        {
LABEL_18:
          uint64_t v23 = AKAnisetteErrorDomain;
          uint64_t v24 = -8016LL;
          goto LABEL_19;
        }

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_100034F58;
        v45[3] = &unk_1001C6990;
        id v46 = v6;
        -[AKNativeAnisetteService syncAnisetteWithSIMData:completion:]( v15,  "syncAnisetteWithSIMData:completion:",  v12,  v45);
        id v18 = v46;
        break;
      case 5uLL:
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_100034F6C;
        v43[3] = &unk_1001C6990;
        id v44 = v6;
        -[AKNativeAnisetteService eraseAnisetteWithCompletion:](v15, "eraseAnisetteWithCompletion:", v43);
        id v18 = v44;
        break;
      case 6uLL:
        id v18 = v12;
        uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSURLRequest, v27);
        v30 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v28,  objc_opt_class(&OBJC_CLASS___NSMutableURLRequest, v29),  0LL);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        id v40 = 0LL;
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v31,  v18,  &v40));
        id v33 = v40;

        if (v33 || !v18)
        {
          uint64_t v35 = _AKLogSystem(v34);
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_1001319EC();
          }
        }

        id v37 = objc_alloc_init(&OBJC_CLASS___AKAppleIDSigningController);
        [v37 setIsProxy:1];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_100035004;
        v38[3] = &unk_1001C7B60;
        id v39 = v6;
        [v37 signingHeadersForRequest:v32 completion:v38];

        break;
      default:
        uint64_t v21 = _AKLogSystem(v13);
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100131958((uint64_t)v7, v22);
        }

        uint64_t v23 = AKAnisetteErrorDomain;
        uint64_t v24 = -8015LL;
LABEL_19:
        id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  v24,  0LL));
        (*((void (**)(id, void, void, id))v6 + 2))(v6, 0LL, 0LL, v18);
        break;
    }
  }

  else
  {
    uint64_t v19 = _AKLogSystem(v11);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10013192C();
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8016LL,  0LL));
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v12);
  }
}

- (void)_mhq_handleIncomingReplyMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100131B38();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 replyToID]);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_completionsByInternalMessageID,  "objectForKeyedSubscript:",  v7));
    if (v8)
    {
      uint64_t v22 = v4;
      -[NSMutableDictionary removeObjectForKey:](self->_completionsByInternalMessageID, "removeObjectForKey:", v7);
      id v9 = -[NSMutableDictionary copy](self->_internalMessageIDsByTransportID, "copy");
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v28;
        while (2)
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v15]);
            unsigned int v17 = [v16 isEqual:v7];

            if (v17)
            {
              -[NSMutableDictionary removeObjectForKey:]( self->_internalMessageIDsByTransportID,  "removeObjectForKey:",  v15);
              goto LABEL_17;
            }
          }

          id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6 = (void (**)(void))a5;
  uint64_t v7 = _AKLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100131C14();
  }

  completionsByInternalMessageID = self->_completionsByInternalMessageID;
  if (completionsByInternalMessageID)
  {
    id v25 = self;
    id v26 = v6;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](completionsByInternalMessageID, "allValues"));
    uint64_t v11 = _AKLogSystem(v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 count]));
      *(_DWORD *)buf = 138412290;
      v36 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Paired device changed while %@ remote commands were pending.",  buf,  0xCu);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8018LL,  0LL));
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        uint64_t v19 = 0LL;
        do
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v19);
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
          uint64_t v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000356D0;
          block[3] = &unk_1001C7258;
          uint64_t v29 = v20;
          id v28 = v14;
          dispatch_async(v22, block);

          uint64_t v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v17);
    }

    -[NSMutableDictionary removeAllObjects](v25->_completionsByInternalMessageID, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](v25->_internalMessageIDsByTransportID, "removeAllObjects");

    id v6 = v26;
  }

  uint64_t v23 = _AKLogSystem(completionsByInternalMessageID);
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Acknowledged!", buf, 2u);
  }

  v6[2](v6);
}

- (void).cxx_destruct
{
}

@end