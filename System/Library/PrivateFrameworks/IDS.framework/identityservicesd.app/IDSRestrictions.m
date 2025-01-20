@interface IDSRestrictions
+ (IDSRestrictions)sharedInstance;
- (BOOL)_isDisabledService:(id)a3;
- (BOOL)active;
- (BOOL)shouldDisableAccount:(id)a3;
- (BOOL)shouldDisableService:(id)a3;
- (BOOL)shouldPostNotifications;
- (IDSRestrictions)init;
- (unint64_t)_restrictionReasonForService:(id)a3;
- (unint64_t)restrictionReasonForService:(id)a3;
- (void)_managedPrefsNotification:(id)a3;
- (void)_setRestrictionReason:(unint64_t)a3 forService:(id)a4;
- (void)_updateParentalSettings;
- (void)refreshStateForAccount:(id)a3;
- (void)setShouldPostNotifications:(BOOL)a3;
- (void)updateAccountActivation;
@end

@implementation IDSRestrictions

+ (IDSRestrictions)sharedInstance
{
  if (qword_1009BEC00 != -1) {
    dispatch_once(&qword_1009BEC00, &stru_1008FBFF0);
  }
  if (qword_1009BEC08 != -1) {
    dispatch_once(&qword_1009BEC08, &stru_1008FC010);
  }
  if (qword_1009BEC10 != -1) {
    dispatch_once(&qword_1009BEC10, &stru_1008FC030);
  }
  return (IDSRestrictions *)(id)qword_1009BEC18;
}

- (IDSRestrictions)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSRestrictions;
  v2 = -[IDSRestrictions init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    parentalControls = v2->_parentalControls;
    v2->_parentalControls = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_managedPrefsNotification:" name:kCFManagedPreferencesMCXNotificationName object:kCFManagedPreferencesMCXObjectName];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v2 selector:"_managedPrefsNotification:" name:FaceTimeDeviceRegistrationCapabilityChangedNotification object:0];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_managedPrefsNotification:" name:FaceTimeDeviceCapabilityChangedNotification object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"_managedPrefsNotification:" name:FaceTimeDeviceRestictionsChangedNotification object:0];
  }

  return v2;
}

- (BOOL)_isDisabledService:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_parentalControls, "objectForKey:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (unint64_t)_restrictionReasonForService:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_parentalControls, "objectForKey:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_parentalControls, "objectForKey:", v4));
    unint64_t v7 = [v6 unsignedIntValue];
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (void)_setRestrictionReason:(unint64_t)a3 forService:(id)a4
{
  parentalControls = self->_parentalControls;
  if (a3)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableDictionary setObject:forKey:](parentalControls, "setObject:forKey:");
  }

  else
  {
    id v7 = a4;
    -[NSMutableDictionary removeObjectForKey:](parentalControls, "removeObjectForKey:");
  }
}

- (void)_updateParentalSettings
{
  v2 = self;
  BOOL v3 = !self->_active;
  if (!self->_active) {
    self->_active = 1;
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = -[IDSRestrictions _restrictionReasonForService:](v2, "_restrictionReasonForService:", @"com.apple.ess");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  if ([v6 faceTimeSupported])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    else {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  if ((id)v8 != v5)
  {
    -[IDSRestrictions _setRestrictionReason:forService:]( v2,  "_setRestrictionReason:forService:",  v8,  @"com.apple.ess");
    -[NSMutableSet addObject:](v4, "addObject:", @"com.apple.ess");
    BOOL v3 = 1;
  }

  id v9 = -[IDSRestrictions _restrictionReasonForService:]( v2,  "_restrictionReasonForService:",  @"com.apple.private.ac");
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  if ([v10 callingSupported])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    else {
      uint64_t v12 = 0LL;
    }
  }

  else
  {
    uint64_t v12 = 1LL;
  }

  if ((id)v12 != v9)
  {
    -[IDSRestrictions _setRestrictionReason:forService:]( v2,  "_setRestrictionReason:forService:",  v12,  @"com.apple.private.ac");
    -[NSMutableSet addObject:](v4, "addObject:", @"com.apple.private.ac");
    BOOL v3 = 1;
  }

  id v13 = -[IDSRestrictions _restrictionReasonForService:]( v2,  "_restrictionReasonForService:",  @"com.apple.private.alloy.facetime.multi");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  if ([v14 multiwaySupported])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    else {
      uint64_t v16 = 0LL;
    }
  }

  else
  {
    uint64_t v16 = 1LL;
  }

  if ((id)v16 != v13)
  {
    -[IDSRestrictions _setRestrictionReason:forService:]( v2,  "_setRestrictionReason:forService:",  v16,  @"com.apple.private.alloy.facetime.multi");
    -[NSMutableSet addObject:](v4, "addObject:", @"com.apple.private.alloy.facetime.multi");
    BOOL v3 = 1;
  }

  id v17 = -[IDSRestrictions _restrictionReasonForService:](v2, "_restrictionReasonForService:", @"com.apple.madrid");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  if ([v18 iMessageSupported])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    else {
      uint64_t v20 = 0LL;
    }
  }

  else
  {
    uint64_t v20 = 1LL;
  }

  if ((id)v20 != v17)
  {
    -[IDSRestrictions _setRestrictionReason:forService:]( v2,  "_setRestrictionReason:forService:",  v20,  @"com.apple.madrid");
    -[NSMutableSet addObject:](v4, "addObject:", @"com.apple.madrid");
    BOOL v3 = 1;
  }

  v49 = v4;
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v22 = -[IDSRestrictions active](v2, "active");
    v23 = @"NO";
    if (v22) {
      v23 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v67 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "IDSRestrictions - Active: %@", buf, 0xCu);
  }

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  v24 = v2->_parentalControls;
  id v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v60,  v70,  16LL);
  v26 = v2;
  if (v25)
  {
    id v27 = v25;
    uint64_t v28 = *(void *)v61;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v61 != v28) {
          objc_enumerationMutation(v24);
        }
        v30 = *(const __CFString **)(*((void *)&v60 + 1) + 8LL * (void)i);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2->_parentalControls, "objectForKey:", v30));
          id v33 = [v32 unsignedLongValue];
          *(_DWORD *)buf = 138412546;
          v67 = v30;
          __int16 v68 = 2048;
          id v69 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "IDSRestrictions - %@ Restriction Reason: %lu",  buf,  0x16u);

          v2 = v26;
        }
      }

      id v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v60,  v70,  16LL);
    }

    while (v27);
  }

  char v34 = !v3;
  if (!v2->_shouldPostNotifications) {
    char v34 = 1;
  }
  if ((v34 & 1) == 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v35, "__mainThreadPostNotificationName:object:", @"__kIDSRestrictionsChangedNotification", 0);

    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    obj = v49;
    id v36 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v56,  v65,  16LL);
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v57;
      do
      {
        for (j = 0LL; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v57 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)j);
          unint64_t v41 = -[IDSRestrictions _restrictionReasonForService:](v2, "_restrictionReasonForService:", v40);
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472LL;
          v55[2] = sub_10017357C;
          v55[3] = &unk_1008FC088;
          v55[4] = v40;
          v55[5] = v41;
          v42 = objc_retainBlock(v55);
          ((void (*)(void *, uint64_t))v42[2])(v42, v40);
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
          v44 = (void *)objc_claimAutoreleasedReturnValue([v43 adHocServicesForIdentifier:v40]);

          id v45 = [v44 countByEnumeratingWithState:&v51 objects:v64 count:16];
          if (v45)
          {
            id v46 = v45;
            uint64_t v47 = *(void *)v52;
            do
            {
              for (k = 0LL; k != v46; k = (char *)k + 1)
              {
                if (*(void *)v52 != v47) {
                  objc_enumerationMutation(v44);
                }
                ((void (*)(void *, void))v42[2])( v42,  *(void *)(*((void *)&v51 + 1) + 8LL * (void)k));
              }

              id v46 = [v44 countByEnumeratingWithState:&v51 objects:v64 count:16];
            }

            while (v46);
          }

          v2 = v26;
        }

        id v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v56,  v65,  16LL);
      }

      while (v37);
    }
  }

  -[IDSRestrictions updateAccountActivation](v2, "updateAccountActivation");
}

- (void)updateAccountActivation
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  unsigned __int8 v4 = [v3 accountsLoaded];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " Updating account activation if needed",  buf,  2u);
    }

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 accounts]);
    id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v24,  16LL);
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v19;
      *(void *)&__int128 v8 = 138412290LL;
      __int128 v17 = v8;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v12, "isAdHocAccount", v17) & 1) == 0)
          {
            if ([v12 isEnabled]
              && -[IDSRestrictions shouldDisableAccount:](self, "shouldDisableAccount:", v12))
            {
              id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v17;
                v23 = v12;
                _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "IDSRestrictions - Disabling account: %@",  buf,  0xCu);
              }

              v14 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
              [v3 disableAccountWithUniqueID:v14];

              [v12 setWasDisabledAutomatically:1];
            }

            else if (([v12 isEnabled] & 1) == 0 {
                   && !-[IDSRestrictions shouldDisableAccount:](self, "shouldDisableAccount:", v12)
            }
                   && [v12 wasDisabledAutomatically])
            {
              v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v17;
                v23 = v12;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "IDSRestrictions - Re-activating a disabled account: %@",  buf,  0xCu);
              }

              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
              [v3 enableAccountWithUniqueID:v16];
            }
          }
        }

        id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v24,  16LL);
      }

      while (v9);
    }
  }

  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Waiting on account activate, the account controller isn't ready yet",  buf,  2u);
  }
}

- (BOOL)shouldDisableService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[IDSRestrictions active](self, "active"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      BOOL v6 = -[IDSRestrictions _isDisabledService:](self, "_isDisabledService:", v5);
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)shouldDisableAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[IDSRestrictions active](self, "active"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
      BOOL v6 = -[IDSRestrictions shouldDisableService:](self, "shouldDisableService:", v5);
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)refreshStateForAccount:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceType]);
  int v5 = IDSIsAnyFaceTimeRelatedRegistrationServiceType(v4);

  if (v5)
  {
    -[IDSRestrictions _updateParentalSettingsIfFTInstallChanged](self, "_updateParentalSettingsIfFTInstallChanged");
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceType]);
    int v7 = IDSIsiMessageRegistrationServiceType(v6);

    if (v7) {
      -[IDSRestrictions _updateParentalSettingsIfMessagesInstallChanged]( self,  "_updateParentalSettingsIfMessagesInstallChanged");
    }
  }
}

- (unint64_t)restrictionReasonForService:(id)a3
{
  id v4 = a3;
  if (![v4 adHocServiceType]
    || (int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance")),
        BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryServiceForAdhocServiceType:", objc_msgSend(v4, "adHocServiceType"))),
        v5,
        int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]),
        unint64_t v8 = -[IDSRestrictions _restrictionReasonForService:](self, "_restrictionReasonForService:", v7),
        v7,
        v6,
        !v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unint64_t v8 = -[IDSRestrictions _restrictionReasonForService:](self, "_restrictionReasonForService:", v9);
  }

  return v8;
}

- (void)_managedPrefsNotification:(id)a3
{
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "IDSRestrictions -  Manged prefs changed",  v5,  2u);
  }

  -[IDSRestrictions _updateParentalSettings](self, "_updateParentalSettings");
}

- (BOOL)shouldPostNotifications
{
  return self->_shouldPostNotifications;
}

- (void)setShouldPostNotifications:(BOOL)a3
{
  self->_shouldPostNotifications = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
}

@end