@interface PDAccountServicingTokenUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierWithAccount:(id)a3;
- (BOOL)isValid;
- (PDAccountServicingTokenUserNotification)initWithAccount:(id)a3 servicingToken:(id)a4 expirationDate:(id)a5;
- (PDAccountServicingTokenUserNotification)initWithCoder:(id)a3;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountServicingTokenUserNotification

+ (id)notificationIdentifierWithAccount:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);

  v6 = -[NSString initWithFormat:](v4, "initWithFormat:", @"servicingToken-%@", v5);
  return v6;
}

- (PDAccountServicingTokenUserNotification)initWithAccount:(id)a3 servicingToken:(id)a4 expirationDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "notificationIdentifierWithAccount:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 associatedPassUniqueID]);

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDAccountServicingTokenUserNotification;
  v15 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v19,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v13,  v14);
  if (v15)
  {
    v16 = (NSString *)[v8 copy];
    servicingToken = v15->_servicingToken;
    v15->_servicingToken = v16;

    objc_storeStrong((id *)&v15->_expirationDate, a5);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountServicingTokenUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDAccountServicingTokenUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"servicingToken");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    servicingToken = v6->_servicingToken;
    v6->_servicingToken = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v10),  @"expirationDate");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountServicingTokenUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_servicingToken, @"servicingToken", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (unint64_t)notificationType
{
  return 39LL;
}

- (BOOL)isValid
{
  if (!-[NSString length](self->_servicingToken, "length")) {
    return 0;
  }
  expirationDate = self->_expirationDate;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v5 = (id)-[NSDate compare:](expirationDate, "compare:", v4) == (id)1;

  return v5;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDAccountServicingTokenUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", a3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountServicingTokenUserNotification _titleString](self, "_titleString"));
  [v5 setSubtitle:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountServicingTokenUserNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  [v5 setExpirationDate:self->_expirationDate];
  return v5;
}

- (id)_titleString
{
  return (id)PKLocalizedMadisonString(@"SERVICING_TOKEN_NOTIFICATION_TITLE");
}

- (id)_messageString
{
  return (id)PKLocalizedMadisonString( @"SERVICING_TOKEN_NOTIFICATION_BODY",  @"%@",  self->_servicingToken);
}

- (void).cxx_destruct
{
}

@end