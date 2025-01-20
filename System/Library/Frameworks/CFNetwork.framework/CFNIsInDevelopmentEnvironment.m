@interface CFNIsInDevelopmentEnvironment
@end

@implementation CFNIsInDevelopmentEnvironment

void ____CFNIsInDevelopmentEnvironment_block_invoke()
{
  __CFNIsInDevelopmentEnvironment::ok = os_variant_allows_internal_security_policies();
  if ((__CFNIsInDevelopmentEnvironment::ok & 1) == 0)
  {
    v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x189604DB0]);
    if (v0)
    {
      v1 = v0;
      CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"get-task-allow", 0LL);
      if (v2)
      {
        __CFNIsInDevelopmentEnvironment::ok = v2 == (CFTypeRef)*MEMORY[0x189604DE8];
      }

      else
      {
        CFTypeRef v2 = SecTaskCopyValueForEntitlement(v1, @"com.apple.security.get-task-allow", 0LL);
        __CFNIsInDevelopmentEnvironment::ok = v2 == (CFTypeRef)*MEMORY[0x189604DE8];
        if (!v2)
        {
LABEL_8:
          CFRelease(v1);
          return;
        }
      }

      CFRelease(v2);
      goto LABEL_8;
    }
  }

@end