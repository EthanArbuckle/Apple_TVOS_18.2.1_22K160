@interface PKHostDefaults
- (BOOL)synchronize;
- (PKHostDefaults)initWithPlugIn:(id)a3;
- (PKHostPlugIn)plugin;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPlugin:(id)a3;
@end

@implementation PKHostDefaults

- (PKHostDefaults)initWithPlugIn:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PKHostDefaults;
  v5 = -[PKHostDefaults init](&v11, sel_init);
  v9 = v5;
  if (v5) {
    objc_msgSend_setPlugin_(v5, v6, (uint64_t)v4, v7, v8);
  }

  return v9;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_186A1C8E8;
  v33 = sub_186A1C8F8;
  id v34 = 0LL;
  objc_msgSend_plugin(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncService(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_plugin(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = sub_186A1C900;
  v28[3] = &unk_189F20F50;
  v28[4] = &v29;
  objc_msgSend_prefsObjectForKey_inPlugIn_result_(v14, v25, (uint64_t)v4, (uint64_t)v24, (uint64_t)v28);

  id v26 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v26;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_plugin(self, v8, v9, v10, v11);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncService(v28, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_plugin(self, v17, v18, v19, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v21, v22, v23, v24, v25);
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prefsSetObject_forKey_inPlugIn_result_(v16, v27, (uint64_t)v7, (uint64_t)v6, (uint64_t)v26, &unk_189F20F70);
}

- (BOOL)synchronize
{
  return 1;
}

- (PKHostPlugIn)plugin
{
  return (PKHostPlugIn *)objc_loadWeakRetained((id *)&self->_plugin);
}

- (void)setPlugin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end