@interface CacheDeleteServiceInfo
+ (id)serviceInfoWithExtensionContext:(id)a3;
- (BOOL)doNotQuery;
- (CacheDeleteServiceInfo)initWithExtensionContext:(id)a3;
- (NSExtensionContext)extensionContext;
- (void)setDoNotQuery:(BOOL)a3;
@end

@implementation CacheDeleteServiceInfo

- (CacheDeleteServiceInfo)initWithExtensionContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CacheDeleteServiceInfo;
  v6 = -[CacheDeleteServiceInfo init](&v11, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (!v5 || !v6) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong(p_isa + 2, a3);
LABEL_5:
    v8 = p_isa;
    goto LABEL_9;
  }

  CDGetLogHandle((uint64_t)"client");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_error_impl( &dword_1874E4000,  v9,  OS_LOG_TYPE_ERROR,  "extensionContext is not of class NSExtensionContext: %@",  buf,  0xCu);
  }

  v8 = 0LL;
LABEL_9:

  return v8;
}

+ (id)serviceInfoWithExtensionContext:(id)a3
{
  id v3 = a3;
  v4 = -[CacheDeleteServiceInfo initWithExtensionContext:]( objc_alloc(&OBJC_CLASS___CacheDeleteServiceInfo),  "initWithExtensionContext:",  v3);

  return v4;
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (BOOL)doNotQuery
{
  return self->_doNotQuery;
}

- (void)setDoNotQuery:(BOOL)a3
{
  self->_doNotQuery = a3;
}

- (void).cxx_destruct
{
}

@end