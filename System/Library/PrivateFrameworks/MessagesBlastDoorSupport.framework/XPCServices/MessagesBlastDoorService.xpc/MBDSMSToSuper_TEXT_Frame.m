@interface MBDSMSToSuper_TEXT_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5;
@end

@implementation MBDSMSToSuper_TEXT_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v16 = a4;
  v9 = MBDIMCopyNormalizedAttributes(a8, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v16 orderedParts]);
  v11 = (SMSPart *)objc_claimAutoreleasedReturnValue([v10 lastObject]);

  if (!v11)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___SMSPart);
    [v16 _addPart:v11];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", @"src"));
  id v13 = SMSCopySanitizedContentLocation(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = -[SMSTextPart initWithContentLocation:](objc_alloc(&OBJC_CLASS___SMSTextPart), "initWithContentLocation:", v14);
  -[SMSPart addTextPart:](v11, "addTextPart:", v15);
}

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 orderedParts]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastObject]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 textParts]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastObject]);

  if (v14)
  {
    [v14 appendText:v10];
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___MBDSMSToSuper_TEXT_Frame;
    -[MBDSMSToSuper_Default_Frame parser:context:foundCharacters:](&v15, "parser:context:foundCharacters:", v8, v9, v10);
  }
}

@end