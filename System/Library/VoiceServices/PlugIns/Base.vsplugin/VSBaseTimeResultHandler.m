@interface VSBaseTimeResultHandler
- (id)actionForRecognitionResult:(id)a3;
@end

@implementation VSBaseTimeResultHandler

- (id)actionForRecognitionResult:(id)a3
{
  v3 = +[NSDate date](&OBJC_CLASS___NSDate, "date", a3);
  v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setTimeStyle:](v4, "setTimeStyle:", 1LL);
  -[NSDateFormatter setDateStyle:](v4, "setDateStyle:", 0LL);
  v5 = -[NSDateFormatter stringFromDate:](v4, "stringFromDate:", v3);
  id v6 = VSBaseLocalizedString((uint64_t)@"Time", (uint64_t)@"TIME_STRING");
  if (v6) {
    v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", v6, v5);
  }
  else {
    v7 = v5;
  }
  v8 = v7;

  id v9 = [[VSRecognitionSpeakAction alloc] initWithSpokenFeedbackString:v8 willTerminate:1];
  return v9;
}

@end