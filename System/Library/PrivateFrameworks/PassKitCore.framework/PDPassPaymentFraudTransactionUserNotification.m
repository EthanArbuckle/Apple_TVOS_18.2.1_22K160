@interface PDPassPaymentFraudTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)accountSuspended;
- (BOOL)isValid;
- (BOOL)questionIsValid;
- (PDPassPaymentFraudTransactionUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentFraudTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PKPaymentTransaction)paymentTransaction;
- (PKPaymentTransactionQuestion)question;
- (id)_fraudApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_fraudApplicationMessageGroupDescriptor;
- (id)_messageString;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountSuspended:(BOOL)a3;
@end

@implementation PDPassPaymentFraudTransactionUserNotification

- (PDPassPaymentFraudTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"fraud-%@", v9));
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___PDPassPaymentFraudTransactionUserNotification;
    v11 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v20,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v10,  v8);

    if (v11)
    {
      objc_storeStrong((id *)&v11->_paymentTransaction, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction questions](v11->_paymentTransaction, "questions"));
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 anyObject]);
      question = v11->_question;
      v11->_question = (PKPaymentTransactionQuestion *)v13;

      -[PDUserNotification setCustomActionRoute:]( v11,  "setCustomActionRoute:",  PKUserNotificationActionRouteViewTransaction);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction identifier](v11->_paymentTransaction, "identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue( -[PKPaymentTransaction transactionSourceIdentifier]( v11->_paymentTransaction,  "transactionSourceIdentifier"));
      v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if ([v15 length]) {
        -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  v15,  PKUserNotificationActionQueryItemTransactionIdentifier);
      }
      if ([v16 length]) {
        -[NSMutableDictionary setObject:forKey:]( v17,  "setObject:forKey:",  v16,  PKUserNotificationActionQueryItemTransactionSourceIdentifier);
      }
      id v18 = -[NSMutableDictionary copy](v17, "copy");
      -[PDUserNotification setCustomActionQueryParameters:](v11, "setCustomActionQueryParameters:", v18);
    }
  }

  else
  {

    v11 = 0LL;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassPaymentFraudTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPassPaymentFraudTransactionUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPaymentTransaction, v5),  @"paymentTransaction");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    paymentTransaction = v6->_paymentTransaction;
    v6->_paymentTransaction = (PKPaymentTransaction *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKPaymentTransactionQuestion, v10),  @"paymentTransactionQuestion");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    question = v6->_question;
    v6->_question = (PKPaymentTransactionQuestion *)v12;

    v6->_accountSuspended = [v4 decodeBoolForKey:@"suspendedAccount"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassPaymentFraudTransactionUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_paymentTransaction,  @"paymentTransaction",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_question forKey:@"paymentTransactionQuestion"];
  [v4 encodeBool:self->_accountSuspended forKey:@"suspendedAccount"];
}

- (unint64_t)notificationType
{
  return 16LL;
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transactionDate](self->_paymentTransaction, "transactionDate"));
  [v3 timeIntervalSinceNow];
  double v5 = fabs(v4);

  if (v5 <= 259200.0) {
    return -[PDPassPaymentFraudTransactionUserNotification questionIsValid](self, "questionIsValid");
  }
  else {
    return 0;
  }
}

- (BOOL)questionIsValid
{
  question = self->_question;
  if (!question) {
    return 0;
  }
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransactionQuestion expirationDate](question, "expirationDate"));
  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransactionQuestion expirationDate](self->_question, "expirationDate"));
    [v5 timeIntervalSinceNow];
    BOOL v7 = v6 > 0.0;
  }

  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PDPassPaymentFraudTransactionUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v24, "notificationContentWithDataSource:", a3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = -[PDPassPaymentFraudTransactionUserNotification questionIsValid](self, "questionIsValid");
  uint64_t v7 = PKLocalizedFeatureString(@"PAYMENT_TRANSACTION_QUESTION_NOTIFICATION_TITLE", 2LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setSubtitle:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentFraudTransactionUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction transactionDate](self->_paymentTransaction, "transactionDate"));
  [v5 setDate:v10];

  question = self->_question;
  if (question && (v6 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransactionQuestion expirationDate](question, "expirationDate"));
    [v5 setExpirationDate:v12];
  }

  else
  {
    [v5 setExpirationDate:0];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v14 = [v13 mutableCopy];
  objc_super v15 = v14;
  if (v14) {
    v16 = (NSMutableDictionary *)v14;
  }
  else {
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v17 = v16;

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentTransaction identifier](self->_paymentTransaction, "identifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v18,  PKUserNotificationTransactionIdentifierContextKey);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v19,  PKUserNotificationPassUniqueIdentifierContextKey);

  objc_super v20 = self->_question;
  if (v20) {
    unsigned int v21 = v6;
  }
  else {
    unsigned int v21 = 0;
  }
  if (v21 == 1)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[PKPaymentTransactionQuestion type](v20, "type")));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v22,  PKUserNotificationQuestionTypeContextKey);
  }

  [v5 setUserInfo:v17];
  [v5 setInterruptionLevel:2];

  return v5;
}

- (id)_messageString
{
  if (self->_accountSuspended) {
    v2 = @"PAYMENT_TRANSACTION_QUESTION_NOTIFICATION_MESSAGE_SUSPENDED";
  }
  else {
    v2 = @"PAYMENT_TRANSACTION_QUESTION_NOTIFICATION_MESSAGE_ACTIVE";
  }
  uint64_t v3 = PKLocalizedFeatureString(v2, 2LL);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)applicationMessageContent
{
  uint64_t v3 = PKLocalizedFeatureString(@"PAYMENT_TRANSACTION_QUESTION_NOTIFICATION_TITLE", 2LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassPaymentFraudTransactionUserNotification _messageString](self, "_messageString"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassPaymentFraudTransactionUserNotification _fraudApplicationMessageContentWithTitleText:messageText:]( self,  "_fraudApplicationMessageContentWithTitleText:messageText:",  v4,  v5));

  return v6;
}

- (id)_fraudApplicationMessageGroupDescriptor
{
  uint64_t v2 = PKLocalizedFeatureString(@"APPLICATION_MESSAGE_SUMMARY", 2LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"PDPassPaymentFraudTransactionApplicationMessageGroupIdentifier",  v3,  v3);

  return v4;
}

- (id)_fraudApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassPaymentFraudTransactionUserNotification _fraudApplicationMessageGroupDescriptor]( self,  "_fraudApplicationMessageGroupDescriptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  id v10 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  2LL));
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v8,  v10,  v11,  v7,  v6);

  return v12;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (PKPaymentTransactionQuestion)question
{
  return self->_question;
}

- (BOOL)accountSuspended
{
  return self->_accountSuspended;
}

- (void)setAccountSuspended:(BOOL)a3
{
  self->_accountSuspended = a3;
}

- (void).cxx_destruct
{
}

@end