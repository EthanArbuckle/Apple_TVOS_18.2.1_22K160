@interface PDUserNotification
+ (BOOL)allowReinsertionAfterDismissal;
+ (BOOL)supportsCoalescing;
+ (BOOL)supportsSecureCoding;
+ (id)applicationMessageIconForFeature:(unint64_t)a3;
- (BOOL)allowPresentationOverPass;
- (BOOL)applicationMessageBadge;
- (BOOL)isActive;
- (BOOL)isCashFamilyNotification;
- (BOOL)isServiceNotification;
- (BOOL)isSuppressed;
- (BOOL)isValid;
- (BOOL)needsNotificationSettings;
- (BOOL)playsSound;
- (BOOL)preventAutomaticDismissal;
- (BOOL)reissueBannerOnUpdate;
- (NSDate)date;
- (NSDictionary)customActionQueryParameters;
- (NSString)accountIdentifier;
- (NSString)customActionRoute;
- (NSString)customActionTitle;
- (NSString)customActionURLString;
- (NSString)customActionVerb;
- (NSString)notificationIdentifier;
- (NSString)passUniqueIdentifier;
- (PDUserNotification)initWithCoder:(id)a3;
- (PDUserNotification)initWithNotificationIdentifier:(id)a3 forAccountIdentifier:(id)a4;
- (PDUserNotification)initWithNotificationIdentifier:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PKApplicationMessageContent)applicationMessageContent;
- (id)_payLaterApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_payLaterApplicationMessageGroupDescriptor;
- (id)actionURL;
- (id)description;
- (id)notificationContentWithDataSource:(id)a3;
- (int64_t)assetType;
- (unint64_t)coalesceWithExistingUserNotification:(id)a3;
- (unint64_t)familyNotificationType;
- (unint64_t)insertionRequirements;
- (unint64_t)notificationType;
- (unint64_t)suppressionBehavior;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAllowPresentationOverPass:(BOOL)a3;
- (void)setApplicationMessageBadge:(BOOL)a3;
- (void)setApplicationMessageContent:(id)a3;
- (void)setAssetType:(int64_t)a3;
- (void)setCustomActionQueryParameters:(id)a3;
- (void)setCustomActionRoute:(id)a3;
- (void)setCustomActionTitle:(id)a3;
- (void)setCustomActionURLString:(id)a3;
- (void)setCustomActionVerb:(id)a3;
- (void)setDate:(id)a3;
- (void)setFamilyNotificationType:(unint64_t)a3;
- (void)setInsertionRequirements:(unint64_t)a3;
- (void)setIsServiceNotification:(BOOL)a3;
- (void)setNotificationIdentifier:(id)a3;
- (void)setPlaysSound:(BOOL)a3;
- (void)setPreventAutomaticDismissal:(BOOL)a3;
- (void)setReissueBannerOnUpdate:(BOOL)a3;
- (void)setSuppressed:(BOOL)a3;
- (void)setSuppressionBehavior:(unint64_t)a3;
- (void)updatePassNameForNotificationContent:(id)a3 dataSource:(id)a4;
@end

@implementation PDUserNotification

- (PDUserNotification)initWithNotificationIdentifier:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDUserNotification;
  v9 = -[PDUserNotification init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationIdentifier, a3);
    v11 = (NSString *)[v8 copy];
    passUniqueIdentifier = v10->_passUniqueIdentifier;
    v10->_passUniqueIdentifier = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    date = v10->_date;
    v10->_date = (NSDate *)v13;

    v10->_active = 1;
  }

  return v10;
}

- (PDUserNotification)initWithNotificationIdentifier:(id)a3 forAccountIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDUserNotification;
  v9 = -[PDUserNotification init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationIdentifier, a3);
    v11 = (NSString *)[v8 copy];
    accountIdentifier = v10->_accountIdentifier;
    v10->_accountIdentifier = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    date = v10->_date;
    v10->_date = (NSDate *)v13;

    v10->_active = 1;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___PDUserNotification;
  v6 = -[PDUserNotification init](&v42, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"notificationIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    notificationIdentifier = v6->_notificationIdentifier;
    v6->_notificationIdentifier = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"passUniqueIdentifier");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    passUniqueIdentifier = v6->_passUniqueIdentifier;
    v6->_passUniqueIdentifier = (NSString *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"customActionRoute");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    customActionRoute = v6->_customActionRoute;
    v6->_customActionRoute = (NSString *)v16;

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v18);
    v21 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v19,  objc_opt_class(&OBJC_CLASS___NSString, v20),  0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v22 forKey:@"customActionQueryParameters"]);
    customActionQueryParameters = v6->_customActionQueryParameters;
    v6->_customActionQueryParameters = (NSDictionary *)v23;

    id v26 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v25),  @"customActionTitle");
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    customActionTitle = v6->_customActionTitle;
    v6->_customActionTitle = (NSString *)v27;

    id v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v29), @"date");
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    date = v6->_date;
    v6->_date = (NSDate *)v31;

    v6->_insertionRequirements = (unint64_t)[v4 decodeIntegerForKey:@"insertionRequirements"];
    v6->_suppressionBehavior = (unint64_t)[v4 decodeIntegerForKey:@"suppressionBehavior"];
    v6->_allowPresentationOverPass = [v4 decodeBoolForKey:@"allowPresentationOverPass"];
    v6->_reissueBannerOnUpdate = [v4 decodeBoolForKey:@"reissueBannerOnUpdate"];
    v6->_active = [v4 decodeBoolForKey:@"active"];
    v6->_suppressed = [v4 decodeBoolForKey:@"suppressed"];
    v6->_playsSound = [v4 decodeBoolForKey:@"playsSound"];
    v6->_preventAutomaticDismissal = [v4 decodeBoolForKey:@"preventAutomaticDismissal"];
    id v34 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKApplicationMessageContent, v33),  @"applicationMessageContent");
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    applicationMessageContent = v6->_applicationMessageContent;
    v6->_applicationMessageContent = (PKApplicationMessageContent *)v35;

    id v38 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v37),  @"accountIdentifier");
    uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSString *)v39;

    v6->_assetType = (int64_t)[v4 decodeIntegerForKey:@"assetType"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  notificationIdentifier = self->_notificationIdentifier;
  id v5 = a3;
  [v5 encodeObject:notificationIdentifier forKey:@"notificationIdentifier"];
  [v5 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_customActionRoute forKey:@"customActionRoute"];
  [v5 encodeObject:self->_customActionQueryParameters forKey:@"customActionQueryParameters"];
  [v5 encodeObject:self->_customActionTitle forKey:@"customActionTitle"];
  [v5 encodeInteger:self->_insertionRequirements forKey:@"insertionRequirements"];
  [v5 encodeInteger:self->_suppressionBehavior forKey:@"suppressionBehavior"];
  [v5 encodeBool:self->_allowPresentationOverPass forKey:@"allowPresentationOverPass"];
  [v5 encodeBool:self->_reissueBannerOnUpdate forKey:@"reissueBannerOnUpdate"];
  [v5 encodeBool:self->_active forKey:@"active"];
  [v5 encodeBool:self->_suppressed forKey:@"suppressed"];
  [v5 encodeBool:self->_playsSound forKey:@"playsSound"];
  [v5 encodeBool:self->_preventAutomaticDismissal forKey:@"preventAutomaticDismissal"];
  [v5 encodeObject:self->_applicationMessageContent forKey:@"applicationMessageContent"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeInteger:self->_assetType forKey:@"assetType"];
}

- (id)description
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDUserNotification;
  id v3 = -[PDUserNotification description](&v17, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  notificationIdentifier = self->_notificationIdentifier;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  date = self->_date;
  unint64_t suppressionBehavior = self->_suppressionBehavior;
  if (suppressionBehavior > 2) {
    v9 = @"unknown";
  }
  else {
    v9 = off_10064D508[suppressionBehavior];
  }
  if (self->_suppressed) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (self->_active) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  if (self->_preventAutomaticDismissal) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if (self->_reissueBannerOnUpdate) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification accountIdentifier](self, "accountIdentifier"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@ Notification Identifier: %@, Pass Identifier: %@, Date: %@, Active: %@, Suppressed: %@, Suppression Behavior: %@, Prevents Automatic Dismissal: %@, reissueBannerOnUpdate: %@, Account Identifier: %@]",  v4,  notificationIdentifier,  v6,  date,  v11,  v10,  v9,  v12,  v13,  v14));

  return v15;
}

- (BOOL)isCashFamilyNotification
{
  return (id)-[PDUserNotification familyNotificationType](self, "familyNotificationType") == (id)1;
}

- (unint64_t)familyNotificationType
{
  return 0LL;
}

+ (BOOL)allowReinsertionAfterDismissal
{
  return 1;
}

+ (BOOL)supportsCoalescing
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)notificationType
{
  return 0LL;
}

- (unint64_t)coalesceWithExistingUserNotification:(id)a3
{
  return 0LL;
}

- (id)actionURL
{
  unsigned int v3 = +[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification customActionURLString](self, "customActionURLString"));
  id v5 = [v4 length];
  if (v5)
  {
    v6 = -[NSURLComponents initWithString:](objc_alloc(&OBJC_CLASS___NSURLComponents), "initWithString:", v4);
    if (v3)
    {
LABEL_3:
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v6, "queryItems"));
      BOOL v8 = [v7 count] == 0;

      goto LABEL_6;
    }
  }

  else
  {
    v6 = 0LL;
    if (v3) {
      goto LABEL_3;
    }
  }

  BOOL v8 = 0;
LABEL_6:
  v9 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification customActionQueryParameters](self, "customActionQueryParameters"));
  id v11 = -[NSMutableDictionary initWithDictionary:](v9, "initWithDictionary:", v10);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](self, "notificationIdentifier"));
  -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  v12,  PKUserNotificationQueryItemApplicationMessageContentIdentifier);

  if (-[NSMutableDictionary count](v11, "count"))
  {
    v44[0] = 0LL;
    v44[1] = v44;
    v44[2] = 0x2020000000LL;
    char v45 = 1;
    uint64_t v38 = 0LL;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x3032000000LL;
    v41 = sub_10020DC18;
    objc_super v42 = sub_10020DC28;
    v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10020DC30;
    v36[3] = &unk_10064D480;
    BOOL v37 = v8;
    v36[4] = v44;
    v36[5] = &v38;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v36);
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)v39[5] componentsJoinedByString:&stru_100662310]);
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(v44, 8);
    if (v5)
    {
LABEL_8:
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v4, v13));
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v14));
LABEL_35:

      goto LABEL_36;
    }
  }

  else
  {
    uint64_t v13 = &stru_100662310;
    if (v5) {
      goto LABEL_8;
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification customActionRoute](self, "customActionRoute"));
  if ([v16 length]) {
    goto LABEL_13;
  }
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  if ([v17 length])
  {

LABEL_13:
    goto LABEL_14;
  }

  id v30 = -[NSMutableDictionary count](v11, "count");

  if (v30)
  {
LABEL_14:
    uint64_t v18 = @"prefs:root=PASSBOOK";
    if (v3)
    {
      uint64_t v18 = @"shoebox://";
      uint64_t v19 = @"%@%@%@";
    }

    else
    {
      uint64_t v19 = @"%@&path=%@%@";
    }

    uint64_t v20 = v18;
    v21 = v19;
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[PDUserNotification customActionRoute](self, "customActionRoute"));
    uint64_t v23 = (void *)v22;
    v24 = (void *)PKUserNotificationActionRouteViewPass;
    if (v22) {
      v24 = (void *)v22;
    }
    id v25 = v24;

    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
    if (v26
      && ([v25 isEqualToString:PKUserNotificationActionRouteViewTransaction] & 1) == 0
      && ([v25 containsString:PKURLActionRoutePeerPaymentPass] & 1) == 0
      && ([v25 containsString:PKURLActionRouteCreditPaymentPass] & 1) == 0
      && ([v25 containsString:PKUserNotificationActionRoutePayLaterViewFinancingPlan] & 1) == 0)
    {
      unsigned __int8 v34 = [v25 containsString:PKURLActionRouteSavings];

      if ((v34 & 1) != 0)
      {
LABEL_34:
        uint64_t v31 = PKStringWithValidatedFormat(v21, @"%@%@%@");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v31);

        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v14, v20, v25, v13));
        goto LABEL_35;
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet alphanumericCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "alphanumericCharacterSet"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v33 stringByAddingPercentEncodingWithAllowedCharacters:v26]);

      if (v3)
      {
        id v27 = (id)objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:v35]);

        id v25 = (id)objc_claimAutoreleasedReturnValue(-[PDUserNotification customActionVerb](self, "customActionVerb"));
        if (v25)
        {
          uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:v25]);

          id v27 = (id)v28;
        }

        uint64_t v29 = v35;
      }

      else
      {
        uint64_t v29 = v35;
        id v27 = v35;
      }

      id v25 = v27;
    }

    goto LABEL_34;
  }

  id v15 = 0LL;
LABEL_36:

  return v15;
}

+ (id)applicationMessageIconForFeature:(unint64_t)a3
{
  unsigned int v3 = 0LL;
  id v4 = 0LL;
  switch(a3)
  {
    case 1uLL:
      uint64_t v5 = PKPassKitUIBundle(a1, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      id v7 = v6;
      BOOL v8 = @"AppleCashIcon";
      goto LABEL_7;
    case 2uLL:
      uint64_t v9 = PKPassKitUIBundle(a1, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v9);
      id v7 = v6;
      BOOL v8 = @"AppleCardIcon";
      goto LABEL_7;
    case 3uLL:
      uint64_t v10 = PKPassKitUIBundle(a1, a2);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PKImage imageNamed:inBundle:]( &OBJC_CLASS___PKImage,  "imageNamed:inBundle:",  @"PayLater_welcome_icon",  v11));

      unsigned int v3 = 0LL;
      if (!v12) {
        goto LABEL_5;
      }
      goto LABEL_9;
    case 4uLL:
      break;
    case 5uLL:
      uint64_t v13 = PKPassKitUIBundle(a1, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v7 = v6;
      BOOL v8 = @"SAVINGS_Icon";
LABEL_7:
      unsigned int v3 = (const __CFURL *)objc_claimAutoreleasedReturnValue([v6 URLForResource:v8 withExtension:@"pdf"]);

      id v4 = CGPDFDocumentCreateWithURL(v3);
      if (v4)
      {
        id v14 = +[PKApplicationMessageIcon maximumSizeForStyle:]( &OBJC_CLASS___PKApplicationMessageIcon,  "maximumSizeForStyle:",  0LL);
        double v16 = v15;
        double v18 = v17;
        double v19 = PKScreenScale(v14);
        uint64_t v20 = PKGetImageFromPDFDocument(v4, v16, v18, v19);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v20);
        CGPDFDocumentRelease(v4);
        if (v12)
        {
LABEL_9:
          id v21 = +[PKImageDescriptorBitmap createForImage:withTintColor:]( &OBJC_CLASS___PKImageDescriptorBitmap,  "createForImage:withTintColor:",  v12,  0LL);
          id v4 = (CGPDFDocument *)+[PKApplicationMessageIcon createWithImage:style:]( &OBJC_CLASS___PKApplicationMessageIcon,  "createWithImage:style:",  v21,  0LL);
        }

        else
        {
LABEL_5:
          id v4 = 0LL;
        }
      }

      break;
    default:
      id v4 = 0LL;
      break;
  }

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  -[UNMutableNotificationContent setDefaultActionURL:](v4, "setDefaultActionURL:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification customActionTitle](self, "customActionTitle"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification customActionTitle](self, "customActionTitle"));
    -[UNMutableNotificationContent setDefaultActionTitle:](v4, "setDefaultActionTitle:", v7);
  }

  -[UNMutableNotificationContent setDate:](v4, "setDate:", self->_date);
  -[UNMutableNotificationContent setShouldPreventNotificationDismissalAfterDefaultAction:]( v4,  "setShouldPreventNotificationDismissalAfterDefaultAction:",  self->_preventAutomaticDismissal);
  if (self->_playsSound)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationSound soundWithAlertType:]( &OBJC_CLASS___UNNotificationSound,  "soundWithAlertType:",  20LL));
    -[UNMutableNotificationContent setSound:](v4, "setSound:", v8);
  }

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v11,  PKPassbookBulletinPassUniqueIdentifierKey);

    -[PDUserNotification allowPresentationOverPass](self, "allowPresentationOverPass");
  }

  if (-[PDUserNotification isCashFamilyNotification](self, "isCashFamilyNotification")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  PKUserNotificationIsCashFamilyNotificationKey);
  }
  -[UNMutableNotificationContent setUserInfo:](v4, "setUserInfo:", v9);

  return v4;
}

- (unint64_t)insertionRequirements
{
  return self->_insertionRequirements;
}

- (void)setInsertionRequirements:(unint64_t)a3
{
  self->_insertionRequirements = a3;
}

- (unint64_t)suppressionBehavior
{
  return self->_suppressionBehavior;
}

- (void)setSuppressionBehavior:(unint64_t)a3
{
  self->_unint64_t suppressionBehavior = a3;
}

- (BOOL)allowPresentationOverPass
{
  return self->_allowPresentationOverPass;
}

- (void)setAllowPresentationOverPass:(BOOL)a3
{
  self->_allowPresentationOverPass = a3;
}

- (BOOL)reissueBannerOnUpdate
{
  return self->_reissueBannerOnUpdate;
}

- (void)setReissueBannerOnUpdate:(BOOL)a3
{
  self->_reissueBannerOnUpdate = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (void)setSuppressed:(BOOL)a3
{
  self->_suppressed = a3;
}

- (BOOL)needsNotificationSettings
{
  return self->_needsNotificationSettings;
}

- (BOOL)playsSound
{
  return self->_playsSound;
}

- (void)setPlaysSound:(BOOL)a3
{
  self->_playsSound = a3;
}

- (BOOL)preventAutomaticDismissal
{
  return self->_preventAutomaticDismissal;
}

- (void)setPreventAutomaticDismissal:(BOOL)a3
{
  self->_preventAutomaticDismissal = a3;
}

- (BOOL)isServiceNotification
{
  return self->_isServiceNotification;
}

- (void)setIsServiceNotification:(BOOL)a3
{
  self->_isServiceNotification = a3;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (NSString)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (void)setNotificationIdentifier:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)customActionRoute
{
  return self->_customActionRoute;
}

- (void)setCustomActionRoute:(id)a3
{
}

- (NSString)customActionVerb
{
  return self->_customActionVerb;
}

- (void)setCustomActionVerb:(id)a3
{
}

- (NSString)customActionURLString
{
  return self->_customActionURLString;
}

- (void)setCustomActionURLString:(id)a3
{
}

- (NSDictionary)customActionQueryParameters
{
  return self->_customActionQueryParameters;
}

- (void)setCustomActionQueryParameters:(id)a3
{
}

- (NSString)customActionTitle
{
  return self->_customActionTitle;
}

- (void)setCustomActionTitle:(id)a3
{
}

- (PKApplicationMessageContent)applicationMessageContent
{
  return self->_applicationMessageContent;
}

- (void)setApplicationMessageContent:(id)a3
{
}

- (BOOL)applicationMessageBadge
{
  return self->_applicationMessageBadge;
}

- (void)setApplicationMessageBadge:(BOOL)a3
{
  self->_applicationMessageBadge = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(int64_t)a3
{
  self->_assetType = a3;
}

- (void)setFamilyNotificationType:(unint64_t)a3
{
  self->_familyNotificationType = a3;
}

- (void).cxx_destruct
{
}

- (void)updatePassNameForNotificationContent:(id)a3 dataSource:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 passWithUniqueIdentifier:v7]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 notificationCenterTitle]);
  id v11 = [v9 caseInsensitiveCompare:v10];

  if (v11) {
    [v12 setTitle:v9];
  }
}

- (id)_payLaterApplicationMessageGroupDescriptor
{
  uint64_t v2 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_SUMMARY");
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"PayLaterApplicationMessageGroupIdentifier",  v3,  v3);

  return v4;
}

- (id)_payLaterApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotification _payLaterApplicationMessageGroupDescriptor]( self,  "_payLaterApplicationMessageGroupDescriptor"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  id v10 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  3LL));
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v8,  v10,  v11,  v7,  v6);

  return v12;
}

@end