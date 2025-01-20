@interface PDPassUpdateUserNotification
+ (BOOL)supportsCoalescing;
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSArray)passDiffs;
- (PDPassUpdateUserNotification)initWithCoder:(id)a3;
- (PDPassUpdateUserNotification)initWithPassDiff:(id)a3;
- (PKDiff)primaryPassDiff;
- (id)notificationContentWithDataSource:(id)a3;
- (id)passUniqueIdentifier;
- (unint64_t)coalesceWithExistingUserNotification:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassUpdateUserNotification

- (PDPassUpdateUserNotification)initWithPassDiff:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 passUniqueID]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 passManifestHash]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hexEncoding]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-diff %@",  v6,  v8));

    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___PDPassUpdateUserNotification;
    v10 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v14,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v9,  0LL);
    if (v10)
    {
      v15 = v5;
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
      passDiffs = v10->_passDiffs;
      v10->_passDiffs = (NSArray *)v11;
    }
  }

  else
  {

    v10 = 0LL;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassUpdateUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDPassUpdateUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v14, "initWithCoder:", v4);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___PKDiff, v8),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"passDiffs"]);
    passDiffs = v6->_passDiffs;
    v6->_passDiffs = (NSArray *)v11;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassUpdateUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passDiffs, @"passDiffs", v5.receiver, v5.super_class);
}

+ (BOOL)supportsCoalescing
{
  return 1;
}

- (unint64_t)notificationType
{
  return 3LL;
}

- (BOOL)isValid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassUpdateUserNotification primaryPassDiff](self, "primaryPassDiff"));
  BOOL v3 = (uint64_t)[v2 hunkCount] > 0;

  return v3;
}

- (unint64_t)coalesceWithExistingUserNotification:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  uint64_t v38 = 0LL;
  if ([v4 notificationType] == (id)3)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassUpdateUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 passUniqueIdentifier]);
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassUpdateUserNotification primaryPassDiff](self, "primaryPassDiff"));
      id v9 = v4;
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 passDiffs]);
      id v11 = [v10 mutableCopy];

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10020F69C;
      v28[3] = &unk_10064D4A8;
      v13 = (id *)v9;
      v29 = v13;
      v30 = self;
      id v14 = v11;
      id v31 = v14;
      v34 = &v35;
      id v15 = v8;
      id v32 = v15;
      id v16 = v12;
      id v33 = v16;
      [v15 enumerateHunks:v28];
      if (v36[3])
      {
        objc_storeStrong(v13 + 17, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification date](self, "date"));
        [v13 setDate:v17];

        objc_msgSend( v13,  "setReissueBannerOnUpdate:",  -[PDUserNotification reissueBannerOnUpdate](self, "reissueBannerOnUpdate"));
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v18 = v16;
        id v19 = [v18 countByEnumeratingWithState:&v24 objects:v39 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v25;
          do
          {
            v21 = 0LL;
            do
            {
              if (*(void *)v25 != v20) {
                objc_enumerationMutation(v18);
              }
              objc_msgSend( v15,  "removeHunkForKey:",  *(void *)(*((void *)&v24 + 1) + 8 * (void)v21),  (void)v24);
              v21 = (char *)v21 + 1;
            }

            while (v19 != v21);
            id v19 = [v18 countByEnumeratingWithState:&v24 objects:v39 count:16];
          }

          while (v19);
        }

        if (![v15 hunkCount]) {
          v36[3] = 2LL;
        }
      }
    }
  }

  unint64_t v22 = v36[3];
  _Block_object_dispose(&v35, 8);

  return v22;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDPassUpdateUserNotification;
  id v4 = a3;
  id v5 = -[PDUserNotification notificationContentWithDataSource:](&v16, "notificationContentWithDataSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassUpdateUserNotification passUniqueIdentifier](self, "passUniqueIdentifier"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 passWithUniqueIdentifier:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassUpdateUserNotification primaryPassDiff](self, "primaryPassDiff"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescriptionForDiff:v9]);

  [v6 setBody:v10];
  if ([v8 style] == (id)4) {
    [v6 setInterruptionLevel:2];
  }
  -[PDUserNotification allowPresentationOverPass](self, "allowPresentationOverPass");
  id v11 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
  -[NSURLComponents setScheme:](v11, "setScheme:", @"shoebox");
  -[NSURLComponents setHost:](v11, "setHost:", PKUserNotificationActionRoutePassUpdate);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification notificationIdentifier](self, "notificationIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/%@", v12));
  -[NSURLComponents setPath:](v11, "setPath:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v11, "URL"));
  [v6 setDefaultActionURL:v14];

  return v6;
}

- (PKDiff)primaryPassDiff
{
  return (PKDiff *)-[NSArray lastObject](self->_passDiffs, "lastObject");
}

- (id)passUniqueIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassUpdateUserNotification primaryPassDiff](self, "primaryPassDiff"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 passUniqueID]);

  return v3;
}

- (NSArray)passDiffs
{
  return self->_passDiffs;
}

- (void).cxx_destruct
{
}

@end