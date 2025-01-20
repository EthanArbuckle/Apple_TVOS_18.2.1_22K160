@interface UADiagnosticUtils
+ (unint64_t)absoluteToNSec:(unint64_t)a3;
@end

@implementation UADiagnosticUtils

+ (unint64_t)absoluteToNSec:(unint64_t)a3
{
  unsigned int v4 = dword_1000DE24C;
  if (!dword_1000DE24C)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000DE248);
    unsigned int v4 = dword_1000DE24C;
  }

  return dword_1000DE248 * a3 / v4;
}

@end