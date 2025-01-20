@interface PDNotificationServiceGetUpdatesTask
+ (BOOL)supportsSecureCoding;
+ (id)getUpdatesTaskWithNotificationService:(id)a3 accountIdentifier:(id)a4;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isInitialUpdatesTask;
- (BOOL)isValid;
- (NSString)accountIdentifier;
- (PDNotificationServiceGetUpdatesTask)initWithCoder:(id)a3;
- (PDNotificationServiceGetUpdatesTask)initWithNotificationService:(id)a3 accountIdentifier:(id)a4;
- (id)_resultFromResponseData:(id)a3;
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
- (void)setInitialUpdatesTask:(BOOL)a3;
@end

@implementation PDNotificationServiceGetUpdatesTask

+ (id)getUpdatesTaskWithNotificationService:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithNotificationService:v7 accountIdentifier:v6];

  return v8;
}

- (PDNotificationServiceGetUpdatesTask)initWithNotificationService:(id)a3 accountIdentifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDNotificationServiceGetUpdatesTask;
  id v8 = -[PDNotificationServiceConnectionTask initWithNotificationService:](&v11, "initWithNotificationService:", a3);
  v9 = v8;
  if (v8)
  {
    -[PDNetworkTask setCanRequestReauthentication:](v8, "setCanRequestReauthentication:", 1LL);
    objc_storeStrong((id *)&v9->_accountIdentifier, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceGetUpdatesTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDNotificationServiceGetUpdatesTask;
  v5 = -[PDNotificationServiceConnectionTask initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v5->_initialUpdatesTask = [v4 decodeBoolForKey:@"initialUpdatesTask"];
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v6),  @"accountIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDNotificationServiceGetUpdatesTask;
  id v4 = a3;
  -[PDNotificationServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeBool:forKey:",  self->_initialUpdatesTask,  @"initialUpdatesTask",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 deviceIdentifier]);

  return v3 != 0LL;
}

- (int64_t)taskType
{
  return 2LL;
}

- (id)headerFields
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDNotificationServiceGetUpdatesTask;
  id v3 = -[PDNotificationServiceConnectionTask headerFields](&v14, "headerFields");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));

  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSLocale pk_deviceLanguage](&OBJC_CLASS___NSLocale, "pk_deviceLanguage"));
  id v7 = (void *)v6;
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
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
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

  if (v4)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
    id v6 = [v5 serviceType];

    id v7 = @"messages";
    if (v6 != (id)1) {
      id v7 = 0LL;
    }
    if (!v6) {
      id v7 = @"transactions";
    }
    v10[0] = @"devices";
    v10[1] = v4;
    v10[2] = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 3LL));
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)queryFields
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastUpdatedTag]);

  if (v3)
  {
    id v6 = @"tag";
    id v7 = v3;
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
  return 0LL;
}

- (id)method
{
  return @"GET";
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2048;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v12,  0x16u);
  }

  if (v7 == (id)401)
  {
    PKAnalyticsSendEvent(PKAggDKeyPaymentNotificationServicesGetUpdates, &off_100691400);
    -[PDNotificationServiceGetUpdatesTask reportAuthenticationFailure](self, "reportAuthenticationFailure");
    -[PDNetworkTask failForAuthentication](self, "failForAuthentication");
  }

  else
  {
    if (v7 == (id)304)
    {
      v10 = &off_1006913D8;
    }

    else
    {
      if (v7 != (id)200)
      {
        PKAnalyticsSendEvent(PKAggDKeyPaymentNotificationServicesGetUpdates, &off_100691428);
        -[PDNotificationServiceGetUpdatesTask reportUnexpectedResponseCode:](self, "reportUnexpectedResponseCode:", v7);
        -[PDNetworkTask fail](self, "fail");
        goto LABEL_11;
      }

      v10 = &off_1006913B0;
    }

    PKAnalyticsSendEvent(PKAggDKeyPaymentNotificationServicesGetUpdates, v10);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceGetUpdatesTask _resultFromResponseData:]( self,  "_resultFromResponseData:",  v6));
    -[PDNetworkTask deliverResult:](self, "deliverResult:", v11);

    -[PDNetworkTask succeed](self, "succeed");
  }

- (void)handleError:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
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
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  if ([v3 serviceType]) {
    id v4 = @"Messages";
  }
  else {
    id v4 = @"Transactions";
  }
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIdentifier]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registrationURL]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Get %@ Notifications Task (Device ID: %@, Service URL: %@, Registration URL: %@)",  v4,  v6,  v8,  v10));

  return v11;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  unsigned int v4 = -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDNotificationServiceConnectionTask, a2));
  if (v4) {
    LOBYTE(v4) = -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDNotificationServicePostBalanceTask, v5)) ^ 1;
  }
  return v4;
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
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceGetUpdatesTask, v7);
      if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
      {
        uint64_t v11 = objc_opt_class(self, v10);
        if (v11 == objc_opt_class(v4, v12)) {
          int64_t v8 = 1LL;
        }
        else {
          int64_t v8 = 5LL;
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

- (id)_resultFromResponseData:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v57 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v57));
  id v5 = v57;
  uint64_t v6 = v5;
  if (!v4)
  {
    v29 = 0LL;
    if (!v5) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  if (PKLogNotificationServiceResponses())
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v4,  1LL,  0LL));
    uint64_t v9 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v8, 4LL);
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v59 = self;
      __int16 v60 = 2112;
      v61 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Response: %@", buf, 0x16u);
    }
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v4, v12) & 1) == 0)
  {
    uint64_t v45 = objc_opt_class(v4, v13);
    uint64_t v30 = PDBasicError(@"Top-level JSON object must be a dictionary (instead found a %@)");
    v29 = 0LL;
    id v14 = v6;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v30);
    goto LABEL_28;
  }

  id v14 = v4;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v16 = [v15 serviceType];

  id v18 = &__NSArray0__struct;
  if (v16 == (id)1)
  {
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary, v17);
    id v52 = &__NSArray0__struct;
    uint64_t v32 = PDTypecheckArrayOfObjectsForKey(v14, @"response", @"messageDetails", v31, 1LL, &v52);
    id v27 = (id)objc_claimAutoreleasedReturnValue(v32);
    id v33 = v52;
    v21 = v6;
    id v47 = &__NSArray0__struct;
    id v48 = &__NSArray0__struct;
    goto LABEL_23;
  }

  if (!v16)
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v17);
    id v56 = &__NSArray0__struct;
    uint64_t v20 = PDTypecheckArrayOfObjectsForKey(v14, @"response", @"transactionDetails", v19, 1LL, &v56);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v46 = v56;
    id v55 = &__NSArray0__struct;
    uint64_t v22 = PDTypecheckArrayOfObjectsForKey(v14, @"response", @"balanceDetails", v19, 1LL, &v55);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    id v48 = v55;
    id v54 = &__NSArray0__struct;
    uint64_t v24 = PDTypecheckArrayOfObjectsForKey(v14, @"response", @"commutePlanDetails", v19, 1LL, &v54);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    id v47 = v54;
    id v53 = &__NSArray0__struct;
    id v26 = (id)PDTypecheckArrayOfObjectsForKey( v14,  @"response",  @"tileConfigurations",  v19,  1LL,  &v53);
    id v18 = v53;
    if (v21 && v23 | v25) {
      id v27 = v21;
    }
    else {
      id v27 = 0LL;
    }

    id v33 = v46;
LABEL_23:

    uint64_t v6 = v27;
    if (v27) {
      goto LABEL_24;
    }
    goto LABEL_19;
  }

  id v47 = &__NSArray0__struct;
  id v48 = &__NSArray0__struct;
  id v33 = &__NSArray0__struct;
  if (v6)
  {
LABEL_24:
    id v38 = 0LL;
    id v37 = 0LL;
    goto LABEL_25;
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

- (BOOL)isInitialUpdatesTask
{
  return self->_initialUpdatesTask;
}

- (void)setInitialUpdatesTask:(BOOL)a3
{
  self->_initialUpdatesTask = a3;
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