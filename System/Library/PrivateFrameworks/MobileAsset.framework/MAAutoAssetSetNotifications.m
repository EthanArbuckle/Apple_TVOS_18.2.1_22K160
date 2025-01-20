@interface MAAutoAssetSetNotifications
+ (BOOL)supportsSecureCoding;
+ (id)notifyRegistrationName:(id)a3;
+ (id)notifyRegistrationName:(id)a3 forAssetSetIdentifier:(id)a4;
- (BOOL)atomicInstanceAvailableForUse;
- (BOOL)atomicInstanceDiscovered;
- (BOOL)atomicInstancePurged;
- (BOOL)downloadAbandoned;
- (BOOL)downloadPending;
- (BOOL)downloadProgress;
- (BOOL)downloadedBecameIncomplete;
- (BOOL)filesystemSpaceCritical;
- (BOOL)lockUsageCheck;
- (MAAutoAssetSetNotifications)init;
- (MAAutoAssetSetNotifications)initWithCoder:(id)a3;
- (id)copy;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAtomicInstanceAvailableForUse:(BOOL)a3;
- (void)setAtomicInstanceDiscovered:(BOOL)a3;
- (void)setAtomicInstancePurged:(BOOL)a3;
- (void)setDownloadAbandoned:(BOOL)a3;
- (void)setDownloadPending:(BOOL)a3;
- (void)setDownloadProgress:(BOOL)a3;
- (void)setDownloadedBecameIncomplete:(BOOL)a3;
- (void)setFilesystemSpaceCritical:(BOOL)a3;
- (void)setLockUsageCheck:(BOOL)a3;
@end

@implementation MAAutoAssetSetNotifications

- (MAAutoAssetSetNotifications)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetNotifications;
  result = -[MAAutoAssetSetNotifications init](&v3, sel_init);
  if (result)
  {
    result->_downloadedBecameIncomplete = 0;
    *(void *)&result->_atomicInstanceDiscovered = 0LL;
  }

  return result;
}

- (MAAutoAssetSetNotifications)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetNotifications;
  v5 = -[MAAutoAssetSetNotifications init](&v7, sel_init);
  if (v5)
  {
    v5->_atomicInstanceDiscovered = [v4 decodeBoolForKey:@"atomicInstanceDiscovered"];
    v5->_atomicInstanceAvailableForUse = [v4 decodeBoolForKey:@"atomicInstanceAvailableForUse"];
    v5->_lockUsageCheck = [v4 decodeBoolForKey:@"lockUsageCheck"];
    v5->_filesystemSpaceCritical = [v4 decodeBoolForKey:@"filesystemSpaceCritical"];
    v5->_atomicInstancePurged = [v4 decodeBoolForKey:@"atomicInstancePurged"];
    v5->_downloadPending = [v4 decodeBoolForKey:@"downloadPending"];
    v5->_downloadProgress = [v4 decodeBoolForKey:@"downloadProgress"];
    v5->_downloadAbandoned = [v4 decodeBoolForKey:@"downloadAbandoned"];
    v5->_downloadedBecameIncomplete = [v4 decodeBoolForKey:@"downloadedBecameIncomplete"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered"),  @"atomicInstanceDiscovered");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse"),  @"atomicInstanceAvailableForUse");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck"),  @"lockUsageCheck");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"),  @"filesystemSpaceCritical");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged"),  @"atomicInstancePurged");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetNotifications downloadPending](self, "downloadPending"),  @"downloadPending");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetNotifications downloadProgress](self, "downloadProgress"),  @"downloadProgress");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned"),  @"downloadAbandoned");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete"),  @"downloadedBecameIncomplete");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetSetNotifications);
  -[MAAutoAssetSetNotifications setAtomicInstanceDiscovered:]( v3,  "setAtomicInstanceDiscovered:",  -[MAAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered"));
  -[MAAutoAssetSetNotifications setAtomicInstanceAvailableForUse:]( v3,  "setAtomicInstanceAvailableForUse:",  -[MAAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse"));
  -[MAAutoAssetSetNotifications setLockUsageCheck:]( v3,  "setLockUsageCheck:",  -[MAAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck"));
  -[MAAutoAssetSetNotifications setFilesystemSpaceCritical:]( v3,  "setFilesystemSpaceCritical:",  -[MAAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"));
  -[MAAutoAssetSetNotifications setAtomicInstancePurged:]( v3,  "setAtomicInstancePurged:",  -[MAAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged"));
  -[MAAutoAssetSetNotifications setDownloadPending:]( v3,  "setDownloadPending:",  -[MAAutoAssetSetNotifications downloadPending](self, "downloadPending"));
  -[MAAutoAssetSetNotifications setDownloadProgress:]( v3,  "setDownloadProgress:",  -[MAAutoAssetSetNotifications downloadProgress](self, "downloadProgress"));
  -[MAAutoAssetSetNotifications setDownloadAbandoned:]( v3,  "setDownloadAbandoned:",  -[MAAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned"));
  -[MAAutoAssetSetNotifications setDownloadedBecameIncomplete:]( v3,  "setDownloadedBecameIncomplete:",  -[MAAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete"));
  return v3;
}

- (id)summary
{
  v14 = (void *)NSString;
  if (-[MAAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered")) {
    objc_super v3 = @"Y";
  }
  else {
    objc_super v3 = @"N";
  }
  v13 = v3;
  if (-[MAAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse")) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  if (-[MAAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck")) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  if (-[MAAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical")) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if (-[MAAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged")) {
    objc_super v7 = @"Y";
  }
  else {
    objc_super v7 = @"N";
  }
  if (-[MAAutoAssetSetNotifications downloadPending](self, "downloadPending")) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if (-[MAAutoAssetSetNotifications downloadProgress](self, "downloadProgress")) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  if (-[MAAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned")) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  if (-[MAAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete")) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  return (id)[v14 stringWithFormat:@"discovered:%@|availableForUse:%@|lockUsageCheck:%@|filesystemSpaceCritical:%@|purged:%@|downloadPending:%@|downloadProgress:%@|downloadAbandoned:%@|downloadBecameIncomplete:%@", v13, v4, v5, v6, v7, v8, v9, v10, v11];
}

+ (id)notifyRegistrationName:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@%@", @"com.apple.MobileAsset.AutoAssetAtomicNotification", @"^", a3];
}

+ (id)notifyRegistrationName:(id)a3 forAssetSetIdentifier:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@%@%@%@%@", @"com.apple.MobileAsset.AutoAssetAtomicNotification", @"^", a4, @"^", a3];
}

- (BOOL)atomicInstanceDiscovered
{
  return self->_atomicInstanceDiscovered;
}

- (void)setAtomicInstanceDiscovered:(BOOL)a3
{
  self->_atomicInstanceDiscovered = a3;
}

- (BOOL)atomicInstanceAvailableForUse
{
  return self->_atomicInstanceAvailableForUse;
}

- (void)setAtomicInstanceAvailableForUse:(BOOL)a3
{
  self->_atomicInstanceAvailableForUse = a3;
}

- (BOOL)lockUsageCheck
{
  return self->_lockUsageCheck;
}

- (void)setLockUsageCheck:(BOOL)a3
{
  self->_lockUsageCheck = a3;
}

- (BOOL)filesystemSpaceCritical
{
  return self->_filesystemSpaceCritical;
}

- (void)setFilesystemSpaceCritical:(BOOL)a3
{
  self->_filesystemSpaceCritical = a3;
}

- (BOOL)atomicInstancePurged
{
  return self->_atomicInstancePurged;
}

- (void)setAtomicInstancePurged:(BOOL)a3
{
  self->_atomicInstancePurged = a3;
}

- (BOOL)downloadPending
{
  return self->_downloadPending;
}

- (void)setDownloadPending:(BOOL)a3
{
  self->_downloadPending = a3;
}

- (BOOL)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(BOOL)a3
{
  self->_downloadProgress = a3;
}

- (BOOL)downloadAbandoned
{
  return self->_downloadAbandoned;
}

- (void)setDownloadAbandoned:(BOOL)a3
{
  self->_downloadAbandoned = a3;
}

- (BOOL)downloadedBecameIncomplete
{
  return self->_downloadedBecameIncomplete;
}

- (void)setDownloadedBecameIncomplete:(BOOL)a3
{
  self->_downloadedBecameIncomplete = a3;
}

@end