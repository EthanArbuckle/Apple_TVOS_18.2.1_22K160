@interface TVSettingsScreenSaverRadioSettingGroup
- (TVSettingsScreenSaverRadioSettingGroupDelegate)delegate;
- (void)_itemSelected:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TVSettingsScreenSaverRadioSettingGroup

- (void)_itemSelected:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "radioSettingsGroup:didSelectItem:") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v6 representedObject]);
    [WeakRetained radioSettingsGroup:self didSelectItem:v5];
  }
}

- (TVSettingsScreenSaverRadioSettingGroupDelegate)delegate
{
  return (TVSettingsScreenSaverRadioSettingGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end