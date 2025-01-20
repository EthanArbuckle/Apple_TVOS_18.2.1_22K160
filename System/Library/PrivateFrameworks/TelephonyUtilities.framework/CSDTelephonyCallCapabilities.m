@interface CSDTelephonyCallCapabilities
- (BOOL)areCapabilitiesValid;
- (BOOL)isEmergencyCallbackModeEnabled;
- (BOOL)isEmergencyCallbackPossible;
- (BOOL)shouldUpdateSubscriptions;
- (CSDCoreTelephonyClient)coreTelephonyClient;
- (CSDEmergencyCallbackCapabilities)emergencyCallbackCapabilities;
- (CSDTelephonyCallCapabilities)initWithQueue:(id)a3;
- (CSDTelephonyCallCapabilities)initWithQueue:(id)a3 coreTelephonyClient:(id)a4 emergencyCallbackCapabilities:(id)a5;
- (CSDTelephonyCallCapabilitiesDelegate)delegate;
- (NSArray)localThumperAccounts;
- (NSArray)secondaryThumperAccounts;
- (NSDictionary)senderIdentityCapabilitiesStateByUUID;
- (NSMutableDictionary)lastSavedAccountIDByCapability;
- (NSSet)subscriptions;
- (NSString)associatedThumperAccountID;
- (NSString)debugDescription;
- (NSString)localThumperDeviceID;
- (OS_dispatch_queue)queue;
- (id)_senderIdentityCapabilitiesStateForSubscription:(id)a3;
- (id)_subscriptionWithUUID:(id)a3;
- (id)primaryThumperAccountUsingDevices:(id)a3 outgoingCallerIDURI:(id)a4 requireMatchingCallerIDURI:(BOOL)a5 requireAvailableDeviceSlots:(BOOL)a6;
- (id)secondaryThumperAccountForAccountID:(id)a3;
- (id)secondaryThumperAccountForRegisteredDeviceID:(id)a3;
- (id)telephonySubscriptionLabelIdentifierForSenderIdentityUUID:(id)a3;
- (void)_updateCallCapabilitiesForSubscription:(id)a3 capabilitiesState:(id)a4;
- (void)_updateEmergencyCallbackModeEnabledState;
- (void)_updateState;
- (void)_updateSubscriptions;
- (void)_updateSystemCapabilitiesStateForSubscription:(id)a3 capabilitiesState:(id)a4;
- (void)_updateThumperAccountState;
- (void)client:(id)a3 capabilitiesDidChange:(id)a4;
- (void)client:(id)a3 subscription:(id)a4 callCapabilitiesDidChange:(id)a5;
- (void)client:(id)a3 subscription:(id)a4 capabilitiesDidChange:(id)a5;
- (void)emergencyCallbackModeDidChangeForAllSubscriptionsForClient:(id)a3;
- (void)endEmergencyCallbackMode;
- (void)invalidateAndRefreshThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)invalidateAndRefreshVoLTECallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)invalidateAndRefreshWiFiCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)setAssociatedThumperAccountID:(id)a3;
- (void)setCallCapabilities:(id)a3 forSenderIdentityCapabilitiesState:(id)a4;
- (void)setCapabilitiesValid:(BOOL)a3;
- (void)setCapabilityInfo:(id)a3 forSubscription:(id)a4 senderIdentityCapabilitiesState:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setEmergencyCallbackModeEnabled:(BOOL)a3;
- (void)setLocalThumperAccounts:(id)a3;
- (void)setLocalThumperDeviceID:(id)a3;
- (void)setSecondaryThumperAccounts:(id)a3;
- (void)setSenderIdentityCapabilitiesStateByUUID:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5;
- (void)setThumperCallingAssociatedAccountID:(id)a3;
- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)subscriptionsDidChangeForClient:(id)a3;
@end

@implementation CSDTelephonyCallCapabilities

- (CSDTelephonyCallCapabilities)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = -[CSDCoreTelephonyClient initWithQueue:shouldRegisterForECBMNotification:]( objc_alloc(&OBJC_CLASS___CSDCoreTelephonyClient),  "initWithQueue:shouldRegisterForECBMNotification:",  v4,  1LL);
  v6 = -[CSDEmergencyCallbackCapabilities initWithQueue:]( objc_alloc(&OBJC_CLASS___CSDEmergencyCallbackCapabilities),  "initWithQueue:",  v4);
  v7 = -[CSDTelephonyCallCapabilities initWithQueue:coreTelephonyClient:emergencyCallbackCapabilities:]( self,  "initWithQueue:coreTelephonyClient:emergencyCallbackCapabilities:",  v4,  v5,  v6);

  return v7;
}

- (CSDTelephonyCallCapabilities)initWithQueue:(id)a3 coreTelephonyClient:(id)a4 emergencyCallbackCapabilities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CSDTelephonyCallCapabilities;
  v12 = -[CSDTelephonyCallCapabilities init](&v26, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    subscriptions = v13->_subscriptions;
    v13->_subscriptions = (NSSet *)v14;

    senderIdentityCapabilitiesStateByUUID = v13->_senderIdentityCapabilitiesStateByUUID;
    v13->_senderIdentityCapabilitiesStateByUUID = (NSDictionary *)&__NSDictionary0__struct;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    lastSavedAccountIDByCapability = v13->_lastSavedAccountIDByCapability;
    v13->_lastSavedAccountIDByCapability = (NSMutableDictionary *)v17;

    objc_storeStrong((id *)&v13->_coreTelephonyClient, a4);
    -[CSDCoreTelephonyClient setDelegate:](v13->_coreTelephonyClient, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_emergencyCallbackCapabilities, a5);
    objc_initWeak(&location, v13);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1001622B8;
    v23[3] = &unk_1003D7DF0;
    objc_copyWeak(&v24, &location);
    -[CSDEmergencyCallbackCapabilities setEmergencyCallbackCapabilitiesDidChange:]( v13->_emergencyCallbackCapabilities,  "setEmergencyCallbackCapabilitiesDidChange:",  v23);
    queue = (dispatch_queue_s *)v13->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001622FC;
    block[3] = &unk_1003D7730;
    v22 = v13;
    dispatch_async(queue, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (NSString)debugDescription
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p>\n",  objc_opt_class(self, a2),  self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (self->_capabilitiesValid) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v4 appendFormat:@"    Are capabilities valid: %@\n", v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDTelephonyCallCapabilities senderIdentityCapabilitiesStateByUUID]( self,  "senderIdentityCapabilitiesStateByUUID"));
  [v5 appendFormat:@"    Sender identity capabilities: %@\n", v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities emergencyCallbackCapabilities](self, "emergencyCallbackCapabilities"));
  [v5 appendFormat:@"    Emergency callback capabilities: %@\n", v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities localThumperDeviceID](self, "localThumperDeviceID"));
  [v5 appendFormat:@"    Thumper local device ID: %@\n", v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities localThumperAccounts](self, "localThumperAccounts"));
  [v5 appendFormat:@"    Thumper local accounts: %@\n", v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities secondaryThumperAccounts](self, "secondaryThumperAccounts"));
  [v5 appendFormat:@"    Thumper secondary accounts: %@\n", v11];

  return (NSString *)v5;
}

- (BOOL)areCapabilitiesValid
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_capabilitiesValid;
}

- (NSArray)localThumperAccounts
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_localThumperAccounts;
}

- (NSArray)secondaryThumperAccounts
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_secondaryThumperAccounts;
}

- (void)setSecondaryThumperAccounts:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = self->_secondaryThumperAccounts;
  if ((TUObjectsAreEqualOrNil(v6, v4) & 1) == 0)
  {
    v7 = (NSArray *)[v4 copy];
    secondaryThumperAccounts = self->_secondaryThumperAccounts;
    self->_secondaryThumperAccounts = v7;

    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_secondaryThumperAccounts;
      int v12 = 138412546;
      v13 = v6;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Secondary Thumper accounts changed from %@ to %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (BOOL)isEmergencyCallbackModeEnabled
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_emergencyCallbackModeEnabled;
}

- (BOOL)isEmergencyCallbackPossible
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities emergencyCallbackCapabilities](self, "emergencyCallbackCapabilities"));
  unsigned __int8 v3 = [v2 emergencyCallbackPossible];

  return v3;
}

- (id)primaryThumperAccountUsingDevices:(id)a3 outgoingCallerIDURI:(id)a4 requireMatchingCallerIDURI:(BOOL)a5 requireAvailableDeviceSlots:(BOOL)a6
{
  BOOL v58 = a6;
  id v8 = a3;
  id v57 = a4;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities secondaryThumperAccounts](self, "secondaryThumperAccounts"));
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v8 count]));
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v67 objects:v79 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v68;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v68 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIDOverride]);

        if (v17)
        {
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 uniqueIDOverride]);
          [v53 setObject:v16 forKeyedSubscript:v18];
        }

        else
        {
          id v19 = sub_1001704C4();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v74 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Skipping device %@ because uniqueIDOverride is nil",  buf,  0xCu);
          }
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v67 objects:v79 count:16];
    }

    while (v13);
  }

  id v20 = sub_1001704C4();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v74 = v10;
    __int16 v75 = 2112;
    id v76 = v11;
    __int16 v77 = 2112;
    id v78 = v57;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Attempting to find primary Thumper account in accounts: %@ devices: %@ outgoingCallerIDURI: %@",  buf,  0x20u);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v22 = v10;
  id v52 = [v22 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v52)
  {
    id v49 = v11;
    id obj = v22;
    id v23 = 0LL;
    v55 = 0LL;
    v56 = 0LL;
    uint64_t v51 = *(void *)v64;
    do
    {
      uint64_t v24 = 0LL;
      do
      {
        if (*(void *)v64 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = v24;
        v25 = *(void **)(*((void *)&v63 + 1) + 8 * v24);
        objc_super v26 = (void *)objc_claimAutoreleasedReturnValue([v25 phoneNumberURI]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v25 primaryDeviceID]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:v27]);

        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 linkedUserURIs]);
        id v30 = [v29 countByEnumeratingWithState:&v59 objects:v71 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v60;
          do
          {
            for (j = 0LL; j != v31; j = (char *)j + 1)
            {
              if (*(void *)v60 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)j);
              if (TUStringsAreCaseInsensitiveEqual(v26, v34)
                && (!v58 || (uint64_t)[v25 availableDeviceSlots] >= 1))
              {
                id v35 = v25;

                if ([v28 isDefaultPairedDevice])
                {
                  id v36 = v35;

                  v55 = v36;
                }

                if (TUStringsAreCaseInsensitiveEqual(v34, v57))
                {
                  id v23 = v35;

                  v56 = v23;
                }

                else
                {
                  id v23 = v35;
                }
              }
            }

            id v31 = [v29 countByEnumeratingWithState:&v59 objects:v71 count:16];
          }

          while (v31);
        }

        uint64_t v24 = v54 + 1;
      }

      while ((id)(v54 + 1) != v52);
      id v52 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
    }

    while (v52);

    if (v55)
    {
      id v37 = sub_1001704C4();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      id v11 = v49;
      v39 = v56;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v74 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Found default paired device; setting primary Thumper account to %@",
          buf,
          0xCu);
      }

      id v40 = v55;
      v41 = v40;
    }

    else
    {
      id v11 = v49;
      if (v56)
      {
        id v43 = sub_1001704C4();
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v74 = v57;
          __int16 v75 = 2112;
          id v76 = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Found matching outgoing caller ID %@; setting primary Thumper account to %@",
            buf,
            0x16u);
        }

        id v40 = v56;
        v39 = v40;
        v41 = 0LL;
      }

      else
      {
        v41 = 0LL;
        if (!v23 || a5)
        {
          v39 = 0LL;
          v42 = 0LL;
          goto LABEL_51;
        }

        id v45 = sub_1001704C4();
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v74 = v57;
          __int16 v75 = 2112;
          id v76 = obj;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "No primary Thumper account found for outgoingRelayCallerID %@ but requireMatchingCallerID is NO. Arbitrarily choosing last Thumper account from list: %@",  buf,  0x16u);
        }

        id v40 = v23;
        id v23 = v40;
        v41 = 0LL;
        v39 = 0LL;
      }
    }

    v42 = v40;
LABEL_51:
    id v22 = obj;
    goto LABEL_52;
  }

  v41 = 0LL;
  v39 = 0LL;
  id v23 = 0LL;
  v42 = 0LL;
LABEL_52:

  return v42;
}

- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v6));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
    [v9 setSubscription:v8 capability:kCTCapabilityAgent enabled:v4 info:0];
  }

  else
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities subscriptions](self, "subscriptions"));
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find subscription with UUID %@. All subscriptions: %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v6));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
    [v9 setSubscription:v8 capability:kCTCapabilityAgent2 enabled:v4 info:0];
  }

  else
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities subscriptions](self, "subscriptions"));
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find subscription with UUID %@. All subscriptions: %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v6));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDTelephonyCallCapabilities senderIdentityCapabilitiesStateByUUID]( self,  "senderIdentityCapabilitiesStateByUUID"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
    uint64_t v12 = kCTCapabilityAgent2;
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 wiFiCallingCapabilitiesState]);
    id v14 = [v13 isEnabled];
    uint64_t v23 = kPSWifiCallingRoamingEnabled;
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    uint64_t v24 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    [v11 setSubscription:v8 capability:v12 enabled:v14 info:v16];
  }

  else
  {
    id v17 = sub_1001704C4();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities subscriptions](self, "subscriptions"));
      int v19 = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find subscription with UUID %@. All subscriptions: %@",  (uint8_t *)&v19,  0x16u);
    }
  }
}

- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v6));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
    [v9 setSubscription:v8 capability:kCTCapabilityPhoneServices enabled:v4 info:0];
  }

  else
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities subscriptions](self, "subscriptions"));
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find subscription with UUID %@. All subscriptions: %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (NSString)associatedThumperAccountID
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities lastSavedAccountIDByCapability](self, "lastSavedAccountIDByCapability"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kPSAssociatedAccountID]);

  return (NSString *)v5;
}

- (void)setAssociatedThumperAccountID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = kPSAssociatedAccountID;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities lastSavedAccountIDByCapability](self, "lastSavedAccountIDByCapability"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if ((TUStringsAreEqualOrNil(v8, v4) & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDTelephonyCallCapabilities lastSavedAccountIDByCapability]( self,  "lastSavedAccountIDByCapability"));
    [v9 setObject:v4 forKeyedSubscript:v6];

    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Associated Thumper account ID changed from \"%@\" to \"%@\"",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (void)setThumperCallingAssociatedAccountID:(id)a3
{
  id v4 = (__CFString *)a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities associatedThumperAccountID](self, "associatedThumperAccountID"));
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v4;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Comparing specified Thumper account ID %@ to cached associated Thumper account ID %@",  buf,  0x16u);
  }

  if ((TUStringsAreCaseInsensitiveEqualOrNil(v4, v6) & 1) == 0)
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Sending CommCenter a request to set associated Thumper account ID to \"%@\"",  buf,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
    uint64_t v12 = kCTCapabilityPhoneServices;
    if (v4) {
      int v13 = v4;
    }
    else {
      int v13 = &stru_1003E7718;
    }
    uint64_t v15 = kPSAssociatedAccountID;
    v16 = v13;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    [v11 setCapability:v12 enabled:0 info:v14];
  }
}

- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v9));
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
    int v13 = v12;
    if (v6) {
      [v12 addSecondaryThumperDeviceWithIDSDeviceIdentifier:v8 toSubscription:v11];
    }
    else {
      [v12 removeSecondaryThumperDeviceWithIDSDeviceIdentifier:v8 fromSubscription:v11];
    }
  }

  else
  {
    id v14 = sub_1001704C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities subscriptions](self, "subscriptions"));
      int v17 = 138412546;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find subscription with UUID %@. All subscriptions: %@",  (uint8_t *)&v17,  0x16u);
    }
  }
}

- (void)invalidateAndRefreshWiFiCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDTelephonyCallCapabilities senderIdentityCapabilitiesStateByUUID]( self,  "senderIdentityCapabilitiesStateByUUID"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 wiFiCallingCapabilitiesState]);
  [v7 invalidateProvisioningURL];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  [v9 recheckAccountStatusForSubscription:v8 capability:kCTCapabilityAgent2];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities delegate](self, "delegate"));
  [v10 telephonyCallCapabilitiesChanged];
}

- (void)invalidateAndRefreshVoLTECallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDTelephonyCallCapabilities senderIdentityCapabilitiesStateByUUID]( self,  "senderIdentityCapabilitiesStateByUUID"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 voLTECallingCapabilitiesState]);
  [v7 invalidateProvisioningURL];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  [v9 recheckAccountStatusForSubscription:v8 capability:kCTCapabilityAgent];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities delegate](self, "delegate"));
  [v10 telephonyCallCapabilitiesChanged];
}

- (void)invalidateAndRefreshThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDTelephonyCallCapabilities senderIdentityCapabilitiesStateByUUID]( self,  "senderIdentityCapabilitiesStateByUUID"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 thumperCallingCapabilitiesState]);
  [v7 invalidateProvisioningURL];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities _subscriptionWithUUID:](self, "_subscriptionWithUUID:", v4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  [v9 recheckAccountStatusForSubscription:v8 capability:kCTCapabilityPhoneServices];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities delegate](self, "delegate"));
  [v10 telephonyCallCapabilitiesChanged];
}

- (void)endEmergencyCallbackMode
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  [v4 endEmergencyCallbackMode];
}

- (id)secondaryThumperAccountForAccountID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities secondaryThumperAccounts](self, "secondaryThumperAccounts", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountID]);
        int v12 = TUStringsAreCaseInsensitiveEqual(v11, v4);

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)secondaryThumperAccountForRegisteredDeviceID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities secondaryThumperAccounts](self, "secondaryThumperAccounts", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v10 containsRegisteredDeviceID:v4])
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)telephonySubscriptionLabelIdentifierForSenderIdentityUUID:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities _subscriptionWithUUID:](self, "_subscriptionWithUUID:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 labelID]);

  return v4;
}

- (void)setCallCapabilities:(id)a3 forSenderIdentityCapabilitiesState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 isCSCallingAvailable];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 csCallingCapabilitiesState]);
  [v10 setCurrentlyAvailable:v9];

  id v11 = [v7 isVoLTECallingAvailable];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 voLTECallingCapabilitiesState]);
  [v12 setCurrentlyAvailable:v11];

  id v13 = [v7 isWiFiCallingAvailable];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 wiFiCallingCapabilitiesState]);
  [v14 setCurrentlyAvailable:v13];

  id v15 = [v7 isWiFiCallingAvailable];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 thumperCallingCapabilitiesState]);
  [v16 setCurrentlyAvailable:v15];

  id v17 = [v7 isWiFiEmergencyCallingAllowed];
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 wiFiCallingCapabilitiesState]);
  [v18 setEmergencySupported:v17];

  id v19 = [v7 isWiFiEmergencyCallingAvailable];
  id v20 = (id)objc_claimAutoreleasedReturnValue([v6 wiFiCallingCapabilitiesState]);

  [v20 setEmergencyCurrentlyAvailable:v19];
}

- (void)setCapabilityInfo:(id)a3 forSubscription:(id)a4 senderIdentityCapabilitiesState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received request to set capability information %@ capabilityInfo for subscription %@",  buf,  0x16u);
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kCTCapabilityAgent]);
  if (v14)
  {
    id v15 = [[TUCTCapabilitiesState alloc] initWithCapabilityInfo:v14];
    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Updating VoLTE capability state with %@",  buf,  0xCu);
    }

    [v10 setVoLTECallingCapabilitiesState:v15];
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kCTCapabilityAgent2]);
  if (v18)
  {
    id v19 = [[TUCTCapabilitiesState alloc] initWithCapabilityInfo:v18];
    id v20 = sub_1001704C4();
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Updating VoWiFi capability state with %@",  buf,  0xCu);
    }

    [v10 setWiFiCallingCapabilitiesState:v19];
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kCTCapabilityPhoneServices]);
  if (v22)
  {
    id v23 = [[TUThumperCTCapabilitiesState alloc] initWithCapabilityInfo:v22];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountID]);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities associatedThumperAccountID](self, "associatedThumperAccountID"));
    objc_msgSend(v23, "setAssociated:", TUStringsAreCaseInsensitiveEqual(v24, v25));

    if ([v23 isEnabled])
    {
      id v36 = v9;
      objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 telephonySubscriptions]);
      id v28 = [v27 count];
      if (v28 == (id)1 || !objc_msgSend(v36, "csd_isTelephony"))
      {
        [v23 setSupportsDefaultPairedDevice:v28 == (id)1];
      }

      else
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v35 preferredVoiceSubscriptionUUID]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v36 uuid]);
        objc_msgSend(v23, "setSupportsDefaultPairedDevice:", objc_msgSend(v34, "isEqual:"));
      }

      id v9 = v36;
    }

    else
    {
      [v23 setSupportsDefaultPairedDevice:0];
    }

    id v30 = sub_1001704C4();
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Updating Thumper capability state with %@",  buf,  0xCu);
    }

    [v10 setThumperCallingCapabilitiesState:v23];
  }

  uint64_t v32 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSimultaneousCallAndDataCurrentlySupported]);
  uint64_t v33 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSuspendInternetOnBBCall]);
  if (v32 | v33) {
    -[CSDTelephonyCallCapabilities _updateSystemCapabilitiesStateForSubscription:capabilitiesState:]( self,  "_updateSystemCapabilitiesStateForSubscription:capabilitiesState:",  v9,  v10);
  }
  if (v14 || v18 || v22) {
    -[CSDTelephonyCallCapabilities _updateCallCapabilitiesForSubscription:capabilitiesState:]( self,  "_updateCallCapabilitiesForSubscription:capabilitiesState:",  v9,  v10);
  }
}

- (id)_subscriptionWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities subscriptions](self, "subscriptions", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)_updateState
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[CSDTelephonyCallCapabilities _updateThumperAccountState](self, "_updateThumperAccountState");
  -[CSDTelephonyCallCapabilities _updateSubscriptions](self, "_updateSubscriptions");
}

- (void)_updateSubscriptions
{
  v2 = self;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](v2, "coreTelephonyClient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subscriptions]);
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  uint64_t v8 = v7;

  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v8 count]));
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v63 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDTelephonyCallCapabilities _senderIdentityCapabilitiesStateForSubscription:]( v2,  "_senderIdentityCapabilitiesStateForSubscription:",  v13));
        if (v15)
        {
          -[CSDTelephonyCallCapabilities _updateSystemCapabilitiesStateForSubscription:capabilitiesState:]( v2,  "_updateSystemCapabilitiesStateForSubscription:capabilitiesState:",  v13,  v15);
          [v53 setObject:v15 forKeyedSubscript:v14];
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    }

    while (v10);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v47 = (id)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities secondaryThumperAccounts](v2, "secondaryThumperAccounts"));
  id v52 = [v47 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v59;
    id v49 = v2;
    do
    {
      for (j = 0LL; j != v52; j = (char *)j + 1)
      {
        if (*(void *)v59 != v51) {
          objc_enumerationMutation(v47);
        }
        __int128 v17 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 accountID]);
        if ([v18 length])
        {
          v50 = v17;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v53 allValues]);
          id v20 = [v19 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v55;
LABEL_21:
            uint64_t v23 = 0LL;
            while (1)
            {
              if (*(void *)v55 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v54 + 1) + 8 * v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue([v24 thumperCallingCapabilitiesState]);
              objc_super v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accountID]);
              char v27 = TUStringsAreCaseInsensitiveEqualOrNil(v18, v26);

              if ((v27 & 1) != 0) {
                break;
              }
              if (v21 == (id)++v23)
              {
                id v21 = [v19 countByEnumeratingWithState:&v54 objects:v66 count:16];
                v2 = v49;
                if (v21) {
                  goto LABEL_21;
                }
                goto LABEL_27;
              }
            }

            id v28 = v24;

            v2 = v49;
            if (v28) {
              goto LABEL_32;
            }
          }

          else
          {
LABEL_27:
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue( +[CTXPCContextInfo csd_unknownContextInfoForAccountID:]( &OBJC_CLASS___CTXPCContextInfo,  "csd_unknownContextInfoForAccountID:",  v18));
          if (v29)
          {
            [v46 addObject:v29];
            id v30 = objc_alloc(&OBJC_CLASS___TUSenderIdentityCapabilitiesState);
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 uuid]);
            id v32 = [v30 initWithSenderIdentityUUID:v31];

            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v50 accountID]);
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v32 thumperCallingCapabilitiesState]);
            [v34 setAccountID:v33];

            id v35 = (void *)objc_claimAutoreleasedReturnValue([v50 allowedSecondaryDeviceIDs]);
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v32 thumperCallingCapabilitiesState]);
            [v36 setApprovedSecondaryDeviceIDs:v35];

            id v37 = (void *)objc_claimAutoreleasedReturnValue([v50 accountID]);
            id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities associatedThumperAccountID](v2, "associatedThumperAccountID"));
            uint64_t v39 = TUStringsAreCaseInsensitiveEqual(v37, v38);
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v32 thumperCallingCapabilitiesState]);
            [v40 setAssociated:v39];

            v41 = (void *)objc_claimAutoreleasedReturnValue([v50 primaryDeviceID]);
            v42 = (void *)objc_claimAutoreleasedReturnValue([v32 thumperCallingCapabilitiesState]);
            [v42 setLocalDeviceID:v41];

            id v43 = (void *)objc_claimAutoreleasedReturnValue([v32 thumperCallingCapabilitiesState]);
            [v43 setSupported:1];

            v44 = (void *)objc_claimAutoreleasedReturnValue([v32 senderIdentityUUID]);
            [v53 setObject:v32 forKeyedSubscript:v44];
          }

          id v28 = 0LL;
LABEL_32:
        }
      }

      id v52 = [v47 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }

    while (v52);
  }

  id v45 = (void *)objc_claimAutoreleasedReturnValue([obj setByAddingObjectsFromSet:v46]);
  -[CSDTelephonyCallCapabilities setSubscriptions:](v2, "setSubscriptions:", v45);

  -[CSDTelephonyCallCapabilities setSenderIdentityCapabilitiesStateByUUID:]( v2,  "setSenderIdentityCapabilitiesStateByUUID:",  v53);
  -[CSDTelephonyCallCapabilities _updateEmergencyCallbackModeEnabledState]( v2,  "_updateEmergencyCallbackModeEnabledState");
}

- (void)_updateCallCapabilitiesForSubscription:(id)a3 capabilitiesState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callCapabilitiesForSubscription:v6]);

  id v11 = sub_1001704C4();
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    __int128 v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Retrieved new telephony call capabilities for subscription %@: %@",  (uint8_t *)&v13,  0x16u);
  }

  -[CSDTelephonyCallCapabilities setCallCapabilities:forSenderIdentityCapabilitiesState:]( self,  "setCallCapabilities:forSenderIdentityCapabilitiesState:",  v10,  v7);
}

- (id)_senderIdentityCapabilitiesStateForSubscription:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v7 = kCTCapabilityAgent;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 capabilityInfoForSubscription:v4 capability:v7]);
  [v6 setObject:v9 forKeyedSubscript:v7];

  uint64_t v10 = kCTCapabilityAgent2;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 capabilityInfoForSubscription:v4 capability:v10]);
  [v6 setObject:v12 forKeyedSubscript:v10];

  uint64_t v13 = kCTCapabilityPhoneServices;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 capabilityInfoForSubscription:v4 capability:v13]);
  [v6 setObject:v15 forKeyedSubscript:v13];

  if ([v6 count])
  {
    id v16 = objc_alloc(&OBJC_CLASS___TUSenderIdentityCapabilitiesState);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    id v18 = [v16 initWithSenderIdentityUUID:v17];

    -[CSDTelephonyCallCapabilities setCapabilityInfo:forSubscription:senderIdentityCapabilitiesState:]( self,  "setCapabilityInfo:forSubscription:senderIdentityCapabilitiesState:",  v6,  v4,  v18);
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (void)_updateSystemCapabilitiesStateForSubscription:(id)a3 capabilitiesState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 systemCapabilitiesForSubscription:v6]);

  id v11 = sub_1001704C4();
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Retrieved new system capabilities for subscription %@: %@",  (uint8_t *)&v15,  0x16u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSimultaneousCallAndDataCurrentlySupported]);
  if ([v13 BOOLValue])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSuspendInternetOnBBCall]);
    objc_msgSend(v7, "setSupportsSimultaneousVoiceAndData:", objc_msgSend(v14, "BOOLValue") ^ 1);
  }

  else
  {
    [v7 setSupportsSimultaneousVoiceAndData:0];
  }
}

- (void)_updateEmergencyCallbackModeEnabledState
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  id v5 = [v4 isEmergencyCallbackModeEnabled];

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"disabled";
    if ((_DWORD)v5) {
      uint64_t v8 = @"enabled";
    }
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting new emergency callback mode %@.",  (uint8_t *)&v9,  0xCu);
  }

  -[CSDTelephonyCallCapabilities setEmergencyCallbackModeEnabled:](self, "setEmergencyCallbackModeEnabled:", v5);
}

- (void)_updateThumperAccountState
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  __int128 v57 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities coreTelephonyClient](self, "coreTelephonyClient"));
  id v5 = (CSDThumperAccount *)objc_claimAutoreleasedReturnValue([v4 thumperDeviceInfo]);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating Thumper account state with %@",  buf,  0xCu);
  }

  -[CSDTelephonyCallCapabilities setCapabilitiesValid:](v57, "setCapabilitiesValid:", v5 != 0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kPSDeviceId));
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
  __int128 v54 = v8;
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    id v11 = (CSDThumperAccount *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);
    id v12 = sub_1001704C4();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Updated local Thumper device ID to %@",  buf,  0xCu);
    }

    -[CSDTelephonyCallCapabilities setLocalThumperDeviceID:](v57, "setLocalThumperDeviceID:", v11);
  }

  else
  {
    id v11 = 0LL;
  }

  __int128 v59 = (CSDThumperAccount *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v58 = (CSDThumperAccount *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kPSThumperCalling));

  __int128 v56 = v5;
  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kPSAccountList));
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v65;
    do
    {
      id v19 = 0LL;
      do
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(CSDThumperAccount **)(*((void *)&v64 + 1) + 8LL * (void)v19);
        id v21 = -[CSDThumperAccount initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___CSDThumperAccount),  "initWithDictionaryRepresentation:",  v20);
        uint64_t v22 = v21;
        if (v21)
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDThumperAccount primaryDeviceID](v21, "primaryDeviceID"));
          int v24 = TUStringsAreCaseInsensitiveEqual(v11, v23);

          if (v24)
          {
            v25 = v59;
LABEL_23:
            -[CSDThumperAccount addObject:](v25, "addObject:", v22);
            goto LABEL_24;
          }

          id v28 = sub_1001704C4();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v30)
            {
              *(_DWORD *)buf = 138412290;
              v71 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Adding thumperAccount %@ to secondaryThumperAccounts",  buf,  0xCu);
            }

            v25 = v58;
            goto LABEL_23;
          }

          if (v30)
          {
            *(_DWORD *)buf = 138412290;
            v71 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Not adding thumperAccount %@ to accounts list",  buf,  0xCu);
          }
        }

        else
        {
          id v26 = sub_1001704C4();
          char v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not initialize Thumper account with Thumper account dictionary: %@",  buf,  0xCu);
          }
        }

- (void)subscriptionsDidChangeForClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Subscriptions changed for client: %@",  (uint8_t *)&v9,  0xCu);
  }

  -[CSDTelephonyCallCapabilities _updateSubscriptions](self, "_updateSubscriptions");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities delegate](self, "delegate"));
  [v8 telephonyCallCapabilitiesChanged];
}

- (void)client:(id)a3 subscription:(id)a4 callCapabilitiesDidChange:(id)a5
{
  id v13 = a5;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  int v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDTelephonyCallCapabilities senderIdentityCapabilitiesStateByUUID]( self,  "senderIdentityCapabilitiesStateByUUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);
  if (v11)
  {
    -[CSDTelephonyCallCapabilities setCallCapabilities:forSenderIdentityCapabilitiesState:]( self,  "setCallCapabilities:forSenderIdentityCapabilitiesState:",  v13,  v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities delegate](self, "delegate"));
    [v12 telephonyCallCapabilitiesChanged];
  }
}

- (void)client:(id)a3 capabilitiesDidChange:(id)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue", a3, a4));
  dispatch_assert_queue_V2(v5);

  if (-[CSDTelephonyCallCapabilities shouldUpdateSubscriptions](self, "shouldUpdateSubscriptions"))
  {
    -[CSDTelephonyCallCapabilities _updateSubscriptions](self, "_updateSubscriptions");
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities delegate](self, "delegate"));
    [v6 telephonyCallCapabilitiesChanged];
  }

- (void)client:(id)a3 subscription:(id)a4 capabilitiesDidChange:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  int v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDTelephonyCallCapabilities senderIdentityCapabilitiesStateByUUID]( self,  "senderIdentityCapabilitiesStateByUUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (-[CSDTelephonyCallCapabilities shouldUpdateSubscriptions](self, "shouldUpdateSubscriptions") || !v11) {
    -[CSDTelephonyCallCapabilities _updateSubscriptions](self, "_updateSubscriptions");
  }
  else {
    -[CSDTelephonyCallCapabilities setCapabilityInfo:forSubscription:senderIdentityCapabilitiesState:]( self,  "setCapabilityInfo:forSubscription:senderIdentityCapabilitiesState:",  v7,  v13,  v11);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities delegate](self, "delegate"));
  [v12 telephonyCallCapabilitiesChanged];
}

- (void)emergencyCallbackModeDidChangeForAllSubscriptionsForClient:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  -[CSDTelephonyCallCapabilities _updateEmergencyCallbackModeEnabledState]( self,  "_updateEmergencyCallbackModeEnabledState");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities delegate](self, "delegate"));
  [v5 telephonyCallCapabilitiesChanged];
}

- (BOOL)shouldUpdateSubscriptions
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities associatedThumperAccountID](self, "associatedThumperAccountID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities secondaryThumperAccounts](self, "secondaryThumperAccounts"));
  -[CSDTelephonyCallCapabilities _updateThumperAccountState](self, "_updateThumperAccountState");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities associatedThumperAccountID](self, "associatedThumperAccountID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDTelephonyCallCapabilities secondaryThumperAccounts](self, "secondaryThumperAccounts"));
  if ((TUStringsAreCaseInsensitiveEqualOrNil(v3, v5) & 1) == 0)
  {
    id v8 = sub_1001704C4();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v10 = "Subscription cache requires an update; associated Thumper account ID changed";
      id v11 = (uint8_t *)&v15;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }

- (CSDTelephonyCallCapabilitiesDelegate)delegate
{
  return (CSDTelephonyCallCapabilitiesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)setCapabilitiesValid:(BOOL)a3
{
  self->_capabilitiesValid = a3;
}

- (NSDictionary)senderIdentityCapabilitiesStateByUUID
{
  return self->_senderIdentityCapabilitiesStateByUUID;
}

- (void)setSenderIdentityCapabilitiesStateByUUID:(id)a3
{
}

- (NSString)localThumperDeviceID
{
  return self->_localThumperDeviceID;
}

- (void)setLocalThumperDeviceID:(id)a3
{
}

- (void)setLocalThumperAccounts:(id)a3
{
}

- (void)setEmergencyCallbackModeEnabled:(BOOL)a3
{
  self->_emergencyCallbackModeEnabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSSet)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSMutableDictionary)lastSavedAccountIDByCapability
{
  return self->_lastSavedAccountIDByCapability;
}

- (CSDCoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (CSDEmergencyCallbackCapabilities)emergencyCallbackCapabilities
{
  return self->_emergencyCallbackCapabilities;
}

- (void).cxx_destruct
{
}

@end