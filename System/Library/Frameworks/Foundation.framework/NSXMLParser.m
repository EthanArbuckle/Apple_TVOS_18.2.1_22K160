@interface NSXMLParser
+ (id)currentParser;
+ (void)setCurrentParser:(id)a3;
- (BOOL)_handleParseResult:(int64_t)a3;
- (BOOL)finishIncrementalParse;
- (BOOL)parseData:(id)a3;
- (BOOL)parseFromStream;
- (BOOL)shouldContinueAfterFatalError;
- (BOOL)shouldProcessNamespaces;
- (BOOL)shouldReportNamespacePrefixes;
- (BOOL)shouldResolveExternalEntities;
- (NSError)parserError;
- (NSInteger)columnNumber;
- (NSInteger)lineNumber;
- (NSSet)allowedExternalEntityURLs;
- (NSString)publicID;
- (NSString)systemID;
- (NSXMLParser)initWithContentsOfURL:(NSURL *)url;
- (NSXMLParser)initWithData:(NSData *)data;
- (NSXMLParser)initWithStream:(NSInputStream *)stream;
- (NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy;
- (_xmlParserInput)_xmlExternalEntityWithURL:(const char *)a3 identifier:(const char *)a4 context:(_xmlParserCtxt *)a5 originalLoaderFunction:(void *)a6;
- (id)delegate;
- (id)initForIncrementalParsing;
- (void)_initializeSAX2Callbacks;
- (void)_popNamespaces;
- (void)_pushNamespaces:(id)a3;
- (void)_setExpandedParserError:(id)a3;
- (void)_setParserError:(int64_t)a3;
- (void)abortParsing;
- (void)dealloc;
- (void)setAllowedExternalEntityURLs:(NSSet *)allowedExternalEntityURLs;
- (void)setDelegate:(id)delegate;
- (void)setExternalEntityResolvingPolicy:(NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy;
- (void)setShouldContinueAfterFatalError:(BOOL)a3;
- (void)setShouldProcessNamespaces:(BOOL)shouldProcessNamespaces;
- (void)setShouldReportNamespacePrefixes:(BOOL)shouldReportNamespacePrefixes;
- (void)setShouldResolveExternalEntities:(BOOL)shouldResolveExternalEntities;
@end

@implementation NSXMLParser

- (NSXMLParser)initWithContentsOfURL:(NSURL *)url
{
  if (-[NSXMLParser isMemberOfClass:](self, "isMemberOfClass:", &OBJC_CLASS___NSXMLParser)
    && -[NSURL isFileURL](url, "isFileURL"))
  {
    v5 = (void *)[objc_alloc(MEMORY[0x189603F80]) initWithURL:url];
    v6 = -[NSXMLParser initWithStream:](self, "initWithStream:", v5);
  }

  else
  {
    uint64_t v7 = [MEMORY[0x189603F48] dataWithContentsOfURL:url];
    if (!v7) {
      uint64_t v7 = [MEMORY[0x189603F48] data];
    }
    v6 = -[NSXMLParser initWithData:](self, "initWithData:", v7);
  }

  v6->_url = url;
  return v6;
}

- (NSXMLParser)initWithData:(NSData *)data
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (_NSSetupLibXML_xmlInitGuard != -1) {
    dispatch_once(&_NSSetupLibXML_xmlInitGuard, &__block_literal_global_56);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSXMLParser;
  v5 = -[NSXMLParser init](&v8, sel_init);
  if (v5)
  {
    v5->_saxHandler = (_xmlSAXHandler *)malloc(0x100uLL);
    v5->_parserContext = 0LL;
    v5->_parserFlags = 0LL;
    v5->_error = 0LL;
    memset(&keyCallBacks, 0, 32);
    *(_OWORD *)&keyCallBacks.equal = xmmword_189CA1630;
    v5->_slowStringMap = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  &keyCallBacks,  MEMORY[0x189605250]);
    -[NSXMLParser _initializeSAX2Callbacks](v5, "_initializeSAX2Callbacks");
    v5->_parserFlags |= 0xC0uLL;
    v5->_namespaces = 0LL;
    if (data)
    {
      v5->xmlParserStream = (NSInputStream *)(id)[MEMORY[0x189603F80] inputStreamWithData:data];
      if (-[NSData length](data, "length") >> 20) {
        uint64_t v6 = 0x100000LL;
      }
      else {
        uint64_t v6 = -[NSData length](data, "length");
      }
    }

    else
    {
      uint64_t v6 = 32LL * *MEMORY[0x1895FD590];
    }

    v5->_chunkSize = v6;
  }

  return v5;
}

- (id)initForIncrementalParsing
{
  id result = -[NSXMLParser initWithData:](self, "initWithData:", 0LL);
  if (result) {
    *((void *)result + 5) &= ~0x80uLL;
  }
  return result;
}

- (NSXMLParser)initWithStream:(NSInputStream *)stream
{
  v4 = -[NSXMLParser initForIncrementalParsing](self, "initForIncrementalParsing");
  v5 = v4;
  if (v4)
  {
    v4->_parserFlags |= 0x80uLL;
    v4->xmlParserStream = stream;
  }

  return v5;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = delegate;
  char v4 = objc_opt_respondsToSelector();
  unint64_t v5 = 0xFFFFFFFF80000000LL;
  if ((v4 & 1) == 0) {
    unint64_t v5 = 0LL;
  }
  self->_parserFlags = v5 & 0xFFFFFFFF80000000LL | self->_parserFlags & 0x7FFFFFFF;
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = 0x40000000LL;
  if ((v6 & 1) == 0) {
    uint64_t v7 = 0LL;
  }
  self->_parserFlags = self->_parserFlags & 0xFFFFFFFFBFFFFFFFLL | v7;
  char v8 = objc_opt_respondsToSelector();
  uint64_t v9 = 0x20000000LL;
  if ((v8 & 1) == 0) {
    uint64_t v9 = 0LL;
  }
  self->_parserFlags = self->_parserFlags & 0xFFFFFFFFDFFFFFFFLL | v9;
}

- (void)setShouldProcessNamespaces:(BOOL)shouldProcessNamespaces
{
  if (!self->_parserContext)
  {
    uint64_t v3 = 4LL;
    if (!shouldProcessNamespaces) {
      uint64_t v3 = 0LL;
    }
    self->_parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFFBLL | v3;
  }

- (void)setShouldReportNamespacePrefixes:(BOOL)shouldReportNamespacePrefixes
{
  if (!self->_parserContext)
  {
    uint64_t v3 = 8LL;
    if (!shouldReportNamespacePrefixes) {
      uint64_t v3 = 0LL;
    }
    self->_parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFF7LL | v3;
  }

- (void)setShouldResolveExternalEntities:(BOOL)shouldResolveExternalEntities
{
  if (!self->_parserContext)
  {
    uint64_t v3 = 16LL;
    if (!shouldResolveExternalEntities) {
      uint64_t v3 = 0LL;
    }
    self->_parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFEFLL | v3;
  }

- (NSSet)allowedExternalEntityURLs
{
  return self->_allowedEntityURLs;
}

- (void)setAllowedExternalEntityURLs:(NSSet *)allowedExternalEntityURLs
{
  allowedEntityURLs = self->_allowedEntityURLs;
  if (allowedEntityURLs != allowedExternalEntityURLs)
  {
    char v6 = allowedEntityURLs;
    self->_allowedEntityURLs = (NSSet *)-[NSSet copy](allowedExternalEntityURLs, "copy");
  }

- (void)setExternalEntityResolvingPolicy:(NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy
{
  self->_externalEntityResolvingPolicy = externalEntityResolvingPolicy;
}

- (NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy
{
  return self->_externalEntityResolvingPolicy;
}

- (_xmlParserInput)_xmlExternalEntityWithURL:(const char *)a3 identifier:(const char *)a4 context:(_xmlParserCtxt *)a5 originalLoaderFunction:(void *)a6
{
  NSXMLParserExternalEntityResolvingPolicy v10 = -[NSXMLParser externalEntityResolvingPolicy](self, "externalEntityResolvingPolicy");
  if (objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSXMLParserRestoreOldExternalEntityBehavior")) {
    uint64_t v11 = 3LL;
  }
  else {
    uint64_t v11 = v10;
  }
  v12 = -[NSXMLParser allowedExternalEntityURLs](self, "allowedExternalEntityURLs");
  if (!v12) {
    goto LABEL_13;
  }
  v13 = v12;
  v14 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", a3);
  v15 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v14];
  if (objc_msgSend((id)objc_msgSend(v15, "scheme"), "isEqualToString:", @"file"))
  {
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x189604030]), "initFileURLWithPath:", objc_msgSend(v15, "path"));

    v15 = (void *)v16;
  }

  if (!v15) {
    goto LABEL_13;
  }
  uint64_t v17 = -[NSSet member:](v13, "member:", v15);
  if (!v17 && v11 == 2)
  {
    url = self->_url;
    if (!url) {
      goto LABEL_28;
    }
    goto LABEL_18;
  }

  if (!v17)
  {
LABEL_13:
    if (!v11) {
      return 0LL;
    }
    if (v11 == 1) {
      return xmlNoNetExternalEntityLoader(a3, a4, a5);
    }
    if (v11 != 2) {
      return (_xmlParserInput *)((uint64_t (*)(const char *, const char *, _xmlParserCtxt *))a6)(a3, a4, a5);
    }
    url = self->_url;
    if (!url)
    {
      v15 = 0LL;
LABEL_28:

      return (_xmlParserInput *)((uint64_t (*)(const char *, const char *, _xmlParserCtxt *))a6)(a3, a4, a5);
    }

    v19 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", a3);
    v15 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v19];

    if (v15)
    {
LABEL_18:
      if (!objc_msgSend((id)objc_msgSend(v15, "host"), "isEqualToString:", -[NSURL host](url, "host"))
        || ([v15 port] || -[NSURL port](url, "port"))
        && (objc_msgSend((id)objc_msgSend(v15, "port"), "isEqualToNumber:", -[NSURL port](url, "port")) & 1) == 0)
      {
      }

      else
      {
        char v20 = objc_msgSend((id)objc_msgSend(v15, "scheme"), "isEqualToString:", -[NSURL scheme](url, "scheme"));

        if ((v20 & 1) != 0) {
          return (_xmlParserInput *)((uint64_t (*)(void, void, void))a6)(a3, a4, a5);
        }
      }

      return 0LL;
    }
  }

  return (_xmlParserInput *)((uint64_t (*)(void, void, void))a6)(a3, a4, a5);
}

+ (void)setCurrentParser:(id)a3
{
  char v4 = -[NSThread threadDictionary]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "threadDictionary");
  unint64_t v5 = v4;
  if (a3)
  {
    if (dyld_program_sdk_at_least()
      && -[NSMutableDictionary objectForKey:](v5, "objectForKey:", @"__CurrentNSXMLParser"))
    {
      char v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  @"NSXMLParser does not support reentrant parsing.");
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v6 userInfo:0]);
      +[NSXMLParser currentParser](v7, v8);
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:]( -[NSThread threadDictionary]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "threadDictionary"),  "setObject:forKey:",  a3,  @"__CurrentNSXMLParser");
    }
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", @"__CurrentNSXMLParser");
  }

+ (id)currentParser
{
  return (id)-[NSMutableDictionary objectForKey:]( -[NSThread threadDictionary]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "threadDictionary"),  "objectForKey:",  @"__CurrentNSXMLParser");
}

- (BOOL)shouldProcessNamespaces
{
  return (LOBYTE(self->_parserFlags) >> 2) & 1;
}

- (BOOL)shouldReportNamespacePrefixes
{
  return (LOBYTE(self->_parserFlags) >> 3) & 1;
}

- (BOOL)shouldResolveExternalEntities
{
  return (LOBYTE(self->_parserFlags) >> 4) & 1;
}

- (void)setShouldContinueAfterFatalError:(BOOL)a3
{
  if (!self->_parserContext)
  {
    uint64_t v3 = 32LL;
    if (!a3) {
      uint64_t v3 = 0LL;
    }
    self->_parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFDFLL | v3;
  }

- (BOOL)shouldContinueAfterFatalError
{
  return (LOBYTE(self->_parserFlags) >> 5) & 1;
}

- (BOOL)_handleParseResult:(int64_t)a3
{
  if (!a3) {
    return 1;
  }
  if (a3 != -1) {
    goto LABEL_7;
  }
  if (_CFExecutableLinkedOnOrAfter())
  {
    if (self->_delegateAborted)
    {
      unint64_t v5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSXMLParserErrorDomain",  512LL,  0LL);
      -[NSXMLParser _setExpandedParserError:](self, "_setExpandedParserError:", v5);
      -[NSXMLParser delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        objc_msgSend(-[NSXMLParser delegate](self, "delegate"), "parser:parseErrorOccurred:", self, v5);
      }
      return 0;
    }

- (BOOL)parseData:(id)a3
{
  if ((self->_parserFlags & 0x40) == 0)
  {
    char v20 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    Name = sel_getName(a2);
    v22 = (objc_class *)objc_opt_class();
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v20,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSXMLParser.m",  488LL,  @"%s should only be called on an incremental %@",  Name,  NSStringFromClass(v22));
  }

  xmlSetStructuredErrorFunc(self, (xmlStructuredErrorFunc)_structuredErrorFunc);
  if (self->_haveDetectedEncoding)
  {
    uint64_t v5 = xmlParseChunk(self->_parserContext, (const char *)[a3 bytes], objc_msgSend(a3, "length"), 0);
    if (self->_shouldStopXMLParser)
    {
      self->_shouldStopXMLParser = 0;
      xmlStopParser(self->_parserContext);
      if (v5 >= -1) {
        uint64_t v5 = -1LL;
      }
    }

    BOOL v6 = -[NSXMLParser _handleParseResult:](self, "_handleParseResult:", v5);
  }

  else
  {
    int v7 = -[NSData length](self->_bomChunk, "length");
    int v8 = [a3 length] + v7;
    bomChunk = self->_bomChunk;
    if (v8 > 3)
    {
      if (bomChunk)
      {
        id v11 = objc_alloc_init(MEMORY[0x189603FB8]);
        [v11 appendData:self->_bomChunk];
        [v11 appendData:a3];
      }

      else
      {
        id v11 = a3;
      }

      if (self->_delegate) {
        saxHandler = self->_saxHandler;
      }
      else {
        saxHandler = 0LL;
      }
      xmlParserCtxtPtr PushParserCtxt = xmlCreatePushParserCtxt(saxHandler, self, (const char *)[v11 bytes], 4, 0);
      self->_parserContext = PushParserCtxt;
      if (-[NSXMLParser shouldResolveExternalEntities](self, "shouldResolveExternalEntities")) {
        int v14 = 7;
      }
      else {
        int v14 = 3;
      }
      if (saxHandler) {
        int v15 = v14;
      }
      else {
        int v15 = v14 | 0x60;
      }
      xmlCtxtUseOptions(PushParserCtxt, v15);
      self->_haveDetectedEncoding = 1;

      self->_bomChunk = 0LL;
      if (v8 >= 5)
      {
        uint64_t v16 = [v11 bytes] + 4;
        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v16 length:(v8 - 4) freeWhenDone:0];
        -[NSXMLParser parseData:](self, "parseData:", v17);
      }
    }

    else if (bomChunk)
    {
      NSXMLParserExternalEntityResolvingPolicy v10 = (NSData *)objc_alloc_init(MEMORY[0x189603FB8]);
      -[NSData appendData:](v10, "appendData:", self->_bomChunk);
      -[NSData appendData:](v10, "appendData:", a3);

      self->_bomChunk = v10;
    }

    else
    {
      self->_bomChunk = (NSData *)a3;
    }

    BOOL v6 = 1;
  }

  xmlSetStructuredErrorFunc(0LL, 0LL);
  return v6;
}

- (BOOL)finishIncrementalParse
{
  return -[NSXMLParser _handleParseResult:](self, "_handleParseResult:", xmlParseChunk(self->_parserContext, 0LL, 0, 1));
}

- (BOOL)parseFromStream
{
  uint64_t v3 = self;
  +[NSXMLParser setCurrentParser:](&OBJC_CLASS___NSXMLParser, "setCurrentParser:", self);
  xmlParserStream = self->xmlParserStream;
  if (xmlParserStream)
  {
    -[NSInputStream open](xmlParserStream, "open");
    size_t chunkSize = self->_chunkSize;
    BOOL v6 = malloc(chunkSize);
    uint64_t v7 = -[NSInputStream read:maxLength:](self->xmlParserStream, "read:maxLength:", v6, chunkSize);
    if (v7 == -1)
    {
      BOOL v9 = 0;
    }

    else
    {
      while (v7 >= 1)
      {
        int v8 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v6 length:v7 freeWhenDone:0];
        -[NSXMLParser parseData:](self, "parseData:", v8);

        uint64_t v7 = -[NSInputStream read:maxLength:](self->xmlParserStream, "read:maxLength:", v6, chunkSize);
      }

      BOOL v9 = -[NSXMLParser finishIncrementalParse](self, "finishIncrementalParse");
    }

    free(v6);
    -[NSInputStream close](self->xmlParserStream, "close");
  }

  else
  {
    -[NSXMLParser _setExpandedParserError:]( self,  "_setExpandedParserError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  -1,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Could not open data stream",  @"NSXMLParserErrorMessage",  0)));
    BOOL v9 = 0;
  }

  +[NSXMLParser setCurrentParser:](&OBJC_CLASS___NSXMLParser, "setCurrentParser:", 0LL);

  return v9;
}

- (void)abortParsing
{
  parserContext = self->_parserContext;
  if (parserContext)
  {
    xmlStopParser(parserContext);
    self->_delegateAborted = 1;
  }

- (NSError)parserError
{
  return self->_error;
}

- (NSString)publicID
{
  return 0LL;
}

- (NSString)systemID
{
  return 0LL;
}

- (NSInteger)lineNumber
{
  NSInteger result = (NSInteger)self->_parserContext;
  if (result) {
    return xmlSAX2GetLineNumber((void *)result);
  }
  return result;
}

- (NSInteger)columnNumber
{
  NSInteger result = (NSInteger)self->_parserContext;
  if (result) {
    return xmlSAX2GetColumnNumber((void *)result);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t parserFlags = self->_parserFlags;

  free(self->_saxHandler);
  parserContext = self->_parserContext;
  if (parserContext)
  {
    if (parserContext->myDoc)
    {
      xmlFreeDoc(parserContext->myDoc);
      parserContext = self->_parserContext;
    }

    xmlFreeParserCtxt(parserContext);
  }

  slowStringMap = self->_slowStringMap;
  if (slowStringMap) {
    CFRelease(slowStringMap);
  }

  if ((parserFlags & 0x80) != 0) {
  v6.receiver = self;
  }
  v6.super_class = (Class)&OBJC_CLASS___NSXMLParser;
  -[NSXMLParser dealloc](&v6, sel_dealloc);
}

- (void)_setExpandedParserError:(id)a3
{
  error = self->_error;
  if (error) {
    objc_super v6 = error;
  }
  self->_error = (NSError *)a3;
}

- (void)_setParserError:(int64_t)a3
{
}

- (void)_pushNamespaces:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  namespaces = self->_namespaces;
  if (!namespaces)
  {
    namespaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    self->_namespaces = namespaces;
    if (a3) {
      goto LABEL_3;
    }
LABEL_13:
    -[NSMutableArray addObject:](namespaces, "addObject:", [MEMORY[0x189603FE8] null]);
    return;
  }

  if (!a3) {
    goto LABEL_13;
  }
LABEL_3:
  -[NSMutableArray addObject:](namespaces, "addObject:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend( self->_delegate,  "parser:didStartMappingPrefix:toURI:",  self,  *(void *)(*((void *)&v11 + 1) + 8 * v9),  objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v9)));
          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }

      while (v7);
    }
  }

- (void)_popNamespaces
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[NSMutableArray count](self->_namespaces, "count") - 1;
  char v4 = (void *)-[NSMutableArray objectAtIndex:](self->_namespaces, "objectAtIndex:", v3);
  if ((objc_msgSend(v4, "isEqual:", objc_msgSend(MEMORY[0x189603FE8], "null")) & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [self->_delegate parser:self didEndMappingPrefix:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
        }

        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
      }

      while (v6);
    }
  }

  -[NSMutableArray removeObjectAtIndex:](self->_namespaces, "removeObjectAtIndex:", v3);
}

- (void)_initializeSAX2Callbacks
{
  saxHandler = self->_saxHandler;
  *(_OWORD *)&saxHandler->internalSubset = 0u;
  *(_OWORD *)&saxHandler->hasInternalSubset = 0u;
  *(_OWORD *)&saxHandler->resolveEntity = 0u;
  *(_OWORD *)&saxHandler->entityDecl = 0u;
  *(_OWORD *)&saxHandler->attributeDecl = 0u;
  *(_OWORD *)&saxHandler->unparsedEntityDecl = 0u;
  *(_OWORD *)&saxHandler->startDocument = 0u;
  *(_OWORD *)&saxHandler->startElement = 0u;
  *(_OWORD *)&saxHandler->_private = 0u;
  *(_OWORD *)&saxHandler->endElementNs = 0u;
  *(_OWORD *)&saxHandler->getParameterEntity = 0u;
  *(_OWORD *)&saxHandler->externalSubset = 0u;
  *(_OWORD *)&saxHandler->comment = 0u;
  *(_OWORD *)&saxHandler->error = 0u;
  *(_OWORD *)&saxHandler->reference = 0u;
  *(_OWORD *)&saxHandler->ignorableWhitespace = 0u;
  saxHandler->internalSubset = (internalSubsetSAXFunc)_internalSubset2;
  saxHandler->isStandalone = (isStandaloneSAXFunc)_isStandalone;
  saxHandler->hasInternalSubset = (hasInternalSubsetSAXFunc)_hasInternalSubset2;
  saxHandler->hasExternalSubset = (hasExternalSubsetSAXFunc)_hasExternalSubset2;
  saxHandler->getEntity = (getEntitySAXFunc)_getEntity;
  saxHandler->entityDecl = (entityDeclSAXFunc)_entityDecl;
  saxHandler->notationDecl = (notationDeclSAXFunc)_notationDecl;
  saxHandler->attributeDecl = (attributeDeclSAXFunc)_attributeDecl;
  saxHandler->elementDecl = (elementDeclSAXFunc)_elementDecl;
  saxHandler->unparsedEntityDecl = (unparsedEntityDeclSAXFunc)_unparsedEntityDecl;
  saxHandler->setDocumentLocator = 0LL;
  saxHandler->startDocument = (startDocumentSAXFunc)_startDocument;
  saxHandler->endDocument = (endDocumentSAXFunc)_endDocument;
  saxHandler->startElement = 0LL;
  saxHandler->startElementNs = (startElementNsSAX2Func)_startElementNs;
  saxHandler->endElementNs = (endElementNsSAX2Func)_endElementNs;
  saxHandler->reference = 0LL;
  saxHandler->characters = (charactersSAXFunc)_characters;
  saxHandler->ignorableWhitespace = 0LL;
  saxHandler->processingInstruction = (processingInstructionSAXFunc)_processingInstruction;
  saxHandler->endElement = 0LL;
  saxHandler->comment = (commentSAXFunc)_comment;
  saxHandler->warning = 0LL;
  saxHandler->error = (errorSAXFunc)_errorCallback;
  saxHandler->fatalError = 0LL;
  saxHandler->cdataBlock = (cdataBlockSAXFunc)_cdataBlock;
  saxHandler->externalSubset = (externalSubsetSAXFunc)_externalSubset2;
  saxHandler->serror = 0LL;
  saxHandler->initialized = -554844497;
}

@end