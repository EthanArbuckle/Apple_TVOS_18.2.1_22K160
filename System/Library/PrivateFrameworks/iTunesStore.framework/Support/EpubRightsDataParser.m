@interface EpubRightsDataParser
- (EpubRightsDataParser)initWithXMLData:(id)a3;
- (NSData)sinfData;
- (void)dealloc;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation EpubRightsDataParser

- (EpubRightsDataParser)initWithXMLData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___EpubRightsDataParser;
  v4 = -[EpubRightsDataParser init](&v7, "init");
  if (v4)
  {
    v5 = -[NSXMLParser initWithData:](objc_alloc(&OBJC_CLASS___NSXMLParser), "initWithData:", a3);
    -[NSXMLParser setDelegate:](v5, "setDelegate:", v4);
    -[NSXMLParser parse](v5, "parse");
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___EpubRightsDataParser;
  -[EpubRightsDataParser dealloc](&v3, "dealloc");
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  self->_isSinfElement = [a4 isEqualToString:@"fairplay:sData"];
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  if (self->_isSinfElement)
  {
    buffer = self->_buffer;
    if (!buffer)
    {
      buffer = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      self->_buffer = buffer;
    }

    -[NSMutableString appendString:](buffer, "appendString:", a4);
  }

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (self->_isSinfElement)
  {
    self->_sinfData = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  self->_buffer,  0LL);
    self->_isSinfElement = 0;
  }

- (NSData)sinfData
{
  return self->_sinfData;
}

@end