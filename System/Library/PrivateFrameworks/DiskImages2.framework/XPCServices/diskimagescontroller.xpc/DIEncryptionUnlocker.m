@interface DIEncryptionUnlocker
+ (BOOL)supportsSecureCoding;
- (BOOL)keychainUnlockWithError:(id *)a3;
- (BOOL)keychainUnlockWithIsSystemKeychain:(BOOL)a3 error:(id *)a4;
- (BOOL)lookupLegacyKeychainWithXpcHandler:(id)a3 error:(id *)a4;
- (BOOL)tryUnlockUsingSaksWithHasSaksKey:(BOOL *)a3 error:(id *)a4;
- (BOOL)unlockWithXpcHandler:(id)a3 error:(id *)a4;
- (id)CLIPassphrasePrompt;
- (id)GUIPassphraseLabel;
- (id)GUIPassphrasePrompt;
@end

@implementation DIEncryptionUnlocker

- (id)GUIPassphrasePrompt
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputURL]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Enter password to access “%@”",  v4));

  return v5;
}

- (id)GUIPassphraseLabel
{
  return @"Password";
}

- (id)CLIPassphrasePrompt
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputURL]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Enter password to access “%@”: ",  v4));

  return v5;
}

- (BOOL)keychainUnlockWithIsSystemKeychain:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  CFTypeRef result = 0LL;
  v69[0] = kSecClassGenericPassword;
  v68[0] = kSecClass;
  v68[1] = kSecAttrAccount;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend encryptionUUID](self, "encryptionUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  v69[1] = v8;
  v69[2] = kSecAttrSynchronizableAny;
  v68[2] = kSecAttrSynchronizable;
  v68[3] = kSecReturnData;
  v69[3] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  4LL));
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));

  if (v5
    && !+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:isStoring:error:]( &OBJC_CLASS___DIEncryptionFrontend,  "updateSystemKeychainAttrWithDict:isStoring:error:",  v10,  0LL,  0LL))
  {
    goto LABEL_65;
  }

  int v11 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v60 = 0LL;
    uint64_t v12 = sub_1000BE278();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v14 = 3LL;
    }
    else {
      uint64_t v14 = 2LL;
    }
    v15 = "iCloud";
    *(_DWORD *)buf = 68158210;
    int v63 = 65;
    v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    __int16 v64 = 2080;
    if (v5) {
      v15 = "system";
    }
    __int16 v66 = 2080;
    v67 = v15;
    LODWORD(v57) = 28;
    v16 = (char *)_os_log_send_and_compose_impl( v14,  &v60,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%.*s: Looking for encrypted image passphrase in the %s keychain",  (int)buf,  v57,  v58);

    if (v16)
    {
      fprintf(__stderrp, "%s\n", v16);
      free(v16);
    }
  }

  else
  {
    uint64_t v17 = sub_1000BE278();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = "iCloud";
      *(_DWORD *)buf = 68158210;
      int v63 = 65;
      v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      __int16 v64 = 2080;
      if (v5) {
        v19 = "system";
      }
      __int16 v66 = 2080;
      v67 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%.*s: Looking for encrypted image passphrase in the %s keychain",  buf,  0x1Cu);
    }
  }

  *__error() = v11;
  OSStatus v20 = SecItemCopyMatching(v10, &result);
  OSStatus v21 = v20;
  if (v20 == -25308)
  {
    int v22 = *__error();
    if (!sub_1000BE2F0())
    {
      uint64_t v52 = sub_1000BE278();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v63 = 65;
        __int16 v64 = 2080;
        v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%.*s: Keychain item requires ACL upgrade",  buf,  0x12u);
      }

      goto LABEL_60;
    }

    uint64_t v60 = 0LL;
    uint64_t v32 = sub_1000BE278();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v34 = 3LL;
    }
    else {
      uint64_t v34 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v63 = 65;
    __int16 v64 = 2080;
    v65 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    LODWORD(v57) = 18;
    v26 = (char *)_os_log_send_and_compose_impl( v34,  &v60,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "%.*s: Keychain item requires ACL upgrade",  (int)buf,  v57);

    if (v26)
    {
LABEL_36:
      fprintf(__stderrp, "%s\n", v26);
      free(v26);
    }

- (BOOL)keychainUnlockWithError:(id *)a3
{
  char v8 = 0;
  unsigned int v5 = -[DIEncryptionFrontend checkWithHasIcloudKeychain:error:](self, "checkWithHasIcloudKeychain:error:", &v8, a3);
  BOOL result = 0;
  if (v5)
  {
    if (!v8) {
      return 1;
    }
    unsigned int v7 = -[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]( self,  "keychainUnlockWithIsSystemKeychain:error:",  0LL,  a3);
    BOOL result = 0;
    if (v7) {
      return 1;
    }
  }

  return result;
}

- (BOOL)lookupLegacyKeychainWithXpcHandler:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)tryUnlockUsingSaksWithHasSaksKey:(BOOL *)a3 error:(id *)a4
{
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v7 diskImageParamsXPC]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 backendXPC]);
  unsigned __int8 v10 = +[DICryptoHelper getPassphraseUsingSaksWithBackendXPC:passPhrase:error:]( &OBJC_CLASS___DICryptoHelper,  "getPassphraseUsingSaksWithBackendXPC:passPhrase:error:",  v9,  v14,  a4);

  if ((v10 & 1) == 0) {
    return 0;
  }
  if (!LOBYTE(v14[0])) {
    return 1;
  }
  if (a3) {
    *a3 = 1;
  }
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  unsigned __int8 v12 = [v11 setPassphrase:v14 error:a4];

  return v12;
}

- (BOOL)unlockWithXpcHandler:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = -[DIEncryptionFrontend flags](self, "flags");
  unsigned __int8 v8 = v7;
  if ((v7 & 8) != 0)
  {
    unsigned __int8 v10 = -[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]( self,  "consoleAskForPassphraseWithUseStdin:error:",  1LL,  a4);
LABEL_7:
    unsigned __int8 v9 = v10;
    goto LABEL_23;
  }

  if ((v7 & 1) == 0)
  {
LABEL_3:
    char v28 = 0;
    if (-[DIEncryptionUnlocker tryUnlockUsingSaksWithHasSaksKey:error:]( self,  "tryUnlockUsingSaksWithHasSaksKey:error:",  &v28,  a4))
    {
      if (v28)
      {
LABEL_5:
        unsigned __int8 v9 = 1;
LABEL_23:
        id v13 = 0LL;
        goto LABEL_24;
      }

      if ((v8 & 2) == 0) {
        goto LABEL_14;
      }
      if (-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]( self,  "consoleAskForPassphraseWithUseStdin:error:",  0LL,  a4))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
        unsigned __int8 v17 = [v16 hasUnlockedBackend];

        if ((v17 & 1) != 0) {
          goto LABEL_5;
        }
LABEL_14:
        if ((v8 & 4) != 0)
        {
          v19 = 0LL;
          uint64_t v20 = 2LL;
          while (1)
          {
            id v27 = v19;
            unsigned __int8 v9 = [v6 GUIAskForPassphraseWithEncryptionFrontend:self error:&v27];
            id v21 = v27;

            if ((v9 & 1) != 0) {
              break;
            }
            uint64_t v22 = (uint64_t)[v21 code];
            if (v22 >= 0) {
              uint64_t v23 = v22;
            }
            else {
              uint64_t v23 = -v22;
            }
            BOOL v24 = v23 != 80 || v20-- == 0;
            v19 = v21;
            if (v24)
            {
              if (a4) {
                *a4 = v21;
              }
              break;
            }
          }

          goto LABEL_23;
        }

        unsigned __int8 v10 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  25LL,  @"Cannot retrieve passphrase from user via TTY or GUI",  a4);
        goto LABEL_7;
      }
    }

    unsigned __int8 v9 = 0;
    goto LABEL_23;
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  id v29 = 0LL;
  unsigned __int8 v12 = [v11 tryUnlockUsingKeychainCertificateWithError:&v29];
  id v13 = v29;

  if ((v12 & 1) != 0) {
    goto LABEL_9;
  }
  if (v13)
  {
    if (a4)
    {
      id v13 = v13;
      unsigned __int8 v9 = 0;
      *a4 = v13;
      goto LABEL_24;
    }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end