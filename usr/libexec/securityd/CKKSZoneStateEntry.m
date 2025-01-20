@interface CKKSZoneStateEntry
+ (id)contextID:(id)a3 zoneName:(id)a4;
+ (id)fromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5;
+ (id)fromDatabaseRow:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5;
- (BOOL)ckzonecreated;
- (BOOL)ckzonesubscribed;
- (BOOL)isEqual:(id)a3;
- (BOOL)moreRecordsInCloudKit;
- (CKKSRateLimiter)rateLimiter;
- (CKKSZoneStateEntry)initWithContextID:(id)a3 zoneName:(id)a4 zoneCreated:(BOOL)a5 zoneSubscribed:(BOOL)a6 changeToken:(id)a7 moreRecordsInCloudKit:(BOOL)a8 lastFetch:(id)a9 lastScan:(id)a10 lastFixup:(unint64_t)a11 encodedRateLimiter:(id)a12;
- (CKServerChangeToken)getChangeToken;
- (NSData)encodedChangeToken;
- (NSData)encodedRateLimiter;
- (NSDate)lastFetchTime;
- (NSDate)lastLocalKeychainScanTime;
- (NSString)ckzone;
- (NSString)contextID;
- (id)description;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (unint64_t)lastFixup;
- (void)setChangeToken:(id)a3;
- (void)setCkzone:(id)a3;
- (void)setCkzonecreated:(BOOL)a3;
- (void)setCkzonesubscribed:(BOOL)a3;
- (void)setEncodedChangeToken:(id)a3;
- (void)setEncodedRateLimiter:(id)a3;
- (void)setLastFetchTime:(id)a3;
- (void)setLastFixup:(unint64_t)a3;
- (void)setLastLocalKeychainScanTime:(id)a3;
- (void)setMoreRecordsInCloudKit:(BOOL)a3;
- (void)setRateLimiter:(id)a3;
@end

@implementation CKKSZoneStateEntry

- (CKKSZoneStateEntry)initWithContextID:(id)a3 zoneName:(id)a4 zoneCreated:(BOOL)a5 zoneSubscribed:(BOOL)a6 changeToken:(id)a7 moreRecordsInCloudKit:(BOOL)a8 lastFetch:(id)a9 lastScan:(id)a10 lastFixup:(unint64_t)a11 encodedRateLimiter:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v27 = a7;
  id v26 = a9;
  id v18 = a10;
  id v19 = a12;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CKKSZoneStateEntry;
  v20 = -[CKKSZoneStateEntry init](&v28, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_contextID, a3);
    objc_storeStrong((id *)&v21->_ckzone, a4);
    v21->_ckzonecreated = a5;
    v21->_ckzonesubscribed = a6;
    objc_storeStrong((id *)&v21->_encodedChangeToken, a7);
    v21->_moreRecordsInCloudKit = a8;
    objc_storeStrong((id *)&v21->_lastFetchTime, a9);
    objc_storeStrong((id *)&v21->_lastLocalKeychainScanTime, a10);
    v21->_lastFixup = a11;
    -[CKKSZoneStateEntry setEncodedRateLimiter:](v21, "setEncodedRateLimiter:", v19);
  }

  return v21;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry ckzone](self, "ckzone"));
  if (-[CKKSZoneStateEntry ckzonecreated](self, "ckzonecreated")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (-[CKKSZoneStateEntry ckzonesubscribed](self, "ckzonesubscribed")) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (-[CKKSZoneStateEntry moreRecordsInCloudKit](self, "moreRecordsInCloudKit")) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSZoneStateEntry[%@](%@): created:%@ subscribed:%@ moreRecords:%@>",  v3,  v4,  v5,  v6,  v7));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CKKSZoneStateEntry, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    id v9 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry ckzone](self, "ckzone"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 ckzone]);
    if (![v10 isEqualToString:v11])
    {
      unsigned __int8 v14 = 0;
LABEL_18:

      goto LABEL_19;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
    if (v12 || (v49 = (void *)objc_claimAutoreleasedReturnValue([v9 contextID])) != 0)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue([v9 contextID]);
      if (![v3 isEqualToString:v4])
      {
        unsigned __int8 v14 = 0;
        goto LABEL_14;
      }

      int v13 = 1;
    }

    else
    {
      v49 = 0LL;
      int v13 = 0;
    }

    unsigned int v15 = -[CKKSZoneStateEntry ckzonecreated](self, "ckzonecreated");
    if (v15 != [v9 ckzonecreated]
      || (unsigned int v16 = -[CKKSZoneStateEntry ckzonesubscribed](self, "ckzonesubscribed"),
          v16 != [v9 ckzonesubscribed]))
    {
      unsigned __int8 v14 = 0;
      if (!v13)
      {
LABEL_15:
        if (!v12) {

        }
        goto LABEL_18;
      }

- (CKServerChangeToken)getChangeToken
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedChangeToken](self, "encodedChangeToken"));

  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedChangeToken](self, "encodedChangeToken"));
    id v6 = -[NSKeyedUnarchiver initForReadingFromData:error:](v4, "initForReadingFromData:error:", v5, 0LL);

    id v8 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v6,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___CKServerChangeToken, v7),  NSKeyedArchiveRootObjectKey);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    id v9 = 0LL;
  }

  return (CKServerChangeToken *)v9;
}

- (void)setChangeToken:(id)a3
{
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  0LL));
    -[CKKSZoneStateEntry setEncodedChangeToken:](self, "setEncodedChangeToken:", v4);
  }

  else
  {
    -[CKKSZoneStateEntry setEncodedChangeToken:](self, "setEncodedChangeToken:");
  }

- (NSData)encodedRateLimiter
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry rateLimiter](self, "rateLimiter"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry rateLimiter](self, "rateLimiter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  0LL));
  }

  else
  {
    v5 = 0LL;
  }

  return (NSData *)v5;
}

- (void)setEncodedRateLimiter:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v8,  0LL);
    id v6 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___CKKSRateLimiter, v5),  NSKeyedArchiveRootObjectKey);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CKKSZoneStateEntry setRateLimiter:](self, "setRateLimiter:", v7);
  }

  else
  {
    -[CKKSZoneStateEntry setRateLimiter:](self, "setRateLimiter:", 0LL);
  }
}

- (id)whereClauseToFindSelf
{
  v10[0] = @"contextID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v6 = v5;

  v10[1] = @"ckzone";
  v11[0] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry ckzone](self, "ckzone"));
  v11[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  return v8;
}

- (id)sqlValues
{
  v31 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  v32[0] = @"contextID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry contextID](self, "contextID"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v6 = v5;

  uint64_t v30 = v6;
  v33[0] = v6;
  v32[1] = @"ckzone";
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry ckzone](self, "ckzone"));
  v33[1] = v29;
  v32[2] = @"ckzonecreated";
  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CKKSZoneStateEntry ckzonecreated](self, "ckzonecreated")));
  v33[2] = v28;
  v32[3] = @"ckzonesubscribed";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CKKSZoneStateEntry ckzonesubscribed](self, "ckzonesubscribed")));
  v33[3] = v7;
  v32[4] = @"changetoken";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedChangeToken](self, "encodedChangeToken"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 base64EncodedStringWithOptions:0]);

  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v11 = v10;

  v33[4] = v11;
  v32[5] = @"lastfetch";
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastFetchTime](self, "lastFetchTime"));
  if (!v12
    || (int v13 = (void *)v12,
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastFetchTime](self, "lastFetchTime")),
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v31, "stringFromDate:", v14)),
        v14,
        v13,
        !v15))
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  v33[5] = v15;
  v32[6] = @"ratelimiter";
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry encodedRateLimiter](self, "encodedRateLimiter"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 base64EncodedStringWithOptions:0]);

  if (v17) {
    id v18 = v17;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v19 = v18;

  v33[6] = v19;
  v32[7] = @"lastFixup";
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  -[CKKSZoneStateEntry lastFixup](self, "lastFixup")));
  v33[7] = v20;
  v32[8] = @"morecoming";
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CKKSZoneStateEntry moreRecordsInCloudKit](self, "moreRecordsInCloudKit")));
  v33[8] = v21;
  v32[9] = @"lastscan";
  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastLocalKeychainScanTime](self, "lastLocalKeychainScanTime"));
  if (!v22
    || (uint64_t v23 = (void *)v22,
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneStateEntry lastLocalKeychainScanTime](self, "lastLocalKeychainScanTime")),
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v31, "stringFromDate:", v24)),
        v24,
        v23,
        !v25))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }

  v33[9] = v25;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  10LL));

  return v26;
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)ckzone
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCkzone:(id)a3
{
}

- (BOOL)ckzonecreated
{
  return self->_ckzonecreated;
}

- (void)setCkzonecreated:(BOOL)a3
{
  self->_ckzonecreated = a3;
}

- (BOOL)ckzonesubscribed
{
  return self->_ckzonesubscribed;
}

- (void)setCkzonesubscribed:(BOOL)a3
{
  self->_ckzonesubscribed = a3;
}

- (NSData)encodedChangeToken
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEncodedChangeToken:(id)a3
{
}

- (BOOL)moreRecordsInCloudKit
{
  return self->_moreRecordsInCloudKit;
}

- (void)setMoreRecordsInCloudKit:(BOOL)a3
{
  self->_moreRecordsInCloudKit = a3;
}

- (NSDate)lastFetchTime
{
  return (NSDate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLastFetchTime:(id)a3
{
}

- (NSDate)lastLocalKeychainScanTime
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLastLocalKeychainScanTime:(id)a3
{
}

- (unint64_t)lastFixup
{
  return self->_lastFixup;
}

- (void)setLastFixup:(unint64_t)a3
{
  self->_lastFixup = a3;
}

- (CKKSRateLimiter)rateLimiter
{
  return (CKKSRateLimiter *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setRateLimiter:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)contextID:(id)a3 zoneName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v12 = 0LL;
  uint64_t v7 = (CKKSZoneStateEntry *)objc_claimAutoreleasedReturnValue( +[CKKSZoneStateEntry tryFromDatabase:zoneName:error:]( &OBJC_CLASS___CKKSZoneStateEntry,  "tryFromDatabase:zoneName:error:",  v5,  v6,  &v12));
  id v8 = v12;
  if (v8)
  {
    id v9 = sub_1000AA6AC(@"ckks", 0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "error fetching CKState(%@): %@", buf, 0x16u);
    }
  }

  if (!v7) {
    uint64_t v7 = -[CKKSZoneStateEntry initWithContextID:zoneName:zoneCreated:zoneSubscribed:changeToken:moreRecordsInCloudKit:lastFetch:lastScan:lastFixup:encodedRateLimiter:]( objc_alloc(&OBJC_CLASS___CKKSZoneStateEntry),  "initWithContextID:zoneName:zoneCreated:zoneSubscribed:changeToken:moreRecordsInCloudKit:lastFetch:lastScan:la stFixup:encodedRateLimiter:",  v5,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  5LL,  0LL);
  }

  return v7;
}

+ (id)fromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v21[0] = @"contextID";
  id v10 = v8;
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  int v13 = v12;

  v21[1] = @"ckzone";
  v22[0] = v13;
  id v14 = v9;
  __int16 v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v22[1] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v18 error:a5]);

  return v19;
}

+ (id)tryFromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v21[0] = @"contextID";
  id v10 = v8;
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  int v13 = v12;

  v21[1] = @"ckzone";
  v22[0] = v13;
  id v14 = v9;
  __int16 v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v22[1] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v18 error:a5]);

  return v19;
}

+ (id)sqlTable
{
  return @"ckstate";
}

+ (id)sqlColumns
{
  return &off_1002AE580;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CKKSZoneStateEntry);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contextID"]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v26 asString]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckzone"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v25 asString]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckzonecreated"]);
  unsigned int v18 = [v24 asBOOL];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckzonesubscribed"]);
  unsigned int v17 = [v23 asBOOL];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"changetoken"]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v22 asBase64DecodedData]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"morecoming"]);
  unsigned int v15 = [v20 asBOOL];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"lastfetch"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 asISO8601Date]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"lastscan"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 asISO8601Date]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"lastFixup"]);
  id v11 = [v10 asNSInteger];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ratelimiter"]);

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 asBase64DecodedData]);
  id v19 = -[CKKSZoneStateEntry initWithContextID:zoneName:zoneCreated:zoneSubscribed:changeToken:moreRecordsInCloudKit:lastFetch:lastScan:lastFixup:encodedRateLimiter:]( v4,  "initWithContextID:zoneName:zoneCreated:zoneSubscribed:changeToken:moreRecordsInCloudKit:lastFetch:lastScan:las tFixup:encodedRateLimiter:",  v21,  v5,  v18,  v17,  v16,  v15,  v7,  v9,  v11,  v13);

  return v19;
}

@end