@interface MFAccount
+ (BOOL)migrateCredentialsIfNecessaryWithPersistentAccount:(id)a3 credential:(id)a4;
@end

@implementation MFAccount

+ (BOOL)migrateCredentialsIfNecessaryWithPersistentAccount:(id)a3 credential:(id)a4
{
  if (a4)
  {
    if ([a4 password])
    {
      LOBYTE(v6) = 0;
    }

    else
    {
      id v6 = objc_msgSend(a3, "mf_legacyPasswordFromKeychain");
      if (v6)
      {
        [a4 setPassword:v6];
        objc_msgSend(a3, "mf_removeLegacyPasswordInKeychain");
        LOBYTE(v6) = 1;
      }
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

@end