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
  v2 = (void *)NSString;
  v3 = -[DIEncryptionFrontend diParams](self, "diParams");
  [v3 inputURL];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 lastPathComponent];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"Enter password to access “%@”", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)GUIPassphraseLabel
{
  return @"Password";
}

- (id)CLIPassphrasePrompt
{
  v2 = (void *)NSString;
  v3 = -[DIEncryptionFrontend diParams](self, "diParams");
  [v3 inputURL];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 lastPathComponent];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"Enter password to access “%@”: ", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)keychainUnlockWithIsSystemKeychain:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v60[4] = *MEMORY[0x1895F89C0];
  CFTypeRef result = 0LL;
  v7 = (void *)MEMORY[0x189603FC8];
  uint64_t v8 = *MEMORY[0x18960BB38];
  v60[0] = *MEMORY[0x18960BB48];
  uint64_t v9 = *MEMORY[0x18960B870];
  v59[0] = v8;
  v59[1] = v9;
  v10 = -[DIEncryptionFrontend encryptionUUID](self, "encryptionUUID");
  [v10 UUIDString];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = *MEMORY[0x18960BAA8];
  uint64_t v13 = *MEMORY[0x18960BAB0];
  v60[1] = v11;
  v60[2] = v13;
  uint64_t v14 = *MEMORY[0x18960BE20];
  v59[2] = v12;
  v59[3] = v14;
  v60[3] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v60 forKeys:v59 count:4];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 dictionaryWithDictionary:v15];
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v5
    && !+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:isStoring:error:]( &OBJC_CLASS___DIEncryptionFrontend,  "updateSystemKeychainAttrWithDict:isStoring:error:",  v16,  0LL,  0LL))
  {
    goto LABEL_50;
  }

  int v17 = *__error();
  if (DIForwardLogs())
  {
    uint64_t v51 = 0LL;
    getDIOSLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    v19 = "iCloud";
    *(_DWORD *)buf = 68158210;
    int v54 = 65;
    v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    __int16 v55 = 2080;
    if (v5) {
      v19 = "system";
    }
    __int16 v57 = 2080;
    v58 = v19;
    LODWORD(v49) = 28;
    v48 = buf;
    v20 = (char *)_os_log_send_and_compose_impl();

    if (v20)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v20);
      free(v20);
    }
  }

  else
  {
    getDIOSLog();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = "iCloud";
      *(_DWORD *)buf = 68158210;
      int v54 = 65;
      v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
      __int16 v55 = 2080;
      if (v5) {
        v22 = "system";
      }
      __int16 v57 = 2080;
      v58 = v22;
      _os_log_impl( &dword_188046000,  v21,  OS_LOG_TYPE_DEFAULT,  "%.*s: Looking for encrypted image passphrase in the %s keychain",  buf,  0x1Cu);
    }
  }

  *__error() = v17;
  OSStatus v23 = SecItemCopyMatching(v16, &result);
  OSStatus v24 = v23;
  if (v23 == -25308)
  {
    int v25 = *__error();
    if (!DIForwardLogs())
    {
      getDIOSLog();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v54 = 65;
        __int16 v55 = 2080;
        v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
        _os_log_impl(&dword_188046000, v45, OS_LOG_TYPE_DEFAULT, "%.*s: Keychain item requires ACL upgrade", buf, 0x12u);
      }

      goto LABEL_45;
    }

    uint64_t v51 = 0LL;
    getDIOSLog();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v54 = 65;
    __int16 v55 = 2080;
    v56 = "-[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]";
    LODWORD(v49) = 18;
    v48 = buf;
    v27 = (char *)_os_log_send_and_compose_impl();

    if (v27)
    {
LABEL_24:
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v27);
      free(v27);
    }

- (BOOL)keychainUnlockWithError:(id *)a3
{
  char v8 = 0;
  BOOL v5 = -[DIEncryptionFrontend checkWithHasIcloudKeychain:error:](self, "checkWithHasIcloudKeychain:error:", &v8, a3);
  BOOL result = 0;
  if (v5)
  {
    if (!v8) {
      return 1;
    }
    BOOL v7 = -[DIEncryptionUnlocker keychainUnlockWithIsSystemKeychain:error:]( self,  "keychainUnlockWithIsSystemKeychain:error:",  0LL,  a3);
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
  uint64_t v15 = *MEMORY[0x1895F89C0];
  memset(v14, 0, 89);
  -[DIEncryptionFrontend diParams](self, "diParams");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 diskImageParamsXPC];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 backendXPC];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = +[DICryptoHelper getPassphraseUsingSaksWithBackendXPC:passPhrase:error:]( &OBJC_CLASS___DICryptoHelper,  "getPassphraseUsingSaksWithBackendXPC:passPhrase:error:",  v9,  v14,  a4);

  if (!v10) {
    return 0;
  }
  if (!LOBYTE(v14[0])) {
    return 1;
  }
  if (a3) {
    *a3 = 1;
  }
  v11 = -[DIEncryptionFrontend diParams](self, "diParams");
  char v12 = [v11 setPassphrase:v14 error:a4];

  return v12;
}

- (BOOL)unlockWithXpcHandler:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = -[DIEncryptionFrontend flags](self, "flags");
  char v8 = v7;
  if ((v7 & 8) != 0)
  {
    BOOL v10 = -[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]( self,  "consoleAskForPassphraseWithUseStdin:error:",  1LL,  a4);
LABEL_7:
    char v9 = v10;
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
        char v9 = 1;
LABEL_23:
        id v13 = 0LL;
        goto LABEL_24;
      }

      if ((v8 & 2) == 0) {
        goto LABEL_14;
      }
      if (-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]( self,  "consoleAskForPassphraseWithUseStdin:error:",  0LL,  a4))
      {
        v16 = -[DIEncryptionFrontend diParams](self, "diParams");
        char v17 = [v16 hasUnlockedBackend];

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
            char v9 = [v6 GUIAskForPassphraseWithEncryptionFrontend:self error:&v27];
            id v21 = v27;

            if ((v9 & 1) != 0) {
              break;
            }
            uint64_t v22 = [v21 code];
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

        BOOL v10 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  25LL,  @"Cannot retrieve passphrase from user via TTY or GUI",  a4);
        goto LABEL_7;
      }
    }

    char v9 = 0;
    goto LABEL_23;
  }
  v11 = -[DIEncryptionFrontend diParams](self, "diParams");
  id v29 = 0LL;
  char v12 = [v11 tryUnlockUsingKeychainCertificateWithError:&v29];
  id v13 = v29;

  if ((v12 & 1) != 0) {
    goto LABEL_9;
  }
  if (v13)
  {
    if (a4)
    {
      id v13 = v13;
      char v9 = 0;
      *a4 = v13;
      goto LABEL_24;
    }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end