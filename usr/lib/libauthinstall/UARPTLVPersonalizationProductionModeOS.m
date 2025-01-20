@interface UARPTLVPersonalizationProductionModeOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationProductionModeOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)productionMode;
- (void)setProductionMode:(unsigned int)a3;
@end

@implementation UARPTLVPersonalizationProductionModeOS

- (UARPTLVPersonalizationProductionModeOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationProductionModeOS;
  return -[UARPMetaDataTLV32OS init](&v3, sel_init);
}

- (void)setProductionMode:(unsigned int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *(&v4->super.super._tlvLength + 1) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 =  +[UARPTLVPersonalizationProductionModeOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationProductionModeOS,  "metaDataTableEntry");
  v4 = (void *)NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: 0x%08x>", v5, *(&self->super.super._tlvLength + 1)];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563381;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationProductionModeOS tlvType]( &OBJC_CLASS___UARPTLVPersonalizationProductionModeOS,  "tlvType");
  uint64_t v4 = *(&self->super.super._tlvLength + 1);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationProductionModeOS;
  return -[UARPMetaDataTLV32OS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
}

- (id)tlvValue
{
  uint64_t v2 = *(&self->super.super._tlvLength + 1);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationProductionModeOS;
  return -[UARPMetaDataTLV32OS tlvValue:](&v4, sel_tlvValue_, v2);
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization Production Mode";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationProductionModeOS tlvType]( UARPTLVPersonalizationProductionModeOS,  "tlvType"));
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
    id v5 = (void *)objc_opt_new();
    uint64_t v6 = [v4 unsignedLongValue];

    [v5 setProductionMode:v6];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    id v5 = (void *)objc_opt_new();
    [v5 setProductionMode:uarpHtonl(*(_DWORD *)a4)];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (unsigned)productionMode
{
  return *(&self->super.super._tlvLength + 1);
}

@end