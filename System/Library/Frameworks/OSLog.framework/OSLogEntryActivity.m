@interface OSLogEntryActivity
+ (BOOL)supportsSecureCoding;
- (NSString)process;
- (NSString)sender;
- (OSLogEntryActivity)initWithCoder:(id)a3;
- (OSLogEntryActivity)initWithEventProxy:(id)a3;
- (int)processIdentifier;
- (os_activity_id_t)parentActivityIdentifier;
- (unint64_t)activityIdentifier;
- (unint64_t)threadIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSLogEntryActivity

- (OSLogEntryActivity)initWithEventProxy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSLogEntryActivity;
  v5 = -[OSLogEntry initWithEventProxy:](&v12, sel_initWithEventProxy_, v4);
  if (v5)
  {
    v5->_activityIdentifier = [v4 activityIdentifier];
    uint64_t v6 = [v4 process];
    process = v5->_process;
    v5->_process = (NSString *)v6;

    v5->_processIdentifier = [v4 processIdentifier];
    uint64_t v8 = [v4 sender];
    sender = v5->_sender;
    v5->_sender = (NSString *)v8;

    v5->_threadIdentifier = [v4 threadIdentifier];
    v5->_parentActivityIdentifier = [v4 parentActivityIdentifier];
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OSLogEntryActivity;
  id v4 = a3;
  -[OSLogEntry encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogEntryActivity activityIdentifier](self, "activityIdentifier", v10.receiver, v10.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"activityIdentifier"];

  -[OSLogEntryActivity process](self, "process");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"process"];

  objc_msgSend( v4,  "encodeInt32:forKey:",  -[OSLogEntryActivity processIdentifier](self, "processIdentifier"),  @"processIdentifier");
  v7 = -[OSLogEntryActivity sender](self, "sender");
  [v4 encodeObject:v7 forKey:@"sender"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogEntryActivity threadIdentifier](self, "threadIdentifier"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"threadIdentifier"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogEntryActivity parentActivityIdentifier](self, "parentActivityIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"parentActivityIdentifier"];
}

- (OSLogEntryActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OSLogEntryActivity;
  v5 = -[OSLogEntry initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifier"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activityIdentifier = [v6 unsignedLongLongValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"process"];
    process = v5->_process;
    v5->_process = (NSString *)v7;

    v5->_processIdentifier = [v4 decodeInt32ForKey:@"processIdentifier"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
    sender = v5->_sender;
    v5->_sender = (NSString *)v9;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_threadIdentifier = [v11 unsignedLongLongValue];

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentActivityIdentifier"];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_parentActivityIdentifier = [v12 unsignedLongLongValue];

    v13 = v5;
  }

  return v5;
}

- (unint64_t)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSString)process
{
  return self->_process;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)sender
{
  return self->_sender;
}

- (unint64_t)threadIdentifier
{
  return self->_threadIdentifier;
}

- (os_activity_id_t)parentActivityIdentifier
{
  return self->_parentActivityIdentifier;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end