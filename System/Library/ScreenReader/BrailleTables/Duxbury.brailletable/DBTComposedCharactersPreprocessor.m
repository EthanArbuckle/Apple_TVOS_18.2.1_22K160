@interface DBTComposedCharactersPreprocessor
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
@end

@implementation DBTComposedCharactersPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  v7 = (__CFString *)a3;
  v8 = v7;
  if (!v7)
  {
    v10 = 0LL;
    goto LABEL_20;
  }

  id v9 = -[__CFString length](v7, "length");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  if (a4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 0LL));
    if (!v9) {
      goto LABEL_17;
    }
LABEL_7:
    unint64_t v12 = 0LL;
    do
    {
      CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(v8, v12);
      if (RangeOfComposedCharactersAtIndex.length > 1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString substringWithRange:]( v8,  "substringWithRange:",  RangeOfComposedCharactersAtIndex.location,  RangeOfComposedCharactersAtIndex.length));
        v16 = (__CFString *)[v15 mutableCopyWithZone:0];
        CFStringNormalize(v16, kCFStringNormalizationFormC);
        if (-[__CFString length](v16, "length") == (char *)&dword_0 + 1)
        {
          [v10 appendString:v16];
          unint64_t v19 = v12;
          [v11 appendBytes:&v19 length:8];
        }

        else
        {
          [v10 appendString:v15];
          if ([v15 length])
          {
            unint64_t v17 = 0LL;
            do
            {
              unint64_t v19 = v12 + v17;
              [v11 appendBytes:&v19 length:8];
              ++v17;
            }

            while (v17 < (unint64_t)[v15 length]);
          }
        }

        v12 += RangeOfComposedCharactersAtIndex.length;
      }

      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v8, "substringWithRange:", v12, 1LL));
        [v10 appendString:v14];

        unint64_t v19 = v12;
        [v11 appendBytes:&v19 length:8];
        ++v12;
      }
    }

    while (v12 < (unint64_t)v9);
    goto LABEL_17;
  }

  v11 = 0LL;
  if (v9) {
    goto LABEL_7;
  }
LABEL_17:
  if (a4) {
    *a4 = v11;
  }

LABEL_20:
  return v10;
}

@end