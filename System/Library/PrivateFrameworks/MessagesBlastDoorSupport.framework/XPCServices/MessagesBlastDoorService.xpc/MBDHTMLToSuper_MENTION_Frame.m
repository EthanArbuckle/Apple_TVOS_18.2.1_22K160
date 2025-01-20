@interface MBDHTMLToSuper_MENTION_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_MENTION_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_MENTION_Frame;
  id v15 = a8;
  -[MBDToSuperParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( &v19,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  a3,  v14,  a5,  a6,  a7,  v15);
  v16 = MBDIMCopyNormalizedAttributes(v15, 1, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _stringForKey:](v16, "_stringForKey:", @"uri"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bd_stringByRemovingURLEscapes"));

  if ([v18 length]) {
    [v14 pushMentionAttributeWithURI:v18];
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_MENTION_Frame;
  id v11 = a4;
  -[MBDToSuperParserFrame parser:context:didEndElement:namespaceURI:qualifiedName:]( &v12,  "parser:context:didEndElement:namespaceURI:qualifiedName:",  a3,  v11,  a5,  a6,  a7);
  [v11 popMentionAttribute];
}

@end