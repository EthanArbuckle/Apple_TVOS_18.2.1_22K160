@interface DTXProxyRequestHandler
- (BOOL)matchesPublishedProtocolName:(id)a3 peerProtocolName:(id)a4;
- (DTXProxyRequestHandler)initWithPublishedProtocol:(id)a3 publishedProtocolName:(id)a4 peerProtocol:(id)a5 peerProtocolName:(id)a6 handlerBlock:(id)a7;
- (NSString)channelIdentifier;
- (NSString)peerProtocolName;
- (NSString)publishedProtocolName;
- (Protocol)peerProtocol;
- (Protocol)publishedProtocol;
- (id)handlerBlock;
@end

@implementation DTXProxyRequestHandler

- (DTXProxyRequestHandler)initWithPublishedProtocol:(id)a3 publishedProtocolName:(id)a4 peerProtocol:(id)a5 peerProtocolName:(id)a6 handlerBlock:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v20 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }

  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v18, v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v36,  v37,  (uint64_t)a2,  self,  @"DTXConnection.m",  113,  @"Invalid parameter not satisfying: %@",  @"publishedProtocol != NULL");

    if (v15) {
      goto LABEL_3;
    }
  }

  objc_msgSend_currentHandler(MEMORY[0x1896077D8], v18, v19);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v38,  v39,  (uint64_t)a2,  self,  @"DTXConnection.m",  114,  @"Invalid parameter not satisfying: %@",  @"publishedProtocolName != nil");

LABEL_3:
  if ((v16 == 0LL) == (v17 == 0LL))
  {
    if (v20) {
      goto LABEL_5;
    }
  }

  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v18, v19);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v40,  v41,  (uint64_t)a2,  self,  @"DTXConnection.m",  115,  @"Invalid parameter not satisfying: %@",  @"(peerProtocol == NULL) == (peerProtocolName == nil)");

    if (v20) {
      goto LABEL_5;
    }
  }

  objc_msgSend_currentHandler(MEMORY[0x1896077D8], v18, v19);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v42,  v43,  (uint64_t)a2,  self,  @"DTXConnection.m",  116,  @"Invalid parameter not satisfying: %@",  @"handlerBlock != NULL");

LABEL_5:
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___DTXProxyRequestHandler;
  v21 = -[DTXProxyRequestHandler init](&v44, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_publishedProtocol, a3);
    uint64_t v25 = objc_msgSend_copy(v15, v23, v24);
    publishedProtocolName = v22->_publishedProtocolName;
    v22->_publishedProtocolName = (NSString *)v25;

    objc_storeStrong((id *)&v22->_peerProtocol, a5);
    uint64_t v29 = objc_msgSend_copy(v17, v27, v28);
    peerProtocolName = v22->_peerProtocolName;
    v22->_peerProtocolName = (NSString *)v29;

    uint64_t v33 = objc_msgSend_copy(v20, v31, v32);
    id handlerBlock = v22->_handlerBlock;
    v22->_id handlerBlock = (id)v33;
  }

  return v22;
}

- (NSString)channelIdentifier
{
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_peerProtocolName(self, v5, v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = @"*";
  if (v4) {
    v10 = v4;
  }
  else {
    v10 = @"*";
  }
  if (v8) {
    v9 = v8;
  }
  objc_msgSend_stringWithFormat_(NSString, v7, (uint64_t)@"%@:%@:%@", @"dtxproxy", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)matchesPublishedProtocolName:(id)a3 peerProtocolName:(id)a4
{
  uint64_t v6 = (uint64_t)a4;
  id v7 = a3;
  objc_msgSend_publishedProtocolName(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  int isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)v7);

  if (isEqualToString)
  {
    uint64_t v17 = objc_msgSend_peerProtocolName(self, v13, v14);
    if (v6 | v17)
    {
      objc_msgSend_peerProtocolName(self, v15, v16);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      char v18 = objc_msgSend_isEqualToString_(v19, v20, v6);
    }

    else
    {
      char v18 = 1;
    }
  }

  else
  {
    char v18 = 0;
  }

  return v18;
}

- (Protocol)publishedProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)publishedProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (Protocol)peerProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)peerProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (id)handlerBlock
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

@end