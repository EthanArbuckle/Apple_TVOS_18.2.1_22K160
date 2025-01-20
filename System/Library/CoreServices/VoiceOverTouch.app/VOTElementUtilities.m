@interface VOTElementUtilities
+ (id)handleValueChangeForPhoneDeletionWithOldString:(id)a3 newString:(id)a4;
+ (id)phoneNumberWithoutFormattingCharacters:(id)a3;
+ (int64_t)findLocationOfDifferenceInOldString:(id)a3 withNewString:(id)a4;
@end

@implementation VOTElementUtilities

+ (id)phoneNumberWithoutFormattingCharacters:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"[-()\\s]",  &stru_10017A920,  1024,  0,  objc_msgSend(v3, "length")));

  return v4;
}

+ (id)handleValueChangeForPhoneDeletionWithOldString:(id)a3 newString:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElementUtilities phoneNumberWithoutFormattingCharacters:]( &OBJC_CLASS___VOTElementUtilities,  "phoneNumberWithoutFormattingCharacters:",  a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[VOTElementUtilities phoneNumberWithoutFormattingCharacters:]( &OBJC_CLASS___VOTElementUtilities,  "phoneNumberWithoutFormattingCharacters:",  v5));

  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    int64_t v8 = +[VOTElementUtilities findLocationOfDifferenceInOldString:withNewString:]( &OBJC_CLASS___VOTElementUtilities,  "findLocationOfDifferenceInOldString:withNewString:",  v6,  v7);
  }

  else
  {
    [v6 length];
    int64_t v8 = 0LL;
  }

  else {
    v9 = 0LL;
  }

  return v9;
}

+ (int64_t)findLocationOfDifferenceInOldString:(id)a3 withNewString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (char *)[v5 length];
  int64_t v8 = (char *)[v6 length];
  v9 = v8;
  else {
    uint64_t v10 = (uint64_t)v7;
  }
  if (v10 < 1)
  {
    v11 = 0LL;
  }

  else
  {
    v11 = 0LL;
    while (sub_1000CDC90( (uint64_t)[v5 characterAtIndex:v11],  (uint64_t)objc_msgSend(v6, "characterAtIndex:", v11)))
    {
      if ((char *)v10 == ++v11)
      {
        v11 = (char *)v10;
        break;
      }
    }
  }

  else {
    int64_t v13 = (int64_t)v11;
  }

  return v13;
}

@end