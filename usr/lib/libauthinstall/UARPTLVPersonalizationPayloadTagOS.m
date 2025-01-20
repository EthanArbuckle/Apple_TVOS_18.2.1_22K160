@interface UARPTLVPersonalizationPayloadTagOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPAssetTagOS)tag;
- (UARPTLVPersonalizationPayloadTagOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTag:(id)a3;
@end

@implementation UARPTLVPersonalizationPayloadTagOS

- (UARPTLVPersonalizationPayloadTagOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationPayloadTagOS;
  return -[UARPMetaDataTLVOS init](&v3, sel_init);
}

- (void)setTag:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 copy];
  tag = v5->_tag;
  v5->_tag = (UARPAssetTagOS *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3 =  +[UARPTLVPersonalizationPayloadTagOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationPayloadTagOS,  "metaDataTableEntry");
  id v4 = (void *)NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: %@>", v5, self->_tag];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563391;
}

- (id)generateTLV
{
  id v3 = objc_alloc_init(MEMORY[0x189603FB8]);
  int v8 = uarpHtonl(+[UARPTLVPersonalizationPayloadTagOS tlvType](&OBJC_CLASS___UARPTLVPersonalizationPayloadTagOS, "tlvType"));
  [v3 appendBytes:&v8 length:4];
  int v7 = uarpHtonl(4u);
  [v3 appendBytes:&v7 length:4];
  id v4 = -[UARPTLVPersonalizationPayloadTagOS tlvValue](self, "tlvValue");
  [v3 appendData:v4];

  id v5 = (id)[MEMORY[0x189603F48] dataWithData:v3];
  return v5;
}

- (id)tlvValue
{
  unsigned int v3 = -[UARPAssetTagOS tag](self->_tag, "tag");
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v3 length:4];
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization Payload Tag";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationPayloadTagOS tlvType]( UARPTLVPersonalizationPayloadTagOS,  "tlvType"));
  v6[1] = v2;
  id v3 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:v5 count:2];

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
      id v5 = (char *)[v4 UTF8String];
      id v6 = (void *)objc_opt_new();
      int v7 = -[UARPAssetTagOS initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTagOS),  "initWithChar1:char2:char3:char4:",  *v5,  v5[1],  v5[2],  v5[3]);
      [v6 setTag:v7];
    }

    else
    {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    id v5 = (void *)objc_opt_new();
    id v6 = -[UARPAssetTagOS initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTagOS),  "initWithChar1:char2:char3:char4:",  *(char *)a4,  *((char *)a4 + 1),  *((char *)a4 + 2),  *((char *)a4 + 3));
    [v5 setTag:v6];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (UARPAssetTagOS)tag
{
  return (UARPAssetTagOS *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end