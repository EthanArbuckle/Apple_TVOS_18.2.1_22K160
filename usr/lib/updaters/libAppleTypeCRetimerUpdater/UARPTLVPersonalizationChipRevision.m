@interface UARPTLVPersonalizationChipRevision
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationChipRevision)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)chipRevision;
- (void)setChipRevision:(unsigned int)a3;
@end

@implementation UARPTLVPersonalizationChipRevision

- (UARPTLVPersonalizationChipRevision)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationChipRevision;
  return -[UARPMetaDataTLV32 init](&v3, sel_init);
}

- (void)setChipRevision:(unsigned int)a3
{
  obj = self;
  objc_sync_enter(obj);
  *(&obj->super.super._tlvLength + 1) = a3;
  objc_sync_exit(obj);
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)NSString;
  [v3 objectForKeyedSubscript:@"Name"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"<%@: %u>", v5, *(&self->super.super._tlvLength + 1)];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563377;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationChipRevision tlvType](&OBJC_CLASS___UARPTLVPersonalizationChipRevision, "tlvType");
  uint64_t v4 = *(&self->super.super._tlvLength + 1);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationChipRevision;
  -[UARPMetaDataTLV32 generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  uint64_t v2 = *(&self->super.super._tlvLength + 1);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationChipRevision;
  -[UARPMetaDataTLV32 tlvValue:](&v4, sel_tlvValue_, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization Chip Revision";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationChipRevision tlvType](UARPTLVPersonalizationChipRevision, "tlvType"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:v5 count:2];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;
    v5 = (void *)objc_opt_new();
    uint64_t v6 = [v4 unsignedLongValue];

    [v5 setChipRevision:v6];
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    v5 = (void *)objc_opt_new();
    [v5 setChipRevision:uarpNtohl(*(_DWORD *)a4)];
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (unsigned)chipRevision
{
  return *(&self->super.super._tlvLength + 1);
}

@end