@interface MAAutoAssetInfoControl
+ (BOOL)supportsSecureCoding;
+ (id)nameOfSimulateEnd:(int64_t)a3;
+ (id)nameOfSimulateOperation:(int64_t)a3;
- (BOOL)clearingAfter;
- (BOOL)forceUnlock;
- (MAAutoAssetInfoControl)initWithCoder:(id)a3;
- (MAAutoAssetInfoControl)initWithVolumeToReclaim:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5;
- (NSArray)limitedToAssetTypes;
- (NSString)volumeToReclaim;
- (id)initClearingAfter:(BOOL)a3;
- (id)initClearingAfter:(BOOL)a3 forcingUnlock:(BOOL)a4 limitedToAssetTypes:(id)a5 withVolumeToReclaim:(id)a6 withUrgency:(int)a7 targetingPurgeAmount:(int64_t)a8 simulateOperation:(int64_t)a9 simulateEnd:(int64_t)a10;
- (id)initClearingAfter:(BOOL)a3 limitedToAssetTypes:(id)a4;
- (id)initForSimulateOperation:(int64_t)a3 withSimulateEnd:(int64_t)a4;
- (id)initForcingUnlock:(BOOL)a3;
- (id)summary;
- (int)cacheDeleteUrgency;
- (int64_t)simulateEnd;
- (int64_t)simulateOperation;
- (int64_t)targetingPurgeAmount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoControl

- (id)initClearingAfter:(BOOL)a3
{
  return -[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simu lateOperation:simulateEnd:",  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initClearingAfter:(BOOL)a3 limitedToAssetTypes:(id)a4
{
  return -[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simu lateOperation:simulateEnd:",  a3,  0LL,  a4,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForcingUnlock:(BOOL)a3
{
  return -[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simu lateOperation:simulateEnd:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MAAutoAssetInfoControl)initWithVolumeToReclaim:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5
{
  return (MAAutoAssetInfoControl *)-[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency :targetingPurgeAmount:simulateOperation:simulateEnd:",  0LL,  0LL,  0LL,  a3,  *(void *)&a4,  a5,  0LL,  0LL);
}

- (id)initForSimulateOperation:(int64_t)a3 withSimulateEnd:(int64_t)a4
{
  return -[MAAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simu lateOperation:simulateEnd:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4);
}

- (id)initClearingAfter:(BOOL)a3 forcingUnlock:(BOOL)a4 limitedToAssetTypes:(id)a5 withVolumeToReclaim:(id)a6 withUrgency:(int)a7 targetingPurgeAmount:(int64_t)a8 simulateOperation:(int64_t)a9 simulateEnd:(int64_t)a10
{
  id v17 = a5;
  id v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoControl;
  v19 = -[MAAutoAssetInfoControl init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_clearingAfter = a3;
    v19->_forceUnlock = a4;
    objc_storeStrong((id *)&v19->_limitedToAssetTypes, a5);
    objc_storeStrong((id *)&v20->_volumeToReclaim, a6);
    v20->_cacheDeleteUrgency = a7;
    v20->_targetingPurgeAmount = a8;
    v20->_simulateOperation = a9;
    v20->_simulateEnd = a10;
  }

  return v20;
}

- (MAAutoAssetInfoControl)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoControl;
  v5 = -[MAAutoAssetInfoControl init](&v14, sel_init);
  if (v5)
  {
    v5->_clearingAfter = [v4 decodeBoolForKey:@"clearingAfter"];
    v5->_forceUnlock = [v4 decodeBoolForKey:@"forceUnlock"];
    id v6 = objc_alloc(MEMORY[0x189604010]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v6 initWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"limitedToAssetTypes"];
    limitedToAssetTypes = v5->_limitedToAssetTypes;
    v5->_limitedToAssetTypes = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"volumeToReclaim"];
    volumeToReclaim = v5->_volumeToReclaim;
    v5->_volumeToReclaim = (NSString *)v11;

    v5->_cacheDeleteUrgency = [v4 decodeIntegerForKey:@"cacheDeleteUrgency"];
    v5->_targetingPurgeAmount = [v4 decodeInt64ForKey:@"targetingPurgeAmount"];
    v5->_simulateOperation = (int)[v4 decodeIntegerForKey:@"simulateOperation"];
    v5->_simulateEnd = (int)[v4 decodeIntegerForKey:@"simulateEnd"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend( v6,  "encodeBool:forKey:",  -[MAAutoAssetInfoControl clearingAfter](self, "clearingAfter"),  @"clearingAfter");
  objc_msgSend( v6,  "encodeBool:forKey:",  -[MAAutoAssetInfoControl forceUnlock](self, "forceUnlock"),  @"forceUnlock");
  -[MAAutoAssetInfoControl limitedToAssetTypes](self, "limitedToAssetTypes");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v4 forKey:@"limitedToAssetTypes"];
  v5 = -[MAAutoAssetInfoControl volumeToReclaim](self, "volumeToReclaim");
  [v6 encodeObject:v5 forKey:@"volumeToReclaim"];

  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MAAutoAssetInfoControl cacheDeleteUrgency](self, "cacheDeleteUrgency"),  @"cacheDeleteUrgency");
  objc_msgSend( v6,  "encodeInt64:forKey:",  -[MAAutoAssetInfoControl targetingPurgeAmount](self, "targetingPurgeAmount"),  @"targetingPurgeAmount");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MAAutoAssetInfoControl simulateOperation](self, "simulateOperation"),  @"simulateOperation");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MAAutoAssetInfoControl simulateEnd](self, "simulateEnd"),  @"simulateEnd");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v3 = -[MAAutoAssetInfoControl limitedToAssetTypes](self, "limitedToAssetTypes");
  id v4 = @"N";
  if (v3)
  {
    v5 = (__CFString *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
    -[__CFString appendString:](v5, "appendString:", @"[");
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    -[MAAutoAssetInfoControl limitedToAssetTypes](self, "limitedToAssetTypes");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      v10 = &stru_189FFC530;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          -[__CFString appendFormat:]( v5,  "appendFormat:",  @"%@%@",  v10,  *(void *)(*((void *)&v22 + 1) + 8 * v11++));
          v10 = @",";
        }

        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        v10 = @",";
      }

      while (v8);
    }

    -[__CFString appendString:](v5, "appendString:", @"]");
  }

  else
  {
    v5 = @"N";
  }

  v21 = (void *)NSString;
  if (-[MAAutoAssetInfoControl clearingAfter](self, "clearingAfter")) {
    v12 = @"Y";
  }
  else {
    v12 = @"N";
  }
  if (-[MAAutoAssetInfoControl forceUnlock](self, "forceUnlock")) {
    v13 = @"Y";
  }
  else {
    v13 = @"N";
  }
  -[MAAutoAssetInfoControl volumeToReclaim](self, "volumeToReclaim");
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[MAAutoAssetInfoControl volumeToReclaim](self, "volumeToReclaim");
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v15 = -[MAAutoAssetInfoControl cacheDeleteUrgency](self, "cacheDeleteUrgency");
  int64_t v16 = -[MAAutoAssetInfoControl targetingPurgeAmount](self, "targetingPurgeAmount");
  +[MAAutoAssetInfoControl nameOfSimulateOperation:]( &OBJC_CLASS___MAAutoAssetInfoControl,  "nameOfSimulateOperation:",  -[MAAutoAssetInfoControl simulateOperation](self, "simulateOperation"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MAAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MAAutoAssetInfoControl simulateEnd](self, "simulateEnd"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 stringWithFormat:@"clearingAfter:%@, forceUnlock:%@, limitedToAssetTypes:%@, volumeToReclaim:%@, cacheDeleteUrgency:%d, targetingPurgeAmount:%lld, simulateOperation:%@, simulateEnd:%@", v12, v13, v5, v4, v15, v16, v17, v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14) {
  return v19;
  }
}

+ (id)nameOfSimulateOperation:(int64_t)a3
{
  else {
    return off_189FFAA68[a3];
  }
}

+ (id)nameOfSimulateEnd:(int64_t)a3
{
  v3 = @"UNKNOWN";
  if (a3 == 1) {
    v3 = @"CLIENT_REQUEST";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"NONE";
  }
}

- (BOOL)clearingAfter
{
  return self->_clearingAfter;
}

- (BOOL)forceUnlock
{
  return self->_forceUnlock;
}

- (NSArray)limitedToAssetTypes
{
  return self->_limitedToAssetTypes;
}

- (NSString)volumeToReclaim
{
  return self->_volumeToReclaim;
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (int64_t)targetingPurgeAmount
{
  return self->_targetingPurgeAmount;
}

- (int64_t)simulateOperation
{
  return self->_simulateOperation;
}

- (int64_t)simulateEnd
{
  return self->_simulateEnd;
}

- (void).cxx_destruct
{
}

@end