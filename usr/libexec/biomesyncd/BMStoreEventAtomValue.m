@interface BMStoreEventAtomValue
+ (BOOL)supportsSecureCoding;
- (BMStoreEventAtomValue)initWithCoder:(id)a3;
- (BMStoreEventAtomValue)initWithEventData:(id)a3 dataVersion:(unsigned int)a4 dataTimestamp:(double)a5;
- (BMStoreEventAtomValue)initWithProto:(id)a3;
- (NSData)eventData;
- (double)dataTimestamp;
- (id)proto;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMStoreEventAtomValue

- (BMStoreEventAtomValue)initWithEventData:(id)a3 dataVersion:(unsigned int)a4 dataTimestamp:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BMStoreEventAtomValue;
  v10 = -[BMStoreEventAtomValue init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_eventData, a3);
    v11->_dataVersion = a4;
    v11->_dataTimestamp = a5;
  }

  return v11;
}

- (BMStoreEventAtomValue)initWithProto:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___BMPBStoreEventAtomValue, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      if (sub_100033F48((uint64_t)v7) && (sub_100033FA8((uint64_t)v7) & 1) != 0)
      {
        uint64_t v8 = sub_100034890((uint64_t)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        uint64_t v10 = sub_100034860((uint64_t)v7);
        self =  -[BMStoreEventAtomValue initWithEventData:dataVersion:dataTimestamp:]( self,  "initWithEventData:dataVersion:dataTimestamp:",  v9,  v10,  sub_100034874((uint64_t)v7));

        v11 = self;
LABEL_13:

        goto LABEL_14;
      }

      uint64_t v15 = __biome_log_for_category(4LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_1000420E8((uint64_t)self, (uint64_t)v16, v17, v18);
      }
    }

    else
    {
      uint64_t v12 = __biome_log_for_category(4LL);
      id v7 = (id)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
        sub_100042160((uint64_t)self, (uint64_t)v7, v13, v14);
      }
    }

    v11 = 0LL;
    goto LABEL_13;
  }

  v11 = 0LL;
LABEL_14:

  return v11;
}

- (id)proto
{
  v3 = objc_opt_new(&OBJC_CLASS___BMPBStoreEventAtomValue);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEventAtomValue eventData](self, "eventData"));
  sub_100034534((uint64_t)v3, v4);

  sub_100033EF4((uint64_t)v3, -[BMStoreEventAtomValue dataVersion](self, "dataVersion"));
  -[BMStoreEventAtomValue dataTimestamp](self, "dataTimestamp");
  sub_100033F60((uint64_t)v3, v5);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  eventData = self->_eventData;
  id v5 = a3;
  [v5 encodeObject:eventData forKey:@"data"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_dataVersion));
  [v5 encodeObject:v6 forKey:@"dataVersion"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_dataTimestamp));
  [v5 encodeObject:v7 forKey:@"dataTimestamp"];
}

- (BMStoreEventAtomValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___BMStoreEventAtomValue;
  uint64_t v6 = -[BMStoreEventAtomValue init](&v18, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), @"data");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    eventData = v6->_eventData;
    v6->_eventData = (NSData *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v10),  @"dataVersion");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v6->_dataVersion = [v12 unsignedIntValue];

    id v14 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v13),  @"dataTimestamp");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v15 doubleValue];
    v6->_dataTimestamp = v16;
  }

  return v6;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)dataTimestamp
{
  return self->_dataTimestamp;
}

- (void).cxx_destruct
{
}

@end