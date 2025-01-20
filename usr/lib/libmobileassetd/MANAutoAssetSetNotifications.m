@interface MANAutoAssetSetNotifications
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
- (MANAutoAssetSetNotifications)init;
- (MANAutoAssetSetNotifications)initWithCoder:(id)a3;
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

@implementation MANAutoAssetSetNotifications

- (MANAutoAssetSetNotifications)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetNotifications;
  result = -[MANAutoAssetSetNotifications init](&v3, "init");
  if (result)
  {
    result->_downloadedBecameIncomplete = 0;
    *(void *)&result->_atomicInstanceDiscovered = 0LL;
  }

  return result;
}

- (void)setAtomicInstanceDiscovered:(BOOL)a3
{
  self->_atomicInstanceDiscovered = a3;
}

- (void)setAtomicInstanceAvailableForUse:(BOOL)a3
{
  self->_atomicInstanceAvailableForUse = a3;
}

- (id)summary
{
  if (-[MANAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered")) {
    objc_super v3 = @"Y";
  }
  else {
    objc_super v3 = @"N";
  }
  v13 = v3;
  if (-[MANAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse")) {
    v4 = @"Y";
  }
  else {
    v4 = @"N";
  }
  if (-[MANAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck")) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  if (-[MANAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical")) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if (-[MANAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged")) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  if (-[MANAutoAssetSetNotifications downloadPending](self, "downloadPending")) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if (-[MANAutoAssetSetNotifications downloadProgress](self, "downloadProgress")) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  if (-[MANAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned")) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  if (-[MANAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete")) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"discovered:%@|availableForUse:%@|lockUsageCheck:%@|filesystemSpaceCritical:%@|purged:%@|downloadPending:%@|downloadProgress:%@|downloadAbandoned:%@|downloadBecameIncomplete:%@",  v13,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11);
}

- (BOOL)atomicInstanceDiscovered
{
  return self->_atomicInstanceDiscovered;
}

- (BOOL)atomicInstanceAvailableForUse
{
  return self->_atomicInstanceAvailableForUse;
}

- (BOOL)lockUsageCheck
{
  return self->_lockUsageCheck;
}

- (BOOL)filesystemSpaceCritical
{
  return self->_filesystemSpaceCritical;
}

- (BOOL)atomicInstancePurged
{
  return self->_atomicInstancePurged;
}

- (BOOL)downloadPending
{
  return self->_downloadPending;
}

- (BOOL)downloadProgress
{
  return self->_downloadProgress;
}

- (BOOL)downloadAbandoned
{
  return self->_downloadAbandoned;
}

- (BOOL)downloadedBecameIncomplete
{
  return self->_downloadedBecameIncomplete;
}

- (MANAutoAssetSetNotifications)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetNotifications;
  v5 = -[MANAutoAssetSetNotifications init](&v7, "init");
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
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered"),  @"atomicInstanceDiscovered");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse"),  @"atomicInstanceAvailableForUse");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck"),  @"lockUsageCheck");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"),  @"filesystemSpaceCritical");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged"),  @"atomicInstancePurged");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetNotifications downloadPending](self, "downloadPending"),  @"downloadPending");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetNotifications downloadProgress](self, "downloadProgress"),  @"downloadProgress");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned"),  @"downloadAbandoned");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete"),  @"downloadedBecameIncomplete");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetNotifications);
  -[MANAutoAssetSetNotifications setAtomicInstanceDiscovered:]( v3,  "setAtomicInstanceDiscovered:",  -[MANAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered"));
  -[MANAutoAssetSetNotifications setAtomicInstanceAvailableForUse:]( v3,  "setAtomicInstanceAvailableForUse:",  -[MANAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse"));
  -[MANAutoAssetSetNotifications setLockUsageCheck:]( v3,  "setLockUsageCheck:",  -[MANAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck"));
  -[MANAutoAssetSetNotifications setFilesystemSpaceCritical:]( v3,  "setFilesystemSpaceCritical:",  -[MANAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"));
  -[MANAutoAssetSetNotifications setAtomicInstancePurged:]( v3,  "setAtomicInstancePurged:",  -[MANAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged"));
  -[MANAutoAssetSetNotifications setDownloadPending:]( v3,  "setDownloadPending:",  -[MANAutoAssetSetNotifications downloadPending](self, "downloadPending"));
  -[MANAutoAssetSetNotifications setDownloadProgress:]( v3,  "setDownloadProgress:",  -[MANAutoAssetSetNotifications downloadProgress](self, "downloadProgress"));
  -[MANAutoAssetSetNotifications setDownloadAbandoned:]( v3,  "setDownloadAbandoned:",  -[MANAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned"));
  -[MANAutoAssetSetNotifications setDownloadedBecameIncomplete:]( v3,  "setDownloadedBecameIncomplete:",  -[MANAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete"));
  return v3;
}

+ (id)notifyRegistrationName:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  @"com.apple.MobileAsset.AutoAssetAtomicNotification",  @"^",  a3);
}

+ (id)notifyRegistrationName:(id)a3 forAssetSetIdentifier:(id)a4
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@%@%@",  @"com.apple.MobileAsset.AutoAssetAtomicNotification",  @"^",  a4,  @"^",  a3);
}

- (void)setLockUsageCheck:(BOOL)a3
{
  self->_lockUsageCheck = a3;
}

- (void)setFilesystemSpaceCritical:(BOOL)a3
{
  self->_filesystemSpaceCritical = a3;
}

- (void)setAtomicInstancePurged:(BOOL)a3
{
  self->_atomicInstancePurged = a3;
}

- (void)setDownloadPending:(BOOL)a3
{
  self->_downloadPending = a3;
}

- (void)setDownloadProgress:(BOOL)a3
{
  self->_downloadProgress = a3;
}

- (void)setDownloadAbandoned:(BOOL)a3
{
  self->_downloadAbandoned = a3;
}

- (void)setDownloadedBecameIncomplete:(BOOL)a3
{
  self->_downloadedBecameIncomplete = a3;
}

@end