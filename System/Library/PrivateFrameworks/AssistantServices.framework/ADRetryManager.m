@interface ADRetryManager
- (BOOL)_canRestartRequest;
- (BOOL)_commandRefsOrIsCurrentRequest:(id)a3;
- (BOOL)commandRefsRestartCommand:(id)a3;
- (BOOL)shouldRetryOnConnectionFailure;
- (NSString)latestMappedRequestId;
- (id)nakedObjectsToRetry;
- (id)objectsToRetry;
- (id)originalRequestId;
- (id)retryRequestId;
- (void)_clearRequestCommands;
- (void)_objectsToRemapFromRefId:(id)a3 toRefId:(id)a4 retryFullRequest:(BOOL)a5 commandsToRetry:(id)a6;
- (void)appendSessionObjectToRequest:(id)a3;
- (void)beginRetryableRequest:(id)a3;
- (void)clearNakedObjects;
- (void)endRetryableRequestForCommand:(id)a3;
- (void)endRetryableRequestForCommandAceId:(id)a3 refId:(id)a4;
- (void)setLastReceivedCommand:(id)a3;
- (void)setLatestMappedRequestId:(id)a3;
- (void)setNeedsToRetryNakedObjects;
@end

@implementation ADRetryManager

- (void)_clearRequestCommands
{
  self->_retryCount = 0;
  restartRequest = self->_restartRequest;
  self->_restartRequest = 0LL;

  requestObjects = self->_requestObjects;
  self->_requestObjects = 0LL;
}

- (BOOL)_commandRefsOrIsCurrentRequest:(id)a3
{
  restartRequest = self->_restartRequest;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest requestId](restartRequest, "requestId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);

  else {
    unsigned __int8 v8 = [v7 isEqualToString:v5];
  }

  return v8;
}

- (void)beginRetryableRequest:(id)a3
{
  id v4 = a3;
  if (self->_restartRequest)
  {
    v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      v20 = "-[ADRetryManager beginRetryableRequest:]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Interrupting outstanding request for new request",  (uint8_t *)&v19,  0xCu);
    }

    -[ADRetryManager _clearRequestCommands](self, "_clearRequestCommands");
  }

  v6 = objc_alloc_init(&OBJC_CLASS___SARestartRequest);
  uint64_t v7 = SiriCoreUUIDStringCreate(v6);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[SARestartRequest setAceId:](v6, "setAceId:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
  -[SARestartRequest setRequestId:](v6, "setRequestId:", v9);

  v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest aceId](v6, "aceId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest requestId](v6, "requestId"));
    int v19 = 136315650;
    v20 = "-[ADRetryManager beginRetryableRequest:]";
    __int16 v21 = 2112;
    v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s AceId of RestartRequest is %@ requestId is %@",  (uint8_t *)&v19,  0x20u);
  }

  restartRequest = self->_restartRequest;
  self->_restartRequest = v6;
  v15 = v6;

  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  requestObjects = self->_requestObjects;
  self->_requestObjects = v16;

  originalRequest = self->_originalRequest;
  self->_originalRequest = (SAServerBoundCommand *)v4;
}

- (void)appendSessionObjectToRequest:(id)a3
{
  id v9 = a3;
  if (objc_msgSend(v9, "siriCore_isRetryable"))
  {
    requestObjects = self->_requestObjects;
    if (requestObjects)
    {
      id v5 = v9;
    }

    else
    {
      requestObjects = self->_nakedObjects;
      id v6 = v9;
      if (!requestObjects)
      {
        uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        nakedObjects = self->_nakedObjects;
        self->_nakedObjects = v7;

        id v6 = v9;
        requestObjects = self->_nakedObjects;
      }

      id v5 = v6;
    }

    -[NSMutableArray addObject:](requestObjects, "addObject:", v5);
  }
}

- (BOOL)shouldRetryOnConnectionFailure
{
  return self->_retryCount < 5;
}

- (void)endRetryableRequestForCommand:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ADRetryManager endRetryableRequestForCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  if (!v4
    || -[ADRetryManager _commandRefsOrIsCurrentRequest:](self, "_commandRefsOrIsCurrentRequest:", v4)
    || -[ADRetryManager commandRefsRestartCommand:](self, "commandRefsRestartCommand:", v4))
  {
    -[ADRetryManager _clearRequestCommands](self, "_clearRequestCommands");
  }
}

- (void)endRetryableRequestForCommandAceId:(id)a3 refId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest requestId](self->_restartRequest, "requestId"));
  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    v13 = "-[ADRetryManager endRetryableRequestForCommandAceId:refId:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }

  if (([v7 isEqualToString:v8] & 1) != 0
    || [v6 isEqualToString:v8])
  {
    -[ADRetryManager _clearRequestCommands](self, "_clearRequestCommands");
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest aceId](self->_restartRequest, "aceId"));
  unsigned int v11 = [v10 isEqualToString:v7];

  if (v11) {
    -[ADRetryManager _clearRequestCommands](self, "_clearRequestCommands");
  }
}

- (void)setLastReceivedCommand:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADRetryManager setLastReceivedCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  -[SARestartRequest setLastResponseId:](self->_restartRequest, "setLastResponseId:", v4);
}

- (BOOL)_canRestartRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest lastResponseId](self->_restartRequest, "lastResponseId"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)_objectsToRemapFromRefId:(id)a3 toRefId:(id)a4 retryFullRequest:(BOOL)a5 commandsToRetry:(id)a6
{
  BOOL v7 = a5;
  id v28 = a3;
  id v26 = a4;
  id v10 = a6;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  obj = self->_requestObjects;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v29,  v39,  16LL);
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v30;
    v15 = @"restart request";
    if (v7) {
      v15 = @"for full request";
    }
    v25 = v15;
    if (v28) {
      BOOL v16 = v26 == 0LL;
    }
    else {
      BOOL v16 = 1;
    }
    int v17 = !v16;
    *(void *)&__int128 v12 = 136315650LL;
    __int128 v24 = v12;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        int v19 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v18);
        v20 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v24;
          v34 = "-[ADRetryManager _objectsToRemapFromRefId:toRefId:retryFullRequest:commandsToRetry:]";
          __int16 v35 = 2112;
          v36 = v19;
          __int16 v37 = 2112;
          v38 = v25;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s object is %@ %@", buf, 0x20u);
          if (!v7)
          {
LABEL_16:
          }
        }

        else if (!v7)
        {
          goto LABEL_16;
        }

        if (v17)
        {
          if (([v26 isEqualToString:v28] & 1) == 0)
          {
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 refId]);
            unsigned int v22 = [v21 isEqualToString:v28];

            if (v22) {
              [v19 setRefId:v26];
            }
          }
        }

        objc_msgSend(v10, "addObject:", v19, v24);
LABEL_22:
        v18 = (char *)v18 + 1;
      }

      while (v13 != v18);
      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v29,  v39,  16LL);
      id v13 = v23;
    }

    while (v23);
  }
}

- (id)objectsToRetry
{
  BOOL v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    restartRequest = self->_restartRequest;
    id v5 = v3;
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest lastResponseId](restartRequest, "lastResponseId"));
    int v20 = 136315394;
    __int16 v21 = "-[ADRetryManager objectsToRetry]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Can restart request if %@",  (uint8_t *)&v20,  0x16u);
  }

  BOOL v7 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  (char *)-[NSMutableArray count](self->_requestObjects, "count") + 1);
  unsigned __int8 v8 = v7;
  if (self->_nakedObjects) {
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:");
  }
  if (-[ADRetryManager _canRestartRequest](self, "_canRestartRequest"))
  {
    -[NSMutableArray addObject:](v8, "addObject:", self->_restartRequest);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest requestId](self->_restartRequest, "requestId"));
    id v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[SARestartRequest aceId](self->_restartRequest, "aceId"));
    -[ADRetryManager _objectsToRemapFromRefId:toRefId:retryFullRequest:commandsToRetry:]( self,  "_objectsToRemapFromRefId:toRefId:retryFullRequest:commandsToRetry:",  v9,  v10,  0LL,  v8);
LABEL_14:

    goto LABEL_15;
  }

  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315138;
    __int16 v21 = "-[ADRetryManager objectsToRetry]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Retrying full request", (uint8_t *)&v20, 0xCu);
  }

  originalRequest = self->_originalRequest;
  if (originalRequest)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAServerBoundCommand aceId](originalRequest, "aceId"));
    latestMappedRequestId = self->_latestMappedRequestId;
    if (!latestMappedRequestId)
    {
      uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v15 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
      latestMappedRequestId = (NSString *)v9;
      if (v15)
      {
        int v20 = 136315394;
        __int16 v21 = "-[ADRetryManager objectsToRetry]";
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s latestMappedRequestId is not set for %@",  (uint8_t *)&v20,  0x16u);
        latestMappedRequestId = (NSString *)v9;
      }
    }

    id v10 = latestMappedRequestId;
    id v16 = -[SAServerBoundCommand copy](self->_originalRequest, "copy");
    [v16 setAceId:v10];
    -[NSMutableArray addObject:](v8, "addObject:", v16);
    -[ADRetryManager _objectsToRemapFromRefId:toRefId:retryFullRequest:commandsToRetry:]( self,  "_objectsToRemapFromRefId:toRefId:retryFullRequest:commandsToRetry:",  v9,  v10,  1LL,  v8);

    goto LABEL_14;
  }

  if (self->_requestObjects) {
    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:");
  }
LABEL_15:
  if (-[NSMutableArray count](v8, "count")) {
    int v17 = v8;
  }
  else {
    int v17 = 0LL;
  }
  v18 = v17;

  return v18;
}

- (BOOL)commandRefsRestartCommand:(id)a3
{
  restartRequest = self->_restartRequest;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest aceId](restartRequest, "aceId"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)originalRequestId
{
  return -[SARestartRequest requestId](self->_restartRequest, "requestId");
}

- (id)retryRequestId
{
  if (-[ADRetryManager _canRestartRequest](self, "_canRestartRequest")) {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SARestartRequest aceId](self->_restartRequest, "aceId"));
  }
  else {
    BOOL v3 = 0LL;
  }
  return v3;
}

- (NSString)latestMappedRequestId
{
  latestMappedRequestId = self->_latestMappedRequestId;
  if (latestMappedRequestId) {
    return latestMappedRequestId;
  }
  else {
    return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[ADRetryManager originalRequestId](self, "originalRequestId"));
  }
}

- (void)setNeedsToRetryNakedObjects
{
  self->_needsToRetryNakedObjects = 1;
}

- (id)nakedObjectsToRetry
{
  if (self->_needsToRetryNakedObjects) {
    return self->_nakedObjects;
  }
  else {
    return 0LL;
  }
}

- (void)clearNakedObjects
{
  self->_needsToRetryNakedObjects = 0;
  nakedObjects = self->_nakedObjects;
  self->_nakedObjects = 0LL;
}

- (void)setLatestMappedRequestId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end