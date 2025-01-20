@interface IDSIMLFanoutFactoryComponent
- (id)createFanoutFromMessage:(id)a3 forService:(id)a4 fromIdentity:(id)a5 withMaxSize:(unint64_t)a6 chunkNumber:(int64_t)a7 firstMessage:(id)a8;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSIMLFanoutFactoryComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  v75 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v81 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 guid]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 prioritizedTokenList]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 prioritizedTokens]);

  v73 = v6;
  v82 = v3;
  v72 = (void *)v4;
  if ([v6 count])
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v111 = v4;
      __int16 v112 = 2112;
      id v113 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "GUID %@ Prioritizing tokens %@", buf, 0x16u);
    }

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 aggregatableMessages]);
    id v11 = [v10 countByEnumeratingWithState:&v101 objects:v109 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v102;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v102 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 targetToken]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 rawToken]);
          unsigned int v18 = [v73 containsObject:v17];

          if (v18) {
            v19 = v9;
          }
          else {
            v19 = v8;
          }
          -[NSMutableArray addObject:](v19, "addObject:", v15);
        }

        id v12 = [v10 countByEnumeratingWithState:&v101 objects:v109 count:16];
      }

      while (v12);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObjectsFromArray:](v9, "arrayByAddingObjectsFromArray:", v8));
    id v3 = v82;
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v3 aggregatableMessages]);
  }

  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id obj = v20;
  id v21 = [obj countByEnumeratingWithState:&v97 objects:v108 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v79 = *(void *)v98;
    uint64_t v23 = 1LL;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v98 != v79) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)j);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 command]);
        v27 = v26;
        if (v26)
        {
          v28 = v26;
        }

        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue([v3 messageToSend]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v29 additionalDictionary]);
          v28 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"c"]);

          id v3 = v82;
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v81, "objectForKey:", v28));
        if (([v3 forceOnePerFanout] & 1) != 0
          || ([v31 hasSpaceForAggregatableMessage:v25] & 1) == 0)
        {
          if (v31)
          {
            id v32 = [v31 copy];
            -[NSMutableArray addObject:](v75, "addObject:", v32);
          }

          v33 = (void *)objc_claimAutoreleasedReturnValue([v3 messageToSend]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v82 fromIdentity]);
          uint64_t v36 = objc_claimAutoreleasedReturnValue( -[IDSIMLFanoutFactoryComponent createFanoutFromMessage:forService:fromIdentity:withMaxSize:chunkNumber:firstMessage:]( self,  "createFanoutFromMessage:forService:fromIdentity:withMaxSize:chunkNumber:firstMessage:",  v33,  v34,  v35,  [v82 maxSize],  v23,  v25));

          id v3 = v82;
          ++v23;
          if (v28) {
            v37 = v28;
          }
          else {
            v37 = &off_100946CF0;
          }
          -[NSMutableDictionary setObject:forKey:](v81, "setObject:forKey:", v36, v37);
          v31 = (void *)v36;
        }

        v38 = (void *)objc_claimAutoreleasedReturnValue([v3 encryptedTopLevelPayload]);
        [v31 setGroupPayload:v38];

        [v31 addAggregatableMessage:v25];
      }

      id v22 = [obj countByEnumeratingWithState:&v97 objects:v108 count:16];
    }

    while (v22);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v81, "allValues"));
  -[NSMutableArray addObjectsFromArray:](v75, "addObjectsFromArray:", v39);

  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  v41 = v72;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    id v42 = -[NSMutableArray count](v75, "count");
    *(_DWORD *)buf = 138412546;
    uint64_t v111 = (uint64_t)v72;
    __int16 v112 = 2048;
    id v113 = v42;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "GUID %@ Constructed %lu fanouts", buf, 0x16u);
  }

  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  v70 = v75;
  id v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v70,  "countByEnumeratingWithState:objects:count:",  &v93,  v107,  16LL);
  if (v76)
  {
    uint64_t v74 = *(void *)v94;
    do
    {
      for (k = 0LL; k != v76; k = (char *)k + 1)
      {
        if (*(void *)v94 != v74) {
          objc_enumerationMutation(v70);
        }
        v44 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)k);
        v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        v46 = (void *)objc_claimAutoreleasedReturnValue([v44 individualPeerMessages]);
        id v47 = [v46 countByEnumeratingWithState:&v89 objects:v106 count:16];
        if (!v47)
        {

          v56 = &IMInsertBoolsToXPCDictionary_ptr;
LABEL_56:
          [v44 setWantsCertifiedDelivery:1];
          __int128 v87 = 0u;
          __int128 v88 = 0u;
          __int128 v85 = 0u;
          __int128 v86 = 0u;
          v57 = v44;
          v58 = (void *)objc_claimAutoreleasedReturnValue([v44 individualPeerMessages]);
          id v59 = [v58 countByEnumeratingWithState:&v85 objects:v105 count:16];
          if (v59)
          {
            id v60 = v59;
            uint64_t v61 = *(void *)v86;
            do
            {
              for (m = 0LL; m != v60; m = (char *)m + 1)
              {
                if (*(void *)v86 != v61) {
                  objc_enumerationMutation(v58);
                }
                [*(id *)(*((void *)&v85 + 1) + 8 * (void)m) setWantsCertifiedDelivery:0];
              }

              id v60 = [v58 countByEnumeratingWithState:&v85 objects:v105 count:16];
            }

            while (v60);
          }

          v44 = v57;
          goto LABEL_64;
        }

        id v48 = v47;
        v78 = v44;
        v80 = k;
        uint64_t v49 = *(void *)v90;
        unsigned __int8 v50 = 1;
        do
        {
          for (n = 0LL; n != v48; n = (char *)n + 1)
          {
            if (*(void *)v90 != v49) {
              objc_enumerationMutation(v46);
            }
            v52 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)n);
            v53 = (void *)objc_claimAutoreleasedReturnValue([v52 targetPeerID]);
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

          id v48 = [v46 countByEnumeratingWithState:&v89 objects:v106 count:16];
        }

        while (v48);

        v41 = v72;
        v56 = &IMInsertBoolsToXPCDictionary_ptr;
        v44 = v78;
        k = v80;
        if ((v50 & 1) != 0) {
          goto LABEL_56;
        }
LABEL_64:
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56[219] delivery]);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue([v44 chunkNumber]);
          *(_DWORD *)buf = 138412546;
          uint64_t v111 = (uint64_t)v41;
          __int16 v112 = 2112;
          id v113 = v64;
          _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "GUID %@ finished constructing fanout %@",  buf,  0x16u);
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue([v44 chunkNumber]);
        v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GUID %@ Fanout %@ (%@) contains:\n%@",  v41,  v65,  v44,  v45));

        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472LL;
        v83[2] = sub_100108B9C;
        v83[3] = &unk_1008F6010;
        id v84 = v66;
        id v67 = v66;
        cut_dispatch_log_queue(v83);

        id v3 = v82;
      }

      id v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v70,  "countByEnumeratingWithState:objects:count:",  &v93,  v107,  16LL);
    }

    while (v76);
  }

  [v3 setAggregateMessages:v70];
  v68 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTUnsafePromise,  "fulfilledPromiseWithValue:",  v3));

  return v68;
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

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage additionalDictionary](v17, "additionalDictionary"));
  id v20 = [v19 mutableCopy];
  id v21 = v20;
  if (v20) {
    id v22 = (NSMutableDictionary *)v20;
  }
  else {
    id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue([v13 messageBody]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:IDSCommandKey]);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v14 command]);
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v14 command]);
    -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v27, @"c");

    if (v25)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v13 additionalDictionary]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"c"]);
      -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v29, @"oC");
    }
  }

  -[IDSPeerAggregateMessage setAdditionalDictionary:](v17, "setAdditionalDictionary:", v23);

  return v17;
}

@end