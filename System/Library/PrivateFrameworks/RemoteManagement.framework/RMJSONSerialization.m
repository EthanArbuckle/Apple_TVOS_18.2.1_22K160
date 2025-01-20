@interface RMJSONSerialization
+ (NSDateFormatter)dateFormatter;
+ (id)serializeValue:(id)a3;
@end

@implementation RMJSONSerialization

+ (NSDateFormatter)dateFormatter
{
  if (qword_1000253A0 != -1) {
    dispatch_once(&qword_1000253A0, &stru_10001C670);
  }
  return (NSDateFormatter *)(id)qword_100025398;
}

+ (id)serializeValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    v7 = (NSMutableArray *)v4;
LABEL_4:
    v8 = v7;
    goto LABEL_5;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNull);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v10);
  if (!v4 || (isKindOfClass & 1) != 0)
  {
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    goto LABEL_4;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v4, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([a1 dateFormatter]);
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v13 stringFromDate:v4]);

    goto LABEL_5;
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSUUID);
  if ((objc_opt_isKindOfClass(v4, v14) & 1) != 0)
  {
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    goto LABEL_4;
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSURL);
  if ((objc_opt_isKindOfClass(v4, v15) & 1) != 0)
  {
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v4 absoluteString]);
    goto LABEL_4;
  }

  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v4, v16) & 1) != 0)
  {
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v4 base64EncodedStringWithOptions:0]);
    goto LABEL_4;
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v17) & 1) != 0)
  {
    uint64_t v40 = 0LL;
    v41 = &v40;
    uint64_t v42 = 0x3032000000LL;
    v43 = sub_100008FBC;
    v44 = sub_100008FCC;
    v45 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v18 = v4;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100008FD4;
    v39[3] = &unk_10001C698;
    v39[4] = &v40;
    v39[5] = a1;
    [v18 enumerateKeysAndObjectsUsingBlock:v39];
    v8 = (NSMutableArray *)(id)v41[5];

    _Block_object_dispose(&v40, 8);
  }

  else
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v4, v19) & 1) != 0)
    {
      v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v20 = v4;
      id v21 = [v20 countByEnumeratingWithState:&v35 objects:v47 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v36;
        while (2)
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = (void *)objc_claimAutoreleasedReturnValue([a1 serializeValue:*(void *)(*((void *)&v35 + 1) + 8 * (void)i)]);
            if (!v24)
            {

              v8 = 0LL;
              goto LABEL_40;
            }

            -[NSMutableArray addObject:](v8, "addObject:", v24);
          }

          id v21 = [v20 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

@end