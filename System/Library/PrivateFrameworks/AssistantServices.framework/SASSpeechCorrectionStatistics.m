@interface SASSpeechCorrectionStatistics
- (void)ad_setAFCorrectionContext:(id)a3;
- (void)ad_setAFSpeechCorrectionInfo:(id)a3;
@end

@implementation SASSpeechCorrectionStatistics

- (void)ad_setAFSpeechCorrectionInfo:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    -[SASSpeechCorrectionStatistics setAlternativeSelectCount:]( self,  "setAlternativeSelectCount:",  [v4 alternativeSelectionCount]);
    -[SASSpeechCorrectionStatistics setCharacterChangeCount:]( self,  "setCharacterChangeCount:",  [v4 characterModificationCount]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 correctedText]);

    -[SASSpeechCorrectionStatistics setCorrectionText:](self, "setCorrectionText:", v5);
    -[SASSpeechCorrectionStatistics setCorrectionSource:]( self,  "setCorrectionSource:",  SASSpeechCorrectionStatisticsSourceDictationValue);
  }

- (void)ad_setAFCorrectionContext:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AFCorrectionContextInteractionIdKey]);
      -[SASSpeechCorrectionStatistics setInteractionId:](self, "setInteractionId:", v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AFCorrectionContextSessionIdKey]);
      -[SASSpeechCorrectionStatistics setSessionId:](self, "setSessionId:", v6);
    }
  }
}

@end