@interface SATVExpressTapToSetupViewController
- (SATVExpressTapToSetupDataSource)dataSource;
- (SATVExpressTapToSetupView)expressTapToSetupView;
- (SATVExpressTapToSetupViewController)initWithDataSource:(id)a3;
- (id)completionHandler;
- (id)deviceClassForExpressTapToSetupView:(id)a3;
- (id)deviceNameForExpressTapToSetupView:(id)a3;
- (id)expressTapToSetupView:(id)a3 imageSymbolNameForSettingItemAtIndex:(unint64_t)a4;
- (id)expressTapToSetupView:(id)a3 textForSettingItemAtIndex:(unint64_t)a4;
- (int64_t)expressTapToSetupView:(id)a3 imageSymbolScaleForSettingItemAtIndex:(unint64_t)a4;
- (unint64_t)numberOfSettingItemsForExpressTapToSetupView:(id)a3;
- (void)_callCompletionHandlerWithUseExpressTapToSetup:(BOOL)a3;
- (void)expressTapToSetupViewDidSelectCustomizeSetup:(id)a3;
- (void)expressTapToSetupViewDidSelectLearnMore:(id)a3;
- (void)expressTapToSetupViewDidSelectPerformExpressSetup:(id)a3;
- (void)loadView;
- (void)setCompletionHandler:(id)a3;
@end

@implementation SATVExpressTapToSetupViewController

- (SATVExpressTapToSetupViewController)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SATVExpressTapToSetupViewController;
  v6 = -[SATVExpressTapToSetupViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___SATVExpressTapToSetupView);
    expressTapToSetupView = v7->_expressTapToSetupView;
    v7->_expressTapToSetupView = v8;

    -[SATVExpressTapToSetupView setDelegate:](v7->_expressTapToSetupView, "setDelegate:", v7);
    -[SATVExpressTapToSetupView setDataSource:](v7->_expressTapToSetupView, "setDataSource:", v7);
  }

  return v7;
}

- (void)loadView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupViewController expressTapToSetupView](self, "expressTapToSetupView"));
  -[SATVExpressTapToSetupViewController setView:](self, "setView:", v3);
}

- (id)deviceNameForExpressTapToSetupView:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupViewController dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceName]);

  return v4;
}

- (id)deviceClassForExpressTapToSetupView:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupViewController dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceClass]);

  return v4;
}

- (unint64_t)numberOfSettingItemsForExpressTapToSetupView:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupViewController dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 items]);
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (id)expressTapToSetupView:(id)a3 textForSettingItemAtIndex:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupViewController dataSource](self, "dataSource", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndex:a4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 descriptionText]);
  return v7;
}

- (id)expressTapToSetupView:(id)a3 imageSymbolNameForSettingItemAtIndex:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupViewController dataSource](self, "dataSource", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndex:a4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 imageSymbolName]);
  return v7;
}

- (int64_t)expressTapToSetupView:(id)a3 imageSymbolScaleForSettingItemAtIndex:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupViewController dataSource](self, "dataSource", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndex:a4]);

  id v7 = [v6 imageSymbolScale];
  return (int64_t)v7;
}

- (void)expressTapToSetupViewDidSelectPerformExpressSetup:(id)a3
{
}

- (void)expressTapToSetupViewDidSelectCustomizeSetup:(id)a3
{
}

- (void)expressTapToSetupViewDidSelectLearnMore:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupViewController dataSource](self, "dataSource", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 |= objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)i), "types", (void)v16);
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v13 = v12;
  if ((v9 & 3) != 0) {
    -[NSMutableArray addObject:](v12, "addObject:", OBPrivacyAskSiriIdentifier);
  }
  if ((v9 & 4) != 0)
  {
    -[NSMutableArray addObject:](v13, "addObject:", OBPrivacyImproveSiriIdentifier);
    if ((v9 & 8) == 0)
    {
LABEL_14:
      if ((v9 & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }

  else if ((v9 & 8) == 0)
  {
    goto LABEL_14;
  }

  -[NSMutableArray addObject:](v13, "addObject:", OBPrivacyLocationServicesIdentifier, (void)v16);
  if ((v9 & 0x20) == 0)
  {
LABEL_15:
    if ((v9 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

- (void)_callCompletionHandlerWithUseExpressTapToSetup:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVExpressTapToSetupViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    id v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[SATVExpressTapToSetupViewController completionHandler]( self,  "completionHandler"));
    v6[2](v6, v3);
  }

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (SATVExpressTapToSetupDataSource)dataSource
{
  return self->_dataSource;
}

- (SATVExpressTapToSetupView)expressTapToSetupView
{
  return self->_expressTapToSetupView;
}

- (void).cxx_destruct
{
}

@end