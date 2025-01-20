@interface PKServiceDefaults
- (BOOL)synchronize;
- (PKServiceDefaults)initWithPersonality:(id)a3;
- (PKServicePersonality)personality;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPersonality:(id)a3;
@end

@implementation PKServiceDefaults

- (PKServiceDefaults)initWithPersonality:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PKServiceDefaults;
  v5 = -[PKServiceDefaults init](&v11, sel_init);
  v9 = v5;
  if (v5) {
    objc_msgSend_setPersonality_(v5, v6, (uint64_t)v4, v7, v8);
  }

  return v9;
}

- (id)objectForKey:(id)a3
{
  id v4 = (__CFString *)a3;
  objc_msgSend_personality(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v9, v10, v11, v12, v13);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)CFPreferencesCopyAppValue(v4, v14);
  return v15;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v6 = (__CFString *)a4;
  id value = a3;
  objc_msgSend_personality(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v11, v12, v13, v14, v15);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(v6, value, v16);
}

- (BOOL)synchronize
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v5, v6, v7, v8, v9);
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return CFPreferencesAppSynchronize(v10) != 0;
}

- (PKServicePersonality)personality
{
  return (PKServicePersonality *)objc_loadWeakRetained((id *)&self->_personality);
}

- (void)setPersonality:(id)a3
{
}

- (void).cxx_destruct
{
}

@end