@interface AUNotificationRequest
+ (BOOL)supportsSecureCoding;
- (AUNotificationRequest)initWithCoder:(id)a3;
- (NSString)accessoryName;
- (id)initUnplugReplugNotificationWithAccessoryName:(id)a3;
- (int64_t)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation AUNotificationRequest

- (id)initUnplugReplugNotificationWithAccessoryName:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AUNotificationRequest;
  v4 = -[AUNotificationRequest init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = 1LL;
    v4->_accessoryName = (NSString *)[a3 copy];
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AUNotificationRequest;
  -[AUNotificationRequest dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AUNotificationRequest)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AUNotificationRequest;
  v4 = -[AUNotificationRequest init](&v6, sel_init);
  if (v4)
  {
    v4->_accessoryName = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"accessoryName"),  "copy");
    v4->_type = [a3 decodeIntegerForKey:@"type"];
  }

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

@end