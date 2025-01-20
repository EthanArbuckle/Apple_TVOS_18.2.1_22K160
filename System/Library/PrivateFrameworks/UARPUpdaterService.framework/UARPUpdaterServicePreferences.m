@interface UARPUpdaterServicePreferences
- (NSString)domain;
- (UARPUpdaterServicePreferences)initWithDomain:(id)a3;
- (id)uuidForAccessory:(id)a3 serialNumber:(id)a4 error:(id *)a5;
@end

@implementation UARPUpdaterServicePreferences

- (UARPUpdaterServicePreferences)initWithDomain:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UARPUpdaterServicePreferences;
  v5 = -[UARPUpdaterServicePreferences init](&v10, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)uuidForAccessory:(id)a3 serialNumber:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void *)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:self->_domain];
  if (v10)
  {
    [NSString stringWithFormat:@"%@-%@", v8, v9];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v10 objectForKey:v11];
    if (v12)
    {
      v13 = (void *)v12;
      uint64_t v14 = [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:a5];
      if (v14)
      {
        v15 = (NSString *)v14;
        v16 = v13;
      }

      else
      {
        [v10 removeObjectForKey:v8];
        [MEMORY[0x189607AB8] UUID];
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x1896078F8] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        [v10 setObject:v16 forKey:v11];
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v22 = v15;
          __int16 v23 = 2112;
          id v24 = v8;
          __int16 v25 = 2112;
          id v26 = v9;
          _os_log_impl( &dword_1881FB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Updated corrupt UUID <%@> for identifier <%@> and serial number <%@>",  buf,  0x20u);
        }
      }

      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 138412802;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      v18 = (os_log_s *)MEMORY[0x1895F8DA0];
      v19 = "Existing UUID <%@> for identifier <%@> and serial number <%@>";
    }

    else
    {
      [MEMORY[0x189607AB8] UUID];
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1896078F8] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:a5];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setObject:v16 forKey:v11];
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }

      *(_DWORD *)buf = 138412802;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      v18 = (os_log_s *)MEMORY[0x1895F8DA0];
      v19 = "Created new UUID <%@> for identifier <%@> and serial number <%@>";
    }

    _os_log_impl(&dword_1881FB000, v18, OS_LOG_TYPE_INFO, v19, buf, 0x20u);
    goto LABEL_15;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    domain = self->_domain;
    *(_DWORD *)buf = 138412290;
    v22 = domain;
    _os_log_impl(&dword_1881FB000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "Could not query prefs at %@", buf, 0xCu);
  }

  v15 = 0LL;
LABEL_16:

  return v15;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end