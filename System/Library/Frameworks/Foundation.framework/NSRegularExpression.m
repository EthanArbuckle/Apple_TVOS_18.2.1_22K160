@interface NSRegularExpression
+ (BOOL)supportsSecureCoding;
+ (NSRegularExpression)regularExpressionWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error;
+ (NSString)escapedPatternForString:(NSString *)string;
+ (NSString)escapedTemplateForString:(NSString *)string;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSArray)matchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;
- (NSRange)rangeOfFirstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;
- (NSRegularExpression)initWithCoder:(id)a3;
- (NSRegularExpression)initWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error;
- (NSRegularExpressionOptions)options;
- (NSString)pattern;
- (NSString)replacementStringForResult:(NSTextCheckingResult *)result inString:(NSString *)string offset:(NSInteger)offset template:(NSString *)templ;
- (NSString)stringByReplacingMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ;
- (NSTextCheckingResult)firstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;
- (NSUInteger)numberOfCaptureGroups;
- (NSUInteger)numberOfMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range;
- (NSUInteger)replaceMatchesInString:(NSMutableString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ;
- (id)description;
- (unint64_t)_captureGroupNumberWithName:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range usingBlock:(void *)block;
@end

@implementation NSRegularExpression

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    [a1 setVersion:1];
  }
}

+ (NSRegularExpression)regularExpressionWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error
{
  return (NSRegularExpression *)(id)[objc_alloc((Class)a1) initWithPattern:pattern options:options error:error];
}

- (NSRegularExpression)initWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError *)error
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!pattern)
  {
    v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil argument",  _NSMethodExceptionProem((objc_class *)self, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v19 userInfo:0]);
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSRegularExpression;
  v9 = -[NSRegularExpression init](&v21, sel_init);
  if (v9)
  {
    UErrorCode status = U_ZERO_ERROR;
    v10 = pattern;
    if ((options & 4) != 0) {
      v10 = +[NSRegularExpression escapedPatternForString:]( &OBJC_CLASS___NSRegularExpression,  "escapedPatternForString:",  pattern);
    }
    unint64_t v11 = -[NSString length](v10, "length");
    CharactersPtr = (UniChar *)CFStringGetCharactersPtr((CFStringRef)v10);
    BOOL v13 = CharactersPtr == 0LL;
    if (!CharactersPtr)
    {
      if (v11 <= 0x100)
      {
        CharactersPtr = (UniChar *)v23;
        -[NSString getCharacters:range:](v10, "getCharacters:range:", v23, 0LL, v11);
        BOOL v13 = 0;
        goto LABEL_10;
      }

      v18 = (UniChar *)malloc(2 * v11);
      if (!v18)
      {
LABEL_21:
        if (v9->_internal)
        {
          v9->_pattern = (NSString *)-[NSString copy](pattern, "copy");
          v9->_options = options;
        }

        else
        {

          return 0LL;
        }

        return v9;
      }

      CharactersPtr = v18;
      -[NSString getCharacters:range:](v10, "getCharacters:range:", v18, 0LL, v11);
    }

    if (v11 >= 0x7FFFFFFF)
    {
      BOOL v14 = 0;
      internal = (URegularExpression *)v9->_internal;
LABEL_11:
      else {
        BOOL v16 = 0;
      }
      if (!v16)
      {
        if (error)
        {
          *error = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  2048,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v10,  @"NSInvalidValue",  0));
          internal = (URegularExpression *)v9->_internal;
        }

        if (internal)
        {
          uregex_close(internal);
          v9->_internal = 0LL;
        }
      }

      if (v13) {
        free(CharactersPtr);
      }
      goto LABEL_21;
    }

- (void)encodeWithCoder:(id)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  v5 = -[NSRegularExpression pattern](self, "pattern");
  NSRegularExpressionOptions v6 = -[NSRegularExpression options](self, "options");
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:v5 forKey:@"NSPattern"];
    [a3 encodeInt64:v6 forKey:@"NSOptions"];
  }

  else
  {
    objc_msgSend(a3, "encodeObject:", v5, v6);
    [a3 encodeValueOfObjCType:"Q" at:v7];
  }

- (NSRegularExpression)initWithCoder:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPattern"];
    uint64_t v7 = [a3 decodeInt64ForKey:@"NSOptions"];
    return -[NSRegularExpression initWithPattern:options:error:](self, "initWithPattern:options:error:", v6, v7, 0LL);
  }

  v12[0] = 0LL;
  uint64_t v8 = [a3 versionForClassName:@"NSRegularExpression"];
  if (v8 == 1)
  {
    uint64_t v6 = [a3 decodeObject];
    [a3 decodeValueOfObjCType:"Q" at:v12 size:8];
    uint64_t v7 = v12[0];
    return -[NSRegularExpression initWithPattern:options:error:](self, "initWithPattern:options:error:", v6, v7, 0LL);
  }

  uint64_t v10 = v8;
  unint64_t v11 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v11, 1LL, v10);
  -[NSRegularExpression dealloc](self, "dealloc");
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](-[NSRegularExpression pattern](self, "pattern"), "hash");
  return -[NSRegularExpression options](self, "options") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }

  else if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    BOOL v5 = -[NSString isEqual:](-[NSRegularExpression pattern](self, "pattern"), "isEqual:", [a3 pattern]);
    if (v5)
    {
      NSRegularExpressionOptions v6 = -[NSRegularExpression options](self, "options");
      LOBYTE(v5) = v6 == [a3 options];
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  internal = (URegularExpression *)self->_internal;
  if (internal)
  {
    uregex_close(internal);
    self->_internal = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSRegularExpression;
  -[NSRegularExpression dealloc](&v4, sel_dealloc);
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSRegularExpression;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ 0x%lx",  -[NSRegularExpression description](&v3, sel_description),  self->_pattern,  self->_options);
}

- (NSString)pattern
{
  return self->_pattern;
}

- (NSRegularExpressionOptions)options
{
  return self->_options;
}

- (NSUInteger)numberOfCaptureGroups
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  UErrorCode status = U_ZERO_ERROR;
  NSUInteger result = (NSUInteger)self->_internal;
  if (result) {
    return uregex_groupCount((URegularExpression *)result, &status);
  }
  return result;
}

- (unint64_t)_captureGroupNumberWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 length];
  UErrorCode status = U_ZERO_ERROR;
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v8 = v5;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  if (!CharactersPtr)
  {
    if (v8 <= 0x100)
    {
      uint64_t v10 = (UChar *)v17;
      objc_msgSend(a3, "getCharacters:range:", v17, 0, v8);
      goto LABEL_11;
    }

    v15 = (UChar *)malloc(2 * v8);
    if (v15)
    {
      uint64_t v10 = v15;
      objc_msgSend(a3, "getCharacters:range:", v15, 0, v8);
      int v11 = 1;
      goto LABEL_12;
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }

  uint64_t v10 = (UChar *)CharactersPtr;
LABEL_11:
  int v11 = 0;
LABEL_12:
  int32_t v12 = uregex_groupNumberFromName((URegularExpression *)self->_internal, v10, v8, &status);
  if (v12 > -1 && status < U_ILLEGAL_ARGUMENT_ERROR) {
    unint64_t v7 = v12;
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v11) {
    free(v10);
  }
  return v7;
}

+ (NSString)escapedPatternForString:(NSString *)string
{
  return (NSString *)escapedString((NSMutableString *)string, (uint64_t)@"*?+[(){}^$|\\./");
}

- (void)enumerateMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range usingBlock:(void *)block
{
  NSUInteger length = range.length;
  unint64_t location = range.location;
  __int16 v9 = options;
  v63[63] = *MEMORY[0x1895F89C0];
  NSUInteger v13 = -[NSString length](string, "length");
  NSUInteger v14 = -[NSRegularExpression numberOfCaptureGroups](self, "numberOfCaptureGroups");
  unsigned __int8 v57 = 0;
  UErrorCode v56 = U_ZERO_ERROR;
  if (!string)
  {
    v49 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil argument",  _NSMethodExceptionProem((objc_class *)self, a2));
    v50 = (void *)MEMORY[0x189603F70];
    v51 = (void *)MEMORY[0x189603A60];
    goto LABEL_119;
  }

  if (v13 < length || location > v13 - length)
  {
    v49 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Range or index out of bounds",  _NSMethodExceptionProem((objc_class *)self, a2));
    v50 = (void *)MEMORY[0x189603F70];
    v51 = (void *)MEMORY[0x189603B40];
LABEL_119:
    objc_exception_throw((id)[v50 exceptionWithName:*v51 reason:v49 userInfo:0]);
  }

  unint64_t v15 = v14;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v9 & 4) != 0) {
    uint64_t v16 = location;
  }
  context = block;
  int64_t v59 = v16;
  __int16 v60 = 0;
  v55 = self;
  internal = (const URegularExpression *)self->_internal;
  NSUInteger v18 = -[NSString length](string, "length");
  v19 = 0LL;
  UErrorCode v61 = U_ZERO_ERROR;
  if (location > 0x7FFFFFFE) {
    goto LABEL_83;
  }
  if (location + length > v18) {
    goto LABEL_83;
  }
  v19 = (UText *)CFStringOpenUText();
  if (!v19) {
    goto LABEL_83;
  }
  v54 = block;
  p_checkout = (unsigned int *)&v55->_checkout;
  NSUInteger v21 = 0x7FFFFFFF - location;
  if (!((location + length) >> 31)) {
    NSUInteger v21 = length;
  }
  int64_t v22 = v21 + location;
  UErrorCode status = U_ZERO_ERROR;
  while (!__ldaxr(p_checkout))
  {
    int v24 = 1;
    if (!__stlxr(1u, p_checkout)) {
      goto LABEL_14;
    }
  }

  int v24 = 0;
  __clrex();
  internal = uregex_clone(internal, &status);
LABEL_14:
  uregex_setUText(internal, v19, &v61);
  if (!internal)
  {
    block = v54;
    goto LABEL_83;
  }

  uregex_setRegion64(internal, location, v22, &v61);
  if ((v9 & 1) != 0)
  {
    uregex_setMatchCallback(internal, (URegexMatchCallback *)regexMatchCallback, &context, &v61);
  }

  else if ((v9 & 4) == 0)
  {
    if ((v9 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  uregex_setFindProgressCallback(internal, (URegexFindProgressCallback *)regexFindProgressCallback, &context, &v61);
  if ((v9 & 8) != 0) {
LABEL_18:
  }
    uregex_useTransparentBounds(internal, 1, &v61);
LABEL_19:
  if ((v9 & 0x10) != 0) {
    uregex_useAnchoringBounds(internal, 0, &v61);
  }
  if (v61 < U_ILLEGAL_ARGUMENT_ERROR)
  {
    v25 = 0LL;
    unint64_t v52 = v15 + 1;
    __int16 v53 = v9;
    while (1)
    {
      int Next = uregex_findNext(internal, &v56);
      int v27 = v57;
      if (!Next) {
        break;
      }
      if (v56 > U_ZERO_ERROR || v57 != 0) {
        break;
      }
      if (v60 | HIBYTE(v60))
      {
        int v27 = 0;
        break;
      }

      if ((v9 & 4) != 0)
      {
        int64_t v29 = uregex_start64(internal, 0, &v56);
        if (v29 > v59)
        {
          int v27 = v57;
          break;
        }

        int64_t v59 = uregex_end64(internal, 0, &v56);
      }

      if ((v9 & 0x2000) == 0)
      {
        if (v15 >= 7) {
          id v30 = objc_alloc_init(MEMORY[0x189603FA8]);
        }
        else {
          id v30 = 0LL;
        }
        unint64_t v31 = 0LL;
        v32 = v63;
        do
        {
          UErrorCode v61 = U_ZERO_ERROR;
          int64_t v33 = uregex_start64(internal, v31, &v61);
          int64_t v34 = uregex_end64(internal, v31, &v61);
          BOOL v37 = v61 > U_ZERO_ERROR || v33 < 0 || v34 < v33;
          if (v37) {
            int64_t v38 = 0LL;
          }
          else {
            int64_t v38 = v34 - v33;
          }
          if (v37) {
            uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v39 = v33;
          }
          if (v15 > 6)
          {
            objc_msgSend( v30,  "addObject:",  +[NSValue valueWithRange:](NSValue, "valueWithRange:", v39, v38));
          }

          else
          {
            *(v32 - 1) = v39;
            int64_t *v32 = v38;
          }

          ++v31;
          v32 += 2;
        }

        while (v31 <= v15);
        if (v15 > 2)
        {
          __int16 v9 = v53;
          if (v15 > 6)
          {
            v25 = -[NSComplexRegularExpressionCheckingResult initWithRangeArray:regularExpression:]( objc_alloc(&OBJC_CLASS___NSComplexRegularExpressionCheckingResult),  "initWithRangeArray:regularExpression:",  v30,  v55);
          }

          else
          {
            v25 = -[NSExtendedRegularExpressionCheckingResult initWithRanges:count:regularExpression:]( objc_alloc(&OBJC_CLASS___NSExtendedRegularExpressionCheckingResult),  "initWithRanges:count:regularExpression:",  &status,  v52,  v55);
          }
        }

        else
        {
          v25 = -[NSSimpleRegularExpressionCheckingResult initWithRanges:count:regularExpression:]( objc_alloc(&OBJC_CLASS___NSSimpleRegularExpressionCheckingResult),  "initWithRanges:count:regularExpression:",  &status,  v52,  v55);
          __int16 v9 = v53;
        }
      }

      UErrorCode status = U_ZERO_ERROR;
      BOOL v40 = uregex_hitEnd(internal, &status) != 0;
      int v41 = uregex_requireEnd(internal, &status);
      uint64_t v42 = 4LL * v40;
      if (v41) {
        uint64_t v42 = (4LL * v40) | 8;
      }
      if (status >= U_ILLEGAL_ARGUMENT_ERROR) {
        uint64_t v43 = 0LL;
      }
      else {
        uint64_t v43 = v42;
      }
      (*((void (**)(void *, NSComplexRegularExpressionCheckingResult *, uint64_t, unsigned __int8 *))v54 + 2))( v54,  v25,  v43,  &v57);

      if (v57) {
        goto LABEL_98;
      }
    }

    if ((v9 & 2) == 0 || v27 || (_BYTE)v60)
    {
LABEL_98:
      UErrorCode v61 = U_ZERO_ERROR;
      if ((v24 & 1) == 0)
      {
LABEL_116:
        uregex_close(internal);
        goto LABEL_87;
      }
    }

    else
    {
      if (v56 < U_ILLEGAL_ARGUMENT_ERROR || HIBYTE(v60))
      {
        UErrorCode status = U_ZERO_ERROR;
        BOOL v45 = uregex_hitEnd(internal, &status) != 0;
        int v46 = uregex_requireEnd(internal, &status);
        uint64_t v47 = 4LL * v45;
        if (v46) {
          uint64_t v47 = (4LL * v45) | 8;
        }
        uint64_t v48 = v47 | 2;
        if (status >= U_ILLEGAL_ARGUMENT_ERROR) {
          uint64_t v44 = 2LL;
        }
        else {
          uint64_t v44 = v48;
        }
      }

      else
      {
        uint64_t v44 = 18LL;
      }

      (*((void (**)(void *, void, uint64_t, unsigned __int8 *))v54 + 2))(v54, 0LL, v44, &v57);
      UErrorCode v61 = U_ZERO_ERROR;
      if (!v24) {
        goto LABEL_116;
      }
    }

    uregex_setText(internal, (const UChar *)&status, 0, &v61);
    if ((v9 & 1) != 0)
    {
      uregex_setMatchCallback(internal, 0LL, 0LL, &v61);
    }

    else if ((v9 & 4) == 0)
    {
      if ((v9 & 8) == 0) {
        goto LABEL_102;
      }
      goto LABEL_106;
    }

    uregex_setFindProgressCallback(internal, 0LL, 0LL, &v61);
    if ((v9 & 8) == 0)
    {
LABEL_102:
      if ((v9 & 0x10) == 0) {
        goto LABEL_108;
      }
LABEL_107:
      uregex_useAnchoringBounds(internal, 1, &v61);
      do
LABEL_108:
        __ldaxr(p_checkout);
      while (__stlxr(0, p_checkout));
      goto LABEL_87;
    }

- (NSArray)matchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v12[5] = *MEMORY[0x1895F89C0];
  uint64_t v10 = (NSArray *)[MEMORY[0x189603FA8] array];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __65__NSRegularExpression_NSMatching__matchesInString_options_range___block_invoke;
  v12[3] = &unk_189CA2A50;
  v12[4] = v10;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:]( self,  "enumerateMatchesInString:options:range:usingBlock:",  string,  options & 0xFFFFFFFFFFFFFFFCLL,  location,  length,  v12);
  return v10;
}

uint64_t __65__NSRegularExpression_NSMatching__matchesInString_options_range___block_invoke( uint64_t result,  uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (NSUInteger)numberOfMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  void v7[2] = __73__NSRegularExpression_NSMatching__numberOfMatchesInString_options_range___block_invoke;
  v7[3] = &unk_189CA2A78;
  v7[4] = &v8;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:]( self,  "enumerateMatchesInString:options:range:usingBlock:",  string,  options & 0xFFFFFFFFFFFFDFFCLL | 0x2000,  range.location,  range.length,  v7);
  NSUInteger v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __73__NSRegularExpression_NSMatching__numberOfMatchesInString_options_range___block_invoke( uint64_t result,  uint64_t a2,  char a3)
{
  if ((a3 & 3) == 0) {
    ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
  }
  return result;
}

- (NSTextCheckingResult)firstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  uint64_t v11 = __Block_byref_object_copy__23;
  uint64_t v12 = __Block_byref_object_dispose__23;
  uint64_t v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  void v7[2] = __68__NSRegularExpression_NSMatching__firstMatchInString_options_range___block_invoke;
  v7[3] = &unk_189CA2A78;
  v7[4] = &v8;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:]( self,  "enumerateMatchesInString:options:range:usingBlock:",  string,  options & 0xFFFFFFFFFFFFFFFCLL,  range.location,  range.length,  v7);
  NSUInteger v5 = (NSTextCheckingResult *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __68__NSRegularExpression_NSMatching__firstMatchInString_options_range___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  *a4 = 1;
  return result;
}

- (NSRange)rangeOfFirstMatchInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3010000000LL;
  uint64_t v13 = &unk_183A8509D;
  __int128 v14 = xmmword_183979640;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __75__NSRegularExpression_NSMatching__rangeOfFirstMatchInString_options_range___block_invoke;
  v9[3] = &unk_189CA2A78;
  v9[4] = &v10;
  -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:]( self,  "enumerateMatchesInString:options:range:usingBlock:",  string,  options & 0xFFFFFFFFFFFFFFFCLL,  range.location,  range.length,  v9);
  NSUInteger v5 = v11[4];
  NSUInteger v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  NSUInteger v7 = v5;
  NSUInteger v8 = v6;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

uint64_t __75__NSRegularExpression_NSMatching__rangeOfFirstMatchInString_options_range___block_invoke( uint64_t result,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  if (a2)
  {
    uint64_t v5 = result;
    NSRange result = [a2 range];
    uint64_t v6 = *(void *)(*(void *)(v5 + 32) + 8LL);
    *(void *)(v6 + 32) = result;
    *(void *)(v6 + 40) = v7;
  }

  *a4 = 1;
  return result;
}

- (NSString)stringByReplacingMatchesInString:(NSString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  int64_t v34 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  NSUInteger v13 = -[NSString length](string, "length");
  int64_t v33 = templ;
  if (!templ)
  {
    id v30 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v30);
  }

  NSUInteger v14 = v13;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  obj = -[NSRegularExpression matchesInString:options:range:]( self,  "matchesInString:options:range:",  string,  options & 0xFFFFFFFFFFFFFFFCLL,  location,  length);
  uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v36,  v35,  16LL);
  if (v15)
  {
    uint64_t v16 = v15;
    NSUInteger v31 = v14;
    v17 = self;
    unint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v20 = *(void *)v37;
    do
    {
      uint64_t v21 = 0LL;
      unint64_t v22 = v18;
      uint64_t v23 = v19;
      do
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(obj);
        }
        int v24 = *(void **)(*((void *)&v36 + 1) + 8 * v21);
        unint64_t v18 = [v24 range];
        uint64_t v19 = v25;
        uint64_t v26 = -[NSRegularExpression replacementStringForResult:inString:offset:template:]( v17,  "replacementStringForResult:inString:offset:template:",  v24,  string,  0LL,  v33);
        unint64_t v27 = v18 - (v22 + v23);
        if (v18 > v22 + v23) {
          -[NSString appendString:]( v34,  "appendString:",  -[NSString substringWithRange:](string, "substringWithRange:", v22 + v23, v27));
        }
        -[NSString appendString:](v34, "appendString:", v26, v27);
        ++v21;
        unint64_t v22 = v18;
        uint64_t v23 = v19;
      }

      while (v16 != v21);
      uint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v36,  v35,  16LL);
    }

    while (v16);
    NSUInteger v28 = v19 + v18;
    NSUInteger v14 = v31;
  }

  else
  {
    NSUInteger v28 = 0LL;
  }

  if (v14 > v28) {
    -[NSString appendString:](v34, "appendString:", -[NSString substringWithRange:](string, "substringWithRange:"));
  }
  return v34;
}

- (NSUInteger)replaceMatchesInString:(NSMutableString *)string options:(NSMatchingOptions)options range:(NSRange)range withTemplate:(NSString *)templ
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!templ)
  {
    uint64_t v21 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v21);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  obj = -[NSRegularExpression matchesInString:options:range:]( self,  "matchesInString:options:range:",  string,  options & 0xFFFFFFFFFFFFFFFCLL,  range.location,  range.length);
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
  if (!v9) {
    return 0LL;
  }
  uint64_t v10 = v9;
  NSUInteger v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = *(void *)v26;
  do
  {
    NSUInteger v22 = v11;
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v16 = [v15 range];
      uint64_t v18 = v17;
      uint64_t v19 = -[NSRegularExpression replacementStringForResult:inString:offset:template:]( self,  "replacementStringForResult:inString:offset:template:",  v15,  string,  v12,  templ);
      -[NSMutableString replaceCharactersInRange:withString:]( string,  "replaceCharactersInRange:withString:",  v16 + v12,  v18,  v19);
      v12 += -[NSString length](v19, "length") - v18;
    }

    NSUInteger v11 = v10 + v22;
    uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
  }

  while (v10);
  return v11;
}

+ (NSString)escapedTemplateForString:(NSString *)string
{
  return (NSString *)escapedString((NSMutableString *)string, (uint64_t)@"\\$");
}

- (NSString)replacementStringForResult:(NSTextCheckingResult *)result inString:(NSString *)string offset:(NSInteger)offset template:(NSString *)templ
{
  NSUInteger v11 = -[NSTextCheckingResult numberOfRanges](result, "numberOfRanges");
  uint64_t v40 = result;
  if (result && string && templ)
  {
    unint64_t v12 = v11;
    uint64_t v13 = &processLock;
    if (!replacementStringForResult_inString_offset_template__characterSet) {
      replacementStringForResult_inString_offset_template__characterSet =  +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"\\$");
    }
    uint64_t v14 = -[NSString rangeOfCharacterFromSet:](templ, "rangeOfCharacterFromSet:");
    if (v15)
    {
      uint64_t v16 = v14;
      uint64_t v17 = v15;
      __int128 v39 = string;
      templ = +[NSString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", templ);
      NSUInteger v18 = -[NSString length](templ, "length");
      if (v12 < 0xB)
      {
        uint64_t v21 = 1LL;
      }

      else
      {
        unint64_t v19 = 10LL;
        unint64_t v20 = 1LL;
        do
        {
          uint64_t v21 = v20 + 1;
          v19 *= 10LL;
        }

        while (v19 < v12 && v20++ < 0x13);
      }

      do
      {
        int v23 = -[NSString characterAtIndex:](templ, "characterAtIndex:", v16);
        if (v23 == 36)
        {
          unint64_t v24 = v16 + v17;
          if (v18 >= v16 + v17 + v21) {
            NSUInteger v25 = v16 + v17 + v21;
          }
          else {
            NSUInteger v25 = v18;
          }
          if (v24 < v25)
          {
            unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
            do
            {
              int v27 = -[NSString characterAtIndex:](templ, "characterAtIndex:", v24);
              uint64_t v28 = 10 * v26;
              if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v28 = 0LL;
              }
              unint64_t v26 = (v27 - 48) + v28;
              ++v24;
            }

            while (v24 < v25);
            if (v26 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v13 = (void *)&processLock;
            }

            else
            {
              if (v26 >= v12)
              {
                uint64_t v17 = 0LL;
                uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
              }

              else
              {
                uint64_t v29 = -[NSTextCheckingResult rangeAtIndex:](v40, "rangeAtIndex:", v26);
                uint64_t v17 = v30;
              }

              if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v31 = v29 + offset;
              }
              uint64_t v13 = &processLock;
              v32 = &stru_189CA6A28;
              if (v31 != 0x7FFFFFFFFFFFFFFFLL && v17) {
                v32 = -[NSString substringWithRange:](v39, "substringWithRange:");
              }
              unint64_t v33 = v24 - v16;
              -[NSString replaceCharactersInRange:withString:]( templ,  "replaceCharactersInRange:withString:",  v16,  v33,  v32);
              NSUInteger v18 = v18 - v33 + v17;
            }
          }
        }

        else if (v23 == 92)
        {
          -[NSString deleteCharactersInRange:](templ, "deleteCharactersInRange:", v16, v17);
          v18 -= v17;
          uint64_t v17 = 1LL;
        }

        if (v18 <= v17 + v16) {
          break;
        }
        uint64_t v16 = -[NSString rangeOfCharacterFromSet:options:range:]( templ,  "rangeOfCharacterFromSet:options:range:",  v13[213],  0LL,  v17 + v16,  v18 - (v17 + v16));
        uint64_t v17 = v34;
      }

      while (v34);
    }

    return templ;
  }

  else
  {
    __int128 v36 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v36);
    +[NSDataDetector initialize](v37, v38);
  }

  return v35;
}

@end