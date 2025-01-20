@interface DebugHierarchyRequest
+ (DebugHierarchyRequest)requestWithBase64Data:(id)a3 error:(id *)a4;
+ (DebugHierarchyRequest)requestWithDictionary:(id)a3;
+ (DebugHierarchyRequest)requestWithDiscoveryType:(int64_t)a3 actions:(id)a4 completion:(id)a5;
+ (DebugHierarchyRequest)requestWithName:(id)a3 discoveryType:(int64_t)a4 actions:(id)a5 completion:(id)a6;
+ (id)_compatibleRequestWithDictionary:(id)a3;
+ (id)_requestWithV1RequestDictionary:(id)a3;
- (BOOL)compressDuringTransport;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsCompatibilityConversion;
- (BOOL)wantsUserFacingStatusUpdates;
- (DebugHierarchyCrawlerOptions)crawlerOptions;
- (DebugHierarchyRequest)init;
- (DebugHierarchyRequest)initWithDictionary:(id)a3;
- (DebugHierarchyRequest)initWithWithDiscoveryType:(int64_t)a3 actions:(id)a4 completion:(id)a5;
- (DebugHierarchyRequestFailureReason)failureReason;
- (NSArray)actions;
- (NSArray)logs;
- (NSData)rawResponseData;
- (NSData)serializedCompatibilitySupportRepresentation;
- (NSDate)executionEndDate;
- (NSDate)executionStartDate;
- (NSDictionary)payload;
- (NSString)base64Encoded;
- (NSString)identifier;
- (NSString)name;
- (NSString)statusMessageActivityPhrase;
- (double)timeout;
- (float)initiatorVersion;
- (id)completion;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (id)formattedResponseDataForRawRequestResultData:(id)a3;
- (id)humanReadableStatusMessage;
- (id)progressHandler;
- (int64_t)objectDiscovery;
- (int64_t)priority;
- (int64_t)status;
- (void)addLogEntry:(id)a3;
- (void)cancel;
- (void)setActions:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCompressDuringTransport:(BOOL)a3;
- (void)setCrawlerOptions:(id)a3;
- (void)setExecutionEndDate:(id)a3;
- (void)setExecutionStartDate:(id)a3;
- (void)setFailureReason:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitiatorVersion:(float)a3;
- (void)setLogs:(id)a3;
- (void)setName:(id)a3;
- (void)setNeedsCompatibilityConversion:(BOOL)a3;
- (void)setProgressHandler:(id)a3;
- (void)setRawResponseData:(id)a3;
- (void)setSerializedCompatibilitySupportRepresentation:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setStatusMessageActivityPhrase:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setWantsUserFacingStatusUpdates:(BOOL)a3;
@end

@implementation DebugHierarchyRequest

+ (DebugHierarchyRequest)requestWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDictionary:v4];

  return (DebugHierarchyRequest *)v5;
}

- (DebugHierarchyRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = -[DebugHierarchyRequest init](self, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyRequestIdentifier"]);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyRequestName"]);
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyRequestInitiatorVersionKey"]);
    [v10 floatValue];
    v5->_initiatorVersion = v11;

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyRequestPriority"]);
    v5->_priority = (int64_t)[v12 integerValue];

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyRequestPayload"]);
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyObjectDiscovery"]);
    v5->_objectDiscovery = (int64_t)[v15 unsignedIntegerValue];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyRequestTransportCompression"]);
    v5->_compressDuringTransport = [v16 BOOLValue];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyCrawlerOptions"]);
    if (v17)
    {
      v18 = -[DebugHierarchyCrawlerOptions initWithDictionary:]( objc_alloc(&OBJC_CLASS___DebugHierarchyCrawlerOptions),  "initWithDictionary:",  v17);
      crawlerOptions = v5->_crawlerOptions;
      v5->_crawlerOptions = v18;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyRequestActions"]);
    if ([v20 count])
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v20 count]));
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      v22 = v20;
      id v23 = v20;
      id v24 = [v23 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v49;
        do
        {
          for (i = 0LL; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v49 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = DebugHierarchyRequestActionForDictionary(*(void **)(*((void *)&v48 + 1) + 8LL * (void)i));
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            if (v29) {
              [v21 addObject:v29];
            }
          }

          id v25 = [v23 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }

        while (v25);
      }

      v30 = (NSArray *)[v21 copy];
      actions = v5->_actions;
      v5->_actions = v30;

      v20 = v22;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"logs"]);
    if ([v32 count])
    {
      v43 = v17;
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v32 count]));
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id v34 = v32;
      id v35 = [v34 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v45;
        do
        {
          for (j = 0LL; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v45 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyLogEntry logEntryWithDictionary:]( &OBJC_CLASS___DebugHierarchyLogEntry,  "logEntryWithDictionary:",  *(void *)(*((void *)&v44 + 1) + 8LL * (void)j)));
            [v33 addObject:v39];
          }

          id v36 = [v34 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }

        while (v36);
      }

      v40 = (NSArray *)[v33 copy];
      logs = v5->_logs;
      v5->_logs = v40;

      v17 = v43;
    }
  }

  return v5;
}

+ (DebugHierarchyRequest)requestWithDiscoveryType:(int64_t)a3 actions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)a1) initWithWithDiscoveryType:a3 actions:v9 completion:v8];

  return (DebugHierarchyRequest *)v10;
}

+ (DebugHierarchyRequest)requestWithName:(id)a3 discoveryType:(int64_t)a4 actions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithWithDiscoveryType:a4 actions:v11 completion:v10];

  [v13 setName:v12];
  return (DebugHierarchyRequest *)v13;
}

- (DebugHierarchyRequest)initWithWithDiscoveryType:(int64_t)a3 actions:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = -[DebugHierarchyRequest init](self, "init");
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v13;

    +[DebugHierarchyTargetHub debugHierarchyVersion](&OBJC_CLASS___DebugHierarchyTargetHub, "debugHierarchyVersion");
    v11->_initiatorVersion = v15;
    objc_storeStrong((id *)&v11->_actions, a4);
    v11->_objectDiscovery = a3;
    id v16 = objc_retainBlock(v10);
    id completion = v11->_completion;
    v11->_id completion = v16;

    v11->_compressDuringTransport = 1;
  }

  return v11;
}

- (DebugHierarchyRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DebugHierarchyRequest;
  result = -[DebugHierarchyRequest init](&v3, "init");
  if (result) {
    result->_timeout = 60.0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___DebugHierarchyRequest, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest identifier](self, "identifier"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned __int8 v9 = [v7 isEqualToString:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)cancel
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest completion](self, "completion"));

  if (v3)
  {
    id v4 = (void (**)(id, DebugHierarchyRequest *))objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest completion](self, "completion"));
    v4[2](v4, self);
  }

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest identifier](self, "identifier"));
  [v3 setObject:v4 forKeyedSubscript:@"DBGHierarchyRequestIdentifier"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest name](self, "name"));
  [v3 setObject:v5 forKeyedSubscript:@"DBGHierarchyRequestName"];

  -[DebugHierarchyRequest initiatorVersion](self, "initiatorVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v3 setObject:v6 forKeyedSubscript:@"DBGHierarchyRequestInitiatorVersionKey"];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[DebugHierarchyRequest priority](self, "priority")));
  [v3 setObject:v7 forKeyedSubscript:@"DBGHierarchyRequestPriority"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[DebugHierarchyRequest objectDiscovery](self, "objectDiscovery")));
  [v3 setObject:v8 forKeyedSubscript:@"DBGHierarchyObjectDiscovery"];

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DebugHierarchyRequest compressDuringTransport](self, "compressDuringTransport")));
  [v3 setObject:v9 forKeyedSubscript:@"DBGHierarchyRequestTransportCompression"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest payload](self, "payload"));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest payload](self, "payload"));
    [v3 setObject:v11 forKey:@"DBGHierarchyRequestPayload"];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest crawlerOptions](self, "crawlerOptions"));

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest crawlerOptions](self, "crawlerOptions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionaryRepresentation]);
    [v3 setObject:v14 forKeyedSubscript:@"DBGHierarchyCrawlerOptions"];
  }

  float v15 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest actions](self, "actions"));
  id v16 = [v15 count];

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest actions](self, "actions"));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v17 count]));

    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest actions](self, "actions"));
    id v20 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v44;
      do
      {
        id v23 = 0LL;
        do
        {
          if (*(void *)v44 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v43 + 1) + 8 * (void)v23) dictionaryRepresentation]);
          [v18 addObject:v24];

          id v23 = (char *)v23 + 1;
        }

        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }

      while (v21);
    }

    id v25 = [v18 copy];
    [v3 setObject:v25 forKeyedSubscript:@"DBGHierarchyRequestActions"];
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest logs](self, "logs"));
  id v27 = [v26 count];

  if (v27)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest logs](self, "logs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v28 count]));

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest logs](self, "logs", 0LL));
    id v31 = [v30 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v40;
      do
      {
        id v34 = 0LL;
        do
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(v30);
          }
          id v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v39 + 1) + 8 * (void)v34) dictionaryRepresentation]);
          [v29 addObject:v35];

          id v34 = (char *)v34 + 1;
        }

        while (v32 != v34);
        id v32 = [v30 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }

      while (v32);
    }

    id v36 = [v29 copy];
    [v3 setObject:v36 forKeyedSubscript:@"logs"];
  }

  id v37 = [v3 copy];

  return v37;
}

- (void)addLogEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest logs](self, "logs"));
  id v6 = [v5 count];

  if (v6)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest logs](self, "logs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v9 arrayByAddingObject:v4]);

    -[DebugHierarchyRequest setLogs:](self, "setLogs:", v7);
  }

  else
  {
    id v10 = v4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

    -[DebugHierarchyRequest setLogs:](self, "setLogs:", v8);
  }

- (NSString)base64Encoded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 generateJSONDataWithError:0]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);

  return (NSString *)v4;
}

- (id)humanReadableStatusMessage
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest statusMessageActivityPhrase](self, "statusMessageActivityPhrase"));
  id v4 = [v3 length];

  if (v4)
  {
    int64_t v5 = -[DebugHierarchyRequest status](self, "status");
    switch(v5)
    {
      case -2LL:
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest statusMessageActivityPhrase](self, "statusMessageActivityPhrase"));
        v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to fetch %@", v6);
        break;
      case 3LL:
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest statusMessageActivityPhrase](self, "statusMessageActivityPhrase"));
        v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Fetching %@ completed",  v6);
        break;
      case 2LL:
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest statusMessageActivityPhrase](self, "statusMessageActivityPhrase"));
        v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Fetching %@", v6);
        break;
      default:
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest statusMessageActivityPhrase](self, "statusMessageActivityPhrase"));
        v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Waiting for %@ to be fetched",  v6);
        break;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)debugDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %@", self, v3));

  return v4;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setName:(id)a3
{
}

- (float)initiatorVersion
{
  return self->_initiatorVersion;
}

- (void)setInitiatorVersion:(float)a3
{
  self->_initiatorVersion = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)actions
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setActions:(id)a3
{
}

- (int64_t)objectDiscovery
{
  return self->_objectDiscovery;
}

- (DebugHierarchyCrawlerOptions)crawlerOptions
{
  return (DebugHierarchyCrawlerOptions *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCrawlerOptions:(id)a3
{
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 96LL, 1);
}

- (void)setProgressHandler:(id)a3
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 104LL, 1);
}

- (void)setCompletion:(id)a3
{
}

- (NSArray)logs
{
  return (NSArray *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setLogs:(id)a3
{
}

- (NSString)statusMessageActivityPhrase
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setStatusMessageActivityPhrase:(id)a3
{
}

- (BOOL)wantsUserFacingStatusUpdates
{
  return self->_wantsUserFacingStatusUpdates;
}

- (void)setWantsUserFacingStatusUpdates:(BOOL)a3
{
  self->_wantsUserFacingStatusUpdates = a3;
}

- (NSDate)executionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setExecutionStartDate:(id)a3
{
}

- (NSDate)executionEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setExecutionEndDate:(id)a3
{
}

- (NSData)serializedCompatibilitySupportRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setSerializedCompatibilitySupportRepresentation:(id)a3
{
}

- (BOOL)needsCompatibilityConversion
{
  return self->_needsCompatibilityConversion;
}

- (void)setNeedsCompatibilityConversion:(BOOL)a3
{
  self->_needsCompatibilityConversion = a3;
}

- (BOOL)compressDuringTransport
{
  return self->_compressDuringTransport;
}

- (void)setCompressDuringTransport:(BOOL)a3
{
  self->_compressDuringTransport = a3;
}

- (DebugHierarchyRequestFailureReason)failureReason
{
  return (DebugHierarchyRequestFailureReason *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setFailureReason:(id)a3
{
}

- (NSData)rawResponseData
{
  return (NSData *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setRawResponseData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)formattedResponseDataForRawRequestResultData:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    -[DebugHierarchyRequest initiatorVersion](self, "initiatorVersion");
    if (v7 < 3.0)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dbg_gzipDeflateRaw"));
LABEL_7:
      id v9 = (void *)v8;

      id v6 = v9;
      goto LABEL_8;
    }

    if (-[DebugHierarchyRequest compressDuringTransport](self, "compressDuringTransport"))
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dbg_gzipDeflate"));
      goto LABEL_7;
    }
  }

  else
  {
    id v6 = 0LL;
  }

+ (DebugHierarchyRequest)requestWithBase64Data:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v5,  0LL);
  id v14 = 0LL;
  float v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithJSONData:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithJSONData:error:",  v6,  &v14));
  id v9 = v14;
  if (v9 || !v7)
  {
    uint64_t v11 = objc_opt_class(a1, v8);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
    NSLog(@"Error: %@ - Failed to unarchive request data with error: %@", v11, v12);

    id v10 = 0LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _compatibleRequestWithDictionary:v7]);
  }

  return (DebugHierarchyRequest *)v10;
}

+ (id)_compatibleRequestWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DBGHierarchyRequestPredicate"]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _requestWithV1RequestDictionary:v4]);

    [v6 setNeedsCompatibilityConversion:1];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithDictionary:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithDictionary:",  v4));
  }

  return v6;
}

+ (id)_requestWithV1RequestDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DBGHierarchyRequestPredicate"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"objectIdentifiers"]);
  id v6 = [v5 count];
  float v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v6)
  {
    uint64_t v8 = (DebugHierarchyPropertyAction *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"propertyDescriptions"]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = __77__DebugHierarchyRequest_TargetHubAdditions___requestWithV1RequestDictionary___block_invoke;
    v19[3] = &unk_20810;
    id v20 = v7;
    -[DebugHierarchyPropertyAction enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v19);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"includeLazyValues"]);
    unsigned __int8 v10 = [v9 BOOLValue];

    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
    -[DebugHierarchyPropertyAction setObjectIdentifiers:exlusive:]( v8,  "setObjectIdentifiers:exlusive:",  &__NSArray0__struct,  1LL);
    if ((v10 & 1) == 0) {
      -[DebugHierarchyPropertyAction setOptions:comparisonStyle:](v8, "setOptions:comparisonStyle:", 1LL, 3LL);
    }
    [v7 addObject:v8];
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DBGHierarchyRequestSpinRunloop"]);
  unsigned int v12 = [v11 BOOLValue];

  if (v12)
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyRunLoopAction);
    [v7 addObject:v13];
  }

  if (v6) {
    uint64_t v14 = 2LL;
  }
  else {
    uint64_t v14 = 1LL;
  }
  float v15 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithDiscoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithDiscoveryType:actions:completion:",  v14,  v7,  &__block_literal_global_0));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DBGHierarchyRequestIdentifier"]);
  [v15 setIdentifier:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DBGHierarchyRequestName"]);
  [v15 setName:v17];

  return v15;
}

void __77__DebugHierarchyRequest_TargetHubAdditions___requestWithV1RequestDictionary___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  float v7 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  id v22 = v5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  -[DebugHierarchyPropertyAction setObjectIdentifiers:exlusive:](v7, "setObjectIdentifiers:exlusive:", v8, 0LL);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        float v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)v14),  "objectForKeyedSubscript:",  @"propertyName",  (void)v17));
        if ([v15 length]) {
          [v9 addObject:v15];
        }

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  id v16 = [v9 copy];
  -[DebugHierarchyPropertyAction setPropertyNames:exlusive:](v7, "setPropertyNames:exlusive:", v16, 0LL);

  -[DebugHierarchyPropertyAction setOptions:comparisonStyle:](v7, "setOptions:comparisonStyle:", 0LL, 0LL);
  [*(id *)(a1 + 32) addObject:v7];
}

@end