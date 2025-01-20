@interface IDSStewieSMSConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSStewieSMSConfig)initWithCoder:(id)a3;
- (IDSStewieSMSConfig)initWithConfig:(id)a3 withID:(id)a4;
- (NSData)config;
- (NSUUID)configID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSStewieSMSConfig

- (IDSStewieSMSConfig)initWithConfig:(id)a3 withID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0LL;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___IDSStewieSMSConfig;
    v11 = -[IDSStewieSMSConfig init](&v14, "init");
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_config, a3);
      objc_storeStrong(p_isa + 1, a4);
    }

    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSStewieSMSConfig configID](self, "configID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSStewieSMSConfig config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p { configID: %@, config: %@}>",  v3,  self,  v4,  v5));

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_config, "hash");
  return (unint64_t)-[NSUUID hash](self->_configID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (IDSStewieSMSConfig *)a3;
  if (v6 == self)
  {
    unsigned __int8 v12 = 1;
  }

  else
  {
    uint64_t v7 = objc_opt_class(self, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 = v6;
      config = self->_config;
      v10 = (NSData *)objc_claimAutoreleasedReturnValue(-[IDSStewieSMSConfig config](v8, "config"));
      if (config == v10
        || (v11 = self->_config,
            unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSStewieSMSConfig config](v8, "config")),
            -[NSData isEqual:](v11, "isEqual:", v3)))
      {
        configID = self->_configID;
        objc_super v14 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[IDSStewieSMSConfig configID](v8, "configID"));
        if (configID == v14)
        {
          unsigned __int8 v12 = 1;
        }

        else
        {
          v15 = self->_configID;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSStewieSMSConfig configID](v8, "configID"));
          unsigned __int8 v12 = -[NSUUID isEqual:](v15, "isEqual:", v16);
        }

        if (config == v10) {
          goto LABEL_13;
        }
      }

      else
      {
        unsigned __int8 v12 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }

    unsigned __int8 v12 = 0;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSStewieSMSConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSStewieSMSConfig;
  v6 = -[IDSStewieSMSConfig init](&v15, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), @"config");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    config = v6->_config;
    v6->_config = (NSData *)v8;

    id v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v10), @"configID");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    configID = v6->_configID;
    v6->_configID = (NSUUID *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  config = self->_config;
  id v5 = a3;
  [v5 encodeObject:config forKey:@"config"];
  [v5 encodeObject:self->_configID forKey:@"configID"];
}

- (NSUUID)configID
{
  return self->_configID;
}

- (NSData)config
{
  return self->_config;
}

- (void).cxx_destruct
{
}

@end