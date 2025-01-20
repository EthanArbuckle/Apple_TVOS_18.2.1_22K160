@interface KTEnrollmentRegistrationSignature
- (BOOL)forceUpdate;
- (KTCheckIDSRegistrationInterface)idsRegistrationInterface;
- (KTEnrollmentRegistrationSignature)initWithDependencies:(id)a3 forceUpdate:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6 idsRegistrationInterface:(id)a7 signatureTracker:(id)a8;
- (KTOperationDependencies)deps;
- (KTSignatureTracker)signatureTracker;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (void)groupStart;
- (void)recordKeyState:(int)a3 application:(id)a4;
- (void)setDeps:(id)a3;
- (void)setForceUpdate:(BOOL)a3;
- (void)setIdsRegistrationInterface:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSignatureTracker:(id)a3;
@end

@implementation KTEnrollmentRegistrationSignature

- (KTEnrollmentRegistrationSignature)initWithDependencies:(id)a3 forceUpdate:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6 idsRegistrationInterface:(id)a7 signatureTracker:(id)a8
{
  BOOL v11 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KTEnrollmentRegistrationSignature;
  v17 = -[KTGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    -[KTEnrollmentRegistrationSignature setDeps:](v17, "setDeps:", v13);
    -[KTEnrollmentRegistrationSignature setForceUpdate:](v18, "setForceUpdate:", v11);
    -[KTEnrollmentRegistrationSignature setNextState:](v18, "setNextState:", v14);
    -[KTEnrollmentRegistrationSignature setIdsRegistrationInterface:](v18, "setIdsRegistrationInterface:", v15);
    -[KTEnrollmentRegistrationSignature setSignatureTracker:](v18, "setSignatureTracker:", v16);
    v19 = v18;
  }

  return v18;
}

- (void)recordKeyState:(int)a3 application:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v10 logger]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TBS-%@-%@",  @"k",  v6));

  [v7 setNumberProperty:v8 forKey:v9];
}

- (void)groupStart
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x2020000000LL;
  char v68 = 0;
  v3 = objc_alloc_init(&OBJC_CLASS___KDeviceSet);
  uint64_t v61 = 0LL;
  v62 = &v61;
  uint64_t v63 = 0x2020000000LL;
  char v64 = 0;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountOperations]);
  id v60 = 0LL;
  v44 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryAccount:&v60]);
  id v42 = v60;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "aa_altDSID"));
  if (!v6)
  {
    if (qword_1002EEAA0 != -1) {
      dispatch_once(&qword_1002EEAA0, &stru_1002851F0);
    }
    v7 = (os_log_s *)qword_1002EEAA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v71 = v42;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Can't get AltDSID: %@", buf, 0xCu);
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "aa_personID"));
  if (!v8)
  {
    if (qword_1002EEAA0 != -1) {
      dispatch_once(&qword_1002EEAA0, &stru_100285210);
    }
    v9 = (os_log_s *)qword_1002EEAA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEAA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v71 = v42;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Can't get DSID: %@", buf, 0xCu);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 smDataStore]);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_100165E78;
  v53[3] = &unk_1002853A0;
  v53[4] = self;
  v43 = v3;
  v54 = v43;
  id v45 = v2;
  id v55 = v45;
  id v41 = v8;
  id v56 = v41;
  id v40 = v6;
  id v57 = v40;
  v58 = &v65;
  v59 = &v61;
  [v11 fetchDeviceSignature:0 complete:v53];

  if (qword_1002EEAA0 != -1) {
    dispatch_once(&qword_1002EEAA0, &stru_1002853C0);
  }
  v12 = (os_log_s *)(id)qword_1002EEAA8;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v45 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v71) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating registration datas: %d", buf, 8u);
  }

  if ([v45 count])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 smDataStore]);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_100166E9C;
    v52[3] = &unk_100279308;
    v52[4] = self;
    [v15 storeDeviceSignature:v45 complete:v52];

    *((_BYTE *)v62 + 24) = 1;
  }

  id v16 = (KTPendingFlag *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTPendingFlag cloudRecords](v16, "cloudRecords"));
  if (!v17 || !*((_BYTE *)v62 + 24)) {
    goto LABEL_32;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](v43, "devices"));
  BOOL v19 = [v18 count] == 0;

  if (!v19)
  {
    if (qword_1002EEAA0 != -1) {
      dispatch_once(&qword_1002EEAA0, &stru_1002853E0);
    }
    v20 = (os_log_s *)(id)qword_1002EEAA8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](v43, "devices"));
      unsigned int v22 = [v21 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v71) = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Updating cloud devices: %d", buf, 8u);
    }

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](v43, "devices"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allObjects]);

    id v25 = [v24 countByEnumeratingWithState:&v48 objects:v69 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v49 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
          v30 = (void *)objc_claimAutoreleasedReturnValue([v29 cloudRecords]);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v28 pushToken]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v28 registrationData]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v28 apps]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 allObjects]);
          [v30 updateSelfCloudDeviceWithPushToken:v31 tbsRegistrationData:v32 applications:v34];
        }

        id v25 = [v24 countByEnumeratingWithState:&v48 objects:v69 count:16];
      }

      while (v25);
    }

    id v16 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"CloudKitOutgoing",  2LL,  1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v17 flagHandler]);
    [v35 handlePendingFlag:v16];

LABEL_32:
  }

  if ((*((_BYTE *)v66 + 24) || -[KTEnrollmentRegistrationSignature forceUpdate](self, "forceUpdate"))
    && !*((_BYTE *)v62 + 24))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature signatureTracker](self, "signatureTracker"));
    v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v36 signatureQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100166F4C;
    block[3] = &unk_100276740;
    block[4] = self;
    dispatch_async(v37, block);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnrollmentRegistrationSignature deps](self, "deps"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 flagHandler]);
    [v39 cancelPendingFlag:@"ValidateSelf"];
  }

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 126LL, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 134LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (BOOL)forceUpdate
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setForceUpdate:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (KTCheckIDSRegistrationInterface)idsRegistrationInterface
{
  return (KTCheckIDSRegistrationInterface *)objc_loadWeakRetained((id *)((char *)&self->super._internalSuccesses + 6));
}

- (void)setIdsRegistrationInterface:(id)a3
{
}

- (KTSignatureTracker)signatureTracker
{
  return (KTSignatureTracker *)objc_loadWeakRetained((id *)(&self->_forceUpdate + 6));
}

- (void)setSignatureTracker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end