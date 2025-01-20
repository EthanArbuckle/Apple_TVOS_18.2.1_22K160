@interface SASSpeechPartialResult
- (id)description;
@end

@implementation SASSpeechPartialResult

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SASSpeechPartialResult;
  id v4 = -[SASSpeechPartialResult description](&v9, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechPartialResult af_bestTextInterpretation](self, "af_bestTextInterpretation"));
  v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ Partial Recognition Text: \"%@\"", v5, v6);

  return v7;
}

@end