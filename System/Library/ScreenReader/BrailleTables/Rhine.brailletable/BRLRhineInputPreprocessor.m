@interface BRLRhineInputPreprocessor
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
@end

@implementation BRLRhineInputPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  id v6 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = [&off_8CFE8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0LL;
      v11 = v6;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(&off_8CFE8);
        }
        unsigned __int16 v14 = (unsigned __int16)[*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) unsignedIntValue];
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v14,  1LL));
        id v6 = (id)objc_claimAutoreleasedReturnValue([v11 stringByReplacingOccurrencesOfString:v12 withString:@" "]);

        v10 = (char *)v10 + 1;
        v11 = v6;
      }

      while (v8 != v10);
      id v8 = [&off_8CFE8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  return v6;
}

@end