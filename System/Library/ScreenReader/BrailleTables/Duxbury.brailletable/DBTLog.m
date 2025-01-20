@interface DBTLog
@end

@implementation DBTLog

void __DBTLog_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Accessibility", "BRLTranslation.duxbury");
  v2 = (void *)DBTLog_log;
  DBTLog_log = (uint64_t)v1;
}

@end