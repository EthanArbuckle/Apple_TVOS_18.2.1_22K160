@interface NSMutableAttributedString
+ (NSMutableAttributedString)allocWithZone:(_NSZone *)a3;
- (Class)_intentResolver;
- (Class)classForCoder;
- (NSMutableString)mutableString;
- (id)_formatInflectionAlternative:(id)a3 withReplacements:(id)a4;
- (void)_addAttributesIfNotPresentMergingInlinePresentationIntents:(id)a3 toRange:(_NSRange)a4;
- (void)_inflectWithLocale:(id)a3 replacements:(id)a4 concepts:(id)a5 preflight:(BOOL)a6;
- (void)addAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range;
- (void)addAttributes:(NSDictionary *)attrs range:(NSRange)range;
- (void)addAttributesWeakly:(id)a3 range:(_NSRange)a4;
- (void)appendAttributedString:(NSAttributedString *)attrString;
- (void)appendLocalizedFormat:(NSAttributedString *)format;
- (void)deleteCharactersInRange:(NSRange)range;
- (void)enumerateFormattableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)enumerateInflectableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc;
- (void)removeAttribute:(NSAttributedStringKey)name range:(NSRange)range;
- (void)replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString;
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str;
- (void)setAttributedString:(NSAttributedString *)attrString;
- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range;
@end

@implementation NSMutableAttributedString

+ (NSMutableAttributedString)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1) {
    v4 = (objc_class *)objc_opt_self();
  }
  return (NSMutableAttributedString *)NSAllocateObject(v4, 0LL, a3);
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str
{
  v6 = NSClassFromString((NSString *)@"NSMutableAttributedString");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range
{
  v6 = NSClassFromString((NSString *)@"NSMutableAttributedString");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSMutableString)mutableString
{
  return (NSMutableString *)(id)[objc_allocWithZone((Class)NSMutableStringProxyForMutableAttributedString) initWithMutableAttributedString:self];
}

- (void)addAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (range.length)
  {
    if (value)
    {
      NSUInteger length = range.length;
      NSUInteger location = range.location;
      -[NSMutableAttributedString beginEditing](self, "beginEditing");
      do
      {
        v10 = (void *)-[NSDictionary mutableCopyWithZone:]( -[NSAttributedString attributesAtIndex:effectiveRange:]( self,  "attributesAtIndex:effectiveRange:",  location,  &v27),  "mutableCopyWithZone:",  0LL);
        v11 = v10;
        if (location + length >= v28 + v27) {
          NSUInteger v12 = v28 + v27;
        }
        else {
          NSUInteger v12 = location + length;
        }
        NSUInteger v13 = v12 - v27;
        BOOL v14 = location > v27 || v27 >= location + length;
        if (v14) {
          NSUInteger v15 = 0LL;
        }
        else {
          NSUInteger v15 = v27;
        }
        if (v14) {
          NSUInteger v13 = 0LL;
        }
        NSUInteger v16 = v12 - location;
        BOOL v17 = v27 > location || location >= v28 + v27;
        if (v17) {
          NSUInteger v18 = v15;
        }
        else {
          NSUInteger v18 = location;
        }
        if (v17) {
          NSUInteger v19 = v13;
        }
        else {
          NSUInteger v19 = v16;
        }
        NSUInteger v27 = v18;
        uint64_t v28 = v19;
        [v10 setObject:value forKey:name];
        -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v11, v27, v28);

        location += v28;
        length -= v28;
      }

      while (length);
      if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttribute:value:]( self,  "_willRequireIntentResolutionWhenContainingAttribute:value:",  name,  value))
      {
        -[NSAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
      }

      -[NSMutableAttributedString endEditing](self, "endEditing");
    }

    else
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = _NSNameOfClass(v21);
      v23 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%s %s: nil value", v22, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v23);
      -[NSMutableAttributedString addAttributes:range:](v24, v25, v26, v30);
    }
  }

- (void)addAttributes:(NSDictionary *)attrs range:(NSRange)range
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (range.length)
  {
    if (attrs)
    {
      NSUInteger length = range.length;
      NSUInteger location = range.location;
      -[NSMutableAttributedString beginEditing](self, "beginEditing");
      do
      {
        v8 = (void *)-[NSDictionary mutableCopyWithZone:]( -[NSAttributedString attributesAtIndex:effectiveRange:]( self,  "attributesAtIndex:effectiveRange:",  location,  &v23),  "mutableCopyWithZone:",  0LL);
        v9 = v8;
        if (location + length >= v24 + v23) {
          NSUInteger v10 = v24 + v23;
        }
        else {
          NSUInteger v10 = location + length;
        }
        if (v23 >= location + length || location > v23) {
          NSUInteger v12 = 0LL;
        }
        else {
          NSUInteger v12 = v10 - v23;
        }
        NSUInteger v13 = v10 - location;
        if (v23 > location || location >= v24 + v23) {
          NSUInteger v15 = v12;
        }
        else {
          NSUInteger v15 = v13;
        }
        NSUInteger v23 = location;
        NSUInteger v24 = v15;
        if (v15 > length) {
          NSUInteger v24 = length;
        }
        [v8 addEntriesFromDictionary:attrs];
        -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v9, v23, v24);

        location += v24;
        length -= v24;
      }

      while (length);
      if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:]( self,  "_willRequireIntentResolutionWhenContainingAttributes:",  attrs))
      {
        -[NSAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
      }

      -[NSMutableAttributedString endEditing](self, "endEditing");
    }

    else
    {
      BOOL v17 = (objc_class *)objc_opt_class();
      NSUInteger v18 = _NSNameOfClass(v17);
      NSUInteger v19 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%s %s: nil value", v18, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v19);
      -[NSMutableAttributedString addAttributesWeakly:range:](v20, v21, v22, v26);
    }
  }

- (void)addAttributesWeakly:(id)a3 range:(_NSRange)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    -[NSMutableAttributedString beginEditing](self, "beginEditing");
    do
    {
      v8 = -[NSAttributedString attributesAtIndex:effectiveRange:]( self,  "attributesAtIndex:effectiveRange:",  location,  &v17);
      v9 = (void *)[a3 mutableCopyWithZone:0];
      NSUInteger v10 = v9;
      if (location + length >= v18 + v17) {
        NSUInteger v11 = v18 + v17;
      }
      else {
        NSUInteger v11 = location + length;
      }
      if (v17 >= location + length || location > v17) {
        NSUInteger v13 = 0LL;
      }
      else {
        NSUInteger v13 = v11 - v17;
      }
      NSUInteger v14 = v11 - location;
      if (v17 > location || location >= v18 + v17) {
        NSUInteger v16 = v13;
      }
      else {
        NSUInteger v16 = v14;
      }
      NSUInteger v17 = location;
      NSUInteger v18 = v16;
      if (v16 > length) {
        NSUInteger v18 = length;
      }
      [v9 addEntriesFromDictionary:v8];
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v10, v17, v18);

      location += v18;
      length -= v18;
    }

    while (length);
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:]( self,  "_willRequireIntentResolutionWhenContainingAttributes:",  a3))
    {
      -[NSAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
    }

    -[NSMutableAttributedString endEditing](self, "endEditing");
  }

- (void)removeAttribute:(NSAttributedStringKey)name range:(NSRange)range
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (range.length)
  {
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    -[NSMutableAttributedString beginEditing](self, "beginEditing");
    do
    {
      v8 = (void *)-[NSDictionary mutableCopyWithZone:]( -[NSAttributedString attributesAtIndex:effectiveRange:]( self,  "attributesAtIndex:effectiveRange:",  location,  &v18),  "mutableCopyWithZone:",  0LL);
      v9 = v8;
      if (location + length >= v19 + v18) {
        NSUInteger v10 = v19 + v18;
      }
      else {
        NSUInteger v10 = location + length;
      }
      NSUInteger v11 = v10 - v18;
      BOOL v12 = location > v18 || v18 >= location + length;
      if (v12) {
        NSUInteger v13 = 0LL;
      }
      else {
        NSUInteger v13 = v18;
      }
      if (v12) {
        NSUInteger v11 = 0LL;
      }
      NSUInteger v14 = v10 - location;
      BOOL v15 = v18 > location || location >= v19 + v18;
      if (v15) {
        NSUInteger v16 = v13;
      }
      else {
        NSUInteger v16 = location;
      }
      if (v15) {
        NSUInteger v17 = v11;
      }
      else {
        NSUInteger v17 = v14;
      }
      NSUInteger v18 = v16;
      uint64_t v19 = v17;
      [v8 removeObjectForKey:name];
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v9, v18, v19);

      location += v19;
      length -= v19;
    }

    while (length);
    -[NSMutableAttributedString endEditing](self, "endEditing");
  }

- (void)replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v8 = -[NSAttributedString string](attrString, "string");
  unint64_t v9 = -[NSString length](v8, "length");
  unint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  -[NSMutableAttributedString beginEditing](self, "beginEditing");
  -[NSMutableAttributedString replaceCharactersInRange:withString:]( self,  "replaceCharactersInRange:withString:",  location,  length,  v8);
  if (v9)
  {
    for (i = 0LL; i < v9; unint64_t v12 = i)
    {
      NSUInteger v11 = -[NSAttributedString attributesAtIndex:effectiveRange:]( attrString,  "attributesAtIndex:effectiveRange:",  i,  &v12);
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v11, v12 + location, v13);
      unint64_t i = v12 + v13;
    }
  }

  if (-[NSAttributedString _mayRequireIntentResolution](attrString, "_mayRequireIntentResolution")) {
    -[NSAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
  }
  -[NSMutableAttributedString endEditing](self, "endEditing");
}

- (void)insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc
{
}

- (void)appendAttributedString:(NSAttributedString *)attrString
{
}

- (void)deleteCharactersInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v6 = objc_alloc_init(&OBJC_CLASS___NSAttributedString);
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( self,  "replaceCharactersInRange:withAttributedString:",  location,  length,  v6);
}

- (void)setAttributedString:(NSAttributedString *)attrString
{
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (Class)_intentResolver
{
  return objc_lookUpClass("_UIAttributedStringIntentResolver");
}

- (void)_addAttributesIfNotPresentMergingInlinePresentationIntents:(id)a3 toRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9[7] = *MEMORY[0x1895F89C0];
  if ([a3 count])
  {
    v8 = (void *)[a3 objectForKeyedSubscript:@"NSInlinePresentationIntent"];
    if (v8) {
      v8 = (void *)[v8 unsignedIntegerValue];
    }
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __110__NSMutableAttributedString_NSInflection___addAttributesIfNotPresentMergingInlinePresentationIntents_toRange___block_invoke;
    v9[3] = &unk_189C9DE50;
    v9[5] = self;
    v9[6] = v8;
    v9[4] = a3;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:]( self,  "enumerateAttributesInRange:options:usingBlock:",  location,  length,  0x100000LL,  v9);
  }

uint64_t __110__NSMutableAttributedString_NSInflection___addAttributesIfNotPresentMergingInlinePresentationIntents_toRange___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v8 = objc_msgSend(a2, "objectForKeyedSubscript:");
  uint64_t v9 = *(void *)(a1 + 48);
  if (v8) {
    uint64_t v8 = [(id)v8 unsignedIntegerValue];
  }
  uint64_t v16 = v8 | v9;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  NSUInteger v10 = *(void **)(a1 + 32);
  uint64_t result = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        if (![a2 objectForKeyedSubscript:v15]) {
          objc_msgSend( *(id *)(a1 + 40),  "addAttribute:value:range:",  v15,  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15),  a3,  a4);
        }
        ++v14;
      }

      while (v12 != v14);
      uint64_t result = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
      uint64_t v12 = result;
    }

    while (result);
  }

  if (v16) {
    return objc_msgSend( *(id *)(a1 + 40),  "addAttribute:value:range:",  @"NSInlinePresentationIntent",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"),  a3,  a4);
  }
  return result;
}

- (id)_formatInflectionAlternative:(id)a3 withReplacements:(id)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  v33 = -[NSCharacterSet invertedSet]( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"0123456789"),  "invertedSet");
  if (_NSIsNSString())
  {
    v6 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  a3);
  }

  else
  {
    if (!_NSIsNSAttributedString())
    {
LABEL_38:
      v7 = 0LL;
      return v7;
    }

    v6 = (NSMutableAttributedString *)[a3 mutableCopy];
  }

  v7 = v6;
  if (v6)
  {
    -[NSAttributedString length](v6, "length");
    uint64_t v8 = -[NSString rangeOfString:](-[NSAttributedString string](v7, "string"), "rangeOfString:", @"{");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v11 = v8;
      uint64_t v12 = @"{";
      while (v11 < -[NSAttributedString length](v7, "length") - 1)
      {
        unint64_t v13 = v11 + 1;
        if (-[NSString characterAtIndex:](-[NSAttributedString string](v7, "string"), "characterAtIndex:", v11 + 1) == 123)
        {
          -[NSMutableString replaceCharactersInRange:withString:]( -[NSMutableAttributedString mutableString](v7, "mutableString"),  "replaceCharactersInRange:withString:",  v11,  2LL,  v12);
        }

        else
        {
          uint64_t v14 = -[NSString rangeOfString:options:range:]( -[NSAttributedString string](v7, "string"),  "rangeOfString:options:range:",  @"}",  0LL,  v11 + 1,  -[NSAttributedString length](v7, "length") - v13);
          if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_37;
          }
          unint64_t v15 = v14 + ~v11;
          uint64_t v16 = -[NSString substringWithRange:]( -[NSAttributedString string](v7, "string"),  "substringWithRange:",  v11 + 1,  v15);
          if (-[NSString rangeOfCharacterFromSet:](v16, "rangeOfCharacterFromSet:", v33) != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_37;
          }
          uint64_t v17 = -[NSString integerValue](v16, "integerValue");
          unint64_t v18 = v17 - 1;
          if (v17 < 1) {
            goto LABEL_37;
          }
          uint64_t v19 = v17;
          if (v18 >= [a4 count]
            || objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v18), "index") != v19
            || (__int128 v20 = (void *)[a4 objectAtIndexedSubscript:v18]) == 0)
          {
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            uint64_t v21 = [a4 countByEnumeratingWithState:&v35 objects:v34 count:16];
            if (!v21) {
              goto LABEL_37;
            }
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v36;
LABEL_25:
            NSUInteger v24 = v12;
            uint64_t v25 = 0LL;
            while (1)
            {
              if (*(void *)v36 != v23) {
                objc_enumerationMutation(a4);
              }
              __int128 v20 = *(void **)(*((void *)&v35 + 1) + 8 * v25);
              if ([v20 index] == v19) {
                break;
              }
              if (v22 == ++v25)
              {
                uint64_t v22 = [a4 countByEnumeratingWithState:&v35 objects:v34 count:16];
                uint64_t v12 = v24;
                if (v22) {
                  goto LABEL_25;
                }
                goto LABEL_37;
              }
            }

            uint64_t v12 = v24;
            if (!v20) {
              goto LABEL_37;
            }
          }

          _NSRange v26 = -[NSAttributedString string](self, "string");
          uint64_t v27 = [v20 replacementRangeInResult];
          uint64_t v29 = -[NSString substringWithRange:](v26, "substringWithRange:", v27, v28);
          -[NSMutableString replaceCharactersInRange:withString:]( -[NSMutableAttributedString mutableString](v7, "mutableString"),  "replaceCharactersInRange:withString:",  v11,  v15 + 2,  v29);
          uint64_t v30 = -[NSString length](v29, "length");
          if (v30 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_37;
          }
          unint64_t v13 = v30 + v11;
        }

        unint64_t v11 = -[NSString rangeOfString:options:range:]( -[NSAttributedString string](v7, "string"),  "rangeOfString:options:range:",  v12,  0LL,  v13,  -[NSAttributedString length](v7, "length") - v13);
        if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_7;
        }
      }

      goto LABEL_37;
    }

- (void)_inflectWithLocale:(id)a3 replacements:(id)a4 concepts:(id)a5 preflight:(BOOL)a6
{
  v23[5] = *MEMORY[0x1895F89C0];
  id v11 = +[NSTermOfAddress currentUser](&OBJC_CLASS___NSTermOfAddress, "currentUser");
  v22[4] = self;
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke;
  v23[3] = &unk_189C9DE78;
  v23[4] = self;
  v21[4] = self;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_2;
  v22[3] = &unk_189C9DEA0;
  v20[4] = self;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_3;
  v21[3] = &unk_189C9DEC8;
  v19[4] = self;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_4;
  v20[3] = &unk_189C9DEC8;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_5;
  v19[3] = &unk_189C9DEF0;
  v17[4] = self;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_6;
  v18[3] = &unk_189C9DF18;
  v18[4] = self;
  v16[4] = self;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_7;
  v17[3] = &unk_189C9DF40;
  v15[4] = self;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_8;
  v16[3] = &unk_189C9DF68;
  v14[4] = self;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_9;
  v15[3] = &unk_189C9DFB8;
  v13[4] = self;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_11;
  v14[3] = &unk_189C9DFE0;
  v12[5] = a4;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_12;
  v13[3] = &unk_189C9E008;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_13;
  v12[3] = &unk_189C9E030;
  v12[4] = self;
  _NSInflect( (uint64_t)a3,  (uint64_t)a4,  (uint64_t)a5,  (uint64_t)v11,  (uint64_t)v23,  a6,  (uint64_t)v22,  (uint64_t)v21,  (uint64_t)v20,  (uint64_t)v19,  (uint64_t)v18,  (uint64_t)v17,  (uint64_t)v16,  (uint64_t)v15,  (uint64_t)v14,  (uint64_t)v13,  (uint64_t)v12);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) length];
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateAttribute:inRange:options:usingBlock:", a2, a3, a4, 2, a5);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateInflectableBlocksInRange:usingBlock:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateFormattableBlocksInRange:usingBlock:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_5( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_6( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v3 = a3;
  while (1)
  {
    unint64_t v6 = objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "string"),  "rangeOfString:options:range:",  @"%",  0,  a2,  v3);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0LL;
    }
    unint64_t v8 = v6;
    uint64_t v9 = a2 + v3;
    if (v6 > v9 - 2) {
      return 0LL;
    }
    uint64_t v10 = v7;
    a2 = v8 + v10;
    uint64_t v3 = v9 - (v8 + v10);
    if (!v3) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_7( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_firstValueOfAttributeWithKey:inRange:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_8( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "string"), "substringWithRange:", a2, a3);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_9( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  v9[5] = *MEMORY[0x1895F89C0];
  uint64_t v7 = (void *)[*(id *)(a1 + 32) mutableString];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_10;
  v9[3] = &unk_189C9DF90;
  v9[4] = a4;
  return objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", a2, a3, 3, v9);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_10( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_11( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  if (_NSIsNSString())
  {
    objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "mutableString"),  "replaceCharactersInRange:withString:",  a2,  a3,  a4);
  }

  else if (_NSIsNSAttributedString())
  {
    id v8 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_identicalAttributesInRange:", a2, a3), "mutableCopy");
    [v8 removeObjectForKey:@"NSInflectionAlternative"];
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", a2, a3, a4);
    objc_msgSend( *(id *)(a1 + 32),  "_addAttributesIfNotPresentMergingInlinePresentationIntents:toRange:",  v8,  a2,  objc_msgSend(a4, "length"));
  }

  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[NSMutableAttributedString(NSInflection) _inflectWithLocale:replacements:concepts:preflight:]_block_invoke_11"),  @"NSAttributedString_Inflection.m",  1037LL,  @"Unknown kind of replacement: %@",  a4);
  }

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_12( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", a4, a5, a2, a3);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_13( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) _formatInflectionAlternative:a2 withReplacements:*(void *)(a1 + 40)];
}

- (void)enumerateInflectableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  uint64_t v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  uint64_t v23 = 0LL;
  uint64_t v14 = 0LL;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  NSUInteger v17 = a3.location + a3.length;
  uint64_t v7 = MEMORY[0x1895F87A8];
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = __88__NSMutableAttributedString_NSInflection__enumerateInflectableBlocksInRange_usingBlock___block_invoke;
  uint64_t v10 = &unk_189C9E058;
  uint64_t v12 = &v18;
  unint64_t v13 = &v14;
  id v11 = a4;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:]( self,  "enumerateAttributesInRange:options:usingBlock:");
  uint64_t v5 = v19[5];
  if (v5)
  {
    (*((void (**)(id, uint64_t, void, uint64_t, char *))a4 + 2))(a4, v5, 0LL, v15[3], &v6);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

void __88__NSMutableAttributedString_NSInflection__enumerateInflectableBlocksInRange_usingBlock___block_invoke( void *a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v8 = -[_NSInflectionRuleExplicit initWithAttributesDictionary:]( objc_alloc(&OBJC_CLASS____NSInflectionRuleExplicit),  "initWithAttributesDictionary:",  a2);
  if (!v8) {
    uint64_t v8 = (_NSInflectionRuleExplicit *)objc_msgSend( (id)objc_msgSend(a2, "objectForKeyedSubscript:", @"NSInflect"),  "copy");
  }
  uint64_t v9 = *(_NSInflectionRuleExplicit **)(*(void *)(a1[5] + 8LL) + 40LL);
  if (v9 == v8 || (unint64_t v13 = v8, v10 = -[_NSInflectionRuleExplicit isEqual:](v9, "isEqual:", v8), v8 = v13, v10))
  {
  }

  else
  {
    uint64_t v11 = a3 + a4;
    if (*(void *)(*(void *)(a1[5] + 8LL) + 40LL))
    {
      (*(void (**)(void))(a1[4] + 16LL))();
      uint64_t v12 = *(void **)(*(void *)(a1[5] + 8LL) + 40LL);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    *(void *)(*(void *)(a1[5] + 8LL) + 40LL) = v13;
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = v11;
  }

- (void)enumerateFormattableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  uint64_t v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  uint64_t v23 = 0LL;
  uint64_t v14 = 0LL;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  NSUInteger v17 = a3.location + a3.length;
  uint64_t v7 = MEMORY[0x1895F87A8];
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = __88__NSMutableAttributedString_NSInflection__enumerateFormattableBlocksInRange_usingBlock___block_invoke;
  BOOL v10 = &unk_189C9E058;
  uint64_t v12 = &v18;
  unint64_t v13 = &v14;
  id v11 = a4;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:]( self,  "enumerateAttributesInRange:options:usingBlock:");
  uint64_t v5 = v19[5];
  if (v5)
  {
    (*((void (**)(id, uint64_t, void, uint64_t, char *))a4 + 2))(a4, v5, 0LL, v15[3], &v6);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

uint64_t __88__NSMutableAttributedString_NSInflection__enumerateFormattableBlocksInRange_usingBlock___block_invoke( void *a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"NSLocalizedNumberFormat"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v7 = 0LL;
  }
  uint64_t result = *(void *)(*(void *)(a1[5] + 8LL) + 40LL);
  if ((void *)result != v7)
  {
    uint64_t result = [(id)result isEqual:v7];
    if ((result & 1) == 0)
    {
      uint64_t v9 = a3 + a4;
      if (*(void *)(*(void *)(a1[5] + 8LL) + 40LL))
      {
        (*(void (**)(void))(a1[4] + 16LL))();
        BOOL v10 = *(void **)(*(void *)(a1[5] + 8LL) + 40LL);
      }

      else
      {
        BOOL v10 = 0LL;
      }

      uint64_t result = [v7 copy];
      *(void *)(*(void *)(a1[5] + 8LL) + 40LL) = result;
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = v9;
    }
  }

  return result;
}

- (void)appendLocalizedFormat:(NSAttributedString *)format
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  id v6 = -[NSAttributedString _initWithFormat:options:locale:arguments:]( v5,  "_initWithFormat:options:locale:arguments:",  format,  0,  [MEMORY[0x189603F90] currentLocale],  va);
  -[NSMutableAttributedString appendAttributedString:](self, "appendAttributedString:", v6);
}

@end