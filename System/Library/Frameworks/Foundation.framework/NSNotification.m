@interface NSNotification
+ (NSNotification)allocWithZone:(_NSZone *)a3;
+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject;
+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSDictionary)userInfo;
- (NSNotification)init;
- (NSNotification)initWithCoder:(NSCoder *)aDecoder;
- (NSNotification)initWithName:(NSNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo;
- (NSNotificationName)name;
- (id)description;
- (id)object;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSNotification

+ (NSNotification)allocWithZone:(_NSZone *)a3
{
  if (&OBJC_CLASS___NSNotification == a1) {
    a1 = (id)objc_opt_self();
  }
  return (NSNotification *)NSAllocateObject((Class)a1, 0LL, a3);
}

+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
  return (NSNotification *)(id)[objc_alloc((Class)a1) initWithName:aName object:anObject userInfo:aUserInfo];
}

- (NSNotificationName)name
{
  v4 = NSClassFromString((NSString *)@"NSNotification");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)object
{
  v4 = NSClassFromString((NSString *)@"NSNotification");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)userInfo
{
  v4 = NSClassFromString((NSString *)@"NSNotification");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)description
{
  unint64_t v3 = -[NSNotification object](self, "object");
  v4 = -[NSNotification userInfo](self, "userInfo");
  v5 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 256LL);
  uint64_t v6 = objc_opt_class();
  v7 = -[NSNotification name](self, "name");
  if (v3 | (unint64_t)v4)
  {
    if (v3)
    {
      if (v4) {
        -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"%@ %p {name = %@; object = %@; userInfo = %@}",
      }
          v6,
          self,
          v7,
          v3,
          v4);
      else {
        -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"%@ %p {name = %@; object = %@}",
      }
          v6,
          self,
          v7,
          v3,
          v10);
    }

    else
    {
      -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"%@ %p {name = %@; userInfo = %@}",
        v6,
        self,
        v7,
        v4,
        v10);
    }
  }

  else
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"%@ %p {name = %@}", v6, self, v7, v9, v10);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSNotification name](self, "name"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }

  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  BOOL v5 = -[NSString isEqual:](-[NSNotification name](self, "name"), "isEqual:", [a3 name]);
  if (!v5) {
    return v5;
  }
  id v6 = -[NSNotification object](self, "object");
  if (v6 == (id)[a3 object]) {
    LOBYTE(v5) = -[NSDictionary isEqualToDictionary:]( -[NSNotification userInfo](self, "userInfo"),  "isEqualToDictionary:",  [a3 userInfo]);
  }
  else {
LABEL_6:
  }
    LOBYTE(v5) = 0;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  char v5 = [a3 allowsKeyedCoding];
  id v6 = -[NSNotification name](self, "name");
  if ((v5 & 1) != 0)
  {
    [a3 encodeObject:v6 forKey:@"NS.name"];
    objc_msgSend(a3, "encodeObject:forKey:", -[NSNotification object](self, "object"), @"NS.object");
    objc_msgSend(a3, "encodeObject:forKey:", -[NSNotification userInfo](self, "userInfo"), @"NS.userinfo");
  }

  else
  {
    [a3 encodeObject:v6];
    objc_msgSend(a3, "encodeObject:", -[NSNotification object](self, "object"));
    objc_msgSend(a3, "encodeObject:", -[NSNotification userInfo](self, "userInfo"));
  }

- (NSNotification)initWithCoder:(NSCoder *)aDecoder
{
  if (-[NSCoder allowsKeyedCoding](aDecoder, "allowsKeyedCoding"))
  {
    id v5 = -[NSCoder decodeObjectForKey:](aDecoder, "decodeObjectForKey:", @"NS.name");
    id v6 = -[NSCoder decodeObjectForKey:](aDecoder, "decodeObjectForKey:", @"NS.object");
    id v7 = -[NSCoder decodeObjectForKey:](aDecoder, "decodeObjectForKey:", @"NS.userinfo");
  }

  else
  {
    id v5 = -[NSCoder decodeObject](aDecoder, "decodeObject");
    id v6 = -[NSCoder decodeObject](aDecoder, "decodeObject");
    id v7 = -[NSCoder decodeObject](aDecoder, "decodeObject");
  }

  return -[NSNotification initWithName:object:userInfo:](self, "initWithName:object:userInfo:", v5, v6, v7);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

+ (NSNotification)notificationWithName:(NSNotificationName)aName object:(id)anObject
{
  return (NSNotification *)(id)[objc_alloc((Class)a1) initWithName:aName object:anObject userInfo:0];
}

- (NSNotification)init
{
  unint64_t v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: should never be used",  _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v3 userInfo:0]);
  -[NSNotification initWithName:object:userInfo:](v4, v5, v6, v7, v8);
}

- (NSNotification)initWithName:(NSNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo
{
}

@end