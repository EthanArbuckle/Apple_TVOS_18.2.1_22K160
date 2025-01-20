@interface CSDThumperCapabilitiesMonitor
- (BOOL)shouldEnrollDefaultPairedDeviceForAccountID:(id)a3;
- (BOOL)shouldUnenrollDefaultPairedDeviceForAccountID:(id)a3;
- (BOOL)thumperCallingAllowedOnDefaultPairedDeviceDefault;
- (CSDThumperCapabilitiesMonitor)init;
- (CSDThumperCapabilitiesMonitorDataSource)dataSource;
- (OS_dispatch_queue)queue;
- (id)thumperCapabilitiesStatesForPreferenceKey:(__CFString *)a3;
- (void)_checkIfDevicesShouldBeUnenrolled;
- (void)_thumperIsNoLongerEnabledForAccountID:(id)a3;
- (void)_thumperIsNoLongerSupportedForAccountID:(id)a3;
- (void)_thumperIsNowEnabledForAccountID:(id)a3;
- (void)_updateDefaultPairedDeviceUniqueIDDefault;
- (void)_updateThumperCallingPreferences;
- (void)didAddCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)didRemoveCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)enrollDefaultPairedDevice;
- (void)enrollDefaultPairedDeviceForAccountID:(id)a3;
- (void)handleIDSDeviceListChangedNotification:(id)a3;
- (void)removeEmergencyAddressDisclaimerOnSecondaryDevice;
- (void)removeReminderNotificationOnSecondaryDevice;
- (void)saveThumperCapabilitiesStates:(id)a3 forPreferenceKey:(__CFString *)a4;
- (void)setDataSource:(id)a3;
- (void)setQueue:(id)a3;
- (void)showEmergencyAddressDisclaimerOnSecondaryDevice;
- (void)showReminderNotificationOnSecondaryDevice;
- (void)unenrollDefaultPairedDeviceForAccountID:(id)a3;
- (void)updateState;
@end

@implementation CSDThumperCapabilitiesMonitor

- (CSDThumperCapabilitiesMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDThumperCapabilitiesMonitor;
  v2 = -[CSDThumperCapabilitiesMonitor init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.thumpercapabilitiesmonitor", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    +[TUCallCapabilities addDelegate:queue:](&OBJC_CLASS___TUCallCapabilities, "addDelegate:queue:", v2, v2->_queue);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
    [v5 addObserver:v2 selector:"handleIDSDeviceListChangedNotification:" name:@"CSDIDSDeviceListChangedNotification" object:v6];
  }

  return v2;
}

- (void)updateState
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005FA28;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)thumperCallingAllowedOnDefaultPairedDeviceDefault
{
  return 0;
}

- (void)_thumperIsNoLongerSupportedForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Dismissing Thumper available notification on secondary device for account ID %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDThumperCapabilitiesMonitor removeReminderNotificationOnSecondaryDevice]( self,  "removeReminderNotificationOnSecondaryDevice");
}

- (void)_thumperIsNowEnabledForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Displaying Thumper enabled disclaimer on secondary device for account ID %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDThumperCapabilitiesMonitor showEmergencyAddressDisclaimerOnSecondaryDevice]( self,  "showEmergencyAddressDisclaimerOnSecondaryDevice");
}

- (void)_thumperIsNoLongerEnabledForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Dismissing Thumper enabled disclaimer on secondary device for account ID %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDThumperCapabilitiesMonitor removeEmergencyAddressDisclaimerOnSecondaryDevice]( self,  "removeEmergencyAddressDisclaimerOnSecondaryDevice");
}

- (void)_updateThumperCallingPreferences
{
  if (+[TUCallCapabilities areCTCapabilitiesValid]( &OBJC_CLASS___TUCallCapabilities,  "areCTCapabilitiesValid"))
  {
    v41 = self;
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 thumperCallingCapabilitiesStateByUUID]);

    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    v46 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
    id v6 = [v5 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v63;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v63 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 publiclyAccessibleCopy]);

          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountID]);
          if (v13)
          {
            [v53 setObject:v12 forKeyedSubscript:v13];
          }

          else
          {
            id v14 = sub_1001704C4();
            v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v69 = v10;
              __int16 v70 = 2112;
              v71 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Could not obtain Thumper account identifier for sender identity UUID %@ from data source capabilities state %@",  buf,  0x16u);
            }
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v62 objects:v72 count:16];
      }

      while (v7);
    }

    unsigned int v45 = +[TUCallCapabilities supportsPrimaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "supportsPrimaryCalling");
    v16 = v41;
    v47 = (void *)objc_claimAutoreleasedReturnValue( -[CSDThumperCapabilitiesMonitor thumperCapabilitiesStatesForPreferenceKey:]( v41,  "thumperCapabilitiesStatesForPreferenceKey:",  @"thumperCallingCapabilitiesStates"));
    id v17 = sub_1001704C4();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v69 = v47;
      __int16 v70 = 2112;
      v71 = v53;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Comparing cached Thumper capabilities state %@ with data source capabilities state %@",  buf,  0x16u);
    }

    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v53 allKeys]);
    id v48 = [v19 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v48)
    {
      char v43 = 0;
      char v40 = 0;
      uint64_t v44 = *(void *)v59;
      *(void *)&__int128 v20 = 138412290LL;
      __int128 v39 = v20;
      v42 = v19;
      do
      {
        for (j = 0LL; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v59 != v44) {
            objc_enumerationMutation(v19);
          }
          v22 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v22, v39));
          unsigned int v24 = [v23 isAssociated];
          unsigned int v25 = [v23 isSupported];
          unsigned int v52 = [v23 isEnabled];
          unsigned int v51 = [v23 supportsDefaultPairedDevice];
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          id v26 = v47;
          id v27 = [v26 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v27)
          {
            unsigned int v49 = v25;
            unsigned int v50 = v24;
            uint64_t v28 = *(void *)v55;
            while (2)
            {
              for (k = 0LL; k != v27; k = (char *)k + 1)
              {
                if (*(void *)v55 != v28) {
                  objc_enumerationMutation(v26);
                }
                v30 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)k);
                v31 = (void *)objc_claimAutoreleasedReturnValue([v30 accountID]);
                int v32 = TUStringsAreCaseInsensitiveEqual(v31, v22);

                if (v32)
                {
                  LODWORD(v27) = [v30 isAssociated];
                  unsigned int v34 = [v30 isSupported];
                  unsigned int v33 = [v30 supportsDefaultPairedDevice];
                  goto LABEL_31;
                }
              }

              id v27 = [v26 countByEnumeratingWithState:&v54 objects:v66 count:16];
              if (v27) {
                continue;
              }
              break;
            }

            unsigned int v33 = 0;
            unsigned int v34 = 0;
LABEL_31:
            v19 = v42;
            unsigned int v25 = v49;
            unsigned int v24 = v50;
          }

          else
          {
            unsigned int v33 = 0;
            unsigned int v34 = 0;
          }

          if (v45)
          {
            if (v51 != v33)
            {
              if (v51) {
                -[CSDThumperCapabilitiesMonitor enrollDefaultPairedDeviceForAccountID:]( v41,  "enrollDefaultPairedDeviceForAccountID:",  v22);
              }
              else {
                -[CSDThumperCapabilitiesMonitor unenrollDefaultPairedDeviceForAccountID:]( v41,  "unenrollDefaultPairedDeviceForAccountID:",  v22);
              }
            }
          }

          else
          {
            unsigned int v35 = v24 ^ v27 | v25 ^ v34;
            if (((v24 & v25 & v35 ^ 1 | v52) & 1) != 0)
            {
              v43 |= v35;
            }

            else
            {
              id v36 = sub_1001704C4();
              v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v39;
                v69 = v22;
                _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Should show Thumper available notification for account ID %@",  buf,  0xCu);
              }

              char v43 = 1;
              char v40 = 1;
            }
          }
        }

        id v48 = [v19 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }

      while (v48);

      v16 = v41;
      if (!(v45 & 1 | ((v43 & 1) == 0)))
      {
        if ((v40 & 1) != 0) {
          -[CSDThumperCapabilitiesMonitor showReminderNotificationOnSecondaryDevice]( v41,  "showReminderNotificationOnSecondaryDevice");
        }
        else {
          -[CSDThumperCapabilitiesMonitor removeReminderNotificationOnSecondaryDevice]( v41,  "removeReminderNotificationOnSecondaryDevice");
        }
      }
    }

    else
    {
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue([v53 allValues]);
    -[CSDThumperCapabilitiesMonitor saveThumperCapabilitiesStates:forPreferenceKey:]( v16,  "saveThumperCapabilitiesStates:forPreferenceKey:",  v38,  @"thumperCallingCapabilitiesStates");
  }

- (void)_updateDefaultPairedDeviceUniqueIDDefault
{
  dispatch_queue_t v3 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  id v4 = (void *)CFPreferencesCopyAppValue( @"PreviousDefaultPairedDeviceUniqueID",  TUBundleIdentifierTelephonyUtilitiesFramework);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 defaultPairedDevice]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIDOverride]);

  id v8 = sub_1001704C4();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    v16 = v4;
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Default paired device unique ID was %@ and is now %@",  (uint8_t *)&v15,  0x16u);
  }

  if (!v4 || (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10), (objc_opt_isKindOfClass(v4, v11) & 1) != 0))
  {
    if ((TUStringsAreEqualOrNil(v4, v7) & 1) == 0)
    {
      CFPreferencesSetAppValue(@"PreviousDefaultPairedDeviceUniqueID", v7, v3);
      CFPreferencesAppSynchronize(v3);
      id v12 = sub_1001704C4();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Check if devices should be enrolled now that the default paired device changed.",  (uint8_t *)&v15,  2u);
      }

      if ([v4 length])
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
        [v14 removeThumperRegisteredDeviceID:v4 forThumperAccountID:0];
      }

      if ([v7 length]) {
        -[CSDThumperCapabilitiesMonitor enrollDefaultPairedDevice](self, "enrollDefaultPairedDevice");
      }
    }
  }
}

- (void)_checkIfDevicesShouldBeUnenrolled
{
  if (+[TUCallCapabilities supportsPrimaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "supportsPrimaryCalling"))
  {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
    if (v3)
    {
      id v4 = sub_1001704C4();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Checking to see if any devices have been removed from this iCloud account.",  buf,  2u);
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 devices]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"uniqueIDOverride"]);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

      if ([v9 count])
      {
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue([v3 localThumperAccounts]);
        id v22 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
        if (v22)
        {
          uint64_t v21 = *(void *)v29;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v29 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = v10;
              uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
              __int128 v24 = 0u;
              __int128 v25 = 0u;
              __int128 v26 = 0u;
              __int128 v27 = 0u;
              id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allowedSecondaryDeviceIDs]);
              id v13 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
              if (v13)
              {
                id v14 = v13;
                uint64_t v15 = *(void *)v25;
                do
                {
                  for (i = 0LL; i != v14; i = (char *)i + 1)
                  {
                    if (*(void *)v25 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
                    if (([v9 containsObject:v17] & 1) == 0)
                    {
                      id v18 = sub_1001704C4();
                      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
                      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v33 = v17;
                        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Device with the uniqueID %@ will be unpaired from Thumper because it is no longer on the IDSService.",  buf,  0xCu);
                      }

                      [v3 removeThumperRegisteredDeviceID:v17 forThumperAccountID:0];
                    }
                  }

                  id v14 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
                }

                while (v14);
              }

              uint64_t v10 = v23 + 1;
            }

            while ((id)(v23 + 1) != v22);
            id v22 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
          }

          while (v22);
        }
      }
    }
  }

- (void)didAddCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = (CSDThumperCapabilitiesMonitor *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
  if (v6)
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ is handling add capabilities for sender identity UUID %@",  (uint8_t *)&v14,  0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 thumperCallingCapabilitiesStateByUUID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v4]);

    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        int v14 = 138412290;
        uint64_t v15 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Thumper calling preferences update initiated by add capabilities for sender identity UUID %@",  (uint8_t *)&v14,  0xCu);
      }

      -[CSDThumperCapabilitiesMonitor _updateThumperCallingPreferences](self, "_updateThumperCallingPreferences");
    }

    else
    {
      if (v13)
      {
        int v14 = 138412290;
        uint64_t v15 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Skipping Thumper preferences update; Thumper capabilities state does not exist for UUID %@",
          (uint8_t *)&v14,
          0xCu);
      }
    }
  }
}

- (void)didRemoveCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = (CSDThumperCapabilitiesMonitor *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
  if (v6)
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int128 v30 = self;
      __int16 v31 = 2112;
      int v32 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ is handling remove capabilities for sender identity UUID %@",  buf,  0x16u);
    }

    uint64_t v23 = self;

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 secondaryThumperAccounts]);
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)i), "accountID", v23));
          if (v14)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[CTXPCContextInfo csd_unknownContextInfoForAccountID:]( &OBJC_CLASS___CTXPCContextInfo,  "csd_unknownContextInfoForAccountID:",  v14));
            __int16 v16 = v15;
            if (v15)
            {
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 uuid]);
              unsigned __int8 v18 = [v17 isEqual:v4];

              if ((v18 & 1) != 0)
              {

                id v21 = sub_1001704C4();
                id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  __int128 v30 = v4;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Skipping Thumper calling preferences update; unknown context info found for sender identity UUID %@",
                    buf,
                    0xCu);
                }

                goto LABEL_21;
              }
            }
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v19 = sub_1001704C4();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v30 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Thumper calling preferences update initiated by remove capabilities for sender identity UUID %@",  buf,  0xCu);
    }

    -[CSDThumperCapabilitiesMonitor _updateThumperCallingPreferences](v23, "_updateThumperCallingPreferences");
LABEL_21:
  }
}

- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ is handling change Thumper calling capabilities for sender identity with UUID %@",  (uint8_t *)&v8,  0x16u);
  }

  -[CSDThumperCapabilitiesMonitor _updateThumperCallingPreferences](self, "_updateThumperCallingPreferences");
}

- (void)handleIDSDeviceListChangedNotification:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060D14;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)showReminderNotificationOnSecondaryDevice
{
  id v2 = sub_1001704C4();
  dispatch_queue_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Show a reminder to the user that thumper is now available.",  v4,  2u);
  }
}

- (void)removeReminderNotificationOnSecondaryDevice
{
}

- (void)showEmergencyAddressDisclaimerOnSecondaryDevice
{
  id v2 = sub_1001704C4();
  dispatch_queue_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Show a disclaimer to the user about their emergency address info now that thumper is enabled.",  v4,  2u);
  }
}

- (void)removeEmergencyAddressDisclaimerOnSecondaryDevice
{
}

- (void)saveThumperCapabilitiesStates:(id)a3 forPreferenceKey:(__CFString *)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    __int128 v20 = a4;
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v21 = v6;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        BOOL v13 = 0LL;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v13);
          id v22 = 0LL;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 archivedDataWithError:&v22]);
          id v16 = v22;
          uint64_t v17 = v16;
          if (v15)
          {
            [v8 addObject:v15];
          }

          else if (v16)
          {
            id v18 = sub_1001704C4();
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v28 = v17;
              _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Archiving Thumper capabilities state object failed with error %@",  buf,  0xCu);
            }
          }

          BOOL v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }

      while (v11);
    }

    a4 = v20;
    id v6 = v21;
  }

  else
  {
    int v8 = 0LL;
  }

  CFPreferencesSetAppValue(a4, v8, TUBundleIdentifierTelephonyUtilitiesFramework);
}

- (id)thumperCapabilitiesStatesForPreferenceKey:(__CFString *)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  id v6 = (void *)CFPreferencesCopyAppValue(a3, TUBundleIdentifierTelephonyUtilitiesFramework);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v9 = v6;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (!v10) {
        goto LABEL_24;
      }
      id v12 = v10;
      uint64_t v13 = *(void *)v29;
      while (1)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData, v11);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          {
            id v27 = 0LL;
            uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TUThumperCTCapabilitiesState unarchivedObjectFromData:error:]( &OBJC_CLASS___TUThumperCTCapabilitiesState,  "unarchivedObjectFromData:error:",  v15,  &v27));
            id v18 = (os_log_s *)v27;
            if (v17)
            {
              [v8 addObject:v17];
            }

            else
            {
              id v22 = sub_1001704C4();
              __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v33 = v18;
                _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Unarchiving Thumper capabilities state object failed with error %@",  buf,  0xCu);
              }
            }
          }

          else
          {
            id v19 = sub_1001704C4();
            id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              goto LABEL_17;
            }
            id v21 = (os_log_s *)objc_opt_class(v15, v20);
            *(_DWORD *)buf = 138412546;
            uint64_t v33 = v21;
            __int16 v34 = 2112;
            uint64_t v35 = v15;
            uint64_t v17 = v21;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Archived object was of unexpected class %@: %@",  buf,  0x16u);
          }

LABEL_17:
        }

        id v12 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (!v12) {
          goto LABEL_24;
        }
      }
    }

    id v24 = sub_1001704C4();
    id v9 = (id)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_1002B3610((uint64_t)v6, (os_log_s *)v9);
    }
    int v8 = 0LL;
LABEL_24:
  }

  else
  {
    int v8 = 0LL;
  }

  id v25 = [v8 copy];

  return v25;
}

- (void)enrollDefaultPairedDevice
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localThumperAccounts]);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) accountID]);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 thumperCallingCapabilitiesStateForAccountID:v10]);
          if ([v11 supportsDefaultPairedDevice]) {
            -[CSDThumperCapabilitiesMonitor enrollDefaultPairedDeviceForAccountID:]( self,  "enrollDefaultPairedDeviceForAccountID:",  v10);
          }

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }
  }
}

- (void)enrollDefaultPairedDeviceForAccountID:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 defaultPairedDevice]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIDOverride]);

    if ([v7 length]
      && -[CSDThumperCapabilitiesMonitor shouldEnrollDefaultPairedDeviceForAccountID:]( self,  "shouldEnrollDefaultPairedDeviceForAccountID:",  v8))
    {
      [v4 removeThumperRegisteredDeviceID:v7 forThumperAccountID:0];
      [v4 addThumperRegisteredDeviceID:v7 forThumperAccountID:v8];
    }
  }
}

- (void)unenrollDefaultPairedDeviceForAccountID:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 defaultPairedDevice]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIDOverride]);

    if ([v7 length]
      && (!v8
       || -[CSDThumperCapabilitiesMonitor shouldUnenrollDefaultPairedDeviceForAccountID:]( self,  "shouldUnenrollDefaultPairedDeviceForAccountID:",  v8)))
    {
      [v4 removeThumperRegisteredDeviceID:v7 forThumperAccountID:v8];
    }
  }
}

- (BOOL)shouldEnrollDefaultPairedDeviceForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 defaultPairedDevice]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIDOverride]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 thumperCallingCapabilitiesStateForAccountID:v4]);
    if (+[TUCallCapabilities supportsPrimaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "supportsPrimaryCalling")
      && [v8 length]
      && ([v5 isThumperRegisteredDeviceID:v8 forThumperAccountID:v4] & 1) == 0
      && -[CSDThumperCapabilitiesMonitor thumperCallingAllowedOnDefaultPairedDeviceDefault]( self,  "thumperCallingAllowedOnDefaultPairedDeviceDefault")
      && [v9 isSupported]
      && [v9 isEnabled])
    {
      unsigned __int8 v10 = [v9 supportsDefaultPairedDevice];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)shouldUnenrollDefaultPairedDeviceForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperCapabilitiesMonitor dataSource](self, "dataSource"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDThumperIDSService sharedInstance](&OBJC_CLASS___CSDThumperIDSService, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 defaultPairedDevice]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIDOverride]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 thumperCallingCapabilitiesStateForAccountID:v4]);
    if (+[TUCallCapabilities supportsPrimaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "supportsPrimaryCalling")
      && [v8 length]
      && [v5 isThumperRegisteredDeviceID:v8 forThumperAccountID:v4])
    {
      if (-[CSDThumperCapabilitiesMonitor thumperCallingAllowedOnDefaultPairedDeviceDefault]( self,  "thumperCallingAllowedOnDefaultPairedDeviceDefault"))
      {
        unsigned int v10 = [v9 supportsDefaultPairedDevice] ^ 1;
      }

      else
      {
        LOBYTE(v10) = 1;
      }
    }

    else
    {
      LOBYTE(v10) = 0;
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (CSDThumperCapabilitiesMonitorDataSource)dataSource
{
  return (CSDThumperCapabilitiesMonitorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end