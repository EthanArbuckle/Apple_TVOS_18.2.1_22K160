@interface IXUninstallOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreAppProtection;
- (BOOL)ignoreRemovability;
- (BOOL)ignoreRestrictions;
- (BOOL)isEqual:(id)a3;
- (BOOL)requestUserConfirmation;
- (BOOL)showArchiveOption;
- (BOOL)showDemotionOption;
- (BOOL)systemAppNotAllowed;
- (BOOL)waitForDeletion;
- (IXUninstallOptions)init;
- (IXUninstallOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoreAppProtection:(BOOL)a3;
- (void)setIgnoreRemovability:(BOOL)a3;
- (void)setIgnoreRestrictions:(BOOL)a3;
- (void)setRequestUserConfirmation:(BOOL)a3;
- (void)setShowArchiveOption:(BOOL)a3;
- (void)setShowDemotionOption:(BOOL)a3;
- (void)setSystemAppNotAllowed:(BOOL)a3;
- (void)setWaitForDeletion:(BOOL)a3;
@end

@implementation IXUninstallOptions

- (IXUninstallOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IXUninstallOptions;
  v2 = -[IXUninstallOptions init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[IXUninstallOptions setRequestUserConfirmation:](v2, "setRequestUserConfirmation:", 0LL);
    -[IXUninstallOptions setWaitForDeletion:](v3, "setWaitForDeletion:", 0LL);
    -[IXUninstallOptions setShowArchiveOption:](v3, "setShowArchiveOption:", 0LL);
    -[IXUninstallOptions setShowDemotionOption:](v3, "setShowDemotionOption:", 0LL);
    -[IXUninstallOptions setSystemAppNotAllowed:](v3, "setSystemAppNotAllowed:", 0LL);
    -[IXUninstallOptions setIgnoreRemovability:](v3, "setIgnoreRemovability:", 0LL);
    -[IXUninstallOptions setIgnoreRestrictions:](v3, "setIgnoreRestrictions:", 0LL);
    -[IXUninstallOptions setIgnoreAppProtection:](v3, "setIgnoreAppProtection:", 0LL);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXUninstallOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = -[IXUninstallOptions init](self, "init");
  if (v5)
  {
    v5->_requestUserConfirmation = [v4 decodeBoolForKey:@"requestUserConfirmation"];
    v5->_waitForDeletion = [v4 decodeBoolForKey:@"waitForDeletion"];
    v5->_showArchiveOption = [v4 decodeBoolForKey:@"showArchiveOption"];
    v5->_showDemotionOption = [v4 decodeBoolForKey:@"showDemotionOption"];
    v5->_systemAppNotAllowed = [v4 decodeBoolForKey:@"systemAppNotAllowed"];
    v5->_ignoreRemovability = [v4 decodeBoolForKey:@"ignoreRemovability"];
    v5->_ignoreRestrictions = [v4 decodeBoolForKey:@"ignoreRestrictions"];
    v5->_ignoreAppProtection = [v4 decodeBoolForKey:@"ignoreAppProtection"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXUninstallOptions requestUserConfirmation](self, "requestUserConfirmation"),  @"requestUserConfirmation");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXUninstallOptions waitForDeletion](self, "waitForDeletion"),  @"waitForDeletion");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXUninstallOptions showArchiveOption](self, "showArchiveOption"),  @"showArchiveOption");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXUninstallOptions showDemotionOption](self, "showDemotionOption"),  @"showDemotionOption");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXUninstallOptions systemAppNotAllowed](self, "systemAppNotAllowed"),  @"systemAppNotAllowed");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXUninstallOptions ignoreRemovability](self, "ignoreRemovability"),  @"ignoreRemovability");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXUninstallOptions ignoreRestrictions](self, "ignoreRestrictions"),  @"ignoreRestrictions");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXUninstallOptions ignoreAppProtection](self, "ignoreAppProtection"),  @"ignoreAppProtection");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend( v4,  "setRequestUserConfirmation:",  -[IXUninstallOptions requestUserConfirmation](self, "requestUserConfirmation"));
  objc_msgSend(v4, "setWaitForDeletion:", -[IXUninstallOptions waitForDeletion](self, "waitForDeletion"));
  objc_msgSend(v4, "setShowArchiveOption:", -[IXUninstallOptions showArchiveOption](self, "showArchiveOption"));
  objc_msgSend(v4, "setShowDemotionOption:", -[IXUninstallOptions showDemotionOption](self, "showDemotionOption"));
  objc_msgSend(v4, "setSystemAppNotAllowed:", -[IXUninstallOptions systemAppNotAllowed](self, "systemAppNotAllowed"));
  objc_msgSend(v4, "setIgnoreRemovability:", -[IXUninstallOptions ignoreRemovability](self, "ignoreRemovability"));
  objc_msgSend(v4, "setIgnoreRestrictions:", -[IXUninstallOptions ignoreRestrictions](self, "ignoreRestrictions"));
  objc_msgSend(v4, "setIgnoreAppProtection:", -[IXUninstallOptions ignoreAppProtection](self, "ignoreAppProtection"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXUninstallOptions *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      unsigned int v7 = -[IXUninstallOptions requestUserConfirmation](self, "requestUserConfirmation");
      if (v7 != -[IXUninstallOptions requestUserConfirmation](v6, "requestUserConfirmation"))
      {
        v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 136315394;
          v29 = "-[IXUninstallOptions isEqual:]";
          __int16 v30 = 2080;
          v31 = "requestUserConfirmation";
LABEL_32:
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Property %s did not match",  (uint8_t *)&v28,  0x16u);
        }

- (id)description
{
  BOOL requestUserConfirmation = self->_requestUserConfirmation;
  BOOL waitForDeletion = self->_waitForDeletion;
  BOOL showArchiveOption = self->_showArchiveOption;
  BOOL showDemotionOption = self->_showDemotionOption;
  BOOL systemAppNotAllowed = self->_systemAppNotAllowed;
  BOOL ignoreRemovability = self->_ignoreRemovability;
  BOOL ignoreRestrictions = self->_ignoreRestrictions;
  if (self->_ignoreAppProtection) {
    uint64_t v9 = 89LL;
  }
  else {
    uint64_t v9 = 78LL;
  }
  if (ignoreRestrictions) {
    uint64_t v10 = 89LL;
  }
  else {
    uint64_t v10 = 78LL;
  }
  if (ignoreRemovability) {
    uint64_t v11 = 89LL;
  }
  else {
    uint64_t v11 = 78LL;
  }
  if (systemAppNotAllowed) {
    uint64_t v12 = 89LL;
  }
  else {
    uint64_t v12 = 78LL;
  }
  if (showDemotionOption) {
    uint64_t v13 = 89LL;
  }
  else {
    uint64_t v13 = 78LL;
  }
  if (showArchiveOption) {
    uint64_t v14 = 89LL;
  }
  else {
    uint64_t v14 = 78LL;
  }
  if (waitForDeletion) {
    uint64_t v15 = 89LL;
  }
  else {
    uint64_t v15 = 78LL;
  }
  if (requestUserConfirmation) {
    uint64_t v16 = 89LL;
  }
  else {
    uint64_t v16 = 78LL;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<confirmation:%c wait:%c archive:%c demote:%c notAllowed:%c ignoreRemovability:%c ignoreRestrictions:%c ignoreAppProtection:%c>",  v16,  v15,  v14,  v13,  v12,  v11,  v10,  v9);
}

- (BOOL)requestUserConfirmation
{
  return self->_requestUserConfirmation;
}

- (void)setRequestUserConfirmation:(BOOL)a3
{
  self->_BOOL requestUserConfirmation = a3;
}

- (BOOL)waitForDeletion
{
  return self->_waitForDeletion;
}

- (void)setWaitForDeletion:(BOOL)a3
{
  self->_BOOL waitForDeletion = a3;
}

- (BOOL)showArchiveOption
{
  return self->_showArchiveOption;
}

- (void)setShowArchiveOption:(BOOL)a3
{
  self->_BOOL showArchiveOption = a3;
}

- (BOOL)showDemotionOption
{
  return self->_showDemotionOption;
}

- (void)setShowDemotionOption:(BOOL)a3
{
  self->_BOOL showDemotionOption = a3;
}

- (BOOL)systemAppNotAllowed
{
  return self->_systemAppNotAllowed;
}

- (void)setSystemAppNotAllowed:(BOOL)a3
{
  self->_BOOL systemAppNotAllowed = a3;
}

- (BOOL)ignoreRemovability
{
  return self->_ignoreRemovability;
}

- (void)setIgnoreRemovability:(BOOL)a3
{
  self->_BOOL ignoreRemovability = a3;
}

- (BOOL)ignoreRestrictions
{
  return self->_ignoreRestrictions;
}

- (void)setIgnoreRestrictions:(BOOL)a3
{
  self->_BOOL ignoreRestrictions = a3;
}

- (BOOL)ignoreAppProtection
{
  return self->_ignoreAppProtection;
}

- (void)setIgnoreAppProtection:(BOOL)a3
{
  self->_ignoreAppProtection = a3;
}

@end