@interface LogHead
+ (id)descriptor;
- (id)diagnosticsJsonDictionary;
@end

@implementation LogHead

+ (id)descriptor
{
  id v2 = (id)qword_1002EE958;
  if (!qword_1002EE958)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___LogHead,  @"LogHead",  &unk_1002E4B60,  &off_1002E4C58,  8LL,  64LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C414];
    qword_1002EE958 = (uint64_t)v2;
  }

  return v2;
}

- (id)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[LogHead logBeginningMs](self, "logBeginningMs")));
  [v3 setObject:v4 forKeyedSubscript:@"logBeginningMs"];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)((unint64_t)-[LogHead logBeginningMs](self, "logBeginningMs") / 0x3E8)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_toISO_8601_UTCString"));
  [v3 setObject:v6 forKeyedSubscript:@"logBeginningDateReadable"];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[LogHead logSize](self, "logSize")));
  [v3 setObject:v7 forKeyedSubscript:@"logSize"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LogHead logHeadHash](self, "logHeadHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
  [v3 setObject:v9 forKeyedSubscript:@"logHeadHash"];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[LogHead revision](self, "revision")));
  [v3 setObject:v10 forKeyedSubscript:@"revision"];

  unint64_t v11 = LogType_EnumDescriptor();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textFormatNameForValue:", -[LogHead logType](self, "logType")));
  [v3 setObject:v13 forKeyedSubscript:@"logType"];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[LogHead treeId](self, "treeId")));
  [v3 setObject:v14 forKeyedSubscript:@"treeId"];

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[LogHead timestampMs](self, "timestampMs")));
  [v3 setObject:v15 forKeyedSubscript:@"timestampMs"];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)((unint64_t)-[LogHead timestampMs](self, "timestampMs") / 0x3E8)));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "kt_toISO_8601_UTCString"));
  [v3 setObject:v17 forKeyedSubscript:@"timestampReadable"];

  if (Application_IsValidValue(-[LogHead application](self, "application")))
  {
    unint64_t v18 = Application_EnumDescriptor();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textFormatNameForValue:", -[LogHead application](self, "application")));
    [v3 setObject:v20 forKeyedSubscript:@"application"];
  }

  return v3;
}

@end