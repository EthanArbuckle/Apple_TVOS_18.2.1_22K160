@interface NWStatsSnapshot
+ (double)_intervalWithContinuousTime:(unint64_t)a3;
+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3;
+ (void)initialize;
- (BOOL)attributedEntityIsBundleName;
- (BOOL)attributedEntityIsProcessName;
- (BOOL)changedEUUID;
- (BOOL)changedEUUIDFromUUID;
- (BOOL)changedEpid;
- (BOOL)changedOwnership;
- (BOOL)changedPid;
- (BOOL)changedProcname;
- (BOOL)changedUUID;
- (BOOL)firstOccurrence;
- (BOOL)isADaemon;
- (BOOL)lastOccurrence;
- (BOOL)snapshotAppStateIsForeground;
- (BOOL)snapshotScreenStateOn;
- (BOOL)startAppStateIsForeground;
- (BOOL)startScreenStateOn;
- (NSDictionary)extensions;
- (NSDictionary)lookupResults;
- (NSString)attributedEntity;
- (NSString)attributedExtension;
- (NSString)attributionReasonString;
- (NSString)delegateAttributionReasonString;
- (NSString)delegateName;
- (NSString)processName;
- (NSString)snapshotReasonString;
- (NSString)snapshotType;
- (NSString)snapshotTypeLowerCase;
- (NSUUID)euuid;
- (NSUUID)uuid;
- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16];
- (id)extensionDictionaries;
- (int)attributionReason;
- (int)delegateAttributionReason;
- (int)epid;
- (int)processID;
- (int)snapshotReason;
- (unint64_t)eupid;
- (unint64_t)eventFlags;
- (unint64_t)sourceIdentifier;
- (unint64_t)uniqueProcessID;
- (unsigned)personaID;
- (unsigned)uid;
- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6;
- (void)setAttributedEntity:(id)a3;
- (void)setAttributedExtension:(id)a3;
- (void)setAttribution:(id)a3 derivation:(int)a4 delegateName:(id)a5 delegateDerivation:(int)a6 extensionName:(id)a7;
- (void)setAttributionReason:(int)a3;
- (void)setDelegateAttributionReason:(int)a3;
- (void)setDelegateName:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setFirstOccurrence:(BOOL)a3;
- (void)setLookupResults:(id)a3;
- (void)setSnapshotAppStateIsForeground:(BOOL)a3;
- (void)setSnapshotReason:(int)a3;
- (void)setSnapshotScreenStateOn:(BOOL)a3;
- (void)setStartAppStateIsForeground:(BOOL)a3;
- (void)setStartScreenStateOn:(BOOL)a3;
@end

@implementation NWStatsSnapshot

- (NSString)snapshotReasonString
{
  int v2 = self->_snapshotReason - 1;
  else {
    return (NSString *)*(&off_18A1B69C0 + v2);
  }
}

- (BOOL)lastOccurrence
{
  return -[NWStatsSnapshot snapshotReason](self, "snapshotReason") == 2;
}

- (BOOL)changedOwnership
{
  return (self->_flags & 0x21F000) != 0;
}

- (BOOL)changedUUID
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)changedEUUID
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)changedEUUIDFromUUID
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (BOOL)changedEpid
{
  return BYTE2(self->_flags) & 1;
}

- (BOOL)changedPid
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)changedProcname
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16]
{
  if (uuid_is_null(a3)) {
    v4 = 0LL;
  }
  else {
    v4 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3];
  }
  return v4;
}

- (void)setAttribution:(id)a3 derivation:(int)a4 delegateName:(id)a5 delegateDerivation:(int)a6 extensionName:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a4;
  id v18 = a5;
  id v12 = a7;
  v13 = (objc_class *)NSString;
  id v14 = a3;
  v15 = (void *)[[v13 alloc] initWithString:v14];

  -[NWStatsSnapshot setAttributedEntity:](self, "setAttributedEntity:", v15);
  -[NWStatsSnapshot setAttributionReason:](self, "setAttributionReason:", v9);
  -[NWStatsSnapshot setDelegateAttributionReason:](self, "setDelegateAttributionReason:", v8);
  if (v12)
  {
    v16 = (void *)[objc_alloc(NSString) initWithString:v12];
    -[NWStatsSnapshot setAttributedExtension:](self, "setAttributedExtension:", v16);
  }

  if (v18)
  {
    v17 = (void *)[objc_alloc(NSString) initWithString:v18];
    -[NWStatsSnapshot setDelegateName:](self, "setDelegateName:", v17);
  }
}

- (NSString)attributionReasonString
{
  return (NSString *)attributionReasonString(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (NSString)delegateAttributionReasonString
{
  return (NSString *)attributionReasonString(-[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason"));
}

- (BOOL)attributedEntityIsBundleName
{
  return attributionReasonImpliesBundleName(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (BOOL)attributedEntityIsProcessName
{
  return attributionReasonImpliesProcessName(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (BOOL)isADaemon
{
  if (-[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason")) {
    return 1;
  }
  else {
    return attributionReasonImpliesBundleName(-[NWStatsSnapshot attributionReason](self, "attributionReason")) ^ 1;
  }
}

- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  -[NWStatsSnapshot setSnapshotAppStateIsForeground:](self, "setSnapshotAppStateIsForeground:", a3);
  -[NWStatsSnapshot setSnapshotScreenStateOn:](self, "setSnapshotScreenStateOn:", v8);
  -[NWStatsSnapshot setStartAppStateIsForeground:](self, "setStartAppStateIsForeground:", v7);
  -[NWStatsSnapshot setStartScreenStateOn:](self, "setStartScreenStateOn:", v6);
}

+ (double)_intervalWithContinuousTime:(unint64_t)a3
{
  LODWORD(v3) = timebase_info_1;
  LODWORD(v4) = *(_DWORD *)algn_18C4D7E2C;
  return (double)a3 * (double)v3 / (double)v4 / 1000000000.0;
}

+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3
{
  int v5 = 9;
  do
  {
    uint64_t v6 = mach_continuous_time();
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v8 = v7;
    uint64_t v9 = mach_continuous_time() - v6;
    [a1 _intervalWithContinuousTime:v9];
  }

  while (v10 * 1000000.0 >= 50.0 && v5-- != 0);
  uint64_t v12 = v6 + (v9 >> 1);
  if (v12 <= a3)
  {
    [a1 _intervalWithContinuousTime:a3 - v12];
    return v8 + v15;
  }

  else
  {
    [a1 _intervalWithContinuousTime:v12 - a3];
    return v8 - v13;
  }

+ (void)initialize
{
  kern_return_t v2;
  kern_return_t v3;
  os_log_s *v4;
  _DWORD v5[2];
  uint64_t v6;
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = mach_timebase_info((mach_timebase_info_t)&timebase_info_1);
  if (v2)
  {
    unint64_t v3 = v2;
    NStatGetLog();
    unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_187FF5000, v4, OS_LOG_TYPE_ERROR, "mach_timebase_info failed %d", (uint8_t *)v5, 8u);
    }
  }

- (id)extensionDictionaries
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  extensionDictionaries = self->_extensionDictionaries;
  if (extensionDictionaries) {
    return extensionDictionaries;
  }
  if (!self->_extensions)
  {
    extensionDictionaries = 0LL;
    return extensionDictionaries;
  }

  unint64_t v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  -[NWStatsSnapshot extensions](self, "extensions", 0LL);
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        v11 = -[NWStatsSnapshot extensions](self, "extensions");
        [v11 objectForKeyedSubscript:v10];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v10);

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  double v13 = self->_extensionDictionaries;
  self->_extensionDictionaries = v4;

  return self->_extensionDictionaries;
}

- (unint64_t)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (int)snapshotReason
{
  return self->_snapshotReason;
}

- (void)setSnapshotReason:(int)a3
{
  self->_snapshotReason = a3;
}

- (BOOL)firstOccurrence
{
  return self->_firstOccurrence;
}

- (void)setFirstOccurrence:(BOOL)a3
{
  self->_firstOccurrence = a3;
}

- (unint64_t)eventFlags
{
  return self->_eventFlags;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)euuid
{
  return self->_euuid;
}

- (unint64_t)eupid
{
  return self->_eupid;
}

- (int)epid
{
  return self->_epid;
}

- (int)processID
{
  return self->_processID;
}

- (unsigned)personaID
{
  return self->_personaID;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)uniqueProcessID
{
  return self->_uniqueProcessID;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)snapshotType
{
  return self->_snapshotType;
}

- (NSString)snapshotTypeLowerCase
{
  return self->_snapshotTypeLowerCase;
}

- (NSString)attributedEntity
{
  return self->_attributedEntity;
}

- (void)setAttributedEntity:(id)a3
{
}

- (NSString)attributedExtension
{
  return self->_attributedExtension;
}

- (void)setAttributedExtension:(id)a3
{
}

- (int)attributionReason
{
  return self->_attributionReason;
}

- (void)setAttributionReason:(int)a3
{
  self->_attributionReason = a3;
}

- (NSString)delegateName
{
  return self->_delegateName;
}

- (void)setDelegateName:(id)a3
{
}

- (int)delegateAttributionReason
{
  return self->_delegateAttributionReason;
}

- (void)setDelegateAttributionReason:(int)a3
{
  self->_delegateAttributionReason = a3;
}

- (NSDictionary)lookupResults
{
  return self->_lookupResults;
}

- (void)setLookupResults:(id)a3
{
}

- (NSDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (BOOL)startAppStateIsForeground
{
  return self->_startAppStateIsForeground;
}

- (void)setStartAppStateIsForeground:(BOOL)a3
{
  self->_startAppStateIsForeground = a3;
}

- (BOOL)startScreenStateOn
{
  return self->_startScreenStateOn;
}

- (void)setStartScreenStateOn:(BOOL)a3
{
  self->_startScreenStateOn = a3;
}

- (BOOL)snapshotAppStateIsForeground
{
  return self->_snapshotAppStateIsForeground;
}

- (void)setSnapshotAppStateIsForeground:(BOOL)a3
{
  self->_snapshotAppStateIsForeground = a3;
}

- (BOOL)snapshotScreenStateOn
{
  return self->_snapshotScreenStateOn;
}

- (void)setSnapshotScreenStateOn:(BOOL)a3
{
  self->_snapshotScreenStateOn = a3;
}

- (void).cxx_destruct
{
}

@end