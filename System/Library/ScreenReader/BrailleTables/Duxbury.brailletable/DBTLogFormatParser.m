@interface DBTLogFormatParser
@end

@implementation DBTLogFormatParser

void __DBTLogFormatParser_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Accessibility", "BRLTranslation.duxburyFormat");
  v2 = (void *)DBTLogFormatParser_log;
  DBTLogFormatParser_log = (uint64_t)v1;
}

@end