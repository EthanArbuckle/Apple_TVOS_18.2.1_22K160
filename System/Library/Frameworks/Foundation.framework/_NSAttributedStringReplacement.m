@interface _NSAttributedStringReplacement
+ (id)_replacementsFromMetadataArray:(id)a3;
- (_NSAttributedStringReplacement)initWithIndex:(int64_t)a3 specifierRangeInFormatString:(_NSRange)a4 replacementRangeInResult:(_NSRange)a5 replacementKind:(int64_t)a6 argument:(id)a7;
- (_NSRange)replacementRangeInResult;
- (_NSRange)specifierRangeInFormatString;
- (id)_initWithMetadata:(id)a3;
- (id)argument;
- (int64_t)index;
- (int64_t)replacementKind;
- (void)dealloc;
@end

@implementation _NSAttributedStringReplacement

- (id)_initWithMetadata:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS____NSAttributedStringReplacement;
  v4 = -[_NSAttributedStringReplacement init](&v21, sel_init);
  if (v4)
  {
    v5 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x189604B38]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v5) {
      goto LABEL_24;
    }
    v4->_index = [v5 integerValue];
    uint64_t v6 = *MEMORY[0x189604B50];
    v7 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x189604B58]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v7 = 0LL;
    }
    v8 = (void *)[a3 objectForKeyedSubscript:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v8 = 0LL;
    }
    if (!v7 || v8 == 0LL)
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }

    else
    {
      uint64_t v10 = [v7 integerValue];
      uint64_t v11 = [v8 integerValue];
    }

    v4->_specifierRangeInFormatString.location = v10;
    v4->_specifierRangeInFormatString.length = v11;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_24;
    }
    uint64_t v12 = *MEMORY[0x189604B40];
    v13 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x189604B48]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v13 = 0LL;
    }
    uint64_t v14 = [a3 objectForKeyedSubscript:v12];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v15 = (void *)v14;
    }
    else {
      v15 = 0LL;
    }
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (v13 && v15)
    {
      uint64_t v16 = [v13 integerValue];
      uint64_t v17 = [v15 integerValue];
    }

    v4->_replacementRangeInResult.location = v16;
    v4->_replacementRangeInResult.length = v17;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4->_replacementKind = 2LL;
      v19 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x189604B30]];
      if (v19)
      {
        v4->_argument = v19;
        v4->_replacementKind = 0LL;
      }

      else
      {
        v20 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x189604B28]];
        if (v20)
        {
          v4->_argument = v20;
          v4->_replacementKind = 1LL;
        }
      }
    }

    else
    {
LABEL_24:

      return 0LL;
    }
  }

  return v4;
}

- (_NSAttributedStringReplacement)initWithIndex:(int64_t)a3 specifierRangeInFormatString:(_NSRange)a4 replacementRangeInResult:(_NSRange)a5 replacementKind:(int64_t)a6 argument:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v10 = a4.length;
  NSUInteger v11 = a4.location;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____NSAttributedStringReplacement;
  v13 = -[_NSAttributedStringReplacement init](&v17, sel_init);
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_index = a3;
    v13->_specifierRangeInFormatString.NSUInteger length = v10;
    v13->_replacementRangeInResult.NSUInteger location = location;
    v13->_replacementRangeInResult.NSUInteger length = length;
    v13->_replacementKind = a6;
    v13->_specifierRangeInFormatString.NSUInteger location = v11;
    if (a7) {
      id v15 = a7;
    }
    else {
      id v15 = 0LL;
    }
    v14->_argument = v15;
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSAttributedStringReplacement;
  -[_NSAttributedStringReplacement dealloc](&v3, sel_dealloc);
}

+ (id)_replacementsFromMetadataArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        id v9 = -[_NSAttributedStringReplacement _initWithMetadata:]( objc_alloc(&OBJC_CLASS____NSAttributedStringReplacement),  "_initWithMetadata:",  *(void *)(*((void *)&v12 + 1) + 8 * v8));
        if (v9) {
          [v4 addObject:v9];
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }

    while (v6);
  }

  return v4;
}

- (int64_t)index
{
  return self->_index;
}

- (_NSRange)specifierRangeInFormatString
{
  dest[2] = *MEMORY[0x1895F89C0];
  objc_copyStruct(dest, &self->_specifierRangeInFormatString, 16LL, 1, 0);
  NSUInteger v2 = dest[0];
  NSUInteger v3 = dest[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (_NSRange)replacementRangeInResult
{
  dest[2] = *MEMORY[0x1895F89C0];
  objc_copyStruct(dest, &self->_replacementRangeInResult, 16LL, 1, 0);
  NSUInteger v2 = dest[0];
  NSUInteger v3 = dest[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (id)argument
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (int64_t)replacementKind
{
  return self->_replacementKind;
}

@end