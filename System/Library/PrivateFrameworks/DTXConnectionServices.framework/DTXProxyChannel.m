@interface DTXProxyChannel
- (DTXChannel)channel;
- (DTXProxyChannel)initWithChannel:(id)a3 remoteProtocol:(id)a4 localProtocol:(id)a5;
- (NSSet)additionalAllowedClassesForProtocolMethods;
- (Protocol)remoteInterface;
- (id)_allowedClassesForArgumentsOfRemoteInterfaceSelector:(SEL)a3 methodSignature:(id)a4;
- (id)_allowedClassesForReturnValues;
- (id)_validateDispatch:(id)a3;
- (id)remoteObjectProxy;
- (void)_sendInvocationMessage:(id)a3;
- (void)cancel;
- (void)setAdditionalAllowedClassesForProtocolMethods:(id)a3;
- (void)setChannel:(id)a3;
- (void)setExportedObject:(id)a3 queue:(id)a4;
- (void)setRemoteInterface:(id)a3;
@end

@implementation DTXProxyChannel

- (DTXProxyChannel)initWithChannel:(id)a3 remoteProtocol:(id)a4 localProtocol:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___DTXProxyChannel;
  v12 = -[DTXProxyChannel init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_channel, a3);
    objc_storeStrong((id *)&v13->_remoteInterface, a4);
    objc_storeStrong((id *)&v13->_exportedInterface, a5);
    uint64_t v16 = objc_msgSend_set(MEMORY[0x189604010], v14, v15);
    additionalAllowedClassesForProtocolMethods = v13->_additionalAllowedClassesForProtocolMethods;
    v13->_additionalAllowedClassesForProtocolMethods = (NSSet *)v16;

    objc_initWeak(&location, v13);
    channel = v13->_channel;
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = sub_188BC1AD4;
    v21[3] = &unk_18A2ED5C8;
    objc_copyWeak(&v22, &location);
    objc_msgSend__setDispatchValidator_(channel, v19, (uint64_t)v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)remoteObjectProxy
{
  v3 = objc_alloc(&OBJC_CLASS____DTXProxy);
  return (id)objc_msgSend_initWithChannel_(v3, v4, (uint64_t)self);
}

- (void)cancel
{
  channel = self->_channel;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = sub_188BC1BBC;
  v3[3] = &unk_18A2ED4D8;
  v3[4] = self;
  objc_msgSend_sendControlAsync_replyHandler_(channel, a2, kDTXAckBarrierMessage, v3);
}

- (id)_allowedClassesForArgumentsOfRemoteInterfaceSelector:(SEL)a3 methodSignature:(id)a4
{
  id v5 = a4;
  objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  id v10 = (void *)objc_opt_new();
  if (objc_msgSend_numberOfArguments(v9, v11, v12))
  {
    unint64_t v14 = 0LL;
    do
    {
      uint64_t v15 = objc_msgSend__classForObjectAtArgumentIndex_(v9, v13, v14);
      if (v15) {
        objc_msgSend_addObject_(v10, v16, v15);
      }
      ++v14;
    }

    while (v14 < objc_msgSend_numberOfArguments(v9, v16, v17));
  }

  if (objc_msgSend_count(v10, v18, v19))
  {
    uint64_t v22 = objc_msgSend_setByAddingObjectsFromSet_(v8, v20, (uint64_t)v10);

    v8 = (void *)v22;
  }

  objc_msgSend_additionalAllowedClassesForProtocolMethods(self, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v23, v24, v25))
  {
    uint64_t v27 = objc_msgSend_setByAddingObjectsFromSet_(v8, v26, (uint64_t)v23);

    v8 = (void *)v27;
  }

  return v8;
}

- (id)_allowedClassesForReturnValues
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_additionalAllowedClassesForProtocolMethods(self, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v7, v8, v9))
  {
    uint64_t v11 = objc_msgSend_setByAddingObjectsFromSet_(v4, v10, (uint64_t)v7);

    v4 = (void *)v11;
  }

  return v4;
}

- (id)_validateDispatch:(id)a3
{
  id v6 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_hasProcessedMessage);
  if (!self->_exportedInterface) {
    objc_msgSend_raise_format_( MEMORY[0x189603F70],  v4,  (uint64_t)@"DTXMissingInterfaceException",  @"No exported interface has been specified");
  }
  uint64_t v7 = (const char *)objc_msgSend_selector(v6, v4, v5);
  uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding();
  if (!MethodTypeEncoding)
  {
    id v10 = (void *)MEMORY[0x189603F70];
    NSStringFromSelector(v7);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_( v10,  v12,  (uint64_t)@"DTXSelectorNotAllowedException",  @"Selector %@ is not part of the exported interface",  v11);
  }

  objc_msgSend_signatureWithObjCTypes_(MEMORY[0x189603FA0], v8, MethodTypeEncoding);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_methodSignature(v6, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_numberOfArguments(v16, v17, v18);
  uint64_t v22 = objc_msgSend_numberOfArguments(v13, v20, v21);

  if (v19 != v22)
  {
    uint64_t v25 = (void *)MEMORY[0x189603F70];
    NSStringFromSelector(v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_( v25,  v27,  (uint64_t)@"DTXSelectorMismatchException",  @"Incorrect number of arguments in incoming message with selector %@",  v26);
  }

  v54 = v6;
  objc_msgSend_target(v6, v23, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  char v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) == 0)
  {
    v32 = (void *)MEMORY[0x189603F70];
    NSStringFromSelector(v7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_( v32,  v34,  (uint64_t)@"DTXSelectorUnimplementedException",  @"Selector %@ is a valid part of the exported interface, but the exported object does not implement it.",  v33);
  }

  if ((unint64_t)objc_msgSend_numberOfArguments(v13, v30, v31) >= 3)
  {
    unint64_t v35 = 2LL;
    do
    {
      id v36 = v13;
      ArgumentTypeAtIndex = (_BYTE *)objc_msgSend_getArgumentTypeAtIndex_(v36, v37, v35);
      if (*ArgumentTypeAtIndex != 64)
      {
        v41 = ArgumentTypeAtIndex;
        v42 = (void *)MEMORY[0x189603F70];
        NSStringFromSelector(v7);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_raise_format_( v42,  v44,  (uint64_t)@"DTXSelectorInvalidArgumentTypeException",  @"Invalid argument type %s at index %lu of selector %@",  v41,  v35,  v43);
      }

      ++v35;
    }

    while (v35 < objc_msgSend_numberOfArguments(v36, v39, v40));
  }

  id v45 = v13;
  if (*(_BYTE *)objc_msgSend_methodReturnType(v45, v46, v47) != 64)
  {
    v49 = (void *)MEMORY[0x189603F70];
    NSStringFromSelector(v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_( v49,  v51,  (uint64_t)@"DTXSelectorInvalidReturnTypeException",  @"Selector %@ is a part of the exported interface, but return type is not an object.",  v50);
  }

  objc_msgSend__allowedClassesForArgumentsOfRemoteInterfaceSelector_methodSignature_(self, v48, (uint64_t)v7, v45);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (void)setExportedObject:(id)a3 queue:(id)a4
{
  id v10 = (char *)a3;
  id v6 = a4;
  uint64_t v7 = v10;
  id v8 = v6;
  if (v10)
  {
    char v9 = objc_msgSend_conformsToProtocol_(v10, v10, (uint64_t)self->_exportedInterface);
    uint64_t v7 = v10;
    if ((v9 & 1) == 0)
    {
      objc_msgSend_raise_format_( MEMORY[0x189603F70],  v10,  *MEMORY[0x189603A48],  @"Exported object does not conform to the exported interface.");
      uint64_t v7 = v10;
    }
  }

  objc_msgSend__setDispatchTarget_queue_(self->_channel, v7, (uint64_t)v7, v8);
}

- (void)setAdditionalAllowedClassesForProtocolMethods:(id)a3
{
  uint64_t v5 = (NSSet *)a3;
  p_hasProcessedMessage = &self->_hasProcessedMessage;
  do
    unsigned __int8 v7 = __ldaxr((unsigned __int8 *)p_hasProcessedMessage);
  while (__stlxr(1u, (unsigned __int8 *)p_hasProcessedMessage));
  if ((v7 & 1) != 0)
  {
    id v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = *MEMORY[0x189603A48];
    objc_msgSend_stringWithUTF8String_( NSString,  v4,  (uint64_t)"-[DTXProxyChannel setAdditionalAllowedClassesForProtocolMethods:]");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_( v8,  v11,  v9,  @"%@ must only be called once, before sending or receiving messages",  v10);
  }

  additionalAllowedClassesForProtocolMethods = self->_additionalAllowedClassesForProtocolMethods;
  self->_additionalAllowedClassesForProtocolMethods = v5;
}

- (void)_sendInvocationMessage:(id)a3
{
  id v4 = a3;
  id v17 = (id)objc_opt_new();
  objc_msgSend_setReturnValue_(v4, v5, (uint64_t)&v17);
  objc_msgSend_retainArguments(v4, v6, v7);
  id v8 = objc_alloc(&OBJC_CLASS___DTXMessage);
  id v10 = (void *)objc_msgSend_initWithInvocation_(v8, v9, (uint64_t)v4);

  objc_msgSend_channel(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = sub_188BC2244;
  v15[3] = &unk_18A2ED5F0;
  v15[4] = self;
  id v16 = v17;
  objc_msgSend_sendControlAsync_replyHandler_(v13, v14, (uint64_t)v10, v15);
}

- (Protocol)remoteInterface
{
  return (Protocol *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setRemoteInterface:(id)a3
{
}

- (DTXChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSSet)additionalAllowedClassesForProtocolMethods
{
  return self->_additionalAllowedClassesForProtocolMethods;
}

- (void).cxx_destruct
{
}

@end