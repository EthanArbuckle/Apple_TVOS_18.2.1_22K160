@interface PBCFUserNotificationButtonDefinition
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreferredButton;
- (NSString)title;
- (PBCFUserNotificationButtonDefinition)initWithDictionary:(id)a3 localizationBundle:(id)a4;
- (PBCFUserNotificationButtonDefinition)initWithTitle:(id)a3 style:(int64_t)a4 isPreferred:(BOOL)a5;
- (id)description;
- (int64_t)presentationStyle;
- (unint64_t)hash;
- (void)setIsPreferredButton:(BOOL)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation PBCFUserNotificationButtonDefinition

- (PBCFUserNotificationButtonDefinition)initWithTitle:(id)a3 style:(int64_t)a4 isPreferred:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBCFUserNotificationButtonDefinition;
  v9 = -[PBCFUserNotificationButtonDefinition init](&v13, "init");
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    title = v9->_title;
    v9->_title = v10;

    v9->_presentationStyle = a4;
    v9->_isPreferredButton = a5;
  }

  return v9;
}

- (PBCFUserNotificationButtonDefinition)initWithDictionary:(id)a3 localizationBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v6, v8) & 1) != 0))
  {
    v9 = (PBCFUserNotificationButtonDefinition *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeStringForKey:", @"_SBSButtonTitle"));
    if (v9)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v9 value:0 table:0]);
      v11 = (void *)v10;
      if (v10 && (BSEqualObjects(v10, v9) & 1) == 0)
      {
        v12 = v11;

        v9 = v12;
      }

      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_safeNumberForKey:", @"_SBSButtonPresentationStyle"));
      id v14 = [v13 integerValue];

      self =  -[PBCFUserNotificationButtonDefinition initWithTitle:style:isPreferred:]( self,  "initWithTitle:style:isPreferred:",  v9,  v14,  objc_msgSend(v6, "bs_BOOLForKey:", @"_SBSButtonPreferred"));
      v9 = self;
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendObject:self->_title];
  id v5 = [v3 appendInteger:self->_presentationStyle];
  id v6 = [v3 appendBool:self->_isPreferredButton];
  id v7 = [v3 hash];

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBCFUserNotificationButtonDefinition *)a3;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }

  else
  {
    id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBCFUserNotificationButtonDefinition));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    title = self->_title;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100209370;
    v21[3] = &unk_1003D2130;
    uint64_t v8 = v4;
    v22 = v8;
    id v9 = [v6 appendObject:title counterpart:v21];
    int64_t presentationStyle = self->_presentationStyle;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100209390;
    v19[3] = &unk_1003D4148;
    v11 = v8;
    v20 = v11;
    id v12 = [v6 appendInteger:presentationStyle counterpart:v19];
    BOOL isPreferredButton = self->_isPreferredButton;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002093A8;
    v17[3] = &unk_1003D2B58;
    v18 = v11;
    id v14 = [v6 appendBool:isPreferredButton counterpart:v17];
    unsigned __int8 v15 = [v6 isEqual];
  }

  return v15;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_title withName:0 skipIfEmpty:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_int64_t presentationStyle = a3;
}

- (BOOL)isPreferredButton
{
  return self->_isPreferredButton;
}

- (void)setIsPreferredButton:(BOOL)a3
{
  self->_BOOL isPreferredButton = a3;
}

- (void).cxx_destruct
{
}

@end