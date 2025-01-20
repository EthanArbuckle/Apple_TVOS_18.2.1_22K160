@interface NSSimpleOrthography
+ (BOOL)supportsSecureCoding;
+ (id)orthographyWithFlags:(unsigned int)a3;
+ (void)initialize;
- (Class)classForCoder;
- (NSSimpleOrthography)initWithCoder:(id)a3;
- (NSSimpleOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4;
- (NSSimpleOrthography)initWithFlags:(unsigned int)a3;
- (id)allLanguages;
- (id)allScripts;
- (id)dominantLanguage;
- (id)dominantLanguageForScript:(id)a3;
- (id)dominantScript;
- (id)languageMap;
- (id)languagesForScript:(id)a3;
- (unsigned)orthographyFlags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSimpleOrthography

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    [a1 setVersion:1];
  }
}

+ (id)orthographyWithFlags:(unsigned int)a3
{
  return (id)[objc_allocWithZone((Class)a1) initWithFlags:*(void *)&a3];
}

- (NSSimpleOrthography)initWithFlags:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v7 = objc_opt_class();
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid orthographyFlags=0 in -[%@ %s]",  v7,  sel_getName(a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v8 userInfo:0]);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSimpleOrthography;
  result = -[NSSimpleOrthography init](&v9, sel_init);
  if (result) {
    result->_orthographyFlags = a3;
  }
  return result;
}

- (NSSimpleOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4
{
  if (a3) {
    return -[NSSimpleOrthography initWithFlags:]( self,  "initWithFlags:",  NSOrthographyFlagsForDominantScriptAndLanguageMap((uint64_t)a3, a4));
  }
  uint64_t v7 = objc_opt_class();
  v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid script=nil in -[%@ %s]",  v7,  sel_getName(a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v8 userInfo:0]);
  return (NSSimpleOrthography *)-[NSSimpleOrthography classForCoder](v9, v10);
}

- (Class)classForCoder
{
  return (Class)&OBJC_CLASS___NSSimpleOrthography;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v4 = -[NSSimpleOrthography orthographyFlags](self, "orthographyFlags");
  int v5 = v4;
  if ([a3 allowsKeyedCoding]) {
    [a3 encodeInt32:v4 forKey:@"NSOrthographyFlags"];
  }
  else {
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "I", &v5);
  }
}

- (NSSimpleOrthography)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unsigned int v11 = 0;
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [a3 decodeInt32ForKey:@"NSOrthographyFlags"];
    unsigned int v11 = v6;
    return -[NSSimpleOrthography initWithFlags:](self, "initWithFlags:", v6);
  }

  uint64_t v7 = [a3 versionForClassName:@"NSSimpleOrthography"];
  if (v7 == 1)
  {
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "I", &v11);
    uint64_t v6 = v11;
    return -[NSSimpleOrthography initWithFlags:](self, "initWithFlags:", v6);
  }

  uint64_t v9 = v7;
  SEL v10 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v10, 1LL, v9);
  -[NSSimpleOrthography dealloc](self, "dealloc");
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dominantScript
{
  uint64_t v2 = -[NSSimpleOrthography orthographyFlags](self, "orthographyFlags") >> 27;
  if (!(_DWORD)v2) {
    return 0LL;
  }
  if (v2 == 1) {
    return @"Zyyy";
  }
  return (id)objc_msgSend(&unk_189D1ED50, "objectAtIndex:");
}

- (id)languageMap
{
  return NSOrthographyLanguageMapForFlags(-[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"));
}

- (unsigned)orthographyFlags
{
  return self->_orthographyFlags;
}

- (id)languagesForScript:(id)a3
{
  id result = (id)NSOrthographyDominantLanguageForFlagsAndScriptIndex( -[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"),  [&unk_189D1EBE8 indexOfObject:a3]);
  if (result) {
    return (id)[MEMORY[0x189603F18] arrayWithObject:result];
  }
  return result;
}

- (id)dominantLanguageForScript:(id)a3
{
  return (id)NSOrthographyDominantLanguageForFlagsAndScriptIndex( -[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"),  [&unk_189D1EBE8 indexOfObject:a3]);
}

- (id)dominantLanguage
{
  unsigned int v2 = -[NSSimpleOrthography orthographyFlags](self, "orthographyFlags");
  return (id)NSOrthographyDominantLanguageForFlagsAndScriptIndex(v2, v2 >> 27);
}

- (id)allScripts
{
  return NSOrthographyAllScriptsForFlags(-[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"));
}

- (id)allLanguages
{
  return NSOrthographyAllLanguagesForFlags(-[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"));
}

@end