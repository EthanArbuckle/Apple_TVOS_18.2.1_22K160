@interface ComponentSystem
- (BOOL)supportsEnhancedAudioReturnChannel;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentSystem

- (void)populateAttributes:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ComponentSystem;
  id v4 = a3;
  id v5 = -[ComponentSystemBase populateAttributes:](&v9, "populateAttributes:", v4);
  BOOL v6 = _AXSVoiceOverTouchEnabled(v5) != 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6, v9.receiver, v9.super_class));
  [v4 setObject:v7 forKeyedSubscript:@"voiceOverEnabled"];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ComponentSystem supportsEnhancedAudioReturnChannel](self, "supportsEnhancedAudioReturnChannel")));
  [v4 setObject:v8 forKeyedSubscript:@"supportsEnhancedAudioReturnChannel"];
}

- (BOOL)supportsEnhancedAudioReturnChannel
{
  uint64_t v2 = DiagnosticLogHandleForCategory(6LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    BOOL v6 = "-[ComponentSystem supportsEnhancedAudioReturnChannel]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return MGGetBoolAnswer(@"K57p2Tit1BlJ8rFbLl/Nqg");
}

@end