@interface NEVPNIKEv2PPKConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isMandatory;
- (NEVPNIKEv2PPKConfiguration)initWithCoder:(id)a3;
- (NEVPNIKEv2PPKConfiguration)initWithIdentifier:(id)a3 keychainReference:(id)a4;
- (NSData)keychainReference;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setIsMandatory:(BOOL)a3;
@end

@implementation NEVPNIKEv2PPKConfiguration

- (NEVPNIKEv2PPKConfiguration)initWithIdentifier:(id)a3 keychainReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEVPNIKEv2PPKConfiguration;
  v8 = -[NEVPNIKEv2PPKConfiguration init](&v17, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    keychainReference = v8->_keychainReference;
    v8->_keychainReference = (NSData *)v11;

    v8->_isMandatory = 1;
    v13 = v8;
  }

  else
  {
    ne_log_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_fault_impl(&dword_1876B1000, v15, OS_LOG_TYPE_FAULT, "[super init] failed", v16, 2u);
    }
  }

  return v8;
}

- (NEVPNIKEv2PPKConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NEVPNIKEv2PPKConfiguration;
  v5 = -[NEVPNIKEv2PPKConfiguration init](&v16, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PPKKeychainItem"];
    keychainItem = v5->_keychainItem;
    v5->_keychainItem = (NEKeychainItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PPKIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PPKReference"];
    keychainReference = v5->_keychainReference;
    v5->_keychainReference = (NSData *)v10;

    v5->_isMandatory = [v4 decodeBoolForKey:@"PPKMandatory"];
    v12 = v5;
  }

  else
  {
    ne_log_obj();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_1876B1000, v14, OS_LOG_TYPE_FAULT, "[super init] failed", v15, 2u);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v8 encodeObject:Property forKey:@"PPKKeychainItem"];
  -[NEVPNIKEv2PPKConfiguration identifier](self, "identifier");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v6 forKey:@"PPKIdentifier"];

  -[NEVPNIKEv2PPKConfiguration keychainReference](self, "keychainReference");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v7 forKey:@"PPKReference"];

  objc_msgSend( v8,  "encodeBool:forKey:",  -[NEVPNIKEv2PPKConfiguration isMandatory](self, "isMandatory"),  @"PPKMandatory");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[NEVPNIKEv2PPKConfiguration init]( +[NEVPNIKEv2PPKConfiguration allocWithZone:](&OBJC_CLASS___NEVPNIKEv2PPKConfiguration, "allocWithZone:", a3),  "init");
  if (v5)
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v7 = [Property copy];
    keychainItem = v5->_keychainItem;
    v5->_keychainItem = (NEKeychainItem *)v7;

    -[NEVPNIKEv2PPKConfiguration identifier](self, "identifier");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;
    v12 = -[NEVPNIKEv2PPKConfiguration keychainReference](self, "keychainReference");
    uint64_t v13 = [v12 copy];
    keychainReference = v5->_keychainReference;
    v5->_keychainReference = (NSData *)v13;

    v5->_isMandatory = -[NEVPNIKEv2PPKConfiguration isMandatory](self, "isMandatory");
  }

  return v5;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v5 = -[NEVPNIKEv2PPKConfiguration identifier](self, "identifier");
  uint64_t v6 = [v5 length];
  BOOL v7 = v6 != 0;

  if (!v6) {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Use of a PPK requires an identifier",  v4);
  }
  -[NEVPNIKEv2PPKConfiguration keychainReference](self, "keychainReference");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
  }

  else if (!self || !objc_getProperty(self, v9, 32LL, 1))
  {
    +[NEConfiguration addError:toList:]( (uint64_t)&OBJC_CLASS___NEConfiguration,  @"Use of a PPK requires a key",  v4);
    BOOL v7 = 0;
  }

  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  -[NEVPNIKEv2PPKConfiguration identifier](self, "identifier");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"identifier" andIndent:v5 options:a4 | 9];

  if (self) {
    id Property = objc_getProperty(self, v9, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v7 appendPrettyObject:Property withName:@"keychainItem" andIndent:v5 options:a4 | 9];
  -[NEVPNIKEv2PPKConfiguration keychainReference](self, "keychainReference");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v11 withName:@"keychainReference" andIndent:v5 options:a4 | 9];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNIKEv2PPKConfiguration isMandatory](self, "isMandatory"),  @"isMandatory",  v5,  a4 | 8);
  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSData)keychainReference
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)isMandatory
{
  return self->_isMandatory;
}

- (void)setIsMandatory:(BOOL)a3
{
  self->_isMandatory = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end