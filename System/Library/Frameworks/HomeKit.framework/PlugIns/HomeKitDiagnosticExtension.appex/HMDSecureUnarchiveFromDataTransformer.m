@interface HMDSecureUnarchiveFromDataTransformer
+ (BOOL)isEncodedNilValue:(id)a3;
+ (id)allowedTopLevelClasses;
- (id)transformedValue:(id)a3;
@end

@implementation HMDSecureUnarchiveFromDataTransformer

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  if (+[HMDSecureUnarchiveFromDataTransformer isEncodedNilValue:]( &OBJC_CLASS___HMDSecureUnarchiveFromDataTransformer,  "isEncodedNilValue:",  v4))
  {
    v5 = 0LL;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___HMDSecureUnarchiveFromDataTransformer;
    id v6 = -[HMDSecureUnarchiveFromDataTransformer transformedValue:](&v8, "transformedValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

+ (id)allowedTopLevelClasses
{
  if ((id)objc_opt_class(&OBJC_CLASS___HMDSecureUnarchiveFromDataTransformer, a2) == a1)
  {
    if (qword_100032D18 != -1) {
      dispatch_once(&qword_100032D18, &stru_1000289D8);
    }
    id v4 = (id)qword_100032D20;
  }

  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___HMDSecureUnarchiveFromDataTransformer;
    id v3 = objc_msgSendSuper2(&v6, "allowedTopLevelClasses");
    id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  }

  return v4;
}

+ (BOOL)isEncodedNilValue:(id)a3
{
  id v4 = a3;
  if (qword_100032D38 != -1) {
    dispatch_once(&qword_100032D38, &stru_1000289F8);
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v3);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0 && (id v6 = [v4 length], v6 == (id)qword_100032D28))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  0LL));
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0
      && (id v10 = [v7 count], v10 == objc_msgSend((id)qword_100032D30, "count")))
    {
      uint64_t v14 = 0LL;
      v15 = &v14;
      uint64_t v16 = 0x2020000000LL;
      char v17 = 1;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001064C;
      v13[3] = &unk_100028A20;
      v13[4] = &v14;
      [v7 enumerateKeysAndObjectsUsingBlock:v13];
      BOOL v11 = *((_BYTE *)v15 + 24) != 0;
      _Block_object_dispose(&v14, 8);
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

@end