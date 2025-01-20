@interface LSLogAppRecordInitsForDataSeparation
@end

@implementation LSLogAppRecordInitsForDataSeparation

void ___LSLogAppRecordInitsForDataSeparation_block_invoke()
{
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  _LSLogAppRecordInitsForDataSeparation::result = os_log_type_enabled(v0, OS_LOG_TYPE_INFO);
}

@end