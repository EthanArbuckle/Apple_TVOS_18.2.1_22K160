@interface MAAutoAssetSetShortTermLock
- (NSMutableDictionary)lockCountByReason;
- (NSString)assetSetAtomicInstance;
- (NSString)lockedFilename;
- (id)initForAssetSetAtomicInstance:(id)a3 withLockedFilename:(id)a4 withLockedFileDescriptor:(int)a5 forFirstLockReason:(id)a6;
- (id)summary;
- (int)lockedFileDescriptor;
- (int64_t)totalLockCount;
- (void)setLockCountByReason:(id)a3;
- (void)setLockedFileDescriptor:(int)a3;
- (void)setTotalLockCount:(int64_t)a3;
@end

@implementation MAAutoAssetSetShortTermLock

- (id)initForAssetSetAtomicInstance:(id)a3 withLockedFilename:(id)a4 withLockedFileDescriptor:(int)a5 forFirstLockReason:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetShortTermLock;
  v14 = -[MAAutoAssetSetShortTermLock init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_assetSetAtomicInstance, a3);
    objc_storeStrong((id *)&v15->_lockedFilename, a4);
    v15->_lockedFileDescriptor = a5;
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    lockCountByReason = v15->_lockCountByReason;
    v15->_lockCountByReason = v16;

    v18 = v15->_lockCountByReason;
    v19 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithInteger:1];
    -[NSMutableDictionary setSafeObject:forKey:](v18, "setSafeObject:forKey:", v19, v13);

    v15->_totalLockCount = 1LL;
  }

  return v15;
}

- (id)summary
{
  v3 = (void *)NSString;
  v4 = -[MAAutoAssetSetShortTermLock assetSetAtomicInstance](self, "assetSetAtomicInstance");
  v5 = -[MAAutoAssetSetShortTermLock lockedFilename](self, "lockedFilename");
  uint64_t v6 = -[MAAutoAssetSetShortTermLock lockedFileDescriptor](self, "lockedFileDescriptor");
  v7 = -[MAAutoAssetSetShortTermLock lockCountByReason](self, "lockCountByReason");
  [v7 safeSummary];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"assetSetAtomicInstance:%@|lockedFilename:%@|lockedFileDescriptor:%d|lockCountByReason:%@|totalLockCount:%ld", v4, v5, v6, v8, -[MAAutoAssetSetShortTermLock totalLockCount](self, "totalLockCount")];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)assetSetAtomicInstance
{
  return self->_assetSetAtomicInstance;
}

- (NSString)lockedFilename
{
  return self->_lockedFilename;
}

- (int)lockedFileDescriptor
{
  return self->_lockedFileDescriptor;
}

- (void)setLockedFileDescriptor:(int)a3
{
  self->_lockedFileDescriptor = a3;
}

- (NSMutableDictionary)lockCountByReason
{
  return self->_lockCountByReason;
}

- (void)setLockCountByReason:(id)a3
{
}

- (int64_t)totalLockCount
{
  return self->_totalLockCount;
}

- (void)setTotalLockCount:(int64_t)a3
{
  self->_totalLockCount = a3;
}

- (void).cxx_destruct
{
}

@end