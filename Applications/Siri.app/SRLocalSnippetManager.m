@interface SRLocalSnippetManager
+ (VRXVisualResponseProvider)visualResponseProvider;
+ (id)transcriptItemForObject:(id)a3;
+ (void)_logRFSnippetRenderingContextWithEvent:(int64_t)a3;
@end

@implementation SRLocalSnippetManager

+ (VRXVisualResponseProvider)visualResponseProvider
{
  if (qword_1000D9B50 != -1) {
    dispatch_once(&qword_1000D9B50, &stru_1000BB0E8);
  }
  return (VRXVisualResponseProvider *)(id)qword_1000D9B48;
}

+ (id)transcriptItemForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class(&OBJC_CLASS___SAUISnippet, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    objc_opt_class(&OBJC_CLASS___SAGuidanceGuideSnippet, v6);
    if ((objc_opt_isKindOfClass(v3, v7) & 1) != 0)
    {
LABEL_3:
      v9 = off_1000B9228;
      goto LABEL_12;
    }

    objc_opt_class(&OBJC_CLASS___SAGuidanceGuideDomainSnippet, v8);
    if ((objc_opt_isKindOfClass(v3, v12) & 1) != 0)
    {
      v9 = off_1000B9220;
      goto LABEL_12;
    }

    objc_opt_class(&OBJC_CLASS___SAUIPluginSnippet, v13);
    if ((objc_opt_isKindOfClass(v3, v22) & 1) != 0
      || (objc_opt_class(&OBJC_CLASS___SAUIVisualResponseSnippet, v23), (objc_opt_isKindOfClass(v3, v24) & 1) != 0))
    {
      v25 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136315138;
        v33 = "+[SRLocalSnippetManager transcriptItemForObject:]";
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s #SRLocalSnippetManager: AUI has received a SAUISnippet on an Unexpected Platform. AUI only handles this on IOS.",  (uint8_t *)&v32,  0xCu);
      }
    }

+ (void)_logRFSnippetRenderingContextWithEvent:(int64_t)a3
{
  id v6 = [[VRXSnippetRenderingContext alloc] initWithRenderingEvent:a3];
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SRUIFInstrumentationManager sharedManager]( &OBJC_CLASS___SRUIFInstrumentationManager,  "sharedManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentInstrumentationTurnContext]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 turnIdentifier]);

  [v6 emitWithTurnIdentifier:v5];
}

@end