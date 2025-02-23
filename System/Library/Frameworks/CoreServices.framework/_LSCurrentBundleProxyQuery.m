@interface _LSCurrentBundleProxyQuery
+ (BOOL)supportsSecureCoding;
+ (double)cacheInterval;
+ (id)currentBundleProxyQuery;
- (BOOL)isEqual:(id)a3;
- (_LSCurrentBundleProxyQuery)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSCurrentBundleProxyQuery

+ (id)currentBundleProxyQuery
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53___LSCurrentBundleProxyQuery_currentBundleProxyQuery__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[_LSCurrentBundleProxyQuery currentBundleProxyQuery]::once != -1) {
    dispatch_once(&+[_LSCurrentBundleProxyQuery currentBundleProxyQuery]::once, block);
  }
  return (id)+[_LSCurrentBundleProxyQuery currentBundleProxyQuery]::result;
}

+ (double)cacheInterval
{
  return 5.0;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  if (!v5)
  {
    _LSGetMainBundleURL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    v11 = 0LL;
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -120LL,  (uint64_t)"-[_LSCurrentBundleProxyQuery _enumerateWithXPCConnection:block:]",  81LL,  0LL);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

  [v5 _xpcConnection];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)_LSCopyBundleURLForXPCConnection(v7, 1);

  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = 0LL;
  uint64_t v9 = +[LSBundleProxy bundleProxyForURL:error:](&OBJC_CLASS___LSBundleProxy, "bundleProxyForURL:error:", v8, &v12);
  id v10 = v12;
  v11 = (void *)v9;
LABEL_6:
  v6[2](v6, v11, v10);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____LSCurrentBundleProxyQuery;
  if (-[_LSQuery isEqual:](&v7, sel_isEqual_, v4))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSCurrentBundleProxyQuery;
  return -[_LSQuery hash](&v5, sel_hash) ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____LSCurrentBundleProxyQuery;
  -[_LSQuery encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (_LSCurrentBundleProxyQuery)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____LSCurrentBundleProxyQuery;
  return -[_LSQuery initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end