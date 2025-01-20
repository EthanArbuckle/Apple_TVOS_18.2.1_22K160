@interface NSComplexOrthography
+ (void)initialize;
- (NSComplexOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4;
- (id)dominantScript;
- (id)languageMap;
- (unsigned)orthographyFlags;
- (void)dealloc;
@end

@implementation NSComplexOrthography

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    [a1 setVersion:1];
  }
}

- (NSComplexOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v11 = objc_opt_class();
    v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid script=nil in -[%@ %s]",  v11,  sel_getName(a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v12 userInfo:0]);
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSComplexOrthography;
  id v7 = -[NSComplexOrthography init](&v13, sel_init);
  if (v7)
  {
    *((void *)v7 + 1) = [a3 copy];
    v8 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:a4];
    *((void *)v7 + 2) = v8;
    *((_DWORD *)v7 + 6) = NSOrthographyFlagsForDominantScriptAndLanguageMap(*((void *)v7 + 1), v8);
  }

  return (NSComplexOrthography *)v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSComplexOrthography;
  -[NSComplexOrthography dealloc](&v3, sel_dealloc);
}

- (id)dominantScript
{
  return self->_dominantScript;
}

- (id)languageMap
{
  return self->_languageMap;
}

- (unsigned)orthographyFlags
{
  return self->_orthographyFlags;
}

@end