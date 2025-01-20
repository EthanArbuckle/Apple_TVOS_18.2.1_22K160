@interface IDSSIMResponder
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSRegistrationController)registrationController;
- (IDSRestrictions)restrictions;
- (IDSSIMResponder)initWithAccountController:(id)a3 serviceController:(id)a4 restrictions:(id)a5 registrationController:(id)a6;
- (NSDate)registrationStateChangedDate;
- (int64_t)registrationStateChangedCounter;
- (void)_checkTechChange;
- (void)_enumeratePrimaryAccountsOfType:(int)a3 block:(id)a4;
- (void)handleRegistrationStateChanged:(BOOL)a3;
- (void)handleSIMInserted;
- (void)handleSIMRemoved;
- (void)setAccountController:(id)a3;
- (void)setRegistrationController:(id)a3;
- (void)setRegistrationStateChangedCounter:(int64_t)a3;
- (void)setRegistrationStateChangedDate:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setServiceController:(id)a3;
@end

@implementation IDSSIMResponder

- (IDSSIMResponder)initWithAccountController:(id)a3 serviceController:(id)a4 restrictions:(id)a5 registrationController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSSIMResponder;
  v15 = -[IDSSIMResponder init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountController, a3);
    objc_storeStrong((id *)&v16->_serviceController, a4);
    objc_storeStrong((id *)&v16->_restrictions, a5);
    objc_storeStrong((id *)&v16->_registrationController, a6);
  }

  return v16;
}

- (void)_enumeratePrimaryAccountsOfType:(int)a3 block:(id)a4
{
  v6 = (void (**)(id, void *, void *))a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMResponder accountController](self, "accountController", 0LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accounts]);

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([v13 accountType] == a3)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
          v6[2](v6, v13, v14);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }
}

- (void)_checkTechChange
{
  if (!+[IDSRegistrationController validSIMStateForRegistration]( &OBJC_CLASS___IDSRegistrationController,  "validSIMStateForRegistration"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:

      return;
    }

    *(_WORD *)buf = 0;
    v7 = "SIM Is not ready for registration, ignoring this.";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    goto LABEL_8;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v4 = [v3 isExpired];

  if (v4)
  {
    return;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FTEntitlementSupport sharedInstance](&OBJC_CLASS___FTEntitlementSupport, "sharedInstance"));
  unsigned int v9 = [v8 faceTimeNonWiFiEntitled];

  if (!v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v7 = "  => Device is not entitled for this, ignoring tech change";
    goto LABEL_7;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned int v11 = [v10 isC2KEquipment];

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = @"NO";
    if (v11) {
      id v13 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "  => Is CDMA: %@", buf, 0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMResponder registrationController](self, "registrationController"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 trackedRegistrations]);

  id v16 = [v15 count];
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      unsigned int v19 = [v15 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "  => Tracking %d registration(s)", buf, 8u);
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v17 = v15;
    id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v17);
          }
          v24 = (__CFString *)*(id *)(*((void *)&v29 + 1) + 8LL * (void)i);
          if (!-[__CFString registrationType](v24, "registrationType"))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString isCDMA](v24, "isCDMA"));
            unsigned int v26 = [v25 intValue];

            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            if (v26 == v11)
            {
              if (v28)
              {
                *(_DWORD *)buf = 138412290;
                v35 = v24;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "  => Registration matches, not re-registering: %@",  buf,  0xCu);
              }
            }

            else
            {
              if (v28)
              {
                *(_DWORD *)buf = 138412290;
                v35 = v24;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "  => Re-HTTP registering registration: %@",  buf,  0xCu);
              }

              v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSRegistrationCenter,  "sharedInstance"));
              -[os_log_s sendRegistration:](v27, "sendRegistration:", v24);
            }
          }
        }

        id v21 = -[os_log_s countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
      }

      while (v21);
    }
  }

  else if (v18)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "  => No registrations active", buf, 2u);
  }
}

- (void)handleSIMInserted
{
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000195DC;
  v25[3] = &unk_1008F63C8;
  v25[4] = self;
  -[IDSSIMResponder _enumeratePrimaryAccountsOfType:block:](self, "_enumeratePrimaryAccountsOfType:block:", 0LL, v25);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SIM Inserted. Checking to see if we need to re-register due to SIM swap.",  buf,  2u);
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v5 = [v4 isExpired];

  if (v5)
  {
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMResponder registrationController](self, "registrationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 trackedRegistrations]);

    id v9 = [v8 count];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        unsigned int v12 = [v8 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  => Tracking %d registration(s)", buf, 8u);
      }

      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v10 = v8;
      id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v21,  v28,  16LL);
      if (v13)
      {
        id v14 = v13;
        id v20 = v8;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v10);
            }
            __int128 v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
            if (![v17 registrationType])
            {
              BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v27 = v17;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "  => Re-sending HTTP registration for SMS registration: %@",  buf,  0xCu);
              }

              unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSRegistrationCenter,  "sharedInstance"));
              [v19 sendRegistration:v17];
            }
          }

          id v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v21,  v28,  16LL);
        }

        while (v14);
        v8 = v20;
      }
    }

    else if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  => No registrations active", buf, 2u);
    }
  }

- (void)handleRegistrationStateChanged:(BOOL)a3
{
  if (a3)
  {
    registrationStateChangedDate = self->_registrationStateChangedDate;
    if (registrationStateChangedDate)
    {
      -[NSDate timeIntervalSinceNow](registrationStateChangedDate, "timeIntervalSinceNow");
      if (v6 < 0.0) {
        double v6 = -v6;
      }
      BOOL v7 = v6 <= 86400.0;
    }

    else
    {
      BOOL v7 = 0;
    }

    int64_t registrationStateChangedCounter = self->_registrationStateChangedCounter;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"registration-state-changed-max-count"]);

    if (v11) {
      uint64_t v12 = (uint64_t)[v11 integerValue];
    }
    else {
      uint64_t v12 = 10LL;
    }

    if (registrationStateChangedCounter >= v12 && v7)
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100693FE8(v14);
      }
    }

    else
    {
      if (!v7)
      {
        uint64_t v15 = self->_registrationStateChangedDate;
        self->_registrationStateChangedDate = 0LL;

        self->_int64_t registrationStateChangedCounter = 0LL;
      }

      *(void *)buf = 0LL;
      v25 = buf;
      uint64_t v26 = 0x2020000000LL;
      char v27 = 0;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100019A08;
      v23[3] = &unk_1008F63F0;
      v23[4] = self;
      v23[5] = buf;
      -[IDSSIMResponder _enumeratePrimaryAccountsOfType:block:]( self,  "_enumeratePrimaryAccountsOfType:block:",  0LL,  v23);
      if (v25[24])
      {
        id v16 = self->_registrationStateChangedDate;
        if (v16) {
          __int128 v17 = v16;
        }
        else {
          __int128 v17 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        }
        BOOL v18 = self->_registrationStateChangedDate;
        self->_registrationStateChangedDate = v17;

        ++self->_registrationStateChangedCounter;
      }

      unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = @"NO";
        __int128 v21 = self->_registrationStateChangedDate;
        int64_t v22 = self->_registrationStateChangedCounter;
        if (v7) {
          id v20 = @"YES";
        }
        *(_DWORD *)BOOL v28 = 138412802;
        __int128 v29 = v20;
        __int16 v30 = 2112;
        __int128 v31 = v21;
        __int16 v32 = 2048;
        int64_t v33 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Registration state changed processed {withinTimeRange: %@, _registrationStateChangedDate: %@, _registrationSta teChangedCounter: %lld}",  v28,  0x20u);
      }

      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Registration state changed but we can't register; not enabling phone number accounts",
        buf,
        2u);
    }
  }

- (void)handleSIMRemoved
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SIM Removed. Checking to see if we need to re-register due to SIM removal.",  buf,  2u);
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v5 = [v4 isExpired];

  if (v5)
  {
  }

  else
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMResponder registrationController](self, "registrationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 trackedRegistrations]);

    id v9 = [v8 count];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        unsigned int v12 = [v8 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  => Tracking %d registration(s)", buf, 8u);
      }

      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v10 = v8;
      id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
      if (v13)
      {
        id v14 = v13;
        id v20 = v8;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v10);
            }
            __int128 v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
            if (![v17 registrationType])
            {
              BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v26 = v17;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "  => Sending HTTP *deregistration* for SMS registration: %@",  buf,  0xCu);
              }

              unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSRegistrationCenter,  "sharedInstance"));
              [v19 sendDeregistration:v17];
            }
          }

          id v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
        }

        while (v14);
        v8 = v20;
      }
    }

    else if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  => No registrations active", buf, 2u);
    }
  }

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSRegistrationController)registrationController
{
  return self->_registrationController;
}

- (void)setRegistrationController:(id)a3
{
}

- (IDSRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (NSDate)registrationStateChangedDate
{
  return self->_registrationStateChangedDate;
}

- (void)setRegistrationStateChangedDate:(id)a3
{
}

- (int64_t)registrationStateChangedCounter
{
  return self->_registrationStateChangedCounter;
}

- (void)setRegistrationStateChangedCounter:(int64_t)a3
{
  self->_int64_t registrationStateChangedCounter = a3;
}

- (void).cxx_destruct
{
}

@end