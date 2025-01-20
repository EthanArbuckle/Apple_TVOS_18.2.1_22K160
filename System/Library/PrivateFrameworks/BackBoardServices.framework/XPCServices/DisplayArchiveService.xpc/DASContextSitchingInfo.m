@interface DASContextSitchingInfo
+ (id)infoWithContextInfoToArchive:(id)a3;
- (NSSet)contexts;
- (id)_initWithContextInfoToArchiveMap:(id)a3;
- (id)archiveOfContext:(id)a3;
- (id)contextWithIdentifier:(unsigned int)a3;
- (id)description;
@end

@implementation DASContextSitchingInfo

- (id)_initWithContextInfoToArchiveMap:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"contextInfoToArchive"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (objc_class *)objc_opt_class(self);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138544642;
      v38 = v25;
      __int16 v39 = 2114;
      v40 = v28;
      __int16 v41 = 2048;
      v42 = self;
      __int16 v43 = 2114;
      v44 = @"DASParsing.m";
      __int16 v45 = 1024;
      int v46 = 151;
      __int16 v47 = 2114;
      v48 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x100002A5CLL);
  }

  v6 = v5;
  id v7 = [v5 count];
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v7));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100003094;
  v30[3] = &unk_100010440;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v31 = v10;
  id v11 = v6;
  id v32 = v11;
  SEL v36 = a2;
  v12 = self;
  v33 = v12;
  id v13 = v8;
  id v34 = v13;
  id v14 = v9;
  id v35 = v14;
  [v11 enumerateKeysAndObjectsUsingBlock:v30];
  v29.receiver = v12;
  v29.super_class = (Class)&OBJC_CLASS___DASContextSitchingInfo;
  v15 = -[DASContextSitchingInfo init](&v29, "init");
  if (v15)
  {
    v16 = (NSDictionary *)[v13 copy];
    contextIDNumberToContextMap = v15->_contextIDNumberToContextMap;
    v15->_contextIDNumberToContextMap = v16;

    v18 = (NSDictionary *)[v11 copy];
    contextInfoToArchiveMap = v15->_contextInfoToArchiveMap;
    v15->_contextInfoToArchiveMap = v18;

    v20 = (NSSet *)[v10 copy];
    contexts = v15->_contexts;
    v15->_contexts = v20;
  }

  return v15;
}

- (NSSet)contexts
{
  return self->_contexts;
}

- (id)contextWithIdentifier:(unsigned int)a3
{
  contextIDNumberToContextMap = self->_contextIDNumberToContextMap;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *(void *)&a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](contextIDNumberToContextMap, "objectForKey:", v4));

  return v5;
}

- (id)archiveOfContext:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"contextInfo"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[DASContextSitchingInfo archiveOfContext:]"));
      *(_DWORD *)buf = 138544130;
      id v11 = v9;
      __int16 v12 = 2114;
      id v13 = @"DASParsing.m";
      __int16 v14 = 1024;
      int v15 = 186;
      __int16 v16 = 2114;
      v17 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ (%{public}@:%i) : %{public}@",  buf,  0x26u);
    }

    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
    JUMPOUT(0x100002BFCLL);
  }

  id v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_contextInfoToArchiveMap, "objectForKey:", v4));

  return v6;
}

- (id)description
{
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  v8 = sub_100002CE0;
  v9 = &unk_1000104B0;
  id v10 = self;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self));
  id v2 = v11;
  id v3 = [v2 modifyBody:&v6];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build", v6, v7, v8, v9, v10));

  return v4;
}

- (void).cxx_destruct
{
}

+ (id)infoWithContextInfoToArchive:(id)a3
{
  id v3 = a3;
  id v4 = -[DASContextSitchingInfo _initWithContextInfoToArchiveMap:]( objc_alloc(&OBJC_CLASS___DASContextSitchingInfo),  "_initWithContextInfoToArchiveMap:",  v3);

  return v4;
}

@end