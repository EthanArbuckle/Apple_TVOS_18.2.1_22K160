@interface SAStartRequest
- (id)ad_deferredMetricsContext;
@end

@implementation SAStartRequest

- (id)ad_deferredMetricsContext
{
  v10.receiver = self;
  v10.super_class = &OBJC_CLASS___SAStartRequest;
  id v3 = -[SAStartRequest ad_deferredMetricsContext](&v10, "ad_deferredMetricsContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAStartRequest origin](self, "origin"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SAStartRequest textToSpeechIsMuted](self, "textToSpeechIsMuted")));
    [v4 setObject:v6 forKey:SAStartRequestTextToSpeechIsMutedPListKey];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAStartRequest origin](self, "origin"));
    if (v7) {
      [v4 setObject:v7 forKey:SAStartRequestOriginPListKey];
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAStartRequest utterance](self, "utterance"));
    if (v8) {
      [v4 setObject:v8 forKey:SAStartRequestUtterancePListKey];
    }
  }

  return v4;
}

@end