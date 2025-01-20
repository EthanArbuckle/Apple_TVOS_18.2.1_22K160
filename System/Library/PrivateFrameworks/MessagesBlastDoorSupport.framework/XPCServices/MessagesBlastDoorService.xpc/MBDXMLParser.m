@interface MBDXMLParser
+ (id)sharedInstance;
- (BOOL)parseContext:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 foundIgnorableWhitespace:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
@end

@implementation MBDXMLParser

+ (id)sharedInstance
{
  if (qword_1000B17B8 != -1) {
    dispatch_once(&qword_1000B17B8, &stru_1000A2DF0);
  }
  return (id)qword_1000B17B0;
}

- (BOOL)parseContext:(id)a3
{
  id v5 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000B7E0;
  v19[3] = &unk_1000A2E18;
  v19[4] = self;
  v6 = objc_retainBlock(v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000B888;
  v18[3] = &unk_1000A2E40;
  v18[4] = self;
  v7 = objc_retainBlock(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 inContentAsData]);
  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  Mutable = (const __CFDictionary *)qword_1000B17C0;
  if (!qword_1000B17C0)
  {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, 0LL);
    qword_1000B17C0 = (uint64_t)Mutable;
  }

  Value = (__CFDictionary *)CFDictionaryGetValue(Mutable, v10);
  self->_framespace = Value;
  if (!Value)
  {
    v13 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, 0LL);
    self->_framespace = v13;
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000B17C0, v10, v13);
  }

  char v14 = ((uint64_t (*)(void *, void *))v6[2])(v6, v8);
  if ((v14 & 1) == 0)
  {
    v15 = os_log_create("com.apple.Messages.blastdoor", "IMXMLParser");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100082584(v15);
    }
  }

  ((void (*)(void *))v7[2])(v7);
  v16 = *p_context;
  *p_context = 0LL;

  return v14;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v28 = a3;
  v12 = (__CFString *)a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  context = objc_autoreleasePoolPush();
  framespace = self->_framespace;
  v17 = self->_context;
  MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, v12);
  CFStringUppercase(MutableCopy, 0LL);
  Value = (void *)CFDictionaryGetValue(framespace, MutableCopy);
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472LL;
  v31 = sub_10000BE44;
  v32 = &unk_1000A2E68;
  v20 = v17;
  v33 = v20;
  v21 = objc_retainBlock(&v29);
  v22 = v21;
  if (!Value)
  {
    Value = (void *)((uint64_t (*)(void ***, __CFString *))v21[2])(v21, MutableCopy);
    if (!Value)
    {
      Value = (void *)((uint64_t (*)(void ***, const __CFString *))v22[2])(v22, @"Default");
      if (!Value) {
        Value = (void *)objc_opt_class(&OBJC_CLASS___MBDXMLParserFrame);
      }
    }

    CFDictionarySetValue(framespace, MutableCopy, Value);
  }

  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  v23 = Value;

  v24 = (MBDXMLParserFrame *)objc_alloc_init(v23);
  if (self->_topFrame) {
    -[NSMutableArray addObject:](self->_otherFrames, "addObject:", context, v28, v29, v30, v31, v32);
  }
  topFrame = self->_topFrame;
  self->_topFrame = v24;
  v26 = v24;

  -[MBDXMLParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( v26,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  self,  self->_context,  v12,  v13,  v14,  v15);
  objc_autoreleasePoolPop(context);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_autoreleasePoolPush();
  -[MBDXMLParserFrame parser:context:didEndElement:namespaceURI:qualifiedName:]( self->_topFrame,  "parser:context:didEndElement:namespaceURI:qualifiedName:",  self,  self->_context,  v10,  v11,  v12);
  id v14 = (MBDXMLParserFrame *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_otherFrames, "lastObject"));
  topFrame = self->_topFrame;
  self->_topFrame = v14;

  if (self->_topFrame) {
    -[NSMutableArray removeLastObject](self->_otherFrames, "removeLastObject");
  }
  objc_autoreleasePoolPop(v13);
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = objc_autoreleasePoolPush();
  -[MBDXMLParserFrame parser:context:foundCharacters:]( self->_topFrame,  "parser:context:foundCharacters:",  self,  self->_context,  v6);
  objc_autoreleasePoolPop(v7);
}

- (void)parser:(id)a3 foundIgnorableWhitespace:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = objc_autoreleasePoolPush();
  -[MBDXMLParserFrame parser:context:foundIgnorableWhitespace:]( self->_topFrame,  "parser:context:foundIgnorableWhitespace:",  self,  self->_context,  v6);
  objc_autoreleasePoolPop(v7);
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
}

- (void).cxx_destruct
{
}

@end