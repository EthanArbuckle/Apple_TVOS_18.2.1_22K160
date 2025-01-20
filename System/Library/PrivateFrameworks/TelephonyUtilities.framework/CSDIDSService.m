@interface CSDIDSService
+ (CSDIDSService)sharedInstance;
- (BOOL)checkValidityForSelfPseudonymString:(id)a3;
- (BOOL)defaultPairedDeviceExists;
- (BOOL)hasActiveAccounts;
- (BOOL)isServiceEnabledForTelephonySubscriptionLabelIdentifier:(id)a3;
- (BOOL)pairedDeviceExists;
- (BOOL)relayCapableDeviceExists;
- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)telephonyCapableDeviceExists;
- (CSDIDSService)initWithName:(id)a3;
- (CSDIDSService)initWithName:(id)a3 service:(id)a4;
- (CSDIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5;
- (IDSAccount)account;
- (IDSAccountController)accountController;
- (IDSDevice)defaultPairedDevice;
- (IDSDevice)pairedDevice;
- (IDSIDQueryController)idsQueryController;
- (IDSService)idsService;
- (IDSServicePseudonymDelegate)delegate;
- (NSArray)allAliases;
- (NSArray)devices;
- (NSSet)aliases;
- (NSSet)availableOutgoingRelayCallerIDs;
- (NSString)callerID;
- (NSString)countryCode;
- (NSString)debugDescription;
- (NSString)localDeviceUniqueID;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)accountForTelephonySubscriptionLabelIdentifier:(id)a3;
- (id)accountWithCallerID:(id)a3;
- (id)anyActiveAccount;
- (id)createGroupSessionProviderWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 localMember:(id)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13;
- (id)deviceDestinationsWithCapability:(id)a3 localHandle:(id)a4;
- (id)deviceForFromID:(id)a3;
- (id)deviceWithUniqueID:(id)a3;
- (id)devicesWithCapability:(id)a3;
- (id)idsDeviceID;
- (id)pseudonymForPseudonymString:(id)a3;
- (unint64_t)registrationRestrictionReason;
- (void)_noteAction:(int64_t)a3 onHandle:(id)a4 completionHandle:(id)a5;
- (void)_update;
- (void)accountController:(id)a3 accountAdded:(id)a4;
- (void)accountController:(id)a3 accountDisabled:(id)a4;
- (void)accountController:(id)a3 accountEnabled:(id)a4;
- (void)accountController:(id)a3 accountRemoved:(id)a4;
- (void)addServiceDelegate:(id)a3 queue:(id)a4;
- (void)checkValidityForPseudonymString:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleActiveAccountsChanged:(id)a3;
- (void)noteApprovedHandle:(id)a3 completionHandle:(id)a4;
- (void)noteDismissedHandle:(id)a3 completionHandle:(id)a4;
- (void)provisionPseudonymForHandle:(id)a3 featureID:(id)a4 scopeID:(id)a5 expiryDuration:(double)a6 allowedServices:(id)a7 completionHandler:(id)a8;
- (void)removeServiceDelegate:(id)a3;
- (void)renewPseudonym:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5;
- (void)renewPseudonymString:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5;
- (void)revokePseudonym:(id)a3 completionHandler:(id)a4;
- (void)revokePseudonymString:(id)a3 completionHandler:(id)a4;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didUpdatePseudonymsWithChanges:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setAvailableOutgoingRelayCallerIDs:(id)a3;
- (void)setDefaultPairedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setIdsQueryController:(id)a3;
- (void)setPairedDevice:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelayCapableDeviceExists:(BOOL)a3;
- (void)setTelephonyCapableDeviceExists:(BOOL)a3;
- (void)update;
@end

@implementation CSDIDSService

+ (CSDIDSService)sharedInstance
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:a1 file:@"CSDIDSService.m" lineNumber:66 description:@"All CSDIDSService subclasses must override +sharedInstance"];

  return 0LL;
}

- (CSDIDSService)initWithName:(id)a3
{
  id v4 = a3;
  v5 = -[IDSService initWithService:](objc_alloc(&OBJC_CLASS___IDSService), "initWithService:", v4);
  v6 = -[CSDIDSService initWithName:service:](self, "initWithName:service:", v4, v5);

  return v6;
}

- (CSDIDSService)initWithName:(id)a3 service:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSIDQueryController sharedInstance](&OBJC_CLASS___IDSIDQueryController, "sharedInstance"));
  v9 = -[CSDIDSService initWithName:service:queryController:](self, "initWithName:service:queryController:", v7, v6, v8);

  return v9;
}

- (CSDIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CSDIDSService;
  v11 = -[CSDIDSService init](&v37, "init");
  v13 = v11;
  if (v11)
  {
    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.telephonyutilities.callservicesd.%@",  objc_opt_class(v11, v12));
    id v15 = objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    v18 = (NSString *)[v8 copy];
    name = v13->_name;
    v13->_name = v18;

    v20 = -[IDSAccountController initWithService:]( objc_alloc(&OBJC_CLASS___IDSAccountController),  "initWithService:",  v8);
    accountController = v13->_accountController;
    v13->_accountController = v20;

    -[IDSAccountController addDelegate:queue:](v13->_accountController, "addDelegate:queue:", v13, v13->_queue);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountController accounts](v13->_accountController, "accounts"));
    id v23 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        v26 = 0LL;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * (void)v26) addRegistrationDelegate:v13 queue:v13->_queue];
          v26 = (char *)v26 + 1;
        }

        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }

      while (v24);
    }

    objc_storeStrong((id *)&v13->_idsService, a4);
    objc_storeStrong((id *)&v13->_idsQueryController, a5);
    v27 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    featureFlags = v13->_featureFlags;
    v13->_featureFlags = v27;

    -[CSDIDSService addServiceDelegate:queue:](v13, "addServiceDelegate:queue:", v13, v13->_queue);
    v29 = (dispatch_queue_s *)v13->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100184CAC;
    block[3] = &unk_1003D7730;
    v32 = v13;
    dispatch_async(v29, block);
  }

  return v13;
}

- (NSString)callerID
{
  return 0LL;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDIDSService;
  -[CSDIDSService dealloc](&v4, "dealloc");
}

- (NSString)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@\n",  self));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService devices](self, "devices"));
  [v3 appendFormat:@"    devices: %@\n", v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService availableOutgoingRelayCallerIDs](self, "availableOutgoingRelayCallerIDs"));
  [v3 appendFormat:@"    availableOutgoingRelayCallerIDs: %@\n", v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService defaultPairedDevice](self, "defaultPairedDevice"));
  [v3 appendFormat:@"    defaultPairedDevice: %@\n", v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService pairedDevice](self, "pairedDevice"));
  [v3 appendFormat:@"    pairedDevice: %@\n", v7];

  if (-[CSDIDSService telephonyCapableDeviceExists](self, "telephonyCapableDeviceExists")) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  [v3 appendFormat:@"    telephonyCapableDeviceExists: %@\n", v8];
  if (-[CSDIDSService relayCapableDeviceExists](self, "relayCapableDeviceExists")) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  [v3 appendFormat:@"    relayCapableDeviceExists: %@\n", v9];
  return (NSString *)v3;
}

- (NSArray)allAliases
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accounts]);

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) vettedAliases]);
        [v3 addObjectsFromArray:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v3 copy];
  return (NSArray *)v11;
}

- (id)anyActiveAccount
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accounts]);

  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0LL;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 canSend])
        {
          id v10 = v9;

          id v6 = v10;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)hasActiveAccounts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accounts]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)accountWithCallerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService anyActiveAccount](self, "anyActiveAccount"));
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accounts]);
    id v7 = (id)objc_claimAutoreleasedReturnValue([v9 anyObject]);
  }

  if (!v4)
  {
    __int128 v14 = 0LL;
    goto LABEL_41;
  }

  id v34 = v7;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accounts]);

  id v12 = [v11 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (!v12)
  {
    __int128 v14 = 0LL;
    goto LABEL_40;
  }

  id v13 = v12;
  __int128 v14 = 0LL;
  uint64_t v15 = *(void *)v48;
  uint64_t v35 = *(void *)v48;
  __int128 v36 = v11;
  do
  {
    __int128 v16 = 0LL;
    id v38 = v13;
    do
    {
      if (*(void *)v48 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v16);
      if ([v17 canSend] && objc_msgSend(v4, "destinationIdIsPseudonym"))
      {
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pseudonyms]);
        id v19 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v19)
        {
          id v20 = v19;
          objc_super v37 = v14;
          uint64_t v21 = *(void *)v44;
          while (2)
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v44 != v21) {
                objc_enumerationMutation(v18);
              }
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 prefixedURI]);
              unsigned __int8 v25 = [v24 isEqualToString:v4];

              if ((v25 & 1) != 0)
              {
                id v11 = v36;
                __int128 v14 = v37;
                uint64_t v15 = v35;
                goto LABEL_32;
              }
            }

            id v20 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
            if (v20) {
              continue;
            }
            break;
          }

          id v11 = v36;
          __int128 v14 = v37;
          uint64_t v15 = v35;
LABEL_33:
          id v13 = v38;
        }
      }

      else
      {
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 aliasStrings]);
        id v26 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v40;
          while (2)
          {
            for (j = 0LL; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v40 != v28) {
                objc_enumerationMutation(v18);
              }
              if ([*(id *)(*((void *)&v39 + 1) + 8 * (void)j) isEqualToString:v4])
              {
LABEL_32:
                id v30 = v17;

                __int128 v14 = v30;
                goto LABEL_33;
              }
            }

            id v27 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v27) {
              continue;
            }
            goto LABEL_33;
          }
        }
      }

LABEL_35:
      __int128 v16 = (char *)v16 + 1;
    }

    while (v16 != v13);
    id v13 = [v11 countByEnumeratingWithState:&v47 objects:v53 count:16];
  }

  while (v13);
LABEL_40:

  id v7 = v34;
LABEL_41:
  if (v14) {
    v31 = v14;
  }
  else {
    v31 = v7;
  }
  id v32 = v31;

  return v32;
}

- (IDSAccount)account
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService callerID](self, "callerID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService accountWithCallerID:](self, "accountWithCallerID:", v3));

  return (IDSAccount *)v4;
}

- (id)idsDeviceID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 loginID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 IDSFormattedDestinationID]);

  return v4;
}

- (void)addServiceDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeServiceDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  [v5 removeDelegate:v4];
}

- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a4;
  id v18 = [a7 mutableCopy];
  id v19 = v18;
  if (v18) {
    id v20 = (NSMutableDictionary *)v18;
  }
  else {
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v21 = v20;

  v22 = -[CSDMessagingConversationMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage),  "initWithData:",  v15);
  id v23 = v22;
  if (v22 && -[CSDMessagingConversationMessage type](v22, "type") >= 30)
  {
    int64_t v37 = a6;
    id v38 = a8;
    uint64_t v24 = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
    uint64_t v25 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v21,  "objectForKeyedSubscript:",  IDSSendMessageOptionRequireAllRegistrationPropertiesKey));
    if (!v25) {
      goto LABEL_9;
    }
    id v26 = (void *)v25;
    __int128 v36 = self;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v24));
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSSet, v28);
    char isKindOfClass = objc_opt_isKindOfClass(v27, v29);

    self = v36;
    if ((isKindOfClass & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v24));
      id v32 = [v31 mutableCopy];

      self = v36;
      [v32 addObject:IDSRegistrationPropertySupportsSelfOneToOneInvites];
    }

    else
    {
LABEL_9:
      id v32 = (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsSelfOneToOneInvites));
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v32, v24);

    a6 = v37;
    a8 = v38;
  }

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](self, "service"));
  unsigned __int8 v34 = [v33 sendData:v15 fromAccount:v17 toDestinations:v16 priority:a6 options:v21 identifier:a8 error:a9];

  return v34;
}

- (NSSet)aliases
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 aliases]);

  return (NSSet *)v3;
}

- (id)createGroupSessionProviderWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 localMember:(id)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13
{
  BOOL v31 = a8;
  HIDWORD(v30) = a11;
  id v18 = a12;
  id v19 = a9;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  uint64_t v25 = objc_alloc(&OBJC_CLASS___CSDIDSGroupSessionProvider);
  unsigned __int8 v26 = [v19 isLightweightMember];

  LOBYTE(v30) = a13;
  *(_WORD *)((char *)&v29 + 1) = __PAIR16__(a11, a10);
  LOBYTE(v29) = v26;
  id v27 = -[CSDIDSGroupSessionProvider initWithGroupID:participantDestinationIDs:callerID:account:queue:isOneToOneModeEnabled:isLightweightMember:avLess:isScreenSharingRequest:ABTestConfiguration:isInitiator:]( v25,  "initWithGroupID:participantDestinationIDs:callerID:account:queue:isOneToOneModeEnabled:isLightweightMember:avL ess:isScreenSharingRequest:ABTestConfiguration:isInitiator:",  v24,  v23,  v22,  v21,  v20,  v31,  v29,  v18,  v30);

  return v27;
}

- (id)accountForTelephonySubscriptionLabelIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountMatchingSimIdentifier:v4]);

  return v6;
}

- (BOOL)isServiceEnabledForTelephonySubscriptionLabelIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[CSDIDSService accountForTelephonySubscriptionLabelIdentifier:]( self,  "accountForTelephonySubscriptionLabelIdentifier:",  a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (NSArray)devices
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100185B4C;
  id v11 = sub_100185B5C;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100185B64;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)deviceWithUniqueID:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService devices](self, "devices", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    id v10 = 0LL;
    id v11 = v8;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(id *)(*((void *)&v15 + 1) + 8LL * (void)v10);

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIDOverride]);
      unsigned __int8 v13 = [v12 isEqualToString:v4];

      if ((v13 & 1) != 0) {
        break;
      }
      id v10 = (char *)v10 + 1;
      id v11 = v8;
      if (v7 == v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    id v8 = 0LL;
  }

  return v8;
}

- (id)deviceForFromID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceForFromID:v4]);

  return v6;
}

- (id)devicesWithCapability:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService devices](self, "devices", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 capabilities]);
        id v13 = [v12 valueForCapability:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  id v14 = [v5 copy];
  return v14;
}

- (id)deviceDestinationsWithCapability:(id)a3 localHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService devices](self, "devices"));
  id v9 = [v8 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v52;
    __int128 v40 = v8;
    id v41 = v6;
    uint64_t v39 = *(void *)v52;
    do
    {
      id v12 = 0LL;
      id v43 = v10;
      do
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 capabilities]);
        id v15 = [v14 valueForCapability:v6];

        if (v15)
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 destination]);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 destinationURIs]);
          id v18 = [v17 count];

          if (v18)
          {
            __int128 v44 = v16;
            __int128 v45 = v12;
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 destinationURIs]);
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 anyObject]);
            id v21 = (void *)IDSCopyAddressDestinationForDestination(v20);
            id v22 = (void *)IDSCopyRawAddressForDestination(v21);
            id v23 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v22));

            id v24 = v23;
            if (([v23 isEquivalentToHandle:v7] & 1) == 0)
            {
              __int128 v42 = v23;
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "csd_aliasStrings"));
              __int128 v47 = 0u;
              __int128 v48 = 0u;
              __int128 v49 = 0u;
              __int128 v50 = 0u;
              id v26 = [v25 countByEnumeratingWithState:&v47 objects:v59 count:16];
              if (v26)
              {
                id v27 = v26;
                uint64_t v28 = *(void *)v48;
                do
                {
                  for (i = 0LL; i != v27; i = (char *)i + 1)
                  {
                    if (*(void *)v48 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
                    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v30));
                    if ([v31 isEquivalentToHandle:v7])
                    {
                      id v32 = sub_1001704C4();
                      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                      {
                        unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "csd_destinationForAlias:", v30));
                        *(_DWORD *)buf = 138412546;
                        v56 = v34;
                        __int16 v57 = 2112;
                        v58 = v13;
                        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Adding copyIDtoken:%@ to capable destinations for device: %@",  buf,  0x16u);
                      }

                      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "csd_destinationForAlias:", v30));
                      [v46 addObject:v35];
                    }
                  }

                  id v27 = [v25 countByEnumeratingWithState:&v47 objects:v59 count:16];
                }

                while (v27);
              }

              id v8 = v40;
              id v6 = v41;
              uint64_t v11 = v39;
              id v24 = v42;
            }

            __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v13 destination]);
            [v46 addObject:v36];

            id v10 = v43;
            __int128 v16 = v44;
            id v12 = v45;
          }
        }

        id v12 = (char *)v12 + 1;
      }

      while (v12 != v10);
      id v10 = [v8 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }

    while (v10);
  }

  id v37 = [v46 copy];
  return v37;
}

- (BOOL)telephonyCapableDeviceExists
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001862E4;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)relayCapableDeviceExists
{
  v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001863B4;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)defaultPairedDeviceExists
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService defaultPairedDevice](self, "defaultPairedDevice"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)pairedDeviceExists
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService pairedDevice](self, "pairedDevice"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (NSSet)availableOutgoingRelayCallerIDs
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100185B4C;
  uint64_t v11 = sub_100185B5C;
  id v12 = 0LL;
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100186508;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (IDSDevice)defaultPairedDevice
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100185B4C;
  uint64_t v11 = sub_100185B5C;
  id v12 = 0LL;
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001865FC;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (IDSDevice *)v4;
}

- (IDSDevice)pairedDevice
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100185B4C;
  uint64_t v11 = sub_100185B5C;
  id v12 = 0LL;
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001866F0;
  v6[3] = &unk_1003D9288;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (IDSDevice *)v4;
}

- (NSString)countryCode
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService account](self, "account"));
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 accountInfo]);
    int v23 = 138412290;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Determining country code using account info %@",  (uint8_t *)&v23,  0xCu);
  }

  unsigned int v7 = [v3 accountType];
  if (v7 != 1)
  {
    if (!v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService callerID](self, "callerID"));
      uint64_t v9 = 0LL;
      goto LABEL_10;
    }

    goto LABEL_8;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned int v11 = [v10 isTelephonyDevice];

  if (!v11)
  {
LABEL_8:
    uint64_t v9 = 0LL;
    goto LABEL_9;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v12 telephoneNumber]);

LABEL_9:
  uint64_t v8 = 0LL;
LABEL_10:
  uint64_t v13 = IMCountryCodeForNumber(v8);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }

  else
  {
    uint64_t v17 = IMCountryCodeForNumber(v9);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    __int128 v19 = v18;
    if (v18)
    {
      id v16 = v18;
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 regionBasePhoneNumber]);
      uint64_t v21 = IMCountryCodeForNumber(v20);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v21);
    }
  }

  return (NSString *)v16;
}

- (NSString)localDeviceUniqueID
{
  return (NSString *)(id)IDSCopyLocalDeviceUniqueID(self, a2);
}

- (void)setDelegate:(id)a3
{
}

- (void)provisionPseudonymForHandle:(id)a3 featureID:(id)a4 scopeID:(id)a5 expiryDuration:(double)a6 allowedServices:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](self, "service"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pseudonymPropertiesWithFeatureID:v16 scopeID:v15 expiryDurationInSeconds:a6]);

  id v19 = sub_1001704C4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](self, "service"));
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 serviceIdentifier]);
    uint64_t v24 = IDSLoggableDescriptionForHandleOnService(v21, v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v34 = v25;
    __int16 v35 = 2112;
    __int128 v36 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Asking IDS to generated a pseudonym for unprefixedURI: %@ and properties: %@",  buf,  0x16u);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](self, "service"));
  id v27 = objc_alloc(&OBJC_CLASS___IDSURI);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);
  id v29 = [v27 initWithUnprefixedURI:v28];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100186B50;
  v31[3] = &unk_1003DC110;
  id v32 = v14;
  id v30 = v14;
  [v26 provisionPseudonymForURI:v29 withProperties:v18 completion:v31];
}

- (void)revokePseudonymString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService pseudonymForPseudonymString:](self, "pseudonymForPseudonymString:", v6));
  if (v8)
  {
    -[CSDIDSService revokePseudonym:completionHandler:](self, "revokePseudonym:completionHandler:", v8, v7);
  }

  else
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](self, "service"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pseudonymURIMap]);
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "No IDSPseudonym matching string %@ was found. All pseudonym URIs: %@",  (uint8_t *)&v13,  0x16u);
    }

    v7[2](v7, 1LL, 0LL);
  }
}

- (void)revokePseudonym:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Asking IDS to revoke pseudonym: %@",  (uint8_t *)&v11,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](self, "service"));
  [v10 revokePseudonym:v6 completion:v7];
}

- (void)renewPseudonymString:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService pseudonymForPseudonymString:](self, "pseudonymForPseudonymString:", v8));
  if (v11)
  {
    -[CSDIDSService renewPseudonym:expirationDate:completionHandler:]( self,  "renewPseudonym:expirationDate:completionHandler:",  v11,  v9,  v10);
  }

  else
  {
    id v12 = sub_1001704C4();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No pseudonym matching %@ was found.",  (uint8_t *)&v14,  0xCu);
    }

    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0LL, 0LL, 0LL);
  }
}

- (void)renewPseudonym:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Asking IDS to renew pseudonym: %@", buf, 0xCu);
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](self, "service"));
  [v10 timeIntervalSince1970];
  double v15 = v14;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001870D8;
  v17[3] = &unk_1003DC110;
  id v18 = v9;
  id v16 = v9;
  [v13 renewPseudonym:v8 forUpdatedExpiryEpoch:v17 completion:v15];
}

- (void)checkValidityForPseudonymString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    if (-[CSDIDSService checkValidityForSelfPseudonymString:](self, "checkValidityForSelfPseudonymString:", v6))
    {
      v7[2](v7, 1LL);
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsQueryController](self, "idsQueryController"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService name](self, "name"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100187294;
      v13[3] = &unk_1003DC170;
      id v11 = v7;
      double v14 = v11;
      unsigned __int8 v12 = [v8 refreshIDStatusForDestination:v6 service:v9 listenerID:@"CSDIDSServiceQueryListenerID" queue:v10 completionBlock:v13];

      if ((v12 & 1) == 0) {
        v11[2](v11, 0LL);
      }
    }
  }
}

- (BOOL)checkValidityForSelfPseudonymString:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService pseudonymForPseudonymString:](self, "pseudonymForPseudonymString:", a3));
  id v4 = v3;
  if (v3) {
    unsigned int v5 = objc_msgSend(v3, "csd_isExpired") ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)pseudonymForPseudonymString:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](self, "service"));
  id v6 = [[IDSURI alloc] initWithPrefixedURI:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pseudonymForPseudonymURI:v6]);
  return v7;
}

- (void)noteApprovedHandle:(id)a3 completionHandle:(id)a4
{
}

- (void)noteDismissedHandle:(id)a3 completionHandle:(id)a4
{
}

- (void)_noteAction:(int64_t)a3 onHandle:(id)a4 completionHandle:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 normalizedValue]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v9));

  if ([v10 FZIDType] == (id)4)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService callerID](self, "callerID"));
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v11));

    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](self, "service"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001874C8;
    v14[3] = &unk_1003DC198;
    id v15 = v8;
    [v13 reportAction:a3 ofTempURI:v10 fromURI:v12 withCompletion:v14];
  }

  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
  [v5 addRegistrationDelegate:self queue:v6];
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
  [v5 addRegistrationDelegate:self queue:v6];
}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
}

- (void)handleActiveAccountsChanged:(id)a3
{
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Active accounts changed",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDIDSService _update](self, "_update");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService delegate](self, "delegate"));
  [v6 activeAccountsChangedForService:self];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Devices changed", (uint8_t *)&v7, 0xCu);
  }

  -[CSDIDSService _update](self, "_update");
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Nearby devices changed",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDIDSService _update](self, "_update");
}

- (void)service:(id)a3 didUpdatePseudonymsWithChanges:(id)a4
{
  id v5 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v16 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v12 = objc_msgSend(v11, "changeType", v16);
        if (!v12)
        {
          double v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService delegate](self, "delegate"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 pseudonym]);
          [v14 service:self pseudonymRemoved:v15];
          goto LABEL_13;
        }

        if (v12 == (id)2)
        {
          double v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService delegate](self, "delegate"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 pseudonym]);
          [v14 service:self pseudonymUpdated:v15];
LABEL_13:

          goto LABEL_14;
        }

        if (v12 != (id)1) {
          continue;
        }
        id v13 = sub_1001704C4();
        double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          id v22 = self;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "%@: Told that a pseudonym was added to our account.",  buf,  0xCu);
        }

- (unint64_t)registrationRestrictionReason
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  id v3 = [v2 registrationRestrictionReason];

  return (unint64_t)v3;
}

- (void)update
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDIDSService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100187A34;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_update
{
  p_pairedDevice = &self->_pairedDevice;
  id v32 = self->_pairedDevice;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  defaultPairedDevice = self->_defaultPairedDevice;
  self->_defaultPairedDevice = 0LL;

  id v6 = *p_pairedDevice;
  __int128 v33 = (id *)p_pairedDevice;
  *p_pairedDevice = 0LL;

  *(_WORD *)&self->_BOOL telephonyCapableDeviceExists = 0;
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService idsService](self, "idsService"));
  id v8 = (NSArray *)objc_claimAutoreleasedReturnValue([v7 devices]);
  devices = self->_devices;
  self->_devices = v8;

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  obj = self->_devices;
  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v59,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        if (![v14 isDefaultPairedDevice]
          || [v14 isPairedDevice])
        {
          self->_BOOL relayCapableDeviceExists = 1;
        }

        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 linkedUserURIs]);
        id v16 = [v15 countByEnumeratingWithState:&v36 objects:v58 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v37;
          do
          {
            for (j = 0LL; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v37 != v18) {
                objc_enumerationMutation(v15);
              }
              [v4 addObject:v20];
            }

            id v17 = [v15 countByEnumeratingWithState:&v36 objects:v58 count:16];
          }

          while (v17);
        }
      }

      id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v59,  16LL);
    }

    while (v11);
  }

  uint64_t v21 = (NSSet *)[v4 copy];
  availableOutgoingRelayCallerIDs = self->_availableOutgoingRelayCallerIDs;
  self->_availableOutgoingRelayCallerIDs = v21;

  id v23 = sub_1001704C4();
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    obja = self->_availableOutgoingRelayCallerIDs;
    BOOL v25 = self->_defaultPairedDevice != 0LL;
    BOOL v26 = self->_pairedDevice != 0LL;
    BOOL telephonyCapableDeviceExists = self->_telephonyCapableDeviceExists;
    BOOL relayCapableDeviceExists = self->_relayCapableDeviceExists;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByApplyingSelector:](self->_devices, "arrayByApplyingSelector:", "name"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "componentsJoinedByString:", @"\", \""));
    *(_DWORD *)buf = 138413826;
    __int128 v45 = self;
    __int16 v46 = 1024;
    BOOL v47 = v25;
    __int16 v48 = 1024;
    BOOL v49 = v26;
    __int16 v50 = 1024;
    BOOL v51 = telephonyCapableDeviceExists;
    __int16 v52 = 1024;
    BOOL v53 = relayCapableDeviceExists;
    __int16 v54 = 2112;
    v55 = obja;
    __int16 v56 = 2112;
    __int16 v57 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@ updated state: defaultPairedDeviceExists=%d, pairedDeviceExists=%d, telephonyCapableDeviceExists=%d, relayCapab leDeviceExists=%d, availableOutgoingRelayCallerIDs=%@ deviceNames=\"%@\"",  buf,  0x38u);
  }

  if (v32 != *v33) {
    -[CSDIDSService _handlePairedDeviceChangedFrom:to:](self, "_handlePairedDeviceChangedFrom:to:", v32);
  }
  BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v31 postNotificationName:@"CSDIDSDeviceListChangedNotification" object:self];
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSAccountController)accountController
{
  return self->_accountController;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (IDSIDQueryController)idsQueryController
{
  return self->_idsQueryController;
}

- (void)setIdsQueryController:(id)a3
{
}

- (IDSServicePseudonymDelegate)delegate
{
  return self->_delegate;
}

- (void)setTelephonyCapableDeviceExists:(BOOL)a3
{
  self->_BOOL telephonyCapableDeviceExists = a3;
}

- (void)setRelayCapableDeviceExists:(BOOL)a3
{
  self->_BOOL relayCapableDeviceExists = a3;
}

- (void)setDevices:(id)a3
{
}

- (void)setPairedDevice:(id)a3
{
}

- (void)setDefaultPairedDevice:(id)a3
{
}

- (void)setAvailableOutgoingRelayCallerIDs:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (void).cxx_destruct
{
}

@end