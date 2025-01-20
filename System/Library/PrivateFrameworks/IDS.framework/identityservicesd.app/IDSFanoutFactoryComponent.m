@interface IDSFanoutFactoryComponent
- (id)createFanoutFromMessage:(id)a3 forService:(id)a4 fromIdentity:(id)a5 withMaxSize:(unint64_t)a6 chunkNumber:(int64_t)a7 firstMessage:(id)a8;
- (id)runIndividuallyWithInput:(id)a3;
- (void)addMessage:(id)a3 toFanout:(id)a4;
- (void)setExpiration:(id)a3 onFanout:(id)a4 withMessage:(id)a5;
@end

@implementation IDSFanoutFactoryComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  v76 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v84 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 guid]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 prioritizedTokenList]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 prioritizedTokens]);

  v74 = v7;
  id v83 = v4;
  v73 = (void *)v5;
  if ([v7 count])
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v110 = v5;
      __int16 v111 = 2112;
      id v112 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "GUID %@ Prioritizing tokens %@", buf, 0x16u);
    }

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v4 aggregatableMessages]);
    id v11 = [obj countByEnumeratingWithState:&v105 objects:v119 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v106;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v106 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v105 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 targetToken]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 rawToken]);
          unsigned int v18 = [v74 containsObject:v17];

          if (v18) {
            v19 = v10;
          }
          else {
            v19 = v9;
          }
          -[NSMutableArray addObject:](v19, "addObject:", v15);
        }

        id v12 = [obj countByEnumeratingWithState:&v105 objects:v119 count:16];
      }

      while (v12);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObjectsFromArray:](v10, "arrayByAddingObjectsFromArray:", v9));
    id v4 = v83;
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 aggregatableMessages]);
  }

  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  id v72 = v20;
  id obja = [v72 countByEnumeratingWithState:&v101 objects:v118 count:16];
  if (obja)
  {
    uint64_t v78 = *(void *)v102;
    uint64_t v21 = 1LL;
    do
    {
      for (j = 0LL; j != obja; j = (char *)j + 1)
      {
        if (*(void *)v102 != v78) {
          objc_enumerationMutation(v72);
        }
        v23 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)j);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 command]);
        v25 = v24;
        if (v24)
        {
          v26 = v24;
        }

        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v4 messageToSend]);
          v28 = (void *)objc_claimAutoreleasedReturnValue([v27 additionalDictionary]);
          v26 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"c"]);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v84, "objectForKey:", v26));
        if (([v4 forceOnePerFanout] & 1) != 0
          || ([v29 hasSpaceForAggregatableMessage:v23] & 1) == 0)
        {
          if (v29)
          {
            id v30 = [v29 copy];
            -[NSMutableArray addObject:](v76, "addObject:", v30);
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue([v4 messageToSend]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v4 fromIdentity]);
          uint64_t v34 = objc_claimAutoreleasedReturnValue( -[IDSFanoutFactoryComponent createFanoutFromMessage:forService:fromIdentity:withMaxSize:chunkNumber:firstMessage:]( self,  "createFanoutFromMessage:forService:fromIdentity:withMaxSize:chunkNumber:firstMessage:",  v31,  v32,  v33,  [v4 maxSize],  v21,  v23));

          ++v21;
          if (v26) {
            v35 = v26;
          }
          else {
            v35 = &off_1009467C8;
          }
          -[NSMutableDictionary setObject:forKey:](v84, "setObject:forKey:", v34, v35);
          v29 = (void *)v34;
          id v4 = v83;
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue([v23 expirationDate]);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v4 messageToSend]);
        -[IDSFanoutFactoryComponent setExpiration:onFanout:withMessage:]( self,  "setExpiration:onFanout:withMessage:",  v36,  v29,  v37);

        -[IDSFanoutFactoryComponent addMessage:toFanout:](self, "addMessage:toFanout:", v23, v29);
      }

      id obja = [v72 countByEnumeratingWithState:&v101 objects:v118 count:16];
    }

    while (obja);
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v84, "allValues"));
  -[NSMutableArray addObjectsFromArray:](v76, "addObjectsFromArray:", v38);

  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  v40 = v73;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    id v41 = -[NSMutableArray count](v76, "count");
    *(_DWORD *)buf = 138412546;
    uint64_t v110 = (uint64_t)v73;
    __int16 v111 = 2048;
    id v112 = v41;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "GUID %@ Constructed %lu fanouts", buf, 0x16u);
  }

  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  v71 = v76;
  id v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v71,  "countByEnumeratingWithState:objects:count:",  &v97,  v117,  16LL);
  if (v77)
  {
    uint64_t v75 = *(void *)v98;
    *(void *)&__int128 v42 = 138412802LL;
    __int128 v70 = v42;
    do
    {
      for (id k = 0LL; k != v77; id k = (char *)k + 1)
      {
        if (*(void *)v98 != v75) {
          objc_enumerationMutation(v71);
        }
        v44 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)k);
        v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v93 = 0u;
        __int128 v94 = 0u;
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        v46 = (void *)objc_claimAutoreleasedReturnValue([v44 individualPeerMessages]);
        id v47 = [v46 countByEnumeratingWithState:&v93 objects:v116 count:16];
        if (!v47)
        {

          v56 = &IMInsertBoolsToXPCDictionary_ptr;
LABEL_56:
          objc_msgSend(v44, "setWantsCertifiedDelivery:", 1, v70);
          __int128 v91 = 0u;
          __int128 v92 = 0u;
          __int128 v89 = 0u;
          __int128 v90 = 0u;
          v57 = (void *)objc_claimAutoreleasedReturnValue([v44 individualPeerMessages]);
          id v58 = [v57 countByEnumeratingWithState:&v89 objects:v115 count:16];
          if (v58)
          {
            id v59 = v58;
            uint64_t v60 = *(void *)v90;
            do
            {
              for (m = 0LL; m != v59; m = (char *)m + 1)
              {
                if (*(void *)v90 != v60) {
                  objc_enumerationMutation(v57);
                }
                [*(id *)(*((void *)&v89 + 1) + 8 * (void)m) setWantsCertifiedDelivery:0];
              }

              id v59 = [v57 countByEnumeratingWithState:&v89 objects:v115 count:16];
            }

            while (v59);
          }

          goto LABEL_64;
        }

        id v48 = v47;
        v79 = v44;
        id objb = k;
        uint64_t v49 = *(void *)v94;
        unsigned __int8 v50 = 1;
        do
        {
          for (n = 0LL; n != v48; n = (char *)n + 1)
          {
            if (*(void *)v94 != v49) {
              objc_enumerationMutation(v46);
            }
            v52 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)n);
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "targetPeerID", v70));
            v54 = (void *)objc_claimAutoreleasedReturnValue([v52 targetToken]);
            v55 = (void *)objc_claimAutoreleasedReturnValue([v53 URIByAddingPushToken:v54]);

            if (v55) {
              -[NSMutableArray addObject:](v45, "addObject:", v55);
            }
            if ((v50 & 1) != 0) {
              unsigned __int8 v50 = [v52 wantsCertifiedDelivery];
            }
            else {
              unsigned __int8 v50 = 0;
            }
          }

          id v48 = [v46 countByEnumeratingWithState:&v93 objects:v116 count:16];
        }

        while (v48);

        v40 = v73;
        v56 = &IMInsertBoolsToXPCDictionary_ptr;
        v44 = v79;
        id k = objb;
        if ((v50 & 1) != 0) {
          goto LABEL_56;
        }
LABEL_64:
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56[219] delivery]);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue([v44 chunkNumber]);
          *(_DWORD *)buf = v70;
          uint64_t v110 = (uint64_t)v40;
          __int16 v111 = 2112;
          id v112 = v63;
          __int16 v113 = 2048;
          v114 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "GUID %@ finished constructing fanout %@ %p",  buf,  0x20u);
        }

        v64 = (void *)objc_claimAutoreleasedReturnValue([v44 chunkNumber]);
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray description](v45, "description"));
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472LL;
        v85[2] = sub_10003930C;
        v85[3] = &unk_1008F5F58;
        id v86 = v40;
        id v87 = v64;
        id v88 = v65;
        id v66 = v65;
        id v67 = v64;
        cut_dispatch_log_queue(v85);

        id v4 = v83;
      }

      id v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v71,  "countByEnumeratingWithState:objects:count:",  &v97,  v117,  16LL);
    }

    while (v77);
  }

  [v4 setAggregateMessages:v71];
  v68 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTUnsafePromise,  "fulfilledPromiseWithValue:",  v4));

  return v68;
}

- (void)addMessage:(id)a3 toFanout:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  [v5 addAggregatableMessage:v8];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptionType]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptionType]);

  if (v6 == v7) {
    [v8 setEncryptionType:0];
  }
}

- (id)createFanoutFromMessage:(id)a3 forService:(id)a4 fromIdentity:(id)a5 withMaxSize:(unint64_t)a6 chunkNumber:(int64_t)a7 firstMessage:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  v17 = -[IDSPeerAggregateMessage initWithPeerMessage:service:fromIdentity:maxSize:]( objc_alloc(&OBJC_CLASS___IDSPeerAggregateMessage),  "initWithPeerMessage:service:fromIdentity:maxSize:",  v13,  v16,  v15,  a6);

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a7));
  -[IDSPeerAggregateMessage setChunkNumber:](v17, "setChunkNumber:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 encryptionType]);
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v14 encryptionType]);
    -[IDSPeerAggregateMessage setEncryptionType:](v17, "setEncryptionType:", v20);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage additionalDictionary](v17, "additionalDictionary"));
  id v22 = [v21 mutableCopy];
  v23 = v22;
  if (v22) {
    v24 = (NSMutableDictionary *)v22;
  }
  else {
    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v25 = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue([v13 messageBody]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:IDSCommandKey]);

  v28 = (void *)objc_claimAutoreleasedReturnValue([v14 command]);
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v14 command]);
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v29, @"c");

    if (v27)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v13 additionalDictionary]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"c"]);
      -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v31, @"oC");
    }
  }

  if (([v27 isEqualToNumber:&off_1009467E0] & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v13 deliveryMinimumTimeDelay]);
    if (v32)
    {
    }

    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v13 deliveryMinimumTime]);

      if (!v33) {
        goto LABEL_15;
      }
    }
  }

  if (_os_feature_enabled_impl("IDS", "ScheduledSendVersion1"))
  {
    uint64_t v34 = _IDSScheduledSendVersionNumber();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v35, @"sv");
  }

- (void)setExpiration:(id)a3 onFanout:(id)a4 withMessage:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v15)
  {
    [v15 timeIntervalSinceNow];
    if (v9 > 0.0)
    {
      [v15 timeIntervalSinceNow];
      double v11 = v10;
      [v8 timeout];
      if (v11 < v12)
      {
        [v7 timeout];
        if (v13 == 0.0 || ([v7 timeout], v11 < v14)) {
          [v7 setTimeout:v11];
        }
      }
    }
  }
}

@end