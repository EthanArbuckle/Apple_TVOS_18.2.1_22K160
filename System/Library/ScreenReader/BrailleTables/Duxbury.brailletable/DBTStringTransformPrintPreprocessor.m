@interface DBTStringTransformPrintPreprocessor
- (DBTStringTransformPrintPreprocessor)init;
- (NSString)characterLevelStringTransform;
- (__CFString)stringTransform;
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
- (void)dealloc;
- (void)setCharacterLevelStringTransform:(id)a3;
- (void)setStringTransform:(__CFString *)a3;
@end

@implementation DBTStringTransformPrintPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  v9 = (__CFString *)a3;
  id v10 = a6;
  if (!v9)
  {
    v13 = 0LL;
    goto LABEL_42;
  }

  id v42 = v10;
  v57.unint64_t length = (CFIndex)-[__CFString length](v9, "length");
  v57.location = 0LL;
  unint64_t length = v57.length;
  v11 = CFStringTokenizerCreate(0LL, v9, v57, 0x10000uLL, self->_locale);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v41 = a4;
  if (a4) {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 0LL));
  }
  else {
    v12 = 0LL;
  }
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x2020000000LL;
  uint64_t v56 = 0LL;
  id v46 = v12;
  tokenizer = v11;
  v44 = v9;
  while (CFStringTokenizerAdvanceToNextToken(v11))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
    unint64_t v15 = v54[3];
    if (CurrentTokenRange.location > v15)
    {
      v16 = self;
      unint64_t v17 = CurrentTokenRange.location - v15;
      id v18 = v45;
      id v19 = v12;
      v20 = v9;
      id v21 = v19;
      v22 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString substringWithRange:]( v20,  "substringWithRange:",  v15,  CurrentTokenRange.location - v15));
      [v18 appendString:v23];

      while (CurrentTokenRange.location != v15)
      {
        *(void *)&__int128 v48 = v15;
        [v21 appendBytes:&v48 length:8];
        ++v15;
      }

      v54[3] += v17;
      v9 = v22;
      self = v16;
    }

    id v24 = (id)objc_claimAutoreleasedReturnValue( -[__CFString substringWithRange:]( v9,  "substringWithRange:",  CurrentTokenRange.location,  CurrentTokenRange.length,  v41));
    v25 = (char *)[v24 length];
    if (!v25)
    {

LABEL_20:
      if (CFEqual( -[DBTStringTransformPrintPreprocessor stringTransform](self, "stringTransform"),  kCFStringTransformLatinHiragana))
      {
        goto LABEL_31;
      }

      goto LABEL_21;
    }

    v26 = 0LL;
    BOOL v27 = 1;
    do
    {
      BOOL v27 = ++v26 < v25;
    }

    while (v25 != v26);

    if (!v27) {
      goto LABEL_20;
    }
LABEL_21:
    v28 = (void *)CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, 0x10000uLL);
    if ([v28 length])
    {
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  v28));
      CFStringTransform(v29, 0LL, -[DBTStringTransformPrintPreprocessor stringTransform](self, "stringTransform"), 0);
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = __109__DBTStringTransformPrintPreprocessor_preprocessPrintString_withLocationMap_isEightDot_textFormattingRanges___block_invoke;
      v49[3] = &unk_34630;
      id v50 = v45;
      v52 = &v53;
      id v51 = v46;
      v30 = objc_retainBlock(v49);
      v31 = (void *)objc_claimAutoreleasedReturnValue( -[DBTStringTransformPrintPreprocessor characterLevelStringTransform]( self,  "characterLevelStringTransform"));

      if (v31)
      {
        for (unint64_t i = 0; (unint64_t)[v24 length] > i; ++i)
        {
          id v33 = [v24 mutableCopy];
          __int128 v48 = xmmword_2F8B0;
          v34 = (void *)objc_claimAutoreleasedReturnValue( -[DBTStringTransformPrintPreprocessor characterLevelStringTransform]( self,  "characterLevelStringTransform"));
          objc_msgSend(v33, "applyTransform:reverse:range:updatedRange:", v34, 0, i, 1, &v48);

          if ((void)v48 == 0x7FFFFFFFFFFFFFFFLL)
          {

            break;
          }

          v35 = (void *)objc_claimAutoreleasedReturnValue([v33 substringWithRange:v48]);
          ((void (*)(void *, void *, unint64_t, uint64_t))v30[2])( v30,  v35,  CurrentTokenRange.location + i,  1LL);
        }
      }

      else
      {
        ((void (*)(void *, __CFString *, CFIndex, CFIndex))v30[2])( v30,  v29,  CurrentTokenRange.location,  CurrentTokenRange.length);
      }

      v9 = v44;
    }

LABEL_31:
    v12 = v46;
    v11 = tokenizer;
  }

  if (v11) {
    CFRelease(v11);
  }
  unint64_t v36 = v54[3];
  if (length > v36)
  {
    id v37 = v45;
    id v38 = v46;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v9, "substringWithRange:", v36, length - v36));
    [v37 appendString:v39];

    while (length != v36)
    {
      *(void *)&__int128 v48 = v36;
      [v38 appendBytes:&v48 length:8];
      ++v36;
    }
  }

  if (v41) {
    id *v41 = v46;
  }
  _Block_object_dispose(&v53, 8);

  id v10 = v42;
  v13 = v45;
LABEL_42:

  return v13;
}

void __109__DBTStringTransformPrintPreprocessor_preprocessPrintString_withLocationMap_isEightDot_textFormattingRanges___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  id v6 = a2;
  v7 = (char *)[v6 length];
  if (v7)
  {
    v8 = v7;
    [*(id *)(a1 + 32) appendString:v6];
    do
    {
      v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      [v9 appendBytes:&v10 length:8];
      --v8;
    }

    while (v8);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) += a4;
  }
}

- (DBTStringTransformPrintPreprocessor)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DBTStringTransformPrintPreprocessor;
  v2 = -[DBTStringTransformPrintPreprocessor init](&v4, "init");
  if (v2) {
    v2->_locale = CFLocaleCopyCurrent();
  }
  return v2;
}

- (void)dealloc
{
  locale = self->_locale;
  if (locale) {
    CFRelease(locale);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DBTStringTransformPrintPreprocessor;
  -[DBTStringTransformPrintPreprocessor dealloc](&v4, "dealloc");
}

- (__CFString)stringTransform
{
  return self->_stringTransform;
}

- (void)setStringTransform:(__CFString *)a3
{
  self->_stringTransform = a3;
}

- (NSString)characterLevelStringTransform
{
  return self->_characterLevelStringTransform;
}

- (void)setCharacterLevelStringTransform:(id)a3
{
}

- (void).cxx_destruct
{
}

@end