@interface CSVSUIScene
- (BOOL)hasBeenAddedAsChildViewController;
- (CSVSUIScene)initWithViewControllerClass:(Class)a3;
- (CSVSUIScene)initWithViewControllerClass:(Class)a3 containerView:(id)a4;
- (CSVSUIScene)initWithViewControllerClass:(Class)a3 containerView:(id)a4 identifier:(id)a5;
- (CSVSUIScene)initWithViewControllerClass:(Class)a3 containerView:(id)a4 identifier:(id)a5 setupHandler:(id)a6;
- (Class)viewControllerClass;
- (NSString)identifier;
- (UIView)containerView;
- (UIViewController)viewController;
- (id)_initWithViewControllerClass:(Class)a3 containerView:(id)a4 identifier:(id)a5 setupHandler:(id)a6;
- (id)description;
- (id)setupHandler;
- (void)_popAlphaValueForViews;
- (void)_pushAlphaValue:(double)a3 forViews:(id)a4;
- (void)_setContainerView:(id)a3;
- (void)_setViewController:(id)a3;
@end

@implementation CSVSUIScene

- (CSVSUIScene)initWithViewControllerClass:(Class)a3
{
  return (CSVSUIScene *)-[CSVSUIScene _initWithViewControllerClass:containerView:identifier:setupHandler:]( self,  "_initWithViewControllerClass:containerView:identifier:setupHandler:",  a3,  0LL,  0LL,  0LL);
}

- (CSVSUIScene)initWithViewControllerClass:(Class)a3 containerView:(id)a4
{
  return (CSVSUIScene *)-[CSVSUIScene _initWithViewControllerClass:containerView:identifier:setupHandler:]( self,  "_initWithViewControllerClass:containerView:identifier:setupHandler:",  a3,  a4,  0LL,  0LL);
}

- (CSVSUIScene)initWithViewControllerClass:(Class)a3 containerView:(id)a4 identifier:(id)a5
{
  return (CSVSUIScene *)-[CSVSUIScene _initWithViewControllerClass:containerView:identifier:setupHandler:]( self,  "_initWithViewControllerClass:containerView:identifier:setupHandler:",  a3,  a4,  a5,  0LL);
}

- (CSVSUIScene)initWithViewControllerClass:(Class)a3 containerView:(id)a4 identifier:(id)a5 setupHandler:(id)a6
{
  return (CSVSUIScene *)-[CSVSUIScene _initWithViewControllerClass:containerView:identifier:setupHandler:]( self,  "_initWithViewControllerClass:containerView:identifier:setupHandler:",  a3,  a4,  a5,  a6);
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromClass(self->_viewControllerClass);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ - %p: viewControllerClass = %@; containerView = %@; identifier = %@>",
                   v5,
                   self,
                   v7,
                   self->_containerView,
                   self->_identifier));

  return v8;
}

- (id)_initWithViewControllerClass:(Class)a3 containerView:(id)a4 identifier:(id)a5 setupHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CSVSUIScene;
  v14 = -[CSVSUIScene init](&v25, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_viewControllerClass, a3);
    objc_storeStrong((id *)&v15->_containerView, a4);
    if (v12)
    {
      v16 = (NSString *)v12;
      identifier = v15->_identifier;
      v15->_identifier = v16;
    }

    else
    {
      identifier = (NSString *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v18 = objc_claimAutoreleasedReturnValue(-[NSString UUIDString](identifier, "UUIDString"));
      v19 = v15->_identifier;
      v15->_identifier = (NSString *)v18;
    }

    id v20 = objc_retainBlock(v13);
    id setupHandler = v15->_setupHandler;
    v15->_id setupHandler = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pushedAlphaValues = v15->_pushedAlphaValues;
    v15->_pushedAlphaValues = v22;
  }

  return v15;
}

- (void)_pushAlphaValue:(double)a3 forViews:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        objc_msgSend(v13, "alpha", (void)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v7 setObject:v14 forKey:v13];

        [v13 setAlpha:a3];
      }

      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  -[NSMutableArray addObject:](self->_pushedAlphaValues, "addObject:", v7);
}

- (void)_popAlphaValueForViews
{
  if (-[NSMutableArray count](self->_pushedAlphaValues, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_pushedAlphaValues, "lastObject"));
    -[NSMutableArray removeObjectAtIndex:]( self->_pushedAlphaValues,  "removeObjectAtIndex:",  (char *)-[NSMutableArray count](self->_pushedAlphaValues, "count") - 1);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyEnumerator", 0));
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v9]);
          uint64_t v11 = v10;
          if (v10)
          {
            [v10 floatValue];
            [v9 setAlpha:v12];
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v6);
    }
  }

- (void)_setContainerView:(id)a3
{
}

- (void)_setViewController:(id)a3
{
}

- (id)setupHandler
{
  return objc_retainBlock(self->_setupHandler);
}

- (BOOL)hasBeenAddedAsChildViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUIScene viewController](self, "viewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 view]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
}

@end