@interface PDGenericUserNotification
+ (BOOL)supportsSecureCoding;
- (NSString)message;
- (NSString)subtitle;
- (NSString)title;
- (PDGenericUserNotification)initWithCoder:(id)a3;
- (PDGenericUserNotification)initWithMessage:(id)a3;
- (PDGenericUserNotification)initWithMessage:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PDGenericUserNotification)initWithTitle:(id)a3 message:(id)a4;
- (PDGenericUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PDGenericUserNotification)initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5;
- (id)_initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 forPassUniqueIdentifier:(id)a6;
- (id)_initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 forPassUniqueIdentifier:(id)a6 hashComponents:(id)a7;
- (id)description;
- (id)notificationContentWithDataSource:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDGenericUserNotification

- (PDGenericUserNotification)initWithMessage:(id)a3
{
  return (PDGenericUserNotification *)-[PDGenericUserNotification _initWithTitle:subtitle:message:forPassUniqueIdentifier:]( self,  "_initWithTitle:subtitle:message:forPassUniqueIdentifier:",  0LL,  0LL,  a3,  0LL);
}

- (PDGenericUserNotification)initWithTitle:(id)a3 message:(id)a4
{
  return (PDGenericUserNotification *)-[PDGenericUserNotification _initWithTitle:subtitle:message:forPassUniqueIdentifier:]( self,  "_initWithTitle:subtitle:message:forPassUniqueIdentifier:",  a3,  0LL,  a4,  0LL);
}

- (PDGenericUserNotification)initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5
{
  return (PDGenericUserNotification *)-[PDGenericUserNotification _initWithTitle:subtitle:message:forPassUniqueIdentifier:]( self,  "_initWithTitle:subtitle:message:forPassUniqueIdentifier:",  a3,  a4,  a5,  0LL);
}

- (PDGenericUserNotification)initWithMessage:(id)a3 forPassUniqueIdentifier:(id)a4
{
  return (PDGenericUserNotification *)-[PDGenericUserNotification _initWithTitle:subtitle:message:forPassUniqueIdentifier:]( self,  "_initWithTitle:subtitle:message:forPassUniqueIdentifier:",  0LL,  0LL,  a3,  a4);
}

- (PDGenericUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5
{
  return (PDGenericUserNotification *)-[PDGenericUserNotification _initWithTitle:subtitle:message:forPassUniqueIdentifier:]( self,  "_initWithTitle:subtitle:message:forPassUniqueIdentifier:",  a3,  0LL,  a4,  a5);
}

- (id)_initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 forPassUniqueIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v14 safelyAddObject:v13];
  [v14 safelyAddObject:v12];
  [v14 safelyAddObject:v11];
  [v14 safelyAddObject:v10];
  id v15 = -[PDGenericUserNotification _initWithTitle:subtitle:message:forPassUniqueIdentifier:hashComponents:]( self,  "_initWithTitle:subtitle:message:forPassUniqueIdentifier:hashComponents:",  v13,  v12,  v11,  v10,  v14);

  return v15;
}

- (id)_initWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 forPassUniqueIdentifier:(id)a6 hashComponents:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v16 count])
  {
    uint64_t v17 = PKCombinedHash(PKHashStartingValue, v16);
    v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  PKIntegerHash(v17, -[PDUserNotification notificationType](self, "notificationType")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v28.receiver = self;
    v28.super_class = (Class)&OBJC_CLASS___PDGenericUserNotification;
    v20 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v28,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v19,  v15);
    if (v20)
    {
      v21 = (NSString *)[v12 copy];
      title = v20->_title;
      v20->_title = v21;

      v23 = (NSString *)[v13 copy];
      subtitle = v20->_subtitle;
      v20->_subtitle = v23;

      v25 = (NSString *)[v14 copy];
      message = v20->_message;
      v20->_message = v25;
    }
  }

  else
  {

    v20 = 0LL;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDGenericUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDGenericUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v19, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"title");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    title = v6->_title;
    v6->_title = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"subtitle");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    subtitle = v6->_subtitle;
    v6->_subtitle = (NSString *)v12;

    id v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v14), @"message");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    message = v6->_message;
    v6->_message = (NSString *)v16;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDGenericUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v4 encodeObject:self->_message forKey:@"message"];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PDGenericUserNotification;
  id v3 = -[PDUserNotification description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@ Title: %@, Subtitle: %@, Message: %@]",  v4,  self->_title,  self->_subtitle,  self->_message));

  return v5;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PDGenericUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v7, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 setTitle:self->_title];
  [v5 setSubtitle:self->_subtitle];
  [v5 setBody:self->_message];
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end