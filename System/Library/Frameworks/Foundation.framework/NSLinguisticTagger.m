@interface NSLinguisticTagger
+ (BOOL)supportsLanguage:(id)a3;
+ (NSArray)availableTagSchemesForLanguage:(NSString *)language;
+ (NSArray)availableTagSchemesForUnit:(NSLinguisticTaggerUnit)unit language:(NSString *)language;
+ (NSArray)tagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges;
+ (NSLinguisticTag)tagForString:(NSString *)string atIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme orthography:(NSOrthography *)orthography tokenRange:(NSRangePointer)tokenRange;
+ (NSString)dominantLanguageForString:(NSString *)string;
+ (void)enumerateTagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block;
- (BOOL)_acceptSentenceTerminatorRange:(_NSRange)a3 paragraphRange:(_NSRange)a4 tokens:(_NSLTToken *)a5 count:(unint64_t)a6 tokenIndex:(unint64_t)a7;
- (NSArray)possibleTagsAtIndex:(NSUInteger)charIndex scheme:(NSString *)tagScheme tokenRange:(NSRangePointer)tokenRange sentenceRange:(NSRangePointer)sentenceRange scores:(NSArray *)scores;
- (NSArray)tagSchemes;
- (NSArray)tagsInRange:(NSRange)range scheme:(NSString *)tagScheme options:(NSLinguisticTaggerOptions)opts tokenRanges:(NSArray *)tokenRanges;
- (NSArray)tagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options tokenRanges:(NSArray *)tokenRanges;
- (NSLinguisticTag)tagAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme tokenRange:(NSRangePointer)tokenRange;
- (NSLinguisticTagger)initWithTagSchemes:(NSArray *)tagSchemes options:(NSUInteger)opts;
- (NSOrthography)orthographyAtIndex:(NSUInteger)charIndex effectiveRange:(NSRangePointer)effectiveRange;
- (NSRange)tokenRangeAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit;
- (NSString)dominantLanguage;
- (NSString)string;
- (_NSRange)_sentenceRangeForRange:(_NSRange)a3;
- (id)_tagAtIndex:(unint64_t)a3 scheme:(id)a4 tokenRange:(_NSRange *)a5 sentenceRange:(_NSRange *)a6;
- (id)_tagSchemeForScheme:(id)a3;
- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 requireLemmas:(BOOL)a5 requirePartsOfSpeech:(BOOL)a6 requireNamedEntities:(BOOL)a7;
- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 tagScheme:(id)a5;
- (id)_tokenDataForParagraphRange:(_NSRange)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6;
- (id)description;
- (void)_acceptSentencesForParagraphRange:(_NSRange)a3;
- (void)_analyzePunctuationTokensInRange:(_NSRange)a3 paragraphRange:(_NSRange)a4;
- (void)_analyzeTokensInInterwordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4;
- (void)_analyzeTokensInWordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4;
- (void)_calculateSentenceRangesForParagraphRange:(_NSRange)a3;
- (void)_detectOrthographyIfNeededAtIndex:(unint64_t)a3;
- (void)_enumerateTagsInRange:(_NSRange)a3 scheme:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)_nativeSetOrthography:(id)a3 range:(_NSRange)a4;
- (void)_setOrthography:(id)a3 range:(_NSRange)a4;
- (void)_tokenizeParagraphAtIndex:(unint64_t)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6;
- (void)dealloc;
- (void)enumerateTagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options usingBlock:(void *)block;
- (void)setOrthography:(NSOrthography *)orthography range:(NSRange)range;
- (void)setString:(NSString *)string;
- (void)stringEditedInRange:(NSRange)newRange changeInLength:(NSInteger)delta;
@end

@implementation NSLinguisticTagger

+ (NSArray)availableTagSchemesForUnit:(NSLinguisticTaggerUnit)unit language:(NSString *)language
{
  CFLocaleRef v5 = CFLocaleCreate(0LL, (CFLocaleIdentifier)language);
  if (v5)
  {
    CFLocaleRef v6 = v5;
    if (qword_18C496FD8 != -1) {
      dispatch_once(&qword_18C496FD8, &__block_literal_global_426);
    }
    if (_MergedGlobals_142) {
      v7 = (void *)off_18C496EA0(unit, v6);
    }
    else {
      v7 = 0LL;
    }
    CFRelease(v6);
  }

  else
  {
    v7 = 0LL;
  }

  return (NSArray *)v7;
}

+ (NSArray)availableTagSchemesForLanguage:(NSString *)language
{
  return (NSArray *)[a1 availableTagSchemesForUnit:0 language:language];
}

- (NSLinguisticTagger)initWithTagSchemes:(NSArray *)tagSchemes options:(NSUInteger)opts
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NSLinguisticTagger;
  CFLocaleRef v6 = -[NSLinguisticTagger init](&v16, sel_init);
  v6->_schemes = (NSArray *)-[NSArray copy](tagSchemes, "copy");
  v6->_options = opts;
  if (qword_18C496EA8 != -1) {
    dispatch_once(&qword_18C496EA8, &__block_literal_global_67);
  }
  v7 = (void *)[MEMORY[0x189603FA8] arrayWithArray:tagSchemes];
  v8 = (void *)[MEMORY[0x189603FC8] dictionary];
  if (([v7 containsObject:@"Language"] & 1) == 0) {
    [v7 addObject:@"Language"];
  }
  if (([v7 containsObject:@"Script"] & 1) == 0) {
    [v7 addObject:@"Script"];
  }
  if ((opts & 0x20000000) != 0) {
    objc_msgSend( v8,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"LSTMLanguageIdentifier");
  }
  if ((opts & 0x10000000) != 0) {
    objc_msgSend( v8,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"SmartTokenBreak");
  }
  if (qword_18C496FD8 != -1) {
    dispatch_once(&qword_18C496FD8, &__block_literal_global_426);
  }
  if (_MergedGlobals_142) {
    v6->_reserved = (void *)off_18C496EB8(v7, v8);
  }
  [(id)qword_18C496EB0 lock];
  v9 = (NSCharacterSet *)qword_18C496EC0;
  if (!qword_18C496EC0)
  {
    v9 = +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet");
    qword_18C496EC0 = (uint64_t)v9;
  }

  if (!qword_18C496EC8) {
    qword_18C496EC8 = -[NSCharacterSet invertedSet](v9, "invertedSet");
  }
  v10 = (NSCharacterSet *)qword_18C496ED0;
  if (!qword_18C496ED0)
  {
    v10 =  +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet");
    qword_18C496ED0 = (uint64_t)v10;
  }

  if (!qword_18C496ED8) {
    qword_18C496ED8 = -[NSCharacterSet invertedSet](v10, "invertedSet");
  }
  if (!qword_18C496EE0) {
    qword_18C496EE0 =  +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"\r\f\n\u2029");
  }
  v11 = (NSCharacterSet *)qword_18C496EE8;
  if (!qword_18C496EE8)
  {
    v11 = +[NSCharacterSet punctuationCharacterSet](&OBJC_CLASS___NSCharacterSet, "punctuationCharacterSet");
    qword_18C496EE8 = (uint64_t)v11;
  }

  if (!qword_18C496EF0) {
    qword_18C496EF0 = -[NSCharacterSet invertedSet](v11, "invertedSet");
  }
  if (!qword_18C496EF8)
  {
    v12 = +[NSMutableCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "whitespaceAndNewlineCharacterSet");
    -[NSMutableCharacterSet formUnionWithCharacterSet:](v12, "formUnionWithCharacterSet:", qword_18C496EE8);
    -[NSMutableCharacterSet invert](v12, "invert");
    qword_18C496EF8 = -[NSMutableCharacterSet copy](v12, "copy");
  }

  v13 = (NSCharacterSet *)qword_18C496F00;
  if (!qword_18C496F00)
  {
    v13 =  +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @".?!。！．？｡");
    qword_18C496F00 = (uint64_t)v13;
  }

  if (!qword_18C496F08) {
    qword_18C496F08 = -[NSCharacterSet invertedSet](v13, "invertedSet");
  }
  if (!qword_18C496F10) {
    qword_18C496F10 =  +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"'’");
  }
  if (!qword_18C496F18) {
    qword_18C496F18 =  +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"-'()«»‐‑‒–—―‘’‚‛“”„‟‹›「」『』");
  }
  if (!qword_18C496F20) {
    qword_18C496F20 =  +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"'«»‘’‚‛“”„‟‹›「」『』");
  }
  if (!qword_18C496F28) {
    qword_18C496F28 =  +[NSCharacterSet decimalDigitCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "decimalDigitCharacterSet");
  }
  if (!qword_18C496F30)
  {
    v14 = +[NSMutableCharacterSet punctuationCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "punctuationCharacterSet");
    -[NSMutableCharacterSet formUnionWithCharacterSet:](v14, "formUnionWithCharacterSet:", qword_18C496F28);
    -[NSMutableCharacterSet invert](v14, "invert");
    qword_18C496F30 = -[NSMutableCharacterSet copy](v14, "copy");
  }

  if (!qword_18C496F38) {
    qword_18C496F38 = +[NSCharacterSet alphanumericCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "alphanumericCharacterSet");
  }
  if (!qword_18C496F40) {
    qword_18C496F40 = objc_retain( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"([{</@-=–—"));
  }
  if (!qword_18C496F48) {
    qword_18C496F48 =  +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"nstNST");
  }
  [(id)qword_18C496EB0 unlock];
  return v6;
}

NSLock *__49__NSLinguisticTagger_initWithTagSchemes_options___block_invoke()
{
  result = objc_alloc_init(&OBJC_CLASS___NSLock);
  qword_18C496EB0 = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  reserved = self->_reserved;
  if (reserved) {
    CFRelease(reserved);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSLinguisticTagger;
  -[NSLinguisticTagger dealloc](&v4, sel_dealloc);
}

- (id)description
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSLinguisticTagger;
  v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@\n",  -[NSLinguisticTagger description](&v5, sel_description));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"    tag schemes %@\n", self->_schemes);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"    string %p has %lu characters\n",  self->_string,  -[NSString length](self->_string, "length"));
  return v3;
}

- (NSArray)tagSchemes
{
  return self->_schemes;
}

- (id)_tagSchemeForScheme:(id)a3
{
  if (!-[NSArray containsObject:](self->_schemes, "containsObject:")) {
    return 0LL;
  }
  objc_super v4 = @"TokenType";
  if (([@"TokenType" isEqualToString:a3] & 1) == 0)
  {
    objc_super v4 = @"LexicalClass";
    if (([@"LexicalClass" isEqualToString:a3] & 1) == 0)
    {
      objc_super v4 = @"NameType";
      if (([@"NameType" isEqualToString:a3] & 1) == 0)
      {
        objc_super v4 = @"NameTypeOrLexicalClass";
        if (([@"NameTypeOrLexicalClass" isEqualToString:a3] & 1) == 0)
        {
          objc_super v4 = @"Lemma";
          if (([@"Lemma" isEqualToString:a3] & 1) == 0)
          {
            objc_super v4 = @"Language";
            if (([@"Language" isEqualToString:a3] & 1) == 0)
            {
              objc_super v4 = @"Script";
              if (([@"Script" isEqualToString:a3] & 1) == 0)
              {
                objc_super v4 = @"PossibleClasses";
                if (([@"PossibleClasses" isEqualToString:a3] & 1) == 0)
                {
                  objc_super v4 = @"InternalClass";
                }
              }
            }
          }
        }
      }
    }
  }

  return (id)v4;
}

+ (BOOL)supportsLanguage:(id)a3
{
  if (a3) {
    return objc_msgSend( (id)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  @"en",  @"fr",  @"de",  @"es",  @"it",  @"pt",  @"ru",  @"tr",  @"ja",  0),  "containsObject:",  a3);
  }
  else {
    return 0;
  }
}

- (void)setString:(NSString *)string
{
  objc_super v5 = self->_string;
  if (v5 != string)
  {

    self->_string = string;
  }

  id tokenArray = self->_tokenArray;
  if (tokenArray)
  {

    self->_id tokenArray = 0LL;
  }

  id orthographyArray = self->_orthographyArray;
  if (orthographyArray)
  {

    self->_id orthographyArray = 0LL;
  }

  reserved = self->_reserved;
  if (reserved) {
    off_18C496F50(reserved, string);
  }
}

- (NSString)string
{
  return self->_string;
}

- (void)stringEditedInRange:(NSRange)newRange changeInLength:(NSInteger)delta
{
  NSUInteger length = newRange.length;
  NSUInteger location = newRange.location;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  NSUInteger v8 = newRange.length - delta;
  id tokenArray = self->_tokenArray;
  if (tokenArray)
  {
    unint64_t v10 = [tokenArray count];
    if (location < v10
      && (v11 = (void *)[self->_tokenArray objectAtIndex:location effectiveRange:&v22]) != 0)
    {
      NSUInteger v12 = location;
      NSUInteger v13 = v8;
      if ((objc_msgSend(v11, "isEqual:", objc_msgSend(MEMORY[0x189603FE8], "null")) & 1) == 0)
      {
        if (v22 >= location) {
          NSUInteger v12 = location;
        }
        else {
          NSUInteger v12 = v22;
        }
        NSUInteger v14 = location - v22;
        if (location < v22) {
          NSUInteger v14 = 0LL;
        }
        NSUInteger v15 = v14 + v8;
        if (v23 + v22 <= v15 + v12) {
          NSUInteger v13 = v15;
        }
        else {
          NSUInteger v13 = v23 + v22 - v12;
        }
      }
    }

    else
    {
      NSUInteger v12 = location;
      NSUInteger v13 = v8;
    }

    if (v8)
    {
      if (v8 + location <= v10)
      {
        objc_super v16 = (void *)[self->_tokenArray objectAtIndex:v8 + location - 1 effectiveRange:&v22];
        if (v16)
        {
          if ((objc_msgSend(v16, "isEqual:", objc_msgSend(MEMORY[0x189603FE8], "null")) & 1) == 0
            && v23 + v22 > v13 + v12)
          {
            NSUInteger v13 = v23 + v22 - v12;
          }
        }
      }
    }

    id v17 = self->_tokenArray;
    uint64_t v18 = [MEMORY[0x189603FE8] null];
    if (v13) {
      objc_msgSend(v17, "replaceObjectsInRange:withObject:length:", v12, v13, v18, v13 + delta);
    }
    else {
      objc_msgSend(v17, "insertObject:range:", v18, v12, delta);
    }
  }

  id orthographyArray = self->_orthographyArray;
  if (orthographyArray)
  {
    uint64_t v20 = [MEMORY[0x189603FE8] null];
    if (v8) {
      objc_msgSend(orthographyArray, "replaceObjectsInRange:withObject:length:", location, v8, v20, length);
    }
    else {
      objc_msgSend(orthographyArray, "insertObject:range:", v20, location, length);
    }
  }

  reserved = self->_reserved;
  if (reserved) {
    off_18C496F58(reserved, location, length, delta);
  }
}

- (void)_setOrthography:(id)a3 range:(_NSRange)a4
{
  if (self->_reserved)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    v7 = (const __CFString *)[a3 dominantLanguage];
    if (v7) {
      CFLocaleRef v8 = CFLocaleCreate(0LL, v7);
    }
    else {
      CFLocaleRef v8 = 0LL;
    }
    off_18C496F60(self->_reserved, v8, location, length);
    if (v8) {
      CFRelease(v8);
    }
  }

- (void)_nativeSetOrthography:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v9 = -[NSString length](self->_string, "length");
  if (v9 < length || location > v9 - length)
  {
    uint64_t v24 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v24);
    -[NSLinguisticTagger setOrthography:range:](v25, v26, v27, v28);
  }

  else if (length)
  {
    unint64_t orthographyArray = (unint64_t)self->_orthographyArray;
    if ((unint64_t)a3 | orthographyArray)
    {
      if (!orthographyArray)
      {
        NSUInteger v12 = -[NSRLEArray init]( +[NSMutableRLEArray allocWithZone:]( &OBJC_CLASS___NSMutableRLEArray,  "allocWithZone:",  -[NSLinguisticTagger zone](self, "zone")),  "init");
        self->_unint64_t orthographyArray = v12;
        -[NSMutableRLEArray insertObject:range:]( v12,  "insertObject:range:",  [MEMORY[0x189603FE8] null],  0,  -[NSString length](self->_string, "length"));
        unint64_t orthographyArray = (unint64_t)self->_orthographyArray;
      }

      unint64_t v13 = [(id)orthographyArray count];
      unint64_t v14 = location + length;
      if (location + length >= v13) {
        unint64_t v14 = v13;
      }
      if (location) {
        unint64_t v15 = 0LL;
      }
      else {
        unint64_t v15 = v14;
      }
      unint64_t v16 = v14 - location;
      if (location < v13) {
        NSUInteger v17 = location;
      }
      else {
        NSUInteger v17 = 0LL;
      }
      if (location < v13) {
        unint64_t v18 = v16;
      }
      else {
        unint64_t v18 = v15;
      }
      id v19 = self->_orthographyArray;
      if (a3)
      {
        uint64_t v20 = v19;
        NSUInteger v21 = v17;
        uint64_t v22 = v18;
        id v23 = a3;
      }

      else
      {
        id v23 = (id)[MEMORY[0x189603FE8] null];
        uint64_t v20 = v19;
        NSUInteger v21 = v17;
        uint64_t v22 = v18;
      }

      objc_msgSend(v20, "replaceObjectsInRange:withObject:length:", v21, v22, v23, v18);
    }
  }

- (void)setOrthography:(NSOrthography *)orthography range:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  -[NSLinguisticTagger _nativeSetOrthography:range:](self, "_nativeSetOrthography:range:");
  if (self->_reserved) {
    -[NSLinguisticTagger _setOrthography:range:](self, "_setOrthography:range:", orthography, location, length);
  }
}

- (void)_detectOrthographyIfNeededAtIndex:(unint64_t)a3
{
  id orthographyArray = self->_orthographyArray;
  if (!orthographyArray
    || [orthographyArray count] <= a3
    || (uint64_t v6 = (void *)[self->_orthographyArray objectAtIndex:a3 effectiveRange:0],
        objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x189603FE8], "null"))))
  {
    reserved = self->_reserved;
    if (reserved)
    {
      CFLocaleRef v8 = (const void *)off_18C496F68(reserved, 2LL, a3, @"Script");
      uint64_t v9 = off_18C496F68(self->_reserved, 2LL, a3, @"Language");
      unint64_t v10 = (const void *)v9;
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        if (!v8)
        {
          if (!v9) {
            return;
          }
          goto LABEL_12;
        }
      }

      else
      {
        uint64_t v12 = -[NSString paragraphRangeForRange:](self->_string, "paragraphRangeForRange:", a3, 0LL);
        uint64_t v14 = v13;
        unint64_t v15 = (void *)off_18C496F70(self->_reserved, 2LL, a3);
        NSUInteger v17 = v15;
        if (!v15 || (v18 = [v15 objectForKey:v8], uint64_t v16 = (uint64_t)v17, !v18)) {
          uint64_t v16 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", v10, v16),  v8);
        }
        -[NSLinguisticTagger _nativeSetOrthography:range:]( self,  "_nativeSetOrthography:range:",  +[NSOrthography _orthographyWithDominantScript:languageMap:]( &OBJC_CLASS___NSOrthography,  "_orthographyWithDominantScript:languageMap:",  v8,  v16),  v12,  v14);
        if (v17) {
          CFRelease(v17);
        }
      }

      CFRelease(v8);
      if (!v10) {
        return;
      }
LABEL_12:
      CFRelease(v10);
    }
  }

- (NSOrthography)orthographyAtIndex:(NSUInteger)charIndex effectiveRange:(NSRangePointer)effectiveRange
{
  if (-[NSString length](self->_string, "length") <= charIndex)
  {
    unint64_t v15 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v15);
    return (NSOrthography *)-[NSLinguisticTagger _sentenceRangeForRange:](v16, v17, v18).location;
  }

  if (self->_reserved) {
    -[NSLinguisticTagger _detectOrthographyIfNeededAtIndex:](self, "_detectOrthographyIfNeededAtIndex:", charIndex);
  }
  id orthographyArray = self->_orthographyArray;
  if (orthographyArray)
  {
    NSUInteger v9 = [orthographyArray count];
    if (v9 > charIndex)
    {
      unint64_t v10 = (NSOrthography *)[self->_orthographyArray objectAtIndex:charIndex effectiveRange:effectiveRange];
      goto LABEL_14;
    }

    if (effectiveRange)
    {
      NSUInteger v12 = v9;
      NSUInteger v13 = -[NSString length](self->_string, "length");
      unint64_t v10 = 0LL;
      if (v13 <= charIndex)
      {
        effectiveRange->NSUInteger location = charIndex;
        effectiveRange->NSUInteger length = 1LL;
      }

      else
      {
        effectiveRange->NSUInteger location = v12;
        effectiveRange->NSUInteger length = v13 - v12;
      }

      goto LABEL_14;
    }
  }

  else if (effectiveRange)
  {
    NSUInteger v11 = -[NSString length](self->_string, "length");
    unint64_t v10 = 0LL;
    effectiveRange->NSUInteger location = 0LL;
    effectiveRange->NSUInteger length = v11;
    goto LABEL_14;
  }

  unint64_t v10 = 0LL;
LABEL_14:
  if (-[NSOrthography isEqual:](v10, "isEqual:", [MEMORY[0x189603FE8] null])) {
    return 0LL;
  }
  else {
    return v10;
  }
}

- (_NSRange)_sentenceRangeForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  NSUInteger v7 = -[NSString length](-[NSLinguisticTagger string](self, "string"), "length");
  NSUInteger v8 = location + length;
  if (location + length > v7)
  {
    NSUInteger v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
  }

  if (v7)
  {
    reserved = self->_reserved;
    if (reserved)
    {
      off_18C496F78(&v16, reserved, 1LL, location);
      NSUInteger location = v16;
      NSUInteger v10 = v17;
      if (length)
      {
        off_18C496F78(&v14, self->_reserved, 1LL, v8 - 1);
        if (v15 + v14 <= v10 + location) {
          NSUInteger length = v10;
        }
        else {
          NSUInteger length = v15 + v14 - location;
        }
      }

      else
      {
        NSUInteger length = v17;
      }
    }
  }

  else
  {
    NSUInteger location = 0LL;
    NSUInteger length = 0LL;
  }

  NSUInteger v11 = location;
  NSUInteger v12 = length;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (id)_tagAtIndex:(unint64_t)a3 scheme:(id)a4 tokenRange:(_NSRange *)a5 sentenceRange:(_NSRange *)a6
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (-[NSString length](self->_string, "length") <= a3)
  {
    uint64_t v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v18);
  }

  id v12 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", a4);
  if (!v12) {
    return 0LL;
  }
  id v13 = v12;
  reserved = self->_reserved;
  if (!reserved) {
    return 0LL;
  }
  uint64_t v15 = (void *)off_18C496F68(reserved, 0LL, a3, v13);
  id v16 = tagForNLTag(v15);
  if (v15) {
    CFRelease(v15);
  }
  if (a5)
  {
    off_18C496F78(&v19, self->_reserved, 0LL, a3);
    *a5 = v19;
  }

  if (a6)
  {
    off_18C496F78(&v19, self->_reserved, 1LL, a3);
    *a6 = v19;
  }

  return v16;
}

- (NSArray)possibleTagsAtIndex:(NSUInteger)charIndex scheme:(NSString *)tagScheme tokenRange:(NSRangePointer)tokenRange sentenceRange:(NSRangePointer)sentenceRange scores:(NSArray *)scores
{
  uint64_t v137 = *MEMORY[0x1895F89C0];
  LODWORD(v7) = 1.0;
  uint64_t v15 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v7);
  if (-[NSString length](self->_string, "length") <= charIndex)
  {
    v114 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v114);
  }

  id v16 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", tagScheme);
  if (!v16) {
    return 0LL;
  }
  NSUInteger v17 = v16;
  v121 = v15;
  NSRangePointer v122 = tokenRange;
  unint64_t v126 = 0LL;
  uint64_t v125 = 0LL;
  id v18 = -[NSLinguisticTagger _tokenDataForParagraphAtIndex:paragraphRange:tagScheme:]( self,  "_tokenDataForParagraphAtIndex:paragraphRange:tagScheme:",  charIndex,  &v125,  v16);
  uint64_t v19 = [v18 bytes];
  unint64_t v20 = (unint64_t)[v18 length] >> 4;
  uint64_t v21 = v125;
  unint64_t v22 = v126;
  id v23 = (NSRange *)sentenceRangeAtIndexInTokens(charIndex, v125, v126, v19, v20, (uint64_t *)&v123);
  NSUInteger v25 = v21 + *(unsigned __int16 *)(v19 + 16 * v123);
  if (v25 > charIndex)
  {
    v120 = scores;
    scores = (NSArray **)(v25 - (void)v23);
    if (v17 == @"NameType"
      || v17 == @"LexicalClass"
      || v17 == @"NameTypeOrLexicalClass"
      || v17 == @"PossibleClasses"
      || v17 == @"InternalClass")
    {
      v30 = @"Whitespace";
    }

    else
    {
      v30 = 0LL;
    }

    if (v17 == @"TokenType") {
      v31 = @"Whitespace";
    }
    else {
      v31 = v30;
    }
    v32 = 0LL;
    tokenRange = v23;
    goto LABEL_23;
  }

  uint64_t v36 = v124;
  if (v123 >= v124 + v123)
  {
    v32 = 0LL;
LABEL_48:
    p_NSUInteger location = &v122->location;
    goto LABEL_49;
  }

  v120 = scores;
  v119 = sentenceRange;
  v37 = (unsigned __int16 *)(v19 + 16 * v123);
  unint64_t v38 = v123 + 1;
  while (1)
  {
    uint64_t v39 = *v37;
    tokenRange = (NSRangePointer)(v21 + v39);
    scores = (NSArray **)*((unsigned __int8 *)v37 + 2);
    v40 = (NSRange *)((char *)scores + v21 + v39);
    if (v21 + v39 <= charIndex && (unint64_t)v40 > charIndex)
    {
      unint64_t v48 = *((unsigned __int8 *)v37 + 3);
      if ((v48 - 14) > 0x4A)
      {
        p_NSUInteger location = &v122->location;
        if ((v48 - 2) > 0xB)
        {
          sentenceRange = v119;
          if ((_DWORD)v48 == 1)
          {
            v32 = 0LL;
            if (v17 == @"LexicalClass"
              || v17 == @"TokenType"
              || v17 == @"NameType"
              || v17 == @"NameTypeOrLexicalClass"
              || v17 == @"PossibleClasses"
              || v17 == @"InternalClass")
            {
              v31 = @"Other";
            }

            else
            {
              v31 = 0LL;
            }

            goto LABEL_24;
          }
        }

        else
        {
          sentenceRange = v119;
          if (v17 == @"TokenType")
          {
LABEL_119:
            v32 = 0LL;
            v31 = @"Punctuation";
            goto LABEL_24;
          }

          if (v17 == @"PossibleClasses"
            || v17 == @"NameTypeOrLexicalClass"
            || v17 == @"LexicalClass"
            || v17 == @"NameType")
          {
            v32 = 0LL;
            v31 = @"SentenceTerminator";
            switch((int)v48)
            {
              case 2:
                goto LABEL_24;
              case 5:
                v32 = 0LL;
                v31 = @"OpenQuote";
                goto LABEL_24;
              case 6:
                v32 = 0LL;
                v31 = @"CloseQuote";
                goto LABEL_24;
              case 7:
                v32 = 0LL;
                v31 = @"OpenParenthesis";
                goto LABEL_24;
              case 8:
                v32 = 0LL;
                v31 = @"CloseParenthesis";
                goto LABEL_24;
              case 9:
                v32 = 0LL;
                v31 = @"WordJoiner";
                goto LABEL_24;
              case 11:
                v32 = 0LL;
                v31 = @"Dash";
                goto LABEL_24;
              case 13:
                goto LABEL_119;
              default:
                goto LABEL_49;
            }

            goto LABEL_49;
          }

          if (v17 == @"InternalClass")
          {
            v50 = v23;
            NSUInteger v51 = v24;
            v52 = (void *)internalTagForCategory_internalTagArray;
            if (!internalTagForCategory_internalTagArray)
            {
              v52 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  @"NONE",  @"OTHER",  @".",  @"?",  @"!",  @"“",  @"”",  @"("),  @"",  @"-",  @",",  @"--",  @":",  @"SYM",  @"ABB",  @"ACK",  @"CC",  @"CD",  @"CS",  @"DT",  @"DTO",  @"DTP",  @"DTW",  @"EX",  @"FW",  @"IN",  @"JJ",  @"JJR",  @"JJS",  @"LS",  @"NN",  @"NNS",  @"NNP",  @"NNPS",  @"PRE",  @"PRP",  @"PRPD",  @"PRPR",  @"PRPS",  @"PRPT",  @"RB",  @"RBC",  @"RBN",  @"RBP",  @"RBR",  @"RBS",  @"RBW",
                              @"RP",
                              @"RPP",
                              @"TO",
                              @"UH",
                              @"URL",
                              @"VB",
                              @"VBC",
                              @"VBD",
                              @"VBF",
                              @"VBG",
                              @"VBI",
                              @"VBM",
                              @"VBN",
                              @"VBP");
              internalTagForCategory_internalTagArray = (uint64_t)v52;
            }

            if ([v52 count] <= v48)
            {
              v32 = 0LL;
              v31 = @"NONE";
            }

            else
            {
              v31 = (const __CFString *)[(id)internalTagForCategory_internalTagArray objectAtIndex:v48];
              v32 = 0LL;
            }

            sentenceRange = v119;
            NSUInteger v24 = v51;
            id v23 = v50;
            goto LABEL_24;
          }
        }

        v32 = 0LL;
        goto LABEL_49;
      }

      id orthographyArray = self->_orthographyArray;
      string = self->_string;
      if (v17 == @"TokenType")
      {
        v31 = @"Word";
      }

      else if (v17 == @"NameTypeOrLexicalClass" || v17 == @"LexicalClass" || v17 == @"NameType")
      {
        if ((v48 & 0xFFFFFFFFFFFFFFFBLL) == 0x43)
        {
          BOOL v63 = v17 == @"NameTypeOrLexicalClass" || v17 == @"NameType";
          v64 = @"PersonalName";
LABEL_140:
          if (v63) {
            v31 = v64;
          }
          else {
            v31 = @"Noun";
          }
        }

        else
        {
          switch(*((_BYTE *)v37 + 3))
          {
            case 'D':
            case 'H':
              BOOL v63 = v17 == @"NameTypeOrLexicalClass" || v17 == @"NameType";
              v64 = @"PlaceName";
              goto LABEL_140;
            case 'E':
            case 'I':
              BOOL v63 = v17 == @"NameTypeOrLexicalClass" || v17 == @"NameType";
              v64 = @"OrganizationName";
              goto LABEL_140;
            case 'F':
            case 'G':
            case 'J':
              goto LABEL_132;
            case 'K':
              goto LABEL_133;
            default:
LABEL_132:
              if ((v48 & 0xFE) == 0x20)
              {
LABEL_133:
                if (v17 == @"NameType") {
                  v31 = @"OtherWord";
                }
                else {
                  v31 = @"Noun";
                }
              }

              else
              {
                v31 = @"OtherWord";
                switch(*((_BYTE *)v37 + 3))
                {
                  case 0x10:
                  case 0x12:
                  case 0x54:
                    v112 = @"Conjunction";
                    goto LABEL_246;
                  case 0x11:
                  case 0x1D:
                  case 0x53:
                    v112 = @"Number";
                    goto LABEL_246;
                  case 0x13:
                  case 0x14:
                  case 0x15:
                  case 0x16:
                  case 0x50:
                    v112 = @"Determiner";
                    goto LABEL_246;
                  case 0x17:
                  case 0x23:
                  case 0x24:
                  case 0x25:
                  case 0x26:
                  case 0x27:
                  case 0x41:
                  case 0x42:
                  case 0x4F:
                    v112 = @"Pronoun";
                    goto LABEL_246;
                  case 0x19:
                  case 0x52:
                    v112 = @"Preposition";
                    goto LABEL_246;
                  case 0x1A:
                  case 0x1B:
                  case 0x1C:
                  case 0x4D:
                    v112 = @"Adjective";
                    goto LABEL_246;
                  case 0x22:
                  case 0x2B:
                  case 0x2F:
                  case 0x30:
                  case 0x31:
                  case 0x51:
                    v112 = @"Particle";
                    goto LABEL_246;
                  case 0x28:
                  case 0x29:
                  case 0x2A:
                  case 0x2D:
                  case 0x2E:
                  case 0x4E:
                    v112 = @"Adverb";
                    goto LABEL_246;
                  case 0x32:
                  case 0x55:
                    v112 = @"Interjection";
                    goto LABEL_246;
                  case 0x34:
                  case 0x35:
                  case 0x36:
                  case 0x37:
                  case 0x38:
                  case 0x39:
                  case 0x3A:
                  case 0x3B:
                  case 0x3C:
                  case 0x3D:
                  case 0x3E:
                  case 0x3F:
                  case 0x40:
                  case 0x4C:
                    v112 = @"Verb";
                    goto LABEL_246;
                  case 0x56:
                    v112 = @"Classifier";
                    goto LABEL_246;
                  case 0x57:
                    v112 = @"Idiom";
LABEL_246:
                    if (v17 != @"NameType") {
                      v31 = v112;
                    }
                    break;
                  default:
                    goto LABEL_143;
                }
              }

              break;
          }
        }
      }

      else if (v17 == @"InternalClass")
      {
        v65 = v23;
        NSUInteger v66 = v24;
        v67 = (void *)internalTagForCategory_internalTagArray;
        if (!internalTagForCategory_internalTagArray)
        {
          v67 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  @"NONE",  @"OTHER",  @".",  @"?",  @"!",  @"“",  @"”",  @"("),  @"",  @"-",  @",",  @"--",  @":",  @"SYM",  @"ABB",  @"ACK",  @"CC",  @"CD",  @"CS",  @"DT",  @"DTO",  @"DTP",  @"DTW",  @"EX",  @"FW",  @"IN",  @"JJ",  @"JJR",  @"JJS",  @"LS",  @"NN",  @"NNS",  @"NNP",  @"NNPS",  @"PRE",  @"PRP",  @"PRPD",  @"PRPR",  @"PRPS",  @"PRPT",  @"RB",  @"RBC",  @"RBN",  @"RBP",  @"RBR",  @"RBS",  @"RBW",
                          @"RP",
                          @"RPP",
                          @"TO",
                          @"UH",
                          @"URL",
                          @"VB",
                          @"VBC",
                          @"VBD",
                          @"VBF",
                          @"VBG",
                          @"VBI",
                          @"VBM",
                          @"VBN",
                          @"VBP");
          internalTagForCategory_internalTagArray = (uint64_t)v67;
        }

        if ([v67 count] <= v48) {
          v31 = @"NONE";
        }
        else {
          v31 = (const __CFString *)[(id)internalTagForCategory_internalTagArray objectAtIndex:v48];
        }
        NSUInteger v24 = v66;
        id v23 = v65;
      }

      else
      {
        v31 = 0LL;
      }

- (NSArray)tagsInRange:(NSRange)range scheme:(NSString *)tagScheme options:(NSLinguisticTaggerOptions)opts tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3052000000LL;
  NSUInteger v25 = __Block_byref_object_copy__22;
  SEL v26 = __Block_byref_object_dispose__22;
  uint64_t v27 = [MEMORY[0x189603FA8] array];
  uint64_t v16 = 0LL;
  NSUInteger v17 = &v16;
  uint64_t v18 = 0x3052000000LL;
  uint64_t v19 = __Block_byref_object_copy__22;
  unint64_t v20 = __Block_byref_object_dispose__22;
  if (tokenRanges) {
    uint64_t v12 = [MEMORY[0x189603FA8] array];
  }
  else {
    uint64_t v12 = 0LL;
  }
  uint64_t v21 = v12;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __61__NSLinguisticTagger_tagsInRange_scheme_options_tokenRanges___block_invoke;
  v15[3] = &unk_189CA23E0;
  v15[4] = &v22;
  v15[5] = &v16;
  -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:]( self,  "enumerateTagsInRange:scheme:options:usingBlock:",  location,  length,  tagScheme,  opts,  v15);
  if (tokenRanges) {
    *tokenRanges = (NSArray *)v17[5];
  }
  id v13 = (NSArray *)v23[5];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __61__NSLinguisticTagger_tagsInRange_scheme_options_tokenRanges___block_invoke( uint64_t a1,  const __CFString *a2,  uint64_t a3,  uint64_t a4)
{
  if (a2) {
    double v7 = a2;
  }
  else {
    double v7 = &stru_189CA6A28;
  }
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  NSUInteger v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v9) {
    return objc_msgSend(v9, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4));
  }
  return result;
}

- (void)enumerateTagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v19[7] = *MEMORY[0x1895F89C0];
  if (range.location + range.length > -[NSString length](self->_string, "length"))
  {
    uint64_t v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v18);
  }

  id v15 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", scheme);
  if (v15)
  {
    id v16 = v15;
    reserved = self->_reserved;
    if (reserved)
    {
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __74__NSLinguisticTagger_enumerateTagsInRange_unit_scheme_options_usingBlock___block_invoke;
      v19[3] = &unk_189CA2408;
      v19[4] = self;
      v19[5] = v16;
      v19[6] = block;
      off_18C496F80(reserved, unit, location, length, options, v19);
    }
  }

void __74__NSLinguisticTagger_enumerateTagsInRange_unit_scheme_options_usingBlock___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x186E1FF60]();
  v3 = (void *)off_18C496F88(*(void *)(a1[4] + 48LL), a1[5]);
  tagForNLTag(v3);
  (*(void (**)(void))(a1[6] + 16LL))();
  if (v3) {
    CFRelease(v3);
  }
  objc_autoreleasePoolPop(v2);
}

- (NSLinguisticTag)tagAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme tokenRange:(NSRangePointer)tokenRange
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (-[NSString length](self->_string, "length") <= charIndex)
  {
    uint64_t v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v18);
  }

  id v12 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", scheme);
  if (!v12) {
    return 0LL;
  }
  id v13 = v12;
  reserved = self->_reserved;
  if (!reserved) {
    return 0LL;
  }
  id v15 = (void *)off_18C496F68(reserved, unit, charIndex, v13);
  id v16 = (NSString *)tagForNLTag(v15);
  if (v15) {
    CFRelease(v15);
  }
  if (tokenRange)
  {
    off_18C496F78(&v19, self->_reserved, 0LL, charIndex);
    *tokenRange = v19;
  }

  return v16;
}

- (NSArray)tagsInRange:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v17[6] = *MEMORY[0x1895F89C0];
  uint64_t v14 = (NSArray *)[MEMORY[0x189603FA8] array];
  if (tokenRanges) {
    id v15 = (NSArray *)[MEMORY[0x189603FA8] array];
  }
  else {
    id v15 = 0LL;
  }
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __66__NSLinguisticTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke;
  v17[3] = &unk_189CA2430;
  v17[4] = v14;
  v17[5] = v15;
  -[NSLinguisticTagger enumerateTagsInRange:unit:scheme:options:usingBlock:]( self,  "enumerateTagsInRange:unit:scheme:options:usingBlock:",  location,  length,  unit,  scheme,  options,  v17);
  if (tokenRanges) {
    *tokenRanges = v15;
  }
  return v14;
}

uint64_t __66__NSLinguisticTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke( uint64_t a1,  const __CFString *a2,  uint64_t a3,  uint64_t a4)
{
  if (a2) {
    double v7 = a2;
  }
  else {
    double v7 = &stru_189CA6A28;
  }
  uint64_t result = [*(id *)(a1 + 32) addObject:v7];
  NSUInteger v9 = *(void **)(a1 + 40);
  if (v9) {
    return objc_msgSend(v9, "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4));
  }
  return result;
}

- (NSRange)tokenRangeAtIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit
{
  v12[3] = *MEMORY[0x1895F89C0];
  if (-[NSString length](self->_string, "length") <= charIndex)
  {
    NSUInteger v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }

  reserved = self->_reserved;
  if (reserved)
  {
    off_18C496F78(v12, reserved, unit, charIndex);
    NSUInteger v9 = v12[0];
    NSUInteger v10 = v12[1];
  }

  else
  {
    NSUInteger v10 = 0LL;
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (NSString)dominantLanguage
{
  if (!-[NSString length](self->_string, "length")) {
    return 0LL;
  }
  reserved = self->_reserved;
  if (!reserved) {
    return 0LL;
  }
  objc_super v4 = (void *)off_18C496F68(reserved, 3LL, 0LL, @"Language");
  objc_super v5 = (NSString *)tagForNLTag(v4);
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

+ (NSLinguisticTag)tagForString:(NSString *)string atIndex:(NSUInteger)charIndex unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme orthography:(NSOrthography *)orthography tokenRange:(NSRangePointer)tokenRange
{
  uint64_t v14 = objc_alloc(&OBJC_CLASS___NSLinguisticTagger);
  id v15 = -[NSLinguisticTagger initWithTagSchemes:options:]( v14,  "initWithTagSchemes:options:",  [MEMORY[0x189603F18] arrayWithObject:scheme],  0x80000000);
  -[NSLinguisticTagger setString:](v15, "setString:", string);
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:]( v15,  "setOrthography:range:",  orthography,  0LL,  -[NSString length](string, "length"));
  }
  id v16 = -[NSLinguisticTagger tagAtIndex:unit:scheme:tokenRange:]( v15,  "tagAtIndex:unit:scheme:tokenRange:",  charIndex,  unit,  scheme,  tokenRange);

  return v16;
}

+ (NSArray)tagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  id v15 = objc_alloc(&OBJC_CLASS___NSLinguisticTagger);
  id v16 = -[NSLinguisticTagger initWithTagSchemes:options:]( v15,  "initWithTagSchemes:options:",  [MEMORY[0x189603F18] arrayWithObject:scheme],  0x80000000);
  -[NSLinguisticTagger setString:](v16, "setString:", string);
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:]( v16,  "setOrthography:range:",  orthography,  0LL,  -[NSString length](string, "length"));
  }
  NSUInteger v17 = -[NSLinguisticTagger tagsInRange:unit:scheme:options:tokenRanges:]( v16,  "tagsInRange:unit:scheme:options:tokenRanges:",  location,  length,  unit,  scheme,  options,  tokenRanges);

  return v17;
}

+ (void)enumerateTagsForString:(NSString *)string range:(NSRange)range unit:(NSLinguisticTaggerUnit)unit scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  id v15 = objc_alloc(&OBJC_CLASS___NSLinguisticTagger);
  id v16 = -[NSLinguisticTagger initWithTagSchemes:options:]( v15,  "initWithTagSchemes:options:",  [MEMORY[0x189603F18] arrayWithObject:scheme],  0x80000000);
  -[NSLinguisticTagger setString:](v16, "setString:", string);
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:]( v16,  "setOrthography:range:",  orthography,  0LL,  -[NSString length](string, "length"));
  }
  -[NSLinguisticTagger enumerateTagsInRange:unit:scheme:options:usingBlock:]( v16,  "enumerateTagsInRange:unit:scheme:options:usingBlock:",  location,  length,  unit,  scheme,  options,  block);
}

+ (NSString)dominantLanguageForString:(NSString *)string
{
  objc_super v4 = objc_alloc(&OBJC_CLASS___NSLinguisticTagger);
  objc_super v5 = -[NSLinguisticTagger initWithTagSchemes:options:]( v4,  "initWithTagSchemes:options:",  [MEMORY[0x189603F18] arrayWithObject:@"Language"],  0x80000000);
  -[NSLinguisticTagger setString:](v5, "setString:", string);
  uint64_t v6 = -[NSLinguisticTagger dominantLanguage](v5, "dominantLanguage");

  return v6;
}

- (BOOL)_acceptSentenceTerminatorRange:(_NSRange)a3 paragraphRange:(_NSRange)a4 tokens:(_NSLTToken *)a5 count:(unint64_t)a6 tokenIndex:(unint64_t)a7
{
  NSUInteger location = a4.location;
  if (-[NSString characterAtIndex:](self->_string, "characterAtIndex:", a3.location, a3.length, a4.location, a4.length) == 46)
  {
    if (!a7) {
      goto LABEL_14;
    }
    NSUInteger v11 = &a5[a7 - 1];
    int var1 = v11->var1;
    if (var1 + v11->var0 != a5[a7].var0) {
      goto LABEL_14;
    }
    if (var1 == 1) {
      return 0;
    }
    if (!qword_18C496F90) {
      qword_18C496F90 = objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  @"mr",  @"mrs",  @"ms",  @"messrs",  @"mme",  @"mmes",  @"mlle",  @"sr",  @"sra",  @"srta",  @"dr",  @"drs",  @"pres",  @"sen",  @"atty",  @"supt",  @"amb",  @"lcdo",  @"ldo",  @"st",  @"msgr",  @"fr",  @"rdo",  @"adm",  @"col",  @"maj",  @"cmdr",  @"cdr",  @"capt",  @"lieut",  @"lt",  @"sgt",  @"cpl",  @"pvt",  @"jan",  @"feb",  @"febr",  @"apr",  @"jun",  @"jul",  @"aug",  @"sep",  @"oct",  @"nov",  @"dec",  @"ph",  @"eg",
    }
                          @"ie",
                          @"viz",
                          @"vs",
                          0LL);
    if (!qword_18C496F98) {
      qword_18C496F98 = objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  @"M",  @"Hon",  @"Rep",  @"Gov",  @"Sec",  @"Prof",  @"Ing",  @"Rev",  @"Gen",  @"Ens",  @"Spec",  @"Mar",  @"Sept",  0);
    }
    if (v11->var1)
    {
      id v13 = -[NSString substringWithRange:](self->_string, "substringWithRange:", location + v11->var0);
      uint64_t v14 = -[NSString lowercaseString](v13, "lowercaseString");
      if (([(id)qword_18C496F98 containsObject:v13] & 1) != 0
        || ([(id)qword_18C496F90 containsObject:v14] & 1) != 0)
      {
        return 0;
      }

      char v15 = [@"no" isEqualToString:v14] ^ 1;
    }

    else
    {
LABEL_14:
      char v15 = 1;
    }

    unint64_t v16 = a7 + 1;
    if (a7 + 1 < a6)
    {
      NSUInteger v17 = &a5[v16];
      int var2 = v17->var2;
      if ((var2 - 14) > 0x4A)
      {
        if ((var2 - 2) <= 0xB)
        {
          uint64_t var0 = v17->var0;
          if (a5[a7].var1 + a5[a7].var0 == (_DWORD)var0)
          {
            -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496F18,  8LL,  location + var0,  a5[v16].var1);
          }
        }
      }

      else if (a5[a7].var1 + a5[a7].var0 == v17->var0)
      {
        return 0;
      }

      unint64_t v21 = a7 + 2;
      p_int var2 = &a5[a7 + 1].var2;
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if (*p_var2 - 14 > 0x4A)
        {
          uint64_t v24 = 0LL;
        }

        else
        {
          uint64_t v23 = location + *(unsigned __int16 *)(p_var2 - 3);
          uint64_t v24 = *(p_var2 - 1);
          if (*(p_var2 - 1)) {
            break;
          }
        }

        p_var2 += 16;
      }

      while (v21++ < a6);
      if (v24)
      {
        -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  +[NSCharacterSet lowercaseLetterCharacterSet](&OBJC_CLASS___NSCharacterSet, "lowercaseLetterCharacterSet"),  8LL,  v23,  v24);
        if (v26) {
          return 0;
        }
        if ((v15 & 1) == 0)
        {
          -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496F28,  8LL,  v23,  v24);
          if (v28) {
            return 0;
          }
        }
      }
    }
  }

  return 1;
}

- (void)_acceptSentencesForParagraphRange:(_NSRange)a3
{
  if ((unint64_t)qword_18C496FA0 >= 2)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    uint64_t v6 = 0LL;
    uint64_t v7 = 24LL;
    do
    {
      if (*(_BYTE *)(qword_18C496FA8 + v7 - 21) != 2
        || -[NSLinguisticTagger _acceptSentenceTerminatorRange:paragraphRange:tokens:count:tokenIndex:]( self,  "_acceptSentenceTerminatorRange:paragraphRange:tokens:count:tokenIndex:",  location + *(unsigned __int16 *)(qword_18C496FA8 + v7 - 24),  *(unsigned __int8 *)(qword_18C496FA8 + v7 - 22),  location,  length,  v6))
      {
        goto LABEL_16;
      }

      uint64_t v8 = qword_18C496FA8;
      int v9 = *(unsigned __int8 *)(qword_18C496FA8 + v7 - 22);
      if (v6 && v9 == 1)
      {
        if (*(unsigned __int8 *)(qword_18C496FA8 + v7 - 37) - 14 <= 0x4A
          && *(unsigned __int8 *)(qword_18C496FA8 + v7 - 38) + *(unsigned __int16 *)(qword_18C496FA8 + v7 - 40) == *(unsigned __int16 *)(qword_18C496FA8 + v7 - 24))
        {
          uint64_t v10 = v6 - 1;
          goto LABEL_14;
        }
      }

      else if (v9 != 1)
      {
        goto LABEL_15;
      }

      int v11 = *(unsigned __int8 *)(qword_18C496FA8 + v7 - 5);
      if ((v11 - 14) > 0x4A
        || *(unsigned __int16 *)(qword_18C496FA8 + v7 - 24) + 1 != *(unsigned __int16 *)(qword_18C496FA8 + v7 - 8))
      {
LABEL_15:
        *(_BYTE *)(qword_18C496FA8 + v7 - 21) = 13;
        goto LABEL_16;
      }

      uint64_t v12 = qword_18C496FA8 + v7;
      *(_BYTE *)(v12 - 21) = v11;
      *(void *)(v12 - 16) = *(void *)(v8 + v7);
      uint64_t v10 = v6;
LABEL_14:
      joinTokensInRange(v8, v10, 2uLL);
LABEL_16:
      unint64_t v13 = v6 + 2;
      ++v6;
      v7 += 16LL;
    }

    while (v13 < qword_18C496FA0);
  }

- (void)_calculateSentenceRangesForParagraphRange:(_NSRange)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = a3.location + a3.length;
  if (a3.location < a3.location + a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    unint64_t v6 = 0LL;
    unint64_t v8 = qword_18C496FA0;
    uint64_t v7 = qword_18C496FA8;
    uint64_t v9 = qword_18C496FB0;
    NSUInteger v10 = a3.location;
    do
    {
      uint64_t v11 = sentenceRangeAtIndexInTokens(v10, location, length, v7, v8, &v14);
      if (v6 < 0x100)
      {
        unint64_t v13 = (_WORD *)(v9 + 8 * v6);
        _WORD *v13 = v11 - location;
        v13[1] = v12;
        v13[2] = v14;
        v13[3] = v15;
        ++v6;
      }

      NSUInteger v10 = v11 + v12;
    }

    while (v10 < v3);
  }

- (void)_analyzePunctuationTokensInRange:(_NSRange)a3 paragraphRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  if (a3.length)
  {
    NSUInteger location = a4.location;
    NSUInteger v5 = a3.length;
    NSUInteger v6 = a3.location;
    do
    {
      unint64_t v8 = -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496EE8,  0LL,  v6,  v5);
      unint64_t v9 = v8;
      NSUInteger v10 = v6 + v5;
      if (v11) {
        BOOL v12 = v8 >= v10;
      }
      else {
        BOOL v12 = 1;
      }
      int v13 = v12;
      if (v13) {
        unint64_t v14 = v6 + v5;
      }
      else {
        unint64_t v14 = v8;
      }
      if (v14 > v6 && (unint64_t)qword_18C496FA0 <= 0xFFF)
      {
        uint64_t v15 = qword_18C496FA8 + 16 * qword_18C496FA0;
        *(_WORD *)uint64_t v15 = v6 - location;
        *(_BYTE *)(v15 + 2) = v14 - v6;
        *(_BYTE *)(v15 + 3) = 88;
        *(_DWORD *)(v15 + 4) = 0;
        *(void *)(v15 + 8) = 0LL;
        ++qword_18C496FA0;
      }

      if ((v13 & 1) != 0) {
        return;
      }
      unint64_t v16 = -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496EF0,  0LL,  v14,  v10 - v14);
      if (v16 >= v10 || v17 == 0) {
        NSUInteger v6 = v10;
      }
      else {
        NSUInteger v6 = v16;
      }
      if (v6 > v9)
      {
        unint64_t v19 = -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496F00,  0LL,  v14,  v6 - v9);
        if (v20)
        {
          unint64_t v21 = v19;
          uint64_t v22 = v20;
          if (v19 > v9) {
            -[NSLinguisticTagger _analyzePunctuationTokensInRange:paragraphRange:]( self,  "_analyzePunctuationTokensInRange:paragraphRange:",  v14,  v19 - v9,  location,  length);
          }
          if (v6 > v21 + v22)
          {
            unint64_t v23 = -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496F08,  0LL,  v21 + v22,  v6 - (v21 + v22));
            unint64_t v24 = v23;
            if (v25) {
              BOOL v26 = v6 > v23;
            }
            else {
              BOOL v26 = 0;
            }
            int v27 = v26;
            if ((unint64_t)qword_18C496FA0 <= 0xFFF)
            {
              if (v27) {
                char v28 = v23;
              }
              else {
                char v28 = v6;
              }
              uint64_t v29 = qword_18C496FA8 + 16 * qword_18C496FA0;
              *(_WORD *)uint64_t v29 = v21 - location;
              *(_BYTE *)(v29 + 2) = v28 - v21;
              *(_BYTE *)(v29 + 3) = 2;
              *(_DWORD *)(v29 + 4) = 0;
              *(void *)(v29 + 8) = 0LL;
              ++qword_18C496FA0;
            }

            if (!v27) {
              goto LABEL_101;
            }
            NSUInteger v30 = v6 - v23;
            goto LABEL_100;
          }

          if ((unint64_t)qword_18C496FA0 <= 0xFFF)
          {
            uint64_t v39 = qword_18C496FA8 + 16 * qword_18C496FA0;
            *(_WORD *)uint64_t v39 = v21 - location;
            *(_BYTE *)(v39 + 2) = v22;
            char v40 = 2;
LABEL_53:
            *(_BYTE *)(v39 + 3) = v40;
            *(_DWORD *)(v39 + 4) = 0;
            *(void *)(v39 + 8) = 0LL;
            ++qword_18C496FA0;
          }
        }

        else
        {
          uint64_t v31 = -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496F18,  0LL,  v14,  v6 - v9);
          if (v32)
          {
            unint64_t v33 = v31;
            uint64_t v34 = v32;
            uint64_t v35 = -[NSString characterAtIndex:](self->_string, "characterAtIndex:", v31);
            int v36 = v35;
            if (v33 > v9 && (unint64_t)qword_18C496FA0 <= 0xFFF)
            {
              uint64_t v37 = qword_18C496FA8 + 16 * qword_18C496FA0;
              *(_WORD *)uint64_t v37 = v9 - location;
              *(_BYTE *)(v37 + 2) = v33 - v9;
              *(_BYTE *)(v37 + 3) = 13;
              *(_DWORD *)(v37 + 4) = 0;
              *(void *)(v37 + 8) = 0LL;
              ++qword_18C496FA0;
            }

            if ((_DWORD)v35 == 45)
            {
              for (NSUInteger i = v34 + v33;
                    i < v6 && -[NSString characterAtIndex:](self->_string, "characterAtIndex:", v33 + v34) == 45;
                    NSUInteger i = v33 + v34)
              {
                ++v34;
              }

              if (v34) {
                char v41 = 11;
              }
              else {
                char v41 = 9;
              }
              goto LABEL_97;
            }

            if (v35 >> 1 == 4104)
            {
              char v41 = 9;
              goto LABEL_97;
            }

            if ((v35 - 8210) < 4)
            {
              char v41 = 11;
              goto LABEL_97;
            }

            if ((_DWORD)v35 == 41)
            {
              char v41 = 8;
              goto LABEL_97;
            }

            if ((_DWORD)v35 == 40)
            {
              char v41 = 7;
              goto LABEL_97;
            }

            if ([(id)qword_18C496F20 characterIsMember:v35])
            {
              uint64_t v42 = 0LL;
              string = self->_string;
              while (1)
              {
                if (openingStrengthForQuoteCharacter_singleQuotes[v42] == v36)
                {
                  int v45 = 0;
                  v47 = "\x02\x03\x01\x04\x01\x03\x01\x04";
                  goto LABEL_73;
                }

                if (++v42 == 9)
                {
                  NSUInteger v44 = -[NSString length](self->_string, "length");
                  int v45 = 0;
                  unsigned int v46 = 2;
                  goto LABEL_76;
                }
              }

              int v45 = 1;
              v47 = "\x02\x03\x01\x03\x01\x04\x01\x04";
LABEL_73:
              unsigned int v46 = v47[v42];
              NSUInteger v44 = -[NSString length](self->_string, "length");
              if (v46 > 3)
              {
LABEL_74:
                char v41 = 5;
                goto LABEL_97;
              }

              if (!v46)
              {
                char v41 = 6;
                goto LABEL_97;
              }

- (void)_analyzeTokensInInterwordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4
{
  if (a3.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    NSUInteger v6 = a3.length;
    NSUInteger v7 = a3.location;
    do
    {
      unint64_t v9 = -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496ED0,  0LL,  v7,  v6);
      unint64_t v10 = v9;
      NSUInteger v11 = v7 + v6;
      if (v12) {
        BOOL v13 = v11 > v9;
      }
      else {
        BOOL v13 = 0;
      }
      int v14 = !v13;
      if (v14) {
        unint64_t v15 = v11;
      }
      else {
        unint64_t v15 = v9;
      }
      if (v15 > v7) {
        -[NSLinguisticTagger _analyzePunctuationTokensInRange:paragraphRange:]( self,  "_analyzePunctuationTokensInRange:paragraphRange:",  v7,  v15 - v7,  location,  length);
      }
      if ((v14 & 1) != 0) {
        break;
      }
      unint64_t v16 = -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496ED8,  0LL,  v10,  v11 - v10);
      BOOL v18 = v16 >= v11 || v17 == 0;
      NSUInteger v7 = v18 ? v11 : v16;
      NSUInteger v6 = v11 - v7;
    }

    while (v6);
  }

- (void)_analyzeTokensInWordRange:(_NSRange)a3 paragraphRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v6 = a3.length;
  NSUInteger v7 = a3.location;
  unint64_t v9 = -[NSString rangeOfCharacterFromSet:options:range:]( self->_string,  "rangeOfCharacterFromSet:options:range:",  qword_18C496F10,  4LL,  a3.location,  a3.length);
  if (v10) {
    BOOL v11 = v9 > v7;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    if (!v10)
    {
LABEL_27:
      if ((unint64_t)qword_18C496FA0 <= 0xFFF)
      {
        uint64_t v25 = qword_18C496FA8 + 16 * qword_18C496FA0;
        *(_WORD *)uint64_t v25 = v7 - location;
        *(_BYTE *)(v25 + 2) = v6;
        *(_BYTE *)(v25 + 3) = 88;
        *(_DWORD *)(v25 + 4) = 0;
        *(void *)(v25 + 8) = 0LL;
        ++qword_18C496FA0;
      }

      return;
    }

    goto LABEL_19;
  }

  char v12 = v7 + v6;
  NSUInteger v13 = v7 + v6 - (v9 + v10);
  if (v7 + v6 > v9 + v10)
  {
    if (v13 == 2)
    {
      -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", @"ve", 13LL, v7, v6);
      if (v37
        || (-[NSString rangeOfString:options:range:]( self->_string,  "rangeOfString:options:range:",  @"ll",  13LL,  v7,  v6),  v38)
        || (-[NSString rangeOfString:options:range:]( self->_string,  "rangeOfString:options:range:",  @"re",  13LL,  v7,  v6),  v39))
      {
        unint64_t v17 = -3LL;
        goto LABEL_47;
      }
    }

    else if (v13 == 1)
    {
      -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", @"s", 13LL, v7, v6);
      if (v14
        || (-[NSString rangeOfString:options:range:]( self->_string,  "rangeOfString:options:range:",  @"d",  13LL,  v7,  v6),  v15)
        || (-[NSString rangeOfString:options:range:]( self->_string,  "rangeOfString:options:range:",  @"m",  13LL,  v7,  v6),  v16))
      {
        -[NSString rangeOfString:options:range:]( self->_string,  "rangeOfString:options:range:",  @"t",  13LL,  v7,  v6);
        unint64_t v17 = -2LL;
        if (!v18) {
          goto LABEL_47;
        }
        int v19 = 0;
        goto LABEL_15;
      }

      -[NSString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", @"t", 13LL, v7, v6);
      if (v45)
      {
        int v19 = 1;
        unint64_t v17 = 0x8000000000000001LL;
LABEL_15:
        -[NSString rangeOfString:options:range:]( self->_string,  "rangeOfString:options:range:",  @"n",  13LL,  v7,  v6 - 2);
        if (v20) {
          unint64_t v17 = -3LL;
        }
        if (v19 && !v20) {
          goto LABEL_19;
        }
LABEL_47:
        unint64_t v40 = v17 + v6;
        -[NSLinguisticTagger _analyzeTokensInWordRange:paragraphRange:]( self,  "_analyzeTokensInWordRange:paragraphRange:",  v7,  v40,  location,  length);
        if ((unint64_t)qword_18C496FA0 <= 0xFFF)
        {
          uint64_t v41 = qword_18C496FA8 + 16 * qword_18C496FA0;
          *(_WORD *)uint64_t v41 = v40 + v7 - location;
          *(_BYTE *)(v41 + 2) = v12 - (v40 + v7);
          *(_BYTE *)(v41 + 3) = 88;
          *(_DWORD *)(v41 + 4) = 0;
          *(void *)(v41 + 8) = 0LL;
          ++qword_18C496FA0;
        }

        return;
      }
    }
  }

- (id)_tokenDataForParagraphRange:(_NSRange)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6
{
  BOOL v6 = a6;
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  uint64_t v123 = *MEMORY[0x1895F89C0];
  memset(v122, 0, sizeof(v122));
  memset(v121, 0, sizeof(v121));
  bzero(v120, 0x800uLL);
  CFIndex v118 = length;
  v119 = (CFStringRef *)self;
  v124.CFIndex location = location;
  v124.CFIndex length = length;
  char v12 = (__CFString *)CFStringTokenizerCopyBestStringLanguage((CFStringRef)self->_string, v124);
  int v13 = -[__CFString hasPrefix:](v12, "hasPrefix:", @"ja");
  int v14 = -[__CFString hasPrefix:](v12, "hasPrefix:", @"zh");
  if (v12) {
    CFRelease(v12);
  }
  qword_18C496FA0 = 0LL;
  uint64_t v15 = (void *)qword_18C496FA8;
  if (!qword_18C496FA8)
  {
    uint64_t v15 = calloc(0x1000uLL, 0x10uLL);
    qword_18C496FA8 = (uint64_t)v15;
  }

  uint64_t v16 = (void *)qword_18C496FB0;
  if (!qword_18C496FB0)
  {
    uint64_t v16 = calloc(0x100uLL, 8uLL);
    qword_18C496FB0 = (uint64_t)v16;
    uint64_t v15 = (void *)qword_18C496FA8;
  }

  unint64_t v17 = 0LL;
  if (v15 && v16)
  {
    BOOL v109 = a5;
    BOOL v110 = a4;
    if (v13)
    {
      uint64_t v18 = (__CFStringTokenizer *)qword_18C496FB8;
      if (qword_18C496FB8) {
        goto LABEL_17;
      }
      int v19 = CFLocaleCreate(0LL, @"ja");
      v125.CFIndex location = 0LL;
      v125.CFIndex length = 0LL;
      CFStringTokenizerRef v20 = CFStringTokenizerCreate(0LL, &stru_189CA6A28, v125, 0LL, v19);
      qword_18C496FB8 = (uint64_t)v20;
      if (v19)
      {
        CFRelease(v19);
        uint64_t v18 = (__CFStringTokenizer *)qword_18C496FB8;
        if (!qword_18C496FB8) {
          goto LABEL_15;
        }
LABEL_17:
        CFIndex v21 = v118;
        v127.CFIndex location = location;
        v127.CFIndex length = v118;
        CFStringTokenizerSetString(v18, v119[3], v127);
        CharactersPtr = CFStringGetCharactersPtr(v119[3]);
        BOOL v23 = v18;
        if (CharactersPtr)
        {
          unint64_t v24 = CharactersPtr;
          uint64_t v25 = (UniChar *)malloc(2 * v118);
          if (v25)
          {
            unint64_t v26 = v25;
            uint64_t v27 = &v24[location];
            uint64_t v28 = (char *)v25;
            CFIndex v21 = v118;
            if (!v118) {
              goto LABEL_49;
            }
            goto LABEL_23;
          }
        }

        else
        {
          uint64_t v29 = (const UniChar *)malloc(4 * v118);
          if (v29)
          {
            unint64_t v26 = v29;
            -[__CFString getCharacters:range:]((id)v119[3], "getCharacters:range:", v29, location, v118);
            uint64_t v28 = (char *)&v26[v118];
            uint64_t v27 = v26;
            if (!v118) {
              goto LABEL_49;
            }
LABEL_23:
            uint64_t v30 = (unsigned __int16 *)v27;
            CFIndex v31 = v21;
            do
            {
              unsigned int v33 = *v30++;
              unsigned int v32 = v33;
              unsigned int v34 = v33 - 65;
              unsigned int v35 = v33 - 192;
              if (v33 - 216 >= 7 && v34 >= 0x1A && v35 > 0x16)
              {
                if (v32 == 376)
                {
                  LOWORD(v32) = 255;
                }

                else if ((v32 & 1) != 0)
                {
                  if (v32 - 313 < 0xF || v32 - 377 < 5 || v32 - 461 < 0xF) {
                    LOWORD(v32) = v32 + 1;
                  }
                }

                else if (v32 - 256 < 0x37 {
                       || v32 - 330 < 0x2D
                }
                       || (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32( (uint32x4_t)xmmword_18399EA90,  (uint32x4_t)vaddq_s32( vdupq_n_s32(v32),  (int32x4_t)xmmword_18399EA80)))) & 1) != 0 || v32 == 500)
                {
                  LOWORD(v32) = v32 + 1;
                }
              }

              else
              {
                LOWORD(v32) = v32 + 32;
              }

              *(_WORD *)uint64_t v28 = v32;
              v28 += 2;
              --v31;
            }

            while (v31);
LABEL_49:
            uint64_t v108 = (UniChar *)v26;
            unint64_t v115 = location + v21;
            tokenizer = v23;
            char v107 = v13;
            if (!CFStringTokenizerAdvanceToNextToken(v23))
            {
              CFIndex v40 = 0LL;
              CFIndex v44 = location;
              BOOL v84 = v110;
LABEL_158:
              uint64_t v91 = (void *)-[CFStringRef orthographyAtIndex:effectiveRange:]( v119,  "orthographyAtIndex:effectiveRange:",  location,  0LL,  v104);
              unint64_t v92 = orthographyFlagsForScores(v122, (uint64_t)v121, (uint64_t)v120);
              if (!v91)
              {
                if ((_DWORD)v92)
                {
                  float v93 = +[NSSimpleOrthography orthographyWithFlags:]( &OBJC_CLASS___NSSimpleOrthography,  "orthographyWithFlags:",  v92);
                  if (v93) {
                    -[CFStringRef setOrthography:range:](v119, "setOrthography:range:", v93, location, v118);
                  }
                }
              }

              if (v115 > v40 + v44) {
                -[CFStringRef _analyzeTokensInInterwordRange:paragraphRange:]( v119,  "_analyzeTokensInInterwordRange:paragraphRange:",  v40 + v44,  v115 - (v40 + v44),  location,  v118);
              }
              -[CFStringRef _acceptSentencesForParagraphRange:]( v119,  "_acceptSentencesForParagraphRange:",  location,  v118);
              v94 = tokenizer;
              if (v84 || v109 || v6)
              {
                if (v91)
                {
                  int v95 = (void *)[v91 dominantLanguageForScript:@"Latn"];
                  if (([v95 isEqualToString:@"en"] & 1) == 0
                    && ([v95 isEqualToString:@"fr"] & 1) == 0
                    && ([v95 isEqualToString:@"de"] & 1) == 0
                    && ([v95 isEqualToString:@"es"] & 1) == 0
                    && ([v95 isEqualToString:@"it"] & 1) == 0
                    && ([v95 isEqualToString:@"pt"] & 1) == 0
                    && ([v95 isEqualToString:@"nl"] & 1) == 0
                    && ([v95 isEqualToString:@"ko"] & 1) == 0
                    && ([v95 isEqualToString:@"ru"] & 1) == 0)
                  {
                    [v95 isEqualToString:@"tr"];
                  }
                }

                if (qword_18C496FA0)
                {
                  uint64_t v96 = 0LL;
                  unint64_t v97 = 0LL;
                  do
                  {
                    uint64_t v98 = (unsigned __int16 *)(qword_18C496FA8 + v96);
                    if (*(_BYTE *)(qword_18C496FA8 + v96 + 3) == 88)
                    {
                      CFIndex v99 = location + *v98;
                      uint64_t v100 = *((unsigned __int8 *)v98 + 2);
                      -[__CFString rangeOfCharacterFromSet:options:range:]( (id)v119[3],  "rangeOfCharacterFromSet:options:range:",  qword_18C496F28,  0LL,  v99,  v100);
                      if (v101)
                      {
                        -[__CFString rangeOfCharacterFromSet:options:range:]( (id)v119[3],  "rangeOfCharacterFromSet:options:range:",  qword_18C496F30,  0LL,  v99,  v100);
                        if (!v102) {
                          *(_BYTE *)(qword_18C496FA8 + v96 + 3) = 17;
                        }
                      }
                    }

                    ++v97;
                    v96 += 16LL;
                  }

                  while (v97 < qword_18C496FA0);
                }

                v94 = tokenizer;
                if ((v107 & 1) == 0) {
                  -[CFStringRef _calculateSentenceRangesForParagraphRange:]( v119,  "_calculateSentenceRangesForParagraphRange:",  location,  v118);
                }
              }

              v128.CFIndex location = 0LL;
              v128.CFIndex length = 0LL;
              CFStringTokenizerSetString(v94, &stru_189CA6A28, v128);
              free(v108);
              return (id)[MEMORY[0x189603F48] dataWithBytes:qword_18C496FA8 length:16 * qword_18C496FA0];
            }

            BOOL v106 = v6;
            uint64_t v114 = 0LL;
            CFIndex v40 = 0LL;
            unint64_t v41 = 0LL;
            int v112 = v13 | v14;
            CFIndex v104 = -location;
            uint64_t v105 = v27;
            unint64_t v42 = location;
            uint64_t v43 = (unsigned __int16 *)&v27[-location];
            CFIndex v44 = v42;
            uint64_t v116 = 0LL;
            CFIndex v117 = v42;
            uint64_t v45 = tokenizer;
            do
            {
              CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v45);
              CFIndex v47 = CurrentTokenRange.location;
              CFIndex v48 = CurrentTokenRange.length;
              if (!v112
                || (-[__CFString rangeOfCharacterFromSet:options:range:]( (id)v119[3],  "rangeOfCharacterFromSet:options:range:",  qword_18C496EF8,  0LL,  CurrentTokenRange.location,  CurrentTokenRange.length),  v49))
              {
                CFIndex v50 = v40 + v44;
                if (CurrentTokenRange.location > v40 + v44)
                {
                  int v51 = -[__CFString characterAtIndex:]( (id)v119[3],  "characterAtIndex:",  CurrentTokenRange.location - 1);
                  if (v51 == 95 || v51 == 46)
                  {
                    CFIndex v48 = CurrentTokenRange.length + 1;
                    CFIndex v47 = CurrentTokenRange.location - 1;
                  }
                }

                CFIndex v52 = v47;
                unint64_t v53 = v48 + v47;
                if (v53 >= v115)
                {
                  CFIndex v44 = v52;
                }

                else
                {
                  CFIndex v44 = v52;
                  CFIndex v54 = v52 + 64;
                  while (1)
                  {
                    int v55 = -[__CFString characterAtIndex:]((id)v119[3], "characterAtIndex:", v53, v104, v105);
                    BOOL v56 = (v55 - 39) > 0x38
                       || ((1LL << (v55 - 39)) & 0x100000000000081LL) == 0;
                    BOOL v57 = !v56 || v55 == 8217;
                    BOOL v58 = !v57;
LABEL_77:
                    if (v58) {
                      goto LABEL_102;
                    }
LABEL_95:
                    if (!CFStringTokenizerAdvanceToNextToken(tokenizer)
                      || (CFRange v70 = CFStringTokenizerGetCurrentTokenRange(tokenizer), v70.location != v53 + 1)
                      || (unint64_t v71 = v70.location + v70.length, v70.location + v70.length > v54))
                    {
                      CFStringTokenizerGoToTokenAtIndex(tokenizer, v53);
                      goto LABEL_102;
                    }

                    CFIndex v48 = v71 - v44;
                    unint64_t v53 = v70.location + v70.length;
                    if (v71 >= v115) {
                      goto LABEL_103;
                    }
                  }

                  switch(v48)
                  {
                    case 1LL:
                      -[__CFString rangeOfString:options:range:]( (id)v119[3],  "rangeOfString:options:range:",  @"a",  9LL,  v44,  v48);
                      if (v59) {
                        goto LABEL_95;
                      }
                      -[__CFString rangeOfString:options:range:]( (id)v119[3],  "rangeOfString:options:range:",  @"t",  9LL,  v44,  v48);
                      if (v60 || !v58) {
                        goto LABEL_95;
                      }
                      CFIndex v48 = 1LL;
                      break;
                    case 2LL:
                      -[__CFString rangeOfString:options:range:]( (id)v119[3],  "rangeOfString:options:range:",  @"co",  9LL,  v44,  v48);
                      if (v62) {
                        goto LABEL_95;
                      }
                      -[__CFString rangeOfString:options:range:]( (id)v119[3],  "rangeOfString:options:range:",  @"un",  9LL,  v44,  v48);
                      if (v63 || !v58) {
                        goto LABEL_95;
                      }
                      CFIndex v48 = 2LL;
                      break;
                    case 3LL:
                      -[__CFString rangeOfString:options:range:]( (id)v119[3],  "rangeOfString:options:range:",  @"mal",  9LL,  v44,  v48);
                      if (v65) {
                        goto LABEL_95;
                      }
                      -[__CFString rangeOfString:options:range:]( (id)v119[3],  "rangeOfString:options:range:",  @"non",  9LL,  v44,  v48);
                      if (v66 || !v58) {
                        goto LABEL_95;
                      }
                      CFIndex v48 = 3LL;
                      break;
                    case 4LL:
                      -[__CFString rangeOfString:options:range:]( (id)v119[3],  "rangeOfString:options:range:",  @"anti",  9LL,  v44,  v48);
                      if (v68) {
                        BOOL v69 = 0;
                      }
                      else {
                        BOOL v69 = v58;
                      }
                      if (!v69) {
                        goto LABEL_95;
                      }
                      CFIndex v48 = 4LL;
                      break;
                    default:
                      goto LABEL_77;
                  }
                }

- (void)_tokenizeParagraphAtIndex:(unint64_t)a3 requireLemmas:(BOOL)a4 requirePartsOfSpeech:(BOOL)a5 requireNamedEntities:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  unint64_t v11 = -[NSString length](self->_string, "length");
  if (v11 <= a3) {
    return;
  }
  unint64_t v12 = v11;
  uint64_t v13 = -[NSString paragraphRangeForRange:](self->_string, "paragraphRangeForRange:", a3, 0LL);
  unint64_t v15 = v14;
  if (v14 <= 0x10000)
  {
    uint64_t v16 = v13;
LABEL_6:
    if (!v15) {
      return;
    }
    goto LABEL_7;
  }

  uint64_t v16 = ((a3 - v13) & 0xFFFFFFFFFFFF0000LL) + v13;
  unint64_t v15 = v13 + v14 - v16;
  if (v15 <= 0x10000) {
    goto LABEL_6;
  }
  unint64_t v15 = 0x10000LL;
LABEL_7:
  [(id)qword_18C496EB0 lock];
  id v17 = -[NSLinguisticTagger _tokenDataForParagraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:]( self,  "_tokenDataForParagraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:",  v16,  v15,  v8,  v7,  v6);
  [(id)qword_18C496EB0 unlock];
  if (self->_tokenArray)
  {
    if (!v17) {
      return;
    }
    goto LABEL_9;
  }

  uint64_t v18 = -[NSRLEArray init]( +[NSMutableRLEArray allocWithZone:]( &OBJC_CLASS___NSMutableRLEArray,  "allocWithZone:",  -[NSLinguisticTagger zone](self, "zone")),  "init");
  self->_id tokenArray = v18;
  -[NSMutableRLEArray insertObject:range:]( v18,  "insertObject:range:",  [MEMORY[0x189603FE8] null],  0,  v12);
  if (v17) {
LABEL_9:
  }
    objc_msgSend(self->_tokenArray, "replaceObjectsInRange:withObject:length:", v16, v15, v17, v15);
}

- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 requireLemmas:(BOOL)a5 requirePartsOfSpeech:(BOOL)a6 requireNamedEntities:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  unint64_t v13 = [self->_tokenArray count];
  _NSRange v18 = (_NSRange)xmmword_183979640;
  if (v13 <= a3
    || (unint64_t v14 = (void *)[self->_tokenArray objectAtIndex:a3 effectiveRange:&v18]) == 0
    || (unint64_t v15 = v14, objc_msgSend(v14, "isEqual:", objc_msgSend(MEMORY[0x189603FE8], "null"))))
  {
    -[NSLinguisticTagger _tokenizeParagraphAtIndex:requireLemmas:requirePartsOfSpeech:requireNamedEntities:]( self,  "_tokenizeParagraphAtIndex:requireLemmas:requirePartsOfSpeech:requireNamedEntities:",  a3,  v9,  v8,  v7,  v18);
    uint64_t v16 = (void *)[self->_tokenArray objectAtIndex:a3 effectiveRange:&v18];
    else {
      unint64_t v15 = v16;
    }
  }

  if (a4) {
    *a4 = v18;
  }
  return v15;
}

- (id)_tokenDataForParagraphAtIndex:(unint64_t)a3 paragraphRange:(_NSRange *)a4 tagScheme:(id)a5
{
  id v8 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", @"Lemma", a4, a5);
  if (-[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", @"NameType")
    || -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", @"NameTypeOrLexicalClass"))
  {
    uint64_t v9 = 1LL;
  }

  else
  {
    if (!-[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", @"LexicalClass"))
    {
      id v12 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", @"InternalClass");
      uint64_t v9 = 0LL;
      BOOL v10 = v12 != 0LL;
      return -[NSLinguisticTagger _tokenDataForParagraphAtIndex:paragraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:]( self,  "_tokenDataForParagraphAtIndex:paragraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:",  a3,  a4,  v8 != 0LL,  v10,  v9);
    }

    uint64_t v9 = 0LL;
  }

  BOOL v10 = 1LL;
  return -[NSLinguisticTagger _tokenDataForParagraphAtIndex:paragraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:]( self,  "_tokenDataForParagraphAtIndex:paragraphRange:requireLemmas:requirePartsOfSpeech:requireNamedEntities:",  a3,  a4,  v8 != 0LL,  v10,  v9);
}

- (void)_enumerateTagsInRange:(_NSRange)a3 scheme:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v18[6] = *MEMORY[0x1895F89C0];
  NSUInteger v13 = -[NSString length](self->_string, "length");
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3010000000LL;
  v18[4] = 0LL;
  v18[5] = 0LL;
  v18[3] = &unk_183A8509D;
  if (location + length > v13)
  {
    uint64_t v16 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v16);
    __break(1u);
  }

  id v14 = -[NSLinguisticTagger _tagSchemeForScheme:](self, "_tagSchemeForScheme:", a4);
  if (v14)
  {
    reserved = self->_reserved;
    if (reserved)
    {
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __70__NSLinguisticTagger__enumerateTagsInRange_scheme_options_usingBlock___block_invoke;
      v17[3] = &unk_189CA2458;
      v17[4] = self;
      v17[5] = v14;
      v17[6] = a6;
      void v17[7] = v18;
      off_18C496F80(reserved, 0LL, location, length, a5, v17);
    }
  }

  _Block_object_dispose(v18, 8);
}

void __70__NSLinguisticTagger__enumerateTagsInRange_scheme_options_usingBlock___block_invoke( void *a1,  unint64_t *a2,  _BYTE *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  BOOL v6 = (void *)MEMORY[0x186E1FF60]();
  unint64_t v7 = *a2;
  id v8 = (void *)off_18C496F88(*(void *)(a1[4] + 48LL), a1[5]);
  tagForNLTag(v8);
  char v10 = 0;
  if (v7 >= *(void *)(*(void *)(a1[7] + 8LL) + 40LL) + *(void *)(*(void *)(a1[7] + 8LL) + 32LL))
  {
    off_18C496F78(&v9, *(void *)(a1[4] + 48LL), 1LL, v7);
    *(_OWORD *)(*(void *)(a1[7] + 8LL) + 32LL) = v9;
  }

  (*(void (**)(void))(a1[6] + 16LL))();
  if (v8) {
    CFRelease(v8);
  }
  if (v10) {
    *a3 = 1;
  }
  objc_autoreleasePoolPop(v6);
}

@end