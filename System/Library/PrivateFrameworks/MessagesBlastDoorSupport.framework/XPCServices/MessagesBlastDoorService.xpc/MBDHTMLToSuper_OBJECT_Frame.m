@interface MBDHTMLToSuper_OBJECT_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_OBJECT_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_OBJECT_Frame;
  -[MBDToSuperParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( &v19,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  a3,  v14,  a5,  a6,  a7,  v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"breadcrumbText"]);
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 _stringForKey:@"breadcrumbOptions"]);
    id v18 = [v17 unsignedIntValue];

    [v14 appendBreadcrumbText:v16 withOptions:v18];
  }
}

@end