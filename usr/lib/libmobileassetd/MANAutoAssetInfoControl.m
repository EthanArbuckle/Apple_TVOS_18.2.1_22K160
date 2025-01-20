@interface MANAutoAssetInfoControl
+ (BOOL)supportsSecureCoding;
+ (id)nameOfSimulateEnd:(int64_t)a3;
+ (id)nameOfSimulateOperation:(int64_t)a3;
- (BOOL)clearingAfter;
- (BOOL)forceUnlock;
- (MANAutoAssetInfoControl)initWithCoder:(id)a3;
- (MANAutoAssetInfoControl)initWithVolumeToReclaim:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5;
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

@implementation MANAutoAssetInfoControl

- (id)initClearingAfter:(BOOL)a3
{
  return -[MANAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simu lateOperation:simulateEnd:",  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initClearingAfter:(BOOL)a3 limitedToAssetTypes:(id)a4
{
  return -[MANAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simu lateOperation:simulateEnd:",  a3,  0LL,  a4,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (id)initForcingUnlock:(BOOL)a3
{
  return -[MANAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simu lateOperation:simulateEnd:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (MANAutoAssetInfoControl)initWithVolumeToReclaim:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5
{
  return (MANAutoAssetInfoControl *)-[MANAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgenc y:targetingPurgeAmount:simulateOperation:simulateEnd:",  0LL,  0LL,  0LL,  a3,  *(void *)&a4,  a5,  0LL,  0LL);
}

- (id)initForSimulateOperation:(int64_t)a3 withSimulateEnd:(int64_t)a4
{
  return -[MANAutoAssetInfoControl initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simulateOperation:simulateEnd:]( self,  "initClearingAfter:forcingUnlock:limitedToAssetTypes:withVolumeToReclaim:withUrgency:targetingPurgeAmount:simu lateOperation:simulateEnd:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  a4);
}

- (id)initClearingAfter:(BOOL)a3 forcingUnlock:(BOOL)a4 limitedToAssetTypes:(id)a5 withVolumeToReclaim:(id)a6 withUrgency:(int)a7 targetingPurgeAmount:(int64_t)a8 simulateOperation:(int64_t)a9 simulateEnd:(int64_t)a10
{
  id v17 = a5;
  id v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MANAutoAssetInfoControl;
  v19 = -[MANAutoAssetInfoControl init](&v22, "init");
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

- (MANAutoAssetInfoControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MANAutoAssetInfoControl;
  v5 = -[MANAutoAssetInfoControl init](&v15, "init");
  if (v5)
  {
    v5->_clearingAfter = [v4 decodeBoolForKey:@"clearingAfter"];
    v5->_forceUnlock = [v4 decodeBoolForKey:@"forceUnlock"];
    v6 = objc_alloc(&OBJC_CLASS___NSSet);
    v16[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v16[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
    v8 = -[NSSet initWithArray:](v6, "initWithArray:", v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"limitedToAssetTypes"]);
    limitedToAssetTypes = v5->_limitedToAssetTypes;
    v5->_limitedToAssetTypes = (NSArray *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"volumeToReclaim"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    volumeToReclaim = v5->_volumeToReclaim;
    v5->_volumeToReclaim = (NSString *)v12;

    v5->_cacheDeleteUrgency = [v4 decodeIntegerForKey:@"cacheDeleteUrgency"];
    v5->_targetingPurgeAmount = (int64_t)[v4 decodeInt64ForKey:@"targetingPurgeAmount"];
    v5->_simulateOperation = (int)[v4 decodeIntegerForKey:@"simulateOperation"];
    v5->_simulateEnd = (int)[v4 decodeIntegerForKey:@"simulateEnd"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend( v6,  "encodeBool:forKey:",  -[MANAutoAssetInfoControl clearingAfter](self, "clearingAfter"),  @"clearingAfter");
  objc_msgSend( v6,  "encodeBool:forKey:",  -[MANAutoAssetInfoControl forceUnlock](self, "forceUnlock"),  @"forceUnlock");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetInfoControl limitedToAssetTypes](self, "limitedToAssetTypes"));
  [v6 encodeObject:v4 forKey:@"limitedToAssetTypes"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetInfoControl volumeToReclaim](self, "volumeToReclaim"));
  [v6 encodeObject:v5 forKey:@"volumeToReclaim"];

  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetInfoControl cacheDeleteUrgency](self, "cacheDeleteUrgency"),  @"cacheDeleteUrgency");
  objc_msgSend( v6,  "encodeInt64:forKey:",  -[MANAutoAssetInfoControl targetingPurgeAmount](self, "targetingPurgeAmount"),  @"targetingPurgeAmount");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetInfoControl simulateOperation](self, "simulateOperation"),  @"simulateOperation");
  objc_msgSend( v6,  "encodeInteger:forKey:",  -[MANAutoAssetInfoControl simulateEnd](self, "simulateEnd"),  @"simulateEnd");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetInfoControl limitedToAssetTypes](self, "limitedToAssetTypes"));

  if (v3)
  {
    id v4 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    -[NSMutableString appendString:](v4, "appendString:", @"[");
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetInfoControl limitedToAssetTypes](self, "limitedToAssetTypes"));
    id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      uint64_t v9 = &stru_355768;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"%@%@",  v9,  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i));
          uint64_t v9 = @",";
        }

        id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v9 = @",";
      }

      while (v7);
    }

    -[NSMutableString appendString:](v4, "appendString:", @"]");
  }

  if (-[MANAutoAssetInfoControl clearingAfter](self, "clearingAfter")) {
    id v11 = @"Y";
  }
  else {
    id v11 = @"N";
  }
  if (-[MANAutoAssetInfoControl forceUnlock](self, "forceUnlock")) {
    uint64_t v12 = @"Y";
  }
  else {
    uint64_t v12 = @"N";
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetInfoControl volumeToReclaim](self, "volumeToReclaim"));
  if (v13) {
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetInfoControl volumeToReclaim](self, "volumeToReclaim"));
  }
  else {
    v14 = @"N";
  }
  uint64_t v15 = -[MANAutoAssetInfoControl cacheDeleteUrgency](self, "cacheDeleteUrgency");
  int64_t v16 = -[MANAutoAssetInfoControl targetingPurgeAmount](self, "targetingPurgeAmount");
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  -[MANAutoAssetInfoControl simulateOperation](self, "simulateOperation")));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MANAutoAssetInfoControl simulateEnd](self, "simulateEnd")));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"clearingAfter:%@, forceUnlock:%@, limitedToAssetTypes:%@, volumeToReclaim:%@, cacheDeleteUrgency:%d, targetingPurgeAmount:%lld, simulateOperation:%@, simulateEnd:%@",  v11,  v12,  @"N",  v14,  v15,  v16,  v17,  v18));

  if (v13) {
  return v19;
  }
}

+ (id)nameOfSimulateOperation:(int64_t)a3
{
  else {
    return off_34F718[a3];
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