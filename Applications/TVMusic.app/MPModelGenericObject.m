@interface MPModelGenericObject
- (MPModelPlayEvent)playEvent;
@end

@implementation MPModelGenericObject

- (MPModelPlayEvent)playEvent
{
  uint64_t v3 = (uint64_t)-[MPModelGenericObject type](self, "type");
  if (v3 > 3)
  {
    if (v3 == 4)
    {
      v4 = objc_alloc(&OBJC_CLASS___MPModelPlayEvent);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelGenericObject identifiers](self, "identifiers"));
      v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472LL;
      v16 = sub_100015E54;
      v17 = &unk_100269568;
      v18 = self;
      v6 = &v14;
      goto LABEL_10;
    }

    if (v3 == 13)
    {
      v4 = objc_alloc(&OBJC_CLASS___MPModelPlayEvent);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelGenericObject identifiers](self, "identifiers"));
      v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472LL;
      v11 = sub_100015EA4;
      v12 = &unk_100269568;
      v13 = self;
      v6 = &v9;
      goto LABEL_10;
    }
  }

  else
  {
    if (v3 == 2)
    {
      v4 = objc_alloc(&OBJC_CLASS___MPModelPlayEvent);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelGenericObject identifiers](self, "identifiers"));
      v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472LL;
      v26 = sub_100015DB4;
      v27 = &unk_100269568;
      v28 = self;
      v6 = &v24;
      goto LABEL_10;
    }

    if (v3 == 3)
    {
      v4 = objc_alloc(&OBJC_CLASS___MPModelPlayEvent);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelGenericObject identifiers](self, "identifiers"));
      v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472LL;
      v21 = sub_100015E04;
      v22 = &unk_100269568;
      v23 = self;
      v6 = &v19;
LABEL_10:
      v7 = -[MPModelPlayEvent initWithIdentifiers:block:]( v4,  "initWithIdentifiers:block:",  v5,  v6,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28);

      return v7;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MPModelGenericObject+TVMusic: Unhandled container object: %@",  buf,  0xCu);
  }

  return (MPModelPlayEvent *)0LL;
}

@end