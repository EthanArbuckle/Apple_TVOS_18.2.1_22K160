@interface _DTXProxy
- (_DTXProxy)initWithChannel:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _DTXProxy

- (_DTXProxy)initWithChannel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____DTXProxy;
  v6 = -[_DTXProxy init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proxyChannel, a3);
  }

  return v7;
}

- (void)forwardInvocation:(id)a3
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____DTXProxy;
  -[_DTXProxy methodSignatureForSelector:](&v23, sel_methodSignatureForSelector_);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
  {
    id v9 = v5;
  }

  else
  {
    objc_msgSend_remoteInterface(self->_proxyChannel, v6, v7);
    v10 = (Protocol *)objc_claimAutoreleasedReturnValue();
    objc_method_description MethodDescription = protocol_getMethodDescription(v10, a3, 1, 1);

    if (!MethodDescription.name)
    {
      v13 = (void *)MEMORY[0x189603F70];
      uint64_t v14 = *MEMORY[0x189603A48];
      NSStringFromSelector(a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_remoteInterface(self->_proxyChannel, v16, v17);
      v18 = (Protocol *)objc_claimAutoreleasedReturnValue();
      Name = protocol_getName(v18);
      objc_msgSend_raise_format_( v13,  v20,  v14,  @"Selector %@ is not part of the remote interface \"%s\"",  v15,  Name);
    }

    objc_msgSend_signatureWithObjCTypes_(MEMORY[0x189603FA0], v12, (uint64_t)MethodDescription.types);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  v21 = v9;

  return v21;
}

- (void).cxx_destruct
{
}

@end