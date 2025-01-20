@interface UARPTLVPersonalizationFTABPayload
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSArray)tlvs;
- (UARPTLVPersonalizationFTABPayload)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTLVs:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABPayload

- (UARPTLVPersonalizationFTABPayload)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABPayload;
  v2 = -[UARPMetaDataTLV init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    tlvs = v2->_tlvs;
    v2->_tlvs = (NSMutableArray *)v3;
  }

  return v2;
}

- (void)setTLVs:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 bytes];
  if ([v11 length])
  {
    unint64_t v5 = 0LL;
    do
    {
      if (v5 + 4 > [v11 length]) {
        break;
      }
      uint64_t v6 = uarpHtonl(*(_DWORD *)(v4 + v5));
      unint64_t v7 = v5 + 8;
      if (v5 + 8 > [v11 length]) {
        break;
      }
      uint64_t v8 = uarpHtonl(*(_DWORD *)(v4 + v5 + 4));
      unint64_t v5 = v7 + v8;
      if (v5 > [v11 length]) {
        break;
      }
      uint64_t v9 = +[UARPMetaDataTLV tlvFromType:length:value:]( &OBJC_CLASS___UARPMetaDataTLV,  "tlvFromType:length:value:",  v6,  v8,  v4 + v7);
      if (!v9) {
        break;
      }
      v10 = (void *)v9;
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v9);
    }

    while (v5 < [v11 length]);
  }
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  +[UARPTLVPersonalizationFTABPayload metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABPayload,  "metaDataTableEntry");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)objc_opt_new();
  [v3 objectForKeyedSubscript:@"Name"];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appendFormat:@"<%@: \r", v5];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v6 = self->_tlvs;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 appendFormat:@"        <%@>\r", *(void *)(*((void *)&v13 + 1) + 8 * v10++)];
      }

      while (v8 != v10);
      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  [v4 appendFormat:@"    >"];
  [NSString stringWithString:v4];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (unsigned)tlvType
{
  return -2001563376;
}

- (id)generateTLV
{
  return 0LL;
}

- (id)tlvValue
{
  return 0LL;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization FTAB Payload";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationFTABPayload tlvType](UARPTLVPersonalizationFTABPayload, "tlvType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:v5 count:2];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0LL;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = (void *)objc_opt_new();
  [v5 setTLVs:v4];

  return v5;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end