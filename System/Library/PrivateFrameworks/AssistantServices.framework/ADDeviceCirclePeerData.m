@interface ADDeviceCirclePeerData
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceCirclePeerData)init;
- (ADDeviceCirclePeerData)initWithAceVersion:(id)a3 assistantIdentifier:(id)a4 buildVersion:(id)a5 productType:(id)a6 sharedUserIdentifier:(id)a7 userAssignedDeviceName:(id)a8 userInterfaceIdiom:(id)a9 isLocationSharingDevice:(id)a10 homeAccessoryInfo:(id)a11 isSiriCloudSyncEnabled:(id)a12 myriadTrialTreatment:(id)a13;
- (ADDeviceCirclePeerData)initWithBuilder:(id)a3;
- (ADDeviceCirclePeerData)initWithCoder:(id)a3;
- (ADDeviceCirclePeerData)initWithDictionaryRepresentation:(id)a3;
- (AFHomeAccessoryInfo)homeAccessoryInfo;
- (BOOL)isEqual:(id)a3;
- (NSNumber)isLocationSharingDevice;
- (NSNumber)isSiriCloudSyncEnabled;
- (NSString)aceVersion;
- (NSString)assistantIdentifier;
- (NSString)buildVersion;
- (NSString)description;
- (NSString)myriadTrialTreatment;
- (NSString)productType;
- (NSString)sharedUserIdentifier;
- (NSString)userAssignedDeviceName;
- (NSString)userInterfaceIdiom;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceCirclePeerData

- (ADDeviceCirclePeerData)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADDeviceCirclePeerDataMutation *))a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___ADDeviceCirclePeerData;
  v5 = -[ADDeviceCirclePeerData init](&v42, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADDeviceCirclePeerDataMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceCirclePeerDataMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADDeviceCirclePeerDataMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getAceVersion](v7, "getAceVersion"));
      v9 = (NSString *)[v8 copy];
      aceVersion = v6->_aceVersion;
      v6->_aceVersion = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getAssistantIdentifier](v7, "getAssistantIdentifier"));
      v12 = (NSString *)[v11 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getBuildVersion](v7, "getBuildVersion"));
      v15 = (NSString *)[v14 copy];
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getProductType](v7, "getProductType"));
      v18 = (NSString *)[v17 copy];
      productType = v6->_productType;
      v6->_productType = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getSharedUserIdentifier](v7, "getSharedUserIdentifier"));
      v21 = (NSString *)[v20 copy];
      sharedUserIdentifier = v6->_sharedUserIdentifier;
      v6->_sharedUserIdentifier = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getUserAssignedDeviceName](v7, "getUserAssignedDeviceName"));
      v24 = (NSString *)[v23 copy];
      userAssignedDeviceName = v6->_userAssignedDeviceName;
      v6->_userAssignedDeviceName = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getUserInterfaceIdiom](v7, "getUserInterfaceIdiom"));
      v27 = (NSString *)[v26 copy];
      userInterfaceIdiom = v6->_userInterfaceIdiom;
      v6->_userInterfaceIdiom = v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getIsLocationSharingDevice](v7, "getIsLocationSharingDevice"));
      v30 = (NSNumber *)[v29 copy];
      isLocationSharingDevice = v6->_isLocationSharingDevice;
      v6->_isLocationSharingDevice = v30;

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getHomeAccessoryInfo](v7, "getHomeAccessoryInfo"));
      v33 = (AFHomeAccessoryInfo *)[v32 copy];
      homeAccessoryInfo = v6->_homeAccessoryInfo;
      v6->_homeAccessoryInfo = v33;

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getIsSiriCloudSyncEnabled](v7, "getIsSiriCloudSyncEnabled"));
      v36 = (NSNumber *)[v35 copy];
      isSiriCloudSyncEnabled = v6->_isSiriCloudSyncEnabled;
      v6->_isSiriCloudSyncEnabled = v36;

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getMyriadTrialTreatment](v7, "getMyriadTrialTreatment"));
      v39 = (NSString *)[v38 copy];
      myriadTrialTreatment = v6->_myriadTrialTreatment;
      v6->_myriadTrialTreatment = v39;
    }
  }

  return v6;
}

- (ADDeviceCirclePeerData)init
{
  return -[ADDeviceCirclePeerData initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADDeviceCirclePeerData)initWithAceVersion:(id)a3 assistantIdentifier:(id)a4 buildVersion:(id)a5 productType:(id)a6 sharedUserIdentifier:(id)a7 userAssignedDeviceName:(id)a8 userInterfaceIdiom:(id)a9 isLocationSharingDevice:(id)a10 homeAccessoryInfo:(id)a11 isSiriCloudSyncEnabled:(id)a12 myriadTrialTreatment:(id)a13
{
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10015B594;
  v32[3] = &unk_1004F32A8;
  id v33 = a3;
  id v34 = a4;
  id v35 = a5;
  id v36 = a6;
  id v37 = a7;
  id v38 = a8;
  id v39 = a9;
  id v40 = a10;
  id v41 = a11;
  id v42 = a12;
  id v43 = a13;
  id v30 = v43;
  id v29 = v42;
  id v18 = v41;
  id v19 = v40;
  id v20 = v39;
  id v21 = v38;
  id v22 = v37;
  id v23 = v36;
  id v24 = v35;
  id v25 = v34;
  id v26 = v33;
  v27 = -[ADDeviceCirclePeerData initWithBuilder:](self, "initWithBuilder:", v32);

  return v27;
}

- (NSString)description
{
  return (NSString *)-[ADDeviceCirclePeerData _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADDeviceCirclePeerData;
  v5 = -[ADDeviceCirclePeerData description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {aceVersion = %@, assistantIdentifier = %@, buildVersion = %@, productType = %@, sharedUserIdentifier = %@, userAssignedDeviceName = %@, userInterfaceIdiom = %@, isLocationSharingDevice = %@, homeAccessoryInfo = %@ isSiriCloudSyncEnabled = %@ trialTreatment = %@}",  v6,  self->_aceVersion,  self->_assistantIdentifier,  self->_buildVersion,  self->_productType,  self->_sharedUserIdentifier,  self->_userAssignedDeviceName,  self->_userInterfaceIdiom,  self->_isLocationSharingDevice,  self->_homeAccessoryInfo,  self->_isSiriCloudSyncEnabled,  self->_myriadTrialTreatment);

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_aceVersion, "hash");
  unint64_t v4 = -[NSString hash](self->_assistantIdentifier, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_buildVersion, "hash");
  unint64_t v6 = v4 ^ v5 ^ -[NSString hash](self->_productType, "hash");
  NSUInteger v7 = -[NSString hash](self->_sharedUserIdentifier, "hash");
  unint64_t v8 = v7 ^ -[NSString hash](self->_userAssignedDeviceName, "hash");
  unint64_t v9 = v6 ^ v8 ^ -[NSString hash](self->_userInterfaceIdiom, "hash");
  unint64_t v10 = (unint64_t)-[NSNumber hash](self->_isLocationSharingDevice, "hash");
  unint64_t v11 = v10 ^ (unint64_t)-[AFHomeAccessoryInfo hash](self->_homeAccessoryInfo, "hash");
  unint64_t v12 = v11 ^ (unint64_t)-[NSNumber hash](self->_isSiriCloudSyncEnabled, "hash");
  return v9 ^ v12 ^ -[NSString hash](self->_myriadTrialTreatment, "hash");
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ADDeviceCirclePeerData *)a3;
  if (self == v4)
  {
    BOOL v31 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADDeviceCirclePeerData);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      NSUInteger v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData aceVersion](v6, "aceVersion"));
      aceVersion = self->_aceVersion;
      if (aceVersion == v7 || -[NSString isEqual:](aceVersion, "isEqual:", v7))
      {
        unint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData assistantIdentifier](v6, "assistantIdentifier"));
        assistantIdentifier = self->_assistantIdentifier;
        if (assistantIdentifier == v9 || -[NSString isEqual:](assistantIdentifier, "isEqual:", v9))
        {
          unint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData buildVersion](v6, "buildVersion"));
          buildVersion = self->_buildVersion;
          if (buildVersion == v11 || -[NSString isEqual:](buildVersion, "isEqual:", v11))
          {
            v13 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData productType](v6, "productType"));
            productType = self->_productType;
            if (productType == v13 || -[NSString isEqual:](productType, "isEqual:", v13))
            {
              v15 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData sharedUserIdentifier](v6, "sharedUserIdentifier"));
              sharedUserIdentifier = self->_sharedUserIdentifier;
              if (sharedUserIdentifier == v15
                || -[NSString isEqual:](sharedUserIdentifier, "isEqual:", v15))
              {
                v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData userAssignedDeviceName](v6, "userAssignedDeviceName"));
                userAssignedDeviceName = self->_userAssignedDeviceName;
                if (userAssignedDeviceName == v17
                  || -[NSString isEqual:](userAssignedDeviceName, "isEqual:", v17))
                {
                  id v19 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData userInterfaceIdiom](v6, "userInterfaceIdiom"));
                  userInterfaceIdiom = self->_userInterfaceIdiom;
                  if (userInterfaceIdiom == v19
                    || -[NSString isEqual:](userInterfaceIdiom, "isEqual:", v19))
                  {
                    id v35 = v19;
                    id v21 = (NSNumber *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData isLocationSharingDevice](v6, "isLocationSharingDevice"));
                    isLocationSharingDevice = self->_isLocationSharingDevice;
                    if (isLocationSharingDevice == v21
                      || -[NSNumber isEqual:](isLocationSharingDevice, "isEqual:", v21))
                    {
                      id v34 = v21;
                      id v23 = (AFHomeAccessoryInfo *)objc_claimAutoreleasedReturnValue( -[ADDeviceCirclePeerData homeAccessoryInfo]( v6,  "homeAccessoryInfo"));
                      homeAccessoryInfo = self->_homeAccessoryInfo;
                      if (homeAccessoryInfo == v23
                        || -[AFHomeAccessoryInfo isEqual:](homeAccessoryInfo, "isEqual:", v23))
                      {
                        id v33 = v23;
                        id v25 = (NSNumber *)objc_claimAutoreleasedReturnValue( -[ADDeviceCirclePeerData isSiriCloudSyncEnabled]( v6,  "isSiriCloudSyncEnabled"));
                        isSiriCloudSyncEnabled = self->_isSiriCloudSyncEnabled;
                        if (isSiriCloudSyncEnabled == v25
                          || -[NSNumber isEqual:](isSiriCloudSyncEnabled, "isEqual:", v25))
                        {
                          v27 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData myriadTrialTreatment](v6, "myriadTrialTreatment"));
                          myriadTrialTreatment = self->_myriadTrialTreatment;
                          BOOL v31 = 1;
                          if (myriadTrialTreatment != v27)
                          {
                            id v29 = v27;
                            unsigned int v30 = -[NSString isEqual:](myriadTrialTreatment, "isEqual:", v27);
                            v27 = v29;
                            if (!v30) {
                              BOOL v31 = 0;
                            }
                          }
                        }

                        else
                        {
                          BOOL v31 = 0;
                        }

                        id v23 = v33;
                      }

                      else
                      {
                        BOOL v31 = 0;
                      }

                      id v21 = v34;
                    }

                    else
                    {
                      BOOL v31 = 0;
                    }

                    id v19 = v35;
                  }

                  else
                  {
                    BOOL v31 = 0;
                  }
                }

                else
                {
                  BOOL v31 = 0;
                }
              }

              else
              {
                BOOL v31 = 0;
              }
            }

            else
            {
              BOOL v31 = 0;
            }
          }

          else
          {
            BOOL v31 = 0;
          }
        }

        else
        {
          BOOL v31 = 0;
        }
      }

      else
      {
        BOOL v31 = 0;
      }
    }

    else
    {
      BOOL v31 = 0;
    }
  }

  return v31;
}

- (ADDeviceCirclePeerData)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceCirclePeerData::aceVersion"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceCirclePeerData::assistantIdentifier"];
  NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceCirclePeerData::buildVersion"];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceCirclePeerData::productType"];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceCirclePeerData::sharedUserIdentifier"];
  v28 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v13 = [v3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceCirclePeerData::userAssignedDeviceName"];
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v14 = [v3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceCirclePeerData::userInterfaceIdiom"];
  id v24 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v15 = [v3 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADDeviceCirclePeerData::isLocationSharingDevice"];
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = [v3 decodeObjectOfClass:objc_opt_class(AFHomeAccessoryInfo) forKey:@"ADDeviceCirclePeerData::homeAccessoryInfo"];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = [v3 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADDeviceCirclePeerData::isSiriCloudSyncEnabled"];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = [v3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ADDeviceCirclePeerData::myriadTrialTreatment"];
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v27 = -[ADDeviceCirclePeerData initWithAceVersion:assistantIdentifier:buildVersion:productType:sharedUserIdentifier:userAssignedDeviceName:userInterfaceIdiom:isLocationSharingDevice:homeAccessoryInfo:isSiriCloudSyncEnabled:myriadTrialTreatment:]( self,  "initWithAceVersion:assistantIdentifier:buildVersion:productType:sharedUserIdentifier:userAssignedDeviceName:us erInterfaceIdiom:isLocationSharingDevice:homeAccessoryInfo:isSiriCloudSyncEnabled:myriadTrialTreatment:",  v5,  v7,  v9,  v11,  v28,  v25,  v24,  v16,  v18,  v20,  v22);
  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  aceVersion = self->_aceVersion;
  id v5 = a3;
  [v5 encodeObject:aceVersion forKey:@"ADDeviceCirclePeerData::aceVersion"];
  [v5 encodeObject:self->_assistantIdentifier forKey:@"ADDeviceCirclePeerData::assistantIdentifier"];
  [v5 encodeObject:self->_buildVersion forKey:@"ADDeviceCirclePeerData::buildVersion"];
  [v5 encodeObject:self->_productType forKey:@"ADDeviceCirclePeerData::productType"];
  [v5 encodeObject:self->_sharedUserIdentifier forKey:@"ADDeviceCirclePeerData::sharedUserIdentifier"];
  [v5 encodeObject:self->_userAssignedDeviceName forKey:@"ADDeviceCirclePeerData::userAssignedDeviceName"];
  [v5 encodeObject:self->_userInterfaceIdiom forKey:@"ADDeviceCirclePeerData::userInterfaceIdiom"];
  [v5 encodeObject:self->_isLocationSharingDevice forKey:@"ADDeviceCirclePeerData::isLocationSharingDevice"];
  [v5 encodeObject:self->_homeAccessoryInfo forKey:@"ADDeviceCirclePeerData::homeAccessoryInfo"];
  [v5 encodeObject:self->_isSiriCloudSyncEnabled forKey:@"ADDeviceCirclePeerData::isSiriCloudSyncEnabled"];
  [v5 encodeObject:self->_myriadTrialTreatment forKey:@"ADDeviceCirclePeerData::myriadTrialTreatment"];
}

- (ADDeviceCirclePeerData)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"aceVersion"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
      id v41 = v6;
    }
    else {
      id v41 = 0LL;
    }

    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"assistantIdentifier"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
      id v40 = v9;
    }
    else {
      id v40 = 0LL;
    }

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"buildVersion"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
      id v39 = v11;
    }
    else {
      id v39 = 0LL;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"productType"]);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
      id v38 = v13;
    }
    else {
      id v38 = 0LL;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"sharedUserIdentifier"]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
      id v37 = v15;
    }
    else {
      id v37 = 0LL;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"userAssignedDeviceName"]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
      id v19 = v17;
    }
    else {
      id v19 = 0LL;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"userInterfaceIdiom"]);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
      id v22 = v20;
    }
    else {
      id v22 = 0LL;
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"isLocationSharingDevice"]);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0) {
      id v25 = v23;
    }
    else {
      id v25 = 0LL;
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"homeAccessoryInfo"]);
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0) {
      v28 = -[AFHomeAccessoryInfo initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___AFHomeAccessoryInfo),  "initWithDictionaryRepresentation:",  v26);
    }
    else {
      v28 = 0LL;
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"isSiriCloudSyncEnabled"]);
    uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0) {
      id v31 = v29;
    }
    else {
      id v31 = 0LL;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"trialTreatment"]);
    uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0) {
      id v34 = v32;
    }
    else {
      id v34 = 0LL;
    }

    id v36 =  -[ADDeviceCirclePeerData initWithAceVersion:assistantIdentifier:buildVersion:productType:sharedUserIdentifier:userAssignedDeviceName:userInterfaceIdiom:isLocationSharingDevice:homeAccessoryInfo:isSiriCloudSyncEnabled:myriadTrialTreatment:]( self,  "initWithAceVersion:assistantIdentifier:buildVersion:productType:sharedUserIdentifier:userAssignedDeviceNam e:userInterfaceIdiom:isLocationSharingDevice:homeAccessoryInfo:isSiriCloudSyncEnabled:myriadTrialTreatment:",  v41,  v40,  v39,  v38,  v37,  v19,  v22,  v25,  v28,  v31,  v34);
    self = v36;

    id v8 = v36;
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = v3;
  aceVersion = self->_aceVersion;
  if (aceVersion) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", aceVersion, @"aceVersion");
  }
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", assistantIdentifier, @"assistantIdentifier");
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", buildVersion, @"buildVersion");
  }
  productType = self->_productType;
  if (productType) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", productType, @"productType");
  }
  sharedUserIdentifier = self->_sharedUserIdentifier;
  if (sharedUserIdentifier) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  sharedUserIdentifier,  @"sharedUserIdentifier");
  }
  userAssignedDeviceName = self->_userAssignedDeviceName;
  if (userAssignedDeviceName) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  userAssignedDeviceName,  @"userAssignedDeviceName");
  }
  userInterfaceIdiom = self->_userInterfaceIdiom;
  if (userInterfaceIdiom) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", userInterfaceIdiom, @"userInterfaceIdiom");
  }
  isLocationSharingDevice = self->_isLocationSharingDevice;
  if (isLocationSharingDevice) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  isLocationSharingDevice,  @"isLocationSharingDevice");
  }
  homeAccessoryInfo = self->_homeAccessoryInfo;
  if (homeAccessoryInfo)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[AFHomeAccessoryInfo buildDictionaryRepresentation]( homeAccessoryInfo,  "buildDictionaryRepresentation"));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, @"homeAccessoryInfo");
  }

  isSiriCloudSyncEnabled = self->_isSiriCloudSyncEnabled;
  if (isSiriCloudSyncEnabled) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  isSiriCloudSyncEnabled,  @"isSiriCloudSyncEnabled");
  }
  myriadTrialTreatment = self->_myriadTrialTreatment;
  if (myriadTrialTreatment) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", myriadTrialTreatment, @"trialTreatment");
  }
  id v17 = -[NSMutableDictionary copy](v4, "copy");

  return v17;
}

- (NSString)aceVersion
{
  return self->_aceVersion;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)sharedUserIdentifier
{
  return self->_sharedUserIdentifier;
}

- (NSString)userAssignedDeviceName
{
  return self->_userAssignedDeviceName;
}

- (NSString)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (NSNumber)isLocationSharingDevice
{
  return self->_isLocationSharingDevice;
}

- (AFHomeAccessoryInfo)homeAccessoryInfo
{
  return self->_homeAccessoryInfo;
}

- (NSNumber)isSiriCloudSyncEnabled
{
  return self->_isSiriCloudSyncEnabled;
}

- (NSString)myriadTrialTreatment
{
  return self->_myriadTrialTreatment;
}

- (void).cxx_destruct
{
}

+ (id)newWithBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithBuilder:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceCirclePeerDataMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADDeviceCirclePeerDataMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADDeviceCirclePeerDataMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADDeviceCirclePeerDataMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___ADDeviceCirclePeerData);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getAceVersion](v5, "getAceVersion"));
      id v8 = (NSString *)[v7 copy];
      aceVersion = v6->_aceVersion;
      v6->_aceVersion = v8;

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getAssistantIdentifier](v5, "getAssistantIdentifier"));
      unint64_t v11 = (NSString *)[v10 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = v11;

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getBuildVersion](v5, "getBuildVersion"));
      uint64_t v14 = (NSString *)[v13 copy];
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = v14;

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getProductType](v5, "getProductType"));
      id v17 = (NSString *)[v16 copy];
      productType = v6->_productType;
      v6->_productType = v17;

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getSharedUserIdentifier](v5, "getSharedUserIdentifier"));
      id v20 = (NSString *)[v19 copy];
      sharedUserIdentifier = v6->_sharedUserIdentifier;
      v6->_sharedUserIdentifier = v20;

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getUserAssignedDeviceName](v5, "getUserAssignedDeviceName"));
      id v23 = (NSString *)[v22 copy];
      userAssignedDeviceName = v6->_userAssignedDeviceName;
      v6->_userAssignedDeviceName = v23;

      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getUserInterfaceIdiom](v5, "getUserInterfaceIdiom"));
      id v26 = (NSString *)[v25 copy];
      userInterfaceIdiom = v6->_userInterfaceIdiom;
      v6->_userInterfaceIdiom = v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getIsLocationSharingDevice](v5, "getIsLocationSharingDevice"));
      id v29 = (NSNumber *)[v28 copy];
      isLocationSharingDevice = v6->_isLocationSharingDevice;
      v6->_isLocationSharingDevice = v29;

      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getHomeAccessoryInfo](v5, "getHomeAccessoryInfo"));
      v32 = (AFHomeAccessoryInfo *)[v31 copy];
      homeAccessoryInfo = v6->_homeAccessoryInfo;
      v6->_homeAccessoryInfo = v32;

      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[_ADDeviceCirclePeerDataMutation getMyriadTrialTreatment](v5, "getMyriadTrialTreatment"));
      id v35 = (NSString *)[v34 copy];
      myriadTrialTreatment = v6->_myriadTrialTreatment;
      v6->_myriadTrialTreatment = v35;
    }

    else
    {
      id v6 = (ADDeviceCirclePeerData *)-[ADDeviceCirclePeerData copy](self, "copy");
    }
  }

  else
  {
    id v6 = (ADDeviceCirclePeerData *)-[ADDeviceCirclePeerData copy](self, "copy");
  }

  return v6;
}

@end