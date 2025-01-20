@interface CDDCloudKitScheduleActivityMessage
+ (BOOL)supportsSecureCoding;
- (CDDCloudKitScheduleActivityMessage)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDDCloudKitScheduleActivityMessage

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CDDCloudKitScheduleActivityMessage;
  -[CDDCloudKitMessage dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDDCloudKitScheduleActivityMessage)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CDDCloudKitScheduleActivityMessage;
  v4 = -[CDDCloudKitMessage initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_activityType = objc_msgSend( (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"activityType"),  "unsignedIntegerValue");
    v4->_storePath = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"storePath"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDDCloudKitScheduleActivityMessage;
  -[CDDCloudKitMessage encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend( a3,  "encodeObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", self->_activityType),  @"activityType");
  [a3 encodeObject:self->_storePath forKey:@"storePath"];
}

@end