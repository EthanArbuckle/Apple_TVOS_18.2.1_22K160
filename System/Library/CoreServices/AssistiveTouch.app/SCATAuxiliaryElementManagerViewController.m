@interface SCATAuxiliaryElementManagerViewController
- (BOOL)_elementContainsAllSubviewsOfView:(id)a3 view:(id)a4;
- (BOOL)isTransitioningToOrFromActive;
- (id)viewsRequiringStateUpdate;
- (void)loadView;
- (void)setTransitioningToOrFromActive:(BOOL)a3;
- (void)updateCustomFocusingViewStateForViewsWithElement:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATAuxiliaryElementManagerViewController

- (void)loadView
{
  v3 = objc_opt_new(&OBJC_CLASS___UIView);
  -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 18LL);
  -[SCATAuxiliaryElementManagerViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATAuxiliaryElementManagerViewController;
  -[SCATAuxiliaryElementManagerViewController viewDidLoad](&v3, "viewDidLoad");
  -[SCATAuxiliaryElementManagerViewController updateCustomFocusingViewStateForViewsWithElement:]( self,  "updateCustomFocusingViewStateForViewsWithElement:",  0LL);
}

- (id)viewsRequiringStateUpdate
{
  return 0LL;
}

- (void)updateCustomFocusingViewStateForViewsWithElement:(id)a3
{
  id v4 = a3;
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 parentGroup]);
  }
  v6 = v5;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[SCATAuxiliaryElementManagerViewController viewsRequiringStateUpdate]( self,  "viewsRequiringStateUpdate",  0LL));
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v18 + 1) + 8LL * (void)v11);
        unsigned int v13 = [v4 isGroup];
        if (v13) {
          LOBYTE(v13) = -[SCATAuxiliaryElementManagerViewController _elementContainsAllSubviewsOfView:view:]( self,  "_elementContainsAllSubviewsOfView:view:",  v4,  v12);
        }
        uint64_t v14 = 1LL;
        if (v12 != v4 && (v13 & 1) == 0)
        {
          uint64_t v15 = (uint64_t)[v6 containsObject:v12];
          if ((v15 & 1) != 0
            || (sub_1000729CC(v15, v6, v12) & 1) != 0
            || (v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance")),
                unsigned __int8 v17 = [v16 assistiveTouchGroupElementsEnabled],
                v16,
                (v17 & 1) == 0))
          {
            uint64_t v14 = 2LL;
          }

          else
          {
            uint64_t v14 = 0LL;
          }
        }

        [v12 updateFocusState:v14];
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }
}

- (BOOL)_elementContainsAllSubviewsOfView:(id)a3 view:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)i),  "isDescendantOfView:",  v6,  (void)v14))
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)isTransitioningToOrFromActive
{
  return self->_transitioningToOrFromActive;
}

- (void)setTransitioningToOrFromActive:(BOOL)a3
{
  self->_transitioningToOrFromActive = a3;
}

@end