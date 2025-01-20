@interface DBTSSepratedBySpacesPreprocessor
- (DBTSSepratedBySpacesPreprocessor)init;
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
- (unint64_t)tokenizerUnit;
- (void)dealloc;
- (void)setTokenizerUnit:(unint64_t)a3;
@end

@implementation DBTSSepratedBySpacesPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  v8 = (__CFString *)a3;
  v9 = v8;
  if (v8)
  {
    v10 = (char *)-[__CFString length](v8, "length");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    if (a4) {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 0LL));
    }
    else {
      uint64_t v12 = 0LL;
    }
    v32 = a4;
    id v33 = (id)v12;
    CFOptionFlags v13 = -[DBTSSepratedBySpacesPreprocessor tokenizerUnit](self, "tokenizerUnit");
    v35.CFIndex location = 0LL;
    v31 = v10;
    v35.CFIndex length = (CFIndex)v10;
    v14 = CFStringTokenizerCreate(0LL, v9, v35, v13, self->_locale);
    if (CFStringTokenizerAdvanceToNextToken(v14))
    {
      do
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v14);
        CFIndex location = CurrentTokenRange.location;
        CFIndex length = CurrentTokenRange.length;
        unint64_t v18 = CurrentTokenRange.location + CurrentTokenRange.length;
        v19 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString substringFromIndex:]( v9,  "substringFromIndex:",  CurrentTokenRange.location + CurrentTokenRange.length));
        v20 = v11;
        id v21 = v11;
        id v22 = v33;
        v23 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString substringWithRange:]( v9,  "substringWithRange:",  CurrentTokenRange.location,  CurrentTokenRange.length));
        [v21 appendString:v23];

        if (CurrentTokenRange.length)
        {
          do
          {
            CFIndex v34 = location;
            objc_msgSend(v22, "appendBytes:length:", &v34, 8, v31);
            ++location;
            --length;
          }

          while (length);
        }

        if ([v19 length])
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v19 substringToIndex:1]);
          unsigned __int8 v25 = [v24 isEqualToString:@" "];

          if ((v25 & 1) == 0)
          {
            [v21 appendString:@" "];
            CFIndex v34 = CurrentTokenRange.location + CurrentTokenRange.length;
            [v22 appendBytes:&v34 length:8];
          }
        }

        v11 = v20;
      }

      while (CFStringTokenizerAdvanceToNextToken(v14));
    }

    else
    {
      unint64_t v18 = 0LL;
    }

    CFRelease(v14);
    v26 = v31;
    if ((unint64_t)v31 > v18)
    {
      id v27 = v11;
      id v28 = v33;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v9, "substringWithRange:", v18, &v31[-v18]));
      [v27 appendString:v29];

      do
      {
        CFIndex v34 = v18;
        objc_msgSend(v28, "appendBytes:length:", &v34, 8, v31);
        ++v18;
      }

      while (v26 != (char *)v18);
    }

    if (v32) {
      id *v32 = v33;
    }
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (DBTSSepratedBySpacesPreprocessor)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DBTSSepratedBySpacesPreprocessor;
  v2 = -[DBTSSepratedBySpacesPreprocessor init](&v4, "init");
  if (v2)
  {
    v2->_locale = CFLocaleCopyCurrent();
    v2->_tokenizerUnit = 1LL;
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
  v4.super_class = (Class)&OBJC_CLASS___DBTSSepratedBySpacesPreprocessor;
  -[DBTSSepratedBySpacesPreprocessor dealloc](&v4, "dealloc");
}

- (unint64_t)tokenizerUnit
{
  return self->_tokenizerUnit;
}

- (void)setTokenizerUnit:(unint64_t)a3
{
  self->_tokenizerUnit = a3;
}

@end