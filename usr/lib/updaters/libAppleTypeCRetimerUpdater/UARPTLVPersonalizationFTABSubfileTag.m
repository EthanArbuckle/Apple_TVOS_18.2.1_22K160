@interface UARPTLVPersonalizationFTABSubfileTag
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPAssetTag)tag;
- (UARPTLVPersonalizationFTABSubfileTag)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTag:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileTag

- (UARPTLVPersonalizationFTABSubfileTag)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTag;
  return -[UARPMetaDataTLV init](&v3, sel_init);
}

- (void)setTag:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  tag = v4->_tag;
  v4->_tag = (UARPAssetTag *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)NSString;
  [v3 objectForKeyedSubscript:@"Name"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"<%@: %@>", v5, self->_tag];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563375;
}

- (id)generateTLV
{
  id v3 = objc_alloc_init(MEMORY[0x189603FB8]);
  int v8 = uarpHtonl(+[UARPTLVPersonalizationFTABSubfileTag tlvType](&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTag, "tlvType"));
  [v3 appendBytes:&v8 length:4];
  int v7 = uarpHtonl(4u);
  [v3 appendBytes:&v7 length:4];
  v4 = -[UARPTLVPersonalizationFTABSubfileTag tlvValue](self, "tlvValue");
  [v3 appendData:v4];

  [MEMORY[0x189603F48] dataWithData:v3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tlvValue
{
  unsigned int v3 = -[UARPAssetTag tag](self->_tag, "tag");
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v3 length:4];
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization FTAB Payload Tag";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationFTABSubfileTag tlvType](UARPTLVPersonalizationFTABSubfileTag, "tlvType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:v5 count:2];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;
    if ([v4 length] == 4)
    {
      uint64_t v5 = (char *)[v4 UTF8String];
      v6 = (void *)objc_opt_new();
      int v7 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v5,  v5[1],  v5[2],  v5[3]);
      [v6 setTag:v7];
    }

    else
    {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    uint64_t v5 = (void *)objc_opt_new();
    v6 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *(char *)a4,  *((char *)a4 + 1),  *((char *)a4 + 2),  *((char *)a4 + 3));
    [v5 setTag:v6];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (UARPAssetTag)tag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end