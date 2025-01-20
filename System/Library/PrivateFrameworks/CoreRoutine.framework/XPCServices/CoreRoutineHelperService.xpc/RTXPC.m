@interface RTXPC
+ (BOOL)clientCodeSignatureIsValid:(id)a3 error:(id *)a4;
+ (id)executablePathOfConnection:(id)a3;
+ (id)signingIdentifierOfConnection:(id)a3;
@end

@implementation RTXPC

+ (BOOL)clientCodeSignatureIsValid:(id)a3 error:(id *)a4
{
  return 1;
}

+ (id)executablePathOfConnection:(id)a3
{
  else {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
  }
  return v4;
}

+ (id)signingIdentifierOfConnection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  v5 = SecTaskCreateWithAuditToken(0LL, &v9);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFString *)SecTaskCopySigningIdentifier(v5, 0LL);
    CFRelease(v6);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

@end