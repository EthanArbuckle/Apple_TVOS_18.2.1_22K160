@interface PBCFUserNotification
+ (id)_defaultLocalizationBundle;
+ (id)_localizedDefaultButtonTitle;
- (BOOL)isAlertTopMost;
- (BOOL)isLastTextField:(int64_t)a3;
- (BOOL)isSecureTextField:(int64_t)a3;
- (BOOL)noDefaultButton;
- (BOOL)shouldBehaveSuperModally;
- (BOOL)shouldDismissOnUnlock;
- (BSAtomicSignal)responseSignal;
- (NSArray)customButtonDefinitions;
- (NSArray)keyboardTypes;
- (NSArray)selectableItemTitles;
- (NSArray)textFieldEnteredValues;
- (NSArray)textFieldInitialValues;
- (NSArray)textFieldTitles;
- (NSString)PINCode;
- (NSString)PINCodeSubtitle;
- (NSString)PINCodeTitle;
- (NSString)PINCodeURL;
- (NSString)PINCodeURLSubtitle;
- (NSString)QRCodeSubtitle;
- (NSString)QRCodeTitle;
- (NSString)QRCodeURL;
- (NSString)accountName;
- (NSString)alertHeader;
- (NSString)alertMessage;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)defaultResponseLaunchBundleID;
- (NSString)dividerText;
- (NSString)notificationSource;
- (NSString)otherButtonTitle;
- (NSString)templateType;
- (NSURL)defaultResponseLaunchURL;
- (NSURL)iconURL;
- (PBCFUserNotification)initWithMessage:(id)a3 replyPort:(unsigned int)a4 requestFlags:(int)a5;
- (PBCFUserNotificationWaitViewSpec)waitViewSpec;
- (double)timeout;
- (id)description;
- (int)alternateButtonIndex;
- (int)defaultButtonIndex;
- (int)dialogDefaultButtonIndex;
- (int)otherButtonIndex;
- (int)replyFlags;
- (int)requestFlags;
- (int)token;
- (int64_t)_typeForCurrentTemplateKey;
- (int64_t)alternateButtonStyle;
- (int64_t)defaultButtonStyle;
- (int64_t)keyboardTypeForTextField:(int64_t)a3;
- (int64_t)notificationType;
- (int64_t)otherButtonStyle;
- (unint64_t)attemptNumber;
- (unsigned)replyPort;
- (void)_sendResponse:(unint64_t)a3 customButtonResponse:(int64_t)a4;
- (void)cancel;
- (void)didSelectButtonAtIndex:(int64_t)a3;
- (void)setTextFieldEnteredValues:(id)a3;
- (void)updateWithMessage:(id)a3 requestFlags:(int)a4;
@end

@implementation PBCFUserNotification

+ (id)_defaultLocalizationBundle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserNotificationCenter sharedInstance](&OBJC_CLASS___PBUserNotificationCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = objc_alloc(&OBJC_CLASS___BSCFBundle);
  id v7 = sub_1001C2EEC(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundlePath]);
  id v10 = [v6 initWithPath:v9];

  return v10;
}

+ (id)_localizedDefaultButtonTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _defaultLocalizationBundle]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"ButtonOK" value:0 table:0]);

  return v3;
}

- (PBCFUserNotification)initWithMessage:(id)a3 replyPort:(unsigned int)a4 requestFlags:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBCFUserNotification;
  v9 = -[PBCFUserNotification init](&v14, "init");
  id v10 = v9;
  if (v9)
  {
    v9->_replyPort = a4;
    v11 = objc_alloc_init(&OBJC_CLASS___BSAtomicSignal);
    responseSignal = v10->_responseSignal;
    v10->_responseSignal = v11;

    -[PBCFUserNotification updateWithMessage:requestFlags:](v10, "updateWithMessage:requestFlags:", v8, v5);
  }

  return v10;
}

- (void)updateWithMessage:(id)a3 requestFlags:(int)a4
{
  id v6 = a3;
  self->_requestFlags = a4;
  self->_token = sub_1000B6988(v6);
  self->_timeout = sub_1000B69C8(v6);
  id v7 = sub_1000B6A10(v6);
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  notificationSource = self->_notificationSource;
  self->_notificationSource = v8;

  self->_shouldBehaveSuperModally = sub_1000B6A38(v6);
  self->_shouldDismissOnUnlock = sub_1000B6A58(v6) ^ 1;
  id v10 = sub_1000B6A78(v6);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(v10);
  defaultResponseLaunchBundleID = self->_defaultResponseLaunchBundleID;
  self->_defaultResponseLaunchBundleID = v11;

  id v13 = sub_1000B6AA0(v6);
  objc_super v14 = (NSURL *)objc_claimAutoreleasedReturnValue(v13);
  defaultResponseLaunchURL = self->_defaultResponseLaunchURL;
  self->_defaultResponseLaunchURL = v14;

  id v16 = sub_1000B6D6C(v6);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue(v16);
  templateType = self->_templateType;
  self->_templateType = v17;

  v19 = objc_alloc(&OBJC_CLASS___PBCFUserNotificationWaitViewSpec);
  id v20 = sub_1000B6EFC(v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = -[PBCFUserNotificationWaitViewSpec initWithDictionary:](v19, "initWithDictionary:", v21);
  waitViewSpec = self->_waitViewSpec;
  self->_waitViewSpec = v22;

  id v24 = sub_1000B6B00(v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if (!v25 || (id v26 = [[BSCFBundle alloc] initWithPath:v25]) == 0)
  {
    id v27 = [(id)objc_opt_class(self) _defaultLocalizationBundle];
    id v26 = (id)objc_claimAutoreleasedReturnValue(v27);
  }

  id v28 = sub_1000B6B28(v6);
  v29 = (NSURL *)objc_claimAutoreleasedReturnValue(v28);
  iconURL = self->_iconURL;
  self->_iconURL = v29;

  id v31 = sub_1000B6F24(v6, v26);
  v32 = (NSString *)objc_claimAutoreleasedReturnValue(v31);
  alertHeader = self->_alertHeader;
  self->_alertHeader = v32;

  id v34 = sub_1000B6FB0(v6, v26);
  v35 = (NSString *)objc_claimAutoreleasedReturnValue(v34);
  alertMessage = self->_alertMessage;
  self->_alertMessage = v35;

  self->_alertTopMost = sub_1000B6BBC(v6);
  id v37 = sub_1000B71A0(v6, v26);
  v38 = (NSString *)objc_claimAutoreleasedReturnValue(v37);
  defaultButtonTitle = self->_defaultButtonTitle;
  self->_defaultButtonTitle = v38;

  id v40 = sub_1000B722C(v6, v26);
  v41 = (NSString *)objc_claimAutoreleasedReturnValue(v40);
  alternateButtonTitle = self->_alternateButtonTitle;
  self->_alternateButtonTitle = v41;

  id v43 = sub_1000B72B8(v6, v26);
  v44 = (NSString *)objc_claimAutoreleasedReturnValue(v43);
  otherButtonTitle = self->_otherButtonTitle;
  self->_otherButtonTitle = v44;

  id v46 = sub_1000B7344(v6, v26);
  v47 = (NSArray *)objc_claimAutoreleasedReturnValue(v46);
  selectableItemTitles = self->_selectableItemTitles;
  self->_selectableItemTitles = v47;

  id v49 = sub_1000B741C(v6, v26);
  v50 = (NSArray *)objc_claimAutoreleasedReturnValue(v49);
  textFieldTitles = self->_textFieldTitles;
  self->_textFieldTitles = v50;

  id v52 = sub_1000B74F4(v6, v26);
  v53 = (NSArray *)objc_claimAutoreleasedReturnValue(v52);
  textFieldInitialValues = self->_textFieldInitialValues;
  self->_textFieldInitialValues = v53;

  id v55 = sub_1000B6C9C(v6);
  v56 = (NSArray *)objc_claimAutoreleasedReturnValue(v55);
  keyboardTypes = self->_keyboardTypes;
  self->_keyboardTypes = v56;

  id v58 = sub_1000B6CC4(v6);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  v60 = v59;
  if (v59) {
    int v61 = [v59 intValue];
  }
  else {
    int v61 = -1;
  }
  *(void *)&self->_defaultButtonIndex = -1LL;
  self->_otherButtonIndex = -1;
  self->_noDefaultButton = sub_1000B696C(self->_requestFlags);
  unsigned __int8 v62 = -[PBCFUserNotification noDefaultButton](self, "noDefaultButton");
  if (-[NSString length](self->_alternateButtonTitle, "length")
    || (!-[NSString length](self->_otherButtonTitle, "length") ? (unsigned __int8 v63 = v62) : (unsigned __int8 v63 = 0), (v63 & 1) == 0))
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification selectableItemTitles](self, "selectableItemTitles"));
    int v65 = [v64 count];

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alternateButtonTitle](self, "alternateButtonTitle"));
    id v67 = [v66 length];

    if (v67)
    {
      int v68 = v65 + 1;
      self->_alternateButtonIndex = v65;
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification otherButtonTitle](self, "otherButtonTitle"));
      id v70 = [v69 length];

      if (!v70) {
        self->_dialogDefaultButtonIndex = -[PBCFUserNotification alternateButtonIndex](self, "alternateButtonIndex");
      }
      if (v61 == 1) {
        self->_dialogDefaultButtonIndex = -[PBCFUserNotification alternateButtonIndex](self, "alternateButtonIndex");
      }
    }

    else
    {
      int v68 = v65;
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification otherButtonTitle](self, "otherButtonTitle"));
    id v72 = [v71 length];

    if (v72) {
      self->_otherButtonIndex = v68++;
    }
    if (v61 == 2) {
      self->_dialogDefaultButtonIndex = -[PBCFUserNotification otherButtonIndex](self, "otherButtonIndex");
    }
    v73 = (NSString *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultButtonTitle](self, "defaultButtonTitle"));
    if (v73) {
      char v74 = 1;
    }
    else {
      char v74 = v62;
    }
    if ((v74 & 1) == 0)
    {
      id v75 = [(id)objc_opt_class(self) _localizedDefaultButtonTitle];
      v76 = (NSString *)objc_claimAutoreleasedReturnValue(v75);
      v77 = self->_defaultButtonTitle;
      self->_defaultButtonTitle = v76;

      v73 = self->_defaultButtonTitle;
    }

    if (-[NSString length](v73, "length"))
    {
      if (!-[NSArray count](self->_selectableItemTitles, "count"))
      {
        self->_defaultButtonIndex = v68;
        if (v61 <= 0) {
          self->_dialogDefaultButtonIndex = -[PBCFUserNotification defaultButtonIndex](self, "defaultButtonIndex");
        }
      }
    }
  }

  id v78 = sub_1000B6CEC(v6);
  v79 = (NSString *)objc_claimAutoreleasedReturnValue(v78);
  accountName = self->_accountName;
  self->_accountName = v79;

  self->_attemptNumber = (unint64_t)sub_1000B6D14(v6);
  id v81 = sub_1000B6D94(v6);
  v82 = (NSString *)objc_claimAutoreleasedReturnValue(v81);
  PINCodeTitle = self->_PINCodeTitle;
  self->_PINCodeTitle = v82;

  id v84 = sub_1000B6DBC(v6);
  v85 = (NSString *)objc_claimAutoreleasedReturnValue(v84);
  PINCodeURLSubtitle = self->_PINCodeURLSubtitle;
  self->_PINCodeURLSubtitle = v85;

  id v87 = sub_1000B6DE4(v6);
  v88 = (NSString *)objc_claimAutoreleasedReturnValue(v87);
  PINCodeURL = self->_PINCodeURL;
  self->_PINCodeURL = v88;

  id v90 = sub_1000B6E0C(v6);
  v91 = (NSString *)objc_claimAutoreleasedReturnValue(v90);
  PINCodeSubtitle = self->_PINCodeSubtitle;
  self->_PINCodeSubtitle = v91;

  id v93 = sub_1000B6E34(v6);
  v94 = (NSString *)objc_claimAutoreleasedReturnValue(v93);
  PINCode = self->_PINCode;
  self->_PINCode = v94;

  id v96 = sub_1000B6E5C(v6);
  v97 = (NSString *)objc_claimAutoreleasedReturnValue(v96);
  QRCodeTitle = self->_QRCodeTitle;
  self->_QRCodeTitle = v97;

  id v99 = sub_1000B6E84(v6);
  v100 = (NSString *)objc_claimAutoreleasedReturnValue(v99);
  QRCodeSubtitle = self->_QRCodeSubtitle;
  self->_QRCodeSubtitle = v100;

  id v102 = sub_1000B6EAC(v6);
  v103 = (NSString *)objc_claimAutoreleasedReturnValue(v102);
  QRCodeURL = self->_QRCodeURL;
  self->_QRCodeURL = v103;

  id v105 = sub_1000B6ED4(v6);
  v106 = (NSString *)objc_claimAutoreleasedReturnValue(v105);
  dividerText = self->_dividerText;
  self->_dividerText = v106;

  id v108 = sub_1000B75CC(v6, v26);
  v109 = (NSArray *)objc_claimAutoreleasedReturnValue(v108);
  customButtonDefinitions = self->_customButtonDefinitions;
  self->_customButtonDefinitions = v109;

  unsigned int v111 = sub_1000B6BDC(v6);
  int64_t v112 = 2LL * (v111 == 1);
  if (v111 == 2) {
    int64_t v112 = 1LL;
  }
  self->_defaultButtonStyle = v112;
  unsigned int v113 = sub_1000B6C1C(v6);
  int64_t v114 = 2LL * (v113 == 1);
  if (v113 == 2) {
    int64_t v114 = 1LL;
  }
  self->_alternateButtonStyle = v114;
  unsigned int v115 = sub_1000B6C5C(v6);
  int64_t v116 = 2LL * (v115 == 1);
  if (v115 == 2) {
    int64_t v116 = 1LL;
  }
  self->_otherButtonStyle = v116;
}

- (int64_t)notificationType
{
  int64_t result = -[PBCFUserNotification _typeForCurrentTemplateKey](self, "_typeForCurrentTemplateKey");
  if (result == 8)
  {
    int v4 = sub_1000B696C(self->_requestFlags);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alternateButtonTitle](self, "alternateButtonTitle"));
    if ([v5 length])
    {
      BOOL v6 = 1;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification otherButtonTitle](self, "otherButtonTitle"));
      if ([v7 length]) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = -[NSArray count](self->_customButtonDefinitions, "count") != 0;
      }
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification selectableItemTitles](self, "selectableItemTitles"));
    id v9 = [v8 count];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification textFieldTitles](self, "textFieldTitles"));
    if (v10)
    {
      return 1LL;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertMessage](self, "alertMessage"));
      id v12 = [v11 length];

      else {
        int64_t result = 3LL;
      }
      if ((unint64_t)v12 <= 0x1A4 && !v9)
      {
        if (((v6 | v4 ^ 1) & 1) != 0)
        {
          return 0LL;
        }

        else if (-[PBCFUserNotification shouldBehaveSuperModally](self, "shouldBehaveSuperModally"))
        {
          if (-[PBCFUserNotification shouldDismissOnUnlock](self, "shouldDismissOnUnlock")) {
            return 8LL;
          }
          else {
            return 4LL;
          }
        }

        else
        {
          return 8LL;
        }
      }
    }
  }

  return result;
}

- (BOOL)isSecureTextField:(int64_t)a3
{
  return sub_1000B6974(self->_requestFlags, a3);
}

- (int64_t)keyboardTypeForTextField:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification keyboardTypes](self, "keyboardTypes"));
  id v6 = [v5 count];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification keyboardTypes](self, "keyboardTypes"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:a3]);

  else {
    id v9 = 0LL;
  }

  return (int64_t)v9;
}

- (BOOL)isLastTextField:(int64_t)a3
{
  id v3 = (id)(a3 + 1);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification textFieldTitles](self, "textFieldTitles"));
  LOBYTE(v3) = v3 == [v4 count];

  return (char)v3;
}

- (void)didSelectButtonAtIndex:(int64_t)a3
{
  if (a3 < 0) {
    goto LABEL_21;
  }
  int64_t v4 = a3;
  if ((id)-[PBCFUserNotification notificationType](self, "notificationType") == (id)3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification selectableItemTitles](self, "selectableItemTitles"));
    id v6 = [v5 count];

    if ((uint64_t)v6 > v4)
    {
      uint64_t v7 = (int)((_DWORD)v4 << 24);
LABEL_20:
      int64_t v4 = -1LL;
      goto LABEL_22;
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification customButtonDefinitions](self, "customButtonDefinitions"));
  if ([v8 count])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification customButtonDefinitions](self, "customButtonDefinitions"));
    id v10 = [v9 count];
  }

  else
  {
  }

  if (-[PBCFUserNotification alternateButtonIndex](self, "alternateButtonIndex") < 0
    || -[PBCFUserNotification alternateButtonIndex](self, "alternateButtonIndex") != v4)
  {
    if ((-[PBCFUserNotification otherButtonIndex](self, "otherButtonIndex") & 0x80000000) == 0
      && -[PBCFUserNotification otherButtonIndex](self, "otherButtonIndex") == v4)
    {
      int64_t v4 = -1LL;
LABEL_15:
      uint64_t v7 = 2LL;
      goto LABEL_22;
    }

    if ((-[PBCFUserNotification defaultButtonIndex](self, "defaultButtonIndex") & 0x80000000) == 0)
    {
      if (-[PBCFUserNotification defaultButtonIndex](self, "defaultButtonIndex") == v4) {
        uint64_t v7 = 0LL;
      }
      else {
        uint64_t v7 = 3LL;
      }
      goto LABEL_20;
    }

- (void)_sendResponse:(unint64_t)a3 customButtonResponse:(int64_t)a4
{
  if ((-[BSAtomicSignal signal](self->_responseSignal, "signal") & 1) != 0)
  {
    if (a3) {
      goto LABEL_10;
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultResponseLaunchURL](self, "defaultResponseLaunchURL"));

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultResponseLaunchURL](self, "defaultResponseLaunchURL"));
      [v8 openURL:v9 options:&__NSDictionary0__struct completionHandler:0];
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultResponseLaunchBundleID](self, "defaultResponseLaunchBundleID"));

      if (!v12) {
        goto LABEL_10;
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultResponseLaunchBundleID](self, "defaultResponseLaunchBundleID"));
      [v8 openApplication:v9 withOptions:0 completion:0];
    }

LABEL_10:
    self->_replyFlags = a3;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification textFieldEnteredValues](self, "textFieldEnteredValues"));
    id v14 = [v13 count];

    v11 = 0LL;
    if (-[PBCFUserNotification replyFlags](self, "replyFlags") != 3)
    {
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification textFieldEnteredValues](self, "textFieldEnteredValues"));
        v11 = v15;
        if (v14 == (id)1)
        {
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 objectAtIndex:0]);

          v11 = (void *)v16;
        }
      }
    }

    if ((a4 & 0x8000000000000000LL) == 0 || v11)
    {
      v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v20 = v19;
      if (v11) {
        -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v11, kCFUserNotificationTextFieldValuesKey);
      }
      if ((a4 & 0x8000000000000000LL) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
        -[NSMutableDictionary setObject:forKey:]( v20,  "setObject:forKey:",  v21,  SBSUserNotificationButtonDefinitionResponseIndexKey);
      }

      Data = CFPropertyListCreateData(kCFAllocatorDefault, v20, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
      v17 = Data;
      if (Data) {
        mach_msg_size_t v18 = ((CFDataGetLength(Data) + 3) & 0xFFFFFFFC) + 28;
      }
      else {
        mach_msg_size_t v18 = 28;
      }
    }

    else
    {
      v17 = 0LL;
      mach_msg_size_t v18 = 28;
    }

    v23 = calloc(v18, 1uLL);
    if (v23)
    {
      id v24 = v23;
      _DWORD *v23 = 18;
      v23[1] = v18;
      v23[2] = -[PBCFUserNotification replyPort](self, "replyPort");
      v24[3] = 0;
      *(void *)(v24 + 5) = -[PBCFUserNotification replyFlags](self, "replyFlags");
      if (v17)
      {
        v26.length = CFDataGetLength(v17);
        v26.location = 0LL;
        CFDataGetBytes(v17, v26, (UInt8 *)v24 + 28);
      }

      if (mach_msg((mach_msg_header_t *)v24, 17, v18, 0, 0, 0x64u, 0)) {
        mach_msg_destroy((mach_msg_header_t *)v24);
      }
      self->_replyPort = 0;
      free(v24);
    }

    if (v17) {
      CFRelease(v17);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserNotificationCenter sharedInstance](&OBJC_CLASS___PBUserNotificationCenter, "sharedInstance"));
    [v25 _didHandleCFUserNotification:self];

    goto LABEL_34;
  }

  id v10 = sub_100084428();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
    sub_1002895F8((os_log_t)v11);
  }
LABEL_34:
}

- (void)cancel
{
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = objc_msgSend(v3, "appendInt:withName:", -[PBCFUserNotification token](self, "token"), @"token");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertHeader](self, "alertHeader"));
  [v3 appendString:v5 withName:@"alertHeader"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertMessage](self, "alertMessage"));
  [v3 appendString:v6 withName:@"alertMessage"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification notificationSource](self, "notificationSource"));
  [v3 appendString:v7 withName:@"notificationSource"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return v8;
}

- (int64_t)_typeForCurrentTemplateKey
{
  if (-[NSString isEqualToString:](self->_templateType, "isEqualToString:", PBSPSD2UserNotificationTemplateType)) {
    return 5LL;
  }
  if (-[NSString isEqualToString:]( self->_templateType,  "isEqualToString:",  PBSUnbiasedAlertUserNotificationTemplateType))
  {
    return 6LL;
  }

  if (-[NSString isEqualToString:]( self->_templateType,  "isEqualToString:",  PBSUserNotificationExternalLinkTemplateType))
  {
    return 7LL;
  }

  return 8LL;
}

- (NSString)PINCodeTitle
{
  return self->_PINCodeTitle;
}

- (NSString)PINCodeURLSubtitle
{
  return self->_PINCodeURLSubtitle;
}

- (NSString)PINCodeURL
{
  return self->_PINCodeURL;
}

- (NSString)PINCodeSubtitle
{
  return self->_PINCodeSubtitle;
}

- (NSString)PINCode
{
  return self->_PINCode;
}

- (NSString)QRCodeSubtitle
{
  return self->_QRCodeSubtitle;
}

- (NSString)QRCodeURL
{
  return self->_QRCodeURL;
}

- (NSString)QRCodeTitle
{
  return self->_QRCodeTitle;
}

- (NSString)dividerText
{
  return self->_dividerText;
}

- (NSString)notificationSource
{
  return self->_notificationSource;
}

- (int)token
{
  return self->_token;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (NSString)alertHeader
{
  return self->_alertHeader;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (BOOL)isAlertTopMost
{
  return self->_alertTopMost;
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (NSString)otherButtonTitle
{
  return self->_otherButtonTitle;
}

- (int)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (int)alternateButtonIndex
{
  return self->_alternateButtonIndex;
}

- (int)otherButtonIndex
{
  return self->_otherButtonIndex;
}

- (int)dialogDefaultButtonIndex
{
  return self->_dialogDefaultButtonIndex;
}

- (NSArray)selectableItemTitles
{
  return self->_selectableItemTitles;
}

- (BOOL)noDefaultButton
{
  return self->_noDefaultButton;
}

- (int64_t)defaultButtonStyle
{
  return self->_defaultButtonStyle;
}

- (int64_t)alternateButtonStyle
{
  return self->_alternateButtonStyle;
}

- (int64_t)otherButtonStyle
{
  return self->_otherButtonStyle;
}

- (NSArray)textFieldTitles
{
  return self->_textFieldTitles;
}

- (NSArray)textFieldInitialValues
{
  return self->_textFieldInitialValues;
}

- (NSArray)textFieldEnteredValues
{
  return self->_textFieldEnteredValues;
}

- (void)setTextFieldEnteredValues:(id)a3
{
}

- (NSString)defaultResponseLaunchBundleID
{
  return self->_defaultResponseLaunchBundleID;
}

- (NSURL)defaultResponseLaunchURL
{
  return self->_defaultResponseLaunchURL;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (unint64_t)attemptNumber
{
  return self->_attemptNumber;
}

- (PBCFUserNotificationWaitViewSpec)waitViewSpec
{
  return self->_waitViewSpec;
}

- (NSArray)customButtonDefinitions
{
  return self->_customButtonDefinitions;
}

- (unsigned)replyPort
{
  return self->_replyPort;
}

- (int)requestFlags
{
  return self->_requestFlags;
}

- (int)replyFlags
{
  return self->_replyFlags;
}

- (BSAtomicSignal)responseSignal
{
  return self->_responseSignal;
}

- (BOOL)shouldBehaveSuperModally
{
  return self->_shouldBehaveSuperModally;
}

- (BOOL)shouldDismissOnUnlock
{
  return self->_shouldDismissOnUnlock;
}

- (NSArray)keyboardTypes
{
  return self->_keyboardTypes;
}

- (NSString)templateType
{
  return self->_templateType;
}

- (void).cxx_destruct
{
}

@end