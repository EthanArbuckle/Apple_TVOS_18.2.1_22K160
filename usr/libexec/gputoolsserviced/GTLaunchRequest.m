@interface GTLaunchRequest
+ (BOOL)supportsSecureCoding;
- (GTLaunchRequest)init;
- (GTLaunchRequest)initWithCoder:(id)a3;
- (NSArray)arguments;
- (NSDictionary)environment;
- (NSString)deviceUDID;
- (NSUUID)sessionUUID;
- (void)encodeWithCoder:(id)a3;
- (void)setArguments:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation GTLaunchRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTLaunchRequest)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GTLaunchRequest;
  v2 = -[GTLaunchRequest init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    environment = v2->_environment;
    v2->_environment = (NSDictionary *)&__NSDictionary0__struct;

    arguments = v3->_arguments;
    v3->_arguments = (NSArray *)&__NSArray0__struct;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](&OBJC_CLASS___GTDeviceProperties, "uniqueDeviceID"));
    deviceUDID = v3->_deviceUDID;
    v3->_deviceUDID = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    sessionUUID = v3->_sessionUUID;
    v3->_sessionUUID = (NSUUID *)v8;

    v10 = v3;
  }

  return v3;
}

- (GTLaunchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___GTLaunchRequest;
  v5 = -[GTLaunchRequest init](&v59, "init");
  if (!v5) {
    goto LABEL_39;
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  id v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class(NSString) forKey:@"environment"];
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  environment = v5->_environment;
  v5->_environment = (NSDictionary *)v8;

  v10 = v5->_environment;
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v10 = v5->_environment;
LABEL_15:
    v5->_environment = (NSDictionary *)&__NSDictionary0__struct;
    goto LABEL_18;
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  v10 = v5->_environment;
  id v12 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v55,  v61,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v56;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v56 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
        char isKindOfClass = objc_opt_isKindOfClass(v16, v17);
        v19 = v5->_environment;
        if ((isKindOfClass & 1) == 0) {
          goto LABEL_17;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v16));
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
        char v22 = objc_opt_isKindOfClass(v20, v21);

        if ((v22 & 1) == 0)
        {
          v19 = v5->_environment;
LABEL_17:
          v5->_environment = (NSDictionary *)&__NSDictionary0__struct;

          goto LABEL_18;
        }
      }

      id v13 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v55,  v61,  16LL);
      if (v13) {
        continue;
      }
      break;
    }
  }

- (void)encodeWithCoder:(id)a3
{
  environment = self->_environment;
  id v5 = a3;
  [v5 encodeObject:environment forKey:@"environment"];
  [v5 encodeObject:self->_arguments forKey:@"arguments"];
  [v5 encodeObject:self->_deviceUDID forKey:@"deviceUDID"];
  [v5 encodeObject:self->_sessionUUID forKey:@"sessionUUID"];
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end