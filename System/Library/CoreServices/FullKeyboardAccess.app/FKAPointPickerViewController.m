@interface FKAPointPickerViewController
- (FKAPointPickerViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation FKAPointPickerViewController

- (FKAPointPickerViewControllerDelegate)delegate
{
  return (FKAPointPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end