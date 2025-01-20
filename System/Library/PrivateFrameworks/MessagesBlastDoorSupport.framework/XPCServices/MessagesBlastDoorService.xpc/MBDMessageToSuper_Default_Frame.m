@interface MBDMessageToSuper_Default_Frame
- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5;
@end

@implementation MBDMessageToSuper_Default_Frame

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByRemovingCharactersFromSet:v11]);

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MBDMessageToSuper_Default_Frame;
  -[MBDToSuperParserFrame parser:context:foundCharacters:](&v13, "parser:context:foundCharacters:", v10, v9, v12);
}

@end