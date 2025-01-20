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
  v6 = -[DIEncryptionFrontend init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diParams, a3);
    if (-[DIEncryptionFrontend validateDeserializationWithError:](v7, "validateDeserializationWithError:", 0LL))
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 encryptionUUID]);
      encryptionUUID = v7->_encryptionUUID;
      v7->_encryptionUUID = (NSUUID *)v8;
    }
  }

  return v7;
}

- (unint64_t)flags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  unint64_t v3 = (unint64_t)[v2 readPassphraseFlags];

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
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", a3));
  if (!v5)
  {
    id v6 = +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  *__error(),  @"Failed to read from certificate file ",  a4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

- (id)getCertificateWithPublicKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFTypeRef v11 = 0LL;
  v12[0] = kSecClass;
  v12[1] = kSecAttrPublicKeyHash;
  v13[0] = kSecClassCertificate;
  v13[1] = v5;
  v12[2] = kSecReturnData;
  v13[2] = &__kCFBooleanTrue;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));
  unint64_t v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));

  uint64_t v8 = SecItemCopyMatching(v7, &v11);
  if ((_DWORD)v8) {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[DIError nilWithOSStatus:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithOSStatus:verboseInfo:error:",  v8,  @"Failed to find keychain item using hashed key",  a4));
  }
  else {
    v9 = (void *)v11;
  }

  return v9;
}

- (BOOL)consoleAskForPassphraseWithUseStdin:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  int v7 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v34 = 0LL;
    uint64_t v8 = sub_1000BE278();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v36 = 66;
    __int16 v37 = 2080;
    v38 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
    LODWORD(v33) = 18;
    CFTypeRef v11 = (char *)_os_log_send_and_compose_impl( v10,  &v34,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%.*s: Asking for passphrase using readpassphrase",  (int)buf,  v33);

    if (v11)
    {
      fprintf(__stderrp, "%s\n", v11);
      free(v11);
    }
  }

  else
  {
    uint64_t v12 = sub_1000BE278();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v36 = 66;
      __int16 v37 = 2080;
      v38 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%.*s: Asking for passphrase using readpassphrase",  buf,  0x12u);
    }
  }

  *__error() = v7;
  id v14 = objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend CLIPassphrasePrompt](self, "CLIPassphrasePrompt"));
  v15 = (const char *)[v14 UTF8String];
  if (v5) {
    int v16 = 32;
  }
  else {
    int v16 = 2;
  }
  v17 = readpassphrase(v15, __s1, 0x102uLL, v16);

  if (v17)
  {
    if (!v5)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend CLIVerifyPassphrasePrompt](self, "CLIVerifyPassphrasePrompt"));
      BOOL v19 = v18 == 0LL;

      if (!v19)
      {
        id v20 = objc_claimAutoreleasedReturnValue( -[DIEncryptionFrontend CLIVerifyPassphrasePrompt]( self, "CLIVerifyPassphrasePrompt"));
        v21 = readpassphrase((const char *)[v20 UTF8String], (char *)buf, 0x102uLL, 2);

        if (!v21) {
          return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  25LL,  @"Failed to read passphrase",  a4);
        }
        if (strncmp(__s1, (const char *)buf, 0x101uLL)) {
          return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  80LL,  @"Passphrases doesn't match",  a4);
        }
      }
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
    unsigned __int8 v24 = [v23 setPassphrase:__s1 error:a4];
  }

  else
  {
    if (v5) {
      return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  25LL,  @"Failed to read passphrase from stdin",  a4);
    }
    int v25 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v34 = 0LL;
      uint64_t v26 = sub_1000BE278();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v28 = 3LL;
      }
      else {
        uint64_t v28 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v36 = 66;
      __int16 v37 = 2080;
      v38 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
      LODWORD(v33) = 18;
      v29 = (char *)_os_log_send_and_compose_impl( v28,  &v34,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "%.*s: Failed to read passphrase from TTY",  (int)buf,  v33);

      if (v29)
      {
        fprintf(__stderrp, "%s\n", v29);
        free(v29);
      }
    }

    else
    {
      uint64_t v30 = sub_1000BE278();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v36 = 66;
        __int16 v37 = 2080;
        v38 = "-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%.*s: Failed to read passphrase from TTY",  buf,  0x12u);
      }
    }

    *__error() = v25;
    return 1;
  }

  return v24;
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
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 inputURL]);
  CFTypeRef v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);

  id v13 = v8;
  id v14 = (const char *)[v13 UTF8String];
  if (v14 && *v14)
  {
    v33 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v14, strlen(v14));
    v43[0] = kSecClassGenericPassword;
    v42[0] = kSecClass;
    v42[1] = kSecAttrAccount;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend encryptionUUID](self, "encryptionUUID"));
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
    v43[1] = v16;
    v43[2] = @"disk image password";
    v42[2] = kSecAttrDescription;
    v42[3] = kSecAttrLabel;
    v43[3] = v12;
    v43[4] = v12;
    v42[4] = kSecAttrService;
    v42[5] = kSecAttrSynchronizable;
    v42[6] = kSecValueData;
    v43[5] = &__kCFBooleanTrue;
    v43[6] = v33;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  7LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v17));

    char v35 = 0;
    if (a4) {
      goto LABEL_31;
    }
    if (!-[DIEncryptionFrontend checkWithHasIcloudKeychain:error:](self, "checkWithHasIcloudKeychain:error:", &v35, a5))
    {
LABEL_17:
      BOOL v19 = 0;
LABEL_27:

      goto LABEL_28;
    }

    if (!v35)
    {
LABEL_31:
      if (!+[DIEncryptionFrontend updateSystemKeychainAttrWithDict:isStoring:error:]( &OBJC_CLASS___DIEncryptionFrontend,  "updateSystemKeychainAttrWithDict:isStoring:error:",  v18,  1LL,  a5)) {
        goto LABEL_17;
      }
    }

    int v20 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v34 = 0LL;
      uint64_t v21 = sub_1000BE278();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v23 = 3LL;
      }
      else {
        uint64_t v23 = 2LL;
      }
      unsigned __int8 v24 = "iCloud";
      *(_DWORD *)buf = 68158210;
      int v37 = 80;
      v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
      __int16 v38 = 2080;
      if (!v35) {
        unsigned __int8 v24 = "system";
      }
      __int16 v40 = 2080;
      v41 = v24;
      LODWORD(v31) = 28;
      int v25 = (char *)_os_log_send_and_compose_impl( v23,  &v34,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%.*s: Storing passphrase in the %s keychain",  (int)buf,  v31,  v32);

      if (v25)
      {
        fprintf(__stderrp, "%s\n", v25);
        free(v25);
      }
    }

    else
    {
      uint64_t v26 = sub_1000BE278();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        if (v35) {
          uint64_t v28 = "iCloud";
        }
        else {
          uint64_t v28 = "system";
        }
        *(_DWORD *)buf = 68158210;
        int v37 = 80;
        __int16 v38 = 2080;
        v39 = "-[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]";
        __int16 v40 = 2080;
        v41 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%.*s: Storing passphrase in the %s keychain",  buf,  0x1Cu);
      }
    }

    *__error() = v20;
    uint64_t v29 = SecItemAdd((CFDictionaryRef)v18, 0LL);
    if ((_DWORD)v29) {
      BOOL v19 = +[DIError failWithOSStatus:description:error:]( &OBJC_CLASS___DIError,  "failWithOSStatus:description:error:",  v29,  @"Failed to store the passphrase in the keychain",  a5);
    }
    else {
      BOOL v19 = 1;
    }
    goto LABEL_27;
  }

  BOOL v19 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  @"Cannot store an empty passphrase",  a5);
LABEL_28:

  return v19;
}

- (BOOL)askPermissionWithRememberPassword:(BOOL *)a3 error:(id *)a4
{
  if (!-[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain")) {
    return 1;
  }
  int v6 = *__error();
  if (sub_1000BE2F0())
  {
    *(void *)error = 0LL;
    uint64_t v7 = sub_1000BE278();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&uint8_t buf[4] = 64;
    __int16 v25 = 2080;
    uint64_t v26 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
    LODWORD(v20) = 18;
    uint64_t v10 = (char *)_os_log_send_and_compose_impl( v9,  error,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%.*s: Asking user permission to store the passphrase in the keychain",  (int)buf,  v20);

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = sub_1000BE278();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&uint8_t buf[4] = 64;
      __int16 v25 = 2080;
      uint64_t v26 = "-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%.*s: Asking user permission to store the passphrase in the keychain",  buf,  0x12u);
    }
  }

  *__error() = v6;
  error[0] = 0;
  v22[0] = kCFUserNotificationAlertHeaderKey;
  v22[1] = kCFUserNotificationDefaultButtonTitleKey;
  v23[0] = @"Remember password in my keychain?";
  v23[1] = @"Yes";
  v22[2] = kCFUserNotificationOtherButtonTitleKey;
  v22[3] = kCFUserNotificationAlternateButtonTitleKey;
  v23[2] = @"No";
  v23[3] = @"Cancel";
  id v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));
  id v14 = CFUserNotificationCreate(0LL, 0.0, 3uLL, error, v13);
  v15 = v14;
  if (!v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CFUserNotificationCreate failed, error code %d",  error[0]));
    BOOL v17 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  v18,  a4);

    return v17;
  }

  *(void *)buf = 0LL;
  if (!CFUserNotificationReceiveResponse(v14, 0.0, (CFOptionFlags *)buf))
  {
    if (*(void *)buf != 2LL)
    {
      if (*(void *)buf)
      {
        unsigned __int8 v16 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  89LL,  @"The operation was cancelled by the user",  a4);
        goto LABEL_14;
      }

      *a3 = 1;
    }

    return 1;
  }

  unsigned __int8 v16 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  @"CFUserNotificationReceiveResponse failed",  a4);
LABEL_14:
  BOOL v17 = v16;

  return v17;
}

- (BOOL)GUIAskForPassphraseWithError:(id *)a3
{
  SInt32 error = 0;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend GUIPassphraseLabel](self, "GUIPassphraseLabel"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v5));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend GUIVerifyPassphraseLabel](self, "GUIVerifyPassphraseLabel"));
  CFOptionFlags v8 = 65539LL;

  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend GUIVerifyPassphraseLabel](self, "GUIVerifyPassphraseLabel"));
    [v6 addObject:v9];

    CFOptionFlags v8 = 196611LL;
  }

  v30[0] = kCFUserNotificationAlertHeaderKey;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend GUIPassphrasePrompt](self, "GUIPassphrasePrompt"));
  v31[0] = v10;
  v31[1] = @"OK";
  v30[1] = kCFUserNotificationDefaultButtonTitleKey;
  v30[2] = kCFUserNotificationAlternateButtonTitleKey;
  v30[3] = kCFUserNotificationTextFieldTitlesKey;
  v31[2] = @"Cancel";
  v31[3] = v6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  4LL));
  uint64_t v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));

  id v13 = CFUserNotificationCreate(0LL, 0.0, v8, &error, v12);
  id v14 = v13;
  if (!v13)
  {
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CFUserNotificationCreate failed, error code %d",  error));
    BOOL v15 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  v16,  a3);

    goto LABEL_24;
  }

  CFOptionFlags responseFlags = 0LL;
  if (!CFUserNotificationReceiveResponse(v13, 0.0, &responseFlags))
  {
    char v27 = BYTE1(responseFlags) & 1;
    if ((responseFlags & 3) != 0)
    {
      id v17 = 0LL;
      unsigned __int8 v18 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  89LL,  @"The operation was cancelled by the user",  a3);
    }

    else
    {
      CFStringRef ResponseValue = CFUserNotificationGetResponseValue(v14, kCFUserNotificationTextFieldValuesKey, 0LL);
      id v17 = (id)objc_claimAutoreleasedReturnValue(ResponseValue);
      if (v7)
      {
        CFStringRef v20 = CFUserNotificationGetResponseValue(v14, kCFUserNotificationTextFieldValuesKey, 1LL);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (![v17 isEqualToString:v21])
        {
          BOOL v15 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  80LL,  @"Passwords don’t match",  a3);

          goto LABEL_23;
        }
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
      id v17 = v17;
      unsigned __int8 v23 = objc_msgSend(v22, "setPassphrase:error:", objc_msgSend(v17, "UTF8String"), a3);

      if ((v23 & 1) == 0
        || !-[DIEncryptionFrontend askPermissionWithRememberPassword:error:]( self,  "askPermissionWithRememberPassword:error:",  &v27,  a3))
      {
        BOOL v15 = 0;
        goto LABEL_23;
      }

      unsigned int v24 = -[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain");
      if (v27) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = 0;
      }
      if (v25 != 1)
      {
        BOOL v15 = 1;
        goto LABEL_23;
      }

      unsigned __int8 v18 = -[DIEncryptionFrontend storeInKeychainWithPassphrase:forceSystemKeychain:error:]( self,  "storeInKeychainWithPassphrase:forceSystemKeychain:error:",  v17,  0LL,  a3);
    }

    BOOL v15 = v18;
LABEL_23:

    goto LABEL_24;
  }

  BOOL v15 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  154LL,  @"CFUserNotificationReceiveResponse failed",  a3);
LABEL_24:

  return v15;
}

+ (BOOL)hasGUIaccess
{
  return 1;
}

- (BOOL)updateDiskImageParamsWithFrontend:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [v6 validateDeserializationWithError:a4];
  if ((v7 & 1) != 0)
  {
    CFOptionFlags v8 = (void *)objc_claimAutoreleasedReturnValue([v6 diParams]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 diskImageParamsXPC]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
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
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DIBaseParams, v5),  @"diParams");
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  CFOptionFlags v8 = -[DIEncryptionFrontend initWithParams:](self, "initWithParams:", v7);
  if (v8) {
    v8->_allowStoringInKeychain = [v4 decodeBoolForKey:@"allowStoringInKeychain"];
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  [v5 encodeObject:v4 forKey:@"diParams"];

  objc_msgSend( v5,  "encodeBool:forKey:",  -[DIEncryptionFrontend allowStoringInKeychain](self, "allowStoringInKeychain"),  @"allowStoringInKeychain");
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
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