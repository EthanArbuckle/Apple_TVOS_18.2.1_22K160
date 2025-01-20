@interface NSAttributedStringMarkdownParsingOptions
+ (id)_localizedAttributedStringParsingOptions;
+ (id)allowingExtendedAttributes;
- (BOOL)allowsExtendedAttributes;
- (BOOL)appliesSourcePositionAttributes;
- (BOOL)isEqual:(id)a3;
- (NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax;
- (NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy;
- (NSAttributedStringMarkdownParsingOptions)init;
- (NSString)languageCode;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAllowsExtendedAttributes:(BOOL)allowsExtendedAttributes;
- (void)setAppliesSourcePositionAttributes:(BOOL)appliesSourcePositionAttributes;
- (void)setFailurePolicy:(NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy;
- (void)setInterpretedSyntax:(NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax;
- (void)setLanguageCode:(NSString *)languageCode;
@end

@implementation NSAttributedStringMarkdownParsingOptions

+ (id)_localizedAttributedStringParsingOptions
{
  if (qword_18C496578 != -1) {
    dispatch_once(&qword_18C496578, &__block_literal_global_46);
  }
  return (id)qword_18C496570;
}

+ (id)allowingExtendedAttributes
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setAllowsExtendedAttributes:1];
  return v2;
}

- (NSAttributedStringMarkdownParsingOptions)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAttributedStringMarkdownParsingOptions;
  result = -[NSAttributedStringMarkdownParsingOptions init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_allowsExtendedAttributes = 0;
    result->_failurePolicy = 0LL;
    result->_languageCode = 0LL;
    result->_interpretedSyntax = 0LL;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAttributedStringMarkdownParsingOptions;
  -[NSAttributedStringMarkdownParsingOptions dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend( v4,  "setAllowsExtendedAttributes:",  -[NSAttributedStringMarkdownParsingOptions allowsExtendedAttributes](self, "allowsExtendedAttributes"));
  objc_msgSend( v4,  "setInterpretedSyntax:",  -[NSAttributedStringMarkdownParsingOptions interpretedSyntax](self, "interpretedSyntax"));
  objc_msgSend( v4,  "setFailurePolicy:",  -[NSAttributedStringMarkdownParsingOptions failurePolicy](self, "failurePolicy"));
  objc_msgSend(v4, "setLanguageCode:", -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode"));
  objc_msgSend( v4,  "setAppliesSourcePositionAttributes:",  -[NSAttributedStringMarkdownParsingOptions appliesSourcePositionAttributes](self, "appliesSourcePositionAttributes"));
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  uint64_t v4 = -[NSAttributedStringMarkdownParsingOptions allowsExtendedAttributes](self, "allowsExtendedAttributes");
  uint64_t v5 = v3 ^ -[NSAttributedStringMarkdownParsingOptions interpretedSyntax](self, "interpretedSyntax") ^ v4;
  NSAttributedStringMarkdownParsingFailurePolicy v6 = -[NSAttributedStringMarkdownParsingOptions failurePolicy](self, "failurePolicy");
  NSUInteger v7 = v6 ^ -[NSString hash](-[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode"), "hash");
  return v5 ^ v7 ^ -[NSAttributedStringMarkdownParsingOptions appliesSourcePositionAttributes]( self,  "appliesSourcePositionAttributes");
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [a3 allowsExtendedAttributes],
        v5 == -[NSAttributedStringMarkdownParsingOptions allowsExtendedAttributes](self, "allowsExtendedAttributes"))
    && (uint64_t v6 = [a3 interpretedSyntax],
        v6 == -[NSAttributedStringMarkdownParsingOptions interpretedSyntax](self, "interpretedSyntax"))
    && (uint64_t v7 = [a3 failurePolicy],
        v7 == -[NSAttributedStringMarkdownParsingOptions failurePolicy](self, "failurePolicy")))
  {
    v8 = (NSString *)[a3 languageCode];
    if (v8 == -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode")
      || (v9 = -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode")) != 0LL
      && (LODWORD(v9) = objc_msgSend( (id)objc_msgSend(a3, "languageCode"),  "isEqual:",  -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode")),  (_DWORD)v9))
    {
      char v10 = [a3 appliesSourcePositionAttributes];
      LOBYTE(v9) = v10 ^ -[NSAttributedStringMarkdownParsingOptions appliesSourcePositionAttributes]( self,  "appliesSourcePositionAttributes") ^ 1;
    }
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (BOOL)allowsExtendedAttributes
{
  return self->_allowsExtendedAttributes;
}

- (void)setAllowsExtendedAttributes:(BOOL)allowsExtendedAttributes
{
  self->_allowsExtendedAttributes = allowsExtendedAttributes;
}

- (NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax
{
  return self->_interpretedSyntax;
}

- (void)setInterpretedSyntax:(NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax
{
  self->_interpretedSyntax = interpretedSyntax;
}

- (NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy
{
  return self->_failurePolicy;
}

- (void)setFailurePolicy:(NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy
{
  self->_failurePolicy = failurePolicy;
}

- (NSString)languageCode
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLanguageCode:(NSString *)languageCode
{
}

- (BOOL)appliesSourcePositionAttributes
{
  return self->_appliesSourcePositionAttributes;
}

- (void)setAppliesSourcePositionAttributes:(BOOL)appliesSourcePositionAttributes
{
  self->_appliesSourcePositionAttributes = appliesSourcePositionAttributes;
}

@end