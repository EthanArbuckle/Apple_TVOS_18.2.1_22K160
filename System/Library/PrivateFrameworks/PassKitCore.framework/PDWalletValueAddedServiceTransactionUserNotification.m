@interface PDWalletValueAddedServiceTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (NSString)merchantIdentifier;
- (PDWalletValueAddedServiceTransactionUserNotification)initWithCoder:(id)a3;
- (PDWalletValueAddedServiceTransactionUserNotification)initWithMerchantIdentifier:(id)a3 localizedPassDescription:(id)a4 passUniqueIdentifier:(id)a5;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDWalletValueAddedServiceTransactionUserNotification

- (PDWalletValueAddedServiceTransactionUserNotification)initWithMerchantIdentifier:(id)a3 localizedPassDescription:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length] && objc_msgSend(v10, "length"))
  {
    uint64_t v11 = PKLocalizedString(@"VAS_PASS_ADD_UPGRADE_TITLE", @"%@", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = PKLocalizedString(@"VAS_PASS_ADD_UPGRADE_MESSAGE", @"%@", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v22 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___PDWalletValueAddedServiceTransactionUserNotification;
    v16 = -[PDGenericUserNotification _initWithTitle:subtitle:message:forPassUniqueIdentifier:hashComponents:]( &v21,  "_initWithTitle:subtitle:message:forPassUniqueIdentifier:hashComponents:",  v12,  0LL,  v14,  v10,  v15);

    if (v16)
    {
      v17 = (NSString *)[v8 copy];
      merchantIdentifier = v16->_merchantIdentifier;
      v16->_merchantIdentifier = v17;

      v20.receiver = v16;
      v20.super_class = (Class)&OBJC_CLASS___PDWalletValueAddedServiceTransactionUserNotification;
      -[PDUserNotification setCustomActionRoute:]( &v20,  "setCustomActionRoute:",  PKUserNotificationActionRouteAddValueAddedServicePass);
    }
  }

  else
  {

    v16 = 0LL;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDWalletValueAddedServiceTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDWalletValueAddedServiceTransactionUserNotification;
  v6 = -[PDGenericUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"merchantIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    merchantIdentifier = v6->_merchantIdentifier;
    v6->_merchantIdentifier = (NSString *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDWalletValueAddedServiceTransactionUserNotification;
  id v4 = a3;
  -[PDGenericUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_merchantIdentifier,  @"merchantIdentifier",  v5.receiver,  v5.super_class);
}

- (unint64_t)notificationType
{
  return 2LL;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void).cxx_destruct
{
}

@end