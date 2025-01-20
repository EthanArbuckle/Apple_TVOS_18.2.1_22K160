@interface TKTLVRecord
+ (NSArray)sequenceOfRecordsFromData:(NSData *)data;
+ (TKTLVRecord)recordFromData:(NSData *)data;
+ (id)parseFromDataSource:(id)a3;
- (NSData)data;
- (NSData)value;
- (TKTLVRecord)initWithTag:(unint64_t)a3 value:(id)a4 data:(id)a5;
- (TKTLVTag)tag;
- (id)description;
@end

@implementation TKTLVRecord

+ (id)parseFromDataSource:(id)a3
{
  return 0LL;
}

- (TKTLVRecord)initWithTag:(unint64_t)a3 value:(id)a4 data:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TKTLVRecord;
  v11 = -[TKTLVRecord init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_tag = a3;
    objc_storeStrong((id *)&v11->_value, a4);
    objc_storeStrong((id *)&v12->_data, a5);
  }

  return v12;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[TKTLVRecord value](self, "value");
  uint64_t v5 = [v4 bytes];
  v6 = -[TKTLVRecord value](self, "value");
  uint64_t v7 = [v6 length];

  if (v7)
  {
    unint64_t v8 = 0LL;
    do
    {
      objc_msgSend(v3, "appendFormat:", @"%02x", *(unsigned __int8 *)(v5 + v8++));
      -[TKTLVRecord value](self, "value");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v10 = [v9 length];
    }

    while (v8 < v10);
  }

  v11 = (void *)NSString;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TKTLVRecord;
  v12 = -[TKTLVRecord description](&v15, sel_description);
  [v11 stringWithFormat:@"%@ 0x%llx=%@", v12, -[TKTLVRecord tag](self, "tag"), v3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (TKTLVRecord)recordFromData:(NSData *)data
{
  id v4 = data;
  uint64_t v5 = -[TKDataSource initWithData:](objc_alloc(&OBJC_CLASS___TKDataSource), "initWithData:", v4);

  [a1 parseFromDataSource:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[TKDataSource ptr](v5, "ptr");
  else {
    unint64_t v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

+ (NSArray)sequenceOfRecordsFromData:(NSData *)data
{
  id v4 = data;
  [MEMORY[0x189603FA8] array];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TKDataSource initWithData:](objc_alloc(&OBJC_CLASS___TKDataSource), "initWithData:", v4);
  for (i = v6; ; v6 = i)
  {
    unint64_t v8 = -[TKDataSource ptr](v6, "ptr");
    if ((const char *)v8 >= -[TKDataSource end](i, "end"))
    {
      id v11 = v5;
      goto LABEL_7;
    }

    uint64_t v9 = [a1 parseFromDataSource:i];
    if (!v9) {
      break;
    }
    unint64_t v10 = (void *)v9;
    [v5 addObject:v9];
  }

  id v11 = 0LL;
LABEL_7:

  return (NSArray *)v11;
}

- (TKTLVTag)tag
{
  return self->_tag;
}

- (NSData)value
{
  return self->_value;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end