@interface UARPTLVPersonalizationFTABSubfileTrusted
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationFTABSubfileTrusted)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)trusted;
- (void)setTrusted:(unsigned __int16)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileTrusted

- (UARPTLVPersonalizationFTABSubfileTrusted)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrusted;
  return -[UARPMetaDataTLV16 init](&v3, sel_init);
}

- (void)setTrusted:(unsigned __int16)a3
{
  obj = self;
  objc_sync_enter(obj);
  *((_WORD *)&obj->super.super._tlvLength + 2) = a3;
  objc_sync_exit(obj);
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)NSString;
  [v3 objectForKeyedSubscript:@"Name"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"<%@: %u>", v5, *((unsigned __int16 *)&self->super.super._tlvLength + 2)];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563369;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileTrusted tlvType]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrusted,  "tlvType");
  uint64_t v4 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrusted;
  -[UARPMetaDataTLV16 generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrusted;
  -[UARPMetaDataTLV16 tlvValue:](&v4, sel_tlvValue_, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization FTAB Payload Trusted";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationFTABSubfileTrusted tlvType]( UARPTLVPersonalizationFTABSubfileTrusted,  "tlvType"));
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
    uint64_t v6 = [v4 unsignedShortValue];

    [v5 setTrusted:v6];
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 2)
  {
    v5 = (void *)objc_opt_new();
    [v5 setTrusted:uarpNtohs(*(unsigned __int16 *)a4)];
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (unsigned)trusted
{
  return *((_WORD *)&self->super.super._tlvLength + 2);
}

@end