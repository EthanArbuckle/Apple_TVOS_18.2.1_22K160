@interface MAAutoAssetSetInstanceDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)newMaxColumnStrings;
+ (id)paddedBanner:(id)a3;
+ (id)paddedHeader:(id)a3;
+ (id)paddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (BOOL)downloadUserInitiated;
- (BOOL)isFullyDownloaded;
- (BOOL)neverBeenLocked;
- (BOOL)stagedPriorToAvailable;
- (MAAutoAssetSetInstanceDescriptor)initWithCoder:(id)a3;
- (NSArray)atomicInstanceEntries;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (id)description;
- (id)description:(BOOL)a3;
- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstanceEntries:(id)a5 withFullyDownloaded:(BOOL)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withStagedPriorToAvailable:(BOOL)a11;
- (id)padded:(id)a3;
- (id)summary;
- (int64_t)downloadedFilesystemBytes;
- (int64_t)downloadedNetworkBytes;
- (void)buildMaxColumnStrings:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInstanceDescriptor

- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstanceEntries:(id)a5 withFullyDownloaded:(BOOL)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withStagedPriorToAvailable:(BOOL)a11
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInstanceDescriptor;
  v21 = -[MAAutoAssetSetInstanceDescriptor init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_clientDomainName, a3);
    objc_storeStrong((id *)&v22->_assetSetIdentifier, a4);
    objc_storeStrong((id *)&v22->_atomicInstanceEntries, a5);
    v22->_isFullyDownloaded = a6;
    v22->_neverBeenLocked = a7;
    v22->_downloadUserInitiated = a8;
    v22->_downloadedNetworkBytes = a9;
    v22->_downloadedFilesystemBytes = a10;
    v22->_stagedPriorToAvailable = a11;
  }

  return v22;
}

- (MAAutoAssetSetInstanceDescriptor)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInstanceDescriptor;
  v5 = -[MAAutoAssetSetInstanceDescriptor init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v17 count:2];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setWithArray:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"atomicInstanceEntries"];
    atomicInstanceEntries = v5->_atomicInstanceEntries;
    v5->_atomicInstanceEntries = (NSArray *)v13;

    v5->_isFullyDownloaded = [v4 decodeBoolForKey:@"isFullyDownloaded"];
    v5->_neverBeenLocked = [v4 decodeBoolForKey:@"neverBeenLocked"];
    v5->_downloadUserInitiated = [v4 decodeBoolForKey:@"downloadUserInitiated"];
    v5->_downloadedNetworkBytes = [v4 decodeIntegerForKey:@"downloadedNetworkBytes"];
    v5->_downloadedFilesystemBytes = [v4 decodeIntegerForKey:@"downloadedFilesystemBytes"];
    v5->_stagedPriorToAvailable = [v4 decodeBoolForKey:@"stagedPriorToAvailable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v4 forKey:@"clientDomainName"];
  v5 = -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  [v7 encodeObject:v5 forKey:@"assetSetIdentifier"];
  v6 = -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  [v7 encodeObject:v6 forKey:@"atomicInstanceEntries"];

  objc_msgSend( v7,  "encodeBool:forKey:",  -[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded"),  @"isFullyDownloaded");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked"),  @"neverBeenLocked");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated"),  @"downloadUserInitiated");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"),  @"downloadedNetworkBytes");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"),  @"downloadedFilesystemBytes");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"),  @"stagedPriorToAvailable");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return -[MAAutoAssetSetInstanceDescriptor description:](self, "description:", 0LL);
}

- (id)description:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  v6 = v5;
  if (v3)
  {
    [v5 description];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v7 = [v5 count];

    else {
      v8 = @"entry";
    }
    id v20 = (void *)[objc_alloc(NSString) initWithFormat:@"%d %@", v7, v8];
  }

  id v19 = (void *)NSString;
  -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  if (-[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded")) {
    uint64_t v11 = @"Y";
  }
  else {
    uint64_t v11 = @"N";
  }
  if (-[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked")) {
    v12 = @"Y";
  }
  else {
    v12 = @"N";
  }
  if (-[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  int64_t v14 = -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes");
  int64_t v15 = -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  if (-[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
    objc_super v16 = @"Y";
  }
  else {
    objc_super v16 = @"N";
  }
  [v19 stringWithFormat:@">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n           atomicInstanceEntries: %@\n                 fullyDownloaded: %@\n                 neverBeenLocked: %@\n                   userInitiated: %@\n          downloadedNetworkBytes: %ld\n       downloadedFilesystemBytes: %ld\n          stagedPriorToAvailable: %@\n<<<]", v9, v10, v20, v11, v12, v13, v14, v15, v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)summary
{
  int64_t v15 = (void *)NSString;
  -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v4 count];
  if (-[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded")) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  if (-[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked")) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if (-[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
    uint64_t v7 = @"Y";
  }
  else {
    uint64_t v7 = @"N";
  }
  int64_t v8 = -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes");
  int64_t v9 = -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  if (-[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  [v15 stringWithFormat:@"[clientDomainName:%@, assetSetIdentifier:%@, numAtomicInstanceEntries:%ld, fullyDownloaded:%@, neverBeenLocked:%@, userInitiated:%@, networkBytes:%ld, fsBytes:%ld, stagedPrior:%@]", v14, v3, v13, v5, v6, v7, v8, v9, v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)buildMaxColumnStrings:(id)a3
{
  id v45 = a3;
  -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  v6 = -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  [v6 description];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded")) {
    int64_t v8 = @"YES";
  }
  else {
    int64_t v8 = @"NO";
  }
  int64_t v9 = v8;
  if (-[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked")) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v43 = v10;
  if (-[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  v44 = v11;
  v12 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"));
  uint64_t v13 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"));
  if (-[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
    int64_t v14 = @"YES";
  }
  else {
    int64_t v14 = @"NO";
  }
  int64_t v15 = v14;
  unint64_t v16 = [v4 length];
  [v45 safeStringForKey:@"clientDomainName"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v18 = [v17 length];

  if (v16 > v18) {
    [v45 setSafeObject:v4 forKey:@"clientDomainName"];
  }
  unint64_t v19 = [v5 length];
  [v45 safeStringForKey:@"assetSetIdentifier"];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v21 = [v20 length];

  if (v19 > v21) {
    [v45 setSafeObject:v5 forKey:@"assetSetIdentifier"];
  }
  unint64_t v22 = [v7 length];
  [v45 safeStringForKey:@"atomicInstanceEntries"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v24 = [v23 length];

  if (v22 > v24) {
    [v45 setSafeObject:v7 forKey:@"atomicInstanceEntries"];
  }
  unint64_t v25 = -[__CFString length](v9, "length");
  [v45 safeStringForKey:@"isFullyDownloaded"];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v27 = [v26 length];

  if (v25 > v27) {
    [v45 setSafeObject:v9 forKey:@"isFullyDownloaded"];
  }
  unint64_t v28 = -[__CFString length](v43, "length");
  [v45 safeStringForKey:@"neverBeenLocked"];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v30 = [v29 length];

  if (v28 > v30) {
    [v45 setSafeObject:v43 forKey:@"neverBeenLocked"];
  }
  unint64_t v31 = -[__CFString length](v44, "length");
  [v45 safeStringForKey:@"downloadUserInitiated"];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v33 = [v32 length];

  if (v31 > v33) {
    [v45 setSafeObject:v44 forKey:@"downloadUserInitiated"];
  }
  unint64_t v34 = [v12 length];
  [v45 safeStringForKey:@"downloadedNetworkBytes"];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v36 = [v35 length];

  if (v34 > v36) {
    [v45 setSafeObject:v12 forKey:@"downloadedNetworkBytes"];
  }
  unint64_t v37 = [v13 length];
  [v45 safeStringForKey:@"downloadedFilesystemBytes"];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v39 = [v38 length];

  if (v37 > v39) {
    [v45 setSafeObject:v13 forKey:@"downloadedFilesystemBytes"];
  }
  unint64_t v40 = -[__CFString length](v15, "length");
  [v45 safeStringForKey:@"stagedPriorToAvailable"];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v42 = [v41 length];

  if (v40 > v42) {
    [v45 setSafeObject:v15 forKey:@"stagedPriorToAvailable"];
  }
}

- (id)padded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MAAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName");
  v35 = (void *)v5;
  uint64_t v6 = -[MAAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier");
  unint64_t v34 = (void *)v6;
  -[MAAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 description];
  unint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MAAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded")) {
    int64_t v8 = @"YES";
  }
  else {
    int64_t v8 = @"NO";
  }
  v41 = v8;
  if (-[MAAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked")) {
    int64_t v9 = @"YES";
  }
  else {
    int64_t v9 = @"NO";
  }
  unint64_t v40 = v9;
  if (-[MAAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  uint64_t v11 = (objc_class *)NSString;
  unint64_t v39 = v10;
  v38 = (void *)objc_msgSend( [v11 alloc],  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"));
  unint64_t v37 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"));
  if (-[MAAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  id v29 = (id)NSString;
  unint64_t v27 = v12;
  [v4 safeStringForKey:@"clientDomainName"];
  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v5,  v33,  @" ",  0LL);
  unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"assetSetIdentifier"];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v6,  v32,  @" ",  0LL);
  [v4 safeStringForKey:@"atomicInstanceEntries"];
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v42,  v31,  @" ",  0LL);
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"isFullyDownloaded"];
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v41,  v28,  @" ",  0LL);
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"neverBeenLocked"];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v40,  v25,  @" ",  0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"downloadUserInitiated"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v39,  v23,  @" ",  0LL);
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"downloadedNetworkBytes"];
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v38,  v21,  @" ",  0LL);
  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"downloadedFilesystemBytes"];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v37,  v16,  @" ",  0LL);
  [v4 safeStringForKey:@"stagedPriorToAvailable"];
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v27,  v18,  @" ",  0LL);
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  [v29 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@", v36, v26, v24, v22, v13, v14, v15, v17, v19];
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)newMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v2 setSafeObject:@"clientDomainName" forKey:@"clientDomainName"];
  [v2 setSafeObject:@"assetSetIdentifier" forKey:@"assetSetIdentifier"];
  [v2 setSafeObject:@"atomicInstanceEntries" forKey:@"atomicInstanceEntries"];
  [v2 setSafeObject:@"isFullyDownloaded" forKey:@"isFullyDownloaded"];
  [v2 setSafeObject:@"neverBeenLocked" forKey:@"neverBeenLocked"];
  [v2 setSafeObject:@"downloadUserInitiated" forKey:@"downloadUserInitiated"];
  [v2 setSafeObject:@"downloadedNetworkBytes" forKey:@"downloadedNetworkBytes"];
  [v2 setSafeObject:@"downloadedFilesystemBytes" forKey:@"downloadedFilesystemBytes"];
  [v2 setSafeObject:@"stagedPriorToAvailable" forKey:@"stagedPriorToAvailable"];
  return v2;
}

+ (id)paddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  unint64_t v13 = [v12 length];
  int64_t v14 = v12;
  if (v13 < [v10 length])
  {
    uint64_t v15 = [v10 length];
    uint64_t v16 = v15 - [v12 length];
    [NSString string];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    id v19 = objc_alloc(NSString);
    if (v6) {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v18, v12];
    }
    else {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v12, v18];
    }
    int64_t v14 = (void *)v20;
  }

  return v14;
}

+ (id)paddedHeader:(id)a3
{
  id v19 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"clientDomainName"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"clientDomainName",  v23,  @" ",  0LL);
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetSetIdentifier",  v22,  @" ",  0LL);
  [v3 safeStringForKey:@"atomicInstanceEntries"];
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"atomicInstanceEntries",  v21,  @" ",  0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"isFullyDownloaded"];
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"isFullyDownloaded",  v18,  @" ",  0LL);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"neverBeenLocked"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"neverBeenLocked",  v16,  @" ",  0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"downloadUserInitiated"];
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"downloadUserInitiated",  v14,  @" ",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"downloadedNetworkBytes"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"downloadedNetworkBytes",  v12,  @" ",  0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"downloadedFilesystemBytes"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"downloadedFilesystemBytes",  v6,  @" ",  0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"stagedPriorToAvailable"];
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"stagedPriorToAvailable",  v8,  @" ",  0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@", v24, v17, v15, v13, v11, v4, v5, v7, v9];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)paddedBanner:(id)a3
{
  id v19 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"clientDomainName"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v23,  @"=",  0LL);
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v22,  @"=",  0LL);
  [v3 safeStringForKey:@"atomicInstanceEntries"];
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v21,  @"=",  0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"isFullyDownloaded"];
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v18,  @"=",  0LL);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"neverBeenLocked"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v16,  @"=",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"downloadUserInitiated"];
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v14,  @"=",  0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"downloadedNetworkBytes"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v12,  @"=",  0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"downloadedFilesystemBytes"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v7,  @"=",  0LL);
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"stagedPriorToAvailable"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetInstanceDescriptor paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetInstanceDescriptor,  "paddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v9,  @"=",  0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@", v24, v17, v15, v13, v4, v5, v6, v8, v10];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (NSArray)atomicInstanceEntries
{
  return self->_atomicInstanceEntries;
}

- (BOOL)isFullyDownloaded
{
  return self->_isFullyDownloaded;
}

- (BOOL)neverBeenLocked
{
  return self->_neverBeenLocked;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (int64_t)downloadedNetworkBytes
{
  return self->_downloadedNetworkBytes;
}

- (int64_t)downloadedFilesystemBytes
{
  return self->_downloadedFilesystemBytes;
}

- (BOOL)stagedPriorToAvailable
{
  return self->_stagedPriorToAvailable;
}

- (void).cxx_destruct
{
}

@end