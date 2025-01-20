@interface MRDPinPairingDialog_CFUN
- (void)showWithPin:(id)a3 forClient:(id)a4;
@end

@implementation MRDPinPairingDialog_CFUN

- (void)showWithPin:(id)a3 forClient:(id)a4
{
  id v4 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___MSVSystemDialogOptions);
  uint64_t v5 = MRLocalizedString(@"EXTERNAL_DEVICE_AUTHENTICATION_PIN_DIALOG_HEADER", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v10 setAlertHeader:v6];

  [v10 setAlertMessage:v4];
  uint64_t v7 = MRLocalizedString(@"OK", 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v10 setDefaultButtonTitle:v8];

  v9 = -[MSVSystemDialog initWithOptions:](objc_alloc(&OBJC_CLASS___MSVSystemDialog), "initWithOptions:", v10);
  -[MSVSystemDialog presentWithCompletion:](v9, "presentWithCompletion:", 0LL);
}

@end