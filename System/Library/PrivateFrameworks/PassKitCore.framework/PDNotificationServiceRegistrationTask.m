@interface PDNotificationServiceRegistrationTask
+ (BOOL)supportsSecureCoding;
+ (id)deregisterTaskWithNotificationService:(id)a3;
+ (id)registerTaskWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 completionTask:(id)a8;
- (BOOL)backoffComplete;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (NSDictionary)certificates;
- (NSString)registrationData;
- (NSString)signature;
- (PDNetworkConnectionTask)completionTask;
- (PDNotificationServiceRegistrationTask)initWithCoder:(id)a3;
- (PDNotificationServiceRegistrationTask)initWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 requestedStatus:(unint64_t)a8 completionTask:(id)a9;
- (id)_authenticationTokenFromResponseData:(id)a3;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (int64_t)actionForInactiveTask:(id)a3;
- (int64_t)taskType;
- (unint64_t)certificateVersion;
- (unint64_t)requestedStatus;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setCertificateVersion:(unint64_t)a3;
- (void)setCertificates:(id)a3;
- (void)setCompletionTask:(id)a3;
- (void)setRegistrationData:(id)a3;
- (void)setRequestedStatus:(unint64_t)a3;
- (void)setSignature:(id)a3;
@end

@implementation PDNotificationServiceRegistrationTask

+ (id)registerTaskWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 completionTask:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [objc_alloc((Class)a1) initWithNotificationService:v18 registrationData:v17 signature:v16 certificates:v15 certificateVersion:a7 requestedStatus:1 completionTask:v14];

  return v19;
}

+ (id)deregisterTaskWithNotificationService:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithNotificationService:v4 registrationData:0 signature:0 certificates:0 certificateVersion:0 requestedStatus:2 completionTask:0];

  return v5;
}

- (PDNotificationServiceRegistrationTask)initWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 requestedStatus:(unint64_t)a8 completionTask:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDNotificationServiceRegistrationTask;
  id v18 = -[PDNotificationServiceConnectionTask initWithNotificationService:](&v23, "initWithNotificationService:", a3);
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_registrationData, a4);
    objc_storeStrong((id *)&v19->_signature, a5);
    objc_storeStrong((id *)&v19->_certificates, a6);
    v19->_certificateVersion = a7;
    v19->_requestedStatus = a8;
    objc_storeStrong((id *)&v19->_completionTask, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceRegistrationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PDNotificationServiceRegistrationTask;
  v6 = -[PDNotificationServiceConnectionTask initWithCoder:](&v30, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"registrationData");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    registrationData = v6->_registrationData;
    v6->_registrationData = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"signature");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    signature = v6->_signature;
    v6->_signature = (NSString *)v12;

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray, v16);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
    v21 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  v17,  v19,  objc_opt_class(&OBJC_CLASS___NSString, v20),  0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v22 forKey:@"certificates"]);
    certificates = v6->_certificates;
    v6->_certificates = (NSDictionary *)v23;

    id v26 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PDNetworkConnectionTask, v25),  @"completionTask");
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    completionTask = v6->_completionTask;
    v6->_completionTask = (PDNetworkConnectionTask *)v27;

    v6->_requestedStatus = (unint64_t)[v4 decodeIntegerForKey:@"requestedStatus"];
    v6->_certificateVersion = (unint64_t)[v4 decodeIntegerForKey:@"certificateVersion"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDNotificationServiceRegistrationTask;
  id v4 = a3;
  -[PDNotificationServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_registrationData,  @"registrationData",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_signature forKey:@"signature"];
  [v4 encodeObject:self->_certificates forKey:@"certificates"];
  [v4 encodeObject:self->_completionTask forKey:@"completionTask"];
  [v4 encodeInteger:self->_requestedStatus forKey:@"requestedStatus"];
  [v4 encodeInteger:self->_certificateVersion forKey:@"certificateVersion"];
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 deviceIdentifier]);

  return v3 != 0LL;
}

- (int64_t)taskType
{
  return 1LL;
}

- (id)method
{
  if ((id)-[PDNotificationServiceRegistrationTask requestedStatus](self, "requestedStatus") == (id)1) {
    return @"POST";
  }
  else {
    return @"DELETE";
  }
}

- (id)endpointComponents
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 deviceIdentifier]);

  if (v3)
  {
    v6[0] = @"devices";
    v6[1] = v3;
    v6[2] = @"registrations";
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 3LL));
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)bodyDictionary
{
  if ((id)-[PDNotificationServiceRegistrationTask requestedStatus](self, "requestedStatus") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceRegistrationTask signature](self, "signature"));

    if (v4)
    {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceRegistrationTask signature](self, "signature"));
      [v3 setObject:v5 forKey:@"signature"];
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceRegistrationTask registrationData](self, "registrationData"));

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceRegistrationTask registrationData](self, "registrationData"));
      [v3 setObject:v7 forKey:@"registrationData"];
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceRegistrationTask certificates](self, "certificates"));
    id v9 = [v8 count];

    if (v9)
    {
      id v10 = objc_alloc(&OBJC_CLASS___PKSecureElementCertificateSet);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceRegistrationTask certificates](self, "certificates"));
      id v12 = [v10 initWithDictionary:v11];

      [v12 setSupportsLegacyFormats:1];
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 certificateOfType:0]);
      if (!v13) {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 certificateOfType:1]);
      }
      [v3 setObject:v13 forKey:@"casdCertificate"];
    }

    if (-[PDNotificationServiceRegistrationTask certificateVersion](self, "certificateVersion"))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[PDNotificationServiceRegistrationTask certificateVersion](self, "certificateVersion")));
      [v3 setObject:v14 forKey:@"version"];
    }
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2048;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v11,  0x16u);
  }

  if (v7 != (id)200)
  {
    if (v7 == (id)401)
    {
      PKAnalyticsSendEvent(PKAggDKeyPaymentNotificationServicesRegistration, &off_1006912C0);
      -[PDNetworkTask setCanRequestReauthentication:](self, "setCanRequestReauthentication:", 0LL);
      -[PDNetworkTask failForAuthentication](self, "failForAuthentication");
      goto LABEL_14;
    }

    if (v7 != (id)204)
    {
      PKAnalyticsSendEvent(PKAggDKeyPaymentNotificationServicesRegistration, &off_1006912E8);
      -[PDNetworkTask fail](self, "fail");
      goto LABEL_14;
    }
  }

  PKAnalyticsSendEvent(PKAggDKeyPaymentNotificationServicesRegistration, &off_100691298);
  if ((id)-[PDNotificationServiceRegistrationTask requestedStatus](self, "requestedStatus") == (id)1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceRegistrationTask _authenticationTokenFromResponseData:]( self,  "_authenticationTokenFromResponseData:",  v6));
    if (v10)
    {
      -[PDNetworkTask deliverResult:](self, "deliverResult:", v10);
      -[PDNetworkTask succeed](self, "succeed");
    }

    else
    {
      -[PDNetworkTask fail](self, "fail");
    }
  }

  else
  {
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
  if ((id)-[PDNotificationServiceRegistrationTask requestedStatus](self, "requestedStatus") == (id)1) {
    v3 = @"Register";
  }
  else {
    v3 = @"Unregister";
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  if ([v4 serviceType]) {
    objc_super v5 = @"Messages";
  }
  else {
    objc_super v5 = @"Transactions";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceURL]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 registrationURL]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ Task (Device ID: %@, Service URL: %@, Registration URL: %@)",  v3,  v5,  v7,  v9,  v11));

  return v12;
}

- (BOOL)backoffComplete
{
  if ((id)-[PDNotificationServiceRegistrationTask requestedStatus](self, "requestedStatus") != (id)1) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDNotificationServiceRegistrationTask;
  return -[PDNetworkTask backoffComplete](&v4, "backoffComplete");
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
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDNotificationServiceRegistrationTask;
  int64_t v5 = -[PDNetworkTask actionForInactiveTask:](&v15, "actionForInactiveTask:", v4);
  if (sub_10027AA80(self, v4))
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceRegistrationTask, v6);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      id v9 = [v4 requestedStatus];
      uint64_t v11 = objc_opt_class(self, v10);
      if (v11 == objc_opt_class(v4, v12)
        || (id)-[PDNotificationServiceRegistrationTask requestedStatus](self, "requestedStatus") != v9)
      {
        int64_t v5 = 1LL;
        goto LABEL_11;
      }

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDNotificationServiceRegistrationTask;
  if (-[PDNotificationServiceConnectionTask matchesTask:](&v10, "matchesTask:", v4)
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceRegistrationTask, v5),
        (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    id v7 = [v4 requestedStatus];
    BOOL v8 = (id)-[PDNotificationServiceRegistrationTask requestedStatus](self, "requestedStatus") == v7;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_authenticationTokenFromResponseData:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v15 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v15));
  id v5 = v15;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) == 0)
  {
    id v12 = 0LL;
LABEL_7:
    if (v5) {
      -[PDNetworkTask reportError:](self, "reportError:", v5);
    }
    goto LABEL_9;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  id v14 = 0LL;
  uint64_t v10 = PDTypecheckObjectForKey(v4, @"response", @"authenticationToken", v9, 1LL, &v14);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  id v12 = v14;

  id v5 = (id)v11;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_9:

  return v12;
}

- (unint64_t)requestedStatus
{
  return self->_requestedStatus;
}

- (void)setRequestedStatus:(unint64_t)a3
{
  self->_requestedStatus = a3;
}

- (NSString)registrationData
{
  return self->_registrationData;
}

- (void)setRegistrationData:(id)a3
{
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSDictionary)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (PDNetworkConnectionTask)completionTask
{
  return self->_completionTask;
}

- (void)setCompletionTask:(id)a3
{
}

- (unint64_t)certificateVersion
{
  return self->_certificateVersion;
}

- (void)setCertificateVersion:(unint64_t)a3
{
  self->_certificateVersion = a3;
}

- (void).cxx_destruct
{
}

@end