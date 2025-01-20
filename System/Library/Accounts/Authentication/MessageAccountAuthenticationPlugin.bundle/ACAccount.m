@interface ACAccount
- (BOOL)mf_migrateCredentialsIfNecessaryWithAccountCredential:(id)a3;
- (BOOL)mf_usesSSL;
- (Class)mf_accountClass;
- (id)mf_hostname;
- (id)mf_legacyPasswordFromKeychain;
- (unsigned)mf_legacyPortNumberForKeychain;
- (void)mf_legacyKeychainProtocol;
- (void)mf_removeLegacyPasswordInKeychain;
@end

@implementation ACAccount

- (BOOL)mf_migrateCredentialsIfNecessaryWithAccountCredential:(id)a3
{
  return -[objc_class migrateCredentialsIfNecessaryWithPersistentAccount:credential:]( -[ACAccount mf_accountClass](self, "mf_accountClass"),  "migrateCredentialsIfNecessaryWithPersistentAccount:credential:",  self,  a3);
}

- (id)mf_legacyPasswordFromKeychain
{
  return +[MFMessageKeychainManager passwordForHost:username:port:keychainProtocol:]( &OBJC_CLASS___MFMessageKeychainManager,  "passwordForHost:username:port:keychainProtocol:",  -[ACAccount mf_hostname](self, "mf_hostname"),  -[ACAccount username](self, "username"),  -[ACAccount mf_legacyPortNumberForKeychain](self, "mf_legacyPortNumberForKeychain"),  -[ACAccount mf_legacyKeychainProtocol](self, "mf_legacyKeychainProtocol"));
}

- (void)mf_removeLegacyPasswordInKeychain
{
}

- (Class)mf_accountClass
{
  v3 = (objc_class *)+[MFAccountLoader accountClassForPersistentAccount:error:]( &OBJC_CLASS___MFAccountLoader,  "accountClassForPersistentAccount:error:",  self,  &v8);
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v8 == 0;
  }
  if (!v4)
  {
    v5 = (os_log_s *)MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[ACAccountType identifier](-[ACAccount accountType](self, "accountType"), "identifier");
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "#Warning failed to load class for account of type %@", buf, 0xCu);
    }
  }

  return v3;
}

- (unsigned)mf_legacyPortNumberForKeychain
{
  v3 = -[ACAccount mf_accountClass](self, "mf_accountClass");
  id v4 = -[ACAccount accountProperties](self, "accountProperties");
  id v5 = [v4 objectForKeyedSubscript:MailAccountPortNumber];
  if (!v5
    || (v6 = v5, (objc_opt_respondsToSelector(v5, "intValue") & 1) == 0)
    || (id v7 = [v6 intValue], !(_DWORD)v7))
  {
    if (!-[ACAccount mf_usesSSL](self, "mf_usesSSL")
      || (id v7 = -[objc_class defaultSecurePortNumber](v3, "defaultSecurePortNumber"), !(_DWORD)v7))
    {
      id v7 = -[objc_class defaultPortNumber](v3, "defaultPortNumber");
    }
  }

  uint64_t v8 = -[ACAccountType identifier](-[ACAccount accountType](self, "accountType"), "identifier");
  if (-[NSString isEqualToString:](v8, "isEqualToString:", ACAccountTypeIdentifierSMTP))
  {
    LODWORD(v7) = 25;
    return v7;
  }

  return -[objc_class defaultPortNumber](v3, "defaultPortNumber");
}

- (id)mf_hostname
{
  id result = -[objc_class hostname](-[ACAccount mf_accountClass](self, "mf_accountClass"), "hostname");
  if (!result)
  {
    id v4 = -[ACAccount accountProperties](self, "accountProperties");
    return [v4 objectForKeyedSubscript:MailAccountHostname];
  }

  return result;
}

- (void)mf_legacyKeychainProtocol
{
  return -[objc_class legacyKeychainProtocol]( -[ACAccount mf_accountClass](self, "mf_accountClass"),  "legacyKeychainProtocol");
}

- (BOOL)mf_usesSSL
{
  if ((-[objc_class usesSSL](-[ACAccount mf_accountClass](self, "mf_accountClass"), "usesSSL") & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    id v4 = -[ACAccount accountProperties](self, "accountProperties");
    id v3 = [v4 objectForKeyedSubscript:MailAccountSSLEnabled];
    if (v3)
    {
      id v5 = v3;
      if ((objc_opt_respondsToSelector(v3, "BOOLValue") & 1) != 0) {
        LOBYTE(v3) = [v5 BOOLValue];
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
  }

  return (char)v3;
}

@end