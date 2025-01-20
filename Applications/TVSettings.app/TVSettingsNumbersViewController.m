@interface TVSettingsNumbersViewController
- (TVSettingsNumberingSystemsFacade)numberingSystemsFacade;
- (TVSettingsNumbersViewController)initWithNumberingSystemsFacade:(id)a3;
- (id)loadSettingGroups;
- (void)_setNumberingSystem:(id)a3;
- (void)setNumberingSystemsFacade:(id)a3;
@end

@implementation TVSettingsNumbersViewController

- (TVSettingsNumbersViewController)initWithNumberingSystemsFacade:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___TVSettingsNumbersViewController;
    v8 = -[TVSettingsNumbersViewController init](&v14, "init");
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_numberingSystemsFacade, a3);
      uint64_t v10 = TSKLocString(@"NumberingSystemTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[TVSettingsNumbersViewController setTitle:](v9, "setTitle:", v11);
    }

    return v9;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"numberingSystemsFacade != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F67F0(a2, (uint64_t)self);
    }
    result = (TVSettingsNumbersViewController *)_bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
  }

  return result;
}

- (id)loadSettingGroups
{
  v3 = self->_numberingSystemsFacade;
  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_100014EA0;
  uint64_t v10 = &unk_10018ED48;
  objc_copyWeak(&v11, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v3,  @"availableNumberingSystems",  &v7));
  v13 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v13,  1LL,  v7,  v8,  v9,  v10));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

- (void)_setNumberingSystem:(id)a3
{
  id v11 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v11 representedObject]);
  Class v6 = NSClassFromString(@"TVSettingsNumberingSystem");
  if (!v5)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F68D4(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x1000150E4LL);
  }

  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSettingsNumberingSystemClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F68D4(a2);
    }
    goto LABEL_11;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v11 representedObject]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsNumberingSystemsFacade currentNumberingSystem]( self->_numberingSystemsFacade,  "currentNumberingSystem"));
  char v9 = BSEqualObjects(v7, v8);

  if ((v9 & 1) == 0) {
    -[TVSettingsNumberingSystemsFacade setCurrentNumberingSystem:]( self->_numberingSystemsFacade,  "setCurrentNumberingSystem:",  v7);
  }
}

- (TVSettingsNumberingSystemsFacade)numberingSystemsFacade
{
  return self->_numberingSystemsFacade;
}

- (void)setNumberingSystemsFacade:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end