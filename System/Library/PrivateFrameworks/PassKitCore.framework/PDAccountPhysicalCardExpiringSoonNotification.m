@interface PDAccountPhysicalCardExpiringSoonNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDAccountPhysicalCardExpiringSoonNotification)initWithAccount:(id)a3 physicalCard:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PDAccountPhysicalCardExpiringSoonNotification)initWithCoder:(id)a3;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountPhysicalCardExpiringSoonNotification

- (PDAccountPhysicalCardExpiringSoonNotification)initWithAccount:(id)a3 physicalCard:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length]
    && (v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]),
        id v12 = [v11 length],
        v11,
        v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-physicalCardExpiringSoon",  v13));

    v30.receiver = self;
    v30.super_class = (Class)&OBJC_CLASS___PDAccountPhysicalCardExpiringSoonNotification;
    v15 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v30,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v14,  v10);
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](v15, "notificationIdentifier"));
      id v18 = [v17 length];

      if (v18)
      {
        v19 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v8 productTimeZone]);
        -[NSCalendar setTimeZone:](v19, "setTimeZone:", v20);

        uint64_t v21 = objc_claimAutoreleasedReturnValue([v9 expirationDateInCalendar:v19]);
        expirationDate = v16->_expirationDate;
        v16->_expirationDate = (NSDate *)v21;

        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://%@/%@/%@",  PKWalletURLScheme,  PKURLActionRouteCreditPaymentPass,  PKURLActionRouteCreditPaymentPassDetailsAction,  PKURLSubactionRouteCreditPaymentPassReplace));
        -[PDUserNotification setCustomActionURLString:](v16, "setCustomActionURLString:", v23);

        if (!v16->_expirationDate)
        {

          v28 = 0LL;
          goto LABEL_10;
        }

        uint64_t v24 = objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
        accountIdentifier = v16->_accountIdentifier;
        v16->_accountIdentifier = (NSString *)v24;

        uint64_t v26 = objc_claimAutoreleasedReturnValue([v9 identifier]);
        physicalCardIdentifier = v16->_physicalCardIdentifier;
        v16->_physicalCardIdentifier = (NSString *)v26;
      }
    }
  }

  else
  {

    v16 = 0LL;
  }

  v16 = v16;
  v28 = v16;
LABEL_10:

  return v28;
}

- (PDAccountPhysicalCardExpiringSoonNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDAccountPhysicalCardExpiringSoonNotification;
  v6 = -[PDUserNotification initWithCoder:](&v19, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v5),  @"expirationDate");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"accountIdentifier");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSString *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"physicalCardIdentifier");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    physicalCardIdentifier = v6->_physicalCardIdentifier;
    v6->_physicalCardIdentifier = (NSString *)v16;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountPhysicalCardExpiringSoonNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, @"expirationDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v4 encodeObject:self->_physicalCardIdentifier forKey:@"physicalCardIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isValid
{
  uint64_t started = PKAppleCardPhysicalCardExpiredMessagingStartDate(self->_accountIdentifier, self->_physicalCardIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue(started);
  if ((PKIsMac(v3, v4) & 1) != 0)
  {
    BOOL v5 = 0;
  }

  else if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v6 timeIntervalSinceDate:v3];
    BOOL v5 = v7 < 0.0;
  }

  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (unint64_t)notificationType
{
  return 76LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDAccountPhysicalCardExpiringSoonNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v16, "notificationContentWithDataSource:", a3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_PHYSICAL_CARD_EXPIRING_SOON_NOTIFICATION_TITLE", 2LL);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setSubtitle:v7];

  uint64_t v9 = PDDeviceSpecificLocalizedStringKeyForKey( @"ACCOUNT_SERVICE_PHYSICAL_CARD_EXPIRING_SOON_NOTIFICATION_BODY",  v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = PKMediumDayAndMonthStringFromDate(self->_expirationDate);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = PKLocalizedFeatureString(v10, 2LL, @"%@");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v5, "setBody:", v14, v12);

  return v5;
}

- (id)applicationMessageContent
{
  uint64_t v3 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_PHYSICAL_CARD_EXPIRING_SOON_NOTIFICATION_TITLE", 2LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = PKMediumDayAndMonthStringFromDate(self->_expirationDate);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v6 = PKLocalizedFeatureString( @"ACCOUNT_SERVICE_PHYSICAL_CARD_EXPIRING_SOON_APPLICATION_MESSAGE_BODY",  2LL,  @"%@");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = PKLocalizedFeatureString(@"APPLICATION_MESSAGE_SUMMARY", 2LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"PDPassAccountEventApplicationMessageGroupIdentifier",  v9,  v9,  v29);
  uint64_t v12 = PKPassKitUIBundle(v10, v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (const __CFURL *)objc_claimAutoreleasedReturnValue( [v13 URLForResource:@"PhysicalCardMessageModule" withExtension:@"pdf"]);

  id v15 = CGPDFDocumentCreateWithURL(v14);
  if (v15)
  {
    id v16 = +[PKApplicationMessageIcon maximumSizeForStyle:]( &OBJC_CLASS___PKApplicationMessageIcon,  "maximumSizeForStyle:",  1LL);
    double v18 = v17;
    double v20 = v19;
    double v21 = PKScreenScale(v16);
    uint64_t v22 = PKGetImageFromPDFDocument(v15, v18, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    CGPDFDocumentRelease(v15);
    id v24 = +[PKImageDescriptorBitmap createForImage:withTintColor:hasBackground:]( &OBJC_CLASS___PKImageDescriptorBitmap,  "createForImage:withTintColor:hasBackground:",  v23,  0LL,  0LL);
    id v15 = (CGPDFDocument *)+[PKApplicationMessageIcon createWithImage:style:]( &OBJC_CLASS___PKApplicationMessageIcon,  "createWithImage:style:",  v24,  0LL);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  id v26 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v25);
  id v27 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v10,  v26,  v15,  v4,  v7);

  return v27;
}

- (void).cxx_destruct
{
}

@end