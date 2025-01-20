@interface UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber)init;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)prefixNeedsLogicalUnitNumber;
- (void)setPrefixNeedsLogicalUnitNumber:(unsigned __int8)a3;
@end

@implementation UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber

- (UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber;
  return -[UARPMetaDataTLV8 init](&v3, sel_init);
}

- (void)setPrefixNeedsLogicalUnitNumber:(unsigned __int8)a3
{
  obj = self;
  objc_sync_enter(obj);
  *((_BYTE *)&obj->super.super._tlvLength + 4) = a3;
  objc_sync_exit(obj);
}

+ (unsigned)tlvType
{
  return -2001563359;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber tlvType]( &OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber,  "tlvType");
  uint64_t v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber;
  -[UARPMetaDataTLV8 generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber;
  -[UARPMetaDataTLV8 tlvValue:](&v4, sel_tlvValue_, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization Prefix Needs Logical Unit Number";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber tlvType]( UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber,  "tlvType"));
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
    uint64_t v6 = [v4 unsignedCharValue];

    [v5 setPrefixNeedsLogicalUnitNumber:v6];
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 1)
  {
    v5 = (void *)objc_opt_new();
    [v5 setPrefixNeedsLogicalUnitNumber:*(unsigned __int8 *)a4];
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (unsigned)prefixNeedsLogicalUnitNumber
{
  return *((_BYTE *)&self->super.super._tlvLength + 4);
}

@end