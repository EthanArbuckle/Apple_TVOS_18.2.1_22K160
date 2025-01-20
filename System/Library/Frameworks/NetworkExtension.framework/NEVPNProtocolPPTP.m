@interface NEVPNProtocolPPTP
+ (BOOL)supportsSecureCoding;
- (NEVPNProtocolPPTP)init;
- (NEVPNProtocolPPTP)initWithCoder:(id)a3;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)encryptionLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptionLevel:(int64_t)a3;
@end

@implementation NEVPNProtocolPPTP

- (NEVPNProtocolPPTP)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPTP;
  result = -[NEVPNProtocolPPP initWithType:](&v3, sel_initWithType_, 3LL);
  if (result) {
    result->_encryptionLevel = 2LL;
  }
  return result;
}

- (NEVPNProtocolPPTP)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPTP;
  v5 = -[NEVPNProtocolPPP initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5) {
    v5->_encryptionLevel = (int)[v4 decodeInt32ForKey:@"EncryptionLevel"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPTP;
  id v4 = a3;
  -[NEVPNProtocolPPP encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolPPTP encryptionLevel](self, "encryptionLevel", v5.receiver, v5.super_class),  @"EncryptionLevel");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPTP;
  id v4 = -[NEVPNProtocolPPP copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setEncryptionLevel:", -[NEVPNProtocolPPTP encryptionLevel](self, "encryptionLevel"));
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEVPNProtocolPPTP;
  v8 = -[NEVPNProtocolPPP descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_, v5, a4);
  v9 = (void *)[v7 initWithString:v8];

  objc_msgSend( v9,  "appendPrettyInt:withName:andIndent:options:",  -[NEVPNProtocolPPTP encryptionLevel](self, "encryptionLevel"),  @"encryptionLevel",  v5,  a4);
  return v9;
}

- (id)copyLegacyDictionary
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_1876B1000, v2, OS_LOG_TYPE_ERROR, "PPTP is not supported", v4, 2u);
  }

  return 0LL;
}

- (id)initFromLegacyDictionary:(id)a3
{
  return 0LL;
}

- (__SCNetworkInterface)createInterface
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_ERROR,  "Creating PPTP interface failed, protocol is no longer supported",  v4,  2u);
  }

  return 0LL;
}

- (int64_t)encryptionLevel
{
  return self->_encryptionLevel;
}

- (void)setEncryptionLevel:(int64_t)a3
{
  self->_encryptionLevel = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end