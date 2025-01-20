@interface _NSAttributedStringFromMarkdownCreatorConcrete
- (_NSAttributedStringFromMarkdownCreatorConcrete)init;
- (id)parseExtendedAttributesFromData:(id)a3 error:(id *)a4;
- (id)result;
- (unsigned)lastCharacter;
- (void)appendString:(id)a3;
- (void)appendString:(id)a3 with:(id)a4;
- (void)dealloc;
- (void)finalizeWithLanguageIdentifier:(id)a3;
@end

@implementation _NSAttributedStringFromMarkdownCreatorConcrete

- (_NSAttributedStringFromMarkdownCreatorConcrete)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSAttributedStringFromMarkdownCreatorConcrete;
  v2 = -[_NSAttributedStringFromMarkdownCreatorConcrete init](&v4, sel_init);
  if (v2) {
    v2->_result = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSAttributedStringFromMarkdownCreatorConcrete;
  -[_NSAttributedStringFromMarkdownCreatorConcrete dealloc](&v3, sel_dealloc);
}

- (id)result
{
  return self->_result;
}

- (void)appendString:(id)a3 with:(id)a4
{
  uint64_t v5 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  a3,  a4);
  -[NSMutableAttributedString appendAttributedString:](self->_result, "appendAttributedString:", v5);
}

- (unsigned)lastCharacter
{
  NSUInteger v3 = -[NSAttributedString length](self->_result, "length");
  if (v3) {
    LOWORD(v3) = -[NSString characterAtIndex:]( -[NSAttributedString string](self->_result, "string"),  "characterAtIndex:",  -[NSAttributedString length](self->_result, "length") - 1);
  }
  return v3;
}

- (void)appendString:(id)a3
{
}

- (id)parseExtendedAttributesFromData:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  id v5 = +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  24LL,  &v13);
  if (v5)
  {
    v6 = v5;
    if (_NSIsNSDictionary())
    {
      id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __attributesFromKnownAttributeKeys_block_invoke;
      v14[3] = &unk_189CA15A8;
      v14[4] = v7;
      [v6 enumerateKeysAndObjectsUsingBlock:v14];
      return v7;
    }

    if (a4)
    {
      v15 = @"NSDebugDescription";
      v16 = @"JSON result was not a dictionary";
      v9 = (void *)MEMORY[0x189603F68];
      v10 = &v16;
      v11 = &v15;
      goto LABEL_8;
    }
  }

  else if (a4)
  {
    v17 = @"NSUnderlyingError";
    v18[0] = v13;
    v9 = (void *)MEMORY[0x189603F68];
    v10 = (const __CFString **)v18;
    v11 = &v17;
LABEL_8:
    v12 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  259,  [v9 dictionaryWithObjects:v10 forKeys:v11 count:1]);
    id result = 0LL;
    *a4 = v12;
    return result;
  }

  return 0LL;
}

- (void)finalizeWithLanguageIdentifier:(id)a3
{
  v7[6] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    id result = self->_result;
    uint64_t v6 = -[NSAttributedString length](result, "length");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __81___NSAttributedStringFromMarkdownCreatorConcrete_finalizeWithLanguageIdentifier___block_invoke;
    v7[3] = &unk_189CA1580;
    v7[4] = self;
    v7[5] = a3;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:]( result,  "enumerateAttribute:inRange:options:usingBlock:",  @"NSLanguage",  0LL,  v6,  0x100000LL,  v7);
  }

@end