@interface NSJSONSerialization
+ (id)JSONStringFromNSDictionary:(id)a3 error:(id *)a4;
@end

@implementation NSJSONSerialization

+ (id)JSONStringFromNSDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v5))
  {
    id v17 = 0LL;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  8LL,  &v17));
    id v7 = v17;
    if (v7)
    {
      v18[0] = NSLocalizedDescriptionKey;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"NSJSONSerialization failed" value:&stru_100024C08 table:0]);
      v18[1] = NSUnderlyingErrorKey;
      v19[0] = v9;
      v19[1] = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));

      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.routined.NSJSONSerializationRTExtensions",  0LL,  v10));
      }
      v11 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    }

    else
    {
      v11 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v6, 4LL);
    }
  }

  else
  {
    v20[0] = NSLocalizedDescriptionKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"Invalid dictionary for JSON serialization" value:&stru_100024C08 table:0]);
    v21[0] = v13;
    v20[1] = NSLocalizedRecoverySuggestionErrorKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"Refer to NSJSONSerialization spec for valid dictionaries" value:&stru_100024C08 table:0]);
    v21[1] = v15;
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.routined.NSJSONSerializationRTExtensions",  0LL,  v7));
    }
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
  }

  return v11;
}

@end