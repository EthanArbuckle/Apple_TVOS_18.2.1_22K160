@interface BMSyncDevicePeerMetadata
+ (id)devicePeerMetadata;
- (BMSyncDevicePeerMetadata)initWithName:(id)a3 model:(id)a4 platform:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)model;
- (NSString)name;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (int64_t)platform;
- (unint64_t)hash;
@end

@implementation BMSyncDevicePeerMetadata

- (BMSyncDevicePeerMetadata)initWithName:(id)a3 model:(id)a4 platform:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___BMSyncDevicePeerMetadata;
  v11 = -[BMSyncDevicePeerMetadata init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v12->_model, a4);
    v12->_platform = a5;
  }

  return v12;
}

+ (id)devicePeerMetadata
{
  v2 = objc_alloc(&OBJC_CLASS___BMSyncDevicePeerMetadata);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BMDeviceMetadataUtils osBuildVersion](&OBJC_CLASS___BMDeviceMetadataUtils, "osBuildVersion"));
  v4 = -[BMSyncDevicePeerMetadata initWithName:model:platform:]( v2,  "initWithName:model:platform:",  0LL,  v3,  +[BMDeviceMetadataUtils platform](&OBJC_CLASS___BMDeviceMetadataUtils, "platform"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___BMSyncDevicePeerMetadata, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    BOOL v14 = 0;
    goto LABEL_18;
  }

  id v9 = v6;
  id v10 = v9;
  name = self->_name;
  v12 = name;
  if (!name)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    if (!v3)
    {
      int v13 = 0;
      goto LABEL_10;
    }

    v12 = self->_name;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  if (!-[NSString isEqualToString:](v12, "isEqualToString:", v4))
  {
    BOOL v14 = 0;
LABEL_14:

    goto LABEL_15;
  }

  int v13 = 1;
LABEL_10:
  model = self->_model;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 model]);
  if (-[NSString isEqual:](model, "isEqual:", v16))
  {
    id platform = (id)self->_platform;
    BOOL v14 = platform == [v10 platform];
  }

  else
  {
    BOOL v14 = 0;
  }

  if (v13) {
    goto LABEL_14;
  }
LABEL_15:
  if (!name) {

  }
LABEL_18:
  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_name, "hash");
  unint64_t v4 = -[NSString hash](self->_model, "hash") ^ v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_platform));
  unint64_t v6 = v4 ^ (unint64_t)[v5 hash];

  return v6;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"name"]);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  else {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"name"]);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"model"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"platform"]);
  id v10 = [v9 unsignedIntegerValue];

  v11 = -[BMSyncDevicePeerMetadata initWithName:model:platform:](self, "initWithName:model:platform:", v7, v8, v10);
  return v11;
}

- (id)dictionaryRepresentation
{
  v10[0] = @"name";
  name = self->_name;
  id v4 = name;
  if (!name) {
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  model = self->_model;
  int64_t platform = self->_platform;
  v11[0] = v4;
  v11[1] = model;
  v10[1] = @"model";
  v10[2] = @"platform";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", platform));
  v11[2] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  if (!name) {
  return v8;
  }
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (int64_t)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
}

@end