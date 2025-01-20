@interface VSBaseHelpResultHandler
- (id)actionForRecognitionResult:(id)a3;
@end

@implementation VSBaseHelpResultHandler

- (id)actionForRecognitionResult:(id)a3
{
  else {
    v3 = @"HELP_STRING_NO_TELEPHONY";
  }
  return  objc_msgSend( [VSRecognitionSpeakAction alloc],  "initWithSpokenFeedbackString:willTerminate:",  VSBaseLocalizedString((uint64_t)@"Help", (uint64_t)v3),  0);
}

@end