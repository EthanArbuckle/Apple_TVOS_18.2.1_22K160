@interface OSLogEntrySignpost
+ (BOOL)supportsSecureCoding;
- (NSArray)components;
- (NSString)category;
- (NSString)formatString;
- (NSString)process;
- (NSString)sender;
- (NSString)signpostName;
- (NSString)subsystem;
- (OSLogEntrySignpost)initWithCoder:(id)a3;
- (OSLogEntrySignpost)initWithEventProxy:(id)a3;
- (OSLogEntrySignpostType)signpostType;
- (int)processIdentifier;
- (os_signpost_id_t)signpostIdentifier;
- (unint64_t)activityIdentifier;
- (unint64_t)threadIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSLogEntrySignpost

- (OSLogEntrySignpost)initWithEventProxy:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___OSLogEntrySignpost;
  v5 = -[OSLogEntry initWithEventProxy:](&v24, sel_initWithEventProxy_, v4);
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

    v5->_signpostIdentifier = [v4 signpostIdentifier];
    uint64_t v18 = [v4 signpostName];
    signpostName = v5->_signpostName;
    v5->_signpostName = (NSString *)v18;

    unint64_t v20 = [v4 signpostType];
    if (v20 > 2) {
      int64_t v21 = 0LL;
    }
    else {
      int64_t v21 = qword_186A012D8[v20];
    }
    v5->_signpostType = v21;
    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OSLogEntrySignpost;
  id v4 = a3;
  -[OSLogEntry encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogEntrySignpost activityIdentifier](self, "activityIdentifier", v15.receiver, v15.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"activityIdentifier"];

  -[OSLogEntrySignpost process](self, "process");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"process"];

  objc_msgSend( v4,  "encodeInt32:forKey:",  -[OSLogEntrySignpost processIdentifier](self, "processIdentifier"),  @"processIdentifier");
  v7 = -[OSLogEntrySignpost sender](self, "sender");
  [v4 encodeObject:v7 forKey:@"sender"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogEntrySignpost threadIdentifier](self, "threadIdentifier"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"threadIdentifier"];
  v9 = -[OSLogEntrySignpost category](self, "category");
  [v4 encodeObject:v9 forKey:@"category"];

  -[OSLogEntrySignpost components](self, "components");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"components"];
  v11 = -[OSLogEntrySignpost formatString](self, "formatString");
  [v4 encodeObject:v11 forKey:@"formatString"];

  -[OSLogEntrySignpost subsystem](self, "subsystem");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"subsystem"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[OSLogEntrySignpost signpostIdentifier](self, "signpostIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"signpostIdentifier"];

  -[OSLogEntrySignpost signpostName](self, "signpostName");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"signpostName"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[OSLogEntrySignpost signpostType](self, "signpostType"),  @"signpostType");
}

- (OSLogEntrySignpost)initWithCoder:(id)a3
{
  v29[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___OSLogEntrySignpost;
  v5 = -[OSLogEntry initWithCoder:](&v28, sel_initWithCoder_, v4);
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
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v29 count:2];
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
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

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostIdentifier"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_signpostIdentifier = [v23 unsignedLongLongValue];

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signpostName"];
    signpostName = v5->_signpostName;
    v5->_signpostName = (NSString *)v24;

    v5->_signpostType = [v4 decodeIntegerForKey:@"level"];
    v26 = v5;
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

- (os_signpost_id_t)signpostIdentifier
{
  return self->_signpostIdentifier;
}

- (NSString)signpostName
{
  return self->_signpostName;
}

- (OSLogEntrySignpostType)signpostType
{
  return self->_signpostType;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end