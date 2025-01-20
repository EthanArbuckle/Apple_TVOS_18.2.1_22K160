@interface _SFKey
+ (Class)_attributesClass;
+ (id)_specifierForSecKey:(__SecKey *)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)keyData;
- (NSString)keyDomain;
- (_SFKey)initWithAttributes:(id)a3;
- (_SFKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5;
- (_SFKeySpecifier)keySpecifier;
- (id)initRandomKeyWithSpecifier:(id)a3;
@end

@implementation _SFKey

+ (Class)_attributesClass
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:a1 file:@"SFKey.m" lineNumber:583 description:@"attempt to get attributes class from abstract base class SFKey - must be provided by subclass"];

  return 0LL;
}

+ (id)_specifierForSecKey:(__SecKey *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:a1 file:@"SFKey.m" lineNumber:589 description:@"attempt to get sec key specifier from abstract base class SFKey - must be provided by subclass"];

  return 0LL;
}

- (_SFKey)initWithData:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)NSString;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v8 stringWithFormat:@"attempt to initialize abstract base class %@ - initialize a concrete subclass instead", v10];

  [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v11 userInfo:0];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
  return -[_SFKey initWithAttributes:](v13, v14, v15);
}

- (_SFKey)initWithAttributes:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____SFKey;
  v5 = -[_SFKey init](&v12, sel_init);
  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SFKey_Ivars);
    id keyInternal = v5->_keyInternal;
    v5->_id keyInternal = v6;

    uint64_t v8 = [v4 copyWithZone:0];
    v9 = v5->_keyInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;
  }

  return v5;
}

- (id)initRandomKeyWithSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)NSString;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v4 stringWithFormat:@"attempt to creata random key for abstract base class %@ - initialize a concrete subclass instead", v6];

  [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v7 userInfo:0];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
  return (id)-[_SFKey isEqual:](v9, v10, v11);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SFKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SFKey keyData](self, "keyData");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFKey keyData](v6, "keyData");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      char v9 = [v7 isEqual:v8];
    }

    else
    {
      char v9 = 0;
    }
  }

  else
  {
    char v9 = 0;
  }

  return v9;
}

- (_SFKeySpecifier)keySpecifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[v2 copy];

  return (_SFKeySpecifier *)v3;
}

- (NSString)keyDomain
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void).cxx_destruct
{
}

@end