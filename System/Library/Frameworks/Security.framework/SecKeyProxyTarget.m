@interface SecKeyProxyTarget
- (SecKeyProxyTarget)initWithKey:(id)a3 certificate:(id)a4;
- (__SecKey)key;
- (void)getAlgorithmIDWithReply:(id)a3;
- (void)getAttributesWithReply:(id)a3;
- (void)getBlockSizeWithReply:(id)a3;
- (void)getDescriptionWithReply:(id)a3;
- (void)getExternalRepresentationWithReply:(id)a3;
- (void)getPublicKey:(id)a3;
- (void)initializeWithReply:(id)a3;
- (void)performOperation:(int64_t)a3 mode:(int64_t)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7;
@end

@implementation SecKeyProxyTarget

- (SecKeyProxyTarget)initWithKey:(id)a3 certificate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SecKeyProxyTarget;
  v9 = -[SecKeyProxyTarget init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong((id *)&v10->_certificate, a4);
  }

  return v10;
}

- (__SecKey)key
{
  return (__SecKey *)self->_key;
}

- (void)initializeWithReply:(id)a3
{
}

- (void)getBlockSizeWithReply:(id)a3
{
  id v7 = (void (**)(id, uint64_t))a3;
  v4 = -[SecKeyProxyTarget key](self, "key");
  _SecKeyCheck((uint64_t)v4, (uint64_t)"SecKeyGetBlockSize");
  v5 = *(uint64_t (**)(__SecKey *))(*((void *)v4 + 2) + 80LL);
  if (v5) {
    uint64_t v6 = v5(v4);
  }
  else {
    uint64_t v6 = 0LL;
  }
  v7[2](v7, v6);
}

- (void)getAttributesWithReply:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  CFDictionaryRef v5 = SecKeyCopyAttributes(-[SecKeyProxyTarget key](self, "key"));
  id v16 = (id)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  [v16 objectForKeyedSubscript:@"accc"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v14 = SecAccessControlCopyData((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    [v16 setObject:v14 forKeyedSubscript:@"accc"];
  }

  v15 = (void *)[v16 copy];
  v4[2](v4, v15);
}

- (void)getExternalRepresentationWithReply:(id)a3
{
  CFErrorRef error = 0LL;
  v4 = (void (**)(id, CFDataRef, CFErrorRef))a3;
  CFDataRef v5 = SecKeyCopyExternalRepresentation(-[SecKeyProxyTarget key](self, "key"), &error);
  v4[2](v4, v5, error);
}

- (void)getDescriptionWithReply:(id)a3
{
  uint64_t v8 = (void (**)(id, __CFString *))a3;
  v4 = (__CFString *)CFCopyDescription(-[SecKeyProxyTarget key](self, "key"));
  if (-[__CFString hasPrefix:](v4, "hasPrefix:", @"<SecKeyRef ")
    && (-[__CFString hasSuffix:](v4, "hasSuffix:", @">") & 1) != 0)
  {
    uint64_t v5 = -12LL;
    uint64_t v6 = 11LL;
LABEL_7:
    uint64_t v7 = -[__CFString substringWithRange:](v4, "substringWithRange:", v6, -[__CFString length](v4, "length") + v5);

    v4 = (__CFString *)v7;
    goto LABEL_8;
  }

  if (-[__CFString hasPrefix:](v4, "hasPrefix:", @"<SecKeyRef: ")
    && -[__CFString hasSuffix:](v4, "hasSuffix:", @">"))
  {
    uint64_t v5 = -13LL;
    uint64_t v6 = 12LL;
    goto LABEL_7;
  }

- (void)getAlgorithmIDWithReply:(id)a3
{
  id v6 = a3;
  uint64_t AlgorithmId = SecKeyGetAlgorithmId((uint64_t)-[SecKeyProxyTarget key](self, "key"));
  (*((void (**)(id, uint64_t))a3 + 2))(v6, AlgorithmId);
}

- (void)getPublicKey:(id)a3
{
  uint64_t v10 = (void (**)(id, void))a3;
  publicKeyProxy = self->_publicKeyProxy;
  if (!publicKeyProxy)
  {
    SecKeyRef v5 = SecKeyCopyPublicKey(-[SecKeyProxyTarget key](self, "key"));
    if (!v5)
    {
      v10[2](v10, 0LL);
      goto LABEL_5;
    }

    SecKeyRef v6 = v5;
    uint64_t v7 = -[SecKeyProxy initWithKey:](objc_alloc(&OBJC_CLASS___SecKeyProxy), "initWithKey:", v5);
    uint64_t v8 = self->_publicKeyProxy;
    self->_publicKeyProxy = v7;

    publicKeyProxy = self->_publicKeyProxy;
  }

  -[SecKeyProxy endpoint](publicKeyProxy, "endpoint");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v10)[2](v10, v9);

LABEL_5:
}

- (void)performOperation:(int64_t)a3 mode:(int64_t)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(id, void *, __CFString *))a7;
  v25[0] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v25 count:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = (void *)[v15 mutableCopy];

  if ([v13 count])
  {
    [v13 objectAtIndexedSubscript:0];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v17 = 0LL;
  }

  if ((unint64_t)[v13 count] < 2)
  {
    v18 = 0LL;
  }

  else
  {
    [v13 objectAtIndexedSubscript:1];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v23 = 0LL;
  v22[0] = (uint64_t)-[SecKeyProxyTarget key](self, "key");
  v22[1] = a3;
  v22[2] = (uint64_t)v16;
  v22[3] = a4;
  v19 = SecKeyRunAlgorithmAndCopyResult(v22, (const __CFData *)v17, (const __CFData *)v18, &v23);
  v20 = v19;
  if (v19)
  {
    v24 = v19;
    [MEMORY[0x189603F18] arrayWithObjects:&v24 count:1];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v21, v23);
  }

  else
  {
    v14[2](v14, (void *)MEMORY[0x189604A58], v23);
  }
}

- (void).cxx_destruct
{
}

@end