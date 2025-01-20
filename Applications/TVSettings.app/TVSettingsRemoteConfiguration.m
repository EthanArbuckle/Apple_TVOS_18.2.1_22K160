@interface TVSettingsRemoteConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)deviceName;
- (NSString)displayDescription;
- (NSString)displayName;
- (NSString)identifier;
- (NSUUID)UUID;
- (PBSVolumeButtonConfiguration)underlyingConfiguration;
- (TVSettingsRemoteConfiguration)initWithDisplayName:(id)a3 displayDescription:(id)a4 isSelected:(BOOL)a5 underlyingConfiguration:(id)a6;
- (TVSettingsRemoteConfiguration)initWithIdentifier:(id)a3 type:(int64_t)a4 displayName:(id)a5 displayDescription:(id)a6 isSelected:(BOOL)a7 underlyingConfiguration:(id)a8;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)configurationType;
- (unint64_t)hash;
@end

@implementation TVSettingsRemoteConfiguration

- (TVSettingsRemoteConfiguration)initWithDisplayName:(id)a3 displayDescription:(id)a4 isSelected:(BOOL)a5 underlyingConfiguration:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 configurationUUID]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
  v15 = -[TVSettingsRemoteConfiguration initWithIdentifier:type:displayName:displayDescription:isSelected:underlyingConfiguration:]( self,  "initWithIdentifier:type:displayName:displayDescription:isSelected:underlyingConfiguration:",  v14,  3LL,  v12,  v11,  v6,  v10);

  return v15;
}

- (TVSettingsRemoteConfiguration)initWithIdentifier:(id)a3 type:(int64_t)a4 displayName:(id)a5 displayDescription:(id)a6 isSelected:(BOOL)a7 underlyingConfiguration:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVSettingsRemoteConfiguration;
  v18 = -[TVSettingsRemoteConfiguration init](&v26, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_displayName, a5);
    objc_storeStrong((id *)&v19->_displayDescription, a6);
    v19->_isSelected = a7;
    objc_storeStrong((id *)&v19->_underlyingConfiguration, a8);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 configurationUUID]);
    UUID = v19->_UUID;
    v19->_UUID = (NSUUID *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v17 configurationName]);
    deviceName = v19->_deviceName;
    v19->_deviceName = (NSString *)v22;

    v19->_configurationType = a4;
  }

  return v19;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(&OBJC_CLASS___BSHashBuilder);
  id v4 = [v3 appendObject:self->_identifier];
  id v5 = [v3 appendObject:self->_displayName];
  id v6 = [v3 appendBool:self->_isSelected];
  id v7 = [v3 appendObject:self->_underlyingConfiguration];
  id v8 = [v3 appendObject:self->_UUID];
  id v9 = [v3 appendObject:self->_deviceName];
  id v10 = [v3 hash];

  return (unint64_t)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___TVSettingsRemoteConfiguration));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  identifier = self->_identifier;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000E8AA4;
  v39[3] = &unk_1001919C8;
  id v8 = v4;
  id v40 = v8;
  id v9 = [v6 appendObject:identifier counterpart:v39];
  displayName = self->_displayName;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000E8AAC;
  v37[3] = &unk_1001919C8;
  id v11 = v8;
  id v38 = v11;
  id v12 = [v6 appendObject:displayName counterpart:v37];
  BOOL isSelected = self->_isSelected;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000E8AB4;
  v35[3] = &unk_100191A18;
  id v14 = v11;
  id v36 = v14;
  id v15 = [v6 appendBool:isSelected counterpart:v35];
  underlyingConfiguration = self->_underlyingConfiguration;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000E8ABC;
  v33[3] = &unk_1001919C8;
  id v17 = v14;
  id v34 = v17;
  id v18 = [v6 appendObject:underlyingConfiguration counterpart:v33];
  UUID = self->_UUID;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000E8AC4;
  v31[3] = &unk_1001919C8;
  id v20 = v17;
  id v32 = v20;
  id v21 = [v6 appendObject:UUID counterpart:v31];
  deviceName = self->_deviceName;
  objc_super v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472LL;
  v28 = sub_1000E8ACC;
  v29 = &unk_1001919C8;
  id v30 = v20;
  id v23 = v20;
  id v24 = [v6 appendObject:deviceName counterpart:&v26];
  LOBYTE(deviceName) = objc_msgSend(v6, "isEqual", v26, v27, v28, v29);

  return (char)deviceName;
}

- (NSString)description
{
  return (NSString *)-[TVSettingsRemoteConfiguration succinctDescription](self, "succinctDescription");
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSettingsRemoteConfiguration descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E8B94;
  v8[3] = &unk_10018E468;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v9 = v5;
  id v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRemoteConfiguration descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemoteConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return -[TVSettingsRemoteConfiguration descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  0LL);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayDescription
{
  return self->_displayDescription;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (PBSVolumeButtonConfiguration)underlyingConfiguration
{
  return self->_underlyingConfiguration;
}

- (void).cxx_destruct
{
}

@end