@interface CSDiagnosticeExtension
- (id)_sortedAttachmentListWithPath:(id)a3 regularExpressionPatten:(id)a4;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation CSDiagnosticeExtension

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v6 = os_log_create("com.apple.corespeech", "DiagnosticExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"]);

  if (v7
    && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && [v7 BOOLValue])
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      v18 = "-[CSDiagnosticeExtension attachmentsForParameters:]";
      __int16 v19 = 2112;
      v20 = @"Collecting 'CoreSpeech Logs'";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v17, 0x16u);
    }

    if (qword_100008158 != -1) {
      dispatch_once(&qword_100008158, &stru_100004138);
    }
    if (byte_100008150)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDiagnosticeExtension _sortedAttachmentListWithPath:regularExpressionPatten:]( self,  "_sortedAttachmentListWithPath:regularExpressionPatten:",  @"/private/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio",  @".*\\.(wav)$"));
      [v5 addObjectsFromArray:v9];

      v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDiagnosticeExtension _sortedAttachmentListWithPath:regularExpressionPatten:]( self,  "_sortedAttachmentListWithPath:regularExpressionPatten:",  @"/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs",  @".*\\.(wav)$"));
      [v5 addObjectsFromArray:v10];

      v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDiagnosticeExtension _sortedAttachmentListWithPath:regularExpressionPatten:]( self,  "_sortedAttachmentListWithPath:regularExpressionPatten:",  @"/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs",  @".*\\.(opx)$"));
      [v5 addObjectsFromArray:v11];

      v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDiagnosticeExtension _sortedAttachmentListWithPath:regularExpressionPatten:]( self,  "_sortedAttachmentListWithPath:regularExpressionPatten:",  @"/private/var/mobile/Library/Logs/CrashReporter/Assistant/MHLog",  @".*\\.(wav)$"));
      [v5 addObjectsFromArray:v12];

      v13 = @"/private//var/mobile/Library/Logs/CrashReporter/Assistant/AVVCCapture";
      v14 = @".*\\.(caf)$";
    }

    else
    {
      v13 = @"/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs";
      v14 = @"PHS\\-.*\\.(wav)$";
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDiagnosticeExtension _sortedAttachmentListWithPath:regularExpressionPatten:]( self,  "_sortedAttachmentListWithPath:regularExpressionPatten:",  v13,  v14));
    [v5 addObjectsFromArray:v15];
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315394;
    v18 = "-[CSDiagnosticeExtension attachmentsForParameters:]";
    __int16 v19 = 2112;
    v20 = @"Not collecting 'CoreSpeech Logs'";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v17, 0x16u);
  }

  return v5;
}

- (id)_sortedAttachmentListWithPath:(id)a3 regularExpressionPatten:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v6,  1LL,  0LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDiagnosticeExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v7,  v8,  0LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingComparator:&stru_1000040F8]);
  id v11 = [v10 count];
  else {
    uint64_t v12 = (uint64_t)v11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, v12));

  return v13;
}

@end