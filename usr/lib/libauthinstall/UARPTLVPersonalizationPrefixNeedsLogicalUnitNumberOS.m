@interface UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS)init;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)prefixNeedsLogicalUnitNumber;
- (void)setPrefixNeedsLogicalUnitNumber:(unsigned __int8)a3;
@end

@implementation UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS

- (UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS;
  return -[UARPMetaDataTLV8OS init](&v3, sel_init);
}

- (void)setPrefixNeedsLogicalUnitNumber:(unsigned __int8)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *((_BYTE *)&v4->super.super._tlvLength + 4) = a3;
  objc_sync_exit(v4);
}

+ (unsigned)tlvType
{
  return -2001563359;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS tlvType]( &OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS,  "tlvType");
  uint64_t v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS;
  return -[UARPMetaDataTLV8OS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS;
  return -[UARPMetaDataTLV8OS tlvValue:](&v4, sel_tlvValue_, v2);
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization Prefix Needs Logical Unit Number";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS tlvType]( UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS,  "tlvType"));
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