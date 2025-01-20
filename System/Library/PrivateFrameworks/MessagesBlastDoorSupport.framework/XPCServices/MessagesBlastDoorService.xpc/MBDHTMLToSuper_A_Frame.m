@interface MBDHTMLToSuper_A_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_A_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_A_Frame;
  id v15 = a8;
  -[MBDToSuperParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( &v21,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  a3,  v14,  a5,  a6,  a7,  v15);
  v16 = MBDIMCopyNormalizedAttributes(v15, 1, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", @"href"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", @"isrichlink"));
  if (v17)
  {
    v19 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v17);
    if (v19)
    {
      [v14 pushLink:v19];
      *(&self->super.super._didPushMessagePartNumber + 1) = 1;
    }
  }

  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v18 BOOLValue]));
    [v14 pushIsRichLink:v20];
    *(&self->super.super._didPushMessagePartNumber + 2) = 1;
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  id v12 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_A_Frame;
  -[MBDToSuperParserFrame parser:context:didEndElement:namespaceURI:qualifiedName:]( &v13,  "parser:context:didEndElement:namespaceURI:qualifiedName:",  a3,  v12,  a5,  a6,  a7);
  if (*(&self->super.super._didPushMessagePartNumber + 1)) {
    [v12 popLink];
  }
  if (*(&self->super.super._didPushMessagePartNumber + 2)) {
    [v12 popIsRichLink];
  }
}

@end