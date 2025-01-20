@interface LSSystemBundleIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LSSystemBundleIdentity)initWithBundleIdentifier:(id)a3;
- (LSSystemBundleIdentity)initWithCoder:(id)a3;
- (LSSystemBundleIdentity)initWithIdentityString:(id)a3 parsedIdentityStringDictionary:(id)a4 error:(id *)a5;
- (id)bundleIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSSystemBundleIdentity

- (LSSystemBundleIdentity)initWithIdentityString:(id)a3 parsedIdentityStringDictionary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  [a4 objectForKey:@"b"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___LSSystemBundleIdentity;
  v9 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:]( &v13,  sel_initWithIdentityString_personaUniqueString_personaType_,  v7,  0LL,  4LL);

  if (v9)
  {
    uint64_t v10 = [v8 copy];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;
  }

  return v9;
}

- (LSSystemBundleIdentity)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v15 = 0LL;
  [MEMORY[0x1896078D8] dataWithJSONObject:v4 options:4 error:&v15];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v15;
  if (v5)
  {
    id v7 = (__CFString *)[objc_alloc(NSString) initWithData:v5 encoding:4];
  }

  else
  {
    _LSDefaultLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[LSSystemBundleIdentity initWithBundleIdentifier:].cold.1((uint64_t)v6, v8);
    }

    id v7 = @"\"<ERROR>\"";
  }

  [NSString stringWithFormat:@"{v:2,b:%@,it:%lu}", v7, 1];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LSSystemBundleIdentity;
  uint64_t v10 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:]( &v14,  sel_initWithIdentityString_personaUniqueString_personaType_,  v9,  0LL,  4LL);

  if (v10)
  {
    uint64_t v11 = [v4 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;
  }

  return v10;
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSSystemBundleIdentity;
  id v4 = a3;
  -[LSBundleIdentity encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_bundleIdentifier,  @"bundleIdentifier",  v5.receiver,  v5.super_class);
}

- (LSSystemBundleIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSSystemBundleIdentity;
  objc_super v5 = -[LSBundleIdentity initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSSystemBundleIdentity;
  return -[NSString hash](self->_bundleIdentifier, "hash") ^ __ROR8__(-[LSBundleIdentity hash](&v3, sel_hash), 56);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    bundleIdentifier = self->_bundleIdentifier;
    if (bundleIdentifier == (NSString *)v4[4]) {
      char v6 = 1;
    }
    else {
      char v6 = -[NSString isEqualToString:](bundleIdentifier, "isEqualToString:");
    }
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)initWithBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "could not escape bookmark string: %@",  (uint8_t *)&v2,  0xCu);
}

@end