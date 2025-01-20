@interface MBDHTMLToSuper_I_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_I_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_I_Frame;
  id v13 = a4;
  -[MBDToSuperParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( &v14,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  a3,  v13,  a5,  a6,  a7,  a8);
  [v13 pushTextItalicAttribute];
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_I_Frame;
  id v11 = a4;
  -[MBDToSuperParserFrame parser:context:didEndElement:namespaceURI:qualifiedName:]( &v12,  "parser:context:didEndElement:namespaceURI:qualifiedName:",  a3,  v11,  a5,  a6,  a7);
  [v11 popTextItalicAttribute];
}

@end