@interface CPSUIBannerRequest
+ (BOOL)supportsSecureCoding;
- (CPSDevice)device;
- (CPSUIBannerRequest)initWithCoder:(id)a3;
- (CPSUIBannerRequest)initWithIdentifier:(id)a3;
- (NSString)iconImageName;
- (NSString)requestIdentifier;
- (NSString)text;
- (void)encodeWithCoder:(id)a3;
- (void)setDevice:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CPSUIBannerRequest

- (CPSUIBannerRequest)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CPSUIBannerRequest;
  v6 = -[CPSUIBannerRequest init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestIdentifier, a3);
  }

  return v7;
}

- (void)setDevice:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_device, a3);
  if (!v5)
  {
    iconImageName = self->_iconImageName;
    self->_iconImageName = (NSString *)@"iphone";

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v18) = 0;
    v15 = "CPSUIBannerRequest: device = nil";
    uint32_t v16 = 2;
LABEL_10:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v15,  (uint8_t *)&v18,  v16);
    goto LABEL_11;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);

  if (!v6)
  {
    v17 = self->_iconImageName;
    self->_iconImageName = (NSString *)@"iphone";

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v18 = 138412290;
    id v19 = v5;
    v15 = "CPSUIBannerRequest: device model = nil, device = %@";
    uint32_t v16 = 12;
    goto LABEL_10;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UTType _typeWithDeviceModelCode:](&OBJC_CLASS___UTType, "_typeWithDeviceModelCode:", v7));

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[ISSymbol symbolForTypeIdentifier:error:]( &OBJC_CLASS___ISSymbol,  "symbolForTypeIdentifier:error:",  v9,  0LL));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue([v10 name]);
  v12 = self->_iconImageName;
  self->_iconImageName = v11;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
    int v18 = 138412290;
    id v19 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CPSUIBannerRequest: device model = %@",  (uint8_t *)&v18,  0xCu);
  }

LABEL_11:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  requestIdentifier = self->_requestIdentifier;
  id v5 = a3;
  [v5 encodeObject:requestIdentifier forKey:@"requestIdentifier"];
  [v5 encodeObject:self->_iconImageName forKey:@"iconImageName"];
  [v5 encodeObject:self->_text forKey:@"text"];
  [v5 encodeObject:self->_device forKey:@"device"];
}

- (CPSUIBannerRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClass:v6 forKey:@"requestIdentifier"]);
  requestIdentifier = self->_requestIdentifier;
  self->_requestIdentifier = v7;

  uint64_t v9 = objc_opt_self(&OBJC_CLASS___NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClass:v10 forKey:@"iconImageName"]);
  iconImageName = self->_iconImageName;
  self->_iconImageName = v11;

  uint64_t v13 = objc_opt_self(&OBJC_CLASS___NSString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClass:v14 forKey:@"text"]);
  text = self->_text;
  self->_text = v15;

  uint64_t v17 = objc_opt_self(&OBJC_CLASS___CPSDevice);
  int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = (CPSDevice *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClass:v18 forKey:@"device"]);

  device = self->_device;
  self->_device = v19;

  return self;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)iconImageName
{
  return self->_iconImageName;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (CPSDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
}

@end