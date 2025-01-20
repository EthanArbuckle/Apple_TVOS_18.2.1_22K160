@interface UARPTLVPersonalizationManifestPrefix
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSString)ticketPrefix;
- (UARPTLVPersonalizationManifestPrefix)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTicketPrefix:(id)a3;
@end

@implementation UARPTLVPersonalizationManifestPrefix

- (UARPTLVPersonalizationManifestPrefix)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationManifestPrefix;
  return -[UARPMetaDataTLVString init](&v3, sel_init);
}

- (void)setTicketPrefix:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  ticketPrefix = v4->_ticketPrefix;
  v4->_ticketPrefix = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)NSString;
  [v3 objectForKeyedSubscript:@"Name"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"<%@: %@>", v5, self->_ticketPrefix];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563389;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationManifestPrefix tlvType](&OBJC_CLASS___UARPTLVPersonalizationManifestPrefix, "tlvType");
  ticketPrefix = self->_ticketPrefix;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationManifestPrefix;
  -[UARPMetaDataTLVString generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, ticketPrefix);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  ticketPrefix = self->_ticketPrefix;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationManifestPrefix;
  -[UARPMetaDataTLVString tlvValue:](&v4, sel_tlvValue_, ticketPrefix);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization Manifest Prefix";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationManifestPrefix tlvType](UARPTLVPersonalizationManifestPrefix, "tlvType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
    objc_super v4 = (void *)objc_opt_new();
    [v4 setTicketPrefix:v3];
  }

  else
  {
    objc_super v4 = 0LL;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  objc_super v6 = (void *)objc_opt_new();
  id v7 = (void *)[objc_alloc(NSString) initWithBytes:a4 length:a3 encoding:4];
  [v6 setTicketPrefix:v7];

  return v6;
}

- (NSString)ticketPrefix
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end