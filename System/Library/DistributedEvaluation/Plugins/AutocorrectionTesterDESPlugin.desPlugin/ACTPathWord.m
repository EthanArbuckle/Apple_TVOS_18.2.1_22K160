@interface ACTPathWord
- (ACTPathWord)initWithPath:(id)a3 intendedString:(id)a4 keyplane:(id)a5 fromUserData:(BOOL)a6;
- (BOOL)fromUserData;
- (NSString)intendedString;
- (TIContinuousPath)path;
- (TTKKeyboardPlane)keyplane;
- (id)callback;
- (id)description;
- (void)applyWithTyper:(id)a3 log:(id)a4;
- (void)setCallback:(id)a3;
@end

@implementation ACTPathWord

- (ACTPathWord)initWithPath:(id)a3 intendedString:(id)a4 keyplane:(id)a5 fromUserData:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ACTPathWord;
  v14 = -[ACTPathWord init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_path, a3);
    v16 = (NSString *)[v12 copy];
    intendedString = v15->_intendedString;
    v15->_intendedString = v16;

    objc_storeStrong((id *)&v15->_keyplane, a5);
    v15->_fromUserData = a6;
  }

  return v15;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTPathWord path](self, "path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTPathWord intendedString](self, "intendedString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTPathWord keyplane](self, "keyplane"));
  unsigned int v9 = -[ACTPathWord fromUserData](self, "fromUserData");
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: path=%@, intended=%@, keyplane=%@, fromUserData=%@>",  v5,  v6,  v7,  v8,  v10));

  return v11;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 isDebugEnabled])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 getDebugObject:@"PATH_ARRAY"]);
    unsigned int v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }
    v22 = v10;

    v23[0] = @"word";
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACTPathWord intendedString](self, "intendedString"));
    v24[0] = v21;
    v23[1] = @"path";
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACTPathWord path](self, "path"));
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v20 toJsonDictionary]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"samples"]);
    v24[1] = v11;
    v23[2] = @"layout";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACTPathWord keyplane](self, "keyplane"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACTPathWord intendedString](self, "intendedString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 jsonFrameArrayForWord:v13]);
    v24[2] = v14;
    v23[3] = @"userdata";
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ACTPathWord fromUserData](self, "fromUserData")));
    v24[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  4LL));
    [v22 addObject:v16];

    [v6 addDebugObject:v22 forKey:@"PATH_ARRAY"];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACTPathWord path](self, "path"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACTPathWord callback](self, "callback"));
  [v7 performStrokeForPath:v17 typingLog:v6 callback:v18];
}

- (TIContinuousPath)path
{
  return self->_path;
}

- (NSString)intendedString
{
  return self->_intendedString;
}

- (TTKKeyboardPlane)keyplane
{
  return self->_keyplane;
}

- (BOOL)fromUserData
{
  return self->_fromUserData;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end