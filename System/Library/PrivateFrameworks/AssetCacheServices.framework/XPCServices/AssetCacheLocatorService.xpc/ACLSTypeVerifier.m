@interface ACLSTypeVerifier
- (ACLSTypeVerifier)initWithTemplate:(id)a3;
- (BOOL)verify:(id)a3 name:(id)a4 tag:(unsigned int)a5;
- (BOOL)verify:(id)a3 name:(id)a4 withTemplate:(id)a5 tag:(unsigned int)a6;
- (NSDictionary)template;
- (id)sanitize:(id)a3 tag:(unsigned int)a4;
- (id)sanitize:(id)a3 withTemplate:(id)a4 tag:(unsigned int)a5;
- (void)setTemplate:(id)a3;
@end

@implementation ACLSTypeVerifier

- (ACLSTypeVerifier)initWithTemplate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ACLSTypeVerifier;
  v5 = -[ACLSTypeVerifier init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[ACLSTypeVerifier setTemplate:](v5, "setTemplate:", v4);
  }

  return v6;
}

- (BOOL)verify:(id)a3 name:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSTypeVerifier template](self, "template"));
  LOBYTE(v5) = -[ACLSTypeVerifier verify:name:withTemplate:tag:](self, "verify:name:withTemplate:tag:", v9, v8, v10, v5);

  return v5;
}

- (id)sanitize:(id)a3 tag:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSTypeVerifier template](self, "template"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACLSTypeVerifier sanitize:withTemplate:tag:](self, "sanitize:withTemplate:tag:", v6, v7, v4));

  return v8;
}

- (BOOL)verify:(id)a3 name:(id)a4 withTemplate:(id)a5 tag:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_10001F738(v13, (uint64_t)v11, a6);
  }
  if (!v12 || (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v12, v14) & 1) == 0)) {
    sub_10001F6E8();
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"mandatory"]);
  unsigned int v16 = [v15 BOOLValue];

  if (v10)
  {
    v17 = (objc_class *)[v12 objectForKey:@"class"];
    if (!v17) {
      sub_10001F710();
    }
    if ((objc_opt_isKindOfClass(v10, v17) & 1) != 0)
    {
      if (v17 == (objc_class *)objc_opt_class(&OBJC_CLASS___NSArray)
        || v17 == (objc_class *)objc_opt_class(&OBJC_CLASS___NSMutableArray))
      {
        *(void *)buf = 0LL;
        *(void *)v45 = buf;
        *(void *)&v45[8] = 0x2020000000LL;
        v45[16] = 1;
        v29 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"template"]);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_10000209C;
        v39[3] = &unk_1000309F0;
        v39[4] = self;
        id v40 = v11;
        id v30 = v29;
        unsigned int v43 = a6;
        id v41 = v30;
        v42 = buf;
        [v10 enumerateObjectsUsingBlock:v39];
        char v18 = *(_BYTE *)(*(void *)v45 + 24LL) != 0;
      }

      else
      {
        if (v17 != (objc_class *)objc_opt_class(&OBJC_CLASS___NSDictionary)
          && v17 != (objc_class *)objc_opt_class(&OBJC_CLASS___NSMutableDictionary))
        {
          char v18 = 1;
          goto LABEL_22;
        }

        *(void *)buf = 0LL;
        *(void *)v45 = buf;
        *(void *)&v45[8] = 0x2020000000LL;
        v45[16] = 1;
        v31 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"template"]);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_10000213C;
        v33[3] = &unk_100030A18;
        id v34 = v10;
        v35 = self;
        unsigned int v38 = a6;
        id v36 = v11;
        v37 = buf;
        [v31 enumerateKeysAndObjectsUsingBlock:v33];
        char v18 = *(_BYTE *)(*(void *)v45 + 24LL) != 0;
      }

      _Block_object_dispose(buf, 8);
      goto LABEL_22;
    }

    v21 = gLogHandle;
    char v18 = 0;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = currentQueueName();
      v24 = (objc_class *)objc_opt_class(v10);
      v25 = NSStringFromClass(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = NSStringFromClass(v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 67110403;
      *(_DWORD *)&buf[4] = a6;
      *(_WORD *)v45 = 2080;
      *(void *)&v45[2] = v23;
      *(_WORD *)&v45[10] = 2112;
      *(void *)&v45[12] = v11;
      __int16 v46 = 2112;
      v47 = v26;
      __int16 v48 = 2112;
      v49 = v28;
      __int16 v50 = 2113;
      id v51 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#%08x [%s] %@ has wrong type: %@; expected %@: %{private}@",
        buf,
        0x3Au);

      char v18 = 0;
    }
  }

  else
  {
    if (v16)
    {
      v19 = gLogHandle;
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = a6;
        *(_WORD *)v45 = 2080;
        *(void *)&v45[2] = currentQueueName();
        *(_WORD *)&v45[10] = 2112;
        *(void *)&v45[12] = v11;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#%08x [%s] %@ is missing", buf, 0x1Cu);
      }
    }

    char v18 = v16 ^ 1;
  }

- (id)sanitize:(id)a3 withTemplate:(id)a4 tag:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8
    && (id v11 = [v9 objectForKey:@"class"],
        (objc_opt_isKindOfClass(v8, v11) & 1) != 0))
  {
    if (v11 == (id)objc_opt_class(&OBJC_CLASS___NSArray) || v11 == (id)objc_opt_class(&OBJC_CLASS___NSMutableArray))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10000242C;
      v23[3] = &unk_100030A40;
      v23[4] = self;
      id v24 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"template"]);
      unsigned int v26 = a5;
      id v12 = v13;
      id v25 = v12;
      id v14 = v24;
      [v8 enumerateObjectsUsingBlock:v23];
    }

    else if (v11 == (id)objc_opt_class(&OBJC_CLASS___NSDictionary) {
           || v11 == (id)objc_opt_class(&OBJC_CLASS___NSMutableDictionary))
    }
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v8 count]));
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"template"]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100002484;
      v18[3] = &unk_100030A68;
      id v19 = v8;
      v20 = self;
      unsigned int v22 = a5;
      id v12 = v15;
      id v21 = v12;
      [v16 enumerateKeysAndObjectsUsingBlock:v18];
    }

    else
    {
      id v12 = v8;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (NSDictionary)template
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTemplate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end