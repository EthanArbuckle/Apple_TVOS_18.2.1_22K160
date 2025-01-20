@interface NEIKEv2KeyIDIdentifier
+ (id)copyTypeDescription;
- (NEIKEv2KeyIDIdentifier)initWithKeyID:(id)a3;
- (NEIKEv2KeyIDIdentifier)initWithKeyIDString:(id)a3;
- (unint64_t)identifierType;
@end

@implementation NEIKEv2KeyIDIdentifier

- (NEIKEv2KeyIDIdentifier)initWithKeyID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4)
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[NEIKEv2KeyIDIdentifier initWithKeyID:]";
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "%s called with null keyID", buf, 0xCu);
    }

    goto LABEL_10;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEIKEv2KeyIDIdentifier;
  v5 = -[NEIKEv2KeyIDIdentifier init](&v9, sel_init);
  if (!v5)
  {
    ne_log_obj();
    self = (NEIKEv2KeyIDIdentifier *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)self, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }

- (NEIKEv2KeyIDIdentifier)initWithKeyIDString:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NEIKEv2KeyIDIdentifier initWithKeyID:](self, "initWithKeyID:", v4);

  return v5;
}

- (unint64_t)identifierType
{
  return 11LL;
}

+ (id)copyTypeDescription
{
  return @"KeyID";
}

@end