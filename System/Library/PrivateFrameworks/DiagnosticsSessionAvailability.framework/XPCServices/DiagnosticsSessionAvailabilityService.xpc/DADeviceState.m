@interface DADeviceState
+ (BOOL)supportsSecureCoding;
- (BOOL)object:(id)a3 isEqualToObject:(id)a4;
- (DADeviceState)init;
- (DADeviceState)initWithCoder:(id)a3;
- (DADeviceState)initWithDEDDevice:(id)a3;
- (DADeviceState)initWithSerialNumber:(id)a3 attributes:(id)a4;
- (DASessionSettings)sessionSettings;
- (NSArray)errors;
- (NSArray)history;
- (NSArray)suitesAvailable;
- (NSData)testSuiteImageData;
- (NSDictionary)attributes;
- (NSNumber)progress;
- (NSNumber)suiteID;
- (NSNumber)timestamp;
- (NSString)diagnosticEventID;
- (NSString)serialNumber;
- (NSString)suiteDescription;
- (NSString)suiteName;
- (double)durationRemaining;
- (id)_stringForPhase:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)phase;
- (void)_sendChangeNotification;
- (void)_sendChangeNotificationIfNeeded;
- (void)addErrorCode:(int64_t)a3 userInfo:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)removeErrorCode:(int64_t)a3;
- (void)removeErrorCodes:(id)a3;
- (void)resetState;
- (void)setDiagnosticEventID:(id)a3;
- (void)setDurationRemaining:(double)a3;
- (void)setErrors:(id)a3;
- (void)setHistory:(id)a3;
- (void)setPhase:(int64_t)a3;
- (void)setProgress:(id)a3;
- (void)setSessionSettings:(id)a3;
- (void)setSuiteDescription:(id)a3;
- (void)setSuiteID:(id)a3;
- (void)setSuiteName:(id)a3;
- (void)setSuitesAvailable:(id)a3;
- (void)setTestSuiteImageData:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)transactionWithBlock:(id)a3;
- (void)updateWithDeviceState:(id)a3;
@end

@implementation DADeviceState

- (DADeviceState)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___DADeviceState;
  v2 = -[DADeviceState init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    v2->_phase = 0LL;
    diagnosticEventID = v2->_diagnosticEventID;
    v2->_diagnosticEventID = 0LL;

    suiteID = v3->_suiteID;
    v3->_suiteID = 0LL;

    suiteName = v3->_suiteName;
    v3->_suiteName = 0LL;

    suiteDescription = v3->_suiteDescription;
    v3->_suiteDescription = 0LL;

    suitesAvailable = v3->_suitesAvailable;
    v3->_suitesAvailable = (NSArray *)&__NSArray0__struct;

    progress = v3->_progress;
    v3->_progress = (NSNumber *)&off_10000CF50;

    v3->_durationRemaining = 0.0;
    history = v3->_history;
    v3->_history = (NSArray *)&__NSArray0__struct;

    errors = v3->_errors;
    v3->_errors = (NSArray *)&__NSArray0__struct;

    timestamp = v3->_timestamp;
    v3->_timestamp = 0LL;

    attributes = v3->_attributes;
    v3->_attributes = (NSDictionary *)&__NSDictionary0__struct;

    serialNumber = v3->_serialNumber;
    v3->_serialNumber = (NSString *)@"unknown";

    v15 = objc_opt_new(&OBJC_CLASS___DASessionSettings);
    sessionSettings = v3->_sessionSettings;
    v3->_sessionSettings = v15;

    v3->_pendingChanges = 0LL;
    v3->_freezeNotifications = 0;
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.Diagnostics.deviceState.notificationQueue", 0LL);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v17;
  }

  return v3;
}

- (DADeviceState)initWithSerialNumber:(id)a3 attributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[DADeviceState init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serialNumber, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
  }

  return v10;
}

- (DADeviceState)initWithDEDDevice:(id)a3
{
  id v4 = a3;
  v5 = -[DADeviceState init](self, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 model]);
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v6;

    v20[0] = @"productClass";
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceClass]);
    v21[0] = v19;
    v20[1] = @"IMEI";
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v21[1] = v8;
    v20[2] = @"marketingName";
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    v21[2] = v9;
    v20[3] = @"deviceType";
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 productType]);
    v21[3] = v10;
    v20[4] = @"deviceClass";
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceClass]);
    v21[4] = v11;
    v20[5] = @"deviceEnclosureColor";
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 enclosureColor]);
    v13 = v12;
    if (!v12) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v21[5] = v13;
    v20[6] = @"deviceColor";
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 color]);
    v15 = v14;
    if (!v14) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v21[6] = v15;
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  7LL));
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v16;

    if (!v14) {
    if (!v12)
    }
  }

  return v5;
}

- (DADeviceState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[DADeviceState init](self, "init");
  if (v5)
  {
    v5->_phase = (int64_t)[v4 decodeIntegerForKey:@"phase"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"diagnosticEventID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    diagnosticEventID = v5->_diagnosticEventID;
    v5->_diagnosticEventID = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"suiteID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    suiteID = v5->_suiteID;
    v5->_suiteID = (NSNumber *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"suiteName"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    suiteName = v5->_suiteName;
    v5->_suiteName = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"suiteDescription"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    suiteDescription = v5->_suiteDescription;
    v5->_suiteDescription = (NSString *)v16;

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
    v19 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v18,  objc_opt_class(&OBJC_CLASS___ASTSuite),  0LL);
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"suitesAvailable"]);
    suitesAvailable = v5->_suitesAvailable;
    v5->_suitesAvailable = (NSArray *)v21;

    id v23 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"progress"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    progress = v5->_progress;
    v5->_progress = (NSNumber *)v24;

    [v4 decodeDoubleForKey:@"durationRemaining"];
    v5->_durationRemaining = v26;
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSArray);
    v28 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v27,  objc_opt_class(&OBJC_CLASS___DAHistoryEntry),  0LL);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v29 forKey:@"history"]);
    history = v5->_history;
    v5->_history = (NSArray *)v30;

    uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSArray);
    v33 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v32,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    uint64_t v35 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v34 forKey:@"errors"]);
    errors = v5->_errors;
    v5->_errors = (NSArray *)v35;

    id v37 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"timestamp"];
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v38;

    v5->_pendingChanges = 0LL;
    id v40 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"serialNumber"];
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v41;

    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSNull);
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSArray);
    v48 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v43,  v44,  v45,  v46,  v47,  objc_opt_class(&OBJC_CLASS___NSDateComponents),  0LL);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    uint64_t v50 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v49 forKey:@"attributes"]);
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v50;

    if (!v5->_attributes)
    {
      v5->_attributes = (NSDictionary *)&__NSDictionary0__struct;
    }

    if (!v5->_serialNumber)
    {
      v5->_serialNumber = (NSString *)@"unknown";
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue( +[DASessionSettings acceptableValueClasses]( &OBJC_CLASS___DASessionSettings,  "acceptableValueClasses"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v52 forKey:@"sessionSettings"]);

    uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v53, v54) & 1) != 0)
    {
      uint64_t v55 = objc_claimAutoreleasedReturnValue( +[DASessionSettings sessionSettingsWithDictionary:]( &OBJC_CLASS___DASessionSettings,  "sessionSettingsWithDictionary:",  v53));
      sessionSettings = v5->_sessionSettings;
      v5->_sessionSettings = (DASessionSettings *)v55;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DADeviceState phase](self, "phase"), @"phase");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState diagnosticEventID](self, "diagnosticEventID"));
  [v4 encodeObject:v5 forKey:@"diagnosticEventID"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteID](self, "suiteID"));
  [v4 encodeObject:v6 forKey:@"suiteID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteName](self, "suiteName"));
  [v4 encodeObject:v7 forKey:@"suiteName"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteDescription](self, "suiteDescription"));
  [v4 encodeObject:v8 forKey:@"suiteDescription"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suitesAvailable](self, "suitesAvailable"));
  [v4 encodeObject:v9 forKey:@"suitesAvailable"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState progress](self, "progress"));
  [v4 encodeObject:v10 forKey:@"progress"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState history](self, "history"));
  [v4 encodeObject:v11 forKey:@"history"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  [v4 encodeObject:v12 forKey:@"errors"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState timestamp](self, "timestamp"));
  [v4 encodeObject:v13 forKey:@"timestamp"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState attributes](self, "attributes"));
  [v4 encodeObject:v14 forKey:@"attributes"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState serialNumber](self, "serialNumber"));
  [v4 encodeObject:v15 forKey:@"serialNumber"];

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceState sessionSettings](self, "sessionSettings"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v17 dictionary]);
  [v4 encodeObject:v16 forKey:@"sessionSettings"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[4] = self->_phase;
  id v6 = -[NSString copyWithZone:](self->_diagnosticEventID, "copyWithZone:", a3);
  uint64_t v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = -[NSNumber copyWithZone:](self->_suiteID, "copyWithZone:", a3);
  id v9 = (void *)v5[8];
  v5[8] = v8;

  id v10 = -[NSString copyWithZone:](self->_suiteName, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  id v12 = -[NSString copyWithZone:](self->_suiteDescription, "copyWithZone:", a3);
  uint64_t v13 = (void *)v5[10];
  v5[10] = v12;

  id v14 = -[NSArray copyWithZone:](self->_suitesAvailable, "copyWithZone:", a3);
  id v15 = (void *)v5[12];
  v5[12] = v14;

  id v16 = -[NSNumber copyWithZone:](self->_progress, "copyWithZone:", a3);
  id v17 = (void *)v5[13];
  v5[13] = v16;

  v5[14] = *(void *)&self->_durationRemaining;
  id v18 = -[NSArray copyWithZone:](self->_history, "copyWithZone:", a3);
  v19 = (void *)v5[16];
  v5[16] = v18;

  id v20 = -[NSArray copyWithZone:](self->_errors, "copyWithZone:", a3);
  uint64_t v21 = (void *)v5[17];
  v5[17] = v20;

  id v22 = -[NSNumber copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  id v23 = (void *)v5[18];
  v5[18] = v22;

  id v24 = -[NSDictionary copyWithZone:](self->_attributes, "copyWithZone:", a3);
  v25 = (void *)v5[6];
  v5[6] = v24;

  id v26 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  uint64_t v27 = (void *)v5[5];
  v5[5] = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[DASessionSettings dictionary](self->_sessionSettings, "dictionary"));
  id v29 = [v28 copyWithZone:a3];
  uint64_t v30 = objc_claimAutoreleasedReturnValue( +[DASessionSettings sessionSettingsWithDictionary:]( &OBJC_CLASS___DASessionSettings,  "sessionSettingsWithDictionary:",  v29));
  v31 = (void *)v5[15];
  v5[15] = v30;

  return v5;
}

- (void)setPhase:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_phase != a3)
  {
    obj->_phase = a3;
    obj->_pendingChanges |= 1uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](obj, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(obj);
}

- (void)setDiagnosticEventID:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_diagnosticEventID, v6))
  {
    objc_storeStrong((id *)&v5->_diagnosticEventID, a3);
    v5->_pendingChanges |= 0x200uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (void)setSuiteID:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_suiteID, v6))
  {
    objc_storeStrong((id *)&v5->_suiteID, a3);
    v5->_pendingChanges |= 0x400uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (void)setSuitesAvailable:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_suitesAvailable, v6))
  {
    objc_storeStrong((id *)&v5->_suitesAvailable, a3);
    v5->_pendingChanges |= 0x800uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (void)setSuiteName:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_suiteName, v6))
  {
    objc_storeStrong((id *)&v5->_suiteName, a3);
    v5->_pendingChanges |= 2uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (void)setSuiteDescription:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_suiteDescription, v6))
  {
    objc_storeStrong((id *)&v5->_suiteDescription, a3);
    v5->_pendingChanges |= 4uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (void)setProgress:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_progress, v6))
  {
    objc_storeStrong((id *)&v5->_progress, a3);
    v5->_pendingChanges |= 8uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (void)setDurationRemaining:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_durationRemaining != a3)
  {
    obj->_durationRemaining = a3;
    obj->_pendingChanges |= 0x100uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](obj, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(obj);
}

- (void)setSessionSettings:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_sessionSettings, v6))
  {
    objc_storeStrong((id *)&v5->_sessionSettings, a3);
    v5->_pendingChanges |= 0x10uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (void)setHistory:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_history, v6))
  {
    objc_storeStrong((id *)&v5->_history, a3);
    v5->_pendingChanges |= 0x20uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (void)setErrors:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_errors, v6))
  {
    objc_storeStrong((id *)&v5->_errors, a3);
    v5->_pendingChanges |= 0x40uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (void)setTimestamp:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[DADeviceState object:isEqualToObject:](v5, "object:isEqualToObject:", v5->_timestamp, v6))
  {
    objc_storeStrong((id *)&v5->_timestamp, a3);
    v5->_pendingChanges |= 0x80uLL;
    -[DADeviceState _sendChangeNotificationIfNeeded](v5, "_sendChangeNotificationIfNeeded");
  }

  objc_sync_exit(v5);
}

- (BOOL)object:(id)a3 isEqualToObject:(id)a4
{
  else {
    return 1;
  }
}

- (void)transactionWithBlock:(id)a3
{
  id v4 = (void (**)(id, _BYTE *))a3;
  v5 = -[DADeviceState copy](self, "copy");
  v5[16] = 1;
  v4[2](v4, v5);

  -[DADeviceState updateWithDeviceState:](self, "updateWithDeviceState:", v5);
}

- (void)updateWithDeviceState:(id)a3
{
  id v15 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v4->_freezeNotifications = 1;
  -[DADeviceState setPhase:](v4, "setPhase:", [v15 phase]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v15 diagnosticEventID]);
  -[DADeviceState setDiagnosticEventID:](v4, "setDiagnosticEventID:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v15 suiteID]);
  -[DADeviceState setSuiteID:](v4, "setSuiteID:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v15 suiteName]);
  -[DADeviceState setSuiteName:](v4, "setSuiteName:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v15 suiteDescription]);
  -[DADeviceState setSuiteDescription:](v4, "setSuiteDescription:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v15 suitesAvailable]);
  -[DADeviceState setSuitesAvailable:](v4, "setSuitesAvailable:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 progress]);
  -[DADeviceState setProgress:](v4, "setProgress:", v10);

  [v15 durationRemaining];
  -[DADeviceState setDurationRemaining:](v4, "setDurationRemaining:");
  v11 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionSettings]);
  -[DADeviceState setSessionSettings:](v4, "setSessionSettings:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v15 history]);
  -[DADeviceState setHistory:](v4, "setHistory:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v15 errors]);
  -[DADeviceState setErrors:](v4, "setErrors:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v15 timestamp]);
  -[DADeviceState setTimestamp:](v4, "setTimestamp:", v14);

  -[DADeviceState _sendChangeNotification](v4, "_sendChangeNotification");
  v4->_freezeNotifications = 0;
  objc_sync_exit(v4);
}

- (void)addErrorCode:(int64_t)a3 userInfo:(id)a4
{
  id v10 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DADeviceStateErrorDomain",  a3));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObject:v6]);
  -[DADeviceState setErrors:](self, "setErrors:", v9);

  objc_sync_exit(v7);
}

- (void)removeErrorCode:(int64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v5));
  -[DADeviceState removeErrorCodes:](self, "removeErrorCodes:", v4);
}

- (void)removeErrorCodes:(id)a3
{
  id v4 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  objc_sync_enter(obj);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(v11, "code", obj)));
        unsigned __int8 v13 = [v4 containsObject:v12];

        if ((v13 & 1) == 0) {
          [v6 addObject:v11];
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  id v14 = [v6 copy];
  -[DADeviceState setErrors:](self, "setErrors:", v14);

  objc_sync_exit(obj);
}

- (id)description
{
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState _stringForPhase:](self, "_stringForPhase:", -[DADeviceState phase](self, "phase")));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState diagnosticEventID](self, "diagnosticEventID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteID](self, "suiteID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteName](self, "suiteName"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suiteDescription](self, "suiteDescription"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState suitesAvailable](self, "suitesAvailable"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState progress](self, "progress"));
  -[DADeviceState durationRemaining](self, "durationRemaining");
  uint64_t v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState sessionSettings](self, "sessionSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState history](self, "history"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState errors](self, "errors"));
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState timestamp](self, "timestamp"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceState attributes](self, "attributes"));
  id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"phase: %@; diagnosticEventID: %@; suiteID: %@; suiteName: %@; suiteDescription: %@; suitesAvailable: %@; progress: %@; durationRemaining: %f; sessionSettings: %@; history: %@; errors: %@; timestamp: %@; attributes: %@",
                v18,
                v17,
                v3,
                v4,
                v5,
                v6,
                v7,
                v9,
                v10,
                v11,
                v12,
                v13,
                v14));

  return v16;
}

- (id)_stringForPhase:(int64_t)a3
{
  else {
    return *(&off_10000C670 + a3);
  }
}

- (void)_sendChangeNotificationIfNeeded
{
  if (!self->_freezeNotifications) {
    -[DADeviceState _sendChangeNotification](self, "_sendChangeNotification");
  }
}

- (void)_sendChangeNotification
{
  unint64_t pendingChanges = self->_pendingChanges;
  id v4 = -[DADeviceState copy](self, "copy");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[DADeviceStateChangeNotificationInfo infoWithChangedProperties:snapshot:]( &OBJC_CLASS___DADeviceStateChangeNotificationInfo,  "infoWithChangedProperties:snapshot:",  pendingChanges,  v4));

  self->_unint64_t pendingChanges = 0LL;
  notificationQueue = self->_notificationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000063E0;
  v8[3] = &unk_10000C650;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)notificationQueue, v8);
}

- (void)resetState
{
  id obj = self;
  objc_sync_enter(obj);
  diagnosticEventID = obj->_diagnosticEventID;
  obj->_diagnosticEventID = 0LL;

  suiteID = obj->_suiteID;
  obj->_suiteID = 0LL;

  suiteName = obj->_suiteName;
  obj->_suiteName = 0LL;

  suiteDescription = obj->_suiteDescription;
  obj->_suiteDescription = 0LL;

  suitesAvailable = obj->_suitesAvailable;
  obj->_suitesAvailable = (NSArray *)&__NSArray0__struct;

  progress = obj->_progress;
  obj->_progress = (NSNumber *)&off_10000CF50;

  obj->_durationRemaining = 0.0;
  errors = obj->_errors;
  obj->_errors = (NSArray *)&__NSArray0__struct;

  timestamp = obj->_timestamp;
  obj->_timestamp = 0LL;

  obj->_unint64_t pendingChanges = 0LL;
  obj->_freezeNotifications = 0;
  objc_sync_exit(obj);
}

- (int64_t)phase
{
  return self->_phase;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)diagnosticEventID
{
  return self->_diagnosticEventID;
}

- (NSNumber)suiteID
{
  return self->_suiteID;
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (NSString)suiteDescription
{
  return self->_suiteDescription;
}

- (NSData)testSuiteImageData
{
  return self->_testSuiteImageData;
}

- (void)setTestSuiteImageData:(id)a3
{
}

- (NSArray)suitesAvailable
{
  return self->_suitesAvailable;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (double)durationRemaining
{
  return self->_durationRemaining;
}

- (DASessionSettings)sessionSettings
{
  return self->_sessionSettings;
}

- (NSArray)history
{
  return self->_history;
}

- (NSArray)errors
{
  return self->_errors;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end