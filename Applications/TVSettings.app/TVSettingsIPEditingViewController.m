@interface TVSettingsIPEditingViewController
- (TSKSettingItem)editingItem;
- (TSKSettingItemEditingControllerDelegate)editingDelegate;
- (TVSettingsIPEditingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_promptText;
- (id)title;
- (void)_menuPressed;
- (void)ipEntryViewControllerDidFinish:(id)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setEditingItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsIPEditingViewController

- (TVSettingsIPEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsIPEditingViewController;
  v4 = -[TVSettingsIPEditingViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[TVSettingsIPEntryViewController setDelegate:](v4, "setDelegate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEditingViewController _promptText](v5, "_promptText"));
    -[TVSettingsIPEntryViewController setPrompt:](v5, "setPrompt:", v6);
  }

  return v5;
}

- (id)title
{
  return 0LL;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsIPEditingViewController;
  -[TVSettingsIPEditingViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1001AEB90);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &__NSArray0__struct);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEditingViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];
}

- (void)setEditingItem:(id)a3
{
  p_editingItem = &self->_editingItem;
  objc_storeStrong((id *)&self->_editingItem, a3);
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[TSKSettingItem valueForSettingItem:]( &OBJC_CLASS___TSKSettingItem,  "valueForSettingItem:",  *p_editingItem));

  -[TVSettingsIPEntryViewController setIpAddress:](self, "setIpAddress:", v7);
}

- (void)ipEntryViewControllerDidFinish:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 ipAddress]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEditingViewController editingDelegate](self, "editingDelegate"));
  [v4 editingController:self didProvideValue:v5 forSettingItem:self->_editingItem];
}

- (id)_promptText
{
  return (id)TSKLocString(@"NetworkConfigureIPEntryPrompt");
}

- (void)_menuPressed
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEditingViewController navigationController](self, "navigationController"));
  id v4 = [v3 popViewControllerAnimated:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingDelegate);
  [WeakRetained editingController:self didCancelForSettingItem:self->_editingItem];
}

- (TSKSettingItem)editingItem
{
  return self->_editingItem;
}

- (TSKSettingItemEditingControllerDelegate)editingDelegate
{
  return (TSKSettingItemEditingControllerDelegate *)objc_loadWeakRetained((id *)&self->_editingDelegate);
}

- (void)setEditingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end