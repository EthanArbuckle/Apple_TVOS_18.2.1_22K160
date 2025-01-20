@interface RMIProgramDelegate
- (BOOL)parseGlobalOptions:(id)a3;
- (void)registerGlobalOptions;
@end

@implementation RMIProgramDelegate

- (void)registerGlobalOptions
{
}

- (BOOL)parseGlobalOptions:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 dictionaryWithOptionsAndValues]);
  +[CLIProgram handleFormatOptionInDictionary:](&OBJC_CLASS___CLIProgram, "handleFormatOptionInDictionary:", v3);

  return 1;
}

@end