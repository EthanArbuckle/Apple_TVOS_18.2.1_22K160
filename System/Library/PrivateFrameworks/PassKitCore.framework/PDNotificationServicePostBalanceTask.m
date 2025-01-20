@interface PDNotificationServicePostBalanceTask
+ (BOOL)supportsSecureCoding;
+ (id)postBalanceTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 autoTopUpDisabled:(BOOL)a7 balance:(id)a8;
- (BOOL)autoTopUpDisabled;
- (BOOL)backoffComplete;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (NSString)accountIdentifier;
- (NSString)dpanIdentifier;
- (NSString)transactionSequenceNumber;
- (PDNotificationServicePostBalanceTask)initWithCoder:(id)a3;
- (PDNotificationServicePostBalanceTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 autoTopUpDisabled:(BOOL)a7 balance:(id)a8;
- (PKPaymentBalance)balance;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (id)queryFields;
- (int64_t)actionForInactiveTask:(id)a3;
- (int64_t)taskType;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)reportAuthenticationFailure;
- (void)reportUnexpectedResponseCode:(int64_t)a3;
- (void)setAccountIdentifier:(id)a3;
@end

@implementation PDNotificationServicePostBalanceTask

+ (id)postBalanceTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 autoTopUpDisabled:(BOOL)a7 balance:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [objc_alloc((Class)a1) initWithNotificationService:v18 dpanIdentifier:v17 accountIdentifier:v16 transactionSequenceNumber:v15 autoTopUpDisabled:v8 balance:v14];

  return v19;
}

- (PDNotificationServicePostBalanceTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 autoTopUpDisabled:(BOOL)a7 balance:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PDNotificationServicePostBalanceTask;
  id v18 = -[PDNotificationServiceConnectionTask initWithNotificationService:](&v22, "initWithNotificationService:", a3);
  id v19 = v18;
  if (v18)
  {
    -[PDNetworkTask setCanRequestReauthentication:](v18, "setCanRequestReauthentication:", 1LL);
    objc_storeStrong((id *)&v19->_dpanIdentifier, a4);
    objc_storeStrong((id *)&v19->_accountIdentifier, a5);
    objc_storeStrong((id *)&v19->_transactionSequenceNumber, a6);
    v19->_autoTopUpDisabled = a7;
    objc_storeStrong((id *)&v19->_balance, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServicePostBalanceTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDNotificationServicePostBalanceTask;
  v6 = -[PDNotificationServiceConnectionTask initWithCoder:](&v23, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"dpanIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    dpanIdentifier = v6->_dpanIdentifier;
    v6->_dpanIdentifier = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"accountIdentifier");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSString *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"transactionSequenceNumber");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    transactionSequenceNumber = v6->_transactionSequenceNumber;
    v6->_transactionSequenceNumber = (NSString *)v16;

    v6->_autoTopUpDisabled = [v4 decodeBoolForKey:@"autoTopUpDisabled"];
    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDecimalNumber, v18),  @"balance");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    balance = v6->_balance;
    v6->_balance = (PKPaymentBalance *)v20;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDNotificationServicePostBalanceTask;
  id v4 = a3;
  -[PDNotificationServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_accountIdentifier,  @"dpanIdentifier",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v4 encodeObject:self->_transactionSequenceNumber forKey:@"transactionSequenceNumber"];
  [v4 encodeBool:self->_autoTopUpDisabled forKey:@"autoTopUpDisabled"];
  [v4 encodeObject:self->_balance forKey:@"balance"];
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServicePostBalanceTask dpanIdentifier](self, "dpanIdentifier"));
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (int64_t)taskType
{
  return 4LL;
}

- (id)headerFields
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDNotificationServicePostBalanceTask;
  id v3 = -[PDNotificationServiceConnectionTask headerFields](&v14, "headerFields");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));

  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSLocale pk_deviceLanguage](&OBJC_CLASS___NSLocale, "pk_deviceLanguage"));
  BOOL v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (const __CFString *)v6;
  }
  else {
    uint64_t v8 = @"en";
  }
  [v5 setObject:v8 forKey:@"Accept-Language"];
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    [v5 setObject:accountIdentifier forKeyedSubscript:@"x-account-identifier"];
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No account identifier present", v13, 2u);
    }
  }

  return v5;
}

- (id)endpointComponents
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PDNotificationServicePostBalanceTask dpanIdentifier](self, "dpanIdentifier"));
  uint64_t v6 = (void *)v5;
  BOOL v7 = 0LL;
  if (v4 && v5)
  {
    v9[0] = @"devices";
    v9[1] = v4;
    v9[2] = @"dpan";
    v9[3] = v5;
    v9[4] = @"balancesync";
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 5LL));
  }

  return v7;
}

- (id)queryFields
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastUpdatedTag]);

  if (v3)
  {
    uint64_t v6 = @"tag";
    BOOL v7 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentBalance identifiers](self->_balance, "identifiers"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);
  -[NSMutableDictionary safelySetObject:forKey:](v4, "safelySetObject:forKey:", v6, @"identifier");

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentBalance currencyCode](self->_balance, "currencyCode"));
  -[NSMutableDictionary safelySetObject:forKey:](v4, "safelySetObject:forKey:", v7, @"currencyCode");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[PKPaymentBalance exponent](self->_balance, "exponent")));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, @"exponent");

  else {
    v9 = @"false";
  }
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"isPrimaryBalance");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentBalance value](self->_balance, "value"));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, @"value");

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentBalance lastUpdateDate](self->_balance, "lastUpdateDate"));
  if (!v11)
  {
    balance = self->_balance;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[PKPaymentBalance setLastUpdateDate:](balance, "setLastUpdateDate:", v13);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentBalance lastUpdateDate](self->_balance, "lastUpdateDate"));
  }

  objc_super v14 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v14, "setDateFormat:", @"yyyy-MM-dd'T'HH:mm:ssZZZZZ");
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v14, "setLocale:", v15);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
  -[NSDateFormatter setCalendar:](v14, "setCalendar:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v14, "stringFromDate:", v11));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v17, @"lastUpdatedDate");
  id v18 = -[NSMutableDictionary copy](v4, "copy");
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v18, @"balanceDetails");

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_autoTopUpDisabled));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v19, @"autoTopUpDisabled");

  -[NSMutableDictionary safelySetObject:forKey:]( v3,  "safelySetObject:forKey:",  self->_transactionSequenceNumber,  @"transactionSequenceNumber");
  id v20 = -[NSMutableDictionary copy](v3, "copy");

  return v20;
}

- (id)method
{
  return @"POST";
}

- (BOOL)backoffComplete
{
  return self->_autoTopUpDisabled;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v5 = [a3 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2048;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v9,  0x16u);
  }

  if (v5 == (id)401)
  {
    PKAnalyticsSendEvent(PKAggDKeyPaymentNotificationServicesGetUpdates, &off_100691360);
    -[PDNotificationServicePostBalanceTask reportAuthenticationFailure](self, "reportAuthenticationFailure");
    -[PDNetworkTask failForAuthentication](self, "failForAuthentication");
    return;
  }

  if (v5 == (id)304)
  {
    uint64_t v8 = &off_100691338;
    goto LABEL_9;
  }

  if (v5 == (id)200)
  {
    uint64_t v8 = &off_100691310;
LABEL_9:
    PKAnalyticsSendEvent(PKAggDKeyPaymentNotificationServicesGetUpdates, v8);
    -[PDNetworkTask succeed](self, "succeed");
    return;
  }

  PKAnalyticsSendEvent(PKAggDKeyPaymentNotificationServicesGetUpdates, &off_100691388);
  -[PDNotificationServicePostBalanceTask reportUnexpectedResponseCode:](self, "reportUnexpectedResponseCode:", v5);
  -[PDNetworkTask fail](self, "fail");
}

- (void)handleError:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Connection Error for Task: %@ (%@)",  (uint8_t *)&v7,  0x16u);
  }

  -[PDNetworkTask fail](self, "fail");
}

- (id)description
{
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  if ([v15 serviceType]) {
    id v3 = @"Messages";
  }
  else {
    id v3 = @"Transactions";
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServicePostBalanceTask dpanIdentifier](self, "dpanIdentifier"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registrationURL]);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServicePostBalanceTask transactionSequenceNumber](self, "transactionSequenceNumber"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServicePostBalanceTask balance](self, "balance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Post Balance %@ Notifications Task (Device ID: %@, DPAN ID: %@, Service URL: %@, Registration URL: %@, transactionSequenceNumber: %@, balance: %@)",  v3,  v5,  v6,  v8,  v10,  v11,  v12));

  return v13;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  return -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDNotificationServicePostBalanceTask, a2));
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  if (sub_10027AA80(self, v4))
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceRegistrationTask, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      if ([v4 requestedStatus] == (id)2) {
        int64_t v8 = 7LL;
      }
      else {
        int64_t v8 = 5LL;
      }
    }

    else
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___PDNotificationServicePostBalanceTask, v7);
      if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
      {
        if (-[PDNotificationServicePostBalanceTask matchesTask:](self, "matchesTask:", v4))
        {
          int64_t v8 = 1LL;
        }

        else
        {
          __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 balance]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastUpdateDate]);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServicePostBalanceTask balance](self, "balance"));
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastUpdateDate]);
          id v15 = [v12 compare:v14];

          if (v15 == (id)-1LL) {
            int64_t v8 = 1LL;
          }
          else {
            int64_t v8 = 5LL;
          }
        }
      }

      else
      {
        int64_t v8 = 5LL;
      }
    }
  }

  else
  {
    int64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDNotificationServicePostBalanceTask;
  if (-[PDNotificationServiceConnectionTask matchesTask:](&v17, "matchesTask:", v4)
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDNotificationServicePostBalanceTask, v5),
        (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dpanIdentifier]);
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionSequenceNumber]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 balance]);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServicePostBalanceTask dpanIdentifier](self, "dpanIdentifier"));
    if (PKEqualObjects(v11, v7))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServicePostBalanceTask accountIdentifier](self, "accountIdentifier"));
      if (PKEqualObjects(v12, v8))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServicePostBalanceTask transactionSequenceNumber]( self,  "transactionSequenceNumber"));
        if ([v13 isEqualToString:v9])
        {
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServicePostBalanceTask balance](self, "balance"));
          char v15 = PKEqualObjects(v14, v10);
        }

        else
        {
          char v15 = 0;
        }
      }

      else
      {
        char v15 = 0;
      }
    }

    else
    {
      char v15 = 0;
    }
  }

  else
  {
    char v15 = 0;
  }

  return v15;
}

- (void)reportAuthenticationFailure
{
  id v7 = PDTaskError(0LL, self, 0LL, @"Authentication failure", v2, v3, v4, v5, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[PDNetworkTask reportError:](self, "reportError:", v9);
}

- (void)reportUnexpectedResponseCode:(int64_t)a3
{
  id v8 = PDTaskError(1LL, self, 0LL, @"Unexpected response code %ld", v3, v4, v5, v6, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[PDNetworkTask reportError:](self, "reportError:", v9);
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSString)transactionSequenceNumber
{
  return self->_transactionSequenceNumber;
}

- (BOOL)autoTopUpDisabled
{
  return self->_autoTopUpDisabled;
}

- (PKPaymentBalance)balance
{
  return self->_balance;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end