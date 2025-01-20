@interface UARPTLVPersonalizationEnableMixMatch
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationEnableMixMatch)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)enableMixMatch;
- (void)setEnableMixMatch:(unsigned __int8)a3;
@end

@implementation UARPTLVPersonalizationEnableMixMatch

- (UARPTLVPersonalizationEnableMixMatch)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationEnableMixMatch;
  return -[UARPMetaDataTLV8 init](&v3, sel_init);
}

- (void)setEnableMixMatch:(unsigned __int8)a3
{
  obj = self;
  objc_sync_enter(obj);
  *((_BYTE *)&obj->super.super._tlvLength + 4) = a3;
  objc_sync_exit(obj);
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)NSString;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Name"];
  v6 = (void *)v5;
  if (*((_BYTE *)&self->super.super._tlvLength + 4)) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v4 stringWithFormat:@"<%@: %@>", v5, v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unsigned)tlvType
{
  return -2001563379;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationEnableMixMatch tlvType](&OBJC_CLASS___UARPTLVPersonalizationEnableMixMatch, "tlvType");
  uint64_t v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationEnableMixMatch;
  -[UARPMetaDataTLV8 generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationEnableMixMatch;
  -[UARPMetaDataTLV8 tlvValue:](&v4, sel_tlvValue_, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization Enable Mix Match";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationEnableMixMatch tlvType](UARPTLVPersonalizationEnableMixMatch, "tlvType"));
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
    uint64_t v5 = (void *)objc_opt_new();
    uint64_t v6 = [v4 unsignedCharValue];

    [v5 setEnableMixMatch:v6];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 1)
  {
    uint64_t v5 = (void *)objc_opt_new();
    [v5 setEnableMixMatch:*(unsigned __int8 *)a4];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (unsigned)enableMixMatch
{
  return *((_BYTE *)&self->super.super._tlvLength + 4);
}

@end