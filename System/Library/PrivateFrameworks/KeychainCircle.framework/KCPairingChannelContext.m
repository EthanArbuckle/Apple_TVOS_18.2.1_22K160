@interface KCPairingChannelContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (KCPairingChannelContext)initWithCoder:(id)a3;
- (NSString)altDSID;
- (NSString)capability;
- (NSString)deviceSessionID;
- (NSString)flowID;
- (NSString)intent;
- (NSString)model;
- (NSString)modelClass;
- (NSString)modelVersion;
- (NSString)osVersion;
- (NSString)uniqueClientID;
- (NSString)uniqueDeviceID;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCapability:(id)a3;
- (void)setDeviceSessionID:(id)a3;
- (void)setFlowID:(id)a3;
- (void)setIntent:(id)a3;
- (void)setModel:(id)a3;
- (void)setModelClass:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setUniqueClientID:(id)a3;
- (void)setUniqueDeviceID:(id)a3;
@end

@implementation KCPairingChannelContext

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  model = self->_model;
  if ((unint64_t)model | v4[1])
  {
  }

  modelVersion = self->_modelVersion;
  modelClass = self->_modelClass;
  if (((osVersion = self->_osVersion, !((unint64_t)osVersion | v4[4]))
     || -[NSString isEqual:](osVersion, "isEqual:"))
    && ((uniqueDeviceID = self->_uniqueDeviceID, !((unint64_t)uniqueDeviceID | v4[5]))
     || -[NSString isEqual:](uniqueDeviceID, "isEqual:"))
    && ((altDSID = self->_altDSID, !((unint64_t)altDSID | v4[7]))
     || -[NSString isEqual:](altDSID, "isEqual:"))
    && ((uniqueClientID = self->_uniqueClientID, !((unint64_t)uniqueClientID | v4[6]))
     || -[NSString isEqual:](uniqueClientID, "isEqual:"))
    && ((intent = self->_intent, !((unint64_t)intent | v4[10]))
     || -[NSString isEqual:](intent, "isEqual:"))
    && ((capability = self->_capability, !((unint64_t)capability | v4[11]))
     || -[NSString isEqual:](capability, "isEqual:"))
    && ((flowID = self->_flowID, !((unint64_t)flowID | v4[8]))
     || -[NSString isEqual:](flowID, "isEqual:")))
  {
    else {
      char v15 = 1;
    }
  }

  else
  {
LABEL_24:
    char v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  model = self->_model;
  id v5 = a3;
  [v5 encodeObject:model forKey:@"model"];
  [v5 encodeObject:self->_modelVersion forKey:@"modelVersion"];
  [v5 encodeObject:self->_modelClass forKey:@"modelClass"];
  [v5 encodeObject:self->_osVersion forKey:@"osVersion"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v5 encodeObject:self->_uniqueDeviceID forKey:@"uniqueDeviceID"];
  [v5 encodeObject:self->_uniqueClientID forKey:@"uniqueClientID"];
  [v5 encodeObject:self->_intent forKey:@"intent"];
  [v5 encodeObject:self->_capability forKey:@"capability"];
  [v5 encodeObject:self->_flowID forKey:@"flowID"];
  [v5 encodeObject:self->_deviceSessionID forKey:@"deviceSessionID"];
}

- (KCPairingChannelContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___KCPairingChannelContext;
  id v5 = -[KCPairingChannelContext init](&v32, sel_init);
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
  model = v5->_model;
  v5->_model = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelVersion"];
  modelVersion = v5->_modelVersion;
  v5->_modelVersion = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelClass"];
  modelClass = v5->_modelClass;
  v5->_modelClass = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersion"];
  osVersion = v5->_osVersion;
  v5->_osVersion = (NSString *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v14;

  uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueDeviceID"];
  uniqueDeviceID = v5->_uniqueDeviceID;
  v5->_uniqueDeviceID = (NSString *)v16;

  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueClientID"];
  uniqueClientID = v5->_uniqueClientID;
  v5->_uniqueClientID = (NSString *)v18;

  uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  intent = v5->_intent;
  v5->_intent = (NSString *)v20;

  uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capability"];
  capability = v5->_capability;
  v5->_capability = (NSString *)v22;

  uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flowID"];
  flowID = v5->_flowID;
  v5->_flowID = (NSString *)v24;

  uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceSessionID"];
  deviceSessionID = v5->_deviceSessionID;
  v5->_deviceSessionID = (NSString *)v26;

  v28 = v5->_intent;
  if (v28)
  {
    if (!-[NSString isEqualToString:](v28, "isEqualToString:", @"none")
      && !-[NSString isEqualToString:](v5->_intent, "isEqualToString:", @"repair")
      && !-[NSString isEqualToString:](v5->_intent, "isEqualToString:", @"userdriven"))
    {
      goto LABEL_11;
    }
  }

  v29 = v5->_capability;
  if (!v29
    || -[NSString isEqualToString:](v29, "isEqualToString:", @"full")
    || -[NSString isEqualToString:](v5->_capability, "isEqualToString:", @"limited"))
  {
LABEL_9:
    v30 = v5;
  }

  else
  {
LABEL_11:
    v30 = 0LL;
  }

  return v30;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelClass
{
  return self->_modelClass;
}

- (void)setModelClass:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)uniqueDeviceID
{
  return self->_uniqueDeviceID;
}

- (void)setUniqueDeviceID:(id)a3
{
}

- (NSString)uniqueClientID
{
  return self->_uniqueClientID;
}

- (void)setUniqueClientID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)flowID
{
  return self->_flowID;
}

- (void)setFlowID:(id)a3
{
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (void)setDeviceSessionID:(id)a3
{
}

- (NSString)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
}

- (NSString)capability
{
  return self->_capability;
}

- (void)setCapability:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end