@interface VSDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation VSDiagnosticExtension

- (id)attachmentList
{
  if (_os_feature_enabled_impl("VoiceServices", "use_SiriTTSService"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/mobile/Library/Logs/SiriTTSService/"));
    v4 = @".*\\.(caf|tailspin)";
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/mobile/Library/Logs/CrashReporter/VoiceServices/"));
    v4 = @"TTS.*\\.(wav|tailspin)";
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v4,  1LL,  0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[VSDiagnosticExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v3,  v5,  0LL));

  return v6;
}

- (id)attachmentsForParameters:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSDiagnosticExtension attachmentList](self, "attachmentList", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingComparator:&stru_100004078]);

  id v5 = [v4 count];
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, v6));

  return v7;
}

@end