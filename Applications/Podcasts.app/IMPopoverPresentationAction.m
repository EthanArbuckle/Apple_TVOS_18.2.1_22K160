@interface IMPopoverPresentationAction
- (id)presentingButton;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)setPresentingButton:(id)a3;
@end

@implementation IMPopoverPresentationAction

- (void)prepareForPopoverPresentation:(id)a3
{
  id v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  Class v5 = NSClassFromString(@"MPUTransportButton");
  uint64_t v6 = objc_opt_class(v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  if ((isKindOfClass & 1) != 0)
  {
    [v16 setSourceView:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    [v10 bounds];
    objc_msgSend(v9, "imageRectForContentRect:");
    objc_msgSend(v16, "setSourceRect:");

LABEL_7:
    goto LABEL_8;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___UIView);
  char v12 = objc_opt_isKindOfClass(v8, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  if ((v12 & 1) != 0)
  {
    [v16 setSourceView:v13];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    [v9 bounds];
    objc_msgSend(v16, "setSourceRect:");
    goto LABEL_7;
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___UIBarButtonItem);
  char v15 = objc_opt_isKindOfClass(v13, v14);

  if ((v15 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    [v16 setBarButtonItem:v9];
    goto LABEL_7;
  }

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton", a3));
  Class v9 = NSClassFromString(@"MPUTransportButton");
  uint64_t v10 = objc_opt_class(v9);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  char v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    [v13 bounds];
    objc_msgSend(v12, "imageRectForContentRect:");
    a4->origin.x = v14;
    a4->origin.y = v15;
    a4->size.width = v16;
    a4->size.height = v17;

LABEL_5:
    *a5 = (id)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    return;
  }

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___UIView);
  char v19 = objc_opt_isKindOfClass(v12, v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  char v12 = v20;
  if ((v19 & 1) != 0)
  {
    [v20 bounds];
    a4->origin.x = v21;
    a4->origin.y = v22;
    a4->size.width = v23;
    a4->size.height = v24;
    goto LABEL_5;
  }

  uint64_t v25 = objc_opt_class(&OBJC_CLASS___UIBarButtonItem);
  char v26 = objc_opt_isKindOfClass(v12, v25);

  if ((v26 & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    id v32 = (id)objc_claimAutoreleasedReturnValue([v27 _toolbarButton]);

    if (v32)
    {
      [v32 bounds];
      a4->origin.x = v28;
      a4->origin.y = v29;
      a4->size.width = v30;
      a4->size.height = v31;
      *a5 = v32;
    }
  }

- (id)presentingButton
{
  return self->_presentingButton;
}

- (void)setPresentingButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end