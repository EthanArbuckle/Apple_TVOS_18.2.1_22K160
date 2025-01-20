@interface _PBAssertionServiceClient
- (BSServiceConnectionHost)connection;
- (NSDictionary)domains;
- (NSMutableDictionary)assertions;
- (_PBAssertionServiceClient)initWithConnection:(id)a3 domains:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setAssertionStatus:(id)a3 forDomain:(id)a4 withReasons:(id)a5;
@end

@implementation _PBAssertionServiceClient

- (_PBAssertionServiceClient)initWithConnection:(id)a3 domains:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  Class v9 = NSClassFromString(@"BSServiceConnection");
  if (!v8)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271758();
    }
LABEL_23:
    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x100025CECLL);
  }

  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:BSServiceConnectionClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271758();
    }
    _bs_set_crash_log_message([v20 UTF8String]);
    __break(0);
    JUMPOUT(0x100025D50LL);
  }

  id v10 = v7;
  Class v11 = NSClassFromString(@"NSDictionary");
  if (!v10)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271808();
    }
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x100025DB4LL);
  }

  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271808();
    }
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x100025E18LL);
  }

  if (![v10 count])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[domains count] > 0"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002718B8();
    }
    goto LABEL_23;
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____PBAssertionServiceClient;
  v12 = -[_PBAssertionServiceClient init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_connection, v8);
    v14 = (NSDictionary *)[v10 copy];
    domains = v13->_domains;
    v13->_domains = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    assertions = v13->_assertions;
    v13->_assertions = v16;
  }

  return v13;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_connection == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271A08();
    }
LABEL_9:
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x100025F48LL);
  }

  if (self->_assertions)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_assertions == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100271960();
    }
    goto LABEL_9;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____PBAssertionServiceClient;
  -[_PBAssertionServiceClient dealloc](&v5, "dealloc");
}

- (void)invalidate
{
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained invalidate];

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_assertions,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1003D10B0);
  objc_storeWeak((id *)p_connection, 0LL);
  domains = self->_domains;
  self->_domains = 0LL;

  assertions = self->_assertions;
  self->_assertions = 0LL;
}

- (void)setAssertionStatus:(id)a3 forDomain:(id)a4 withReasons:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [a3 BOOLValue];
  id v11 = sub_1000F6D6C();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v29[0] = 67109634;
    v29[1] = v10;
    __int16 v30 = 2114;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = WeakRetained;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Updating assertion status {isActive=%{BOOL}d, domain=%{public}@, connection=%@}",  (uint8_t *)v29,  0x1Cu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_domains, "objectForKey:", v8));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_assertions, "objectForKey:", v8));
    v15 = v14;
    if (v14) {
      unsigned int v16 = 0;
    }
    else {
      unsigned int v16 = v10;
    }
    if (v16 == 1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 array]);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", @", "));
      v19 = v18;
      if (v18)
      {
        id v20 = v18;
      }

      else
      {
        id v24 = objc_loadWeakRetained((id *)&self->_connection);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 remoteProcess]);
        id v20 = (id)objc_claimAutoreleasedReturnValue([v25 description]);
      }

      id v26 = objc_loadWeakRetained((id *)&self->_connection);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v13 acquireForReason:v20 withConnection:v26]);

      -[NSMutableDictionary setObject:forKey:](self->_assertions, "setObject:forKey:", v27, v8);
    }

    else
    {
      if (v14) {
        char v23 = v10;
      }
      else {
        char v23 = 1;
      }
      if ((v23 & 1) == 0)
      {
        [v14 invalidate];
        -[NSMutableDictionary removeObjectForKey:](self->_assertions, "removeObjectForKey:", v8);
      }
    }
  }

  else
  {
    id v21 = sub_1000F6D6C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100271AB0((uint64_t)self, v22);
    }

    -[_PBAssertionServiceClient invalidate](self, "invalidate");
  }
}

- (BSServiceConnectionHost)connection
{
  return (BSServiceConnectionHost *)objc_loadWeakRetained((id *)&self->_connection);
}

- (NSDictionary)domains
{
  return self->_domains;
}

- (NSMutableDictionary)assertions
{
  return self->_assertions;
}

- (void).cxx_destruct
{
}

@end