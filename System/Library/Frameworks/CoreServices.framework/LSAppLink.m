@interface LSAppLink
+ (BOOL)URLComponentsAreValidForAppLinks:(id)a3 error:(id *)a4;
+ (BOOL)_URLIsValidForAppLinks:(id)a3 error:(id *)a4;
+ (BOOL)areEnabledByDefault;
+ (BOOL)auditTokenHasReadAccess:(id *)a3;
+ (BOOL)auditTokenHasWriteAccess:(id *)a3;
+ (BOOL)currentProcessHasReadAccess;
+ (BOOL)currentProcessHasWriteAccess;
+ (BOOL)removeAllSettingsReturningError:(id *)a3;
+ (BOOL)setSettingsSwitchState:(int64_t)a3 forApplicationIdentifier:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)_appLinkWithURL:(id)a3 applicationRecord:(id)a4 plugInClass:(Class)a5;
+ (id)_appLinksWithState:(id)a3 context:(LSContext *)a4 limit:(unint64_t)a5 URLComponents:(id)a6 error:(id *)a7;
+ (id)_appLinksWithState:(id)a3 context:(LSContext *)a4 limit:(unint64_t)a5 error:(id *)a6;
+ (id)_dispatchQueue;
+ (id)appLinksWithURL:(id)a3 limit:(unint64_t)a4 error:(id *)a5;
+ (id)appLinksWithURL:(id)a3 limit:(unint64_t)a4 includeLinksForCurrentApplication:(BOOL)a5 error:(id *)a6;
+ (int64_t)settingsSwitchStateForApplicationIdentifier:(id)a3;
+ (void)_openAppLink:(id)a3 state:(id)a4 completionHandler:(id)a5;
+ (void)_openWithAppLink:(id)a3 state:(id)a4 completionHandler:(id)a5;
+ (void)afterAppLinksBecomeAvailableForURL:(id)a3 limit:(unint64_t)a4 performBlock:(id)a5;
+ (void)getAppLinkWithURL:(id)a3 completionHandler:(id)a4;
+ (void)getAppLinksWithURL:(id)a3 completionHandler:(id)a4;
+ (void)openWithURL:(id)a3 completionHandler:(id)a4;
+ (void)openWithURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (BOOL)isAlwaysEnabled;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeSettingsReturningError:(id *)a3;
- (BOOL)setBrowserSettings:(id)a3 error:(id *)a4;
- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4;
- (LSAppLink)initWithCoder:(id)a3;
- (LSApplicationProxy)targetApplicationProxy;
- (LSApplicationRecord)targetApplicationRecord;
- (NSDictionary)browserSettings;
- (NSURL)URL;
- (id)_userActivityWithState:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (int64_t)openStrategy;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)openInWebBrowser:(BOOL)a3 setAppropriateOpenStrategyAndWebBrowserState:(id)a4 completionHandler:(id)a5;
- (void)openInWebBrowser:(BOOL)a3 setOpenStrategy:(int64_t)a4 webBrowserState:(id)a5 completionHandler:(id)a6;
- (void)openInWebBrowser:(BOOL)a3 setOpenStrategy:(int64_t)a4 webBrowserState:(id)a5 configuration:(id)a6 completionHandler:(id)a7;
- (void)openWithCompletionHandler:(id)a3;
- (void)openWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setBrowserSettings:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOpenStrategy:(int64_t)a3;
- (void)setTargetApplicationRecord:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation LSAppLink

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)appLinksWithURL:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)appLinksWithURL:(id)a3 limit:(unint64_t)a4 includeLinksForCurrentApplication:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  if (v11)
  {
    if (a4) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 77, @"Invalid parameter not satisfying: %@", @"aURL != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 78, @"Invalid parameter not satisfying: %@", @"limit > 0" object file lineNumber description];

LABEL_3:
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    [MEMORY[0x1896077D8] currentHandler];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 handleFailureInMethod:a2 object:a1 file:@"LSAppLink.mm" lineNumber:79 description:@"Cannot call this method from within the Launch Services daemon."];
  }

  v12 = objc_alloc_init(&OBJC_CLASS____LSAppLinkOpenState);
  -[_LSAppLinkOpenState setURL:](v12, "setURL:", v11);
  -[_LSAppLinkOpenState setAuditToken:](v12, "setAuditToken:", _LSGetAuditTokenForSelf());
  -[_LSAppLinkOpenState setIncludeLinksForCallingApplication:](v12, "setIncludeLinksForCallingApplication:", v7);
  id v20 = 0LL;
  [a1 _appLinksWithState:v12 context:0 limit:a4 error:&v20];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v20;
  v15 = v14;
  if (a6 && !v13) {
    *a6 = v14;
  }

  return v13;
}

+ (void)getAppLinkWithURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 101, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }

  [(id)objc_opt_class() _dispatchQueue];
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__LSAppLink_getAppLinkWithURL_completionHandler___block_invoke;
  block[3] = &unk_189D73E00;
  id v15 = v8;
  id v16 = a1;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __49__LSAppLink_getAppLinkWithURL_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[6];
  uint64_t v3 = a1[4];
  id v8 = 0LL;
  [v2 appLinksWithURL:v3 limit:1 error:&v8];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v8;
  uint64_t v6 = a1[5];
  [v4 firstObject];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
}

+ (void)getAppLinksWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(id)objc_opt_class() _dispatchQueue];
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__LSAppLink_getAppLinksWithURL_completionHandler___block_invoke;
  block[3] = &unk_189D73E00;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__LSAppLink_getAppLinksWithURL_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[6];
  uint64_t v3 = a1[4];
  id v6 = 0LL;
  [v2 appLinksWithURL:v3 limit:-1 error:&v6];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v6;
  (*(void (**)(void))(a1[5] + 16LL))();
}

+ (void)afterAppLinksBecomeAvailableForURL:(id)a3 limit:(unint64_t)a4 performBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 121, @"Invalid parameter not satisfying: %@", @"aURL != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 122, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

LABEL_3:
  id v16 = 0LL;
  char v12 = [a1 _URLIsValidForAppLinks:v9 error:&v16];
  id v13 = v16;
  if ((v12 & 1) != 0) {
    +[_LSSharedWebCredentialsAppLink afterAppLinksBecomeAvailableForURL:limit:performBlock:]( &OBJC_CLASS____LSSharedWebCredentialsAppLink,  "afterAppLinksBecomeAvailableForURL:limit:performBlock:",  v9,  a4,  v11);
  }
  else {
    ((void (**)(void, void, id))v11)[2](v11, 0LL, v13);
  }
}

+ (BOOL)areEnabledByDefault
{
  v2 = (void *)CFPreferencesCopyValue( @"LSAppLinksEnabledByDefault",  (CFStringRef)*MEMORY[0x189605170],  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)isAlwaysEnabled
{
  return 0;
}

- (BOOL)isEnabled
{
  return [(id)objc_opt_class() areEnabledByDefault];
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -4LL, (uint64_t)"-[LSAppLink setEnabled:error:]", 169LL, 0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (unint64_t)hash
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  -[LSAppLink targetApplicationRecord](self, "targetApplicationRecord");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LSAppLink *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      -[LSAppLink URL](v5, "URL");
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LSAppLink URL](self, "URL");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v6 isEqual:v7])
      {
        -[LSAppLink targetApplicationRecord](v5, "targetApplicationRecord");
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[LSAppLink targetApplicationRecord](self, "targetApplicationRecord");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        char v10 = [v8 isEqual:v9];
      }

      else
      {
        char v10 = 0;
      }
    }

    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)debugDescription
{
  char v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  -[LSAppLink URL](self, "URL");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSAppLink targetApplicationRecord](self, "targetApplicationRecord");
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 bundleIdentifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p> { url = %@, app = %@ }", v4, self, v5, v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  -[LSAppLink URL](self, "URL");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v4 forKey:@"URL"];

  -[LSAppLink targetApplicationRecord](self, "targetApplicationRecord");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v5 forKey:@"targetApplicationRecord"];

  [v6 encodeObject:self->_targetApplicationProxy forKey:@"targetApplicationProxy"];
}

- (LSAppLink)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[LSAppLink init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"URL");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSAppLink setURL:](v5, "setURL:", v6);

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"targetApplicationRecord");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSAppLink setTargetApplicationRecord:](v5, "setTargetApplicationRecord:", v7);

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"targetApplicationProxy");
    targetApplicationProxy = v5->_targetApplicationProxy;
    v5->_targetApplicationProxy = (LSApplicationProxy *)v8;

    -[LSAppLink URL](v5, "URL");
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (-[LSAppLink targetApplicationRecord](v5, "targetApplicationRecord"),
          id v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          !v11))
    {

      id v5 = 0LL;
    }
  }

  return v5;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setURL:(id)a3
{
}

- (LSApplicationProxy)targetApplicationProxy
{
  return (LSApplicationProxy *)objc_getProperty(self, a2, 16LL, 1);
}

- (LSApplicationRecord)targetApplicationRecord
{
  return (LSApplicationRecord *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTargetApplicationRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)currentProcessHasReadAccess
{
  char v3 = (_OWORD *)_LSGetAuditTokenForSelf();
  if (v3)
  {
    __int128 v4 = v3[1];
    v6[0] = *v3;
    v6[1] = v4;
    LOBYTE(v3) = [a1 auditTokenHasReadAccess:v6];
  }

  return (char)v3;
}

+ (BOOL)auditTokenHasReadAccess:(id *)a3
{
  int MayMapDatabase = _LSAuditTokenMayMapDatabase((uint64_t)a3);
  if (MayMapDatabase)
  {
    id v5 = (void *)_LSSWCServiceDetailsClass();
    __int128 v6 = *(_OWORD *)&a3->var0[4];
    v8[0] = *(_OWORD *)a3->var0;
    v8[1] = v6;
    LOBYTE(MayMapDatabase) = [v5 auditTokenHasReadAccess:v8];
  }

  return MayMapDatabase;
}

+ (BOOL)currentProcessHasWriteAccess
{
  char v3 = (_OWORD *)_LSGetAuditTokenForSelf();
  if (v3)
  {
    __int128 v4 = v3[1];
    v6[0] = *v3;
    v6[1] = v4;
    LOBYTE(v3) = [a1 auditTokenHasWriteAccess:v6];
  }

  return (char)v3;
}

+ (BOOL)auditTokenHasWriteAccess:(id *)a3
{
  __int128 v4 = (void *)_LSSWCServiceDetailsClass();
  __int128 v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return [v4 auditTokenHasWriteAccess:v7];
}

+ (int64_t)settingsSwitchStateForApplicationIdentifier:(id)a3
{
  return +[_LSSharedWebCredentialsAppLink settingsSwitchStateForApplicationIdentifier:]( &OBJC_CLASS____LSSharedWebCredentialsAppLink,  "settingsSwitchStateForApplicationIdentifier:",  a3);
}

+ (BOOL)setSettingsSwitchState:(int64_t)a3 forApplicationIdentifier:(id)a4 error:(id *)a5
{
  return +[_LSSharedWebCredentialsAppLink setSettingsSwitchState:forApplicationIdentifier:error:]( &OBJC_CLASS____LSSharedWebCredentialsAppLink,  "setSettingsSwitchState:forApplicationIdentifier:error:",  a3,  a4,  a5);
}

- (void)openWithCompletionHandler:(id)a3
{
}

+ (void)openWithURL:(id)a3 completionHandler:(id)a4
{
}

- (void)openWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    [MEMORY[0x1896077D8] currentHandler];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2 object:self file:@"LSAppLink.mm" lineNumber:336 description:@"Cannot call this method from within the Launch Services daemon."];
  }

  [(id)objc_opt_class() _dispatchQueue];
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__LSAppLink_Open__openWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_189D72970;
  void block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __59__LSAppLink_Open__openWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  char v3 = objc_alloc_init(&OBJC_CLASS____LSAppLinkOpenState);
  [*(id *)(a1 + 32) URL];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSAppLinkOpenState setURL:](v3, "setURL:", v2);

  -[_LSAppLinkOpenState setOpenConfiguration:](v3, "setOpenConfiguration:", *(void *)(a1 + 40));
  [(id)objc_opt_class() _openWithAppLink:*(void *)(a1 + 32) state:v3 completionHandler:*(void *)(a1 + 48)];
}

+ (void)openWithURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2 object:a1 file:@"LSAppLink.mm" lineNumber:361 description:@"Cannot call this method from within the Launch Services daemon."];
  }

  [a1 _dispatchQueue];
  char v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __63__LSAppLink_Open__openWithURL_configuration_completionHandler___block_invoke;
  v17[3] = &unk_189D73E28;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v21 = a1;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v17);
}

void __63__LSAppLink_Open__openWithURL_configuration_completionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS____LSAppLinkOpenState);
  -[_LSAppLinkOpenState setURL:](v2, "setURL:", *(void *)(a1 + 32));
  -[_LSAppLinkOpenState setOpenConfiguration:](v2, "setOpenConfiguration:", *(void *)(a1 + 40));
  [*(id *)(a1 + 56) _openWithAppLink:0 state:v2 completionHandler:*(void *)(a1 + 48)];
}

- (NSDictionary)browserSettings
{
  return (NSDictionary *)MEMORY[0x189604A60];
}

- (void)setBrowserSettings:(id)a3
{
}

- (BOOL)setBrowserSettings:(id)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSAppLink(BrowserSettings) setBrowserSettings:error:]",  398LL,  0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)removeSettingsReturningError:(id *)a3
{
  if (a3)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[LSAppLink(BrowserSettings) removeSettingsReturningError:]",  404LL,  0LL);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

+ (BOOL)removeAllSettingsReturningError:(id *)a3
{
  return +[_LSSharedWebCredentialsAppLink removeAllSettingsReturningError:]( &OBJC_CLASS____LSSharedWebCredentialsAppLink,  "removeAllSettingsReturningError:",  a3);
}

- (int64_t)openStrategy
{
  if (-[LSAppLink isEnabled](self, "isEnabled")) {
    return 2LL;
  }
  else {
    return 0LL;
  }
}

- (void)setOpenStrategy:(int64_t)a3
{
  -[LSAppLink setEnabled:](self, "setEnabled:", a3 != 0);
}

- (void)openInWebBrowser:(BOOL)a3 setAppropriateOpenStrategyAndWebBrowserState:(id)a4 completionHandler:(id)a5
{
}

- (void)openInWebBrowser:(BOOL)a3 setOpenStrategy:(int64_t)a4 webBrowserState:(id)a5 completionHandler:(id)a6
{
}

- (void)openInWebBrowser:(BOOL)a3 setOpenStrategy:(int64_t)a4 webBrowserState:(id)a5 configuration:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)MEMORY[0x186E2A7B8]();
  MEMORY[0x186E2AFD4]();
  uint64_t v16 = MEMORY[0x1895F87A8];
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke;
  v29[3] = &unk_189D725B8;
  id v17 = v15;
  id v30 = v17;
  id v18 = (void *)MEMORY[0x186E2A7B8](v29);

  [(id)objc_opt_class() _dispatchQueue];
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = v16;
  block[1] = 3221225472LL;
  block[2] = __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke_2;
  block[3] = &unk_189D73E50;
  id v26 = v18;
  int64_t v27 = a4;
  void block[4] = self;
  id v24 = v12;
  BOOL v28 = a3;
  id v25 = v13;
  id v20 = v18;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v19, block);
}

void __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v6 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
  MEMORY[0x186E2AFE0](v5);
}

void __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke_2( uint64_t a1)
{
  v13[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) setOpenStrategy:*(void *)(a1 + 64)];
  v2 = objc_alloc_init(&OBJC_CLASS____LSAppLinkOpenState);
  [*(id *)(a1 + 32) URL];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSAppLinkOpenState setURL:](v2, "setURL:", v3);

  -[_LSAppLinkOpenState setBrowserState:](v2, "setBrowserState:", *(void *)(a1 + 40));
  -[_LSAppLinkOpenState setOpenConfiguration:](v2, "setOpenConfiguration:", *(void *)(a1 + 48));
  if (*(_BYTE *)(a1 + 72))
  {
    id v7 = (void (*)(void, void))MEMORY[0x1895F87A8];
    uint64_t v8 = 3221225472LL;
    id v9 = __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke_3;
    id v10 = &unk_189D72590;
    id v11 = *(id *)(a1 + 56);
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, &v7);
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) URL];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = @"_LSAppLinkOpenStateLaunchOptionKey";
    v13[0] = v2;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v4,  "performOpenOperationWithURL:fileHandle:bundleIdentifier:documentIdentifier:isContentManaged:sourceAuditToken:userI nfo:options:delegate:completionHandler:",  v5,  0,  @"com.apple.mobilesafari",  0,  0,  0,  0,  v6,  0,  *(void *)(a1 + 56),  v7,  v8,  v9,  v10);
  }

  else
  {
    [(id)objc_opt_class() _openWithAppLink:*(void *)(a1 + 32) state:v2 completionHandler:*(void *)(a1 + 56)];
  }
}

uint64_t __108__LSAppLink_OpenStrategy__openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

+ (id)_dispatchQueue
{
  if (+[LSAppLink(Internal) _dispatchQueue]::once != -1) {
    dispatch_once(&+[LSAppLink(Internal) _dispatchQueue]::once, &__block_literal_global_7);
  }
  return (id)+[LSAppLink(Internal) _dispatchQueue]::result;
}

void __37__LSAppLink_Internal___dispatchQueue__block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.launchservices.applinks", v2);
  v1 = (void *)+[LSAppLink(Internal) _dispatchQueue]::result;
  +[LSAppLink(Internal) _dispatchQueue]::result = (uint64_t)v0;
}

+ (BOOL)_URLIsValidForAppLinks:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x189607A50]) initWithURL:v6 resolvingAgainstBaseURL:1];
  LOBYTE(a4) = [a1 URLComponentsAreValidForAppLinks:v7 error:a4];

  return (char)a4;
}

+ (id)_appLinksWithState:(id)a3 context:(LSContext *)a4 limit:(unint64_t)a5 error:(id *)a6
{
  v27[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  [v10 URL];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || (objc_opt_class(), (v10 == 0LL) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    uint64_t v26 = *MEMORY[0x189607490];
    v27[0] = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[LSAppLink(Internal) _appLinksWithState:context:limit:error:]",  691LL,  v12);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = 0LL;
  }

  else
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x189607A50]) initWithURL:v11 resolvingAgainstBaseURL:1];
    id v25 = 0LL;
    int v13 = [a1 URLComponentsAreValidForAppLinks:v12 error:&v25];
    id v14 = v25;
    id v15 = v14;
    if (v13)
    {
      [v12 scheme];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 lowercaseString];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setScheme:v17];

      [v12 host];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 lowercaseString];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setHost:v19];

      id v24 = 0LL;
      [a1 _appLinksWithState:v10 context:a4 limit:a5 URLComponents:v12 error:&v24];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v21 = v24;
    }

    else
    {
      id v20 = 0LL;
      id v21 = v14;
    }

    id v22 = v21;
  }

  if (a6 && !v20) {
    *a6 = v22;
  }

  return v20;
}

+ (id)_appLinkWithURL:(id)a3 applicationRecord:(id)a4 plugInClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 705, @"Invalid parameter not satisfying: %@", @"aURL != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 706, @"Invalid parameter not satisfying: %@", @"appRecord != nil" object file lineNumber description];

LABEL_3:
  id v11 = objc_alloc_init((Class)a1);
  id v12 = v11;
  if (v11)
  {
    [v11 setURL:v8];
    [v12 setTargetApplicationRecord:v10];
    uint64_t v13 = [v10 compatibilityObject];
    id v14 = (void *)v12[2];
    v12[2] = v13;
  }

  return v12;
}

+ (void)_openWithAppLink:(id)a3 state:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v9 = (uint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  if (!(v9 | v10))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 725, @"Invalid parameter not satisfying: %@", @"appLink != nil || openState != nil" object file lineNumber description];
  }

  if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  {
    uint64_t v13 = &__block_literal_global_201;
    if (v11) {
      uint64_t v13 = v11;
    }
    v28[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v28[1] = (void (*)(void, void))3221225472LL;
    v28[2] = (void (*)(void, void))__64__LSAppLink_Internal___openWithAppLink_state_completionHandler___block_invoke_2;
    v28[3] = (void (*)(void, void))&unk_189D72590;
    id v11 = v13;
    id v29 = v11;
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, v28);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 openAppLink:v9 state:v10 completionHandler:v11];

    id v12 = v29;
    goto LABEL_12;
  }

  if (v10)
  {
    if (v9)
    {
      id v12 = 0LL;
      goto LABEL_7;
    }

    id v27 = 0LL;
    [a1 _appLinksWithState:v10 context:0 limit:1 error:&v27];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v27;
    if (v16)
    {
      if ([v16 count])
      {
        uint64_t v9 = [v16 firstObject];

        if (v9)
        {
LABEL_7:
          if ([(id)v9 isEnabled])
          {
LABEL_8:
            [a1 _openAppLink:v9 state:v10 completionHandler:v11];
            goto LABEL_12;
          }

          [(id)v10 openConfiguration];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          int v18 = [v17 ignoreAppLinkEnabledProperty];

          if (v18)
          {
            uint64_t v19 = [(id)v10 auditToken];
            id v20 = (_OWORD *)v19;
            if (v19)
            {
              if (_LSCheckEntitlementForAuditToken(v19, @"com.apple.private.canIgnoreAppLinkEnabledProperty")) {
                goto LABEL_8;
              }
              if (_LSCheckEntitlementForAuditToken( (uint64_t)v20,  @"com.apple.private.canIgnoreAppLinkOpenStrategy"))
              {
                if ([(id)__LSDefaultsGetSharedInstance() isAppleInternal])
                {
                  _LSDefaultLog();
                  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  {
                    int v22 = _LSGetPIDFromToken(v20);
                    CFURLRef v23 = _LSCopyExecutableURLForAuditToken();
                    +[LSAppLink(Internal) _openWithAppLink:state:completionHandler:].cold.1(v22, v23, buf, v21);
                  }
                }

                goto LABEL_8;
              }
            }
          }

          if (v11)
          {
            _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -912LL,  (uint64_t)"+[LSAppLink(Internal) _openWithAppLink:state:completionHandler:]",  795LL,  0LL);
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v24);
          }

          goto LABEL_12;
        }

uint64_t __64__LSAppLink_Internal___openWithAppLink_state_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

+ (void)_openAppLink:(id)a3 state:(id)a4 completionHandler:(id)a5
{
  v35[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 817, @"Invalid parameter not satisfying: %@", @"appLink != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 handleFailureInMethod:a2, a1, @"LSAppLink.mm", 818, @"Invalid parameter not satisfying: %@", @"openState != nil" object file lineNumber description];

LABEL_3:
  [v9 targetApplicationRecord];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v12 isSystemPlaceholder])
  {
    v32[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v32[1] = (void (*)(void, void))3221225472LL;
    v32[2] = (void (*)(void, void))__60__LSAppLink_Internal___openAppLink_state_completionHandler___block_invoke;
    v32[3] = (void (*)(void, void))&unk_189D72590;
    id v13 = v11;
    id v33 = v13;
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, v32);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 bundleIdentifier];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 URL];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 failedToOpenApplication:v15 withURL:v16 completionHandler:v13];

    id v17 = v33;
LABEL_18:

    goto LABEL_19;
  }

  [v10 XPCConnection];
  int v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    id v31 = 0LL;
    [v9 _userActivityWithState:v10 error:&v31];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = v31;
    id v21 = v20;
    if (v19)
    {
      id v30 = v20;
      _LSGetDataForUserActivity(v19, &v30);
      int v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v30;

      if (v22)
      {
        [v19 _uniqueIdentifier];
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 activityType];
        CFURLRef v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 bundleIdentifier];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 XPCConnection];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        _LSServer_OpenUserActivity(v29, v22, v23, 1, v24, v9, v10, 0LL, v25, v11);
      }

      else if (v11)
      {
        (*((void (**)(id, void, id))v11 + 2))(v11, 0LL, v17);
      }
    }

    else
    {
      if (v11) {
        (*((void (**)(id, void, id))v11 + 2))(v11, 0LL, v20);
      }
      id v17 = v21;
    }

    goto LABEL_18;
  }

  if (v11)
  {
    uint64_t v34 = *MEMORY[0x189607490];
    v35[0] = @"openState.XPCConnection";
    [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[LSAppLink(Internal) _openAppLink:state:completionHandler:]",  842LL,  v17);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v26);

    goto LABEL_18;
  }

uint64_t __60__LSAppLink_Internal___openAppLink_state_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

+ (BOOL)URLComponentsAreValidForAppLinks:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  +[_LSAppLinkPlugIn plugInClasses](&OBJC_CLASS____LSAppLinkPlugIn, "plugInClasses", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) canHandleURLComponents:v5])
        {
          BOOL v12 = 1;
          goto LABEL_16;
        }
      }

      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v10 = [v5 URL];
  id v6 = (void *)v10;
  if (v10)
  {
    if (a4)
    {
      uint64_t v18 = *MEMORY[0x189607748];
      uint64_t v19 = v10;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607740],  -1002LL,  (uint64_t)"+[LSAppLink(Private) URLComponentsAreValidForAppLinks:error:]",  920LL,  v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_15;
  }

  if (!a4)
  {
LABEL_15:
    BOOL v12 = 0;
    goto LABEL_16;
  }

  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607740],  -1002LL,  (uint64_t)"+[LSAppLink(Private) URLComponentsAreValidForAppLinks:error:]",  922LL,  0LL);
  BOOL v12 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v12;
}

+ (id)_appLinksWithState:(id)a3 context:(LSContext *)a4 limit:(unint64_t)a5 URLComponents:(id)a6 error:(id *)a7
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v24 = a3;
  id v9 = a6;
  id v25 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  +[_LSAppLinkPlugIn plugInClasses](&OBJC_CLASS____LSAppLinkPlugIn, "plugInClasses");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    BOOL v12 = 0LL;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(objc_class **)(*((void *)&v27 + 1) + 8 * i);
        if (-[objc_class canHandleURLComponents:](v15, "canHandleURLComponents:", v9))
        {
          id v16 = objc_alloc_init(v15);
          if (v16)
          {
            __int128 v17 = (void *)[v9 copy];
            [v16 setURLComponents:v17];

            [v16 setLimit:a5];
            [v16 setState:v24];
            id v26 = v12;
            [v16 appLinksWithContext:a4 error:&v26];
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            id v19 = v26;

            if (!v18
              || ([v25 addObjectsFromArray:v18],
                  BOOL v20 = [v25 count] < a5,
                  v18,
                  !v20))
            {

              BOOL v12 = v19;
              goto LABEL_16;
            }

            BOOL v12 = v19;
          }
        }

        else
        {
          id v16 = 0LL;
        }
      }

      uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }

- (id)_userActivityWithState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x189607B10]);
  uint64_t v8 = (void *)[v7 initWithActivityType:*MEMORY[0x1896077B8]];
  if (v8)
  {
    -[LSAppLink URL](self, "URL");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setWebpageURL:v9];

    [v6 openConfiguration];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 referrerURL];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setReferrerURL:v11];

    if ((objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v8, "set_universalLink:", 1);
    }
  }

  else if (a4)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -41LL,  (uint64_t)"-[LSAppLink(Private) _userActivityWithState:error:]",  1011LL,  0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end