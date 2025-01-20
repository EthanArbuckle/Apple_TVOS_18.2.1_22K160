@interface WiFiLexicon
- (BOOL)stringContainsUnwantedWords:(id)a3;
- (NSCharacterSet)tokenizationCharacterSet;
- (NSCharacterSet)tokenizationCharacterSetWithoutUpperCase;
- (NSMutableDictionary)stringCache;
- (NSSet)unwantedEnglishWords;
- (WiFiLexicon)init;
- (id)_tokenizeStringForSpecialCharacters:(id)a3;
- (void)dealloc;
- (void)setStringCache:(id)a3;
- (void)setTokenizationCharacterSet:(id)a3;
- (void)setTokenizationCharacterSetWithoutUpperCase:(id)a3;
- (void)setUnwantedEnglishWords:(id)a3;
@end

@implementation WiFiLexicon

- (void)dealloc
{
  lexiconEnglish = self->_lexiconEnglish;
  if (lexiconEnglish)
  {
    CFRelease(lexiconEnglish);
    self->_lexiconEnglish = 0LL;
  }

  lexiconUserLocale = self->_lexiconUserLocale;
  if (lexiconUserLocale)
  {
    CFRelease(lexiconUserLocale);
    self->_lexiconUserLocale = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiLexicon;
  -[WiFiLexicon dealloc](&v5, sel_dealloc);
}

- (WiFiLexicon)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___WiFiLexicon;
  v2 = -[WiFiLexicon init](&v23, sel_init);
  if (v2)
  {
    [MEMORY[0x189603F90] currentLocale];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 localeIdentifier];
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    int v5 = -[__CFString hasPrefix:](v4, "hasPrefix:", @"en");
    char v6 = v5;
    if (v5) {
      v7 = v4;
    }
    else {
      v7 = @"en";
    }
    v8 = v7;
    v2->_lexiconEnglish = (_LXLexicon *)_createLexiconWithLocale(v8);
    if ((v6 & 1) == 0) {
      v2->_lexiconUserLocale = (_LXLexicon *)_createLexiconWithLocale(v4);
    }
    v9 = (void *)MEMORY[0x1895BA820]();
    [MEMORY[0x189607930] whitespaceAndNewlineCharacterSet];
    v10 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607810] punctuationCharacterSet];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCharacterSet formUnionWithCharacterSet:](v10, "formUnionWithCharacterSet:", v11);

    [MEMORY[0x189607810] symbolCharacterSet];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCharacterSet formUnionWithCharacterSet:](v10, "formUnionWithCharacterSet:", v12);

    uint64_t v13 = -[NSCharacterSet copy](v10, "copy");
    tokenizationCharacterSetWithoutUpperCase = v2->_tokenizationCharacterSetWithoutUpperCase;
    v2->_tokenizationCharacterSetWithoutUpperCase = (NSCharacterSet *)v13;

    [MEMORY[0x189607810] uppercaseLetterCharacterSet];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCharacterSet formUnionWithCharacterSet:](v10, "formUnionWithCharacterSet:", v15);

    tokenizationCharacterSet = v2->_tokenizationCharacterSet;
    v2->_tokenizationCharacterSet = v10;
    v17 = v10;

    uint64_t v18 = [MEMORY[0x189603FC8] dictionary];
    stringCache = v2->_stringCache;
    v2->_stringCache = (NSMutableDictionary *)v18;

    [MEMORY[0x189603FE0] set];
    v20 = (NSSet *)objc_claimAutoreleasedReturnValue();
    -[NSSet addObject:](v20, "addObject:", @"secure");
    -[NSSet addObject:](v20, "addObject:", @"private");
    unwantedEnglishWords = v2->_unwantedEnglishWords;
    v2->_unwantedEnglishWords = v20;

    objc_autoreleasePoolPop(v9);
  }

  return v2;
}

- (BOOL)stringContainsUnwantedWords:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  -[WiFiLexicon stringCache](self, "stringCache");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:v4];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[WiFiLexicon stringCache](self, "stringCache");
    [v7 objectForKey:v4];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v8 BOOLValue];
  }

  else
  {
    v10 = -[WiFiLexicon unwantedEnglishWords](self, "unwantedEnglishWords");
    uint64_t v11 = MEMORY[0x1895F87A8];
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke;
    v23[3] = &unk_18A16CDD8;
    id v12 = v4;
    id v24 = v12;
    v25 = &v26;
    [v10 enumerateObjectsUsingBlock:v23];

    if (*((_BYTE *)v27 + 24))
    {
      -[WiFiLexicon stringCache](self, "stringCache");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithBool:*((unsigned __int8 *)v27 + 24)];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 setObject:v14 forKey:v12];

      char v9 = *((_BYTE *)v27 + 24) != 0;
    }

    else
    {
      v15 = -[WiFiLexicon _tokenizeStringForSpecialCharacters:](self, "_tokenizeStringForSpecialCharacters:", v12);
      if ([v15 count])
      {
        v20[0] = v11;
        v20[1] = 3221225472LL;
        v20[2] = __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_2;
        v20[3] = &unk_18A16CE28;
        v20[4] = self;
        id v16 = v12;
        id v21 = v16;
        v22 = &v26;
        [v15 enumerateObjectsUsingBlock:v20];
        v17 = -[WiFiLexicon stringCache](self, "stringCache");
        [MEMORY[0x189607968] numberWithBool:*((unsigned __int8 *)v27 + 24)];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 setObject:v18 forKey:v16];

        char v9 = *((_BYTE *)v27 + 24) != 0;
      }

      else
      {
        char v9 = 0;
      }
    }

    v7 = v24;
  }

  _Block_object_dispose(&v26, 8);
  return v9;
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "localizedCaseInsensitiveContainsString:")
    && (![v5 isEqualToString:@"secure"]
     || ([*(id *)(a1 + 32) localizedCaseInsensitiveContainsString:@"unsecured"] & 1) == 0))
  {
    NSLog( @"%s: found unwanted word (%@) in string (%@)",  "-[WiFiLexicon stringContainsUnwantedWords:]_block_invoke",  v5,  *(void *)(a1 + 32));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = *(id *)(a1 + 40);
  LXLexiconEnumerateEntriesForString();
  if (*(void *)(*(void *)(a1 + 32) + 16LL))
  {
    id v4 = v3;
    id v5 = *(id *)(a1 + 40);
    LXLexiconEnumerateEntriesForString();
  }
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_3(void *a1, uint64_t a2, _BYTE *a3)
{
  id v5 = (id)LXEntryCopyString();
  if ([v5 isEqualToString:a1[4]] && (LXEntryGetMetaFlags() & 0x3800000) != 0)
  {
    NSLog( @"%s: found unwanted word (%@) in string (%@)",  "-[WiFiLexicon stringContainsUnwantedWords:]_block_invoke_3",  a1[4],  a1[5]);
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    *a3 = 1;
  }
}

void __43__WiFiLexicon_stringContainsUnwantedWords___block_invoke_4(void *a1, uint64_t a2, _BYTE *a3)
{
  id v5 = (id)LXEntryCopyString();
  if ([v5 isEqualToString:a1[4]] && (LXEntryGetMetaFlags() & 0x3800000) != 0)
  {
    NSLog( @"%s: found unwanted word (%@) in string (%@)",  "-[WiFiLexicon stringContainsUnwantedWords:]_block_invoke_4",  a1[4],  a1[5]);
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    *a3 = 1;
  }
}

- (id)_tokenizeStringForSpecialCharacters:(id)a3
{
  id v3 = a3;
  [MEMORY[0x189603FE0] set];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if ([v3 length])
  {
    context = (void *)MEMORY[0x1895BA820]();
    unint64_t v18 = [v3 length];
    unint64_t v4 = v18 - 2;
    if (v18 >= 2)
    {
      uint64_t v5 = 0LL;
      uint64_t v6 = 0LL;
      do
      {
        uint64_t v7 = v5 + 1;
        uint64_t v8 = [v3 characterAtIndex:v5 + 1];
        -[WiFiLexicon tokenizationCharacterSet](self, "tokenizationCharacterSet");
        char v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = [v9 characterIsMember:v8];

        if (v4 == v5 || v10)
        {
          unint64_t v11 = v18;
          if (v4 != v5) {
            unint64_t v11 = v5 + 1;
          }
          objc_msgSend(v3, "substringWithRange:", v6, v11 - v6);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[WiFiLexicon tokenizationCharacterSetWithoutUpperCase](self, "tokenizationCharacterSetWithoutUpperCase");
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 stringByTrimmingCharactersInSet:v13];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 lowercaseString];
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          [v19 addObject:v15];
        }

        else
        {
          uint64_t v7 = v6;
        }

        ++v5;
        uint64_t v6 = v7;
      }

      while (v18 - 1 != v5);
    }

    objc_autoreleasePoolPop(context);
  }

  return v19;
}

- (NSCharacterSet)tokenizationCharacterSet
{
  return self->_tokenizationCharacterSet;
}

- (void)setTokenizationCharacterSet:(id)a3
{
}

- (NSCharacterSet)tokenizationCharacterSetWithoutUpperCase
{
  return self->_tokenizationCharacterSetWithoutUpperCase;
}

- (void)setTokenizationCharacterSetWithoutUpperCase:(id)a3
{
}

- (NSMutableDictionary)stringCache
{
  return self->_stringCache;
}

- (void)setStringCache:(id)a3
{
}

- (NSSet)unwantedEnglishWords
{
  return self->_unwantedEnglishWords;
}

- (void)setUnwantedEnglishWords:(id)a3
{
}

- (void).cxx_destruct
{
}

@end