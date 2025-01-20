@interface SAStructuredDictationFailed
- (id)ad_error;
@end

@implementation SAStructuredDictationFailed

- (id)ad_error
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationFailed userFacingReasonTitle](self, "userFacingReasonTitle"));
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, AFSiriLocalizedFailureTitleKey);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationFailed userFacingReasonDescription](self, "userFacingReasonDescription"));
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, AFSiriLocalizedFailureDescriptionKey);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationFailed recognition](self, "recognition"));
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, AFSiriRecognitionKey);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AFSiriStructuredDictationErrorDomain,  -[SAStructuredDictationFailed errorCode](self, "errorCode"),  v3));

  return v7;
}

@end