@interface TKSimpleTLVRecord
+ (id)parseFromDataSource:(id)a3 error:(id *)a4;
- (TKSimpleTLVRecord)initWithTag:(UInt8)tag value:(NSData *)value;
@end

@implementation TKSimpleTLVRecord

- (TKSimpleTLVRecord)initWithTag:(UInt8)tag value:(NSData *)value
{
  unsigned int v4 = tag;
  v6 = value;
  if (-[NSData length](v6, "length") > 0xFE)
  {
    if (-[NSData length](v6, "length") >= 0x10000) {
      objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A60],  @"value for TKSimpleTLVRecord record too big (%lu)",  -[NSData length](v6, "length"));
    }
    char v13 = v4;
    char v14 = -1;
    char v15 = (unsigned __int16)-[NSData length](v6, "length") >> 8;
    char v16 = -[NSData length](v6, "length");
    v7 = (void *)MEMORY[0x189603FB8];
    uint64_t v8 = 4LL;
  }

  else
  {
    char v13 = v4;
    char v14 = -[NSData length](v6, "length");
    v7 = (void *)MEMORY[0x189603FB8];
    uint64_t v8 = 2LL;
  }

  [v7 dataWithBytes:&v13 length:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendData:v6];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TKSimpleTLVRecord;
  v10 = -[TKTLVRecord initWithTag:value:data:](&v12, sel_initWithTag_value_data_, v4, v6, v9);

  return v10;
}

+ (id)parseFromDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 ptr];
  unsigned int v7 = [v5 fetchByte];
  unsigned int v8 = v7;
  unsigned int v9 = [v5 fetchByte];
  if (v9 == 255)
  {
    if ([v5 bytesSafeToRead:2])
    {
      uint64_t v11 = [v5 fetchByte];
      unint64_t v10 = [v5 fetchByte] | (unint64_t)(v11 << 8);
      goto LABEL_8;
    }

@end