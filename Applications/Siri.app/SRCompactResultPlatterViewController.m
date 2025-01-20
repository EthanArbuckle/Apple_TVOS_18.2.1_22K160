@interface SRCompactResultPlatterViewController
- (NSArray)siriContentViewControllers;
- (id)_createReusableViewWithClass:(Class)a3 snippetViewController:(id)a4;
- (void)setSiriContentViewControllers:(id)a3;
@end

@implementation SRCompactResultPlatterViewController

- (void)setSiriContentViewControllers:(id)a3
{
  v5 = (NSArray *)a3;
  p_siriContentViewControllers = &self->_siriContentViewControllers;
  if (self->_siriContentViewControllers != v5)
  {
    v24 = v5;
    objc_storeStrong((id *)&self->_siriContentViewControllers, a3);
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    if (-[NSArray count](*p_siriContentViewControllers, "count"))
    {
      unint64_t v8 = 0LL;
      v9 = &OBJC_CLASS___SASSystemState_ptr;
      v26 = self;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](*p_siriContentViewControllers, "objectAtIndex:", v8, v24));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](*p_siriContentViewControllers, "lastObject"));

        objc_opt_class(v9[106], v12);
        if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
        {
          id v14 = v10;
          -[NSMutableArray addObject:](v7, "addObject:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue( -[SRCompactResultPlatterViewController _createReusableViewWithClass:snippetViewController:]( self,  "_createReusableViewWithClass:snippetViewController:",  [v14 footerViewClass],  v14));
          [v14 configureReusableFooterView:v15];
          id v16 = objc_alloc_init(&OBJC_CLASS___SiriUIFooterViewController);
          [v16 setView:v15];
          if (v15)
          {
            *(void *)&double v18 = objc_opt_class(v15, v17).n128_u64[0];
            objc_msgSend(v19, "defaultHeight", v18);
            if (v20 > 0.0)
            {
              v21 = objc_alloc_init(&OBJC_CLASS___UIViewController);
              id v22 = objc_alloc_init(&OBJC_CLASS___SiriSharedUIContentPlatterSeparatorView);
              [v22 setSeparatorType:1];
              -[UIViewController setView:](v21, "setView:", v22);
              -[NSMutableArray addObject:](v7, "addObject:", v21);

              self = v26;
            }
          }

          -[NSMutableArray addObject:](v7, "addObject:", v16);

          v9 = &OBJC_CLASS___SASSystemState_ptr;
        }

        ++v8;
        if (v10 != v11)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](*p_siriContentViewControllers, "objectAtIndex:", v8));
          -[SRCompactResultPlatterViewController appendSeparatorToViewControllers:forNextViewController:]( self,  "appendSeparatorToViewControllers:forNextViewController:",  v7,  v23);
        }
      }

      while (-[NSArray count](*p_siriContentViewControllers, "count") > v8);
    }

    -[SRCompactResultPlatterViewController setContentViewControllers:](self, "setContentViewControllers:", v7, v24);

    v5 = v25;
  }
}

- (id)_createReusableViewWithClass:(Class)a3 snippetViewController:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    a3 = (Class)objc_msgSend( [a3 alloc],  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    if ((objc_opt_respondsToSelector(a3, "setSnippetViewController:") & 1) != 0) {
      -[objc_class setSnippetViewController:](a3, "setSnippetViewController:", v5);
    }
  }

  return a3;
}

- (NSArray)siriContentViewControllers
{
  return self->_siriContentViewControllers;
}

- (void).cxx_destruct
{
}

@end