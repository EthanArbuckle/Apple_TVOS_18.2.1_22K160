@interface MBDXMLParserContext
- (MBDXMLParserContext)initWithContent:(id)a3;
- (MBDXMLParserContext)initWithContentAsData:(id)a3;
- (NSArray)resultsForLogging;
- (NSData)inContentAsData;
- (NSString)name;
- (id)inContent;
@end

@implementation MBDXMLParserContext

- (MBDXMLParserContext)initWithContent:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  v5 = -[MBDXMLParserContext initWithContentAsData:](self, "initWithContentAsData:", v4);

  return v5;
}

- (MBDXMLParserContext)initWithContentAsData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MBDXMLParserContext;
  v6 = -[MBDXMLParserContext init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inContentAsData, a3);
    -[MBDXMLParserContext reset](v7, "reset");
  }

  return v7;
}

- (id)inContent
{
  return  -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  self->_inContentAsData,  4LL);
}

- (NSString)name
{
  return (NSString *)@"Base";
}

- (NSArray)resultsForLogging
{
  return 0LL;
}

- (NSData)inContentAsData
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end