@interface MADAutoAssetEliminate
+ (BOOL)supportsSecureCoding;
- (BOOL)awaitingCancelActivityAck;
- (BOOL)awaitingSchedulerAck;
- (BOOL)awaitingStagerAck;
- (BOOL)awaitingUnlocked;
- (BOOL)eliminatingSet;
- (BOOL)limitedToCancelActivity;
- (MAAutoAssetSelector)assetSelector;
- (MADAutoAssetClientRequest)clientRequest;
- (MADAutoAssetEliminate)initWithAssetSelector:(id)a3;
- (MADAutoAssetEliminate)initWithClientRequest:(id)a3;
- (MADAutoAssetEliminate)initWithClientRequest:(id)a3 withAssetSelector:(id)a4 forClientDomain:(id)a5 forSetIdentifier:(id)a6 withDownloadedSetDescriptors:(id)a7 awaitingUnlocked:(BOOL)a8;
- (MADAutoAssetEliminate)initWithCoder:(id)a3;
- (NSMutableArray)downloadedSetDescriptors;
- (NSMutableDictionary)activeJobsByUUID;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (id)summary;
- (int)awaitingSecureOperations;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveJobsByUUID:(id)a3;
- (void)setAwaitingCancelActivityAck:(BOOL)a3;
- (void)setAwaitingSchedulerAck:(BOOL)a3;
- (void)setAwaitingSecureOperations:(int)a3;
- (void)setAwaitingStagerAck:(BOOL)a3;
- (void)setAwaitingUnlocked:(BOOL)a3;
- (void)setDownloadedSetDescriptors:(id)a3;
- (void)setEliminatingSet:(BOOL)a3;
- (void)setLimitedToCancelActivity:(BOOL)a3;
@end

@implementation MADAutoAssetEliminate

- (MADAutoAssetEliminate)initWithClientRequest:(id)a3
{
  return -[MADAutoAssetEliminate initWithClientRequest:withAssetSelector:forClientDomain:forSetIdentifier:withDownloadedSetDescriptors:awaitingUnlocked:]( self,  "initWithClientRequest:withAssetSelector:forClientDomain:forSetIdentifier:withDownloadedSetDescriptors:awaitingUnlocked:",  a3,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetEliminate)initWithAssetSelector:(id)a3
{
  return -[MADAutoAssetEliminate initWithClientRequest:withAssetSelector:forClientDomain:forSetIdentifier:withDownloadedSetDescriptors:awaitingUnlocked:]( self,  "initWithClientRequest:withAssetSelector:forClientDomain:forSetIdentifier:withDownloadedSetDescriptors:awaitingUnlocked:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL);
}

- (MADAutoAssetEliminate)initWithClientRequest:(id)a3 withAssetSelector:(id)a4 forClientDomain:(id)a5 forSetIdentifier:(id)a6 withDownloadedSetDescriptors:(id)a7 awaitingUnlocked:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  v54 = (const __CFString *)a5;
  v55 = (__CFString *)a6;
  id v17 = a7;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___MADAutoAssetEliminate;
  v18 = -[MADAutoAssetEliminate init](&v56, "init");
  v19 = v18;
  if (!v18) {
    goto LABEL_27;
  }
  objc_storeStrong((id *)&v18->_clientRequest, a3);
  p_assetSelector = (id *)&v19->_assetSelector;
  objc_storeStrong((id *)&v19->_assetSelector, a4);
  objc_storeStrong((id *)&v19->_clientDomainName, a5);
  objc_storeStrong((id *)&v19->_assetSetIdentifier, a6);
  v21 = (__CFString *)v54;
  if (v54) {
    BOOL v22 = v55 == 0LL;
  }
  else {
    BOOL v22 = 1;
  }
  char v23 = !v22;
  v19->_eliminatingSet = v23;
  objc_storeStrong((id *)&v19->_downloadedSetDescriptors, a7);
  v19->_awaitingUnlocked = a8;
  if (!v19->_eliminatingSet)
  {
    v24 = v15;
    if (!v15)
    {
LABEL_24:
      if (!*p_assetSelector
        || (v44 = (void *)objc_claimAutoreleasedReturnValue([*p_assetSelector assetType]),
            v44,
            !v44))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 oslog]);

        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          if (v24) {
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v24 summary]);
          }
          else {
            v27 = @"N";
          }
          if (v16) {
            v52 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 summary]);
          }
          else {
            v52 = @"N";
          }
          *(_DWORD *)buf = 138543618;
          v58 = v27;
          __int16 v59 = 2114;
          v60 = v52;
          _os_log_error_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "{AUTO-ELIMINATE:initWithClientRequest} invalid asset-selector | clientRequest:%{public}@, fullAssetSelector:%{public}@",  buf,  0x16u);
          if (v16) {

          }
          goto LABEL_45;
        }

- (MADAutoAssetEliminate)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MADAutoAssetEliminate;
  v5 = -[MADAutoAssetEliminate init](&v29, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoAssetClientRequest) forKey:@"clientRequest"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientRequest = v5->_clientRequest;
    v5->_clientRequest = (MADAutoAssetClientRequest *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"assetSelector"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v16;

    v5->_eliminatingSet = [v4 decodeBoolForKey:@"eliminatingSet"];
    v18 = objc_alloc(&OBJC_CLASS___NSSet);
    v31[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v31[1] = objc_opt_class(&OBJC_CLASS___MADAutoSetDescriptor);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
    v20 = -[NSSet initWithArray:](v18, "initWithArray:", v19);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"downloadedSetDescriptors"]);
    downloadedSetDescriptors = v5->_downloadedSetDescriptors;
    v5->_downloadedSetDescriptors = (NSMutableArray *)v21;

    v5->_awaitingUnlocked = [v4 decodeBoolForKey:@"awaitingUnlocked"];
    v5->_awaitingSchedulerAck = [v4 decodeBoolForKey:@"awaitingSchedulerAck"];
    v5->_awaitingCancelActivityAck = [v4 decodeBoolForKey:@"awaitingCancelActivityAck"];
    v5->_awaitingStagerAck = [v4 decodeBoolForKey:@"awaitingStagerAck"];
    v5->_awaitingSecureOperations = [v4 decodeIntegerForKey:@"awaitingSecureOperations"];
    char v23 = objc_alloc(&OBJC_CLASS___NSSet);
    v30[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v30[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
    v25 = -[NSSet initWithArray:](v23, "initWithArray:", v24);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v25 forKey:@"activeJobsByUUID"]);
    activeJobsByUUID = v5->_activeJobsByUUID;
    v5->_activeJobsByUUID = (NSMutableDictionary *)v26;

    v5->_limitedToCancelActivity = [v4 decodeBoolForKey:@"limitedToCancelActivity"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate clientRequest](self, "clientRequest"));
  [v10 encodeObject:v4 forKey:@"clientRequest"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate assetSelector](self, "assetSelector"));
  [v10 encodeObject:v5 forKey:@"assetSelector"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate clientDomainName](self, "clientDomainName"));
  [v10 encodeObject:v6 forKey:@"clientDomainName"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate assetSetIdentifier](self, "assetSetIdentifier"));
  [v10 encodeObject:v7 forKey:@"assetSetIdentifier"];

  objc_msgSend( v10,  "encodeBool:forKey:",  -[MADAutoAssetEliminate eliminatingSet](self, "eliminatingSet"),  @"eliminatingSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate downloadedSetDescriptors](self, "downloadedSetDescriptors"));
  [v10 encodeObject:v8 forKey:@"downloadedSetDescriptors"];

  objc_msgSend( v10,  "encodeBool:forKey:",  -[MADAutoAssetEliminate awaitingUnlocked](self, "awaitingUnlocked"),  @"awaitingUnlocked");
  objc_msgSend( v10,  "encodeBool:forKey:",  -[MADAutoAssetEliminate awaitingSchedulerAck](self, "awaitingSchedulerAck"),  @"awaitingSchedulerAck");
  objc_msgSend( v10,  "encodeBool:forKey:",  -[MADAutoAssetEliminate awaitingCancelActivityAck](self, "awaitingCancelActivityAck"),  @"awaitingCancelActivityAck");
  objc_msgSend( v10,  "encodeBool:forKey:",  -[MADAutoAssetEliminate awaitingStagerAck](self, "awaitingStagerAck"),  @"awaitingStagerAck");
  objc_msgSend( v10,  "encodeInteger:forKey:",  -[MADAutoAssetEliminate awaitingSecureOperations](self, "awaitingSecureOperations"),  @"awaitingSecureOperations");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate activeJobsByUUID](self, "activeJobsByUUID"));
  [v10 encodeObject:v9 forKey:@"activeJobsByUUID"];

  objc_msgSend( v10,  "encodeBool:forKey:",  -[MADAutoAssetEliminate limitedToCancelActivity](self, "limitedToCancelActivity"),  @"limitedToCancelActivity");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  unsigned int v4 = -[MADAutoAssetEliminate eliminatingSet](self, "eliminatingSet");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate clientRequest](self, "clientRequest"));
  v39 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate clientRequest](self, "clientRequest"));
      v37 = (const __CFString *)objc_claimAutoreleasedReturnValue([v36 summary]);
    }

    else
    {
      v37 = @"N";
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate clientDomainName](self, "clientDomainName"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate assetSetIdentifier](self, "assetSetIdentifier"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate downloadedSetDescriptors](self, "downloadedSetDescriptors"));
    id v29 = [v30 count];
    if (-[MADAutoAssetEliminate awaitingUnlocked](self, "awaitingUnlocked")) {
      id v6 = @"Y";
    }
    else {
      id v6 = @"N";
    }
    v28 = v6;
    if (-[MADAutoAssetEliminate awaitingSchedulerAck](self, "awaitingSchedulerAck")) {
      uint64_t v7 = @"Y";
    }
    else {
      uint64_t v7 = @"N";
    }
    v27 = v7;
    if (-[MADAutoAssetEliminate awaitingCancelActivityAck](self, "awaitingCancelActivityAck")) {
      v8 = @"Y";
    }
    else {
      v8 = @"N";
    }
    if (-[MADAutoAssetEliminate awaitingStagerAck](self, "awaitingStagerAck")) {
      id v9 = @"Y";
    }
    else {
      id v9 = @"N";
    }
    uint64_t v10 = -[MADAutoAssetEliminate awaitingSecureOperations](self, "awaitingSecureOperations");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate activeJobsByUUID](self, "activeJobsByUUID"));
    id v12 = [v11 count];
    if (v12)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate activeJobsByUUID](self, "activeJobsByUUID"));
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 safeSummary]);
    }

    else
    {
      uint64_t v13 = @"N";
    }

    if (-[MADAutoAssetEliminate limitedToCancelActivity](self, "limitedToCancelActivity")) {
      BOOL v22 = @"Y";
    }
    else {
      BOOL v22 = @"N";
    }
    char v23 = (__CFString *)v37;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientRequest:%@|clientDomain:%@|setIdentifier:%@|downloadedSetDescriptors:%ld|awaitingUnlocked:%@|awaitingSchedulerAck:%@|awaitingCancelActivityAck:%@|awaitingStagerAck:%@|awaitingSecureOperations:%d|activeJobsByUUID:%@|limitedToCancelActivity:%@]",  v37,  v34,  v32,  v29,  v28,  v27,  v8,  v9,  v10,  v13,  v22));
    if (v12)
    {
    }
  }

  else
  {
    if (v5)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate clientRequest](self, "clientRequest"));
      id v38 = (const __CFString *)objc_claimAutoreleasedReturnValue([v36 summary]);
    }

    else
    {
      id v38 = @"N";
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate assetSelector](self, "assetSelector"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
    if (-[MADAutoAssetEliminate awaitingSchedulerAck](self, "awaitingSchedulerAck")) {
      id v15 = @"Y";
    }
    else {
      id v15 = @"N";
    }
    v33 = v15;
    if (-[MADAutoAssetEliminate awaitingCancelActivityAck](self, "awaitingCancelActivityAck")) {
      uint64_t v16 = @"Y";
    }
    else {
      uint64_t v16 = @"N";
    }
    v31 = v16;
    if (-[MADAutoAssetEliminate awaitingStagerAck](self, "awaitingStagerAck")) {
      id v17 = @"Y";
    }
    else {
      id v17 = @"N";
    }
    uint64_t v18 = -[MADAutoAssetEliminate awaitingSecureOperations](self, "awaitingSecureOperations");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate activeJobsByUUID](self, "activeJobsByUUID"));
    id v20 = [v19 count];
    if (v20)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetEliminate activeJobsByUUID](self, "activeJobsByUUID"));
      uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 safeSummary]);
    }

    else
    {
      uint64_t v21 = @"N";
    }

    if (-[MADAutoAssetEliminate limitedToCancelActivity](self, "limitedToCancelActivity")) {
      v25 = @"Y";
    }
    else {
      v25 = @"N";
    }
    char v23 = (__CFString *)v38;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientRequest:%@|assetSelector:%@|awaitingSchedulerAck:%@|awaitingCancelActivityAck:%@|awaitingStagerAck:%@|awaitingSecureOperations:%d|activeJobsByUUID:%@|limitedToCancelActivity:%@]",  v38,  v14,  v33,  v31,  v17,  v18,  v21,  v25));
    if (v20)
    {
    }
  }

  if (v39)
  {
  }

  return v24;
}

- (MADAutoAssetClientRequest)clientRequest
{
  return self->_clientRequest;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (BOOL)eliminatingSet
{
  return self->_eliminatingSet;
}

- (void)setEliminatingSet:(BOOL)a3
{
  self->_eliminatingSet = a3;
}

- (NSMutableArray)downloadedSetDescriptors
{
  return self->_downloadedSetDescriptors;
}

- (void)setDownloadedSetDescriptors:(id)a3
{
}

- (BOOL)awaitingUnlocked
{
  return self->_awaitingUnlocked;
}

- (void)setAwaitingUnlocked:(BOOL)a3
{
  self->_awaitingUnlocked = a3;
}

- (BOOL)awaitingSchedulerAck
{
  return self->_awaitingSchedulerAck;
}

- (void)setAwaitingSchedulerAck:(BOOL)a3
{
  self->_awaitingSchedulerAck = a3;
}

- (BOOL)awaitingCancelActivityAck
{
  return self->_awaitingCancelActivityAck;
}

- (void)setAwaitingCancelActivityAck:(BOOL)a3
{
  self->_awaitingCancelActivityAck = a3;
}

- (BOOL)awaitingStagerAck
{
  return self->_awaitingStagerAck;
}

- (void)setAwaitingStagerAck:(BOOL)a3
{
  self->_awaitingStagerAck = a3;
}

- (int)awaitingSecureOperations
{
  return self->_awaitingSecureOperations;
}

- (void)setAwaitingSecureOperations:(int)a3
{
  self->_awaitingSecureOperations = a3;
}

- (NSMutableDictionary)activeJobsByUUID
{
  return self->_activeJobsByUUID;
}

- (void)setActiveJobsByUUID:(id)a3
{
}

- (BOOL)limitedToCancelActivity
{
  return self->_limitedToCancelActivity;
}

- (void)setLimitedToCancelActivity:(BOOL)a3
{
  self->_limitedToCancelActivity = a3;
}

- (void).cxx_destruct
{
}

@end