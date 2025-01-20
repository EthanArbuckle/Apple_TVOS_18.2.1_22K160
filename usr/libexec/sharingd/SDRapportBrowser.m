@interface SDRapportBrowser
+ (BOOL)deviceIsEligibleForAirDrop:(id)a3;
+ (BOOL)personHasAirDropEligibleDevice:(id)a3;
+ (SDRapportBrowser)sharedRapportBrowser;
+ (id)deviceTypeFromModelIdentifier:(id)a3;
+ (id)identifiersForPerson:(id)a3;
+ (unint64_t)defaultSFNodeFlags;
+ (void)updateRangingMeasurementForDevice:(id)a3 inNode:(__SFNode *)a4;
+ (void)updateRangingMeasurementForPerson:(id)a3 inNode:(__SFNode *)a4;
- (BOOL)shouldStopHandoffAdvertising;
- (NSArray)nodes;
- (SDRapportBrowser)init;
- (SDXPCHelperConnection)helperConnection;
- (__SFNode)createSFNodeFromCNContacts:(id)a3 identifier:(id)a4 device:(id)a5;
- (__SFNode)createSFNodeFromMyRPDevice:(id)a3;
- (__SFNode)createSFNodeFromRPPerson:(id)a3;
- (id)assertionIdentifier;
- (void)_start;
- (void)_stop;
- (void)addObservers;
- (void)addOrUpdateNodesForPerson:(id)a3 withChanges:(unsigned int)a4;
- (void)contactsChanged:(id)a3;
- (void)removeNodesForPerson:(id)a3;
- (void)removeObservers;
- (void)resumeHandoffAdvertisingIfAppropriate;
- (void)setHelperConnection:(id)a3;
- (void)start;
- (void)stop;
- (void)stopHandoffAdvertisingIfAppropriate;
@end

@implementation SDRapportBrowser

+ (SDRapportBrowser)sharedRapportBrowser
{
  if (qword_100656ED0 != -1) {
    dispatch_once(&qword_100656ED0, &stru_1005CCA10);
  }
  return (SDRapportBrowser *)(id)qword_100656ED8;
}

- (SDRapportBrowser)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDRapportBrowser;
  return -[SDRapportBrowser init](&v3, "init");
}

- (void)start
{
  uint64_t v3 = airdrop_log(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t startCount = self->_startCount;
    v7[0] = 67109120;
    v7[1] = startCount;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Rapport Browser start, current request count %d",  (uint8_t *)v7,  8u);
  }

  int64_t v6 = self->_startCount;
  if (!v6)
  {
    -[SDRapportBrowser _start](self, "_start");
    int64_t v6 = self->_startCount;
  }

  self->_int64_t startCount = v6 + 1;
}

- (void)stop
{
  int64_t startCount = self->_startCount;
  if (startCount <= 1) {
    int64_t startCount = 1LL;
  }
  self->_int64_t startCount = startCount - 1;
  uint64_t v4 = airdrop_log(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = self->_startCount;
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Rapport Browser stop, current request count %d",  (uint8_t *)v7,  8u);
  }

  if (!self->_startCount) {
    -[SDRapportBrowser _stop](self, "_stop");
  }
}

- (void)_start
{
  uint64_t v3 = airdrop_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Rapport Browser start", buf, 2u);
  }

  -[SDRapportBrowser stopHandoffAdvertisingIfAppropriate](self, "stopHandoffAdvertisingIfAppropriate");
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  cachedNodes = self->_cachedNodes;
  self->_cachedNodes = v5;

  v7 = objc_alloc_init(&OBJC_CLASS___RPPeopleDiscovery);
  peopleDiscovery = self->_peopleDiscovery;
  self->_peopleDiscovery = v7;

  -[RPPeopleDiscovery setChangeFlags:](self->_peopleDiscovery, "setChangeFlags:", 0xFFFFFFFFLL);
  -[RPPeopleDiscovery setDiscoveryFlags:](self->_peopleDiscovery, "setDiscoveryFlags:", 16LL);
  -[RPPeopleDiscovery setDiscoveryFlags:]( self->_peopleDiscovery,  "setDiscoveryFlags:",  -[RPPeopleDiscovery discoveryFlags](self->_peopleDiscovery, "discoveryFlags") | 4);
  -[RPPeopleDiscovery setDiscoveryFlags:]( self->_peopleDiscovery,  "setDiscoveryFlags:",  -[RPPeopleDiscovery discoveryFlags](self->_peopleDiscovery, "discoveryFlags") | 8);
  -[RPPeopleDiscovery setDiscoveryFlags:]( self->_peopleDiscovery,  "setDiscoveryFlags:",  -[RPPeopleDiscovery discoveryFlags](self->_peopleDiscovery, "discoveryFlags") | 0x80);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v10 = [v9 enableStrangers];

  if (v10)
  {
    uint64_t v12 = airdrop_log(v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Enabling Stranger Discovery", buf, 2u);
    }

    -[RPPeopleDiscovery setDiscoveryFlags:]( self->_peopleDiscovery,  "setDiscoveryFlags:",  -[RPPeopleDiscovery discoveryFlags](self->_peopleDiscovery, "discoveryFlags") | 0x400);
  }

  -[RPPeopleDiscovery setDiscoveryMode:](self->_peopleDiscovery, "setDiscoveryMode:", 1LL);
  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10007BF60;
  v20[3] = &unk_1005CCA38;
  objc_copyWeak(&v21, (id *)buf);
  -[RPPeopleDiscovery setPersonFoundHandler:](self->_peopleDiscovery, "setPersonFoundHandler:", v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10007C064;
  v18[3] = &unk_1005CCA60;
  objc_copyWeak(&v19, (id *)buf);
  -[RPPeopleDiscovery setPersonChangedHandler:](self->_peopleDiscovery, "setPersonChangedHandler:", v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007C118;
  v16[3] = &unk_1005CCA38;
  objc_copyWeak(&v17, (id *)buf);
  -[RPPeopleDiscovery setPersonLostHandler:](self->_peopleDiscovery, "setPersonLostHandler:", v16);
  -[RPPeopleDiscovery setInterruptionHandler:](self->_peopleDiscovery, "setInterruptionHandler:", &stru_1005CCA80);
  -[RPPeopleDiscovery setInvalidationHandler:](self->_peopleDiscovery, "setInvalidationHandler:", &stru_1005CCAA0);
  v14 = self->_peopleDiscovery;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007C2E0;
  v15[3] = &unk_1005CB3E8;
  v15[4] = self;
  -[RPPeopleDiscovery activateWithCompletion:](v14, "activateWithCompletion:", v15);
  -[SDRapportBrowser addObservers](self, "addObservers");
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)_stop
{
  uint64_t v3 = airdrop_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Rapport Browser stop", v6, 2u);
  }

  -[SDRapportBrowser removeObservers](self, "removeObservers");
  -[RPPeopleDiscovery invalidate](self->_peopleDiscovery, "invalidate");
  peopleDiscovery = self->_peopleDiscovery;
  self->_peopleDiscovery = 0LL;

  -[SDRapportBrowser resumeHandoffAdvertisingIfAppropriate](self, "resumeHandoffAdvertisingIfAppropriate");
}

- (void)contactsChanged:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDiscovery discoveredPeople](self->_peopleDiscovery, "discoveredPeople"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SDRapportBrowser addOrUpdateNodesForPerson:withChanges:]( self,  "addOrUpdateNodesForPerson:withChanges:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8),  0LL);
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 postNotificationName:@"com.apple.sharingd.RapportChanged" object:0 userInfo:0];
}

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"contactsChanged:" name:@"com.apple.sharingd.ContactsChanged" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (NSArray)nodes
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_cachedNodes, "allValues");
}

- (void)addOrUpdateNodesForPerson:(id)a3 withChanges:(unsigned int)a4
{
  id v6 = a3;
  if ([v6 flags])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 devices]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10007C8F0;
    v21[3] = &unk_1005CCAC8;
    v21[4] = self;
    unsigned int v22 = a4;
    [v7 enumerateObjectsUsingBlock:v21];
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v8 = (__SFNode *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_cachedNodes,  "objectForKeyedSubscript:",  v7));

    id v10 = objc_msgSend((id)objc_opt_class(self, v9), "personHasAirDropEligibleDevice:", v6);
    if ((_DWORD)v10)
    {
      if (v8)
      {
        if ((a4 & 8) != 0) {
          objc_msgSend((id)objc_opt_class(self, v11), "updateRangingMeasurementForPerson:inNode:", v6, v8);
        }
      }

      else if (v7 || (id v14 = [v6 flags], ((unsigned __int16)v14 & 0x100) != 0))
      {
        id v17 = -[SDRapportBrowser createSFNodeFromRPPerson:](self, "createSFNodeFromRPPerson:", v6);
        uint64_t v18 = airdrop_log(v17);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        v20 = v19;
        if (v17)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v24 = v17;
            __int16 v25 = 2112;
            id v26 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "SDRapportBrowser: Adding SFNode %@ for %@",  buf,  0x16u);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cachedNodes,  "setObject:forKeyedSubscript:",  v17,  v7);
        }

        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_10007DB04();
          }
        }
      }

      else
      {
        uint64_t v15 = airdrop_log(v14);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          sub_10007DA98();
        }
      }
    }

    else if (v8)
    {
      uint64_t v12 = airdrop_log(v10);
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v8;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SDRapportBrowser: Removing SFNode %@ for RPPerson %@",  buf,  0x16u);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedNodes, "setObject:forKeyedSubscript:", 0LL, v7);
    }
  }
}

- (void)removeNodesForPerson:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "identifiersForPerson:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[NSMutableDictionary removeObjectsForKeys:](self->_cachedNodes, "removeObjectsForKeys:", v7);
}

- (id)assertionIdentifier
{
  uint64_t v3 = objc_opt_class(self, a2);
  return (id)NSPrintF("%@: %{ptr}", v3, self);
}

- (BOOL)shouldStopHandoffAdvertising
{
  return GestaltGetBoolean(@"R1Capability", 0LL, 0LL) != 0;
}

- (void)stopHandoffAdvertisingIfAppropriate
{
  if (-[SDRapportBrowser shouldStopHandoffAdvertising](self, "shouldStopHandoffAdvertising"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](&OBJC_CLASS___SDActivityAdvertiser, "sharedAdvertiser"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser assertionIdentifier](self, "assertionIdentifier"));
    [v4 stopForReason:v3];
  }

- (void)resumeHandoffAdvertisingIfAppropriate
{
  if (-[SDRapportBrowser shouldStopHandoffAdvertising](self, "shouldStopHandoffAdvertising"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](&OBJC_CLASS___SDActivityAdvertiser, "sharedAdvertiser"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser assertionIdentifier](self, "assertionIdentifier"));
    [v4 resumeForReason:v3];
  }

+ (void)updateRangingMeasurementForPerson:(id)a3 inNode:(__SFNode *)a4
{
  id v6 = a3;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 devices]);
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v8)
  {

    uint64_t v11 = 0LL;
LABEL_20:
    unsigned int v22 = 0LL;
    goto LABEL_21;
  }

  id v10 = v8;
  uint64_t v11 = 0LL;
  uint64_t v12 = *(void *)v25;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
      if (objc_msgSend((id)objc_opt_class(a1, v9), "deviceIsEligibleForAirDrop:", v14))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 relativeLocation]);
        v16 = v15;
        if (v15)
        {
          [v15 ptsScore];
          double v18 = v17;
          [v11 ptsScore];
          if (v18 > v19 || v11 == 0LL)
          {
            id v21 = v16;

            uint64_t v11 = v21;
          }
        }
      }
    }

    id v10 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }

  while (v10);

  if (!v11) {
    goto LABEL_20;
  }
  uint64_t v23 = 0LL;
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  &v23));
LABEL_21:
  SFNodeSetRangingData(a4, v22);
}

+ (void)updateRangingMeasurementForDevice:(id)a3 inNode:(__SFNode *)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 relativeLocation]);
  if (v5)
  {
    uint64_t v7 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  1LL,  &v7));
  }

  else
  {
    id v6 = 0LL;
  }

  SFNodeSetRangingData(a4, v6);
}

+ (unint64_t)defaultSFNodeFlags
{
  return 743LL;
}

- (__SFNode)createSFNodeFromCNContacts:(id)a3 identifier:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (__SFNode *)SFNodeCreate(0LL, a4, a4);
  if ([v8 count])
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contactWithPreferredIdentifierForContacts:v8]);
    __int128 v13 = objc_alloc_init(&OBJC_CLASS___CNContactFormatter);
    id v14 = [v12 mutableCopy];
    [v14 setMiddleName:&stru_1005E3958];
    v40 = v13;
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CNContactFormatter stringFromContact:](v13, "stringFromContact:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    SFNodeSetContactIdentifier(v10, v16);

    double v17 = sub_100113018(v8);
    SFNodeSetContactIdentifiers(v10, v17);
    if (v15) {
      double v18 = v15;
    }
    else {
      double v18 = &stru_1005E3958;
    }
    SFNodeSetDisplayName(v10, v18);
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v12 givenName]);
    SFNodeSetFirstName(v10, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue([v12 familyName]);
    SFNodeSetLastName(v10, v20);

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 nickname]);
    SFNodeSetNickName(v10, v21);

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v11 meCard]);
    unsigned int v23 = [v22 isEqual:v12];

    if (v23)
    {
      SFNodeAddKind(v10, kSFNodeKindMe);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v11 myAppleID]);
      SFNodeSetAppleID(v10, v24);

      id v25 = [v9 idsDeviceIdentifierConflict];
      if ((v25 & 1) != 0)
      {
        uint64_t v26 = airdrop_log(v25);
        __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "SDRapportBrowser: IDS device info for %@ may be inaccurate. Don't use it for AirDrop",  buf,  0xCu);
        }
      }

      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
        SFNodeSetComputerName(v10, v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDeviceIdentifier]);
        SFNodeSetIDSDeviceIdentifier(v10, v31);
      }

      v32 = (void *)objc_opt_class(self, v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v9 model]);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v32 deviceTypeFromModelIdentifier:v33]);

      SFNodeSetSecondaryName(v10, v34);
    }

    buf[0] = 0;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser helperConnection](self, "helperConnection"));
    v36 = sub_100034B30(v12, 1LL, (uint64_t)buf, v35);

    if (!buf[0]) {
      SFNodeAddKind(v10, kSFNodeKindMonogram);
    }
    SFNodeSetIconData(v10, v36);
  }

  else
  {
    SFNodeAddKind(v10, kSFNodeKindUnknown);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v9 bleAuthTag]);
    SFNodeSetUserName(v10, [v29 base64EncodedStringWithOptions:0]);
  }

  SFNodeAddKind(v10, kSFNodeKindPerson);
  SFNodeAddKind(v10, kSFNodeKindRapport);
  v38 = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend((id)objc_opt_class(self, v37), "defaultSFNodeFlags"));
  SFNodeSetFlags(v10, v38);

  return v10;
}

- (__SFNode)createSFNodeFromRPPerson:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CNContactFormatter descriptorForRequiredKeysForStyle:]( &OBJC_CLASS___CNContactFormatter,  "descriptorForRequiredKeysForStyle:",  0LL));
  v19[0] = v6;
  v19[1] = CNContactThumbnailImageDataKey;
  v19[2] = CNContactPhoneNumbersKey;
  v19[3] = CNContactEmailAddressesKey;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 contactsWithPhoneNumberOrEmail:v8 keys:v7]);

  if ([v9 count] || (id v10 = objc_msgSend(v4, "flags"), ((unsigned __int16)v10 & 0x100) != 0))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 devices]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
    __int128 v13 = -[SDRapportBrowser createSFNodeFromCNContacts:identifier:device:]( self,  "createSFNodeFromCNContacts:identifier:device:",  v9,  v14,  v16);

    SFNodeSetRapportFlags( v13,  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 flags]));
    objc_msgSend((id)objc_opt_class(self, v17), "updateRangingMeasurementForPerson:inNode:", v4, v13);
  }

  else
  {
    uint64_t v11 = airdrop_log(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10007DBC4();
    }

    __int128 v13 = 0LL;
  }

  return v13;
}

- (__SFNode)createSFNodeFromMyRPDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 meCard]);

  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v10 = -[SDRapportBrowser createSFNodeFromCNContacts:identifier:device:]( self,  "createSFNodeFromCNContacts:identifier:device:",  v8,  v9,  v4);

    SFNodeSetRapportFlags(v10, &off_1005F7648);
    objc_msgSend((id)objc_opt_class(self, v11), "updateRangingMeasurementForDevice:inNode:", v4, v10);
  }

  else
  {
    uint64_t v12 = airdrop_log(v7);
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10007DC24(v13);
    }

    id v10 = 0LL;
  }

  return v10;
}

+ (id)identifiersForPerson:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if ([v3 flags])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 devices]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"identifier"]);
    -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v6);
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

    -[NSMutableArray addObject:](v4, "addObject:", v5);
  }

  return v4;
}

+ (BOOL)personHasAirDropEligibleDevice:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "devices", 0));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([a1 deviceIsEligibleForAirDrop:*(void *)(*((void *)&v11 + 1) + 8 * (void)i)])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)deviceIsEligibleForAirDrop:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
  id v5 = v4;
  if (v4
    && (([v4 hasPrefix:@"AppleTV"] & 1) != 0
     || ([v5 hasPrefix:@"Watch"] & 1) != 0
     || ([v5 hasPrefix:@"Audio"] & 1) != 0))
  {

    LOBYTE(v5) = 0;
  }

  else
  {

    LODWORD(v5) = ([v3 flags] >> 11) & 1;
  }

  return (char)v5;
}

+ (id)deviceTypeFromModelIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = @"iPhone";
  if (([v3 hasPrefix:@"iPhone"] & 1) == 0)
  {
    id v4 = @"iPad";
    if (([v3 hasPrefix:@"iPad"] & 1) == 0)
    {
      if ([v3 hasPrefix:@"iPod"])
      {
        id v4 = @"iPod touch";
      }

      else if ([v3 hasPrefix:@"MacBookPro"])
      {
        id v4 = @"MacBook Pro";
      }

      else if ([v3 hasPrefix:@"MacBookAir"])
      {
        id v4 = @"MacBook Air";
      }

      else if ([v3 hasPrefix:@"MacPro"])
      {
        id v4 = @"Mac Pro";
      }

      else
      {
        id v4 = @"iMac";
      }
    }
  }

  return (id)v4;
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)objc_loadWeakRetained((id *)&self->_helperConnection);
}

- (void)setHelperConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end