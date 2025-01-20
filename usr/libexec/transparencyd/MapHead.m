@interface MapHead
+ (id)descriptor;
- (id)diagnosticsJsonDictionary;
@end

@implementation MapHead

+ (id)descriptor
{
  id v2 = (id)qword_1002EE968;
  if (!qword_1002EE968)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___MapHead,  @"MapHead",  &unk_1002E4B60,  &off_1002E4E18,  9LL,  64LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C452];
    qword_1002EE968 = (uint64_t)v2;
  }

  return v2;
}

- (id)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[MapHead logBeginningMs](self, "logBeginningMs")));
  [v3 setObject:v4 forKeyedSubscript:@"logBeginningMs"];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)((unint64_t)-[MapHead logBeginningMs](self, "logBeginningMs") / 0x3E8)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_toISO_8601_UTCString"));
  [v3 setObject:v6 forKeyedSubscript:@"logBeginningDateReadable"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapHead mapHeadHash](self, "mapHeadHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  [v3 setObject:v8 forKeyedSubscript:@"mapHeadHash"];

  unint64_t v9 = Application_EnumDescriptor();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textFormatNameForValue:", -[MapHead application](self, "application")));
  [v3 setObject:v11 forKeyedSubscript:@"application"];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[MapHead revision](self, "revision")));
  [v3 setObject:v12 forKeyedSubscript:@"revision"];

  unint64_t v13 = MapType_EnumDescriptor();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textFormatNameForValue:", -[MapHead mapType](self, "mapType")));
  [v3 setObject:v15 forKeyedSubscript:@"mapType"];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[MapHead treeId](self, "treeId")));
  [v3 setObject:v16 forKeyedSubscript:@"treeId"];

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[MapHead timestampMs](self, "timestampMs")));
  [v3 setObject:v17 forKeyedSubscript:@"timestampMs"];

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)((unint64_t)-[MapHead timestampMs](self, "timestampMs") / 0x3E8)));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "kt_toISO_8601_UTCString"));
  [v3 setObject:v19 forKeyedSubscript:@"timestampReadable"];

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MapHead populating](self, "populating")));
  [v3 setObject:v20 forKeyedSubscript:@"populating"];

  return v3;
}

@end