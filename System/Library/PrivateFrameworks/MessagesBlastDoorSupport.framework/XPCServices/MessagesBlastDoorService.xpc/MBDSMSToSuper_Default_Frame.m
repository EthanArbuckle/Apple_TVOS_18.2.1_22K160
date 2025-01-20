@interface MBDSMSToSuper_Default_Frame
- (void)_addAttachmentPartWithSource:(id)a3 toContext:(id)a4;
- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5;
@end

@implementation MBDSMSToSuper_Default_Frame

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByRemovingCharactersFromSet:v11]);

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MBDSMSToSuper_Default_Frame;
  -[MBDToSuperParserFrame parser:context:foundCharacters:](&v13, "parser:context:foundCharacters:", v10, v9, v12);
}

- (void)_addAttachmentPartWithSource:(id)a3 toContext:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 orderedParts]);
  v7 = (SMSPart *)objc_claimAutoreleasedReturnValue([v6 lastObject]);

  if (!v7)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___SMSPart);
    [v5 _addPart:v7];
  }

  id v8 = SMSCopySanitizedContentLocation(v11);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = -[SMSAttachmentPart initWithContentLocation:]( objc_alloc(&OBJC_CLASS___SMSAttachmentPart),  "initWithContentLocation:",  v9);
  -[SMSPart addAttachmentPart:](v7, "addAttachmentPart:", v10);
}

@end