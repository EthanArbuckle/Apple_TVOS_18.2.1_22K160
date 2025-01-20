@interface SRCompactViewControllerContentTester
- (BOOL)hasContentForState:(id)a3;
@end

@implementation SRCompactViewControllerContentTester

- (BOOL)hasContentForState:(id)a3
{
  id v3 = a3;
  if ([v3 keyboardHasContent])
  {
    v4 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      v5 = "%s #compact:Returning YES because the keyboard has content";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, 0xCu);
      goto LABEL_30;
    }

    goto LABEL_30;
  }

  if ([v3 navigationStackIsPopping]
    && (([v3 deviceIsPad] & 1) != 0
     || [v3 navigationBarHasContent]))
  {
    v4 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      v5 = "%s #compact:Returning YES because snippet is being popped from the view stack";
      goto LABEL_29;
    }

@end