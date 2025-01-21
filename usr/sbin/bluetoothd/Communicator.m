@interface Communicator
+ (id)myNumber;
- (BOOL)_appearsToBeEmailAddress:(id)a3;
- (BOOL)supports3WC;
- (CallList)calls;
- (Communicator)initWithDelegate:(Delegate *)a3;
- (CoreTelephonyClient)ctClient;
- (Delegate)delegate;
- (TUCallCenter)tuCallCenter;
- (__CTServerConnection)ctServerConnection;
- (id).cxx_construct;
- (id)_callForIdentifier:(id)a3;
- (id)_getSubscriptionContext;
- (id)_identifierForCall:(id)a3;
- (id)_myNumber;
- (id)getCountryCode;
- (id)getCountryCodeForIdentifier:(id)a3;
- (id)getCountryCodeIdentifer;
- (id)getRegistrationStatus;
- (int)_answerCall:(id)a3 uid:(const void *)a4 behavior:(int64_t)a5;
- (int)_dialNumber:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5;
- (int)_redialNumberWhileScreening:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5;
- (int)addHeldCall;
- (int)addVirtualCall;
- (int)answerIncomingCall:()basic_string<char;
- (int)dialNumber:(const void *)a3 uid:()basic_string<char;
- (int)enableEchoCancellationNoiseReduction:(BOOL)a3;
- (int)getCurrentCalls:(void *)a3;
- (int)getCurrentExpanseCalls:(void *)a3;
- (int)getCurrentScreeningCalls:(void *)a3;
- (int)getMobileEquipmentIdentity:(void *)a3;
- (int)getMobileSubscriberIdentity:(void *)a3;
- (int)getOperatorStatus:(void *)a3;
- (int)getSignalStrength:(int *)a3 mode:(int)a4;
- (int)getSubscriberNumber:(void *)a3;
- (int)getTransmitState:(BOOL *)a3;
- (int)hangupActiveCall;
- (int)holdActiveCalls:()basic_string<char;
- (int)privateConference:(id)a3;
- (int)redialLastNumberWithUid:()basic_string<char;
- (int)rejectIncomingCall;
- (int)releaseActiveCalls:()basic_string<char;
- (int)releaseCall:(id)a3;
- (int)releaseHeldCalls;
- (int)removeVirtualCall;
- (int)sendDTMFTone:(unsigned __int8)a3;
- (int)setScreeningCall:(id)a3 isScreening:(BOOL)a4;
- (void)_handleCTCellularTransmitStateChangedNotification:(__CFDictionary *)a3;
- (void)_handleTUCallCenterCallExpanseStatusChangedNotification:(id)a3;
- (void)_handleTUCallCenterCallStatusChangedNotification:(id)a3;
- (void)_updateCalls;
- (void)activeSubscriptionsDidChange;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)invalidate;
- (void)networkReselectionNeeded:(id)a3;
- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)setCalls:(CallList *)a3;
- (void)setDelegate:(Delegate *)a3;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
@end

@implementation Communicator

- (Communicator)initWithDelegate:(Delegate *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___Communicator;
  v4 = -[Communicator init](&v28, "init");
  v5 = v4;
  if (v4)
  {
    v4->_delegate = a3;
    if (NSClassFromString(@"TUCallCenter"))
    {
      id v6 = *(id *)(sub_100405058() + 8);
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TUCallCenter callCenterWithQueue:](&OBJC_CLASS___TUCallCenter, "callCenterWithQueue:", v6));
      tuCallCenter = v5->_tuCallCenter;
      v5->_tuCallCenter = (TUCallCenter *)v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v9 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v10 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v11 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallInvitationSentNotification object:0];

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v12 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterVideoCallInvitationSentNotification object:0];

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v13 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallerIDChangedNotification object:0];

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v14 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallConnectedNotification object:0];

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v15 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterCallContinuityStateChangedNotification object:0];

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v16 addObserver:v5 selector:"_handleTUCallCenterCallExpanseStatusChangedNotification:" name:TUCallMixesVoiceWithMediaChangedNotification object:0];

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v17 addObserver:v5 selector:"_handleTUCallCenterCallStatusChangedNotification:" name:TUCallCenterIsScreeningChangedNotification object:0];

      -[Communicator _updateCalls](v5, "_updateCalls");
    }

    if (sub_100487C38())
    {
      id v18 = *(id *)(sub_100405058() + 8);
      v5->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue( kCFAllocatorDefault,  @"com.apple.bluetooth.communicator",  v18,  0LL);

      v19 = objc_alloc(&OBJC_CLASS___CoreTelephonyClient);
      id v20 = *(id *)(sub_100405058() + 8);
      v21 = -[CoreTelephonyClient initWithQueue:](v19, "initWithQueue:", v20);
      ctClient = v5->_ctClient;
      v5->_ctClient = v21;

      -[CoreTelephonyClient setDelegate:](v5->_ctClient, "setDelegate:", v5);
      v23 = -[Communicator ctServerConnection](v5, "ctServerConnection");
      uint64_t v24 = kCTCellularTransmitStateNotification;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1003E787C;
      v26[3] = &unk_100895D28;
      v27 = v5;
      _CTServerConnectionRegisterBlockForNotification(v23, v24, v26);
    }
  }

  return v5;
}

- (void)invalidate
{
  if (-[Communicator ctServerConnection](self, "ctServerConnection")) {
    _CTServerConnectionUnregisterForAllNotifications(-[Communicator ctServerConnection](self, "ctServerConnection"));
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[Communicator setDelegate:](self, "setDelegate:", 0LL);
}

- (void)dealloc
{
  if (-[Communicator ctServerConnection](self, "ctServerConnection")) {
    CFRelease(-[Communicator ctServerConnection](self, "ctServerConnection"));
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___Communicator;
  -[Communicator dealloc](&v3, "dealloc");
}

- (id)_identifierForCall:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___NSUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueProxyIdentifier]);
  id v6 = -[NSUUID initWithUUIDString:](v4, "initWithUUIDString:", v5);

  return v6;
}

- (id)_callForIdentifier:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callWithUniqueProxyIdentifier:v4]);

  return v6;
}

- (BOOL)_appearsToBeEmailAddress:(id)a3
{
  return [a3 containsString:@"@"];
}

- (void)_updateCalls
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v3 currentAudioAndVideoCalls]);

  v40 = 0LL;
  v41 = 0LL;
  uint64_t v42 = 0LL;
  -[Communicator calls](self, "calls");
  uint64_t v37 = 0LL;
  uint64_t v38 = 0LL;
  uint64_t v39 = 0LL;
  sub_10053C3D8(&v37);
  v4 = (os_log_s *)qword_1008F75E8;
  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v29;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current TU call(s): %@", buf, 0xCu);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v29;
  id v5 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v34;
LABEL_5:
    uint64_t v7 = 0LL;
    while (2)
    {
      if (*(void *)v34 != v6) {
        objc_enumerationMutation(obj);
      }
      v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
      memset(&v46, 0, sizeof(v46));
      *(_OWORD *)buf = 0u;
      memset(v45, 0, sizeof(v45));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _identifierForCall:](self, "_identifierForCall:", v8));
      sub_1003EC71C((uint64_t)buf, v9);

      id v10 = *(id *)buf;
      v11 = sub_10053C584(&v40, v10);

      unsigned int v12 = [v8 status];
      switch(v12)
      {
        case 0u:
        case 6u:
          goto LABEL_43;
        case 1u:
          if ((unint64_t)[obj count] < 2)
          {
            unsigned int v12 = 1;
          }

          else if ([v8 isConnected])
          {
            unsigned int v12 = 1;
          }

          else
          {
            unsigned int v12 = 6;
          }

          goto LABEL_22;
        case 2u:
          goto LABEL_22;
        case 3u:
          BOOL v13 = [v8 hasSentInvitation] == 0;
          int v14 = 3;
          goto LABEL_15;
        case 4u:
          BOOL v13 = [obj count] == (id)1;
          int v14 = 5;
LABEL_15:
          if (v13) {
            unsigned int v12 = v14;
          }
          else {
            unsigned int v12 = v14 + 1;
          }
          goto LABEL_22;
        case 5u:
          if ([obj count] != (id)1 || v41 == v11) {
            goto LABEL_43;
          }
          unsigned int v12 = *((_DWORD *)v11 + 4);
LABEL_22:
          LODWORD(v45[0]) = v12;
LABEL_23:
          if (v41 != v11) {
            *(_DWORD *)&buf[8] = *((_DWORD *)v11 + 2);
          }
          buf[12] = [v8 isOutgoing];
          buf[13] = [v8 isConferenced];
          buf[14] = [v8 mixesVoiceWithMedia];
          buf[15] = [v8 isScreening];
          v15 = (void *)objc_claimAutoreleasedReturnValue([v8 handle]);
          v16 = v15;
          if (v15)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
            unsigned __int8 v18 = -[Communicator _appearsToBeEmailAddress:](self, "_appearsToBeEmailAddress:", v17);

            if ((v18 & 1) == 0)
            {
              id v19 = objc_claimAutoreleasedReturnValue([v16 value]);
              sub_10054A384(&__str, [v19 UTF8String]);
              sub_10054A44C((std::string *)((char *)v45 + 8), (uint64_t)&__str);
              sub_10054A428(&__str);
            }

            if (v41 == v11 || !sub_10054A494((unsigned __int8 *)v11 + 24, (unsigned __int8 *)v45 + 8))
            {
              id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 displayName]);
              v21 = v20;
              if (v20)
              {
                if ((unint64_t)[v20 length] >= 0x81)
                {
                  uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 substringToIndex:128]);

                  v21 = (void *)v22;
                }

                id v23 = v21;
                if ([v23 UTF8String])
                {
                  sub_10002418C(&__p, (char *)[v23 UTF8String]);
                  sub_1003A8B1C(&__p, &__str);
                  std::string::operator=(&v46, &__str);
                }

                else
                {
                  uint64_t v24 = (os_log_s *)qword_1008F75E8;
                  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(__str.__r_.__value_.__l.__data_) = 138412290;
                    *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Invalid call display name for %@",  (uint8_t *)&__str,  0xCu);
                  }
                }
              }
            }

            else
            {
              std::string::operator=(&v46, (const std::string *)(v11 + 10));
            }
          }

          sub_10053C464(&v37, (uint64_t)buf);
LABEL_43:
          sub_10054A428((char *)v45 + 8);

          if (v5 != (id)++v7) {
            continue;
          }
          id v5 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
          if (!v5) {
            goto LABEL_47;
          }
          goto LABEL_5;
        default:
          goto LABEL_23;
      }
    }
  }

- (id)_myNumber
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 phoneNumber]);

  return v3;
}

- (int)_dialNumber:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5
{
  id v9 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
  else {
    id v10 = *(const void **)a5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 providerWithIdentifier:v11]);
  BOOL v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v9 telephonyProvider]);
  }
  v15 = v14;

  id v16 = [[TUDialRequest alloc] initWithProvider:v15];
  else {
    v17 = *(const void **)a3;
  }
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](&OBJC_CLASS___TUHandle, "handleWithDestinationID:", v18));
  [v16 setHandle:v19];

  else {
    id v20 = *(const void **)a4;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
  [v16 setAudioSourceIdentifier:v21];

  uint64_t v22 = (os_log_s *)qword_1008F75E8;
  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
  {
    else {
      id v23 = *(const void **)a3;
    }
    int v26 = 136315394;
    v27 = v23;
    __int16 v28 = 2112;
    v29 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Dialing '%s' with TU provider %@",  (uint8_t *)&v26,  0x16u);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  [v24 launchAppForDialRequest:v16 completion:0];

  return 0;
}

- (int)_redialNumberWhileScreening:(const void *)a3 uid:(const void *)a4 providerIdentifier:(const void *)a5
{
  id v9 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
  else {
    id v10 = *(const void **)a5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 providerWithIdentifier:v11]);
  BOOL v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v9 telephonyProvider]);
  }
  v15 = v14;

  id v16 = [[TUDialRequest alloc] initWithProvider:v15];
  else {
    v17 = *(const void **)a3;
  }
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](&OBJC_CLASS___TUHandle, "handleWithDestinationID:", v18));
  [v16 setHandle:v19];

  else {
    id v20 = *(const void **)a4;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
  [v16 setAudioSourceIdentifier:v21];

  uint64_t v22 = (os_log_s *)qword_1008F75E8;
  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
  {
    else {
      id v23 = *(const void **)a3;
    }
    int v28 = 136315394;
    v29 = v23;
    __int16 v30 = 2112;
    v31 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Calling handleRedialCommandWhileScreening '%s' with TU provider %@",  (uint8_t *)&v28,  0x16u);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  char v25 = objc_opt_respondsToSelector(v24, "handleRedialCommandWhileScreening:");

  int v26 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  if ((v25 & 1) != 0) {
    [v26 handleRedialCommandWhileScreening:v16];
  }
  else {
    [v26 launchAppForDialRequest:v16 completion:0];
  }

  return 0;
}

- (int)_answerCall:(id)a3 uid:(const void *)a4 behavior:(int64_t)a5
{
  id v8 = a3;
  id v9 = [[TUAnswerRequest alloc] initWithCall:v8];
  else {
    id v10 = *(const void **)a4;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
  [v9 setSourceIdentifier:v11];

  [v9 setBehavior:a5];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  [v12 answerWithRequest:v9];

  return 0;
}

- (id)_getSubscriptionContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getSubscriptionInfoWithError:0]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v4 = [v3 subscriptions];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userDefaultVoice]);
        unsigned __int8 v10 = [v9 BOOLValue];

        if ((v10 & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)activeSubscriptionsDidChange
{
  if (-[Communicator delegate](self, "delegate"))
  {
    id v3 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Received 'active subscriptions did change' delegate",  v11,  2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getSignalStrengthInfo:v4 error:0]);

    uint64_t v7 = -[Communicator delegate](self, "delegate");
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bars]);
    (*((void (**)(Delegate *, void))v7->var0 + 4))( v7,  [v8 unsignedIntValue]);

    id v9 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v9->var0 + 3))(v9);
    unsigned __int8 v10 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v10->var0 + 1))(v10);
  }

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v5 = a3;
  if (-[Communicator delegate](self, "delegate"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userDefaultVoice]);
    unsigned int v7 = [v6 BOOLValue];

    if (v7)
    {
      id v8 = (os_log_s *)qword_1008F75E8;
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned __int8 v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Received 'operator name changed' delegate",  v10,  2u);
      }

      id v9 = -[Communicator delegate](self, "delegate");
      (*((void (**)(Delegate *))v9->var0 + 1))(v9);
    }
  }
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[Communicator delegate](self, "delegate"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userDefaultVoice]);
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      unsigned __int8 v10 = (os_log_s *)qword_1008F75E8;
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Received 'signal strength changed' delegate",  v14,  2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 bars]);
      unsigned __int8 v12 = [v11 unsignedIntValue];

      __int128 v13 = -[Communicator delegate](self, "delegate");
      (*((void (**)(Delegate *, void))v13->var0 + 4))(v13, v12);
    }
  }
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v5 = a3;
  if (-[Communicator delegate](self, "delegate"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userDefaultVoice]);
    unsigned int v7 = [v6 BOOLValue];

    if (v7)
    {
      id v8 = (os_log_s *)qword_1008F75E8;
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned __int8 v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Received 'display status changed' delegate",  v10,  2u);
      }

      unsigned int v9 = -[Communicator delegate](self, "delegate");
      (*((void (**)(Delegate *))v9->var0 + 3))(v9);
    }
  }
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  if (-[Communicator delegate](self, "delegate", a3, a4))
  {
    id v5 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received 'context capabilities changed' notification",  v7,  2u);
    }

    id v6 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v6->var0 + 2))(v6);
  }

- (void)networkReselectionNeeded:(id)a3
{
  if (-[Communicator delegate](self, "delegate", a3))
  {
    v4 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Received 'network selection needed' notification",  v7,  2u);
    }

    id v5 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v5->var0 + 1))(v5);
    id v6 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v6->var0 + 3))(v6);
  }

- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5
{
  if (-[Communicator delegate](self, "delegate", a3, a4, a5))
  {
    id v6 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Received 'network selection changed' notification",  v9,  2u);
    }

    unsigned int v7 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v7->var0 + 1))(v7);
    id v8 = -[Communicator delegate](self, "delegate");
    (*((void (**)(Delegate *))v8->var0 + 3))(v8);
  }

- (void)_handleTUCallCenterCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _identifierForCall:](self, "_identifierForCall:", v5));

  unsigned int v7 = *(dispatch_queue_s **)(sub_100405058() + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003E90CC;
  v9[3] = &unk_10087FB90;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)_handleTUCallCenterCallExpanseStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)(id)qword_1008F75E8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Expanse status changed for call: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[Communicator _updateCalls](self, "_updateCalls");
}

- (void)_handleCTCellularTransmitStateChangedNotification:(__CFDictionary *)a3
{
  if (-[Communicator delegate](self, "delegate"))
  {
    id v5 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received 'cellular transmit state changed' notification",  v9,  2u);
    }

    Value = CFDictionaryGetValue(a3, kKeyCTCellularTransmitState);
    if (Value)
    {
      BOOL v7 = CFEqual(Value, kCTCellularTransmitStarted) != 0;
      id v8 = -[Communicator delegate](self, "delegate");
      (*((void (**)(Delegate *, BOOL))v8->var0 + 5))(v8, v7);
    }
  }

+ (id)myNumber
{
  v2 = -[CoreTelephonyClient initWithQueue:](objc_alloc(&OBJC_CLASS___CoreTelephonyClient), "initWithQueue:", 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getSubscriptionInfoWithError:](v2, "getSubscriptionInfoWithError:", 0LL));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [v3 subscriptions];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userDefaultVoice]);
        unsigned int v10 = [v9 BOOLValue];

        if (v10)
        {
          id v5 = (id)objc_claimAutoreleasedReturnValue([v8 phoneNumber]);
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (BOOL)supports3WC
{
  BOOL result = 1;
  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
  {
    CFTypeRef arg = 0LL;
    char v5 = 0;
    _CTServerConnectionCopySystemCapabilities(-[Communicator ctServerConnection](self, "ctServerConnection"), &arg, &v5);
    if (v5)
    {
      CFAutorelease(arg);
      Value = CFDictionaryGetValue((CFDictionaryRef)arg, kConferenceCallType);
      if (CFEqual(Value, kConferenceCallType3Party)) {
        return 0;
      }
    }
  }

  return result;
}

- (int)answerIncomingCall:()basic_string<char
{
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 audioOrVideoCallWithStatus:4]);

  BOOL v7 = (os_log_s *)qword_1008F75E8;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Found incoming TU call to answer: %@",  (uint8_t *)&v10,  0xCu);
    }

    int v8 = -[Communicator _answerCall:uid:behavior:](self, "_answerCall:uid:behavior:", v6, a3, 0LL);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679C2C();
    }
    int v8 = 13;
  }

  return v8;
}

- (int)rejectIncomingCall
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioOrVideoCallWithStatus:4]);

  char v5 = (os_log_s *)qword_1008F75E8;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      int v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Found incoming TU call to reject: %@",  (uint8_t *)&v9,  0xCu);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    [v6 disconnectCall:v4];

    int v7 = 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679C58();
    }
    int v7 = 13;
  }

  return v7;
}

- (int)hangupActiveCall
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioOrVideoCallWithStatus:3]);

  if (v4)
  {
    char v5 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      __int128 v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Found sending TU call to disconnect: %@",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    [v6 disconnectCall:v4];
LABEL_9:
    int v11 = 0;
    goto LABEL_10;
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 audioAndVideoCallsWithStatus:1]);

  id v8 = [v6 count];
  int v9 = (os_log_s *)qword_1008F75E8;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      __int128 v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Found active TU calls to disconnect: %@",  (uint8_t *)&v13,  0xCu);
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    [v10 disconnectCurrentCallAndActivateHeld];

    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
    sub_100679C84();
  }
  int v11 = 13;
LABEL_10:

  return v11;
}

- (int)releaseHeldCalls
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioAndVideoCallsWithStatus:2]);

  __int128 v14 = v4;
  if ([v4 count])
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
          int v10 = (os_log_s *)qword_1008F75E8;
          if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v20 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Found held TU call to disconnect: %@",  buf,  0xCu);
          }

          int v11 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
          [v11 disconnectCall:v9];
        }

        id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }

      while (v6);
    }

    int v12 = 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679CB0();
    }
    int v12 = 13;
  }

  return v12;
}

- (int)releaseActiveCalls:()basic_string<char
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 audioOrVideoCallWithStatus:4]);

  if (v6)
  {
    uint64_t v7 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      __int128 v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Found incoming TU call to answer: %@",  (uint8_t *)&v15,  0xCu);
    }

    int v8 = -[Communicator _answerCall:uid:behavior:](self, "_answerCall:uid:behavior:", v6, a3, 0LL);
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 audioAndVideoCallsWithStatus:1]);

    id v11 = [v10 count];
    int v12 = (os_log_s *)qword_1008F75E8;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        __int128 v16 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Found active TU calls to disconnect: %@",  (uint8_t *)&v15,  0xCu);
      }

      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      [v13 disconnectCurrentCallAndActivateHeld];

      int v8 = 0;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
        sub_100679C84();
      }
      int v8 = 13;
    }
  }

  return v8;
}

- (int)holdActiveCalls:()basic_string<char
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 audioOrVideoCallWithStatus:4]);

  if (!v6)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 audioOrVideoCallWithStatus:1]);

    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 audioOrVideoCallWithStatus:2]);

    if (v12 && v14)
    {
      int v15 = (os_log_s *)qword_1008F75E8;
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Swapping TU calls", (uint8_t *)&v24, 2u);
      }

      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      [v16 swapCalls];
    }

    else if (!v12 || v14)
    {
      uint64_t v22 = (os_log_s *)qword_1008F75E8;
      if (v12 || !v14)
      {
        if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
          sub_100679CDC();
        }
        int v10 = 13;
        goto LABEL_14;
      }

      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        char v25 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Found held TU call to resume: %@",  (uint8_t *)&v24,  0xCu);
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      [v23 unholdCall:v14];
    }

    else
    {
      __int128 v18 = (os_log_s *)qword_1008F75E8;
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        char v25 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Found active TU call to hold: %@",  (uint8_t *)&v24,  0xCu);
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 model]);
      unsigned int v20 = [v19 supportsHolding];

      if (!v20)
      {
        if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
          sub_100679D08();
        }
        int v10 = 2;
        goto LABEL_14;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      [v21 holdCall:v12];
    }

    int v10 = 0;
LABEL_14:

    goto LABEL_15;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  else {
    uint64_t v8 = 0LL;
  }

  uint64_t v9 = (os_log_s *)qword_1008F75E8;
  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412546;
    char v25 = v6;
    __int16 v26 = 2048;
    uint64_t v27 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Found incoming TU call to answer %@ with behavior %ld",  (uint8_t *)&v24,  0x16u);
  }

  int v10 = -[Communicator _answerCall:uid:behavior:](self, "_answerCall:uid:behavior:", v6, a3, v8);
LABEL_15:

  return v10;
}

- (int)addHeldCall
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 audioOrVideoCallWithStatus:2]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 audioOrVideoCallWithStatus:1]);

  uint64_t v7 = (os_log_s *)qword_1008F75E8;
  if (v4 && v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      int v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Found held TU call to create a conference: %@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v8 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      int v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Found active TU call to create a conference: %@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    unsigned int v10 = [v9 canGroupCall:v4 withCall:v6];

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      [v11 groupCall:v4 withOtherCall:v6];

      int v12 = 0;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
        sub_100679D34();
      }
      int v12 = 2;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679D60();
    }
    int v12 = 13;
  }

  return v12;
}

- (int)releaseCall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _callForIdentifier:](self, "_callForIdentifier:", v4));
  id v6 = (os_log_s *)qword_1008F75E8;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      int v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Found TU call to disconnect: %@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    [v7 disconnectCall:v5];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 audioOrVideoCallWithStatus:2]);

    if (v9)
    {
      unsigned int v10 = (os_log_s *)qword_1008F75E8;
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        int v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Found held TU call to resume: %@",  (uint8_t *)&v14,  0xCu);
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
      [v11 unholdCall:v9];
    }

    int v12 = 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679D8C();
    }
    int v12 = 15;
  }

  return v12;
}

- (int)privateConference:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _callForIdentifier:](self, "_callForIdentifier:", v4));
  id v6 = (os_log_s *)qword_1008F75E8;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679DB8();
    }
    goto LABEL_11;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    int v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Found TU call to leave the conference: %@",  (uint8_t *)&v12,  0xCu);
  }

  if (![v5 isConferenced])
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679E10();
    }
LABEL_11:
    int v10 = 15;
    goto LABEL_12;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
  unsigned int v8 = [v7 supportsUngrouping];

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
    [v9 ungroupCall:v5];

    int v10 = 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679DE4();
    }
    int v10 = 2;
  }

- (int)dialNumber:(const void *)a3 uid:()basic_string<char
{
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  sub_10053C3D8(&v14);
  -[Communicator getCurrentScreeningCalls:](self, "getCurrentScreeningCalls:", &v14);
  if (v14 == v15)
  {
    sub_10054A554((char *)a3, (uint64_t)v12);
    sub_10002418C(__p, "");
    unsigned int v7 = -[Communicator _dialNumber:uid:providerIdentifier:](self, "_dialNumber:uid:providerIdentifier:", v12, a4, __p);
  }

  else
  {
    sub_10054A554((char *)a3, (uint64_t)v12);
    sub_10002418C(__p, "");
    unsigned int v7 = -[Communicator _redialNumberWhileScreening:uid:providerIdentifier:]( self,  "_redialNumberWhileScreening:uid:providerIdentifier:",  v12,  a4,  __p);
  }

  int v8 = v7;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
  v12[0] = &v14;
  sub_1002077E0((void ***)v12);
  return v8;
}

- (int)redialLastNumberWithUid:()basic_string<char
{
  id v5 = operator new(0x30uLL);
  sub_100404A98(v5, 9LL, 0LL, 1LL);
  if (sub_100404B6C((uint64_t)v5))
  {
    uint64_t v6 = sub_100404C58((uint64_t)v5, 0);
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    sub_10053C3D8(&v11);
    -[Communicator getCurrentScreeningCalls:](self, "getCurrentScreeningCalls:", &v11);
    if (v11 == v12) {
      unsigned int v7 = -[Communicator _dialNumber:uid:providerIdentifier:]( self,  "_dialNumber:uid:providerIdentifier:",  v6 + 8,  a3,  v6 + 88);
    }
    else {
      unsigned int v7 = -[Communicator _redialNumberWhileScreening:uid:providerIdentifier:]( self,  "_redialNumberWhileScreening:uid:providerIdentifier:",  v6 + 8,  a3,  v6 + 88);
    }
    int v9 = v7;
    if (v6)
    {
      operator delete((void *)v6);
    }

    uint64_t v14 = (void **)&v11;
    sub_1002077E0(&v14);
  }

  else
  {
    int v8 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Outgoing call history is empty",  (uint8_t *)&v11,  2u);
    }

    int v9 = 14;
  }

  sub_100404AFC((uint64_t)v5);
  return v9;
}

- (int)sendDTMFTone:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator tuCallCenter](self, "tuCallCenter"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 audioOrVideoCallWithStatus:1]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
  unsigned int v7 = [v6 supportsDTMF];

  if (v7)
  {
    [v5 playDTMFToneForKey:v3];
    int v8 = 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679E3C();
    }
    int v8 = 13;
  }

  return v8;
}

- (int)enableEchoCancellationNoiseReduction:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[Communicator ctServerConnection](self, "ctServerConnection")
    || (int result = _CTServerConnectionEchoCancelationAndNoiseReduction( -[Communicator ctServerConnection](self, "ctServerConnection"),  v3,  v3)) != 0)
  {
    uint64_t v6 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679E68(v3, v6, v7, v8, v9, v10, v11, v12);
    }
    return 2;
  }

  return result;
}

- (int)addVirtualCall
{
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  -[Communicator calls](self, "calls");
  v17[0] = 0LL;
  v17[1] = 0LL;
  BOOL v3 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v17);
  id v4 = sub_10053C584(&v14, v3);
  if (v15 == v4)
  {
    memset(&__p, 0, sizeof(__p));
    memset(v12, 0, sizeof(v12));
    sub_1003EC71C((uint64_t)v12, v3);
    *(_DWORD *)&v12[16] = 7;
    *(_DWORD *)&v12[8] = 1;
    *(_WORD *)&v12[12] = 1;
    id v6 = objc_claimAutoreleasedReturnValue(-[Communicator _myNumber](self, "_myNumber"));
    sub_10054A384(&__str, [v6 UTF8String]);
    sub_10054A44C((std::string *)&v12[24], (uint64_t)&__str);
    sub_10054A428(&__str);

    id v7 = sub_1002E95B8(@"MY_NUMBER", @"My Number");
    id v8 = objc_claimAutoreleasedReturnValue(v7);
    sub_10002418C(&__str, (char *)[v8 UTF8String]);
    std::string::operator=(&__p, &__str);

    if (v14 != v15)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
        sub_100679EE4();
      }
      sub_10053C4B4((uint64_t *)&v14);
    }

    sub_10053C464((uint64_t *)&v14, (uint64_t)v12);
    sub_10053C460((int)v10);
    -[Communicator setCalls:](self, "setCalls:", v10);
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
    sub_1002077E0((void ***)&__str);
    sub_10054A428(&v12[24]);

    int v5 = 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679F10();
    }
    int v5 = 15;
  }

  *(void *)uint64_t v12 = &v14;
  sub_1002077E0((void ***)v12);
  return v5;
}

- (int)removeVirtualCall
{
  id v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  -[Communicator calls](self, "calls");
  v12[0] = 0LL;
  v12[1] = 0LL;
  BOOL v3 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v12);
  id v4 = sub_10053C584(&v8, v3);
  if (v9 == v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_100679F3C();
    }
    int v5 = 15;
  }

  else
  {
    sub_10053C504((uint64_t)&v8, v4);
    sub_10053C460((int)v7);
    -[Communicator setCalls:](self, "setCalls:", v7);
    uint64_t v11 = (void **)v7;
    sub_1002077E0(&v11);
    int v5 = 0;
  }

  v12[0] = (void **)&v8;
  sub_1002077E0(v12);
  return v5;
}

- (int)getCurrentCalls:(void *)a3
{
  if (&v5 != a3) {
    sub_10020789C((uint64_t)a3, v5, v6, 0x4EC4EC4EC4EC4EC5LL * ((v6 - v5) >> 3));
  }
  id v7 = (void **)&v5;
  sub_1002077E0(&v7);
  return 0;
}

- (int)getCurrentExpanseCalls:(void *)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  -[Communicator calls](self, "calls");
  id v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  sub_10053C3D8(&v7);
  uint64_t v5 = v10;
  uint64_t v4 = v11;
  while (v5 != v4)
  {
    if (*(_BYTE *)(v5 + 14))
    {
      sub_10053C464((uint64_t *)&v7, v5);
      uint64_t v4 = v11;
    }

    v5 += 104LL;
  }

  if (&v7 != a3) {
    sub_10020789C((uint64_t)a3, (uint64_t)v7, v8, 0x4EC4EC4EC4EC4EC5LL * ((v8 - (uint64_t)v7) >> 3));
  }
  uint64_t v13 = &v7;
  sub_1002077E0((void ***)&v13);
  id v7 = (void **)&v10;
  sub_1002077E0(&v7);
  return 0;
}

- (int)setScreeningCall:(id)a3 isScreening:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _callForIdentifier:](self, "_callForIdentifier:", v6));
  if (v7)
  {
    uint64_t v8 = (os_log_s *)qword_1008F75E8;
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v4;
      LOWORD(v18) = 2112;
      *(void *)((char *)&v18 + 2) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Screening:%d Call:%@", buf, 0x12u);
    }

    -[Communicator _updateCalls](self, "_updateCalls");
    *(void *)buf = 0LL;
    __int128 v18 = 0uLL;
    -[Communicator calls](self, "calls");
    uint64_t v9 = sub_10053C584((id **)buf, v6);
    if ((id *)v18 != v9)
    {
      uint64_t v10 = (os_log_s *)qword_1008F75E8;
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found Call. Updating State", v16, 2u);
      }

      *((_BYTE *)v9 + 15) = v4;
      sub_10053C460((int)v15);
      -[Communicator setCalls:](self, "setCalls:", v15);
      *(void *)uint64_t v16 = v15;
      sub_1002077E0((void ***)v16);
      uint64_t v11 = -[Communicator delegate](self, "delegate");
      (*(void (**)(Delegate *, id))v11->var0)(v11, v6);
      *(void *)uint64_t v16 = buf;
      sub_1002077E0((void ***)v16);
      int v12 = 0;
      goto LABEL_11;
    }

    *(void *)uint64_t v16 = buf;
    sub_1002077E0((void ***)v16);
  }

  uint64_t v13 = (os_log_s *)qword_1008F75E8;
  int v12 = 16;
  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
    sub_100679F68((uint64_t)v7, v4, v13);
  }
LABEL_11:

  return v12;
}

- (int)getCurrentScreeningCalls:(void *)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  -[Communicator calls](self, "calls");
  id v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  sub_10053C3D8(&v7);
  uint64_t v5 = v10;
  uint64_t v4 = v11;
  while (v5 != v4)
  {
    if (*(_BYTE *)(v5 + 15))
    {
      sub_10053C464((uint64_t *)&v7, v5);
      uint64_t v4 = v11;
    }

    v5 += 104LL;
  }

  if (&v7 != a3) {
    sub_10020789C((uint64_t)a3, (uint64_t)v7, v8, 0x4EC4EC4EC4EC4EC5LL * ((v8 - (uint64_t)v7) >> 3));
  }
  uint64_t v13 = &v7;
  sub_1002077E0((void ***)&v13);
  id v7 = (void **)&v10;
  sub_1002077E0(&v7);
  return 0;
}

- (int)getOperatorStatus:(void *)a3
{
  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
  {
    *(_OWORD *)uint64_t v11 = 0u;
    __int128 v12 = 0u;
    sub_10002418C(&v11[1], "");
    CFTypeRef cf1 = 0LL;
    if (!_CTServerConnectionGetNetworkSelectionMode( -[Communicator ctServerConnection](self, "ctServerConnection"),  &cf1)
      && CFEqual(cf1, kCTRegistrationNetworkSelectionModeManual))
    {
      LODWORD(v11[0]) = 1;
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getLocalizedOperatorName:v5 error:0]);

    if (v7)
    {
      sub_10002418C(&__p, (char *)[v7 UTF8String]);
      std::string::operator=((std::string *)&v11[1], &__p);
      std::string::operator=((std::string *)((char *)a3 + 8), (const std::string *)&v11[1]);
      *(_DWORD *)a3 = v11[0];
    }

    if (SHIBYTE(v12) < 0)
    {
      operator delete(v11[1]);
      if (v7) {
        return 0;
      }
    }

    else if (v7)
    {
      return 0;
    }
  }

  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
    sub_100679FEC();
  }
  return 2;
}

- (id)getRegistrationStatus
{
  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    id v5 = [v4 copyRegistrationDisplayStatus:v3 error:0];

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 registrationDisplayStatus]);
    id v7 = objc_alloc_init(&OBJC_CLASS___BDRegistrationStatus);
    else {
      uint64_t v8 = (uint64_t)[v6 isEqualToString:kCTRegistrationStatusRegisteredRoaming];
    }
    -[BDRegistrationStatus setService:](v7, "setService:", v8);
    -[BDRegistrationStatus setRoaming:]( v7,  "setRoaming:",  [v6 isEqualToString:kCTRegistrationStatusRegisteredRoaming]);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_10067A018();
    }
    id v7 = 0LL;
  }

  return v7;
}

- (int)getSignalStrength:(int *)a3 mode:(int)a4
{
  if (-[Communicator ctServerConnection](self, "ctServerConnection"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _getSubscriptionContext](self, "_getSubscriptionContext"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getSignalStrengthInfo:v7 error:0]);

    if (a4)
    {
      if (a4 != 1)
      {
LABEL_10:

        return 0;
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bars]);
      int v11 = 20 * [v10 intValue];
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bars]);
      int v11 = [v10 intValue];
    }

    *a3 = v11;

    goto LABEL_10;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
    sub_10067A044();
  }
  return 2;
}

- (int)getSubscriberNumber:(void *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator _myNumber](self, "_myNumber"));
  id v5 = v4;
  if (v4)
  {
    sub_10054A384(v8, [v4 UTF8String]);
    sub_10054A44C((std::string *)a3, (uint64_t)v8);
    sub_10054A428(v8);
    int v6 = 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_10067A070();
    }
    int v6 = 2;
  }

  return v6;
}

- (int)getMobileSubscriberIdentity:(void *)a3
{
  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    && (CFTypeRef arg = 0LL,
        !_CTServerConnectionCopyMobileEquipmentInfo( -[Communicator ctServerConnection](self, "ctServerConnection"),  &arg))
    && (CFAutorelease(arg),
        (Value = (void *)CFDictionaryGetValue((CFDictionaryRef)arg, kCTMobileEquipmentInfoCurrentSubscriberId)) != 0LL))
  {
    std::string::assign( (std::string *)a3, (const std::string::value_type *)[Value UTF8String]);
    return 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_10067A09C();
    }
    return 2;
  }

- (int)getMobileEquipmentIdentity:(void *)a3
{
  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    && (CFTypeRef arg = 0LL,
        !_CTServerConnectionCopyMobileEquipmentInfo( -[Communicator ctServerConnection](self, "ctServerConnection"),  &arg))
    && (CFAutorelease(arg),
        (Value = (void *)CFDictionaryGetValue((CFDictionaryRef)arg, kCTMobileEquipmentInfoCurrentMobileId)) != 0LL))
  {
    std::string::assign( (std::string *)a3, (const std::string::value_type *)[Value UTF8String]);
    return 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_10067A0C8();
    }
    return 2;
  }

- (id)getCountryCodeForIdentifier:(id)a3
{
  id v4 = a3;
  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient")), v5, v5))
  {
    int v6 = objc_autoreleasePoolPush();
    if (!v4
      || (uint64_t v9 = 0LL,
          _CTServerConnectionCopyISOForMCC( -[Communicator ctServerConnection](self, "ctServerConnection"),  v4,  &v9))
      || (id v7 = v9) == 0LL)
    {
      id v7 = 0LL;
    }

    objc_autoreleasePoolPop(v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)getCountryCode
{
  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    || (BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient")), v3, v3))
  {
    id v4 = objc_autoreleasePoolPush();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getCurrentDataSubscriptionContextSync:0]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    id v19 = 0LL;
    id v8 = [v7 copyLastKnownMobileCountryCode:v6 error:&v19];
    id v9 = v19;

    if (v9)
    {
      uint64_t v10 = (os_log_s *)qword_1008F75E8;
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
        sub_10067A0F4((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }

    else
    {
      id v17 = -[Communicator getCountryCodeForIdentifier:](self, "getCountryCodeForIdentifier:", v8);
    }

    objc_autoreleasePoolPop(v4);
  }

  return 0LL;
}

- (id)getCountryCodeIdentifer
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getCurrentDataSubscriptionContextSync:0]);

    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[Communicator ctClient](self, "ctClient"));
    id v17 = 0LL;
    id v7 = [v6 copyMobileCountryCode:v5 error:&v17];
    id v8 = v17;

    if (v8)
    {
      id v9 = (os_log_s *)qword_1008F75E8;
      if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
        sub_10067A0F4((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }

      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (int)getTransmitState:(BOOL *)a3
{
  if (-[Communicator ctServerConnection](self, "ctServerConnection")
    && (CFTypeRef arg = 0LL,
        !_CTServerConnectionCopyCellularTransmitState( -[Communicator ctServerConnection](self, "ctServerConnection"),  &arg))
    && (CFAutorelease(arg), (Value = CFDictionaryGetValue((CFDictionaryRef)arg, kKeyCTCellularTransmitState)) != 0LL))
  {
    int v7 = CFEqual(Value, kCTCellularTransmitStarted);
    int result = 0;
    *a3 = v7 != 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75E8, OS_LOG_TYPE_ERROR)) {
      sub_10067A158();
    }
    return 2;
  }

  return result;
}

- (Delegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(Delegate *)a3
{
  self->_delegate = a3;
}

- (TUCallCenter)tuCallCenter
{
  return self->_tuCallCenter;
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (CallList)calls
{
  return (CallList *)sub_10053C460((int)retstr);
}

- (void)setCalls:(CallList *)a3
{
  p_calls = &self->_calls;
  if (p_calls != a3) {
    sub_10020789C( (uint64_t)p_calls,  (uint64_t)a3->fCalls.__begin_,  (uint64_t)a3->fCalls.__end_,  0x4EC4EC4EC4EC4EC5LL * ((a3->fCalls.__end_ - a3->fCalls.__begin_) >> 3));
  }
}

- (void).cxx_destruct
{
  p_calls = &self->_calls;
  sub_1002077E0((void ***)&p_calls);
  objc_storeStrong((id *)&self->_ctClient, 0LL);
  objc_storeStrong((id *)&self->_tuCallCenter, 0LL);
}

- (id).cxx_construct
{
  return self;
}

@end