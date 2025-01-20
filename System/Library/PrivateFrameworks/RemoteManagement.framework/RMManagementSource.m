@interface RMManagementSource
+ (id)fetchRequestWithAccountIdentifier:(id)a3;
+ (id)fetchRequestWithBootstrapURI:(id)a3;
+ (id)fetchRequestWithBootstrapURI:(id)a3 enrollmentType:(int64_t)a4;
+ (id)fetchRequestWithDeviceChannel;
+ (id)fetchRequestWithEnrollmentType:(int64_t)a3;
+ (id)fetchRequestWithEnrollmentTypes:(id)a3;
+ (id)fetchRequestWithIdentifier:(id)a3;
- (NSString)channelDescription;
- (id)reportDetails;
- (void)awakeFromInsert;
@end

@implementation RMManagementSource

- (void)awakeFromInsert
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RMManagementSource;
  -[RMManagementSource awakeFromInsert](&v5, "awakeFromInsert");
  v3 = objc_opt_new(&OBJC_CLASS___NSUUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v3, "UUIDString"));
  -[RMManagementSource setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, @"identifier");
}

+ (id)fetchRequestWithBootstrapURI:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@)",  @"bootstrapURI",  v4));

  [v5 setPredicate:v6];
  return v5;
}

+ (id)fetchRequestWithBootstrapURI:(id)a3 enrollmentType:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && (%K == %d)",  @"bootstrapURI",  v6,  @"enrollmentType",  a4));

  [v7 setPredicate:v8];
  return v7;
}

+ (id)fetchRequestWithDeviceChannel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %d) || (%K == %d)",  @"enrollmentType",  1LL,  @"enrollmentType",  3LL));
  [v2 setPredicate:v3];

  return v2;
}

+ (id)fetchRequestWithEnrollmentType:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == %d",  @"enrollmentType",  a3));
  [v4 setPredicate:v5];

  return v4;
}

+ (id)fetchRequestWithEnrollmentTypes:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  @"enrollmentType",  v4));

  [v5 setPredicate:v6];
  return v5;
}

+ (id)fetchRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@)",  @"identifier",  v4));

  [v5 setPredicate:v6];
  return v5;
}

+ (id)fetchRequestWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@)",  @"accountIdentifier",  v4));

  [v5 setPredicate:v6];
  return v5;
}

- (id)reportDetails
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource accountIdentifier](self, "accountIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  @"accountIdentifier");

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource authenticationCredential](self, "authenticationCredential"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"authenticationCredential");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource bootstrapURI](self, "bootstrapURI"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"bootstrapURI");

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[RMStoreHelper descriptorForStoreType:]( &OBJC_CLASS___RMStoreHelper,  "descriptorForStoreType:",  (int)-[RMManagementSource enrollmentType](self, "enrollmentType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"enrollmentType");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource conduitConfig](self, "conduitConfig"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 reportDetails]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"conduitConfig");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[RMManagementSource enrolled](self, "enrolled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"enrolled");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource identifier](self, "identifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, @"identifier");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource name](self, "name"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, @"name");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource personaIdentifier](self, "personaIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"personaIdentifier");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource predicateStatusKeys](self, "predicateStatusKeys"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v15,  @"predicateStatusKeys");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource storeDescription](self, "storeDescription"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v16,  @"storeDescription");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource command](self, "command"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 reportDetails]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, @"command");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource activations](self, "activations"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v19 count]));

  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource activations](self, "activations"));
  id v22 = [v21 countByEnumeratingWithState:&v110 objects:v121 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v111;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v111 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v110 + 1) + 8 * (void)i) reportDetails]);
        [v20 addObject:v26];
      }

      id v23 = [v21 countByEnumeratingWithState:&v110 objects:v121 count:16];
    }

    while (v23);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v20, @"activations");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource configurations](self, "configurations"));
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v27 count]));

  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource configurations](self, "configurations"));
  id v30 = [v29 countByEnumeratingWithState:&v106 objects:v120 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v107;
    do
    {
      for (j = 0LL; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v107 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v106 + 1) + 8 * (void)j) reportDetails]);
        [v28 addObject:v34];
      }

      id v31 = [v29 countByEnumeratingWithState:&v106 objects:v120 count:16];
    }

    while (v31);
  }

  v84 = v20;

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v28, @"configurations");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource assets](self, "assets"));
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v35 count]));

  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource assets](self, "assets"));
  id v38 = [v37 countByEnumeratingWithState:&v102 objects:v119 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v103;
    do
    {
      for (k = 0LL; k != v39; k = (char *)k + 1)
      {
        if (*(void *)v103 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v102 + 1) + 8 * (void)k) reportDetails]);
        [v36 addObject:v42];
      }

      id v39 = [v37 countByEnumeratingWithState:&v102 objects:v119 count:16];
    }

    while (v39);
  }

  v83 = v28;

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v36, @"assets");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource management](self, "management"));
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v43 count]));

  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource management](self, "management"));
  id v46 = [v45 countByEnumeratingWithState:&v98 objects:v118 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v99;
    do
    {
      for (m = 0LL; m != v47; m = (char *)m + 1)
      {
        if (*(void *)v99 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v98 + 1) + 8 * (void)m) reportDetails]);
        [v44 addObject:v50];
      }

      id v47 = [v45 countByEnumeratingWithState:&v98 objects:v118 count:16];
    }

    while (v47);
  }

  v85 = v3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v44, @"management");
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource statusSubscriptions](self, "statusSubscriptions"));
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v51 count]));

  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource statusSubscriptions](self, "statusSubscriptions"));
  id v54 = [v53 countByEnumeratingWithState:&v94 objects:v117 count:16];
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v95;
    do
    {
      for (n = 0LL; n != v55; n = (char *)n + 1)
      {
        if (*(void *)v95 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v94 + 1) + 8 * (void)n) reportDetails]);
        [v52 addObject:v58];
      }

      id v55 = [v53 countByEnumeratingWithState:&v94 objects:v117 count:16];
    }

    while (v55);
  }

  v82 = v36;

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v85,  "setObject:forKeyedSubscript:",  v52,  @"statusSubscriptions");
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource subscribedStatusKeyPaths](self, "subscribedStatusKeyPaths"));
  v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v59 count]));

  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource subscribedStatusKeyPaths](self, "subscribedStatusKeyPaths"));
  id v62 = [v61 countByEnumeratingWithState:&v90 objects:v116 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v91;
    do
    {
      for (ii = 0LL; ii != v63; ii = (char *)ii + 1)
      {
        if (*(void *)v91 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v90 + 1) + 8 * (void)ii) reportDetails]);
        [v60 addObject:v66];
      }

      id v63 = [v61 countByEnumeratingWithState:&v90 objects:v116 count:16];
    }

    while (v63);
  }

  v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"keyPath",  1LL));
  v115 = v81;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v115, 1LL));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v60 sortedArrayUsingDescriptors:v67]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v85,  "setObject:forKeyedSubscript:",  v68,  @"subscribedStatusKeyPaths");

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource metadata](self, "metadata"));
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v69 count]));

  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource metadata](self, "metadata"));
  id v72 = [v71 countByEnumeratingWithState:&v86 objects:v114 count:16];
  if (v72)
  {
    id v73 = v72;
    uint64_t v74 = *(void *)v87;
    do
    {
      for (jj = 0LL; jj != v73; jj = (char *)jj + 1)
      {
        if (*(void *)v87 != v74) {
          objc_enumerationMutation(v71);
        }
        v76 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)jj);
        v77 = (void *)objc_claimAutoreleasedReturnValue([v76 value]);
        v78 = (void *)objc_claimAutoreleasedReturnValue([v76 key]);
        [v70 setObject:v77 forKeyedSubscript:v78];
      }

      id v73 = [v71 countByEnumeratingWithState:&v86 objects:v114 count:16];
    }

    while (v73);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v85, "setObject:forKeyedSubscript:", v70, @"metadata");
  id v79 = -[NSMutableDictionary copy](v85, "copy");

  return v79;
}

- (NSString)channelDescription
{
  if (-[RMManagementSource enrollmentType](self, "enrollmentType") == 1)
  {
    v3 = @"Device channel";
  }

  else if (-[RMManagementSource enrollmentType](self, "enrollmentType") == 3)
  {
    v3 = @"Supervised Device channel";
  }

  else if (-[RMManagementSource enrollmentType](self, "enrollmentType"))
  {
    else {
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown channel type (%d)",  (int)-[RMManagementSource enrollmentType](self, "enrollmentType")));
    }
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSource accountIdentifier](self, "accountIdentifier"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"User channel for %@",  v4));
  }

  return (NSString *)v3;
}

@end