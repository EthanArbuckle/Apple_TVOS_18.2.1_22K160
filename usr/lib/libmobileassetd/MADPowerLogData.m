@interface MADPowerLogData
- (BOOL)result;
- (MADPowerLogData)initWithType:(id)a3 withAssetSpecifier:(id)a4 versionNumber:(id)a5 clientName:(id)a6 startingAt:(id)a7 endingAt:(id)a8 withTotalBytes:(unint64_t)a9 andResult:(BOOL)a10;
- (NSDate)timeEnd;
- (NSDate)timeStart;
- (NSString)assetSpecifier;
- (NSString)assetType;
- (NSString)assetVersion;
- (NSString)clientName;
- (id)convertPayloadToDict;
- (id)description;
- (unint64_t)totalBytes;
@end

@implementation MADPowerLogData

- (MADPowerLogData)initWithType:(id)a3 withAssetSpecifier:(id)a4 versionNumber:(id)a5 clientName:(id)a6 startingAt:(id)a7 endingAt:(id)a8 withTotalBytes:(unint64_t)a9 andResult:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MADPowerLogData;
  v20 = -[MADPowerLogData init](&v26, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_assetType, a3);
    objc_storeStrong((id *)&v21->_assetSpecifier, a4);
    objc_storeStrong((id *)&v21->_assetVersion, a5);
    objc_storeStrong((id *)&v21->_clientName, a6);
    objc_storeStrong((id *)&v21->_timeStart, a7);
    objc_storeStrong((id *)&v21->_timeEnd, a8);
    v21->_totalBytes = a9;
    v21->_result = a10;
  }

  return v21;
}

- (id)convertPayloadToDict
{
  v23[0] = @"assetType";
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MADPowerLogData assetType](self, "assetType"));
  if (v3) {
    v4 = (const __CFString *)v3;
  }
  else {
    v4 = &stru_355768;
  }
  v24[0] = v4;
  v23[1] = @"assetVersion";
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MADPowerLogData assetVersion](self, "assetVersion", v3));
  v6 = (void *)v5;
  if (v5) {
    v7 = (const __CFString *)v5;
  }
  else {
    v7 = &stru_355768;
  }
  v24[1] = v7;
  v23[2] = @"assetSpecifier";
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MADPowerLogData assetSpecifier](self, "assetSpecifier"));
  v9 = (void *)v8;
  if (v8) {
    v10 = (const __CFString *)v8;
  }
  else {
    v10 = &stru_355768;
  }
  v24[2] = v10;
  v23[3] = @"clientName";
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[MADPowerLogData clientName](self, "clientName"));
  v12 = (void *)v11;
  if (v11) {
    v13 = (const __CFString *)v11;
  }
  else {
    v13 = &stru_355768;
  }
  v24[3] = v13;
  v23[4] = @"timestampStart";
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADPowerLogData timeStart](self, "timeStart"));
  v15 = v14;
  if (!v14) {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  }
  v24[4] = v15;
  v23[5] = @"timestampEnd";
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADPowerLogData timeEnd](self, "timeEnd"));
  id v17 = v16;
  if (!v16) {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  }
  v24[5] = v17;
  v23[6] = @"bytesDownloaded";
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[MADPowerLogData totalBytes](self, "totalBytes")));
  v24[6] = v18;
  v23[7] = @"Result";
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MADPowerLogData result](self, "result")));
  v24[7] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  8LL));

  if (!v16) {
  if (!v14)
  }

  return v20;
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADPowerLogData assetType](self, "assetType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADPowerLogData assetVersion](self, "assetVersion"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADPowerLogData assetSpecifier](self, "assetSpecifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADPowerLogData clientName](self, "clientName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADPowerLogData timeStart](self, "timeStart"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADPowerLogData timeEnd](self, "timeEnd"));
  unint64_t v9 = -[MADPowerLogData totalBytes](self, "totalBytes");
  unsigned int v10 = -[MADPowerLogData result](self, "result");
  uint64_t v11 = @"N";
  if (v10) {
    uint64_t v11 = @"Y";
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"assetType:%@ | assetVersion:%@ | assetSpecifier:%@ | clientName:%@ | timeStart:%@ | timeEnd:%@ | totalBytes:%lld | result:%@",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v11));

  return v12;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSDate)timeStart
{
  return self->_timeStart;
}

- (NSDate)timeEnd
{
  return self->_timeEnd;
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (BOOL)result
{
  return self->_result;
}

- (void).cxx_destruct
{
}

@end