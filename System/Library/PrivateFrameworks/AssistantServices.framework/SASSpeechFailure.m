@interface SASSpeechFailure
- (id)ad_error;
@end

@implementation SASSpeechFailure

- (id)ad_error
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AFSiriSpeechErrorDomain,  -[SASSpeechFailure errorCode](self, "errorCode"),  0LL);
}

@end