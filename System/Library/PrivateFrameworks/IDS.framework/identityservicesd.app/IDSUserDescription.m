@interface IDSUserDescription
+ (BOOL)supportsSecureCoding;
- (IDSUser)user;
- (IDSUserDescription)initWithCoder:(id)a3;
- (IDSUserDescription)initWithUser:(id)a3 properties:(id)a4;
- (IDSUserProperties)properties;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProperties:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation IDSUserDescription

- (IDSUserDescription)initWithUser:(id)a3 properties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSUserDescription;
  v9 = -[IDSUserDescription init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_storeStrong((id *)&v10->_properties, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSUserDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSPhoneUser, v5);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___IDSAppleUser, v7);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___IDSTemporaryPhoneUser, v9);
  objc_super v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v8,  v10,  objc_opt_class(&OBJC_CLASS___IDSDeviceUser, v11),  0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v13 forKey:@"user"]);

  id v16 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(IDSUserProperties, v15),  @"prop");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = -[IDSUserDescription initWithUser:properties:](self, "initWithUser:properties:", v14, v17);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  user = self->_user;
  id v5 = a3;
  [v5 encodeObject:user forKey:@"user"];
  [v5 encodeObject:self->_properties forKey:@"prop"];
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, user: %@, properties: %@>",  objc_opt_class(self, a2),  self,  self->_user,  self->_properties);
}

- (IDSUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (IDSUserProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end