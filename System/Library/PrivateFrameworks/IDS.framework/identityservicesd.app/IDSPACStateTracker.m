@interface IDSPACStateTracker
+ (id)sharedInstance;
- (id)_pacRemovalReasonToString:(int64_t)a3;
- (id)_simTypeString:(unint64_t)a3;
- (id)fetchCurrentPACState;
- (id)underlyingErrorForPACState:(id)a3;
- (void)noteAuthenticationFinished;
- (void)noteAuthenticationStarted;
- (void)notePNRError:(int64_t)a3;
- (void)notePNRSuccess;
- (void)notePhoneAuthCertGained;
- (void)notePhoneAuthCertLost:(int64_t)a3;
@end

@implementation IDSPACStateTracker

+ (id)sharedInstance
{
  if (qword_1009BEB50 != -1) {
    dispatch_once(&qword_1009BEB50, &stru_1008FB540);
  }
  if (qword_1009BEB58 != -1) {
    dispatch_once(&qword_1009BEB58, &stru_1008FB560);
  }
  if (qword_1009BEB60 != -1) {
    dispatch_once(&qword_1009BEB60, &stru_1008FB580);
  }
  return (id)qword_1009BEB68;
}

- (id)fetchCurrentPACState
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Fetching PAC state", buf, 2u);
  }

  v3 = objc_alloc_init(&OBJC_CLASS___IDSPACState);
  v4 = &IMInsertBoolsToXPCDictionary_ptr;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  -[IDSPACState setIsAnySIMInserted:](v3, "setIsAnySIMInserted:", [v5 isAnySIMInserted]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  -[IDSPACState setIsAnySIMUsable:](v3, "setIsAnySIMUsable:", [v6 isAnySIMUsable]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  -[IDSPACState setIsDualSIM:](v3, "setIsDualSIM:", [v7 hasMultipleSIMs]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  id v50 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentSIMsWithError:&v50]);
  v10 = (IDSPACState *)v50;

  if (v10)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Error while attempting to fetch state of SIMs for PAC state: %@",  buf,  0xCu);
    }

    v12 = v3;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 registrationConductor]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v14 userStore]);

    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (IDSPACState *)[v9 count];
      *(_DWORD *)buf = 134217984;
      v52 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetching state of %lu sim(s)", buf, 0xCu);
    }

    -[IDSPACState setSimCount:](v3, "setSimCount:", [v9 count]);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    v38 = v9;
    id obj = v9;
    id v44 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (v44)
    {
      uint64_t v42 = *(void *)v47;
      v39 = v3;
      do
      {
        for (i = 0LL; i != v44; i = (char *)i + 1)
        {
          if (*(void *)v47 != v42) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v4[187] sharedInstance]);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 CTPNRForSIM:v18]);

          unsigned int v21 = [v20 isPNRSupported];
          if (v21) {
            -[IDSPACState setIsAnySIMPNRCapable:](v3, "setIsAnySIMPNRCapable:", 1LL);
          }
          unsigned int v45 = [v20 isSIMReady];
          if (v45) {
            -[IDSPACState setIsAnySIMPNRReady:](v3, "setIsAnySIMPNRReady:", 1LL);
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue([v18 SIMIdentifier]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v43 userWithUniqueIdentifier:v22]);

          v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSMSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSSMSRegistrationCenter,  "sharedInstance"));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stateMachineByUserID]);

          v26 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueIdentifier]);
          v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v26]);

          if (v27 && [v27 status])
          {
            -[IDSPACState setIsAnyPNRInFlight:](v3, "setIsAnyPNRInFlight:", 1LL);
            v28 = @"YES";
          }

          else
          {
            v28 = @"NO";
          }

          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = (IDSPACState *)objc_claimAutoreleasedReturnValue([v18 SIMIdentifier]);
            uint64_t v31 = objc_claimAutoreleasedReturnValue(-[IDSPACStateTracker _simTypeString:](self, "_simTypeString:", [v18 hardwareType]));
            v32 = (void *)v31;
            *(_DWORD *)buf = 138413314;
            v33 = @"NO";
            if (v21) {
              v34 = @"YES";
            }
            else {
              v34 = @"NO";
            }
            v52 = v30;
            if (v45) {
              v33 = @"YES";
            }
            __int16 v53 = 2112;
            uint64_t v54 = v31;
            __int16 v55 = 2112;
            v56 = v34;
            __int16 v57 = 2112;
            v58 = v33;
            __int16 v59 = 2112;
            v60 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Sim status %@ | simType: %@ isPNRCapable: %@ isPNRReady: %@ isPNRInFlight: %@ ",  buf,  0x34u);

            v3 = v39;
          }

          v4 = &IMInsertBoolsToXPCDictionary_ptr;
        }

        id v44 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
      }

      while (v44);
    }

    -[IDSPACState setIsAuthenticationInFlight:](v3, "setIsAuthenticationInFlight:", byte_1009BEB78);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v3;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Current PAC state: %@", buf, 0xCu);
    }

    v36 = v3;
    v10 = 0LL;
    v9 = v38;
  }

  return v3;
}

- (id)underlyingErrorForPACState:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (qword_1009BEB80)
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "There is a recent tracked PAC removal, including in error chain",  buf,  2u);
    }

    uint64_t v7 = qword_1009BEB80;
    NSErrorUserInfoKey v17 = NSDebugDescriptionErrorKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPACStateTracker _pacRemovalReasonToString:](self, "_pacRemovalReasonToString:", qword_1009BEB80));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PAC was last removed due to %@",  v8));
    v18 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSPACRemovedErrorDomain",  v7,  v10));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, NSUnderlyingErrorKey);
  }

  if ([v4 isAnySIMInserted])
  {
    if ([v4 isAnySIMUsable])
    {
      if ([v4 isAnySIMPNRCapable])
      {
        if ([v4 isAnySIMPNRReady])
        {
          if ([v4 isAnyPNRInFlight])
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"There is currently a PNR in flight",  NSDebugDescriptionErrorKey);
            uint64_t v12 = -5500LL;
          }

          else if ([v4 isAwaitingAuthentication])
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"PNR is complete, but we have not yet kicked off authentication",  NSDebugDescriptionErrorKey);
            uint64_t v12 = -5600LL;
          }

          else
          {
            if (![v4 isAuthenticationInFlight])
            {
              uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", NSUnderlyingErrorKey));
              goto LABEL_20;
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"PNR is complete, but authentication is still in flight",  NSDebugDescriptionErrorKey);
            uint64_t v12 = -5700LL;
          }
        }

        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"This device has atleast one PNR capable SIM but none are ready for PNR",  NSDebugDescriptionErrorKey);
          uint64_t v12 = -5400LL;
        }
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"This device has no SIM capable of PNR",  NSDebugDescriptionErrorKey);
        uint64_t v12 = -5300LL;
      }
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"This device has atleast one inserted SIM but none are usable",  NSDebugDescriptionErrorKey);
      uint64_t v12 = -5200LL;
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"This device has no inserted SIM",  NSDebugDescriptionErrorKey);
    uint64_t v12 = -5100LL;
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSPhoneUserRegistryErrorDomain",  v12,  v5));
LABEL_20:
  v14 = (void *)v13;

  return v14;
}

- (void)notePhoneAuthCertLost:(int64_t)a3
{
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPACStateTracker _pacRemovalReasonToString:](self, "_pacRemovalReasonToString:", a3));
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Noting phone auth cert removal! Reason: %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v8 = (void *)qword_1009BEB70;
  qword_1009BEB70 = v7;

  qword_1009BEB80 = a3;
}

- (id)_pacRemovalReasonToString:(int64_t)a3
{
  else {
    return off_1008FB5A0[a3 - 1];
  }
}

- (id)_simTypeString:(unint64_t)a3
{
  v3 = @"unknown";
  if (a3 == 1) {
    v3 = @"physical";
  }
  if (a3 == 2) {
    return @"eSIM";
  }
  else {
    return (id)v3;
  }
}

- (void)notePhoneAuthCertGained
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Gained a phone auth cert!", v4, 2u);
  }

  v3 = (void *)qword_1009BEB70;
  qword_1009BEB70 = 0LL;

  qword_1009BEB80 = 0LL;
}

- (void)notePNRSuccess
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "PAC state tracker clearing last PNR failure",  v3,  2u);
  }
}

- (void)notePNRError:(int64_t)a3
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms", a3));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PAC state tracker noting a PNR failure", v4, 2u);
  }
}

- (void)noteAuthenticationStarted
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "PAC state tracker noting authentication has begun",  v3,  2u);
  }

  byte_1009BEB78 = 1;
}

- (void)noteAuthenticationFinished
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "PAC state tracker noting authentication has finished",  v3,  2u);
  }

  byte_1009BEB78 = 0;
}

@end