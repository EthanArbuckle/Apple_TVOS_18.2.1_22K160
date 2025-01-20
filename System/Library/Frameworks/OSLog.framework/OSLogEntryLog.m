@interface OSLogEntryLog
+ (BOOL)supportsSecureCoding;
- (NSArray)components;
- (NSString)category;
- (NSString)formatString;
- (NSString)process;
- (NSString)sender;
- (NSString)subsystem;
- (OSLogEntryLog)initWithCoder:(id)a3;
- (OSLogEntryLog)initWithDate:(id)a3 composedMessage:(id)a4 processIdentifier:(int)a5;
- (OSLogEntryLog)initWithEventProxy:(id)a3;
- (OSLogEntryLogLevel)level;
- (int)processIdentifier;
- (unint64_t)activityIdentifier;
- (unint64_t)threadIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSLogEntryLog

- (OSLogEntryLog)initWithEventProxy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___OSLogEntryLog;
  v5 = -[OSLogEntry initWithEventProxy:](&v22, sel_initWithEventProxy_, v4);
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
    uint64_t v10 = [v4 category];
    category = v5->_category;
    v5->_category = (NSString *)v10;

    uint64_t v12 = makeComponents(v4);
    components = v5->_components;
    v5->_components = (NSArray *)v12;

    uint64_t v14 = [v4 formatString];
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v14;

    uint64_t v16 = [v4 subsystem];
    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)v16;

    uint64_t v18 = [v4 logType];
    if (v18 <= 1)
    {
      if (!v18)
      {
        uint64_t v19 = 3LL;
        goto LABEL_14;
      }

      if (v18 == 1)
      {
        uint64_t v19 = 2LL;
        goto LABEL_14;
      }
    }

    else
    {
      switch(v18)
      {
        case 2LL:
          uint64_t v19 = 1LL;
          goto LABEL_14;
        case 16LL:
          uint64_t v19 = 4LL;
          goto LABEL_14;
        case 17LL:
          uint64_t v19 = 5LL;
LABEL_14:
          v5->_level = v19;
          v20 = v5;
          goto LABEL_15;
      }
    }

    uint64_t v19 = 0LL;
    goto LABEL_14;
  }

- (OSLogEntryLog)initWithDate:(id)a3 composedMessage:(id)a4 processIdentifier:(int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OSLogEntryLog;
  uint64_t v6 = -[OSLogEntry initWithDate:composedMessage:](&v10, sel_initWithDate_composedMessage_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_processIdentifier = a5;
    uint64_t v8 = v6;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___OSLogEntryLog;
  id v4 = a3;
  -[OSLogEntry encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogEntryLog activityIdentifier](self, "activityIdentifier", v13.receiver, v13.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"activityIdentifier"];

  -[OSLogEntryLog process](self, "process");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"process"];

  objc_msgSend( v4,  "encodeInt32:forKey:",  -[OSLogEntryLog processIdentifier](self, "processIdentifier"),  @"processIdentifier");
  v7 = -[OSLogEntryLog sender](self, "sender");
  [v4 encodeObject:v7 forKey:@"sender"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogEntryLog threadIdentifier](self, "threadIdentifier"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"threadIdentifier"];
  v9 = -[OSLogEntryLog category](self, "category");
  [v4 encodeObject:v9 forKey:@"category"];

  -[OSLogEntryLog components](self, "components");
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"components"];
  v11 = -[OSLogEntryLog formatString](self, "formatString");
  [v4 encodeObject:v11 forKey:@"formatString"];

  -[OSLogEntryLog subsystem](self, "subsystem");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"subsystem"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[OSLogEntryLog level](self, "level"), @"level");
}

- (OSLogEntryLog)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___OSLogEntryLog;
  v5 = -[OSLogEntry initWithCoder:](&v25, sel_initWithCoder_, v4);
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

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v12;

    uint64_t v14 = (void *)MEMORY[0x189604010];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v26 count:2];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setWithArray:v15];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"components"];
    components = v5->_components;
    v5->_components = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatString"];
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subsystem"];
    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)v21;

    v5->_level = [v4 decodeIntegerForKey:@"level"];
    v23 = v5;
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

- (NSString)category
{
  return self->_category;
}

- (NSArray)components
{
  return self->_components;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (OSLogEntryLogLevel)level
{
  return self->_level;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end