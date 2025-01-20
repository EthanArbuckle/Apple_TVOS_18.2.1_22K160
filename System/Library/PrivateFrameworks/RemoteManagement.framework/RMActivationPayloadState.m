@interface RMActivationPayloadState
- (NSArray)inactiveReasons;
- (id)reportDetails;
- (void)setInactiveReasons:(id)a3;
@end

@implementation RMActivationPayloadState

- (NSArray)inactiveReasons
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[RMActivationPayloadState primitiveValueForKey:]( self,  "primitiveValueForKey:",  @"inactiveReasons"));
  -[RMActivationPayloadState didAccessValueForKey:](self, "didAccessValueForKey:", @"inactiveReasons");
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMActivationPayloadState inactiveReasons](self, "inactiveReasons"));
    if (v4)
    {
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
      v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  objc_opt_class(&OBJC_CLASS___RMModelStatusReason),  0LL);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      id v10 = 0LL;
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v7,  v4,  &v10));
      id v8 = v10;

      if (v3)
      {
        -[RMActivationPayloadState setPrimitiveValue:forKey:]( self,  "setPrimitiveValue:forKey:",  v3,  @"inactiveReasons");
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        sub_100012294((uint64_t)self);
      }
    }

    else
    {
      v3 = 0LL;
    }
  }

  return (NSArray *)v3;
}

- (void)setInactiveReasons:(id)a3
{
  id v4 = a3;
  -[RMActivationPayloadState willChangeValueForKey:](self, "willChangeValueForKey:", @"inactiveReasons");
  -[RMActivationPayloadState setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, @"inactiveReasons");
  if ([v4 count])
  {
    id v14 = 0LL;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v14));
    id v6 = v14;
    BOOL v7 = v5 == 0LL;
    if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100012318((uint64_t)self);
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    BOOL v7 = 1LL;
    if ((-[RMActivationPayloadState active](self, "active") & 1) == 0) {
LABEL_6:
    }
      -[RMActivationPayloadState setActive:](self, "setActive:", v7);
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[RMActivationPayloadState inactiveReasons](self, "inactiveReasons"));
  id v9 = v5;
  id v10 = v9;
  if (v8 == v9)
  {
  }

  else
  {
    if (v8) {
      BOOL v11 = v7;
    }
    else {
      BOOL v11 = 0;
    }
    if (v8) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v9 == 0LL;
    }
    if (!v12 || v11)
    {
    }

    else
    {
      unsigned __int8 v13 = [v8 isEqual:v9];

      if ((v13 & 1) != 0) {
        goto LABEL_24;
      }
    }

    -[RMActivationPayloadState setInactiveReasons_:](self, "setInactiveReasons_:", v10);
  }

- (id)reportDetails
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[RMActivationPayloadState active](self, "active")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"active");

  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMActivationPayloadState inactiveReasons](self, "inactiveReasons", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) serializeWithType:1]);
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"inactiveReasons");
  id v12 = -[NSMutableDictionary copy](v3, "copy");

  return v12;
}

@end