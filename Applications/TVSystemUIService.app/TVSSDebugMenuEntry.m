@interface TVSSDebugMenuEntry
- (NSString)title;
- (TVSSDebugMenuEntry)initWithEntryTitle:(id)a3 viewControllerClass:(Class)a4;
- (TVSSDebugMenuEntry)initWithEntryTitle:(id)a3 viewControllerProvider:(id)a4;
- (TVSSDebugMenuEntry)initWithViewControllerClass:(Class)a3;
- (id)viewControllerProvider;
@end

@implementation TVSSDebugMenuEntry

- (TVSSDebugMenuEntry)initWithViewControllerClass:(Class)a3
{
  v7 = self;
  v5 = NSStringFromClass(a3);
  v7 = 0LL;
  v7 = -[TVSSDebugMenuEntry initWithEntryTitle:viewControllerClass:](self, "initWithEntryTitle:viewControllerClass:");
  v6 = v7;

  objc_storeStrong((id *)&v7, 0LL);
  return v6;
}

- (TVSSDebugMenuEntry)initWithEntryTitle:(id)a3 viewControllerClass:(Class)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  Class v14 = a4;
  v4 = v16;
  v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_10001712C;
  v12 = &unk_1001B64D0;
  Class v13 = a4;
  v16 = 0LL;
  v16 = -[TVSSDebugMenuEntry initWithEntryTitle:viewControllerProvider:]( v4,  "initWithEntryTitle:viewControllerProvider:",  location[0],  &v8);
  v7 = v16;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  return v7;
}

- (TVSSDebugMenuEntry)initWithEntryTitle:(id)a3 viewControllerProvider:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  v4 = v15;
  v15 = 0LL;
  v12.receiver = v4;
  v12.super_class = (Class)&OBJC_CLASS___TVSSDebugMenuEntry;
  v15 = -[TVSSDebugMenuEntry init](&v12, "init");
  objc_storeStrong((id *)&v15, v15);
  if (v15)
  {
    v5 = (NSString *)[location[0] copy];
    title = v15->_title;
    v15->_title = v5;

    id v7 = [v13 copy];
    id viewControllerProvider = v15->_viewControllerProvider;
    v15->_id viewControllerProvider = v7;
  }

  int v10 = v15;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (id)viewControllerProvider
{
  return self->_viewControllerProvider;
}

- (void).cxx_destruct
{
}

@end