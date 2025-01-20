@interface NSKeyValueDebugger
@end

@implementation NSKeyValueDebugger

_NSKeyValueDebugging *___NSKeyValueDebugger_block_invoke()
{
  result = (_NSKeyValueDebugging *)objc_msgSend( -[NSDictionary objectForKeyedSubscript:]( -[NSProcessInfo environment]( +[NSProcessInfo processInfo](NSProcessInfo, "processInfo"),  "environment"),  "objectForKeyedSubscript:",  @"_NSKeyValueDebugging"),  "BOOLValue");
  if ((_DWORD)result)
  {
    _MergedGlobals_132 = objc_msgSend( -[NSDictionary objectForKeyedSubscript:]( -[NSProcessInfo environment]( +[NSProcessInfo processInfo](NSProcessInfo, "processInfo"),  "environment"),  "objectForKeyedSubscript:",  @"_NSKeyValueDebuggingUseNSLog"),  "BOOLValue");
    result = objc_alloc_init(&OBJC_CLASS____NSKeyValueDebugging);
    qword_18C496D08 = (uint64_t)result;
  }

  return result;
}

@end