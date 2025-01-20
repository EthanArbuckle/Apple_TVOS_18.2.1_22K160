@interface MBDHTMLToSuper_FONT_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_FONT_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_FONT_Frame;
  id v15 = a8;
  -[MBDToSuperParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( &v18,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  a3,  v14,  a5,  a6,  a7,  v15);
  v16 = MBDIMCopyNormalizedAttributes(v15, 1, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", @"face"));
  if (v17)
  {
    [v14 pushFontFamily:v17];
    *(&self->super.super._didPushMessagePartNumber + 1) = 1;
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  id v12 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_FONT_Frame;
  -[MBDToSuperParserFrame parser:context:didEndElement:namespaceURI:qualifiedName:]( &v13,  "parser:context:didEndElement:namespaceURI:qualifiedName:",  a3,  v12,  a5,  a6,  a7);
  if (*(&self->super.super._didPushMessagePartNumber + 1)) {
    [v12 popFontFamily];
  }
  if (*(&self->super.super._didPushMessagePartNumber + 2)) {
    [v12 popFontSize];
  }
}

@end