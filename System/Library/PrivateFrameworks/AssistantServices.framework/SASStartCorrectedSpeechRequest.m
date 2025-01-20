@interface SASStartCorrectedSpeechRequest
- (void)ad_setAFCorrectionContext:(id)a3;
@end

@implementation SASStartCorrectedSpeechRequest

- (void)ad_setAFCorrectionContext:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AFCorrectionContextInteractionIdKey]);
      -[SASStartCorrectedSpeechRequest setInteractionId:](self, "setInteractionId:", v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AFCorrectionContextSessionIdKey]);
      -[SASStartCorrectedSpeechRequest setSessionId:](self, "setSessionId:", v6);
    }
  }
}

@end