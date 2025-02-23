@interface NSLookupMatch
+ (id)matchesInString:(id)a3 types:(unint64_t)a4 range:(_NSRange)a5;
- (NSLookupMatch)initWithType:(unint64_t)a3 range:(_NSRange)a4 score:(double)a5;
- (NSString)languageIdentifier;
- (NSTextCheckingResult)dataDetectorResult;
- (_NSRange)range;
- (double)score;
- (id)description;
- (unint64_t)matchType;
- (void)dealloc;
- (void)setDataDetectorResult:(id)a3;
- (void)setLanguageIdentifier:(id)a3;
@end

@implementation NSLookupMatch

- (NSLookupMatch)initWithType:(unint64_t)a3 range:(_NSRange)a4 score:(double)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSLookupMatch;
  result = -[NSLookupMatch init](&v10, sel_init);
  if (result)
  {
    result->_matchType = a3;
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
    result->_score = a5;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSLookupMatch;
  -[NSLookupMatch dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v6.NSUInteger location = -[NSLookupMatch range](self, "range");
  objc_super v3 = NSStringFromRange(v6);
  -[NSLookupMatch score](self, "score");
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %0.2f", v3, v4);
}

+ (id)matchesInString:(id)a3 types:(unint64_t)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  char v7 = a4;
  v36[4] = *MEMORY[0x1895F89C0];
  uint64_t v11 = (void *)[MEMORY[0x189603FA8] array];
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"NSLookupMatch.m",  68LL,  @"Invalid parameter: string is nil");
  }
  NSUInteger v12 = [a3 length];
  if (location > v12)
  {
    v23 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    v37.NSUInteger location = 0LL;
    v37.NSUInteger length = v12;
    id v24 = a1;
    v25 = a2;
    v26 = NSStringFromRange(v37);
    v38.NSUInteger location = location;
    v38.NSUInteger length = length;
    v30 = v26;
    a2 = v25;
    a1 = v24;
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v23,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v24,  @"NSLookupMatch.m",  70LL,  @"Invalid range: string range %@ does not contain search range %@",  v30,  NSStringFromRange(v38));
  }

  NSUInteger v13 = location + length;
  if (location + length > v12)
  {
    v32 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    v39.NSUInteger location = 0LL;
    v39.NSUInteger length = v12;
    id v27 = a1;
    v28 = a2;
    v29 = NSStringFromRange(v39);
    v40.NSUInteger location = location;
    v40.NSUInteger length = length;
    v31 = v29;
    a2 = v28;
    a1 = v27;
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v32,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v27,  @"NSLookupMatch.m",  71LL,  @"Invalid range: string range %@ does not contain search range %@",  v31,  NSStringFromRange(v40));
  }

  if (location >= 0x100) {
    NSUInteger v14 = location - 256;
  }
  else {
    NSUInteger v14 = 0LL;
  }
  NSUInteger v15 = v13 + 256;
  if (v13 + 256 >= v12) {
    NSUInteger v15 = v12;
  }
  NSUInteger v16 = v15 - v14;
  uint64_t v17 = MEMORY[0x1895F87A8];
  if ((v7 & 2) != 0)
  {
    id v18 = a1;
    SEL v19 = a2;
    v20 = +[NSDataDetector dataDetectorWithTypes:error:]( &OBJC_CLASS___NSDataDetector,  "dataDetectorWithTypes:error:",  6200LL,  v35);
    if (!v20) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  v19,  v18,  @"NSLookupMatch.m",  84LL,  @"Failed to create NSDataDetector");
    }
    uint64_t v17 = MEMORY[0x1895F87A8];
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __45__NSLookupMatch_matchesInString_types_range___block_invoke;
    v34[3] = &unk_189C9E478;
    v34[5] = location;
    v34[6] = length;
    v34[4] = v11;
    -[NSDataDetector enumerateMatchesInString:options:range:usingBlock:]( v20,  "enumerateMatchesInString:options:range:usingBlock:",  a3,  8LL,  v14,  v16,  v34);
  }

  if ((v7 & 1) != 0)
  {
    v36[0] = @"TokenType";
    v36[1] = @"Language";
    v36[2] = @"NameType";
    v36[3] = @"LexicalClass";
    v21 =  -[NSLinguisticTagger initWithTagSchemes:options:]( [NSLinguisticTagger alloc],  "initWithTagSchemes:options:",  [MEMORY[0x189603F18] arrayWithObjects:v36 count:4],  30);
    -[NSLinguisticTagger setString:](v21, "setString:", a3);
    v33[0] = v17;
    v33[1] = 3221225472LL;
    v33[2] = __45__NSLookupMatch_matchesInString_types_range___block_invoke_2;
    v33[3] = &unk_189C9E4A0;
    v33[5] = location;
    v33[6] = length;
    v33[4] = v11;
    -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:]( v21,  "enumerateTagsInRange:scheme:options:usingBlock:",  v14,  v16,  @"TokenType",  30LL,  v33);
  }

  [v11 sortUsingComparator:&__block_literal_global_18];
  return v11;
}

unint64_t __45__NSLookupMatch_matchesInString_types_range___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  BOOL *a4)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v7 = [a2 range];
    unint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    unint64_t v11 = v10 + v9;
    if (v10 + v9 >= v7 + v8) {
      uint64_t v12 = v7 + v8;
    }
    else {
      uint64_t v12 = v10 + v9;
    }
    BOOL v13 = v7 > v9 || v9 >= v7 + v8;
    if (!v13 || (v9 <= v7 ? (BOOL v14 = v7 >= v11) : (BOOL v14 = 1), v9 = v7, !v14))
    {
      if (v12 != v9) {
        goto LABEL_15;
      }
    }
  }

  else
  {
    unint64_t v20 = *(void *)(a1 + 40);
    unint64_t v21 = [a2 range];
    if (v21 <= v20 && v21 + v22 >= v20)
    {
LABEL_15:
      NSUInteger v15 = objc_alloc(&OBJC_CLASS___NSLookupMatch);
      uint64_t v16 = [a2 range];
      id v18 = -[NSLookupMatch initWithType:range:score:](v15, "initWithType:range:score:", 2LL, v16, v17, 0.5);
      -[NSLookupMatch setDataDetectorResult:](v18, "setDataDetectorResult:", a2);
      [*(id *)(a1 + 32) addObject:v18];
    }
  }

  unint64_t result = [a2 range];
  *a4 = result > *(void *)(a1 + 48) + *(void *)(a1 + 40);
  return result;
}

void __45__NSLookupMatch_matchesInString_types_range___block_invoke_2( uint64_t a1,  uint64_t a2,  unint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  BOOL *a7)
{
  unint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  if (!v11)
  {
    if (a3 > v10 || a3 + a4 < v10)
    {
      uint64_t v11 = 0LL;
      goto LABEL_22;
    }

uint64_t __45__NSLookupMatch_matchesInString_types_range___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = [a2 range];
  if (v5 < [a3 range]) {
    return -1LL;
  }
  unint64_t v6 = [a2 range];
  if (v6 > [a3 range]) {
    return 1LL;
  }
  uint64_t v8 = [a2 range];
  unint64_t v10 = v8 + v9;
  uint64_t v11 = [a3 range];
  if (v10 < v11 + v12) {
    return -1LL;
  }
  uint64_t v13 = [a2 range];
  unint64_t v15 = v13 + v14;
  uint64_t v16 = [a3 range];
  return v15 > v16 + v17;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (_NSRange)range
{
  dest[2] = *MEMORY[0x1895F89C0];
  objc_copyStruct(dest, &self->_range, 16LL, 1, 0);
  NSUInteger v2 = dest[0];
  NSUInteger v3 = dest[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (double)score
{
  return self->_score;
}

- (NSTextCheckingResult)dataDetectorResult
{
  return (NSTextCheckingResult *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDataDetectorResult:(id)a3
{
}

- (NSString)languageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLanguageIdentifier:(id)a3
{
}

@end