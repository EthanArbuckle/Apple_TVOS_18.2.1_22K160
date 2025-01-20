@interface SecXPCUtils
+ (BOOL)clientCanEditPreferenceOwnership;
+ (__CFString)copyApplicationIdentifier;
+ (__CFString)copyApplicationIdentifierFromConnection:(id)a3;
+ (__CFString)copyApplicationIdentifierFromSelf;
+ (__CFString)copySigningIdentifier:(id)a3;
@end

@implementation SecXPCUtils

+ (BOOL)clientCanEditPreferenceOwnership
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    [v2 valueForEntitlement:@"keychain-access-groups"];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      && [v4 isMemberOfClass:objc_opt_class()]
      && ([v4 containsObject:@"*"] & 1) != 0)
    {

      LOBYTE(v5) = 1;
      goto LABEL_8;
    }

LABEL_7:
    LOBYTE(v5) = 0;
    goto LABEL_8;
  }

  v7 = SecTaskCreateFromSelf(0LL);
  v5 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  v8 = (void *)SecTaskCopyValueForEntitlement(v7, @"keychain-access-groups", 0LL);
  CFRelease(v5);
  if (!v8) {
    goto LABEL_7;
  }
  CFTypeID v9 = CFGetTypeID(v8);
  if (v9 == CFArrayGetTypeID()) {
    LOBYTE(v5) = [v8 containsObject:@"*"];
  }
  else {
    LOBYTE(v5) = 0;
  }
  CFRelease(v8);
LABEL_8:

  return (char)v5;
}

+ (__CFString)copySigningIdentifier:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    [v3 auditToken];
    SecTaskRef v5 = SecTaskCreateWithAuditToken(0LL, &v9);
  }

  else
  {
    SecTaskRef v5 = SecTaskCreateFromSelf(0LL);
  }

  SecTaskRef v6 = v5;
  if (v5)
  {
    v7 = (__CFString *)SecTaskCopyIdentifier((uint64_t)v5, 11LL, 0LL);
    CFRelease(v6);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

+ (__CFString)copyApplicationIdentifierFromSelf
{
  v2 = SecTaskCreateFromSelf(0LL);
  if (!v2) {
    return +[SecXPCUtils copySigningIdentifier:](&OBJC_CLASS___SecXPCUtils, "copySigningIdentifier:", 0LL);
  }
  id v3 = v2;
  v4 = (__CFString *)SecTaskCopyValueForEntitlement(v2, @"application-identifier", 0LL);
  if (v4)
  {
    SecTaskRef v5 = v4;
    CFRelease(v3);
  }

  else
  {
    SecTaskRef v5 = (__CFString *)SecTaskCopyValueForEntitlement(v3, @"com.apple.application-identifier", 0LL);
    CFRelease(v3);
    if (!v5) {
      return +[SecXPCUtils copySigningIdentifier:](&OBJC_CLASS___SecXPCUtils, "copySigningIdentifier:", 0LL);
    }
  }

  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 == CFStringGetTypeID()) {
    return v5;
  }
  CFRelease(v5);
  return +[SecXPCUtils copySigningIdentifier:](&OBJC_CLASS___SecXPCUtils, "copySigningIdentifier:", 0LL);
}

+ (__CFString)copyApplicationIdentifierFromConnection:(id)a3
{
  id v3 = a3;
  [v3 valueForEntitlement:@"application-identifier"];
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v4
    && ([v3 valueForEntitlement:@"com.apple.application-identifier"],
        (v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0LL)
    || !-[__CFString isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
    || (Copy = (__CFString *)CFStringCreateCopy(0LL, v4)) == 0LL)
  {
    Copy = +[SecXPCUtils copySigningIdentifier:](&OBJC_CLASS___SecXPCUtils, "copySigningIdentifier:", v3);
  }

  return Copy;
}

+ (__CFString)copyApplicationIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    id v3 = +[SecXPCUtils copyApplicationIdentifierFromConnection:]( &OBJC_CLASS___SecXPCUtils,  "copyApplicationIdentifierFromConnection:",  v2);
  }
  else {
    id v3 = +[SecXPCUtils copyApplicationIdentifierFromSelf]( &OBJC_CLASS___SecXPCUtils,  "copyApplicationIdentifierFromSelf");
  }
  v4 = v3;

  return v4;
}

@end