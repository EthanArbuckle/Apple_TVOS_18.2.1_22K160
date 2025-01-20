@interface TVSettingsScreenSaverToggleViewModel
- (BOOL)isDisabled;
- (NSString)offIdentifier;
- (NSString)onIdentifier;
- (TSKBoolFormatter)toggleFormatter;
- (TVSettingsScreenSaverToggleViewModel)initWithOffSettingsOption:(id)a3 onSettingsOption:(id)a4 disabled:(BOOL)a5;
@end

@implementation TVSettingsScreenSaverToggleViewModel

- (TVSettingsScreenSaverToggleViewModel)initWithOffSettingsOption:(id)a3 onSettingsOption:(id)a4 disabled:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverToggleViewModel;
  v10 = -[TVSettingsScreenSaverToggleViewModel init](&v20, "init");
  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 identifier]);
    offIdentifier = v10->_offIdentifier;
    v10->_offIdentifier = (NSString *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 identifier]);
    onIdentifier = v10->_onIdentifier;
    v10->_onIdentifier = (NSString *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedName]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedName]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[TSKBoolFormatter formatterWithOnTitle:offTitle:]( &OBJC_CLASS___TSKBoolFormatter,  "formatterWithOnTitle:offTitle:",  v15,  v16));
    toggleFormatter = v10->_toggleFormatter;
    v10->_toggleFormatter = (TSKBoolFormatter *)v17;

    v10->_disabled = a5;
  }

  return v10;
}

- (NSString)offIdentifier
{
  return self->_offIdentifier;
}

- (NSString)onIdentifier
{
  return self->_onIdentifier;
}

- (TSKBoolFormatter)toggleFormatter
{
  return self->_toggleFormatter;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
}

@end