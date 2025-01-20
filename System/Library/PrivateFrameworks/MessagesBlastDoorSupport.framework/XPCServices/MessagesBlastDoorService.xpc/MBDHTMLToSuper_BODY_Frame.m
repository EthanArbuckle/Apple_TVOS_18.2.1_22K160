@interface MBDHTMLToSuper_BODY_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_BODY_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_BODY_Frame;
  id v15 = a8;
  -[MBDToSuperParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( &v20,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  a3,  v14,  a5,  a6,  a7,  v15);
  v16 = MBDIMCopyNormalizedAttributes(v15, 1, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", @"dir"));
  v18 = v17;
  if (!v17)
  {
LABEL_4:
    uint64_t v19 = -1LL;
    goto LABEL_6;
  }

  uint64_t v19 = 1LL;
  if ([v17 rangeOfString:@"rtl" options:1] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v18 rangeOfString:@"ltr" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v19 = 0LL;
      goto LABEL_6;
    }

    goto LABEL_4;
  }

@end