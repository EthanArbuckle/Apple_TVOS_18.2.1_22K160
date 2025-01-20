@interface TVSSMenuItem
- (BOOL)hasFocusableContent;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (TVSObserverSet)observers;
- (TVSSMenuItem)initWithIdentifier:(id)a3;
- (TVSSMenuItem)initWithIdentifier:(id)a3 hasFocusableContent:(BOOL)a4;
- (TVSSMenuItem)initWithIdentifier:(id)a3 hasFocusableContent:(BOOL)a4 platterViewControllerClass:(Class)a5;
- (TVSSMenuItem)initWithIdentifier:(id)a3 hasFocusableContent:(BOOL)a4 platterViewControllerClassProvider:(id)a5;
- (TVSSMenuItem)initWithIdentifier:(id)a3 platterViewControllerClass:(Class)a4;
- (TVSSVisualContent)visualContent;
- (id)createPlatterViewControllerWithPresentationContext:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)platterViewControllerClassProvider;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_notifyVisualContentDidChange;
- (void)addMenuItemObserver:(id)a3;
- (void)removeMenuItemObserver:(id)a3;
- (void)setVisualContent:(id)a3;
@end

@implementation TVSSMenuItem

- (TVSSMenuItem)initWithIdentifier:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0LL;
  v7 = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:]( v3,  "initWithIdentifier:hasFocusableContent:",  location[0],  1LL);
  objc_storeStrong((id *)&v7, v7);
  v5 = v7;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
  return v5;
}

- (TVSSMenuItem)initWithIdentifier:(id)a3 platterViewControllerClass:(Class)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v9;
  v9 = 0LL;
  v9 = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:platterViewControllerClass:]( v4,  "initWithIdentifier:hasFocusableContent:platterViewControllerClass:",  location[0],  1LL,  a4);
  objc_storeStrong((id *)&v9, v9);
  v7 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v7;
}

- (TVSSMenuItem)initWithIdentifier:(id)a3 hasFocusableContent:(BOOL)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v9;
  v9 = 0LL;
  v9 = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:platterViewControllerClass:]( v4,  "initWithIdentifier:hasFocusableContent:platterViewControllerClass:",  location[0],  a4,  0LL);
  objc_storeStrong((id *)&v9, v9);
  v7 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v7;
}

- (TVSSMenuItem)initWithIdentifier:(id)a3 hasFocusableContent:(BOOL)a4 platterViewControllerClass:(Class)a5
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v17 = a4;
  Class v16 = a5;
  v5 = v19;
  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_1000667A4;
  v14 = &unk_1001B8690;
  Class v15 = a5;
  v19 = 0LL;
  v19 = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:platterViewControllerClassProvider:]( v5,  "initWithIdentifier:hasFocusableContent:platterViewControllerClassProvider:",  location[0],  a4,  &v10);
  objc_storeStrong((id *)&v19, v19);
  v9 = v19;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  return v9;
}

- (TVSSMenuItem)initWithIdentifier:(id)a3 hasFocusableContent:(BOOL)a4 platterViewControllerClassProvider:(id)a5
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v18 = a4;
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  v5 = v20;
  v20 = 0LL;
  v16.receiver = v5;
  v16.super_class = (Class)&OBJC_CLASS___TVSSMenuItem;
  v20 = -[TVSSMenuItem init](&v16, "init");
  objc_storeStrong((id *)&v20, v20);
  if (v20)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v20->_observers;
    v20->_observers = v6;

    v8 = (NSString *)[location[0] copy];
    identifier = v20->_identifier;
    v20->_identifier = v8;

    v20->_hasFocusableContent = v18;
    id v10 = [v17 copy];
    id platterViewControllerClassProvider = v20->_platterViewControllerClassProvider;
    v20->_id platterViewControllerClassProvider = v10;
  }

  v13 = v20;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  return v13;
}

- (void)setVisualContent:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  if ((BSEqualObjects(v6->_visualContent, location[0]) & 1) == 0)
  {
    v3 = (TVSSVisualContent *)[location[0] copyWithZone:0];
    visualContent = v6->_visualContent;
    v6->_visualContent = v3;

    -[TVSSMenuItem _notifyVisualContentDidChange](v6, "_notifyVisualContentDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (id)createPlatterViewControllerWithPresentationContext:(id)a3
{
  v31 = self;
  SEL v30 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v28 = 0LL;
  id v27 = -[TVSSMenuItem platterViewControllerClassProvider](v31, "platterViewControllerClassProvider");
  if (v27)
  {
    id v3 = (id)(*((uint64_t (**)(id, TVSSMenuItem *, id))v27 + 2))( v27,  v31,  location);
    id v4 = v28;
    id v28 = v3;

    id v26 = v28;
    if (v26)
    {
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIViewController);
      if (((objc_opt_isKindOfClass(v26, v5) ^ 1) & 1) != 0)
      {
        v19 = (objc_class *)[v26 classForCoder];
        if (v19)
        {
          v6 = NSStringFromClass(v19);
        }

        else
        {
          aClass = (objc_class *)objc_opt_class(v26);
          v6 = NSStringFromClass(aClass);
        }

        id v17 = v6;
        v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___UIViewController);
        objc_super v16 = NSStringFromClass(v7);
        v24 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value for '%@' was of unexpected class %@. Expected %@.",  @"viewController",  v17,  v16);

        id v23 = &_os_log_default;
        char v22 = 16;
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
        {
          log = (os_log_s *)v23;
          os_log_type_t type = v22;
          Class v15 = NSStringFromSelector(v30);
          int v11 = v15;
          v21 = v11;
          v8 = (objc_class *)objc_opt_class(v31);
          v14 = NSStringFromClass(v8);
          v20 = v14;
          sub_10000583C( (uint64_t)v32,  (uint64_t)v11,  (uint64_t)v20,  (uint64_t)v31,  (uint64_t)@"TVSSMenuItem.m",  85,  (uint64_t)v24);
          _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v32,  0x3Au);

          objc_storeStrong((id *)&v20, 0LL);
          objc_storeStrong((id *)&v21, 0LL);
        }

        objc_storeStrong(&v23, 0LL);
        _bs_set_crash_log_message(-[NSString UTF8String](v24, "UTF8String"));
        __break(0);
        JUMPOUT(0x100066D40LL);
      }

      int v25 = 0;
    }

    else
    {
      int v25 = 2;
    }

    objc_storeStrong(&v26, 0LL);
  }

  id v10 = v28;
  int v25 = 1;
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&location, 0LL);
  return v10;
}

- (void)addMenuItemObserver:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVSSMenuItem observers](v6, "observers");
  id v3 = -[TVSObserverSet addObserver:](v4, "addObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)removeMenuItemObserver:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSMenuItem observers](v5, "observers");
  -[TVSObserverSet removeObserver:](v3, "removeObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (BOOL)isEqual:(id)a3
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v26 == location[0])
  {
    char v27 = 1;
    int v24 = 1;
  }

  else
  {
    id v23 = location[0];
    char v22 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v23,  objc_opt_class(&OBJC_CLASS___TVSSMenuItem));
    v6 = v22;
    v7 = -[TVSSMenuItem identifier](v26, "identifier");
    objc_super v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_100067170;
    v20 = &unk_1001B60F8;
    id v21 = v23;
    id v3 = -[BSEqualsBuilder appendObject:counterpart:](v6, "appendObject:counterpart:", v7, &v16);

    v9 = v22;
    unsigned __int8 v8 = -[TVSSMenuItem hasFocusableContent](v26, "hasFocusableContent");
    id v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    v13 = sub_1000671A0;
    v14 = &unk_1001B7A30;
    id v15 = v23;
    id v4 = -[BSEqualsBuilder appendBool:counterpart:](v9, "appendBool:counterpart:", v8 & 1, &v10);
    char v27 = -[BSEqualsBuilder isEqual](v22, "isEqual") & 1;
    int v24 = 1;
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong((id *)&v22, 0LL);
    objc_storeStrong(&v23, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v27 & 1;
}

- (unint64_t)hash
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v5 = v8[0];
  v6 = -[TVSSMenuItem identifier](v9, "identifier");
  id v2 = objc_msgSend(v5, "appendObject:");

  id v3 = objc_msgSend(v8[0], "appendBool:", -[TVSSMenuItem hasFocusableContent](v9, "hasFocusableContent"));
  id v7 = [v8[0] hash];
  objc_storeStrong(v8, 0LL);
  return (unint64_t)v7;
}

- (NSString)description
{
  return (NSString *)-[TVSSMenuItem succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSMenuItem descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (id)succinctDescription
{
  id v3 = -[TVSSMenuItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v13 = self;
  v12[1] = (id)a2;
  v12[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v6 = v12[0];
  id v7 = -[TVSSMenuItem identifier](v13, "identifier");
  id v2 = objc_msgSend(v6, "appendObject:withName:");

  id v8 = v12[0];
  id v10 = -[TVSSMenuItem visualContent](v13, "visualContent");
  id v9 =  +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:");
  id v3 = objc_msgSend(v8, "appendObject:withName:");

  id v4 =  objc_msgSend( v12[0],  "appendBool:withName:",  -[TVSSMenuItem hasFocusableContent](v13, "hasFocusableContent"),  @"hasFocusableContent");
  id v11 = v12[0];
  objc_storeStrong(v12, 0LL);
  return v11;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSMenuItem descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v12 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v14);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v12, "setActiveMultilinePrefix:", location[0]);
  id v7 = v12;
  id v8 = -[TVSSMenuItem identifier](v14, "identifier");
  id v3 = -[BSDescriptionBuilder appendObject:withName:](v7, "appendObject:withName:");

  id v9 = v12;
  id v10 = -[TVSSMenuItem visualContent](v14, "visualContent");
  id v4 = -[BSDescriptionBuilder appendObject:withName:](v9, "appendObject:withName:");

  id v5 =  -[BSDescriptionBuilder appendBool:withName:]( v12,  "appendBool:withName:",  -[TVSSMenuItem hasFocusableContent](v14, "hasFocusableContent"),  @"hasFocusableContent");
  id v11 = v12;
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v11;
}

- (void)_notifyVisualContentDidChange
{
  id v9 = self;
  v8[1] = (id)a2;
  id v2 = -[TVSSMenuItem observers](self, "observers");
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_100067770;
  id v7 = &unk_1001B86B8;
  v8[0] = v9;
  -[TVSObserverSet enumerateObserversUsingBlock:](v2, "enumerateObserversUsingBlock:");

  objc_storeStrong(v8, 0LL);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (TVSSVisualContent)visualContent
{
  return self->_visualContent;
}

- (BOOL)hasFocusableContent
{
  return self->_hasFocusableContent;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (id)platterViewControllerClassProvider
{
  return self->_platterViewControllerClassProvider;
}

- (void).cxx_destruct
{
}

@end