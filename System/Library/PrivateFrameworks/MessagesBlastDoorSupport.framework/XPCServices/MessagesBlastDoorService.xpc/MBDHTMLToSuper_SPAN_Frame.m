@interface MBDHTMLToSuper_SPAN_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_SPAN_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_SPAN_Frame;
  id v15 = a8;
  -[MBDToSuperParserFrame parser:context:didStartElement:namespaceURI:qualifiedName:attributes:]( &v23,  "parser:context:didStartElement:namespaceURI:qualifiedName:attributes:",  a3,  v14,  a5,  a6,  a7,  v15);
  v16 = MBDIMCopyNormalizedAttributes(v15, 1, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", @"style"));
  v18 = MBDIMCreateDictionaryFromCSSString(v17, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v18, "objectForKey:", @"font-family"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v18, "objectForKey:", @"font-style"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v18, "objectForKey:", @"font-weight"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v18, "objectForKey:", @"text-decoration"));
  if (v19)
  {
    [v14 pushFontFamily:v19];
    *(&self->super.super._didPushMessagePartNumber + 1) = 1;
  }

  if (v21
    && ([v21 rangeOfString:@"bold" options:1] != (id)0x7FFFFFFFFFFFFFFFLL
     || (uint64_t)[v21 integerValue] >= 700))
  {
    [v14 incrementBoldCount];
    *(&self->super.super._didPushMessagePartNumber + 2) = 1;
  }

  if (v20
    && ([v20 rangeOfString:@"italic" options:1] != (id)0x7FFFFFFFFFFFFFFFLL
     || [v20 rangeOfString:@"oblique" options:1] != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [v14 incrementItalicCount];
    *(&self->super.super._didPushMessagePartNumber + 3) = 1;
  }

  if (v22)
  {
    if ([v22 rangeOfString:@"under" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v14 incrementUnderlineCount];
      *(&self->super.super._didPushMessagePartNumber + 4) = 1;
    }

    if ([v22 rangeOfString:@"line-through" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v14 incrementStrikethroughCount];
      *(&self->super.super._didPushMessagePartNumber + 5) = 1;
    }
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  id v12 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MBDHTMLToSuper_SPAN_Frame;
  -[MBDToSuperParserFrame parser:context:didEndElement:namespaceURI:qualifiedName:]( &v13,  "parser:context:didEndElement:namespaceURI:qualifiedName:",  a3,  v12,  a5,  a6,  a7);
  if (*(&self->super.super._didPushMessagePartNumber + 1)) {
    [v12 popFontFamily];
  }
  if (*(&self->super.super._didPushMessagePartNumber + 2)) {
    [v12 decrementBoldCount];
  }
  if (*(&self->super.super._didPushMessagePartNumber + 3)) {
    [v12 decrementItalicCount];
  }
  if (*(&self->super.super._didPushMessagePartNumber + 4)) {
    [v12 decrementUnderlineCount];
  }
  if (*(&self->super.super._didPushMessagePartNumber + 5)) {
    [v12 decrementStrikethroughCount];
  }
}

@end