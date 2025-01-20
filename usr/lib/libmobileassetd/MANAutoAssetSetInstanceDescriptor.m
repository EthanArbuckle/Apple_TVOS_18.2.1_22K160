@interface MANAutoAssetSetInstanceDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)downloadUserInitiated;
- (BOOL)isFullyDownloaded;
- (BOOL)neverBeenLocked;
- (BOOL)stagedPriorToAvailable;
- (MANAutoAssetSetInstanceDescriptor)initWithCoder:(id)a3;
- (NSArray)atomicInstanceEntries;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstanceEntries:(id)a5 withFullyDownloaded:(BOOL)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withStagedPriorToAvailable:(BOOL)a11;
- (id)summary;
- (int64_t)downloadedFilesystemBytes;
- (int64_t)downloadedNetworkBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setAtomicInstanceEntries:(id)a3;
- (void)setDownloadUserInitiated:(BOOL)a3;
- (void)setDownloadedFilesystemBytes:(int64_t)a3;
- (void)setDownloadedNetworkBytes:(int64_t)a3;
- (void)setIsFullyDownloaded:(BOOL)a3;
- (void)setNeverBeenLocked:(BOOL)a3;
- (void)setStagedPriorToAvailable:(BOOL)a3;
@end

@implementation MANAutoAssetSetInstanceDescriptor

- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAtomicInstanceEntries:(id)a5 withFullyDownloaded:(BOOL)a6 withNeverBeenLocked:(BOOL)a7 withDownloadUserInitiated:(BOOL)a8 withDownloadedNetworkBytes:(int64_t)a9 withDownloadedFilesystemBytes:(int64_t)a10 withStagedPriorToAvailable:(BOOL)a11
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInstanceDescriptor;
  v21 = -[MANAutoAssetSetInstanceDescriptor init](&v24, "init");
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

- (MANAutoAssetSetInstanceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInstanceDescriptor;
  v5 = -[MANAutoAssetSetInstanceDescriptor init](&v17, "init");
  if (v5)
  {
    v18[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v18[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"asetSetIdentifier"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"atomicInstanceEntries"]);
    atomicInstanceEntries = v5->_atomicInstanceEntries;
    v5->_atomicInstanceEntries = (NSArray *)v14;

    v5->_isFullyDownloaded = [v4 decodeBoolForKey:@"isFullyDownloaded"];
    v5->_neverBeenLocked = [v4 decodeBoolForKey:@"neverBeenLocked"];
    v5->_downloadUserInitiated = [v4 decodeBoolForKey:@"downloadUserInitiated"];
    v5->_downloadedNetworkBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedNetworkBytes"];
    v5->_downloadedFilesystemBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedFilesystemBytes"];
    v5->_stagedPriorToAvailable = [v4 decodeBoolForKey:@"stagedPriorToAvailable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName"));
  [v7 encodeObject:v4 forKey:@"clientDomainName"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier"));
  [v7 encodeObject:v5 forKey:@"asetSetIdentifier"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries"));
  [v7 encodeObject:v6 forKey:@"atomicInstanceEntries"];

  objc_msgSend( v7,  "encodeBool:forKey:",  -[MANAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded"),  @"isFullyDownloaded");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[MANAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked"),  @"neverBeenLocked");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[MANAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated"),  @"downloadUserInitiated");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"),  @"downloadedNetworkBytes");
  objc_msgSend( v7,  "encodeInteger:forKey:",  -[MANAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"),  @"downloadedFilesystemBytes");
  objc_msgSend( v7,  "encodeBool:forKey:",  -[MANAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"),  @"stagedPriorToAvailable");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInstanceDescriptor clientDomainName](self, "clientDomainName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInstanceDescriptor assetSetIdentifier](self, "assetSetIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInstanceDescriptor atomicInstanceEntries](self, "atomicInstanceEntries"));
  id v13 = [v4 count];
  if (-[MANAutoAssetSetInstanceDescriptor isFullyDownloaded](self, "isFullyDownloaded")) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  if (-[MANAutoAssetSetInstanceDescriptor neverBeenLocked](self, "neverBeenLocked")) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if (-[MANAutoAssetSetInstanceDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
    id v7 = @"Y";
  }
  else {
    id v7 = @"N";
  }
  int64_t v8 = -[MANAutoAssetSetInstanceDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes");
  int64_t v9 = -[MANAutoAssetSetInstanceDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  if (-[MANAutoAssetSetInstanceDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientDomainName:%@, assetSetIdentifier:%@, numAtomicInstanceEntries:%ld, fullyDownloaded:%@, neverBeenLocked:%@, userInitiated:%@, networkBytes:%ld, fsBytes:%ld, stagedPrior:%@]",  v14,  v3,  v13,  v5,  v6,  v7,  v8,  v9,  v10));

  return v11;
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

- (void)setAtomicInstanceEntries:(id)a3
{
}

- (BOOL)isFullyDownloaded
{
  return self->_isFullyDownloaded;
}

- (void)setIsFullyDownloaded:(BOOL)a3
{
  self->_isFullyDownloaded = a3;
}

- (BOOL)neverBeenLocked
{
  return self->_neverBeenLocked;
}

- (void)setNeverBeenLocked:(BOOL)a3
{
  self->_neverBeenLocked = a3;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (void)setDownloadUserInitiated:(BOOL)a3
{
  self->_downloadUserInitiated = a3;
}

- (int64_t)downloadedNetworkBytes
{
  return self->_downloadedNetworkBytes;
}

- (void)setDownloadedNetworkBytes:(int64_t)a3
{
  self->_downloadedNetworkBytes = a3;
}

- (int64_t)downloadedFilesystemBytes
{
  return self->_downloadedFilesystemBytes;
}

- (void)setDownloadedFilesystemBytes:(int64_t)a3
{
  self->_downloadedFilesystemBytes = a3;
}

- (BOOL)stagedPriorToAvailable
{
  return self->_stagedPriorToAvailable;
}

- (void)setStagedPriorToAvailable:(BOOL)a3
{
  self->_stagedPriorToAvailable = a3;
}

- (void).cxx_destruct
{
}

@end