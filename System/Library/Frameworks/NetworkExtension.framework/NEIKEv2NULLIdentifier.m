@interface NEIKEv2NULLIdentifier
+ (id)copyTypeDescription;
- (NEIKEv2NULLIdentifier)init;
- (unint64_t)identifierType;
@end

@implementation NEIKEv2NULLIdentifier

- (NEIKEv2NULLIdentifier)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2NULLIdentifier;
  v2 = -[NEIKEv2NULLIdentifier init](&v8, sel_init);
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603F48]);
    -[NEIKEv2Identifier setIdentifierData:](v2, "setIdentifierData:", v3);

    v4 = v2;
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }

  return v2;
}

- (unint64_t)identifierType
{
  return 13LL;
}

+ (id)copyTypeDescription
{
  return @"NULL";
}

@end