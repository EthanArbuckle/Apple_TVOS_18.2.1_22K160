@interface TITestUserPersona
- (CGPoint)userPointForKey:(id)a3;
- (NSDictionary)personaData;
- (NSMutableDictionary)cachedKeyInfo;
- (NSMutableDictionary)keyInfo;
- (TITestUserPersona)initWithPersonaName:(id)a3;
- (UIKBTree)currentKeyplane;
- (void)setCachedKeyInfo:(id)a3;
- (void)setCurrentKeyplane:(id)a3;
- (void)setKeyInfo:(id)a3;
- (void)setPersonaData:(id)a3;
- (void)updateFromKeyplane:(id)a3;
@end

@implementation TITestUserPersona

- (TITestUserPersona)initWithPersonaName:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TITestUserPersona;
  v5 = -[TITestUserPersona init](&v19, "init");
  if (v5)
  {
    id v6 = sub_2DE1C(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pathExtension]);
    unsigned int v9 = [v8 isEqualToString:@"plist"];

    if (v9)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v7));
      personaData = v5->_personaData;
      v5->_personaData = (NSDictionary *)v10;
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 pathExtension]);
      unsigned int v13 = [v12 isEqualToString:@"json"];

      if (!v13) {
        goto LABEL_8;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v7));
      personaData = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v14,  0LL,  0LL));

      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(personaData, v15) & 1) != 0) {
        objc_storeStrong((id *)&v5->_personaData, personaData);
      }
    }

LABEL_8:
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    cachedKeyInfo = v5->_cachedKeyInfo;
    v5->_cachedKeyInfo = v16;
  }

  return v5;
}

- (void)updateFromKeyplane:(id)a3
{
  v5 = (UIKBTree *)a3;
  if (self->_currentKeyplane != v5)
  {
    objc_storeStrong((id *)&self->_currentKeyplane, a3);
    cachedKeyInfo = self->_cachedKeyInfo;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIKBTree name](self->_currentKeyplane, "name"));
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cachedKeyInfo, "objectForKey:", v7));

    if (!v8)
    {
      v51 = v5;
      unsigned int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v10 = self->_cachedKeyInfo;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIKBTree name](self->_currentKeyplane, "name"));
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9, v11);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIKBTree keys](v5, "keys"));
      v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v90[0] = 0LL;
      v90[1] = v90;
      v90[2] = 0x5012000000LL;
      v90[3] = sub_4FF44;
      v90[4] = nullsub_10;
      v90[5] = &unk_7EC7A;
      CGSize size = CGRectZero.size;
      CGPoint origin = CGRectZero.origin;
      CGSize v92 = size;
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472LL;
      v86[2] = sub_4FF54;
      v86[3] = &unk_89A90;
      v14 = v9;
      v87 = v14;
      v50 = v12;
      v88 = v50;
      v89 = v90;
      [v48 enumerateObjectsUsingBlock:v86];
      uint64_t v80 = 0LL;
      v81 = &v80;
      uint64_t v82 = 0x3032000000LL;
      v83 = sub_500D0;
      v84 = sub_500E0;
      id v85 = 0LL;
      personaData = self->_personaData;
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472LL;
      v77[2] = sub_500E8;
      v77[3] = &unk_89AB8;
      v78 = v5;
      v79 = &v80;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](personaData, "enumerateKeysAndObjectsUsingBlock:", v77);
      v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v52 = (void *)objc_claimAutoreleasedReturnValue([(id)v81[5] objectForKey:@"KEYGROUPS"]);
      v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v16 = objc_alloc(&OBJC_CLASS___NSMutableSet);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v14, "allKeys"));
      v18 = -[NSMutableSet initWithArray:](v16, "initWithArray:", v17);

      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472LL;
      v71[2] = sub_501A0;
      v71[3] = &unk_89B30;
      v76 = v90;
      v8 = v14;
      v72 = v8;
      objc_super v19 = v18;
      v73 = v19;
      v20 = v49;
      v74 = v20;
      v21 = v42;
      v75 = v21;
      v47 = v19;
      [v52 enumerateKeysAndObjectsUsingBlock:v71];
      if (-[NSMutableSet count](v19, "count")) {
        -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v19, @"OTHERS");
      }
      v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v21, "allKeys", v22));
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472LL;
      v69[2] = sub_509F0;
      v69[3] = &unk_89B58;
      v24 = v22;
      v70 = v24;
      [v23 enumerateObjectsUsingBlock:v69];

      v25 = (void *)objc_claimAutoreleasedReturnValue([(id)v81[5] objectForKey:@"AFFINES"]);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472LL;
      v65[2] = sub_50A64;
      v65[3] = &unk_89BA8;
      v26 = v24;
      v66 = v26;
      v27 = v50;
      v67 = v27;
      v28 = v20;
      v68 = v28;
      v46 = v25;
      [v25 enumerateKeysAndObjectsUsingBlock:v65];
      v29 = (void *)objc_claimAutoreleasedReturnValue([(id)v81[5] objectForKey:@"GLOBALS"]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"STDDEVXAXISPCT"]);

      v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v81[5] objectForKey:@"GLOBALS"]);
      v44 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"STDDEVYAXISPCT"]);
      v43 = v26;

      v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_512D4;
      v59[3] = &unk_89BD0;
      v32 = v27;
      v60 = v32;
      v33 = v28;
      v61 = v33;
      v34 = v31;
      v62 = v34;
      id v35 = v45;
      id v63 = v35;
      id v36 = v44;
      id v64 = v36;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v21, "enumerateKeysAndObjectsUsingBlock:", v59);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_514A8;
      v53[3] = &unk_89C20;
      v37 = v21;
      v54 = v37;
      v38 = v43;
      v55 = v38;
      v39 = v32;
      v56 = v39;
      v40 = v33;
      v57 = v40;
      v41 = v34;
      v58 = v41;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v53);

      _Block_object_dispose(&v80, 8);
      _Block_object_dispose(v90, 8);

      v5 = v51;
    }

    self->_keyInfo = v8;
  }
}

- (CGPoint)userPointForKey:(id)a3
{
  keyInfo = self->_keyInfo;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](keyInfo, "objectForKey:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 errorGenerator]);
  [v6 randomPointInDistribution];
  double v8 = v7;
  double v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 rotationMatrix]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 rotationMatrix]);
    objc_msgSend(v12, "transformedPoint:", v8, v10);
    double v8 = v13;
    double v10 = v14;
  }

  [v5 center];
  double v16 = v15;
  [v5 center];
  double v18 = v10 + v17;

  double v19 = v8 + v16;
  double v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (NSDictionary)personaData
{
  return self->_personaData;
}

- (void)setPersonaData:(id)a3
{
}

- (UIKBTree)currentKeyplane
{
  return self->_currentKeyplane;
}

- (void)setCurrentKeyplane:(id)a3
{
}

- (NSMutableDictionary)keyInfo
{
  return self->_keyInfo;
}

- (void)setKeyInfo:(id)a3
{
  self->_keyInfo = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)cachedKeyInfo
{
  return self->_cachedKeyInfo;
}

- (void)setCachedKeyInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end