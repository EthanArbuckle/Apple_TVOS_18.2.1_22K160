@interface AMSAuthenticateOptions
+ (id)amsd_createAppProvidedDataWithMultiUserAction:(id)a3 home:(id)a4;
+ (id)amsd_createAppProvidedDataWithMultiUserAction:(id)a3 homeIdentifier:(id)a4;
+ (id)amsd_multiUserAuthenticateOptionsWithAppProvidedData:(id)a3;
@end

@implementation AMSAuthenticateOptions

+ (id)amsd_multiUserAuthenticateOptionsWithAppProvidedData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setAuthenticationType:1];
  [v5 setAppProvidedContext:@"mu"];
  [v5 setAppProvidedData:v4];

  return v5;
}

+ (id)amsd_createAppProvidedDataWithMultiUserAction:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "amsd_createAppProvidedDataWithMultiUserAction:homeIdentifier:", v7, v8));

  LODWORD(v7) = [v6 isCurrentUserOwner];
  if ((_DWORD)v7) {
    v10 = @"owner";
  }
  else {
    v10 = @"participant";
  }
  [v9 setObject:v10 forKeyedSubscript:@"role"];
  return v9;
}

+ (id)amsd_createAppProvidedDataWithMultiUserAction:(id)a3 homeIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, @"action");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  @"home",  @"context");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  -[NSMutableDictionary ams_setNullableObject:forKey:](v7, "ams_setNullableObject:forKey:", v8, @"homeId");
  return v7;
}

@end