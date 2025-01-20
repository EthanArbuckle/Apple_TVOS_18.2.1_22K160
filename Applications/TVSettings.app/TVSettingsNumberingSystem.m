@interface TVSettingsNumberingSystem
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (NSString)displayName;
- (NSString)localeIdentifier;
- (NSString)shortDisplayName;
- (TVSettingsNumberingSystem)initWithLocaleIdentifier:(id)a3 displayName:(id)a4 shortDisplayName:(id)a5 isSelected:(BOOL)a6;
- (unint64_t)hash;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation TVSettingsNumberingSystem

- (TVSettingsNumberingSystem)initWithLocaleIdentifier:(id)a3 displayName:(id)a4 shortDisplayName:(id)a5 isSelected:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVSettingsNumberingSystem;
  v13 = -[TVSettingsNumberingSystem init](&v21, "init");
  if (v13)
  {
    v14 = (NSString *)[v10 copy];
    localeIdentifier = v13->_localeIdentifier;
    v13->_localeIdentifier = v14;

    v16 = (NSString *)[v11 copy];
    displayName = v13->_displayName;
    v13->_displayName = v16;

    v18 = (NSString *)[v12 copy];
    shortDisplayName = v13->_shortDisplayName;
    v13->_shortDisplayName = v18;

    v13->_isSelected = a6;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___TVSettingsNumberingSystem));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  localeIdentifier = self->_localeIdentifier;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C1910;
  v11[3] = &unk_1001919F0;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v6 appendString:localeIdentifier counterpart:v11];
  LOBYTE(localeIdentifier) = [v6 isEqual];

  return (char)localeIdentifier;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(&OBJC_CLASS___BSHashBuilder);
  id v4 = [v3 appendString:self->_localeIdentifier];
  id v5 = [v3 hash];

  return (unint64_t)v5;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)shortDisplayName
{
  return self->_shortDisplayName;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
}

@end