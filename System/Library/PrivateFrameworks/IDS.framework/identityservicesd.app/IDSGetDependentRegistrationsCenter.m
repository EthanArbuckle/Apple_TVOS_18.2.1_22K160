@interface IDSGetDependentRegistrationsCenter
- (BOOL)_hasReachedMaxNumberOfRetries:(unsigned int)a3;
- (BOOL)getDependentRegistrations:(id)a3 completionBlock:(id)a4;
- (BOOL)shouldReAuthenticateForGDRResultCode:(int64_t)a3 retries:(unsigned int)a4;
- (IDSGetDependentRegistrationsCenter)initWithPushHandler:(id)a3 lockdownManager:(id)a4 heartbeatCenter:(id)a5 ftNetworkSupport:(id)a6 sendMessageHandlerBlock:(id)a7 messageResponseHandlerBlock:(id)a8;
- (void)_submitGDRReponseToAWDWithResultCode:(int64_t)a3 error:(id)a4;
@end

@implementation IDSGetDependentRegistrationsCenter

- (IDSGetDependentRegistrationsCenter)initWithPushHandler:(id)a3 lockdownManager:(id)a4 heartbeatCenter:(id)a5 ftNetworkSupport:(id)a6 sendMessageHandlerBlock:(id)a7 messageResponseHandlerBlock:(id)a8
{
  id v27 = a3;
  id v26 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IDSGetDependentRegistrationsCenter;
  v19 = -[IDSGetDependentRegistrationsCenter init](&v28, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_pushHandler, a3);
    objc_storeStrong((id *)&v20->_lockdownManager, a4);
    objc_storeStrong((id *)&v20->_heartbeatCenter, a5);
    objc_storeStrong((id *)&v20->_ftNetworkSupport, a6);
    id v21 = objc_retainBlock(v17);
    id sendMessageHandler = v20->_sendMessageHandler;
    v20->_id sendMessageHandler = v21;

    id v23 = objc_retainBlock(v18);
    id messageResponseHandler = v20->_messageResponseHandler;
    v20->_id messageResponseHandler = v23;
  }

  return v20;
}

- (BOOL)getDependentRegistrations:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_autoreleasePoolPush();
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 authenticationCert]);

    if (v9)
    {
      if (!-[IMLockdownManager isExpired](self->_lockdownManager, "isExpired"))
      {
        id v16 = [v7 copy];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 idsUserID]);
        currentGetDependentRegistrations = self->_currentGetDependentRegistrations;
        if (!currentGetDependentRegistrations)
        {
          v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          v20 = self->_currentGetDependentRegistrations;
          self->_currentGetDependentRegistrations = v19;

          currentGetDependentRegistrations = self->_currentGetDependentRegistrations;
        }

        v57 = v8;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        id v21 = currentGetDependentRegistrations;
        id v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v60,  v68,  16LL);
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v61;
          while (2)
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v61 != v24) {
                objc_enumerationMutation(v21);
              }
              unsigned __int8 v27 = [v17 isEqualToIgnoringCase:v26];

              if ((v27 & 1) != 0)
              {
                char v28 = 1;
                goto LABEL_29;
              }
            }

            id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v60,  v68,  16LL);
            if (v23) {
              continue;
            }
            break;
          }
        }

        char v28 = 0;
LABEL_29:

        -[NSMutableSet addObject:](self->_currentGetDependentRegistrations, "addObject:", v6);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v65 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Adding registration %p to getDependent queue",  buf,  0xCu);
        }

        if (v16)
        {
          currentGetDependentRegistrationBlocks = self->_currentGetDependentRegistrationBlocks;
          if (!currentGetDependentRegistrationBlocks)
          {
            Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            v32 = self->_currentGetDependentRegistrationBlocks;
            self->_currentGetDependentRegistrationBlocks = Mutable;

            currentGetDependentRegistrationBlocks = self->_currentGetDependentRegistrationBlocks;
          }

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid", v57));
          v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( currentGetDependentRegistrationBlocks,  "objectForKey:",  v33));

          if (!-[NSMutableArray count](v34, "count"))
          {
            v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);

            v36 = self->_currentGetDependentRegistrationBlocks;
            v37 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
            -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v35, v37);

            v34 = v35;
          }

          id v38 = objc_retainBlock(v16);
          -[NSMutableArray addObject:](v34, "addObject:", v38);

          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v40 = objc_retainBlock(v16);
            *(_DWORD *)buf = 134217984;
            id v65 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Adding completion block %p to getDependent queue",  buf,  0xCu);
          }
        }

        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", v57));
        BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        if ((v28 & 1) != 0)
        {
          if (v42)
          {
            *(_DWORD *)buf = 138412290;
            id v65 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "We have an outstanding getDependentRegistrations request for userID: %@",  buf,  0xCu);
          }
        }

        else
        {
          if (v42)
          {
            *(_DWORD *)buf = 138412290;
            id v65 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Requesting dependent device info for registration: %@",  buf,  0xCu);
          }

          v41 = objc_alloc_init(&OBJC_CLASS___IDSGetDependentRegistrationMessage);
          id v43 = sub_1002408C4(v6);
          v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
          -[os_log_s setDSAuthID:](v41, "setDSAuthID:", v44);

          v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPushHandler pushToken](self->_pushHandler, "pushToken"));
          -[os_log_s setPushToken:](v41, "setPushToken:", v45);

          v46 = (void *)objc_claimAutoreleasedReturnValue([v6 idsUserID]);
          v47 = (void *)objc_claimAutoreleasedReturnValue([v6 authenticationCert]);
          v48 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
          id v49 = [v48 identityPrivateKey];
          v50 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
          -[os_log_s addAuthUserID:certificate:privateKey:publicKey:]( v41,  "addAuthUserID:certificate:privateKey:publicKey:",  v46,  v47,  v49,  [v50 identityPublicKey]);

          IDSAssignPushIdentityToMessage(v41);
          v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v6,  @"info"));
          -[os_log_s setUserInfo:](v41, "setUserInfo:", v51);

          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_100264120;
          v59[3] = &unk_1008FF108;
          v59[4] = self;
          -[os_log_s setCompletionBlock:](v41, "setCompletionBlock:", v59);
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
            v54 = (void *)objc_claimAutoreleasedReturnValue([v53 deviceInformationString]);
            *(_DWORD *)buf = 138412546;
            id v65 = v6;
            __int16 v66 = 2112;
            v67 = v54;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Sending get dependent registration request: %@  (Environment: %@)",  buf,  0x16u);
          }

          id sendMessageHandler = (void (**)(id, os_log_s *))self->_sendMessageHandler;
          if (sendMessageHandler) {
            sendMessageHandler[2](sendMessageHandler, v41);
          }
        }

        v8 = v58;

        BOOL v15 = 1;
        goto LABEL_49;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        if (v7)
        {
          (*((void (**)(id, id, uint64_t, void, void))v7 + 2))(v7, v6, 1LL, 0LL, 0LL);
          goto LABEL_15;
        }

        goto LABEL_16;
      }

      *(_WORD *)buf = 0;
      v11 = "*** Lockdown state is expired, not sending dependent registration check";
      v12 = (os_log_s *)v10;
      uint32_t v13 = 2;
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      id v65 = v6;
      v11 = "Not getting dependent registrations, we're not authenticated for: %@";
      v12 = (os_log_s *)v10;
      uint32_t v13 = 12;
    }

    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_13;
  }

  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not getting dependent registrations, we don't have a registration",  buf,  2u);
  }

  if (v7)
  {
    (*((void (**)(id, void, uint64_t, void, void))v7 + 2))(v7, 0LL, 1LL, 0LL, 0LL);
LABEL_15:
    BOOL v15 = 0;
    id v16 = v7;
LABEL_49:

    goto LABEL_50;
  }

- (BOOL)_hasReachedMaxNumberOfRetries:(unsigned int)a3
{
  return sub_100263810() <= a3;
}

- (BOOL)shouldReAuthenticateForGDRResultCode:(int64_t)a3 retries:(unsigned int)a4
{
  unsigned int v5 = !-[IDSGetDependentRegistrationsCenter _hasReachedMaxNumberOfRetries:]( self,  "_hasReachedMaxNumberOfRetries:",  *(void *)&a4);
  if (a3 == 6005) {
    return v5;
  }
  else {
    return 0;
  }
}

- (void)_submitGDRReponseToAWDWithResultCode:(int64_t)a3 error:(id)a4
{
  id v32 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v32 domain]);
  LODWORD(v7) = [v6 isEqualToString:NSPOSIXErrorDomain];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v32 domain]);
  unsigned int v9 = 1;
  if (([v8 isEqualToString:NSURLErrorDomain] & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v32 domain]);
    unsigned int v9 = [v10 isEqualToString:kCFErrorDomainCFNetwork];
  }

  else {
    uint64_t v11 = 1LL;
  }
  uint64_t v12 = sub_10019EA40(a3);
  uint64_t v13 = sub_10019EF00(-1LL);
  char v14 = v9 | v7;
  BOOL v15 = &IMInsertBoolsToXPCDictionary_ptr;
  if (((v9 | v7) & 1) != 0)
  {
    id v16 = 0LL;
    if (!v9)
    {
LABEL_8:
      id v17 = 0LL;
      goto LABEL_11;
    }
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v32 code]));
    if (!v9) {
      goto LABEL_8;
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v32 code]));
LABEL_11:
  if ((v7 & 1) == 0)
  {
    FTAWDLogRegistrationGetDependentRegistrations(0LL, a3 == 0, v11, v12, v13, v16, v17, 0LL);
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  BOOL v18 = a3 == 0;
  char v31 = v9 | v7;
  int64_t v19 = a3;
  char v20 = v7;
  uint64_t v7 = v11;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v32 code]));
  BOOL v22 = v18;
  BOOL v15 = &IMInsertBoolsToXPCDictionary_ptr;
  FTAWDLogRegistrationGetDependentRegistrations(0LL, v22, v7, v12, v13, v16, v17, v21);

  uint64_t v11 = v7;
  LOBYTE(v7) = v20;
  a3 = v19;
  char v14 = v31;
  if (v9) {
LABEL_15:
  }

LABEL_16:
  if ((v14 & 1) == 0) {

  }
  id v23 = objc_alloc(&OBJC_CLASS___IDSRegistrationOperationGetDependentRegistrationsMetric);
  uint64_t v24 = sub_10019EA40(a3);
  uint64_t v25 = sub_10019EF00(-1LL);
  if ((v14 & 1) != 0)
  {
    id v26 = 0LL;
    if (!v9)
    {
LABEL_20:
      unsigned __int8 v27 = 0LL;
      goto LABEL_23;
    }
  }

  else
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[501], "numberWithInteger:", objc_msgSend(v32, "code")));
    if (!v9) {
      goto LABEL_20;
    }
  }

  unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[501], "numberWithInteger:", objc_msgSend(v32, "code")));
LABEL_23:
  if ((v7 & 1) == 0)
  {
    id v29 = [v23 initWithGuid:0 success:a3 == 0 connectionType:v11 resultCode:v24 registrationType:v25 genericError:v26 URLError:v27 POSIXError:0];
    if (!v9) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }

  char v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v32 code]));
  id v29 = [v23 initWithGuid:0 success:a3 == 0 connectionType:v11 resultCode:v24 registrationType:v25 genericError:v26 URLError:v27 POSIXError:v28];

  if (v9) {
LABEL_27:
  }

LABEL_28:
  if ((v14 & 1) == 0) {

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v30 logMetric:v29];
}

- (void).cxx_destruct
{
}

@end