@interface PDIssuerBindingManager
- (BOOL)_isIssuerBindingAvailable;
- (PDIssuerBindingManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 notificationMananger:(id)a5 notificationStreamManager:(id)a6 webServiceCoordinator:(id)a7 paymentWebServiceCoordinator:(id)a8 secureElement:(id)a9;
- (id)createCurrentNotificationRegistrationState;
- (void)_sendGenericUserNotificationForStateUpdate:(unint64_t)a3;
- (void)_sendUserNotificationForStateUpdate:(unint64_t)a3 forPass:(id)a4;
- (void)_updateActivatingCheckSchedule;
- (void)_updateIssuerBindingAvailability;
- (void)_updateNFCPayloadState:(unint64_t)a3 forPassUniqueIdentifier:(id)a4 notify:(BOOL)a5;
- (void)_verifyActivatingPasses;
- (void)_verifyAllPasses;
- (void)_verifyIssuerBindingInformationForPassUniqueIdentifier:(id)a3 passIngestionDate:(id)a4 fidoProfile:(id)a5 signedChallenge:(id)a6 forFirstTime:(BOOL)a7;
- (void)dealloc;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)noteAccountAdded;
- (void)noteAccountRemoved;
- (void)passAddedOrUpdated:(id)a3 passAdded:(BOOL)a4;
- (void)passRemoved:(id)a3;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)registerObserver:(id)a3;
- (void)requestIssuerBoundPassesWithBindingWithData:(id)a3 withCompletion:(id)a4;
- (void)scheduleVerifyAllIssuerBoundPassesActivity;
- (void)unregisterObserver:(id)a3;
- (void)updateNFCPayloadState:(unint64_t)a3 forPass:(id)a4;
@end

@implementation PDIssuerBindingManager

- (PDIssuerBindingManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 notificationMananger:(id)a5 notificationStreamManager:(id)a6 webServiceCoordinator:(id)a7 paymentWebServiceCoordinator:(id)a8 secureElement:(id)a9
{
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v16 = a8;
  id v17 = a9;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___PDIssuerBindingManager;
  v18 = -[PDIssuerBindingManager init](&v34, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_cardFileManager, a4);
    objc_storeStrong((id *)&v19->_secureElement, a9);
    objc_storeStrong((id *)&v19->_webServiceCoordinator, a7);
    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a8);
    -[PDPaymentWebServiceCoordinator registerObserver:](v19->_paymentWebServiceCoordinator, "registerObserver:", v19);
    objc_storeStrong((id *)&v19->_notificationMananger, a5);
    objc_storeStrong((id *)&v19->_notificationStreamManager, a6);
    -[PDNotificationStreamManager registerConsumer:](v19->_notificationStreamManager, "registerConsumer:", v19);
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v20;

    v19->_observersLock._os_unfair_lock_opaque = 0;
    v19->_lock._os_unfair_lock_opaque = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PKAppleAccountManager sharedInstance](&OBJC_CLASS___PKAppleAccountManager, "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 appleAccountInformation]);
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 creationDate]);
    lastAccountAddedDate = v19->_lastAccountAddedDate;
    v19->_lastAccountAddedDate = (NSDate *)v24;

    v19->_isIssuerBindingSupported = -[PDIssuerBindingManager _isIssuerBindingAvailable]( v19,  "_isIssuerBindingAvailable");
    id v26 = PDHeavyQueue();
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    PDScheduledActivityClientRegister(@"PDIssuerBindingManager", v19, v27);
  }

  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDIssuerBindingManager;
  -[PDIssuerBindingManager dealloc](&v3, "dealloc");
}

- (void)requestIssuerBoundPassesWithBindingWithData:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  uint64_t v114 = 0LL;
  v115 = (id *)&v114;
  uint64_t v116 = 0x3032000000LL;
  v117 = sub_1003812D8;
  v118 = sub_1003812E8;
  id v119 = 0LL;
  os_unfair_lock_lock(&self->_lock);
  BOOL isIssuerBindingSupported = self->_isIssuerBindingSupported;
  os_unfair_lock_unlock(&self->_lock);
  if (isIssuerBindingSupported)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(35LL);
    v10 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(Object);
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  v12,  "passIssuerData:generate",  "",  (uint8_t *)&buf,  2u);
      }
    }

    v13 = v115;
    id v113 = v115[5];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  &v113));
    objc_storeStrong(v13 + 5, v113);
    id v15 = v115[5];
    if (v15 || !v14)
    {
      uint64_t v27 = PKLogFacilityTypeGetObject(43LL);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Pass Issuer Data Generation -  unable to parse issuerData error: %@",  (uint8_t *)&buf,  0xCu);
      }

      uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKIssuerBindingErrorDomain,  2LL,  0LL));
      id v30 = v115[5];
      v115[5] = (id)v29;

      v7[2](v7, 0LL, v115[5]);
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 PKStringForKey:@"sessionIdentifier"]);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v14 PKStringForKey:@"callbackURL"]);
      id v17 = objc_alloc(&OBJC_CLASS___PKFidoProfile);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"fidoProfile"]);
      v56 = -[PKFidoProfile initWithDictionary:](v17, "initWithDictionary:", v18);

      v58 = (void *)objc_claimAutoreleasedReturnValue([v56 relyingPartyIdentifier]);
      v57 = (void *)objc_claimAutoreleasedReturnValue([v56 accountHash]);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v121 = 0x3032000000LL;
      v122 = sub_1003812D8;
      v123 = sub_1003812E8;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v56 keyHash]);
      id v124 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pk_decodeHexadecimal"));

      if (v58 && v57)
      {
        if (PKHasVerifiedPrimaryAppleAccount(v20, v21))
        {
          uint64_t v22 = PKPrimaryAppleAccountFormattedUsername();
          v54 = (void *)objc_claimAutoreleasedReturnValue(v22);
        }

        else
        {
          v54 = 0LL;
        }

        v53 = (void *)objc_claimAutoreleasedReturnValue([v14 PKStringForKey:@"displayableName"]);
        if (v54)
        {
          v111[0] = 0LL;
          v111[1] = v111;
          v111[2] = 0x2020000000LL;
          char v112 = 1;
          *(void *)v105 = 0LL;
          v106 = v105;
          uint64_t v107 = 0x3032000000LL;
          v108 = sub_1003812D8;
          v109 = sub_1003812E8;
          id v110 = 0LL;
          v103[0] = 0LL;
          v103[1] = v103;
          v103[2] = 0x3032000000LL;
          v103[3] = sub_1003812D8;
          v103[4] = sub_1003812E8;
          id v104 = 0LL;
          v101[0] = 0LL;
          v101[1] = v101;
          v101[2] = 0x3032000000LL;
          v101[3] = sub_1003812D8;
          v101[4] = sub_1003812E8;
          id v102 = 0LL;
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 UUIDString]);
          v37 = (void *)objc_claimAutoreleasedReturnValue([v36 dataUsingEncoding:4]);

          id v51 = v6;
          v52 = v16;
          id v38 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
          v100[0] = _NSConcreteStackBlock;
          v100[1] = 3221225472LL;
          v100[2] = sub_1003812F0;
          v100[3] = &unk_10063BBC8;
          v100[4] = self;
          v100[5] = &v114;
          [v38 addOperation:v100];
          v93[0] = _NSConcreteStackBlock;
          v93[1] = 3221225472LL;
          v93[2] = sub_100381490;
          v93[3] = &unk_100658BA0;
          v97 = v103;
          id v94 = v53;
          id v95 = v54;
          v96 = self;
          v98 = v105;
          v99 = &v114;
          [v38 addOperation:v93];
          v88[0] = _NSConcreteStackBlock;
          v88[1] = 3221225472LL;
          v88[2] = sub_100381880;
          v88[3] = &unk_100643EC8;
          p___int128 buf = &buf;
          v88[4] = self;
          id v39 = v58;
          id v89 = v39;
          id v40 = v57;
          id v90 = v40;
          v92 = v111;
          [v38 addOperation:v88];
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472LL;
          v81[2] = sub_10038199C;
          v81[3] = &unk_100658BF0;
          v85 = v111;
          v81[4] = self;
          id v41 = v39;
          id v82 = v41;
          id v42 = v40;
          id v83 = v42;
          id v43 = v37;
          id v84 = v43;
          v86 = &buf;
          v87 = &v114;
          [v38 addOperation:v81];
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472LL;
          v73[2] = sub_100381C34;
          v73[3] = &unk_100658C40;
          v73[4] = self;
          id v74 = v41;
          id v75 = v42;
          v77 = &buf;
          id v44 = v43;
          id v76 = v44;
          v78 = v105;
          v79 = v101;
          v80 = &v114;
          [v38 addOperation:v73];
          v71[0] = 0LL;
          v71[1] = v71;
          v71[2] = 0x3032000000LL;
          v71[3] = sub_1003812D8;
          v71[4] = sub_1003812E8;
          id v72 = 0LL;
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472LL;
          v63[2] = sub_100381E94;
          v63[3] = &unk_100658C90;
          id v64 = v52;
          v67 = &buf;
          v68 = v101;
          id v65 = v55;
          v66 = self;
          v69 = v71;
          v70 = &v114;
          [v38 addOperation:v63];
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_10038219C;
          v59[3] = &unk_100658CB8;
          v61 = &v114;
          v60 = v7;
          v62 = v71;
          id v46 = [v38 evaluateWithInput:v45 completion:v59];

          id v6 = v51;
          id v16 = v52;

          _Block_object_dispose(v71, 8);
          _Block_object_dispose(v101, 8);

          _Block_object_dispose(v103, 8);
          _Block_object_dispose(v105, 8);

          _Block_object_dispose(v111, 8);
        }

        else
        {
          uint64_t v47 = PKLogFacilityTypeGetObject(43LL);
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v105 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Pass Issuer Data Generation -  could not get account",  v105,  2u);
          }

          uint64_t v49 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKIssuerBindingErrorDomain,  1LL,  0LL));
          id v50 = v115[5];
          v115[5] = (id)v49;

          v7[2](v7, 0LL, v115[5]);
        }
      }

      else
      {
        uint64_t v31 = PKLogFacilityTypeGetObject(43LL);
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v105 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Pass Issuer Data Generation -  valid fido profile not supplied",  v105,  2u);
        }

        uint64_t v33 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  2LL,  0LL));
        id v34 = v115[5];
        v115[5] = (id)v33;

        v7[2](v7, 0LL, v115[5]);
      }

      _Block_object_dispose(&buf, 8);
    }
  }

  else
  {
    uint64_t v23 = PKLogFacilityTypeGetObject(43LL);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Pass Issuer Data Generation - Issuer Binding Not Supported.",  (uint8_t *)&buf,  2u);
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKIssuerBindingErrorDomain,  8LL,  0LL));
    id v26 = v115[5];
    v115[5] = (id)v25;

    v7[2](v7, 0LL, v115[5]);
  }

  _Block_object_dispose(&v114, 8);
}

- (void)scheduleVerifyAllIssuerBoundPassesActivity
{
  if ((PDScheduledActivityExists(@"PDIssuerBindingManager", @"checkAllPasses") & 1) != 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(43LL);
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Verify all bound passes activity already exists",  buf,  2u);
    }
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "priorityActivityCriteriaWithStartDate:",  0LL));
    [v4 setRepeating:1];
    [v4 setRequireScreenSleep:1];
    [v4 setRequireMainsPower:1];
    [v4 setRepeatInterval:86400.0];
    [v4 setReason:@"check all bound passes"];
    PDScheduledActivityRegister(@"PDIssuerBindingManager", @"checkAllPasses", v4);
  }

- (void)_verifyAllPasses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isVerifyingAllPasses)
  {
    os_unfair_lock_unlock(p_lock);
    uint64_t Object = PKLogFacilityTypeGetObject(43LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Verification of all passess processing - coalescing",  buf,  2u);
    }
  }

  else
  {
    self->_isVerifyingAllPasses = 1;
    os_unfair_lock_unlock(p_lock);
    id v6 = PDHeavyQueue();
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003823D0;
    block[3] = &unk_100639300;
    block[4] = self;
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v7, v8);
  }

- (void)passAddedOrUpdated:(id)a3 passAdded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL isIssuerBindingSupported = self->_isIssuerBindingSupported;
  os_unfair_lock_unlock(&self->_lock);
  unsigned int v8 = [v6 supportsIssuerBinding];
  if (!isIssuerBindingSupported || v8 == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    uint64_t Object = PKLogFacilityTypeGetObject(43LL);
    os_signpost_id_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      uint64_t v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Skipping issuer binding validation for pass and marking as valid:%@",  (uint8_t *)&v19,  0xCu);
    }

    -[PDIssuerBindingManager _updateNFCPayloadState:forPassUniqueIdentifier:notify:]( self,  "_updateNFCPayloadState:forPassUniqueIdentifier:notify:",  0LL,  v10,  0LL);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 issuerBindingInformation]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 PKStringForKey:@"issuerBindingData"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pk_decodeHexadecimal"));

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 ingestedDate]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 fidoProfile]);
    -[PDIssuerBindingManager _verifyIssuerBindingInformationForPassUniqueIdentifier:passIngestionDate:fidoProfile:signedChallenge:forFirstTime:]( self,  "_verifyIssuerBindingInformationForPassUniqueIdentifier:passIngestionDate:fidoProfile:signedChallenge:forFirstTime:",  v16,  v17,  v18,  v15,  v4);
  }
}

- (void)passRemoved:(id)a3
{
}

- (void)noteAccountAdded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[PKAppleAccountManager sharedInstance](&OBJC_CLASS___PKAppleAccountManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appleAccountInformation]);
  id v6 = (NSDate *)objc_claimAutoreleasedReturnValue([v5 creationDate]);
  lastAccountAddedDate = self->_lastAccountAddedDate;
  self->_lastAccountAddedDate = v6;

  os_unfair_lock_unlock(p_lock);
  -[PDIssuerBindingManager _verifyAllPasses](self, "_verifyAllPasses");
}

- (void)noteAccountRemoved
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastAccountAddedDate = self->_lastAccountAddedDate;
  self->_lastAccountAddedDate = 0LL;

  BOOL isIssuerBindingSupported = self->_isIssuerBindingSupported;
  os_unfair_lock_unlock(p_lock);
  if (isIssuerBindingSupported)
  {
    id v6 = PDHeavyQueue();
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003828CC;
    block[3] = &unk_100639300;
    block[4] = self;
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v7, v8);
  }

- (void)registerObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }

- (void)unregisterObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
  }

- (BOOL)_isIssuerBindingAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 targetDevice]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v2 context]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 targetDevice]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceRegion]);
  dispatch_block_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 featureWithType:11 inRegion:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 versionRange]);
  if (!v8) {
    goto LABEL_5;
  }
  if (![v8 enabled])
  {
    unsigned __int8 v12 = 0;
    goto LABEL_7;
  }

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceVersion]);
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceClass]);
    unsigned __int8 v12 = [v9 versionMeetsRequirements:v10 deviceClass:v11];
  }

  else
  {
LABEL_5:
    unsigned __int8 v12 = 1;
  }

- (void)_verifyIssuerBindingInformationForPassUniqueIdentifier:(id)a3 passIngestionDate:(id)a4 fidoProfile:(id)a5 signedChallenge:(id)a6 forFirstTime:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v24 = a5;
  id v14 = a6;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "aa_primaryAppleAccount"));

  if (v16)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100382F18;
    v36[3] = &unk_1006396D8;
    v36[4] = self;
    [v17 addOperation:v36];
    v18 = v13;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x2020000000LL;
    char v39 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100382FDC;
    v31[3] = &unk_10063EE70;
    v31[4] = self;
    id v32 = v14;
    id v33 = v24;
    id v19 = v12;
    id v34 = v19;
    p___int128 buf = &buf;
    [v17 addOperation:v31];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100383208;
    v25[3] = &unk_100658D08;
    uint64_t v29 = &buf;
    id v26 = v18;
    uint64_t v27 = self;
    BOOL v30 = a7;
    id v28 = v19;
    id v21 = [v17 evaluateWithInput:v20 completion:v25];

    id v13 = v18;
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(43LL);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Account missing marking pass: %@ invalid",  (uint8_t *)&buf,  0xCu);
    }

    -[PDIssuerBindingManager _updateNFCPayloadState:forPassUniqueIdentifier:notify:]( self,  "_updateNFCPayloadState:forPassUniqueIdentifier:notify:",  2LL,  v12,  1LL,  v24);
  }
}

- (void)updateNFCPayloadState:(unint64_t)a3 forPass:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a4 uniqueID]);
  -[PDIssuerBindingManager _updateNFCPayloadState:forPassUniqueIdentifier:notify:]( self,  "_updateNFCPayloadState:forPassUniqueIdentifier:notify:",  a3,  v6,  1LL);
}

- (void)_updateNFCPayloadState:(unint64_t)a3 forPassUniqueIdentifier:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(43LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v20 = v8;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Updating NFC Payload State for pass: %@ with newState: %lu",  buf,  0x16u);
  }

  buf[0] = 0;
  -[PDDatabaseManager updateNFCPayloadState:forPassUniqueIdentifier:didChange:]( self->_databaseManager,  "updateNFCPayloadState:forPassUniqueIdentifier:didChange:",  a3,  v8,  buf);
  if (buf[0])
  {
    os_unfair_lock_lock(&self->_observersLock);
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(&self->_observersLock);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passWithUniqueIdentifier:]( self->_databaseManager,  "passWithUniqueIdentifier:",  v8));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1003834D4;
    v17[3] = &unk_100658D30;
    id v13 = v12;
    id v18 = v13;
    id v14 = [v11 enumerateObjectsUsingBlock:v17];
    if (v5)
    {
      uint64_t v16 = PKIsPhone(v14, v15);
      if ((v16 & 1) != 0 || PKIsWatch(v16)) {
        -[PDIssuerBindingManager _sendUserNotificationForStateUpdate:forPass:]( self,  "_sendUserNotificationForStateUpdate:forPass:",  a3,  v13);
      }
    }
  }
}

- (void)_sendUserNotificationForStateUpdate:(unint64_t)a3 forPass:(id)a4
{
  id v15 = a4;
  id v6 = @"ISSUER_DATA_BINDING_NOTIFICATION_PASS_ENABLED_MESSAGE";
  v7 = @"ISSUER_DATA_BINDING_NOTIFICATION_PASS_ENABLED_TITLE";
  switch(a3)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      id v6 = @"ISSUER_DATA_BINDING_NOTIFICATION_MISMATCH_MESSAGE";
      goto LABEL_5;
    case 2uLL:
      id v6 = @"ISSUER_DATA_BINDING_NOTIFICATION_ACCOUNT_MISSING_MESSAGE";
LABEL_5:
      v7 = @"ISSUER_DATA_BINDING_NOTIFICATION_PASS_DISABLED_TITLE";
LABEL_6:
      uint64_t v10 = PKLocalizedPaymentString(&v7->isa);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v11 = PKLocalizedPaymentString(&v6->isa);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_7;
    case 3uLL:
      goto LABEL_8;
    default:
      id v8 = 0LL;
      v9 = 0LL;
LABEL_7:
      id v12 = objc_alloc(&OBJC_CLASS___PDNFCPayloadStateUpdateUserNotification);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
      id v14 = -[PDNFCPayloadStateUpdateUserNotification initWithTitle:message:forPassUniqueIdentifier:]( v12,  "initWithTitle:message:forPassUniqueIdentifier:",  v9,  v8,  v13);

      -[PDUserNotificationManager insertUserNotification:](self->_notificationMananger, "insertUserNotification:", v14);
LABEL_8:

      return;
  }

- (void)_sendGenericUserNotificationForStateUpdate:(unint64_t)a3
{
  if (a3 == 2)
  {
    BOOL v4 = objc_alloc(&OBJC_CLASS___PDNFCPayloadStateUpdateUserNotification);
    uint64_t v5 = PKLocalizedPaymentString(@"ISSUER_DATA_BINDING_NOTIFICATION_PASSES_DISABLED_TITLE");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = PKLocalizedPaymentString(@"ISSUER_DATA_BINDING_NOTIFICATION_ACCOUNT_MISSING_MESSAGE_MULTIPLE");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = -[PDGenericUserNotification initWithTitle:message:](v4, "initWithTitle:message:", v6, v8);

    -[PDUserNotificationManager insertUserNotification:](self->_notificationMananger, "insertUserNotification:", v9);
  }

- (void)_verifyActivatingPasses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isVerifyingActivatingPasses)
  {
    self->_didDeferWork = 1;
    os_unfair_lock_unlock(p_lock);
    uint64_t Object = PKLogFacilityTypeGetObject(43LL);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Verification already processing - coalescing",  buf,  2u);
    }
  }

  else
  {
    self->_didDeferWork = 0;
    self->_isVerifyingActivatingPasses = 1;
    os_unfair_lock_unlock(p_lock);
    id v6 = PDHeavyQueue();
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003837D0;
    block[3] = &unk_100639300;
    block[4] = self;
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v7, v8);
  }

- (void)_updateIssuerBindingAvailability
{
  BOOL v3 = -[PDIssuerBindingManager _isIssuerBindingAvailable](self, "_isIssuerBindingAvailable");
  os_unfair_lock_lock(&self->_lock);
  if (v3)
  {
    if (!self->_isIssuerBindingSupported)
    {
      self->_BOOL isIssuerBindingSupported = v3;
      os_unfair_lock_unlock(&self->_lock);
      id v4 = PDHeavyQueue();
      uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100383CE0;
      v11[3] = &unk_100639300;
      v11[4] = self;
      id v6 = v11;
LABEL_8:
      dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, v6);
      dispatch_async(v5, v10);

      return;
    }
  }

  else if (self->_isIssuerBindingSupported)
  {
    self->_BOOL isIssuerBindingSupported = v3;
    os_unfair_lock_unlock(&self->_lock);
    uint64_t Object = PKLogFacilityTypeGetObject(43LL);
    dispatch_block_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Issuer binding disabled by config change - marking all passes as valid",  buf,  2u);
    }

    id v9 = PDHeavyQueue();
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100383BC0;
    block[3] = &unk_100639300;
    block[4] = self;
    id v6 = block;
    goto LABEL_8;
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_updateActivatingCheckSchedule
{
  id v3 = PDHeavyQueue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100383F04;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
  dispatch_async(v4, v5);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"checkActivatingPasses"])
  {
    -[PDIssuerBindingManager _verifyActivatingPasses](self, "_verifyActivatingPasses");
  }

  else if ([v5 isEqualToString:@"checkAllPasses"])
  {
    -[PDIssuerBindingManager _verifyAllPasses](self, "_verifyAllPasses");
  }
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(&OBJC_CLASS___PDNotificationStreamRegistrationState);
  id v3 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"com.apple.security.view-change.ApplePay",  @"com.apple.seserviced.keysync.fido.tlk.synced",  0LL);
  -[PDNotificationStreamRegistrationState setNotificationNames:forStream:]( v2,  "setNotificationNames:forStream:",  v3,  0LL);

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v6 = a3;
  if ((PKEqualObjects(v6, @"com.apple.seserviced.keysync.fido.tlk.synced") & 1) != 0
    || PKEqualObjects(v6, @"com.apple.security.view-change.ApplePay"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(22LL);
    dispatch_block_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PDIssuerBindingManager: did recieve underlying key update notification",  v9,  2u);
    }

    -[PDIssuerBindingManager _verifyAllPasses](self, "_verifyAllPasses");
  }
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
}

- (void).cxx_destruct
{
}

@end