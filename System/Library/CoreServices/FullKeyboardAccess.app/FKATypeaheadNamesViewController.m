@interface FKATypeaheadNamesViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)items;
- (void)loadView;
- (void)setItems:(id)a3;
@end

@implementation FKATypeaheadNamesViewController

- (void)loadView
{
  v5 = objc_opt_new(&OBJC_CLASS___AXElementNamesView);
  uint64_t v3 = FKALogCommon(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[AXElementNamesView setLoggingFacility:](v5, "setLoggingFacility:", v4);

  -[FKATypeaheadNamesViewController setView:](self, "setView:", v5);
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKATypeaheadNamesViewController elementNamesView](self, "elementNamesView"));
  [v5 setItems:v4];
}

- (NSArray)items
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKATypeaheadNamesViewController elementNamesView](self, "elementNamesView"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 items]);

  return (NSArray *)v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end