@interface ADResultObjectCache
- (BOOL)callIsPossibleForRequestId:(id)a3;
- (BOOL)hasMissingRefContextsForId:(id)a3;
- (BOOL)hasResultObjectsForRequestId:(id)a3;
- (id)_missingReferenceFulfillmentContexts;
- (id)_missingReferenceFulfillmentContextsByRequestId;
- (id)_requestMap;
- (id)commandsForReply:(id)a3 toCommand:(id)a4 missingReferences:(id *)a5;
- (id)commandsForSuccessReplyToCommand:(id)a3;
- (id)objectsForIds:(id)a3 missingReferences:(id *)a4;
- (void)_addObjects:(id)a3 forRequestId:(id)a4 sessionRequestId:(id)a5;
- (void)_removeMissingRefContextsForRequestId:(id)a3;
- (void)_removeMissingReferenceContext:(id)a3;
- (void)addMissingReferencesContext:(id)a3;
- (void)addResultObjects:(id)a3 sessionRequestId:(id)a4;
- (void)clearResultObjectsForAllRequestIdsExcept:(id)a3;
- (void)clearResultObjectsForRequestId:(id)a3;
@end

@implementation ADResultObjectCache

- (id)_requestMap
{
  requestMap = self->_requestMap;
  if (!requestMap)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = self->_requestMap;
    self->_requestMap = v4;

    requestMap = self->_requestMap;
  }

  return requestMap;
}

- (id)_missingReferenceFulfillmentContexts
{
  missingReferenceFulfillmentContexts = self->_missingReferenceFulfillmentContexts;
  if (!missingReferenceFulfillmentContexts)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = self->_missingReferenceFulfillmentContexts;
    self->_missingReferenceFulfillmentContexts = v4;

    missingReferenceFulfillmentContexts = self->_missingReferenceFulfillmentContexts;
  }

  return missingReferenceFulfillmentContexts;
}

- (id)_missingReferenceFulfillmentContextsByRequestId
{
  missingReferenceFulfillmentContextsByRequestId = self->_missingReferenceFulfillmentContextsByRequestId;
  if (!missingReferenceFulfillmentContextsByRequestId)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = self->_missingReferenceFulfillmentContextsByRequestId;
    self->_missingReferenceFulfillmentContextsByRequestId = v4;

    missingReferenceFulfillmentContextsByRequestId = self->_missingReferenceFulfillmentContextsByRequestId;
  }

  return missingReferenceFulfillmentContextsByRequestId;
}

- (void)addMissingReferencesContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADResultObjectCache _missingReferenceFulfillmentContexts]( self,  "_missingReferenceFulfillmentContexts"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "missingReferences", 0));
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 setObject:v4 forKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)v10)];
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 requestId]);
  v12 = (void *)v11;
  v13 = @"com.apple.siri.nilRequestId";
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue( -[ADResultObjectCache _missingReferenceFulfillmentContextsByRequestId]( self,  "_missingReferenceFulfillmentContextsByRequestId"));
  v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v14]);
  if (!v16)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    [v15 setObject:v16 forKey:v14];
  }

  -[NSMutableSet addObject:](v16, "addObject:", v4);
}

- (BOOL)hasMissingRefContextsForId:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADResultObjectCache _missingReferenceFulfillmentContextsByRequestId]( self,  "_missingReferenceFulfillmentContextsByRequestId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  LOBYTE(v4) = [v6 count] != 0;
  return (char)v4;
}

- (void)_addObjects:(id)a3 forRequestId:(id)a4 sessionRequestId:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (__CFString *)a4;
  id v45 = a5;
  if (v9) {
    v10 = v9;
  }
  else {
    v10 = @"com.apple.siri.nilRequestId";
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADResultObjectCache _requestMap](self, "_requestMap"));
  v49 = v10;
  v48 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);
  if (!v48)
  {
    v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_msgSend(v11, "setObject:forKey:");
  }

  v44 = v11;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v12)
  {
    id v13 = v12;
    v46 = 0LL;
    uint64_t v14 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceId", v44));
        if (v17)
        {
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 refId]);
          __int128 v19 = v18;
          if (v18)
          {
            if ([v18 isEqualToString:v45])
            {
              [v16 setRefId:v10];
              __int128 v20 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v60 = "-[ADResultObjectCache _addObjects:forRequestId:sessionRequestId:]";
                __int16 v61 = 2112;
                v62 = v10;
                __int16 v63 = 2112;
                id v64 = v45;
                _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Setting refId to %@ from session request %@",  buf,  0x20u);
              }
            }
          }

          -[NSMutableDictionary setObject:forKey:](v48, "setObject:forKey:", v16, v17);
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___SAPhoneCall);
          if ((objc_opt_isKindOfClass(v16, v21) & 1) != 0)
          {
            requestsWithPhoneCall = self->_requestsWithPhoneCall;
            if (!requestsWithPhoneCall)
            {
              v23 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
              v24 = self->_requestsWithPhoneCall;
              self->_requestsWithPhoneCall = v23;

              requestsWithPhoneCall = self->_requestsWithPhoneCall;
            }

            -[NSMutableSet addObject:](requestsWithPhoneCall, "addObject:", v10);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_missingReferenceFulfillmentContexts,  "objectForKey:",  v17));
          uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 requestId]);
          v27 = (void *)v26;
          v28 = @"com.apple.siri.nilRequestId";
          if (v26) {
            v28 = (__CFString *)v26;
          }
          v29 = v28;

          if (v25 && -[__CFString isEqualToString:](v10, "isEqualToString:", v29))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue([v25 _mutableResolvedIds]);
            [v30 addObject:v17];

            v31 = v46;
            if (!v46) {
              v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            }
            v46 = v31;
            -[NSMutableSet addObject:](v31, "addObject:", v25);
          }
        }
      }

      id v13 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    }

    while (v13);
  }

  else
  {
    v46 = 0LL;
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  v32 = v46;
  id v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v50,  v58,  16LL);
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v51;
    do
    {
      for (j = 0LL; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v51 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)j);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "resolvedReferences", v44));
        id v39 = [v38 count];
        v40 = (void *)objc_claimAutoreleasedReturnValue([v37 missingReferences]);
        id v41 = [v40 count];

        if (v39 == v41)
        {
          [v37 setHasBeenFulfilled:1];
          uint64_t v42 = objc_claimAutoreleasedReturnValue([v37 fulfillmentBlock]);
          v43 = (void *)v42;
          if (v42) {
            (*(void (**)(uint64_t))(v42 + 16))(v42);
          }
          -[ADResultObjectCache _removeMissingReferenceContext:](self, "_removeMissingReferenceContext:", v37);
        }
      }

      id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v50,  v58,  16LL);
    }

    while (v34);
  }
}

- (void)addResultObjects:(id)a3 sessionRequestId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 objects]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 refId]);

  -[ADResultObjectCache _addObjects:forRequestId:sessionRequestId:]( self,  "_addObjects:forRequestId:sessionRequestId:",  v9,  v8,  v6);
}

- (id)commandsForReply:(id)a3 toCommand:(id)a4 missingReferences:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
    __int16 v75 = 2112;
    uint64_t v76 = (uint64_t)v7;
    __int16 v77 = 2112;
    id v78 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s reply = %@, command = %@", buf, 0x20u);
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 refId]);
  if (v10) {
    uint64_t v11 = (const __CFString *)v10;
  }
  else {
    uint64_t v11 = @"com.apple.siri.nilRequestId";
  }
  __int128 v57 = (__CFString *)v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_requestMap, "objectForKey:"));
  id v55 = v7;
  if (v7) {
    uint64_t v13 = (uint64_t)[v7 resultCallbackCode];
  }
  else {
    uint64_t v13 = -1LL;
  }
  uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
    __int16 v75 = 2048;
    uint64_t v76 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s replyCode = %ld", buf, 0x16u);
  }

  id v54 = v8;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ad_callbacks"));
  id v16 = [v15 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v16)
  {
    id v17 = v16;
    id v18 = 0LL;
    uint64_t v19 = *(void *)v67;
LABEL_13:
    uint64_t v20 = 0LL;
    while (1)
    {
      if (*(void *)v67 != v19) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void **)(*((void *)&v66 + 1) + 8 * v20);
      id v22 = [v21 code];
      if (v22 == (id)v13) {
        break;
      }
      if (!v18)
      {
        if (v22 == (id)-1LL) {
          id v18 = v21;
        }
        else {
          id v18 = 0LL;
        }
      }

      if (v17 == (id)++v20)
      {
        id v17 = [v15 countByEnumeratingWithState:&v66 objects:v72 count:16];
        if (v17) {
          goto LABEL_13;
        }
        goto LABEL_28;
      }
    }

    id v23 = v21;

    if (v23) {
      goto LABEL_30;
    }
    if (v13)
    {
LABEL_26:
      id v18 = v18;
      id v23 = v18;
      goto LABEL_30;
    }
  }

  else
  {
    id v18 = 0LL;
LABEL_28:

    if (v13) {
      goto LABEL_26;
    }
  }

  id v23 = 0LL;
LABEL_30:
  __int128 v51 = v18;
  v24 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
    __int16 v75 = 2112;
    uint64_t v76 = (uint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s callbackForReply = %@", buf, 0x16u);
  }

  id v52 = v15;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v23 commandReferences]);
  uint64_t v26 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v25 count]);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id obj = v25;
  id v27 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v27)
  {
    id v28 = v27;
    v29 = 0LL;
    uint64_t v30 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v63 != v30) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v32]);
        if (v33)
        {
          id v34 = v26;
          uint64_t v35 = v33;
        }

        else
        {
          if (!v29) {
            v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          id v34 = v29;
          uint64_t v35 = v32;
        }

        -[NSMutableArray addObject:](v34, "addObject:", v35);
      }

      id v28 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
    }

    while (v28);
  }

  else
  {
    v29 = 0LL;
  }

  __int128 v50 = v23;
  v36 = (void *)objc_claimAutoreleasedReturnValue([v23 commands]);
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v37 = [v36 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v59;
    do
    {
      for (j = 0LL; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v59 != v39) {
          objc_enumerationMutation(v36);
        }
        id v41 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
        uint64_t v42 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
          __int16 v75 = 2112;
          uint64_t v76 = (uint64_t)v41;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Adding flowCommand %@", buf, 0x16u);
        }

        [v41 setRefId:v57];
        -[NSMutableArray addObject:](v26, "addObject:", v41);
      }

      id v38 = [v36 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }

    while (v38);
  }

  if (-[NSMutableArray count](v29, "count"))
  {

    v43 = (os_log_s *)AFSiriLogContextDaemon;
    id v45 = v54;
    v44 = v55;
    v47 = v52;
    v46 = v12;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
      __int16 v75 = 2112;
      uint64_t v76 = (uint64_t)v29;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s missingReferences %@", buf, 0x16u);
    }

    uint64_t v26 = 0LL;
  }

  else
  {
    id v45 = v54;
    v44 = v55;
    v47 = v52;
    v46 = v12;
  }

  if (a5) {
    *a5 = v29;
  }
  v48 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v74 = "-[ADResultObjectCache commandsForReply:toCommand:missingReferences:]";
    __int16 v75 = 2112;
    uint64_t v76 = (uint64_t)v26;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s callbackCommands = %@", buf, 0x16u);
  }

  return v26;
}

- (id)objectsForIds:(id)a3 missingReferences:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_requestMap,  "objectForKey:",  @"com.apple.siri.nilRequestId"));
  if (!v7)
  {
    id v12 = (NSMutableArray *)[v6 copy];
    id v8 = 0LL;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  uint64_t v21 = a4;
  id v8 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v22 = v6;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0LL;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v15, v21));
        if (v16)
        {
          id v17 = v8;
          id v18 = v16;
        }

        else
        {
          if (!v12) {
            id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          id v17 = v12;
          id v18 = v15;
        }

        -[NSMutableArray addObject:](v17, "addObject:", v18);
      }

      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v11);
  }

  else
  {
    id v12 = 0LL;
  }

  a4 = v21;
  id v6 = v22;
  if (v21) {
LABEL_19:
  }
    *a4 = v12;
LABEL_20:
  uint64_t v19 = v8;

  return v19;
}

- (void)clearResultObjectsForRequestId:(id)a3
{
  id v4 = (const __CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"com.apple.siri.nilRequestId";
  }
  id v7 = (__CFString *)v5;
  -[NSMutableDictionary removeObjectForKey:](self->_requestMap, "removeObjectForKey:");
  -[NSMutableSet removeObject:](self->_requestsWithPhoneCall, "removeObject:", v7);
  if (!-[NSMutableSet count](self->_requestsWithPhoneCall, "count"))
  {
    requestsWithPhoneCall = self->_requestsWithPhoneCall;
    self->_requestsWithPhoneCall = 0LL;
  }

  -[ADResultObjectCache _removeMissingRefContextsForRequestId:](self, "_removeMissingRefContextsForRequestId:", v7);
}

- (void)_removeMissingRefContextsForRequestId:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_missingReferenceFulfillmentContextsByRequestId,  "objectForKey:",  v4));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( self->_missingReferenceFulfillmentContexts,  "allKeysForObject:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v9)));
        -[NSMutableDictionary removeObjectsForKeys:]( self->_missingReferenceFulfillmentContexts,  "removeObjectsForKeys:",  v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  -[NSMutableDictionary removeObjectForKey:]( self->_missingReferenceFulfillmentContextsByRequestId,  "removeObjectForKey:",  v4);
}

- (void)_removeMissingReferenceContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 requestId]);
  id v6 = (void *)v5;
  id v7 = @"com.apple.siri.nilRequestId";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  id v10 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary allKeysForObject:]( self->_missingReferenceFulfillmentContexts,  "allKeysForObject:",  v4));
  -[NSMutableDictionary removeObjectsForKeys:](self->_missingReferenceFulfillmentContexts, "removeObjectsForKeys:", v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_missingReferenceFulfillmentContextsByRequestId,  "objectForKey:",  v8));

  [v9 removeObject:v4];
}

- (void)clearResultObjectsForAllRequestIdsExcept:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_requestMap, "objectForKey:", v12));
          if (v13)
          {
            -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v13, v12);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v9);
    }

    if (v4) {
      goto LABEL_13;
    }
  }

  else
  {
    id v6 = 0LL;
    uint64_t v5 = 0LL;
    if (v4)
    {
LABEL_13:
      __int128 v14 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v4);
      goto LABEL_16;
    }
  }

  __int128 v14 = 0LL;
LABEL_16:
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_missingReferenceFulfillmentContextsByRequestId, "allKeys"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)j);
        if (!-[NSSet containsObject:](v14, "containsObject:", v20)) {
          -[ADResultObjectCache _removeMissingRefContextsForRequestId:]( self,  "_removeMissingRefContextsForRequestId:",  v20);
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }

    while (v17);
  }

  if (-[NSMutableDictionary count](v5, "count")) {
    uint64_t v21 = v5;
  }
  else {
    uint64_t v21 = 0LL;
  }
  objc_storeStrong((id *)&self->_requestMap, v21);
  if (-[NSMutableSet count](v6, "count")) {
    id v22 = v6;
  }
  else {
    id v22 = 0LL;
  }
  objc_storeStrong((id *)&self->_requestsWithPhoneCall, v22);
}

- (BOOL)hasResultObjectsForRequestId:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"com.apple.siri.nilRequestId";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_requestMap, "objectForKey:", v5));
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (BOOL)callIsPossibleForRequestId:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"com.apple.siri.nilRequestId";
  }
  unsigned __int8 v6 = -[NSMutableSet containsObject:](self->_requestsWithPhoneCall, "containsObject:", v5);

  return v6;
}

- (id)commandsForSuccessReplyToCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 refId]);
  if (v5
    && (unsigned __int8 v6 = (void *)v5,
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ad_callbacks")),
        v7,
        v6,
        v7))
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ad_callbacks"));
    id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v31;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          if (![v12 code])
          {
            id v9 = (id)objc_claimAutoreleasedReturnValue([v12 commandReferences]);
            goto LABEL_14;
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (void).cxx_destruct
{
}

@end