@interface PDImportSafariCardRequestUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFPANSuffix:(id)a3 networkName:(id)a4;
+ (id)notificationIdentifierForPaymentSafariCredential:(id)a3;
- (PDImportSafariCardRequestUserNotification)initWithCoder:(id)a3;
- (PDImportSafariCardRequestUserNotification)initWithFPANSuffix:(id)a3 networkName:(id)a4;
- (PDImportSafariCardRequestUserNotification)initWithPaymentSafariCredential:(id)a3;
- (id)_messageString;
- (id)_subtitleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDImportSafariCardRequestUserNotification

+ (id)notificationIdentifierForPaymentSafariCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKDisplayablePaymentNetworkCardNameForPaymentCredentialType([v4 credentialType]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 cardNumber]);

  uint64_t v8 = PKFPANSuffixFromFPAN(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 notificationIdentifierForFPANSuffix:v9 networkName:v6]);
  return v10;
}

+ (id)notificationIdentifierForFPANSuffix:(id)a3 networkName:(id)a4
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SafariCardImport-%@-%@",  a4,  a3);
}

- (PDImportSafariCardRequestUserNotification)initWithPaymentSafariCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKDisplayablePaymentNetworkCardNameForPaymentCredentialType([v4 credentialType]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 cardNumber]);

  uint64_t v8 = PKFPANSuffixFromFPAN(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = -[PDImportSafariCardRequestUserNotification initWithFPANSuffix:networkName:]( self,  "initWithFPANSuffix:networkName:",  v9,  v6);
  return v10;
}

- (PDImportSafariCardRequestUserNotification)initWithFPANSuffix:(id)a3 networkName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PDImportSafariCardRequestUserNotification notificationIdentifierForFPANSuffix:networkName:]( &OBJC_CLASS___PDImportSafariCardRequestUserNotification,  "notificationIdentifierForFPANSuffix:networkName:",  v6,  v7));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDImportSafariCardRequestUserNotification;
  v9 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v15,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v8,  0LL);
  if (v9)
  {
    v10 = (NSString *)[v7 copy];
    networkName = v9->_networkName;
    v9->_networkName = v10;

    v12 = (NSString *)[v6 copy];
    fpanSuffix = v9->_fpanSuffix;
    v9->_fpanSuffix = v12;

    -[PDUserNotification setCustomActionRoute:]( v9,  "setCustomActionRoute:",  PKUserNotificationActionRouteAddPaymentCard);
  }

  return v9;
}

- (unint64_t)notificationType
{
  return 59LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDImportSafariCardRequestUserNotification;
  id v4 = -[PDGenericUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDImportSafariCardRequestUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDImportSafariCardRequestUserNotification _subtitleString](self, "_subtitleString"));
  [v5 setSubtitle:v7];

  return v5;
}

- (id)_subtitleString
{
  return (id)PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_ADD_CARD_BANNER_SUBTITLE");
}

- (id)_messageString
{
  return (id)PKLocalizedVirtualCardString( @"SAFARI_CARD_IMPORT_ADD_CARD_BODY",  @"%1$@%2$@",  self->_networkName,  self->_fpanSuffix);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDImportSafariCardRequestUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDImportSafariCardRequestUserNotification;
  id v6 = -[PDGenericUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"networkName");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    networkName = v6->_networkName;
    v6->_networkName = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"fpanSuffix");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    fpanSuffix = v6->_fpanSuffix;
    v6->_fpanSuffix = (NSString *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDImportSafariCardRequestUserNotification;
  id v4 = a3;
  -[PDGenericUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_networkName, @"networkName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fpanSuffix forKey:@"fpanSuffix"];
}

- (void).cxx_destruct
{
}

@end