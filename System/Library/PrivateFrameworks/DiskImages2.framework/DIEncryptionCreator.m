@interface DIEncryptionCreator
+ (BOOL)supportsSecureCoding;
- (BOOL)allowStoringInKeychain;
- (BOOL)createAndStoreInSystemKeychainWithAccount:(id)a3 error:(id *)a4;
- (BOOL)createWithXpcHandler:(id)a3 error:(id *)a4;
- (id)CLIPassphrasePrompt;
- (id)CLIVerifyPassphrasePrompt;
- (id)GUIPassphraseLabel;
- (id)GUIPassphrasePrompt;
- (id)GUIVerifyPassphraseLabel;
@end

@implementation DIEncryptionCreator

- (BOOL)allowStoringInKeychain
{
  return 1;
}

- (id)GUIPassphrasePrompt
{
  v2 = (void *)NSString;
  v3 = -[DIEncryptionFrontend diParams](self, "diParams");
  [v3 inputURL];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 lastPathComponent];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"Enter a new password to secure “%@”", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)GUIPassphraseLabel
{
  return @"New password";
}

- (id)GUIVerifyPassphraseLabel
{
  return @"Verify";
}

- (id)CLIPassphrasePrompt
{
  v2 = (void *)NSString;
  v3 = -[DIEncryptionFrontend diParams](self, "diParams");
  [v3 inputURL];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 lastPathComponent];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"Enter a new password to secure “%@”: ", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)CLIVerifyPassphrasePrompt
{
  return @"Re-enter new password: ";
}

- (BOOL)createWithXpcHandler:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = -[DIEncryptionFrontend flags](self, "flags");
  char v8 = v7;
  if ((v7 & 8) != 0)
  {
    char v9 = -[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]( self,  "consoleAskForPassphraseWithUseStdin:error:",  1LL,  a4);
LABEL_10:
    BOOL v12 = v9;
    goto LABEL_11;
  }

  if ((v7 & 2) == 0) {
    goto LABEL_3;
  }
  if (!-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:]( self,  "consoleAskForPassphraseWithUseStdin:error:",  0LL,  a4))
  {
    BOOL v12 = 0;
    goto LABEL_11;
  }
  v10 = -[DIEncryptionFrontend diParams](self, "diParams");
  char v11 = [v10 hasUnlockedBackend];

  if ((v11 & 1) == 0)
  {
LABEL_3:
    if ((v8 & 4) != 0) {
      char v9 = [v6 GUIAskForPassphraseWithEncryptionFrontend:self error:a4];
    }
    else {
      char v9 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  25LL,  @"Cannot retrieve passphrase from user via TTY or GUI",  a4);
    }
    goto LABEL_10;
  }

  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)createAndStoreInSystemKeychainWithAccount:(id)a3 error:(id *)a4
{
  return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  1LL,  @"System keychain access is not allowed on this platform",  a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end