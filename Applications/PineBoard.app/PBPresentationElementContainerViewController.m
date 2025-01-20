@interface PBPresentationElementContainerViewController
- (NSArray)presentationElementViewControllers;
- (PBPresentationElementContainerViewController)initWithPresentationElementViewControllers:(id)a3;
- (id)preferredFocusEnvironments;
- (void)viewDidLoad;
@end

@implementation PBPresentationElementContainerViewController

- (PBPresentationElementContainerViewController)initWithPresentationElementViewControllers:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBPresentationElementContainerViewController;
  v5 = -[PBPresentationElementContainerViewController initWithNibName:bundle:]( &v10,  "initWithNibName:bundle:",  0LL,  0LL);
  if (v5)
  {
    id v6 = [v4 mutableCopy];
    [v6 sortUsingComparator:&stru_1003D7B68];
    v7 = (NSArray *)[v6 copy];
    presentationElementViewControllers = v5->_presentationElementViewControllers;
    v5->_presentationElementViewControllers = v7;
  }

  return v5;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBPresentationElementContainerViewController;
  -[PBPresentationElementContainerViewController viewDidLoad](&v12, "viewDidLoad");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  v3 = self->_presentationElementViewControllers;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[PBPresentationElementContainerViewController bs_addChildViewController:animated:transitionBlock:]( self,  "bs_addChildViewController:animated:transitionBlock:",  _NSConcreteStackBlock,  3221225472LL,  sub_10010D584,  &unk_1003D7798,  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  self,  (void)v8);
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v13,  16LL);
    }

    while (v5);
  }
}

- (id)preferredFocusEnvironments
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray reverseObjectEnumerator]( self->_presentationElementViewControllers,  "reverseObjectEnumerator",  0LL));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = &__NSArray0__struct;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        __int128 v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ([v8 state] == (id)3)
        {
          v14 = v8;
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
          goto LABEL_12;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v6 = &__NSArray0__struct;
  }

- (NSArray)presentationElementViewControllers
{
  return self->_presentationElementViewControllers;
}

- (void).cxx_destruct
{
}

@end