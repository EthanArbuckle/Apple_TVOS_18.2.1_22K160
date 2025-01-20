@interface UAActivityReplay
- (BOOL)processCommand:(id)a3;
- (BOOL)processCommands:(id)a3 completionHandler:(id)a4;
- (BOOL)sendResponse:(id)a3;
- (BOOL)terminate;
- (NSMutableDictionary)items;
- (OS_dispatch_queue)queue;
- (SFPeerDevice)pairedPeer;
- (UAActivityReplay)initWithManager:(id)a3 name:(id)a4;
- (UAActivityReplayAdvertiser)advertiser;
- (UAActivityReplayReceiver)receiver;
- (UAMockActivityAdvertiser)mockAdvertiser;
- (UAMockActivityScanner)mockScanner;
- (UAReplayClientController)client;
- (id)scanMockAdvertisement:(id)a3;
- (id)sharingAdvertiser;
- (id)sharingReceiver;
- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(unint64_t)a6 withCompletionHandler:(id)a7;
- (void)dealloc;
- (void)doAdvertiseAdvertisementPayload:(id)a3 options:(id)a4;
- (void)setAdvertiser:(id)a3;
- (void)setClient:(id)a3;
- (void)setItems:(id)a3;
- (void)setPairedPeer:(id)a3;
- (void)setReceiver:(id)a3;
@end

@implementation UAActivityReplay

- (UAActivityReplay)initWithManager:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___UAActivityReplay;
  v8 = -[UACornerActionManagerHandler initWithManager:name:](&v32, "initWithManager:name:", v6, v7);
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("Replay", 0LL);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    v11 = -[UAAdvertiser initWithManager:name:]( objc_alloc(&OBJC_CLASS___UAActivityReplayAdvertiser),  "initWithManager:name:",  v6,  @"ReplayAdvertiser");
    -[UAActivityReplay setAdvertiser:](v8, "setAdvertiser:", v11);

    v12 = -[UAReceiver initWithManager:name:]( objc_alloc(&OBJC_CLASS___UAActivityReplayReceiver),  "initWithManager:name:",  v6,  @"ReplayReceiver");
    -[UAActivityReplay setReceiver:](v8, "setReceiver:", v12);

    v13 = -[UAReplayClientController initWithManager:]( objc_alloc(&OBJC_CLASS___UAReplayClientController),  "initWithManager:",  v6);
    -[UAActivityReplay setClient:](v8, "setClient:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[UAActivityReplay setItems:](v8, "setItems:", v14);

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingPayloadFetches = v8->_pendingPayloadFetches;
    v8->_pendingPayloadFetches = (NSMutableDictionary *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___SFPeerDevice);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](v8, "uuid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
    -[SFPeerDevice setUniqueID:](v17, "setUniqueID:", v19);

    -[SFPeerDevice setModelIdentifier:](v17, "setModelIdentifier:", @"iPhone5,1");
    -[SFPeerDevice setProductName:](v17, "setProductName:", @"Mac OS X");
    -[SFPeerDevice setProductVersion:](v17, "setProductVersion:", @"9.0");
    -[SFPeerDevice setProductBuildVersion:](v17, "setProductBuildVersion:", @"14A100");
    -[SFPeerDevice setName:](v17, "setName:", @"PEER");
    -[SFPeerDevice setDeviceColor:](v17, "setDeviceColor:", @"Orangeish");
    -[SFPeerDevice setEnclosureColor:](v17, "setEnclosureColor:", @"Greenish");
    -[UAActivityReplay setPairedPeer:](v8, "setPairedPeer:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay sharingAdvertiser](v8, "sharingAdvertiser"));
    if (v20)
    {
      v21 = -[UAMockActivityAdvertiser initWithController:]( objc_alloc(&OBJC_CLASS___UAMockActivityAdvertiser),  "initWithController:",  v8);
      mockAdvertiser = v8->_mockAdvertiser;
      v8->_mockAdvertiser = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay mockAdvertiser](v8, "mockAdvertiser"));
      [v20 addSFActivityAdvertiser:v23];
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay sharingReceiver](v8, "sharingReceiver"));
    if (v24)
    {
      v25 = -[UAMockActivityScanner initWithController:]( objc_alloc(&OBJC_CLASS___UAMockActivityScanner),  "initWithController:",  v8);
      mockScanner = v8->_mockScanner;
      v8->_mockScanner = v25;

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay mockScanner](v8, "mockScanner"));
      [v24 addSFActivityScanner:v27];
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v8, "manager"));
    [v28 addHandler:v8];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v8, "manager"));
    [v29 scheduleUpdatingAdvertisableItems];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v8, "manager"));
    [v30 scheduleBestAppDetermination:0.25];
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay mockScanner](self, "mockScanner"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay mockScanner](self, "mockScanner"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
  [v4 activityScanner:v5 lostDeviceWithDevice:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay sharingReceiver](self, "sharingReceiver"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay mockScanner](self, "mockScanner"));
    [v7 removeSFActivityScanner:v8];
  }

  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay sharingAdvertiser](self, "sharingAdvertiser"));
  if (v9)
  {
    v10 = -[UAMockActivityAdvertiser initWithController:]( objc_alloc(&OBJC_CLASS___UAMockActivityAdvertiser),  "initWithController:",  self);
    mockAdvertiser = self->_mockAdvertiser;
    self->_mockAdvertiser = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay mockAdvertiser](self, "mockAdvertiser"));
    [v9 removeSFActivityAdvertiser:v12];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UAActivityReplay;
  -[UAActivityReplay dealloc](&v13, "dealloc");
}

- (id)sharingReceiver
{
  v2 = self;
  objc_sync_enter(v2);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v2, "manager", 0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 receivers]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___UASharingReceiver);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (id)sharingAdvertiser
{
  v2 = self;
  objc_sync_enter(v2);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](v2, "manager", 0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 advertisers]);

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___UASharingAdvertiser);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)doAdvertiseAdvertisementPayload:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032AB8;
  block[3] = &unk_1000BD7D8;
  id v12 = v7;
  __int128 v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (id)scanMockAdvertisement:(id)a3
{
  id v4 = a3;
  if (![v4 scanString:@"[$" intoString:0])
  {
    if (([v4 scanString:@"-" intoString:0] & 1) != 0
      || [v4 scanString:@"$-" intoString:0])
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___UAMockActivityAdvertisement);
      -[UAMockActivityAdvertisement setAdvertisementPayload:](v9, "setAdvertisementPayload:", 0LL);
      -[UAMockActivityAdvertisement setAdvertisementVersion:](v9, "setAdvertisementVersion:", 1LL);
      -[UAMockActivityAdvertisement setOptions:](v9, "setOptions:", 0LL);
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
      -[UAMockActivityAdvertisement setDevice:](v9, "setDevice:", v6);
      goto LABEL_7;
    }

    if ([v4 scanString:@"$" intoString:0])
    {
      id v12 = sub_100033190(v4, 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue(v12);
      if (v6)
      {
        id v9 = objc_alloc_init(&OBJC_CLASS___UAMockActivityAdvertisement);
        -[UAMockActivityAdvertisement setAdvertisementVersion:](v9, "setAdvertisementVersion:", 1LL);
        -[UAMockActivityAdvertisement setAdvertisementPayload:](v9, "setAdvertisementPayload:", v6);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
        -[UAMockActivityAdvertisement setDevice:](v9, "setDevice:", v13);

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);
        id v7 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", objc_msgSend(v4, "scanLocation")));

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver dataUsingEncoding:](v7, "dataUsingEncoding:", 4LL));
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v15,  0LL,  0LL));

        if (v16)
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
            -[UAMockActivityAdvertisement setOptions:](v9, "setOptions:", v16);
          }
        }

        goto LABEL_21;
      }
    }

    else
    {
      if ([v4 scanString:@"http://" intoString:0])
      {
        id v9 = 0LL;
        goto LABEL_8;
      }

      uint64_t v30 = 0LL;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
      id v29 = 0LL;
      unsigned int v19 = [v4 scanUpToCharactersFromSet:v18 intoString:&v29];
      id v6 = v29;

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
        id v28 = 0LL;
        unsigned int v21 = [v4 scanUpToCharactersFromSet:v20 intoString:&v28];
        id v7 = (NSKeyedUnarchiver *)v28;

        if (v21) {
          [v4 scanInteger:&v30];
        }
        id v9 = objc_alloc_init(&OBJC_CLASS___UAMockActivityAdvertisement);
        -[UAMockActivityAdvertisement setAdvertisementVersion:](v9, "setAdvertisementVersion:", 1LL);
        v22 = objc_alloc(&OBJC_CLASS___SharingBTLEAdvertisementPayload);
        uint64_t v23 = v30;
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)-v30));
        LOBYTE(v27) = v23 < 10;
        v25 = -[SharingBTLEAdvertisementPayload initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:]( v22,  "initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:",  1LL,  v6,  0LL,  v7,  0LL,  0LL,  v27,  v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SharingBTLEAdvertisementPayload advertisementPayload](v25, "advertisementPayload"));
        -[UAMockActivityAdvertisement setAdvertisementPayload:](v9, "setAdvertisementPayload:", v26);

        -[UAMockActivityAdvertisement setOptions:](v9, "setOptions:", 0LL);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
        -[UAMockActivityAdvertisement setDevice:](v9, "setDevice:", v16);
LABEL_21:

        goto LABEL_3;
      }
    }

    id v9 = 0LL;
    goto LABEL_7;
  }

  id v5 = sub_100033190(v4, 1);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v6,  0LL);
  id v8 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v7,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___UAMockActivityAdvertisement),  NSKeyedArchiveRootObjectKey);
  id v9 = (UAMockActivityAdvertisement *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
  -[UAMockActivityAdvertisement setDevice:](v9, "setDevice:", v10);

  -[NSKeyedUnarchiver finishDecoding](v7, "finishDecoding");
LABEL_3:

LABEL_7:
LABEL_8:

  return v9;
}

- (BOOL)processCommand:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  os_log_t v6 = sub_100039584(0LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    *(void *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PROCESSCOMMAND:%{private}@", buf, 0xCu);
  }

  if ((unint64_t)[v4 length] >= 0x2E
    && [v4 characterAtIndex:9] == 58
    && [v4 characterAtIndex:12] == 58
    && [v4 characterAtIndex:16] == 32
    && [v4 characterAtIndex:38] == 60)
  {
    id v8 = (char *)[v4 rangeOfString:@">: "];
    if (v9)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 substringFromIndex:&v8[v9]]);

      id v4 = (id)v10;
    }
  }

  if (([v4 hasPrefix:@"#"] & 1) == 0
    && ([v4 hasPrefix:@"//"] & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v4));
    [v12 setCaseSensitive:0];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    id v135 = 0LL;
    LODWORD(v11) = [v12 scanUpToCharactersFromSet:v13 intoString:&v135];
    id v14 = v135;
    if (!v14) {
      LODWORD(v11) = 0;
    }

    if (!(_DWORD)v11) {
      goto LABEL_39;
    }
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uppercaseString]);

    id v14 = v15;
    if ([v15 isEqual:@"HELP"])
    {
      -[UAActivityReplay sendResponse:](self, "sendResponse:", @"COMMANDS: ...\n");
      -[UAActivityReplay sendResponse:]( self,  "sendResponse:",  @" - ADVERTISEITEM:<tag> <activitytype> [<archivedUserActivityData>]\n");
LABEL_18:
      LOBYTE(v11) = 0;
LABEL_39:

      goto LABEL_40;
    }

    if (([v15 isEqual:@"HANDOFF"] & 1) != 0
      || [v15 isEqual:@"VERSION"])
    {
      uint64_t v134 = 0LL;
      if ([v12 scanString:@"v" intoString:0]
        && [v12 scanDouble:&v134])
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
        id v133 = 0LL;
        unsigned int v17 = [v12 scanUpToCharactersFromSet:v16 intoString:&v133];
        id v18 = v133;

        if (v17) {
          unsigned int v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v18);
        }
        else {
          unsigned int v19 = 0LL;
        }
      }

      else
      {
        unsigned int v19 = 0LL;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uuid]);
      unsigned int v24 = -[NSUUID isEqual:](v19, "isEqual:", v23);

      if (v24)
      {
        os_log_t v25 = sub_100039584(0LL);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v19, "UUIDString"));
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "REPLAY: Destroying replay object because the peer's UUID %{public}@ matched our own.",  buf,  0xCu);
        }

        -[UAActivityReplay terminate](self, "terminate");
      }

      goto LABEL_38;
    }

    if (![v15 compare:@"STARTUP" options:1])
    {
LABEL_38:
      LOBYTE(v11) = 1;
      goto LABEL_39;
    }

    if ([v15 isEqual:@"TERMINATE"])
    {
      os_log_t v20 = sub_100039584(0LL);
      unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "REPLAY: Terminating UAActivityReplay because TERMINATE was received.",  buf,  2u);
      }

      -[UAActivityReplay terminate](self, "terminate");
      goto LABEL_18;
    }

    if ([v15 compare:@"ADVERTISEITEM" options:1])
    {
      if ([v15 compare:@"PAYLOAD" options:1])
      {
        if ([v15 compare:@"PULL" options:1])
        {
          if (![v15 compare:@"REMOVEITEM" options:1])
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            id v69 = sub_1000348C0(v12);
            v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
            if (v70)
            {
              [v68 addObject:v70];
            }

            else if ([v12 scanString:@"all" intoString:0])
            {
              v90 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay items](self, "items"));
              v91 = (void *)objc_claimAutoreleasedReturnValue([v90 allKeys]);
              [v68 addObjectsFromArray:v91];
            }

            v92 = (void *)objc_claimAutoreleasedReturnValue([v68 firstObject]);
            LODWORD(v11) = v92 != 0LL;

            if ((_DWORD)v11)
            {
              v93 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay items](self, "items"));
              v94 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKeyedSubscript:v70]);

              if (v94)
              {
                os_log_t v95 = sub_100039584(0LL);
                v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
                if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138477827;
                  *(void *)&buf[4] = v94;
                  _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_INFO,  "=== REMOVING ACTIVITY %{private}@ to be resumed",  buf,  0xCu);
                }

                v97 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay items](self, "items"));
                [v97 removeObjectForKey:v70];
              }
            }

            goto LABEL_39;
          }

          if ([v15 compare:@"PEERINFO" options:1])
          {
            if ([v15 compare:@"RECEIVE" options:1]
              && [v15 compare:@"BROADCAST" options:1])
            {
              if ([v15 compare:@"REQUESTPAYLOAD" options:1])
              {
                if (![v15 compare:@"RETURNPAYLOAD" options:1])
                {
                  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay scanMockAdvertisement:](self, "scanMockAdvertisement:", v12));
                  id v30 = sub_100033190(v12, 1);
                  v128 = (void *)objc_claimAutoreleasedReturnValue(v30);
                  os_log_t v31 = sub_100039584(0LL);
                  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138477827;
                    *(void *)&buf[4] = v29;
                    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "REPLAY: RETURNPAYLOAD request, for advertisementPayload=%{private}@",  buf,  0xCu);
                  }

                  LOBYTE(v11) = v29 != 0LL;
                  if (v29)
                  {
                    objc_super v32 = self;
                    objc_sync_enter(v32);
                    pendingPayloadFetches = v32->_pendingPayloadFetches;
                    v34 = (void *)objc_claimAutoreleasedReturnValue([v29 advertisementPayload]);
                    v35 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( pendingPayloadFetches,  "objectForKey:",  v34));

                    if (v35)
                    {
                      os_log_t v36 = sub_100039584(0LL);
                      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138477827;
                        *(void *)&buf[4] = v29;
                        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "REPLAY: RETURNPAYLOAD request, found existing payloadHandler in _pendingPayloadFetches for adv ertisementPayload=%{private}@",  buf,  0xCu);
                      }

                      v38 = v32->_pendingPayloadFetches;
                      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 advertisementPayload]);
                      -[NSMutableDictionary removeObjectForKey:](v38, "removeObjectForKey:", v39);
                    }

                    else
                    {
                      os_log_t v119 = sub_100039584(0LL);
                      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        v126 = (void *)objc_claimAutoreleasedReturnValue([v29 advertisementPayload]);
                        id v120 = sub_1000034D8(v126);
                        id v127 = (id)objc_claimAutoreleasedReturnValue(v120);
                        v121 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary description](v32->_pendingPayloadFetches, "description"));
                        id v122 = sub_10005BF18(v121);
                        v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
                        *(_DWORD *)buf = 138543875;
                        *(void *)&buf[4] = v127;
                        __int16 v137 = 2113;
                        double v138 = *(double *)&v29;
                        __int16 v139 = 2113;
                        v140 = v123;
                        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "REPLAY: Didn't find handler for advertisement %{public}@/%{private}@, pendingPayloads=%{private}@",  buf,  0x20u);
                      }
                    }

                    objc_sync_exit(v32);
                    if (v128)
                    {
                      os_log_t v124 = sub_100039584(0LL);
                      v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
                      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138477827;
                        *(void *)&buf[4] = v128;
                        _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEBUG,  "REPLAY: Sending encoded data %{private}@ to activity handler.",  buf,  0xCu);
                      }

                      if (v35) {
                        ((void (**)(void, void *, void))v35)[2](v35, v128, 0LL);
                      }
                    }
                  }

                  goto LABEL_39;
                }

                goto LABEL_18;
              }

              v112 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay scanMockAdvertisement:](self, "scanMockAdvertisement:", v12));
              os_log_t v113 = sub_100039584(0LL);
              v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138477827;
                *(void *)&buf[4] = v112;
                _os_log_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_DEBUG,  "REPLAY: PULLPAYLOAD request, for advertisementPayload=%{private}@",  buf,  0xCu);
              }

              if (v112)
              {
                v115 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay sharingAdvertiser](self, "sharingAdvertiser"));
                v116 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay sharingAdvertiser](self, "sharingAdvertiser"));
                v117 = (void *)objc_claimAutoreleasedReturnValue([v112 advertisementPayload]);
                v118 = (void *)objc_claimAutoreleasedReturnValue([v112 device]);
                v130[0] = _NSConcreteStackBlock;
                v130[1] = 3221225472LL;
                v130[2] = sub_100034B00;
                v130[3] = &unk_1000BD828;
                v130[4] = self;
                id v131 = v112;
                [v115 activityAdvertiser:v116 activityPayloadForAdvertisementPayload:v117 command:@"-" requestedByDevice:v118 withCompletionHandler:v130];
              }
            }

            else
            {
              v71 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay scanMockAdvertisement:](self, "scanMockAdvertisement:", v12));
              os_log_t v72 = sub_100039584(0LL);
              v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138477827;
                *(void *)&buf[4] = v71;
                _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEBUG,  "NETWORK: Received broadcasted advertisement %{private}@",  buf,  0xCu);
              }

              if (v71)
              {
                v74 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
                [v71 setDevice:v74];

                v75 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay sharingReceiver](self, "sharingReceiver"));
                v76 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay mockScanner](self, "mockScanner"));
                [v75 activityScanner:v76 receivedAdvertisement:v71];
              }
            }

            goto LABEL_38;
          }

          if ([v12 scanString:@"SF[$" intoString:0])
          {
            id v77 = sub_100033190(v12, 0);
            v78 = (SFPeerDevice *)objc_claimAutoreleasedReturnValue(v77);
            v79 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v78,  0LL);
            id v80 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v79,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___SFPeerDevice),  NSKeyedArchiveRootObjectKey);
            v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
            -[UAActivityReplay setPairedPeer:](self, "setPairedPeer:", v81);

            v82 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
            v83 = (void *)objc_claimAutoreleasedReturnValue([v82 uniqueID]);
            BOOL v84 = v83 == 0LL;

            if (v84)
            {
              v85 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](self, "uuid"));
              v86 = (void *)objc_claimAutoreleasedReturnValue([v85 UUIDString]);
              v87 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
              [v87 setUniqueID:v86];

              v88 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
              v89 = (void *)objc_claimAutoreleasedReturnValue([v88 name]);
              -[UACornerActionManagerHandler setName:](self, "setName:", v89);
            }

            -[NSKeyedUnarchiver finishDecoding](v79, "finishDecoding");
          }

          else
          {
            if ([v12 scanString:@"[$" intoString:0])
            {
LABEL_115:
              v111 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
              LOBYTE(v11) = v111 != 0LL;

              goto LABEL_39;
            }

            v78 = objc_alloc_init(&OBJC_CLASS___SFPeerDevice);
            v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
            v99 = (void *)objc_claimAutoreleasedReturnValue([v98 UUIDString]);
            -[SFPeerDevice setUniqueID:](v78, "setUniqueID:", v99);

            id v100 = sub_100034964(v12);
            v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
            -[SFPeerDevice setName:](v78, "setName:", v101);

            id v102 = sub_100034964(v12);
            v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
            -[SFPeerDevice setModelIdentifier:](v78, "setModelIdentifier:", v103);

            id v104 = sub_100034964(v12);
            v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
            -[SFPeerDevice setProductName:](v78, "setProductName:", v105);

            id v106 = sub_100034964(v12);
            v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
            -[SFPeerDevice setProductVersion:](v78, "setProductVersion:", v107);

            id v108 = sub_100034964(v12);
            v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
            -[SFPeerDevice setProductBuildVersion:](v78, "setProductBuildVersion:", v109);

            -[UAActivityReplay setPairedPeer:](self, "setPairedPeer:", v78);
            v79 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
            v110 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver name](v79, "name"));
            -[UACornerActionManagerHandler setName:](self, "setName:", v110);
          }

          goto LABEL_115;
        }

        id v59 = sub_1000348C0(v12);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v59);
        LOBYTE(v11) = v52 != 0LL;
        if (!v52)
        {
LABEL_88:

          goto LABEL_39;
        }

        v60 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay items](self, "items"));
        v54 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:v52]);

        if (v54)
        {
          *(void *)buf = 0LL;
          else {
            double v61 = 15.0;
          }
          id v62 = sub_100033190(v12, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
          if (v63) {
            [v54 setPayload:v63 identifier:UAUserActivityUserInfoPayload];
          }
          os_log_t v64 = sub_100039584(0LL);
          v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138478083;
            *(void *)&buf[4] = v54;
            __int16 v137 = 2048;
            double v138 = v61;
            _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_INFO,  "=== WAITING FOR ACTIVITY %{private}@ to be resumed (for %g seconds)",  buf,  0x16u);
          }

          v66 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([v54 wasResumed]);
          dispatch_time_t v67 = dispatch_time(0LL, (uint64_t)(v61 * 1000000000.0));
          dispatch_semaphore_wait(v66, v67);
        }
      }

      else
      {
        id v51 = sub_1000348C0(v12);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        if (!v52)
        {
          LOBYTE(v11) = 0;
          goto LABEL_88;
        }

        v53 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay items](self, "items"));
        v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:v52]);

        LOBYTE(v11) = v54 != 0LL;
        if (v54)
        {
          id v55 = sub_100033190(v12, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          if (v56) {
            [v54 setPayload:v56 identifier:UAUserActivityUserInfoPayload];
          }
          os_log_t v57 = sub_100039584(0LL);
          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            *(void *)&buf[4] = v54;
            _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_INFO,  "=== UPDATED PAYLOD FOR item %{private}@ ",  buf,  0xCu);
          }
        }
      }

      goto LABEL_88;
    }

    id v40 = sub_1000348C0(v12);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    if (!v41)
    {
      id v43 = 0LL;
      LOBYTE(v11) = 0;
      goto LABEL_90;
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
    if ([v12 scanUpToCharactersFromSet:v42 intoString:0]
      && [v12 scanString:@"[" intoString:0])
    {
      id v132 = 0LL;
      LODWORD(v11) = [v12 scanUpToString:@"]" intoString:&v132];
      id v43 = v132;
      if ((_DWORD)v11)
      {
        LODWORD(v11) = [v12 scanString:@"]" intoString:0];

        if (!(_DWORD)v11)
        {
LABEL_90:

          goto LABEL_39;
        }

        id v44 = sub_1000035C0(v43);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v44);
        v129 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v42,  0LL);
        id v45 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v129,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___UAReplayAdvertisableItem),  NSKeyedArchiveRootObjectKey);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        LOBYTE(v11) = v46 != 0LL;
        if (v46)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay items](self, "items"));
          [v47 setObject:v46 forKeyedSubscript:v41];

          os_log_t v48 = sub_100039584(0LL);
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            *(void *)&buf[4] = v46;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "=== Forcing item into replay client: %{private}@",  buf,  0xCu);
          }

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay client](self, "client"));
          [v50 addItem:v46];
        }

        -[NSKeyedUnarchiver finishDecoding](v129, "finishDecoding");
      }
    }

    else
    {
      id v43 = 0LL;
      LOBYTE(v11) = 0;
    }

    goto LABEL_90;
  }

  LOBYTE(v11) = 1;
LABEL_40:

  return (char)v11;
}

- (BOOL)sendResponse:(id)a3
{
  return 0;
}

- (BOOL)processCommands:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034EE8;
  block[3] = &unk_1000BD850;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  return 1;
}

- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(unint64_t)a6 withCompletionHandler:(id)a7
{
  id v16 = a4;
  id v9 = a7;
  id v10 = sub_1000034D8(v16);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"REQUESTPAYLOAD $%@\n",  v11));
  -[UAActivityReplay sendResponse:](self, "sendResponse:", v12);

  id v13 = self;
  objc_sync_enter(v13);
  pendingPayloadFetches = v13->_pendingPayloadFetches;
  id v15 = objc_retainBlock(v9);
  -[NSMutableDictionary setObject:forKey:](pendingPayloadFetches, "setObject:forKey:", v15, v16);

  objc_sync_exit(v13);
}

- (BOOL)terminate
{
  os_log_t v3 = sub_100039584(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "terminate", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
  BOOL v6 = v5 == 0LL;

  if (!v6)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager", 0LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 receivers]);

    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v12, "lostDeviceWithUUID:") & 1) != 0)
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](self, "pairedPeer"));
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
            [v12 lostDeviceWithUUID:v14];
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v9);
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay sharingReceiver](self, "sharingReceiver"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay mockScanner](self, "mockScanner"));
  [v15 removeSFActivityScanner:v16];

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay sharingAdvertiser](self, "sharingAdvertiser"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay mockAdvertiser](self, "mockAdvertiser"));
  [v17 removeSFActivityAdvertiser:v18];

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay receiver](self, "receiver"));
  [v19 removeReceiver:v20];

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay advertiser](self, "advertiser"));
  [v21 removeAdvertiser:v22];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay receiver](self, "receiver"));
  [v23 terminate];

  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay advertiser](self, "advertiser"));
  [v24 terminate];

  os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  [v25 removeHandler:self];

  return 1;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (SFPeerDevice)pairedPeer
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPairedPeer:(id)a3
{
}

- (UAActivityReplayAdvertiser)advertiser
{
  return (UAActivityReplayAdvertiser *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setAdvertiser:(id)a3
{
}

- (UAActivityReplayReceiver)receiver
{
  return (UAActivityReplayReceiver *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setReceiver:(id)a3
{
}

- (UAReplayClientController)client
{
  return (UAReplayClientController *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setClient:(id)a3
{
}

- (UAMockActivityAdvertiser)mockAdvertiser
{
  return (UAMockActivityAdvertiser *)objc_getProperty(self, a2, 96LL, 1);
}

- (UAMockActivityScanner)mockScanner
{
  return (UAMockActivityScanner *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSMutableDictionary)items
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end