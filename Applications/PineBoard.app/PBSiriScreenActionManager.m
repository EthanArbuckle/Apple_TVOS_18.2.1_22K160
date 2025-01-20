@interface PBSiriScreenActionManager
- (AXElement)currentApplicationElement;
- (AXElement)systemApplicationElement;
- (BOOL)isEnabled;
- (PBSiriScreenActionApplication)currentScreenActionApplication;
- (PBSiriScreenActionItem)deferredScreenActionItem;
- (PBSiriScreenActionManager)init;
- (PBSiriScreenActionManager)initWithSystemApplicationElementProvider:(id)a3;
- (PBSiriScreenActionManagerDelegate)delegate;
- (id)systemApplicationElementProvider;
- (void)setDeferredScreenActionItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSystemApplicationElement:(id)a3;
@end

@implementation PBSiriScreenActionManager

- (PBSiriScreenActionManager)init
{
  return -[PBSiriScreenActionManager initWithSystemApplicationElementProvider:]( self,  "initWithSystemApplicationElementProvider:",  &stru_1003DB438);
}

- (PBSiriScreenActionManager)initWithSystemApplicationElementProvider:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBSiriScreenActionManager;
    v7 = -[PBSiriScreenActionManager init](&v12, "init");
    if (v7)
    {
      id v8 = [v6 copy];
      id systemApplicationElementProvider = v7->_systemApplicationElementProvider;
      v7->_id systemApplicationElementProvider = v8;
    }

    return v7;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"systemApplicationElementProvider != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028BB98(a2, (uint64_t)self, (uint64_t)v11);
    }
    result = (PBSiriScreenActionManager *)_bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_1000F76CC();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Changing enabled state to: %{BOOL}d",  (uint8_t *)v7,  8u);
    }

    self->_enabled = v3;
    _AXSSetSiriSemanticContextEnabled(v3);
    -[PBSiriScreenActionManager setSystemApplicationElement:](self, "setSystemApplicationElement:", 0LL);
  }

- (PBSiriScreenActionApplication)currentScreenActionApplication
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___PBSiriScreenActionApplication);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionManager currentApplicationElement](self, "currentApplicationElement"));
  id v5 = -[PBSiriScreenActionApplication initWithAccessibilityElement:](v3, "initWithAccessibilityElement:", v4);

  return v5;
}

- (AXElement)systemApplicationElement
{
  if (-[PBSiriScreenActionManager isEnabled](self, "isEnabled"))
  {
    BOOL v3 = self->_systemApplicationElement;
    if (!v3)
    {
      uint64_t v4 = (*((uint64_t (**)(void))self->_systemApplicationElementProvider + 2))();
      BOOL v3 = (AXElement *)objc_claimAutoreleasedReturnValue(v4);
      objc_storeStrong((id *)&self->_systemApplicationElement, v3);
    }
  }

  else
  {
    BOOL v3 = 0LL;
  }

  return v3;
}

- (AXElement)currentApplicationElement
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionManager delegate](self, "delegate"));
  unsigned int v4 = [v3 siriScreenActionManagerIsSiriContentBeingDisplayed:self];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriScreenActionManager systemApplicationElement](self, "systemApplicationElement"));
  v6 = v5;
  if (v4) {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 currentApplications]);
  }
  else {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 currentApplicationsIgnoringSiri]);
  }
  id v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  return (AXElement *)v9;
}

- (PBSiriScreenActionManagerDelegate)delegate
{
  return (PBSiriScreenActionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (PBSiriScreenActionItem)deferredScreenActionItem
{
  return self->_deferredScreenActionItem;
}

- (void)setDeferredScreenActionItem:(id)a3
{
}

- (id)systemApplicationElementProvider
{
  return self->_systemApplicationElementProvider;
}

- (void)setSystemApplicationElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end