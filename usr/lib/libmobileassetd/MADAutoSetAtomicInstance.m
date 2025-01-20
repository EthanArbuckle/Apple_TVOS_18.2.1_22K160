@interface MADAutoSetAtomicInstance
+ (BOOL)supportsSecureCoding;
- (BOOL)allContentDownloaded;
- (BOOL)awaitingLastReferenceAltered;
- (BOOL)awaitingLastReferenceNewerFound;
- (BOOL)catalogLookupNewerAvailable;
- (BOOL)lockedSupportingShortTermLocking;
- (MADAutoSetAtomicInstance)initWithCoder:(id)a3;
- (NSArray)instanceEntries;
- (NSDate)instanceCreationDate;
- (NSString)activeSetJobUUID;
- (NSString)assetSetIdentifier;
- (NSString)atomicInstanceUUID;
- (NSString)autoAssetSetClientName;
- (NSString)clientDomainName;
- (NSString)subAtomicFromAtomicInstanceUUID;
- (id)description;
- (id)initForClientDomainName:(id)a3 forSetClientName:(id)a4 forAssetSetIdentifier:(id)a5 withAtomicInstanceUUID:(id)a6 asSubAtomicFrom:(id)a7 originallyCreatedOnDate:(id)a8 withCreationIndex:(int64_t)a9 representingInstanceEntries:(id)a10 inUseBySetJob:(id)a11;
- (id)newSummaryWithoutEntryID;
- (id)summary;
- (int64_t)instanceCreationIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveSetJobUUID:(id)a3;
- (void)setAllContentDownloaded:(BOOL)a3;
- (void)setAwaitingLastReferenceAltered:(BOOL)a3;
- (void)setAwaitingLastReferenceNewerFound:(BOOL)a3;
- (void)setCatalogLookupNewerAvailable:(BOOL)a3;
- (void)setInstanceCreationDate:(id)a3;
- (void)setInstanceCreationIndex:(int64_t)a3;
- (void)setInstanceEntries:(id)a3;
- (void)setLockedSupportingShortTermLocking:(BOOL)a3;
@end

@implementation MADAutoSetAtomicInstance

- (id)initForClientDomainName:(id)a3 forSetClientName:(id)a4 forAssetSetIdentifier:(id)a5 withAtomicInstanceUUID:(id)a6 asSubAtomicFrom:(id)a7 originallyCreatedOnDate:(id)a8 withCreationIndex:(int64_t)a9 representingInstanceEntries:(id)a10 inUseBySetJob:(id)a11
{
  id v18 = a3;
  id obj = a4;
  id v19 = a4;
  id v29 = a5;
  id v20 = a5;
  id v30 = a6;
  id v21 = a6;
  id v31 = a7;
  id v32 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___MADAutoSetAtomicInstance;
  v25 = -[MADAutoSetAtomicInstance init](&v33, "init");
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_clientDomainName, a3);
    objc_storeStrong((id *)&v26->_autoAssetSetClientName, obj);
    objc_storeStrong((id *)&v26->_assetSetIdentifier, v29);
    objc_storeStrong((id *)&v26->_atomicInstanceUUID, v30);
    objc_storeStrong((id *)&v26->_subAtomicFromAtomicInstanceUUID, v31);
    objc_storeStrong((id *)&v26->_instanceCreationDate, a8);
    v26->_instanceCreationIndex = a9;
    objc_storeStrong((id *)&v26->_instanceEntries, a10);
    objc_storeStrong((id *)&v26->_activeSetJobUUID, a11);
    v26->_awaitingLastReferenceAltered = 0;
    *(_DWORD *)&v26->_catalogLookupNewerAvailable = 0;
  }

  return v26;
}

- (MADAutoSetAtomicInstance)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___MADAutoSetAtomicInstance;
  v5 = -[MADAutoSetAtomicInstance init](&v32, "init");
  if (v5)
  {
    v33[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v33[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v33[2] = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
    v33[3] = objc_opt_class(&OBJC_CLASS___NSString);
    v33[4] = objc_opt_class(&OBJC_CLASS___NSData);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 5LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"autoAssetSetClientName"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    autoAssetSetClientName = v5->_autoAssetSetClientName;
    v5->_autoAssetSetClientName = (NSString *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v15;

    id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"atomicInstanceUUID"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    atomicInstanceUUID = v5->_atomicInstanceUUID;
    v5->_atomicInstanceUUID = (NSString *)v18;

    id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"subAtomicFromAtomicInstanceUUID"];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    subAtomicFromAtomicInstanceUUID = v5->_subAtomicFromAtomicInstanceUUID;
    v5->_subAtomicFromAtomicInstanceUUID = (NSString *)v21;

    id v23 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"instanceCreationDate"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    instanceCreationDate = v5->_instanceCreationDate;
    v5->_instanceCreationDate = (NSDate *)v24;

    v5->_instanceCreationIndex = (int64_t)[v4 decodeIntegerForKey:@"instanceCreationIndex"];
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"instanceEntries"]);
    instanceEntries = v5->_instanceEntries;
    v5->_instanceEntries = (NSArray *)v26;

    id v28 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"activeSetJobUUID"];
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    activeSetJobUUID = v5->_activeSetJobUUID;
    v5->_activeSetJobUUID = (NSString *)v29;

    v5->_catalogLookupNewerAvailable = [v4 decodeBoolForKey:@"catalogLookupNewerAvailable"];
    v5->_allContentDownloaded = [v4 decodeBoolForKey:@"allContentDownloaded"];
    v5->_lockedSupportingShortTermLocking = [v4 decodeBoolForKey:@"lockedSupportingShortTermLocking"];
    v5->_awaitingLastReferenceNewerFound = [v4 decodeBoolForKey:@"awaitingLastReferenceNewerFound"];
    v5->_awaitingLastReferenceAltered = [v4 decodeBoolForKey:@"awaitingLastReferenceAltered"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance clientDomainName](self, "clientDomainName"));
  [v12 encodeObject:v4 forKey:@"clientDomainName"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance autoAssetSetClientName](self, "autoAssetSetClientName"));
  [v12 encodeObject:v5 forKey:@"autoAssetSetClientName"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance assetSetIdentifier](self, "assetSetIdentifier"));
  [v12 encodeObject:v6 forKey:@"assetSetIdentifier"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance atomicInstanceUUID](self, "atomicInstanceUUID"));
  [v12 encodeObject:v7 forKey:@"atomicInstanceUUID"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance subAtomicFromAtomicInstanceUUID](self, "subAtomicFromAtomicInstanceUUID"));
  [v12 encodeObject:v8 forKey:@"subAtomicFromAtomicInstanceUUID"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance instanceCreationDate](self, "instanceCreationDate"));
  [v12 encodeObject:v9 forKey:@"instanceCreationDate"];

  objc_msgSend( v12,  "encodeInteger:forKey:",  -[MADAutoSetAtomicInstance instanceCreationIndex](self, "instanceCreationIndex"),  @"instanceCreationIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance instanceEntries](self, "instanceEntries"));
  [v12 encodeObject:v10 forKey:@"instanceEntries"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance activeSetJobUUID](self, "activeSetJobUUID"));
  [v12 encodeObject:v11 forKey:@"activeSetJobUUID"];

  objc_msgSend( v12,  "encodeBool:forKey:",  -[MADAutoSetAtomicInstance catalogLookupNewerAvailable](self, "catalogLookupNewerAvailable"),  @"catalogLookupNewerAvailable");
  objc_msgSend( v12,  "encodeBool:forKey:",  -[MADAutoSetAtomicInstance allContentDownloaded](self, "allContentDownloaded"),  @"allContentDownloaded");
  objc_msgSend( v12,  "encodeBool:forKey:",  -[MADAutoSetAtomicInstance lockedSupportingShortTermLocking](self, "lockedSupportingShortTermLocking"),  @"lockedSupportingShortTermLocking");
  objc_msgSend( v12,  "encodeBool:forKey:",  -[MADAutoSetAtomicInstance awaitingLastReferenceNewerFound](self, "awaitingLastReferenceNewerFound"),  @"awaitingLastReferenceNewerFound");
  objc_msgSend( v12,  "encodeBool:forKey:",  -[MADAutoSetAtomicInstance awaitingLastReferenceAltered](self, "awaitingLastReferenceAltered"),  @"awaitingLastReferenceAltered");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance instanceEntries](self, "instanceEntries"));
  id v4 = [v3 count];

  if (v4)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance instanceEntries](self, "instanceEntries"));
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = @"[\n";
      do
      {
        v10 = 0LL;
        id v11 = v9;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v10);
          v13 = objc_alloc(&OBJC_CLASS___NSString);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
          uint64_t v9 = -[NSString initWithFormat:](v13, "initWithFormat:", @"%@%@\n", v11, v14);

          v10 = (char *)v10 + 1;
          id v11 = v9;
        }

        while (v7 != v10);
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v7);
    }

    else
    {
      uint64_t v9 = @"[\n";
    }

    uint64_t v15 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@]", v9);
  }

  else
  {
    uint64_t v15 = @"[EMPTY]";
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance summary](self, "summary"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@instanceEntries:%@",  v16,  v15));

  return v17;
}

- (id)summary
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance clientDomainName](self, "clientDomainName"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance autoAssetSetClientName](self, "autoAssetSetClientName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance assetSetIdentifier](self, "assetSetIdentifier"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance atomicInstanceUUID](self, "atomicInstanceUUID"));
  v25 = (void *)v3;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance subAtomicFromAtomicInstanceUUID](self, "subAtomicFromAtomicInstanceUUID"));
  if (v22) {
    __int128 v21 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetAtomicInstance subAtomicFromAtomicInstanceUUID]( self,  "subAtomicFromAtomicInstanceUUID"));
  }
  else {
    __int128 v21 = @"N";
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance instanceCreationDate](self, "instanceCreationDate"));
  int64_t v19 = -[MADAutoSetAtomicInstance instanceCreationIndex](self, "instanceCreationIndex");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance instanceEntries](self, "instanceEntries"));
  id v18 = [v8 count];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance activeSetJobUUID](self, "activeSetJobUUID"));
  uint64_t v24 = (void *)v4;
  id v23 = (void *)v6;
  __int128 v20 = (void *)v7;
  if (v9) {
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance activeSetJobUUID](self, "activeSetJobUUID"));
  }
  else {
    v10 = @"N";
  }
  if (-[MADAutoSetAtomicInstance catalogLookupNewerAvailable](self, "catalogLookupNewerAvailable")) {
    id v11 = @"Y";
  }
  else {
    id v11 = @"N";
  }
  if (-[MADAutoSetAtomicInstance allContentDownloaded](self, "allContentDownloaded")) {
    id v12 = @"Y";
  }
  else {
    id v12 = @"N";
  }
  if (-[MADAutoSetAtomicInstance lockedSupportingShortTermLocking](self, "lockedSupportingShortTermLocking")) {
    v13 = @"Y";
  }
  else {
    v13 = @"N";
  }
  if (-[MADAutoSetAtomicInstance awaitingLastReferenceNewerFound](self, "awaitingLastReferenceNewerFound")) {
    id v14 = @"Y";
  }
  else {
    id v14 = @"N";
  }
  if (-[MADAutoSetAtomicInstance awaitingLastReferenceAltered](self, "awaitingLastReferenceAltered")) {
    uint64_t v15 = @"Y";
  }
  else {
    uint64_t v15 = @"N";
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[(client)Domain:%@,Name:%@|(set)Identifier:%@,UUID:%@,Sub:%@|(creation)Date:%@,Index:%ld|entries:%ld|setJob:%@|(status)newerAvailable:%@,allDownloaded:%@|shortTerm:%@|(awiating)NewerFound:%@,Altered:%@]",  v25,  v24,  v5,  v23,  v21,  v20,  v19,  v18,  v10,  v11,  v12,  v13,  v14,  v15));
  if (v9) {

  }
  if (v22) {
  return v16;
  }
}

- (id)newSummaryWithoutEntryID
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance autoAssetSetClientName](self, "autoAssetSetClientName"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance subAtomicFromAtomicInstanceUUID](self, "subAtomicFromAtomicInstanceUUID"));
  if (v4) {
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetAtomicInstance subAtomicFromAtomicInstanceUUID]( self,  "subAtomicFromAtomicInstanceUUID"));
  }
  else {
    id v18 = @"N";
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance instanceCreationDate](self, "instanceCreationDate"));
  int64_t v16 = -[MADAutoSetAtomicInstance instanceCreationIndex](self, "instanceCreationIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance instanceEntries](self, "instanceEntries"));
  id v15 = [v5 count];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance activeSetJobUUID](self, "activeSetJobUUID"));
  int64_t v19 = (void *)v4;
  if (v6) {
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetAtomicInstance activeSetJobUUID](self, "activeSetJobUUID"));
  }
  else {
    uint64_t v7 = @"N";
  }
  if (-[MADAutoSetAtomicInstance catalogLookupNewerAvailable](self, "catalogLookupNewerAvailable")) {
    uint64_t v8 = @"Y";
  }
  else {
    uint64_t v8 = @"N";
  }
  if (-[MADAutoSetAtomicInstance allContentDownloaded](self, "allContentDownloaded")) {
    uint64_t v9 = @"Y";
  }
  else {
    uint64_t v9 = @"N";
  }
  if (-[MADAutoSetAtomicInstance lockedSupportingShortTermLocking](self, "lockedSupportingShortTermLocking")) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  if (-[MADAutoSetAtomicInstance awaitingLastReferenceNewerFound](self, "awaitingLastReferenceNewerFound")) {
    id v11 = @"Y";
  }
  else {
    id v11 = @"N";
  }
  if (-[MADAutoSetAtomicInstance awaitingLastReferenceAltered](self, "awaitingLastReferenceAltered")) {
    id v12 = @"Y";
  }
  else {
    id v12 = @"N";
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientName:%@|SubAtomic:%@|(creation)Date:%@,Index:%ld|entries:%ld|setJob:%@|(status)newerAvailable:%@,allDownloaded:%@|shortTerm:%@|(awiating)NewerFound:%@,Altered:%@]",  v3,  v18,  v17,  v16,  v15,  v7,  v8,  v9,  v10,  v11,  v12));
  if (v6) {

  }
  if (v19) {
  return v13;
  }
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)autoAssetSetClientName
{
  return self->_autoAssetSetClientName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (NSString)atomicInstanceUUID
{
  return self->_atomicInstanceUUID;
}

- (NSString)subAtomicFromAtomicInstanceUUID
{
  return self->_subAtomicFromAtomicInstanceUUID;
}

- (NSDate)instanceCreationDate
{
  return self->_instanceCreationDate;
}

- (void)setInstanceCreationDate:(id)a3
{
}

- (int64_t)instanceCreationIndex
{
  return self->_instanceCreationIndex;
}

- (void)setInstanceCreationIndex:(int64_t)a3
{
  self->_instanceCreationIndex = a3;
}

- (NSArray)instanceEntries
{
  return self->_instanceEntries;
}

- (void)setInstanceEntries:(id)a3
{
}

- (NSString)activeSetJobUUID
{
  return self->_activeSetJobUUID;
}

- (void)setActiveSetJobUUID:(id)a3
{
}

- (BOOL)catalogLookupNewerAvailable
{
  return self->_catalogLookupNewerAvailable;
}

- (void)setCatalogLookupNewerAvailable:(BOOL)a3
{
  self->_catalogLookupNewerAvailable = a3;
}

- (BOOL)allContentDownloaded
{
  return self->_allContentDownloaded;
}

- (void)setAllContentDownloaded:(BOOL)a3
{
  self->_allContentDownloaded = a3;
}

- (BOOL)lockedSupportingShortTermLocking
{
  return self->_lockedSupportingShortTermLocking;
}

- (void)setLockedSupportingShortTermLocking:(BOOL)a3
{
  self->_lockedSupportingShortTermLocking = a3;
}

- (BOOL)awaitingLastReferenceNewerFound
{
  return self->_awaitingLastReferenceNewerFound;
}

- (void)setAwaitingLastReferenceNewerFound:(BOOL)a3
{
  self->_awaitingLastReferenceNewerFound = a3;
}

- (BOOL)awaitingLastReferenceAltered
{
  return self->_awaitingLastReferenceAltered;
}

- (void)setAwaitingLastReferenceAltered:(BOOL)a3
{
  self->_awaitingLastReferenceAltered = a3;
}

- (void).cxx_destruct
{
}

@end