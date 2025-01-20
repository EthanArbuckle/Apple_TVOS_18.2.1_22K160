@interface MRDPinPairingDialog
+ (id)allocWithZone:(_NSZone *)a3;
- (MRDPinPairingDialogDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation MRDPinPairingDialog

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class(&OBJC_CLASS___MRDPinPairingDialog) == a1)
  {
    else {
      v6 = &OBJC_CLASS___MRDPinPairingDialog_CFUN;
    }
    return -[__objc2_class allocWithZone:](v6, "allocWithZone:", a3);
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MRDPinPairingDialog;
    return objc_msgSendSuper2(&v7, "allocWithZone:", a3);
  }

- (MRDPinPairingDialogDelegate)delegate
{
  return (MRDPinPairingDialogDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end