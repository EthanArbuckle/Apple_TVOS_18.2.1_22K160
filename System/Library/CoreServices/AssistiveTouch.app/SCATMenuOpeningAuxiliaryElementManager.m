@interface SCATMenuOpeningAuxiliaryElementManager
- (BOOL)containsElement:(id)a3;
- (BOOL)isVisibilityTiedToFocus;
- (BOOL)providesElements;
- (SCATMenuOpeningAuxiliaryElementManager)init;
- (SCATStaticElementProvider)elementProvider;
- (UIControl)menuOpeningElement;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (int64_t)numberOfElements;
- (void)dealloc;
- (void)didFinishProvidingElements;
- (void)setElementProvider:(id)a3;
- (void)willBeginProvidingElements;
@end

@implementation SCATMenuOpeningAuxiliaryElementManager

- (SCATMenuOpeningAuxiliaryElementManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SCATMenuOpeningAuxiliaryElementManager;
  v2 = -[SCATMenuOpeningAuxiliaryElementManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___SCATMenuOpeningAuxiliaryElementViewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementViewController menuOpeningElement](v3, "menuOpeningElement"));
    [v4 setScatAuxiliaryElementManager:v2];

    -[SCATAuxiliaryElementManager setViewController:](v2, "setViewController:", v3);
    v5 = objc_alloc(&OBJC_CLASS___SCATStaticElementProvider);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementViewController menuOpeningElement](v3, "menuOpeningElement"));
    v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    v8 = -[SCATStaticElementProvider initWithElements:](v5, "initWithElements:", v7);

    -[SCATMenuOpeningAuxiliaryElementManager setElementProvider:](v2, "setElementProvider:", v8);
  }

  return v2;
}

- (BOOL)isVisibilityTiedToFocus
{
  return 0;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
  objc_opt_class(&OBJC_CLASS___SCATMenuOpeningAuxiliaryElementViewController, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 menuOpeningElement]);
    [v8 setScatAuxiliaryElementManager:0];
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATMenuOpeningAuxiliaryElementManager;
  -[SCATMenuOpeningAuxiliaryElementManager dealloc](&v9, "dealloc");
}

- (UIControl)menuOpeningElement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 menuOpeningElement]);

  return (UIControl *)v3;
}

- (BOOL)providesElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager elementProvider](self, "elementProvider"));
  unsigned __int8 v3 = [v2 providesElements];

  return v3;
}

- (id)firstElementWithOptions:(int *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager elementProvider](self, "elementProvider"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstElementWithOptions:a3]);

  return v5;
}

- (id)lastElementWithOptions:(int *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager elementProvider](self, "elementProvider"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastElementWithOptions:a3]);

  return v5;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager elementProvider](self, "elementProvider"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementBefore:v8 didWrap:a4 options:a5]);

  return v10;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager elementProvider](self, "elementProvider"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementAfter:v8 didWrap:a4 options:a5]);

  return v10;
}

- (void)willBeginProvidingElements
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager elementProvider](self, "elementProvider"));
  [v2 willBeginProvidingElements];
}

- (void)didFinishProvidingElements
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager elementProvider](self, "elementProvider"));
  [v2 didFinishProvidingElements];
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager elementProvider](self, "elementProvider"));
  unsigned __int8 v6 = [v5 containsElement:v4];

  return v6;
}

- (int64_t)numberOfElements
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager elementProvider](self, "elementProvider"));
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (SCATStaticElementProvider)elementProvider
{
  return self->_elementProvider;
}

- (void)setElementProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end