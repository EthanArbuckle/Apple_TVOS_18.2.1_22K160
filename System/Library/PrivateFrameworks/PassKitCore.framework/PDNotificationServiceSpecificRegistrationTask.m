@interface PDNotificationServiceSpecificRegistrationTask
+ (BOOL)supportsSecureCoding;
+ (id)deregisterTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4;
+ (id)registerTaskWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 dpanIdentifier:(id)a8 completionTask:(id)a9;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4;
- (NSString)dpanIdentifier;
- (PDNotificationServiceSpecificRegistrationTask)initWithCoder:(id)a3;
- (PDNotificationServiceSpecificRegistrationTask)initWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 dpanIdentifier:(id)a8 requestedStatus:(unint64_t)a9 completionTask:(id)a10;
- (id)description;
- (id)endpointComponents;
- (int64_t)actionForInactiveTask:(id)a3;
- (int64_t)taskType;
- (void)encodeWithCoder:(id)a3;
- (void)setDPANIdentifier:(id)a3;
@end

@implementation PDNotificationServiceSpecificRegistrationTask

+ (id)registerTaskWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 dpanIdentifier:(id)a8 completionTask:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = [objc_alloc((Class)a1) initWithNotificationService:v21 registrationData:v20 signature:v19 certificates:v18 certificateVersion:a7 dpanIdentifier:v17 requeste dStatus:1 completionTask:v16];

  return v22;
}

+ (id)deregisterTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithNotificationService:v7 registrationData:0 signature:0 certificates:0 certificateVersion:0 dpanIdentifier:v6 requested Status:2 completionTask:0];

  return v8;
}

- (PDNotificationServiceSpecificRegistrationTask)initWithNotificationService:(id)a3 registrationData:(id)a4 signature:(id)a5 certificates:(id)a6 certificateVersion:(unint64_t)a7 dpanIdentifier:(id)a8 requestedStatus:(unint64_t)a9 completionTask:(id)a10
{
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDNotificationServiceSpecificRegistrationTask;
  id v18 = -[PDNotificationServiceRegistrationTask initWithNotificationService:registrationData:signature:certificates:certificateVersion:requestedStatus:completionTask:]( &v21,  "initWithNotificationService:registrationData:signature:certificates:certificateVersion:requestedStatus:completionTask:",  a3,  a4,  a5,  a6,  a7,  a9,  a10);
  id v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_dpanIdentifier, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceSpecificRegistrationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDNotificationServiceSpecificRegistrationTask;
  id v6 = -[PDNotificationServiceRegistrationTask initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"dpanIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    dpanIdentifier = v6->_dpanIdentifier;
    v6->_dpanIdentifier = (NSString *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDNotificationServiceSpecificRegistrationTask;
  id v4 = a3;
  -[PDNotificationServiceRegistrationTask encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceSpecificRegistrationTask dpanIdentifier]( self,  "dpanIdentifier",  v6.receiver,  v6.super_class));
  [v4 encodeObject:v5 forKey:@"dpanIdentifier"];
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceSpecificRegistrationTask dpanIdentifier](self, "dpanIdentifier"));
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
  return 1LL;
}

- (id)endpointComponents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PDNotificationServiceSpecificRegistrationTask dpanIdentifier](self, "dpanIdentifier"));
  BOOL v6 = (void *)v5;
  BOOL v7 = 0LL;
  if (v4 && v5)
  {
    v9[0] = @"devices";
    v9[1] = v4;
    v9[2] = @"registrations";
    v9[3] = @"dpan";
    v9[4] = v5;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 5LL));
  }

  return v7;
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
    uint64_t v5 = @"Messages";
  }
  else {
    uint64_t v5 = @"Transactions";
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceSpecificRegistrationTask dpanIdentifier](self, "dpanIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceURL]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 registrationURL]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ Task (Device ID: %@, DPAN ID: %@, Service URL: %@, Registration URL: %@)",  v3,  v5,  v7,  v8,  v10,  v12));

  return v13;
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDNotificationServiceSpecificRegistrationTask;
  int64_t v5 = -[PDNotificationServiceRegistrationTask actionForInactiveTask:](&v10, "actionForInactiveTask:", v4);
  if (sub_10027AA80(self, v4))
  {
    uint64_t v7 = objc_opt_class(v4, v6);
    if (v7 == objc_opt_class(&OBJC_CLASS___PDNotificationServiceGetUpdatesTask, v8)
      && (id)-[PDNotificationServiceRegistrationTask requestedStatus](self, "requestedStatus") == (id)2)
    {
      int64_t v5 = 5LL;
    }
  }

  return v5;
}

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDNotificationServiceSpecificRegistrationTask;
  if (-[PDNotificationServiceRegistrationTask matchesTask:](&v11, "matchesTask:", v4)
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceSpecificRegistrationTask, v5),
        (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dpanIdentifier]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceSpecificRegistrationTask dpanIdentifier](self, "dpanIdentifier"));
    unsigned __int8 v9 = [v8 isEqualToString:v7];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  unsigned int v9 = [v8 isEqual:v7];

  if (v9)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceSpecificRegistrationTask dpanIdentifier](self, "dpanIdentifier"));
    unsigned __int8 v11 = [v10 isEqualToString:v6];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end