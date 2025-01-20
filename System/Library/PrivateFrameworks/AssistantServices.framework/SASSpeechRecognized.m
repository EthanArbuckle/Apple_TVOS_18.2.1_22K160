@interface SASSpeechRecognized
- (id)ad_endTime;
- (id)ad_leadingSilence;
- (id)ad_speechEndTime;
- (id)ad_trailingSilence;
- (id)description;
@end

@implementation SASSpeechRecognized

- (id)ad_leadingSilence
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechRecognized recognition](self, "recognition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 phrases]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interpretations]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tokens]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 startTime]);

  return v9;
}

- (id)ad_speechEndTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechRecognized recognition](self, "recognition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 phrases]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interpretations]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tokens]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 silenceStartTime]);

  return v9;
}

- (id)ad_trailingSilence
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechRecognized ad_endTime](self, "ad_endTime"));
  [v3 doubleValue];
  double v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechRecognized ad_speechEndTime](self, "ad_speechEndTime"));
  [v6 doubleValue];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5 - v7));

  return v8;
}

- (id)ad_endTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechRecognized recognition](self, "recognition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 phrases]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interpretations]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tokens]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 endTime]);

  return v9;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = &OBJC_CLASS___SASSpeechRecognized;
  id v4 = -[SASSpeechRecognized description](&v9, "description");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechRecognized af_bestTextInterpretation](self, "af_bestTextInterpretation"));
  double v7 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ Recognition Text: \"%@\"", v5, v6);

  return v7;
}

@end