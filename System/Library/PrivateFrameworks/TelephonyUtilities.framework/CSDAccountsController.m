@interface CSDAccountsController
- (BOOL)faceTimeIDMatchesAppleID;
- (BOOL)isFaceTimeAudioAvailable;
- (BOOL)isFaceTimeVideoAvailable;
- (BOOL)isValidOutgoingCallerID:(id)a3;
- (CSDAccountsController)init;
- (CSDAccountsControllerDelegate)delegate;
- (NSString)debugDescription;
- (NSString)outgoingCallerID;
- (OS_dispatch_queue)queue;
- (int64_t)_faceTimeAudioAvailability;
- (int64_t)_faceTimeVideoAvailability;
- (void)_updateOutgoingCallerID;
- (void)callerIDChanged:(id)a3;
- (void)dealloc;
- (void)devicesChanged:(id)a3;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)serviceAvailabilityChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOutgoingCallerID:(id)a3;
- (void)updateOutgoingCallerIDAndSendDelegateCallbacksIfNecessary;
@end

@implementation CSDAccountsController

- (CSDAccountsController)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSDAccountsController;
  v2 = -[CSDAccountsController init](&v14, "init");
  if (v2)
  {
    id v3 = sub_1001704C4();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class(v2, v5);
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      id v7 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing %@", buf, 0xCu);
    }

    dispatch_queue_t v8 = dispatch_queue_create( (const char *)[@"com.apple.telephonyutilities.callservicesd.accountscontroller" UTF8String],  0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100062750;
    block[3] = &unk_1003D7730;
    v13 = v2;
    dispatch_async(v10, block);
  }

  return v2;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
  [v3 removeListenerID:@"com.apple.telephonyutilities.callservicesd.accountscontroller" forService:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
  [v4 removeListenerID:@"com.apple.telephonyutilities.callservicesd.accountscontroller" forService:2];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDAccountsController;
  -[CSDAccountsController dealloc](&v6, "dealloc");
}

- (NSString)debugDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@\n",  self));
  unsigned int v4 = -[CSDAccountsController faceTimeIDMatchesAppleID](self, "faceTimeIDMatchesAppleID");
  uint64_t v5 = @"NO";
  if (v4) {
    uint64_t v5 = @"YES";
  }
  [v3 appendFormat:@"    faceTimeIDMatchesAppleID: %@\n", v5];
  objc_msgSend( v3,  "appendFormat:",  @"    faceTimeAudioAvailability: %ld\n",  -[CSDAccountsController _faceTimeAudioAvailability](self, "_faceTimeAudioAvailability"));
  objc_msgSend( v3,  "appendFormat:",  @"    faceTimeVideoAvailability: %ld\n",  -[CSDAccountsController _faceTimeVideoAvailability](self, "_faceTimeVideoAvailability"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAccountsController outgoingCallerID](self, "outgoingCallerID"));
  [v3 appendFormat:@"    outgoingCallerID: %@\n", v6];

  return (NSString *)v3;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAccountsController queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Active accounts changed for service %@: %@",  (uint8_t *)&v12,  0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAccountsController delegate](self, "delegate"));
  [v11 accountsChanged];

  -[CSDAccountsController updateOutgoingCallerIDAndSendDelegateCallbacksIfNecessary]( self,  "updateOutgoingCallerIDAndSendDelegateCallbacksIfNecessary");
}

- (void)callerIDChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAccountsController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100062D20;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)serviceAvailabilityChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAccountsController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100062E64;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)devicesChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAccountsController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100062FB8;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)faceTimeIDMatchesAppleID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeVideoIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeVideoIDSService,  "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 service]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAccount]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudAccount]);

  if ([v4 isActive] && objc_msgSend(v7, "isActive"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 profileID]);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 profileID]);
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v4 profileID]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v7 profileID]);
        unsigned __int8 v12 = [v10 isEqualToIgnoringCase:v11];
      }

      else
      {
        unsigned __int8 v12 = 0;
      }
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  id v13 = sub_1001704C4();
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = [v4 isActive];
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 profileID]);
    unsigned int v17 = [v7 isActive];
    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 profileID]);
    int v20 = 138413570;
    v21 = v4;
    __int16 v22 = 1024;
    unsigned int v23 = v15;
    __int16 v24 = 2112;
    v25 = v16;
    __int16 v26 = 2112;
    v27 = v7;
    __int16 v28 = 1024;
    unsigned int v29 = v17;
    __int16 v30 = 2112;
    v31 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "FaceTime iCloud account is %@ (isActive=%d, profileID=%@) and relay iCloud account is %@ (isActive=%d, profileID=%@)",  (uint8_t *)&v20,  0x36u);
  }

  return v12;
}

- (BOOL)isFaceTimeAudioAvailable
{
  return (id)-[CSDAccountsController _faceTimeAudioAvailability](self, "_faceTimeAudioAvailability") == (id)1;
}

- (BOOL)isFaceTimeVideoAvailable
{
  return (id)-[CSDAccountsController _faceTimeVideoAvailability](self, "_faceTimeVideoAvailability") == (id)1;
}

- (NSString)outgoingCallerID
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_1000633AC;
  v11 = sub_1000633BC;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAccountsController queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000633C4;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (int64_t)_faceTimeAudioAvailability
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
  id v3 = [v2 availabilityForListenerID:@"com.apple.telephonyutilities.callservicesd.accountscontroller" forService:2];

  return (int64_t)v3;
}

- (int64_t)_faceTimeVideoAvailability
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[FTCServiceAvailabilityCenter sharedInstance]( &OBJC_CLASS___FTCServiceAvailabilityCenter,  "sharedInstance"));
  id v3 = [v2 availabilityForListenerID:@"com.apple.telephonyutilities.callservicesd.accountscontroller" forService:0];

  return (int64_t)v3;
}

- (void)updateOutgoingCallerIDAndSendDelegateCallbacksIfNecessary
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAccountsController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000634D4;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_updateOutgoingCallerID
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAccountsController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeVideoIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeVideoIDSService,  "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 callerID]);

  if (-[CSDAccountsController isValidOutgoingCallerID:](self, "isValidOutgoingCallerID:", v5))
  {
    id v6 = (NSString *)[v5 copy];
    outgoingCallerID = self->_outgoingCallerID;
    self->_outgoingCallerID = v6;

    goto LABEL_26;
  }

  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = (NSString *)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "FaceTime caller ID %@ is not a valid outgoing relay caller ID",  buf,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue([v10 availableOutgoingRelayCallerIDs]);

  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Attempting to find a valid outgoing caller ID in set of available outgoing caller IDs %@",  buf,  0xCu);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000639F8;
  v36[3] = &unk_1003D8358;
  v36[4] = self;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSString objectsPassingTest:](v11, "objectsPassingTest:", v36));
  if ([v14 count] == (id)1)
  {
    unsigned int v15 = (NSString *)objc_claimAutoreleasedReturnValue([v14 anyObject]);
    id v16 = sub_1001704C4();
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v15;
      __int16 v39 = 2112;
      v40 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Selected outgoing caller ID %@ from list of available outgoing caller IDs %@",  buf,  0x16u);
    }

    if (v15) {
      goto LABEL_25;
    }
  }

  else
  {
    id v18 = sub_1001704C4();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Could not automatically select an outgoing caller ID; multiple telephone numbers are listed in the set of availa"
        "ble outgoing caller IDs %@",
        buf,
        0xCu);
    }
  }

  int v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeVideoIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeVideoIDSService,  "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 account]);
  __int16 v22 = (NSString *)objc_claimAutoreleasedReturnValue([v21 vettedAliases]);

  id v23 = sub_1001704C4();
  __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Attempting to find a valid outgoing caller ID in list of vetted account aliases %@",  buf,  0xCu);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100063A04;
  v35[3] = &unk_1003D8380;
  v35[4] = self;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSString indexesOfObjectsPassingTest:](v22, "indexesOfObjectsPassingTest:", v35));
  id v26 = [v25 count];
  id v27 = sub_1001704C4();
  __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v26 == (id)1)
  {
    if (v29)
    {
      *(_DWORD *)buf = 138412546;
      v38 = 0LL;
      __int16 v39 = 2112;
      v40 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Selected outgoing caller ID %@ from list of vetted account aliases %@",  buf,  0x16u);
    }

    unsigned int v15 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSString objectAtIndexedSubscript:]( v22,  "objectAtIndexedSubscript:",  [v25 firstIndex]));
  }

  else
  {
    if (v29)
    {
      *(_DWORD *)buf = 138412290;
      v38 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Could not automatically select an outgoing caller ID; multiple telephone numbers are listed in the set of vetted"
        " account aliases IDs %@",
        buf,
        0xCu);
    }

    unsigned int v15 = 0LL;
  }

LABEL_25:
  __int16 v30 = (NSString *)-[NSString copy](v15, "copy");
  v31 = self->_outgoingCallerID;
  self->_outgoingCallerID = v30;

LABEL_26:
  id v32 = sub_1001704C4();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = self->_outgoingCallerID;
    *(_DWORD *)buf = 138412290;
    v38 = v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Outgoing Caller ID is %@", buf, 0xCu);
  }
}

- (BOOL)isValidOutgoingCallerID:(id)a3
{
  id v3 = a3;
  if (qword_10044CED8 != -1) {
    dispatch_once(&qword_10044CED8, &stru_1003D83A0);
  }
  if ([v3 length]) {
    char v4 = off_10044CED0(v3);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (CSDAccountsControllerDelegate)delegate
{
  return (CSDAccountsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)setOutgoingCallerID:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end