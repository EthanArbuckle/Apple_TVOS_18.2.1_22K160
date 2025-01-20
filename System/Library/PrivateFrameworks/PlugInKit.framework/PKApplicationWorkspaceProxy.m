@interface PKApplicationWorkspaceProxy
+ (id)defaultWorkspace;
- (BOOL)registerPlugin:(id)a3;
- (BOOL)unregisterPlugin:(id)a3;
- (LSApplicationWorkspace)lsObject;
- (PKApplicationWorkspaceProxy)init;
- (id)installedPlugins;
- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation PKApplicationWorkspaceProxy

- (PKApplicationWorkspaceProxy)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PKApplicationWorkspaceProxy;
  v6 = -[PKApplicationWorkspaceProxy init](&v10, sel_init);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_defaultWorkspace(MEMORY[0x189605750], v2, v3, v4, v5);
    lsObject = v6->_lsObject;
    v6->_lsObject = (LSApplicationWorkspace *)v7;
  }

  return v6;
}

+ (id)defaultWorkspace
{
  if (qword_18C4AE1C8 != -1) {
    dispatch_once(&qword_18C4AE1C8, &unk_189F21078);
  }
  return (id)qword_18C4AE1C0;
}

- (id)installedPlugins
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_installedPlugins(v5, v6, v7, v8, v9);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)addObserver:(id)a3
{
  id v13 = a3;
  uint64_t v4 = (void *)MEMORY[0x186E413A8]();
  objc_msgSend_lsObject(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_(v9, v10, (uint64_t)v13, v11, v12);

  objc_autoreleasePoolPop(v4);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_msgSend_lsObject(self, v5, v6, v7, v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v12, v9, (uint64_t)v4, v10, v11);
}

- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_lsObject(self, v8, v9, v10, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pluginsMatchingQuery_applyFilter_(v12, v13, (uint64_t)v7, (uint64_t)v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)registerPlugin:(id)a3
{
  id v4 = a3;
  objc_msgSend_lsObject(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v13 = objc_msgSend_registerPlugin_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (BOOL)unregisterPlugin:(id)a3
{
  id v4 = a3;
  objc_msgSend_lsObject(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v13 = objc_msgSend_unregisterPlugin_(v9, v10, (uint64_t)v4, v11, v12);

  return v13;
}

- (LSApplicationWorkspace)lsObject
{
  return self->_lsObject;
}

- (void).cxx_destruct
{
}

@end