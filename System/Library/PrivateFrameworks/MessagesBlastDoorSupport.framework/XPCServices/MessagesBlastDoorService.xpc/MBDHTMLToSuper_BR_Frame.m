@interface MBDHTMLToSuper_BR_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_BR_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_BR_Frame;
  id v13 = a4;
  -[MBDToSuperParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( &v14,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  a3,  v13,  a5,  a6,  a7,  a8);
  [v13 appendString:@"\n"];
}

@end