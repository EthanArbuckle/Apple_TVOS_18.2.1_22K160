@interface LiblouisTextFormattingProcessor
- (id)processText:(id)a3 withFormattingRanges:(id)a4;
@end

@implementation LiblouisTextFormattingProcessor

- (id)processText:(id)a3 withFormattingRanges:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5) {
    goto LABEL_51;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 boldRanges]);
  if (![v8 count])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 italicRanges]);
    if ([v9 count])
    {

      goto LABEL_5;
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue([v7 underlineRanges]);
    id v48 = [v47 count];

    if (v48) {
      goto LABEL_6;
    }
LABEL_51:
    v10 = 0LL;
    goto LABEL_52;
  }

@end