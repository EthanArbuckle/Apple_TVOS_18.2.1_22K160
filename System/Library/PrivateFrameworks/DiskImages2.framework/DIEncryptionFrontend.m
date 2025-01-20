@interface DIEncryptionFrontend
+ (BOOL)hasGUIaccess;
+ (BOOL)supportsSecureCoding;
+ (BOOL)updateSystemKeychainAttrWithDict:(id)a3 isStoring:(BOOL)a4 error:(id *)a5;
- (BOOL)GUIAskForPassphraseWithError:(id *)a3;
- (BOOL)allowStoringInKeychain;
- (BOOL)askPermissionWithRememberPassword:(BOOL *)a3 error:(id *)a4;
- (BOOL)checkWithHasIcloudKeychain:(BOOL *)a3 error:(id *)a4;
- (BOOL)consoleAskForPassphraseWithUseStdin:(BOOL)a3 error:(id *)a4;
- (BOOL)storeInKeychainWithPassphrase:(id)a3 forceSystemKeychain:(BOOL)a4 error:(id *)a5;
- (BOOL)updateDiskImageParamsWithFrontend:(id)a3 error:(id *)a4;
- (BOOL)validateDeserializationWithError:(id *)a3;
- (DIBaseParams)diParams;
- (DIEncryptionFrontend)initWithCoder:(id)a3;
- (DIEncryptionFrontend)initWithParams:(id)a3;
- (NSString)CLIPassphrasePrompt;
- (NSString)CLIVerifyPassphrasePrompt;
- (NSString)GUIPassphraseLabel;
- (NSString)GUIPassphrasePrompt;
- (NSString)GUIVerifyPassphraseLabel;
- (NSUUID)encryptionUUID;
- (id)getCertificateWithCertificatePath:(id)a3 error:(id *)a4;
- (id)getCertificateWithPublicKey:(id)a3 error:(id *)a4;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowStoringInKeychain:(BOOL)a3;
@end

@implementation DIEncryptionFrontend

- (DIEncryptionFrontend)initWithParams:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIEncryptionFrontend;
  v6 = -[DIEncryptionFrontend init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diParams, a3);
    if (-[DIEncryptionFrontend validateDeserializationWithError:](v7, "validateDeserializationWithError:", 0LL))
    {
      uint64_t v8 = [v5 encryptionUUID];
      encryptionUUID = v7->_encryptionUUID;
      v7->_encryptionUUID = (NSUUID *)v8;
    }
  }

  return v7;
}

- (unint64_t)flags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 readPassphraseFlags];

  int v4 = isatty(0);
  uint64_t v5 = 2LL;
  if (!v4) {
    uint64_t v5 = 8LL;
  }
  unint64_t v6 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  if (v4) {
    unint64_t v6 = v3;
  }
  if ((v3 & 8) != 0) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v6;
  }
  if (+[DIEncryptionFrontend hasGUIaccess](&OBJC_CLASS___DIEncryptionFrontend, "hasGUIaccess")) {
    return v7;
  }
  else {
    return v7 & 0xFFFFFFFFFFFFFFFBLL;
  }
}

- (id)getCertificateWithCertificatePath:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  *__error(),  @"Failed to read from certificate file ",  a4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)getCertificateWithPublicKey:(id)a3 error:(id *)a4
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  CFTypeRef v13 = 0LL;
  unint64_t v6 = (void *)MEMORY[0x189603FC8];
  uint64_t v7 = *MEMORY[0x18960BA68];
  v14[0] = *MEMORY[0x18960BB38];
  v14[1] = v7;
  v15[0] = *MEMORY[0x18960BB40];
  v15[1] = v5;
  v14[2] = *MEMORY[0x18960BE20];
  v15[2] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 dictionaryWithDictionary:v8];
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = SecItemCopyMatching(v9, &v13);
  if ((_DWORD)v10)
  {
    +[DIError nilWithOSStatus:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithOSStatus:verboseInfo:error:",  v10,  @"Failed to find keychain item using hashed key",  a4);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_super v11 = (void *)v13;
  }

  return v11;
}

- (BOOL)consoleAskForPassphraseWithUseStdin:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  int v7 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v30 = 66;
    __int16 v31 = 2080;
    v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
    LODWORD(v28) = 18;
    v27 = buf;
    v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    getDIOSLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v30 = 66;
      __int16 v31 = 2080;
      v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      _os_log_impl( &dword_188046000,  v10,  OS_LOG_TYPE_DEFAULT,  "%.*s: Asking for passphrase using readpassphrase",  buf,  0x12u);
    }
  }

  *__error() = v7;
  id v11 = -[DIEncryptionFrontend CLIPassphrasePrompt](self, "CLIPassphrasePrompt");
  v12 = (const char *)[v11 UTF8String];
  if (v5) {
    int v13 = 32;
  }
  else {
    int v13 = 2;
  }
  v14 = readpassphrase(v12, __s1, 0x102uLL, v13);

  if (v14)
  {
    if (!v5)
    {
      v15 = -[DIEncryptionFrontend CLIVerifyPassphrasePrompt](self, "CLIVerifyPassphrasePrompt");
      BOOL v16 = v15 == 0LL;

      if (!v16)
      {
        id v17 = -[DIEncryptionFrontend CLIVerifyPassphrasePrompt](self, "CLIVerifyPassphrasePrompt");
        v18 = readpassphrase((const char *)[v17 UTF8String], (char *)buf, 0x102uLL, 2);

        if (!v18) {
          return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  25LL,  @"Failed to read passphrase",  a4);
        }
        if (strncmp(__s1, (const char *)buf, 0x101uLL)) {
          return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  80LL,  @"Passphrases doesn't match",  a4);
        }
      }
    }
    v20 = -[DIEncryptionFrontend diParams](self, "diParams", v27, v28);
    char v21 = [v20 setPassphrase:__s1 error:a4];
  }

  else
  {
    if (v5) {
      return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  25LL,  @"Failed to read passphrase from stdin",  a4);
    }
    int v22 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v30 = 66;
      __int16 v31 = 2080;
      v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      v24 = (char *)_os_log_send_and_compose_impl();

      if (v24)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v24);
        free(v24);
      }
    }

    else
    {
      getDIOSLog();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v30 = 66;
        __int16 v31 = 2080;
        v32 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
        _os_log_impl(&dword_188046000, v25, OS_LOG_TYPE_DEFAULT, "%.*s: Failed to read passphrase from TTY", buf, 0x12u);
      }
    }

    *__error() = v22;
    return 1;
  }

  return v21;
}

- (BOOL)checkWithHasIcloudKeychain:(BOOL *)a3 error:(id *)a4
{
  *a3 = 1;
  return 1;
}

+ (BOOL)updateSystemKeychainAttrWithDict:(id)a3 isStoring:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)storeInKeychainWithPassphrase:(id)a3 forceSystemKeychain:(BOOL)a4 error:(id *)a5
{
  v43[7] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v9 = -[DIEncryptionFrontend diParams](self, "diParams");
  [v9 inputURL];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 path];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 lastPathComponent];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = v8;
  v14 = (const char *)[v13 UTF8String];
  if (v14 && *v14)
  {
    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v14 length:strlen(v14)];
    v15 = (void *)MEMORY[0x189603FC8];
    uint64_t v16 = *MEMORY[0x18960BB38];
    v43[0] = *MEMORY[0x18960BB48];
    uint64_t v17 = *MEMORY[0x18960B870];
    v42[0] = v16;
    v42[1] = v17;
    v18 = -[DIEncryptionFrontend encryptionUUID](self, "encryptionUUID");
    [v18 UUIDString];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v19;
    v43[2] = @"disk image password";
    uint64_t v20 = *MEMORY[0x18960B9F8];
    v42[2] = *MEMORY[0x18960B918];
    v42[3] = v20;
    uint64_t v21 = *MEMORY[0x18960BA88];
    v43[3] = v12;
    v43[4] = v12;
    uint64_t v22 = *MEMORY[0x18960BAA8];
    v42[4] = v21;
    v42[5] = v22;
    v42[6] = *MEMORY[0x18960BE78];
    v43[5] = MEMORY[0x189604A88];
    v43[6] = v34;
    [MEMORY[0x189603F68] dictionaryWithObjects:v43 forKeys:v42 count:7];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 dictionaryWithDictionary:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    char v35 = 0;
    if (a4) {
      goto LABEL_28;
    }
    if (!-[DIEncryptionFrontend checkWithHasIcloudKeychain:error:](self, "checkWithHasIcloudKeychain:error:", &v35, a5))
    {
LABEL_14:
      BOOL v25 = 0;
LABEL_24:

      goto LABEL_25;
    }

    if (!v35)
    {
LABEL_28:
      if (!+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:isStoring:error:]( &OBJC_CLASS___DIEncryptionFrontend,  "updateSystemKeychainAttrWithDict:isStoring:error:",  v24,  1LL,  a5)) {
        goto LABEL_14;
      }
    }

    int v26 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      uint64_t v28 = "iCloud";
      *(_DWORD *)buf = 68158210;
      int v37 = 80;
      v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
      __int16 v38 = 2080;
      if (!v35) {
        uint64_t v28 = "system";
      }
      __int16 v40 = 2080;
      v41 = v28;
      v29 = (char *)_os_log_send_and_compose_impl();

      if (v29)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v29);
        free(v29);
      }
    }

    else
    {
      getDIOSLog();
      int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        if (v35) {
          __int16 v31 = "iCloud";
        }
        else {
          __int16 v31 = "system";
        }
        *(_DWORD *)buf = 68158210;
        int v37 = 80;
        __int16 v38 = 2080;
        v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
        __int16 v40 = 2080;
        v41 = v31;
        _os_log_impl( &dword_188046000,  v30,  OS_LOG_TYPE_DEFAULT,  "%.*s: Storing passphrase in the %s keychain",  buf,  0x1Cu);
      }
    }

    *__error() = v26;
    uint64_t v32 = SecItemAdd((CFDictionaryRef)v24, 0LL);
    if ((_DWORD)v32) {
      BOOL v25 = +[DIError failWithOSStatus:description:error:]( &OBJC_CLASS___DIError,  "failWithOSStatus:description:error:",  v32,  @"Failed to store the passphrase in the keychain",  a5);
    }
    else {
      BOOL v25 = 1;
    }
    goto LABEL_24;
  }

  BOOL v25 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  @"Cannot store an empty passphrase",  a5);
LABEL_25:

  return v25;
}

- (BOOL)askPermissionWithRememberPassword:(BOOL *)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!-[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain")) {
    return 1;
  }
  int v6 = *__error();
  if (DIForwardLogs())
  {
    *(void *)error = 0LL;
    getDIOSLog();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&uint8_t buf[4] = 64;
    __int16 v23 = 2080;
    v24 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
    id v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v8);
      free(v8);
    }
  }

  else
  {
    getDIOSLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&uint8_t buf[4] = 64;
      __int16 v23 = 2080;
      v24 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
      _os_log_impl( &dword_188046000,  v9,  OS_LOG_TYPE_DEFAULT,  "%.*s: Asking user permission to store the passphrase in the keychain",  buf,  0x12u);
    }
  }

  *__error() = v6;
  error[0] = 0;
  uint64_t v10 = *MEMORY[0x1896056A0];
  v20[0] = *MEMORY[0x189605680];
  v20[1] = v10;
  v21[0] = @"Remember password in my keychain?";
  v21[1] = @"Yes";
  uint64_t v11 = *MEMORY[0x189605698];
  v20[2] = *MEMORY[0x1896056A8];
  v20[3] = v11;
  v21[2] = @"No";
  v21[3] = @"Cancel";
  [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:4];
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  id v13 = CFUserNotificationCreate(0LL, 0.0, 3uLL, error, v12);
  v14 = v13;
  if (!v13)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"CFUserNotificationCreate failed, error code %d",  error[0]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v16 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  v17,  a4);

    return v16;
  }

  *(void *)buf = 0LL;
  if (!CFUserNotificationReceiveResponse(v13, 0.0, (CFOptionFlags *)buf))
  {
    if (*(void *)buf != 2LL)
    {
      if (*(void *)buf)
      {
        BOOL v15 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  89LL,  @"The operation was cancelled by the user",  a4);
        goto LABEL_11;
      }

      *a3 = 1;
    }

    return 1;
  }

  BOOL v15 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  @"CFUserNotificationReceiveResponse failed",  a4);
LABEL_11:
  BOOL v16 = v15;

  return v16;
}

- (BOOL)GUIAskForPassphraseWithError:(id *)a3
{
  v34[4] = *MEMORY[0x1895F89C0];
  SInt32 error = 0;
  BOOL v5 = (void *)MEMORY[0x189603FA8];
  -[DIEncryptionFrontend GUIPassphraseLabel](self, "GUIPassphraseLabel");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 arrayWithObject:v6];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DIEncryptionFrontend GUIVerifyPassphraseLabel](self, "GUIVerifyPassphraseLabel");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFOptionFlags v9 = 65539LL;

  if (v8)
  {
    -[DIEncryptionFrontend GUIVerifyPassphraseLabel](self, "GUIVerifyPassphraseLabel");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v10];

    CFOptionFlags v9 = 196611LL;
  }

  uint64_t v11 = (void *)MEMORY[0x189603FC8];
  v33[0] = *MEMORY[0x189605680];
  v12 = -[DIEncryptionFrontend GUIPassphrasePrompt](self, "GUIPassphrasePrompt");
  uint64_t v13 = *MEMORY[0x1896056A0];
  v34[0] = v12;
  v34[1] = @"OK";
  uint64_t v14 = *MEMORY[0x189605698];
  v33[1] = v13;
  v33[2] = v14;
  v33[3] = *MEMORY[0x1896056B0];
  v34[2] = @"Cancel";
  v34[3] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v34 forKeys:v33 count:4];
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 dictionaryWithDictionary:v15];
  BOOL v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = CFUserNotificationCreate(0LL, 0.0, v9, &error, v16);
  v18 = v17;
  if (!v17)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"CFUserNotificationCreate failed, error code %d",  error);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v19 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  v20,  a3);

    goto LABEL_24;
  }

  CFOptionFlags responseFlags = 0LL;
  if (!CFUserNotificationReceiveResponse(v17, 0.0, &responseFlags))
  {
    char v30 = BYTE1(responseFlags) & 1;
    if ((responseFlags & 3) != 0)
    {
      id v21 = 0LL;
      BOOL v22 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  89LL,  @"The operation was cancelled by the user",  a3);
    }

    else
    {
      __int16 v23 = (const __CFString *)*MEMORY[0x1896056B8];
      CFUserNotificationGetResponseValue(v18, (CFStringRef)*MEMORY[0x1896056B8], 0LL);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        CFUserNotificationGetResponseValue(v18, v23, 1LL);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (![v21 isEqualToString:v24])
        {
          BOOL v19 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  80LL,  @"Passwords don’t match",  a3);

          goto LABEL_23;
        }
      }

      -[DIEncryptionFrontend diParams](self, "diParams");
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      id v21 = v21;
      char v26 = objc_msgSend(v25, "setPassphrase:error:", objc_msgSend(v21, "UTF8String"), a3);

      if ((v26 & 1) == 0
        || !-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]( self,  "askPermissionWithRememberPassword:error:",  &v30,  a3))
      {
        BOOL v19 = 0;
        goto LABEL_23;
      }

      BOOL v27 = -[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain");
      if (v30) {
        BOOL v28 = v27;
      }
      else {
        BOOL v28 = 0;
      }
      if (!v28)
      {
        BOOL v19 = 1;
        goto LABEL_23;
      }

      BOOL v22 = -[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]( self,  "storeInKeychainWithPassphrase:forceSystemKeychain:error:",  v21,  0LL,  a3);
    }

    BOOL v19 = v22;
LABEL_23:

    goto LABEL_24;
  }

  BOOL v19 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  @"CFUserNotificationReceiveResponse failed",  a3);
LABEL_24:

  return v19;
}

+ (BOOL)hasGUIaccess
{
  return 1;
}

- (BOOL)updateDiskImageParamsWithFrontend:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [v6 validateDeserializationWithError:a4];
  if ((v7 & 1) != 0)
  {
    [v6 diParams];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 diskImageParamsXPC];
    CFOptionFlags v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIEncryptionFrontend diParams](self, "diParams");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setDiskImageParamsXPC:v9];

    -[DIEncryptionFrontend setAllowStoringInKeychain:]( self,  "setAllowStoringInKeychain:",  [v6 allowStoringInKeychain]);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIEncryptionFrontend)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diParams"];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = -[DIEncryptionFrontend initWithParams:](self, "initWithParams:", v5);
  if (v6) {
    v6->_allowStoringInKeychain = [v4 decodeBoolForKey:@"allowStoringInKeychain"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  -[DIEncryptionFrontend diParams](self, "diParams");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v4 forKey:@"diParams"];

  objc_msgSend( v5,  "encodeBool:forKey:",  -[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain"),  @"allowStoringInKeychain");
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v4 validateDeserializationWithError:a3];

  return (char)a3;
}

- (NSString)GUIPassphrasePrompt
{
  return self->_GUIPassphrasePrompt;
}

- (NSString)GUIPassphraseLabel
{
  return self->_GUIPassphraseLabel;
}

- (NSString)GUIVerifyPassphraseLabel
{
  return self->_GUIVerifyPassphraseLabel;
}

- (NSString)CLIPassphrasePrompt
{
  return self->_CLIPassphrasePrompt;
}

- (NSString)CLIVerifyPassphrasePrompt
{
  return self->_CLIVerifyPassphrasePrompt;
}

- (DIBaseParams)diParams
{
  return self->_diParams;
}

- (NSUUID)encryptionUUID
{
  return self->_encryptionUUID;
}

- (BOOL)allowStoringInKeychain
{
  return self->_allowStoringInKeychain;
}

- (void)setAllowStoringInKeychain:(BOOL)a3
{
  self->_allowStoringInKeychain = a3;
}

- (void).cxx_destruct
{
}

@end