@interface UARPTLVPersonalizationFTABSubfileTrustedOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationFTABSubfileTrustedOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)trusted;
- (void)setTrusted:(unsigned __int16)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileTrustedOS

- (UARPTLVPersonalizationFTABSubfileTrustedOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrustedOS;
  return -[UARPMetaDataTLV16OS init](&v3, sel_init);
}

- (void)setTrusted:(unsigned __int16)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *((_WORD *)&v4->super.super._tlvLength + 2) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 =  +[UARPTLVPersonalizationFTABSubfileTrustedOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrustedOS,  "metaDataTableEntry");
  v4 = (void *)NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: %u>", v5, *((unsigned __int16 *)&self->super.super._tlvLength + 2)];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563369;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileTrustedOS tlvType]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrustedOS,  "tlvType");
  uint64_t v4 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrustedOS;
  return -[UARPMetaDataTLV16OS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrustedOS;
  return -[UARPMetaDataTLV16OS tlvValue:](&v4, sel_tlvValue_, v2);
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization FTAB Payload Trusted";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationFTABSubfileTrustedOS tlvType]( UARPTLVPersonalizationFTABSubfileTrustedOS,  "tlvType"));
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
    uint64_t v6 = [v4 unsignedShortValue];

    [v5 setTrusted:v6];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 2)
  {
    id v5 = (void *)objc_opt_new();
    [v5 setTrusted:uarpHtons(*(unsigned __int16 *)a4)];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (unsigned)trusted
{
  return *((_WORD *)&self->super.super._tlvLength + 2);
}

@end