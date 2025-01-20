@interface CSDPinExchangeController
- (BOOL)sendApprovalDisplayPinToDevice:(id)a3;
- (BOOL)sendIDSAction:(id)a3 toDevice:(id)a4;
- (BOOL)sendIDSAction:(id)a3 toDevices:(id)a4;
- (CSDPinExchangeController)initWithDelegate:(id)a3;
- (CSDPinExchangeDelegate)pinExchangeDelegate;
- (NSMutableDictionary)pendingCodesToDevicesForApproval;
- (NSString)outgoingPinRequestIdentifier;
- (id)allIDSTelephonyDevices;
- (id)idsDeviceFromUniqueID:(id)a3;
- (unint64_t)randomSixDigitCode;
- (void)cancelPinRequests;
- (void)displayErrorNotificationWithMessage:(id)a3;
- (void)displayMismatchedAccountsNotification;
- (void)displayPinErrorNotification;
- (void)displaySlotsFullNotification;
- (void)handlePINCodeEnteredSuccessfully:(BOOL)a3 canceled:(BOOL)a4 fromDevice:(id)a5 isPrimaryDevice:(BOOL)a6;
- (void)removeErrorNotifications;
- (void)requestPinFromDevice:(id)a3;
- (void)sendApprovalResponseToDevice:(id)a3 enteredCorrectly:(BOOL)a4 wasCancelled:(BOOL)a5;
- (void)sendPinCodeAndPromptForResponseToDevice:(id)a3 forSenderIdentityUUID:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setOutgoingPinRequestIdentifier:(id)a3;
- (void)setPendingCodesToDevicesForApproval:(id)a3;
- (void)setPinExchangeDelegate:(id)a3;
@end

@implementation CSDPinExchangeController

- (CSDPinExchangeController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSDPinExchangeController;
  v6 = -[CSDPinExchangeController init](&v12, "init");
  if (v6)
  {
    id v7 = sub_1001704C4();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting up Pin Exchange controller", v11, 2u);
    }

    objc_storeStrong((id *)&v6->_pinExchangeDelegate, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
    [v9 addServiceDelegate:v6 queue:&_dispatch_main_q];
  }

  return v6;
}

- (void)requestPinFromDevice:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting PIN from device %@", buf, 0xCu);
  }

  if ((+[TUCallCapabilities accountsSupportSecondaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "accountsSupportSecondaryCalling") & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController pinExchangeDelegate](self, "pinExchangeDelegate"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000BA128;
    v10[3] = &unk_1003D9598;
    v10[4] = self;
    id v11 = v4;
    [v7 displayServiceConfirmationWithCompletionHandler:v10];
  }

  else
  {
    id v8 = sub_1001704C4();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] accountsSupportSecondaryCalling=NO. Displaying mismatched accounts notification",  buf,  2u);
    }

    -[CSDPinExchangeController displayMismatchedAccountsNotification](self, "displayMismatchedAccountsNotification");
  }
}

- (void)cancelPinRequests
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Canceling all PIN requests", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController allIDSTelephonyDevices](self, "allIDSTelephonyDevices"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CSDPinExchangeController sendIDSAction:toDevice:]( self,  "sendIDSAction:toDevice:",  @"CSDPinExchangeActionCancelledSecondary",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v7);
  }
}

- (id)idsDeviceFromUniqueID:(id)a3
{
  id v3 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
        unsigned int v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)allIDSTelephonyDevices
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 devices]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v2;
}

- (void)sendPinCodeAndPromptForResponseToDevice:(id)a3 forSenderIdentityUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController idsDeviceFromUniqueID:](self, "idsDeviceFromUniqueID:", v8));

  if (v9)
  {
    if (-[CSDPinExchangeController sendApprovalDisplayPinToDevice:](self, "sendApprovalDisplayPinToDevice:", v9))
    {
      -[CSDPinExchangeController removeErrorNotifications](self, "removeErrorNotifications");
      objc_initWeak(location, self);
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController pinExchangeDelegate](self, "pinExchangeDelegate"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000BA734;
      v16[3] = &unk_1003D95C0;
      objc_copyWeak(&v19, location);
      id v17 = v9;
      id v18 = v7;
      [v10 displayPinMessageForDevice:v17 completionHandler:v16];

      objc_destroyWeak(&v19);
      objc_destroyWeak(location);
      goto LABEL_10;
    }
  }

  else
  {
    id v11 = sub_1001704C4();
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find device for unique ID %@",  (uint8_t *)location,  0xCu);
    }
  }

  id v14 = sub_1001704C4();
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1002B4D3C(v15);
  }

LABEL_10:
}

- (BOOL)sendApprovalDisplayPinToDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController pendingCodesToDevicesForApproval](self, "pendingCodesToDevicesForApproval"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (v7)
  {
    id v8 = sub_1001704C4();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
      int v21 = 138412290;
      id v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to send PIN code because we already have one pending for device with unique ID %@",  (uint8_t *)&v21,  0xCu);
    }

    BOOL v11 = 0;
  }

  else
  {
    unint64_t v12 = -[CSDPinExchangeController randomSixDigitCode](self, "randomSixDigitCode");
    if (!self->_pendingCodesToDevicesForApproval)
    {
      __int128 v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      pendingCodesToDevicesForApproval = self->_pendingCodesToDevicesForApproval;
      self->_pendingCodesToDevicesForApproval = v13;
    }

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
    __int128 v16 = self->_pendingCodesToDevicesForApproval;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

    id v18 = sub_1001704C4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Sending a PIN code to device %@ to display to enroll them into Thumper",  (uint8_t *)&v21,  0xCu);
    }

    BOOL v11 = -[CSDPinExchangeController sendIDSAction:toDevice:]( self,  "sendIDSAction:toDevice:",  @"CSDPinExchangeActionSendPIN",  v4);
  }

  return v11;
}

- (void)sendApprovalResponseToDevice:(id)a3 enteredCorrectly:(BOOL)a4 wasCancelled:(BOOL)a5
{
  id v6 = @"CSDPinExchangeActionUnapproved";
  if (a4) {
    id v6 = @"CSDPinExchangeActionApproved";
  }
  if (a5) {
    id v7 = @"CSDPinExchangeActionCancelledPrimary";
  }
  else {
    id v7 = v6;
  }
  -[CSDPinExchangeController sendIDSAction:toDevice:](self, "sendIDSAction:toDevice:", v7, a3);
}

- (BOOL)sendIDSAction:(id)a3 toDevice:(id)a4
{
  id v10 = a4;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  LOBYTE(a3) = -[CSDPinExchangeController sendIDSAction:toDevices:](self, "sendIDSAction:toDevices:", v7, v8, v10);
  return (char)a3;
}

- (BOOL)sendIDSAction:(id)a3 toDevices:(id)a4
{
  id v5 = (__CFString *)a3;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = a4;
  id v42 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
  if (v42)
  {
    int v6 = 1;
    uint64_t v40 = IDSSendMessageOptionTimeoutKey;
    uint64_t v41 = *(void *)v53;
    p_info = &OBJC_METACLASS___CSDFileTransferController.info;
    do
    {
      for (i = 0LL; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v53 != v41) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        uint64_t v10 = IDSCopyIDForDevice(v9);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v11 setObject:v5 forKeyedSubscript:@"CSDPinExchangeActionKey"];
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([p_info + 506 sharedInstance]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 callerID]);

        if ([v13 length])
        {
          [v11 setObject:v13 forKeyedSubscript:@"CSDPinExchangeCallerIDKey"];
        }

        else
        {
          id v14 = sub_1001704C4();
          __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_1002B4D7C(v64, &v65, v15);
          }
        }

        if (-[__CFString isEqualToString:](v5, "isEqualToString:", @"CSDPinExchangeActionSendPIN"))
        {
          pendingCodesToDevicesForApproval = self->_pendingCodesToDevicesForApproval;
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](pendingCodesToDevicesForApproval, "objectForKey:", v17));

          if (v18) {
            [v11 setObject:v18 forKeyedSubscript:@"CSDPinExchangePinKey"];
          }
        }

        v48 = v13;
        id v19 = sub_1001704C4();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v59 = v5;
          __int16 v60 = 2112;
          id v61 = v9;
          __int16 v62 = 2112;
          id v63 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Sending IDS action %@ to device %@ with message %@",  buf,  0x20u);
        }

        uint64_t v21 = JWEncodeDictionary(v11);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        id v47 = [v22 _FTCopyGzippedData];
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:"));
        uint64_t v56 = v40;
        v57 = &off_1003F1750;
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
        v49 = (void *)v10;
        if (v23)
        {
          v44 = v22;
          v45 = v11;
          int v46 = v6;
          v25 = (void *)objc_claimAutoreleasedReturnValue([p_info + 506 sharedInstance]);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 service]);
          uint64_t v27 = IMSingleObjectArray(v10);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          v29 = v5;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "__imSetFromArray"));
          id v50 = 0LL;
          id v51 = 0LL;
          v43 = v24;
          unsigned int v31 = [v26 sendMessage:v23 fromAccount:0 toDestinations:v30 priority:300 options:v24 identifier:&v51 error:&v50];
          id v32 = v51;
          id v33 = v50;

          id v5 = v29;
          if (v31
            && -[__CFString isEqualToString:]( v29,  "isEqualToString:",  @"CSDPinExchangeActionRequestPIN"))
          {
            -[CSDPinExchangeController setOutgoingPinRequestIdentifier:](self, "setOutgoingPinRequestIdentifier:", v32);
          }

          id v34 = sub_1001704C4();
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v36 = @"NO";
            if (v31) {
              v36 = @"YES";
            }
            v59 = v36;
            __int16 v60 = 2112;
            id v61 = v33;
            __int16 v62 = 2112;
            id v63 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Thumper IDS action sent to device with success: %@ error: %@ identifier: %@",  buf,  0x20u);
          }

          int v6 = v46 & v31;
          p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CSDFileTransferController + 32);
          id v22 = v44;
          BOOL v11 = v45;
          v24 = v43;
        }

        else
        {
          id v32 = 0LL;
          id v33 = 0LL;
        }
      }

      id v42 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
    }

    while (v42);
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6 & 1;
}

- (unint64_t)randomSixDigitCode
{
  return (int)(arc4random_uniform(0xDBB9Fu) + 100000);
}

- (void)displayErrorNotificationWithMessage:(id)a3
{
  id v4 = a3;
  uint64_t v6 = TUBundle(v4, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"OK" value:&stru_1003E7718 table:@"TelephonyUtilities"]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeDelegate serviceDescription](self->_pinExchangeDelegate, "serviceDescription"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  @"com.apple.telephonyutilities.callservicesd.pinexchangeerror",  v9,  v4,  v8,  0LL,  0LL));

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BB324;
  block[3] = &unk_1003D7730;
  id v13 = v10;
  id v11 = v10;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)removeErrorNotifications
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
  [v2 removeNotificationsForServiceIdentifier:@"com.apple.telephonyutilities.callservicesd.pinexchangeerror"];
}

- (void)displayPinErrorNotification
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[WARN] Displaying PIN error notification",  v10,  2u);
  }

  uint64_t v7 = TUBundle(v5, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"INCORRECT_PIN_ENTERED" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
  -[CSDPinExchangeController displayErrorNotificationWithMessage:](self, "displayErrorNotificationWithMessage:", v9);
}

- (void)displayMismatchedAccountsNotification
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[WARN] Displaying mismatched accounts notification",  v15,  2u);
  }

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  id v6 = -[TUFeatureFlags appleAccountRebrandEnabled](v5, "appleAccountRebrandEnabled");
  int v7 = (int)v6;
  uint64_t v9 = TUBundle(v6, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v7) {
    id v11 = @"THUMPER_MISMATCHED_ACCOUNTS_APPLEACCOUNT";
  }
  else {
    id v11 = @"THUMPER_MISMATCHED_ACCOUNTS";
  }
  uint64_t v12 = TUStringKeyForNetwork(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:v13 value:&stru_1003E7718 table:@"TelephonyUtilities"]);
  -[CSDPinExchangeController displayErrorNotificationWithMessage:](self, "displayErrorNotificationWithMessage:", v14);
}

- (void)displaySlotsFullNotification
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[WARN] Displaying slots full notification",  v10,  2u);
  }

  uint64_t v7 = TUBundle(v5, v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"MAX_SLOTS_FILLED" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
  -[CSDPinExchangeController displayErrorNotificationWithMessage:](self, "displayErrorNotificationWithMessage:", v9);
}

- (void)handlePINCodeEnteredSuccessfully:(BOOL)a3 canceled:(BOOL)a4 fromDevice:(id)a5 isPrimaryDevice:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController pendingCodesToDevicesForApproval](self, "pendingCodesToDevicesForApproval"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
  [v11 setObject:0 forKeyedSubscript:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController pinExchangeDelegate](self, "pinExchangeDelegate"));
  id v15 = v13;
  if (v6) {
    id v14 = v10;
  }
  else {
    id v14 = 0LL;
  }
  [v13 pinCodeEnteredSuccessfully:v8 cancelled:v7 onPrimaryDevice:v14];
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKey:@"CSDPinExchangeCompressedDataKey"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _FTDecompressData]);

  uint64_t v14 = JWDecodeDictionary(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceForFromID:v11]);

  id v18 = sub_1001704C4();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v75 = v10;
    __int16 v76 = 2112;
    id v77 = v17;
    __int16 v78 = 1024;
    unsigned int v79 = [v17 isHSATrusted];
    __int16 v80 = 2112;
    v81 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Received message for service %@ from device %@ (isHSATrusted=%d): %@",  buf,  0x26u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"CSDPinExchangeActionKey"]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"CSDPinExchangeCallerIDKey"]);
  if ([v20 isEqualToString:@"CSDPinExchangeActionRequestPIN"])
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController outgoingPinRequestIdentifier](self, "outgoingPinRequestIdentifier"));

    if (v22)
    {
      id v23 = sub_1001704C4();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Ignoring pin request: There is already a pending pin request that has not yet completed.",  buf,  2u);
      }

      goto LABEL_9;
    }

    v66 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUCallProviderManager faceTimeProvider](v66, "faceTimeProvider"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 prioritizedSenderIdentities]);

    v67 = v27;
    if ([v27 count])
    {
      uint64_t v65 = self;
      if ([v27 count] == (id)1)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 firstObject]);
        id v29 = (id)objc_claimAutoreleasedReturnValue([v28 UUID]);

        id v30 = sub_1001704C4();
        unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v75 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "One sender identity exists; continuing Thumper registration using UUID %@",
            buf,
            0xCu);
        }

        goto LABEL_48;
      }

      id v39 = [v21 length];
      id v40 = sub_1001704C4();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      BOOL v41 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v39)
      {
        if (v41)
        {
          *(_DWORD *)buf = 138412546;
          id v75 = v21;
          __int16 v76 = 2112;
          id v77 = v67;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Multiple sender identities exist; checking whether caller ID %@ matches a sender identity in %@",
            buf,
            0x16u);
        }

        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        unsigned int v31 = v67;
        id v29 = -[os_log_s countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v69,  v73,  16LL);
        if (v29)
        {
          __int16 v60 = v15;
          id v61 = v20;
          __int16 v62 = v13;
          id v63 = v11;
          id v64 = v10;
          uint64_t v42 = *(void *)v70;
          while (2)
          {
            for (i = 0LL; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v70 != v42) {
                objc_enumerationMutation(v31);
              }
              v44 = v31;
              v45 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
              int v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "handle", v60));
              id v47 = (void *)objc_claimAutoreleasedReturnValue([v46 isoCountryCode]);
              v48 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:]( &OBJC_CLASS___TUHandle,  "normalizedPhoneNumberHandleForValue:isoCountryCode:",  v21,  v47));

              if (v46) {
                BOOL v49 = v48 == 0LL;
              }
              else {
                BOOL v49 = 1;
              }
              if (!v49 && [v48 isEqualToHandle:v46])
              {
                id v29 = (id)objc_claimAutoreleasedReturnValue([v45 UUID]);

                id v11 = v63;
                id v10 = v64;
                id v13 = v62;
                v20 = v61;
                unsigned int v31 = v44;
                goto LABEL_47;
              }

              unsigned int v31 = v44;
            }

            id v29 = -[os_log_s countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v69,  v73,  16LL);
            if (v29) {
              continue;
            }
            break;
          }

          id v11 = v63;
          id v10 = v64;
          id v13 = v62;
          v20 = v61;
LABEL_47:
          id v15 = v60;
        }

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = sub_1001704C4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if (v8)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received didSendWithSuccess=YES for message with identifier %@",  (uint8_t *)&v23,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1002B4E88((uint64_t)v14, (uint64_t)v15, v18);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController outgoingPinRequestIdentifier](self, "outgoingPinRequestIdentifier"));
    unsigned int v20 = [v19 isEqualToString:v14];

    if (v20) {
      -[CSDPinExchangeDelegate displayPinRequestFailure](self->_pinExchangeDelegate, "displayPinRequestFailure");
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPinExchangeController outgoingPinRequestIdentifier](self, "outgoingPinRequestIdentifier"));
  unsigned int v22 = [v21 isEqualToString:v14];

  if (v22) {
    -[CSDPinExchangeController setOutgoingPinRequestIdentifier:](self, "setOutgoingPinRequestIdentifier:", 0LL);
  }
}

- (NSMutableDictionary)pendingCodesToDevicesForApproval
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPendingCodesToDevicesForApproval:(id)a3
{
}

- (CSDPinExchangeDelegate)pinExchangeDelegate
{
  return (CSDPinExchangeDelegate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPinExchangeDelegate:(id)a3
{
}

- (NSString)outgoingPinRequestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOutgoingPinRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end