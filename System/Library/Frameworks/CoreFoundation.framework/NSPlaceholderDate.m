@interface NSPlaceholderDate
@end

@implementation NSPlaceholderDate

uint64_t __33____NSPlaceholderDate_initialize__block_invoke()
{
  if (CFDateGetTypeID_initOnce != -1) {
    dispatch_once(&CFDateGetTypeID_initOnce, &__block_literal_global_100);
  }
  uint64_t result = _CFExecutableLinkedOnOrAfter(7uLL);
  if ((_DWORD)result && *MEMORY[0x189616650])
  {
    objc_opt_class();
    return _objc_registerTaggedPointerClass();
  }

  else
  {
    _NSDateTaggedPointersDisabled = 1;
  }

  return result;
}

@end