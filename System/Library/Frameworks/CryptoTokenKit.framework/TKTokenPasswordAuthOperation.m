@interface TKTokenPasswordAuthOperation
+ (BOOL)supportsSecureCoding;
- (Class)baseClassForUI;
- (NSString)localizedPasswordLabel;
- (NSString)password;
- (TKTokenPasswordAuthOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)importOperation:(id)a3;
- (void)setLocalizedPasswordLabel:(id)a3;
- (void)setPassword:(NSString *)password;
@end

@implementation TKTokenPasswordAuthOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenPasswordAuthOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TKTokenPasswordAuthOperation;
  v5 = -[TKTokenAuthOperation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    NSStringFromSelector(sel_password);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    password = v5->_password;
    v5->_password = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    NSStringFromSelector(sel_localizedPasswordLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    localizedPasswordLabel = v5->_localizedPasswordLabel;
    v5->_localizedPasswordLabel = (NSString *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKTokenPasswordAuthOperation;
  id v4 = a3;
  -[TKTokenAuthOperation encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  password = self->_password;
  NSStringFromSelector(sel_password);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", password, v6, v9.receiver, v9.super_class);

  localizedPasswordLabel = self->_localizedPasswordLabel;
  NSStringFromSelector(sel_localizedPasswordLabel);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:localizedPasswordLabel forKey:v8];
}

- (Class)baseClassForUI
{
  return (Class)objc_opt_class();
}

- (void)importOperation:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKTokenPasswordAuthOperation;
  id v4 = a3;
  -[TKTokenAuthOperation importOperation:](&v9, sel_importOperation_, v4);
  objc_msgSend(v4, "localizedPasswordLabel", v9.receiver, v9.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedPasswordLabel = self->_localizedPasswordLabel;
  self->_localizedPasswordLabel = v5;

  [v4 password];
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  password = self->_password;
  self->_password = v7;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPassword:(NSString *)password
{
}

- (NSString)localizedPasswordLabel
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLocalizedPasswordLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end