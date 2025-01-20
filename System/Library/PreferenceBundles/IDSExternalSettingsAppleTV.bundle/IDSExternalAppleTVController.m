@interface IDSExternalAppleTVController
- (IDSViewState)viewState;
- (id)loadSettingGroups;
- (void)_dumpLogs;
- (void)setViewState:(id)a3;
@end

@implementation IDSExternalAppleTVController

- (id)loadSettingGroups
{
  v5[0] = +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  @"HomeKit Debugging",  @"Enable HomeKit related activity to be logged.",  -[IDSExternalAppleTVController viewState](self, "viewState"),  @"isLoggingEnabled",  @"Enabled",  @"Disabled");
  v5[1] = +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  @"Dump Logs",  @"Generate logs that can be retrieved using iTunes.",  0LL,  0LL,  self,  "_dumpLogs");
  v4 = +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  @"HomeKit",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL);
}

- (void)_dumpLogs
{
}

- (IDSViewState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  self->_viewState = (IDSViewState *)a3;
}

@end