@interface CPLCloudKitScope
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForCloudKitScopeOptions:(int64_t)a3;
+ (id)scopeFromTransportScope:(id)a3;
- (BOOL)isCoherent;
- (BOOL)isShared;
- (BOOL)isZoneish;
- (CKRecordZone)zone;
- (CKRecordZoneID)zoneID;
- (CPLCloudKitScope)fixedCloudKitScope;
- (CPLCloudKitScope)initWithCoder:(id)a3;
- (CPLCloudKitScope)initWithZone:(id)a3;
- (CPLCloudKitScope)initWithZone:(id)a3 options:(int64_t)a4;
- (CPLCloudKitScope)initWithZoneID:(id)a3;
- (CPLCloudKitScope)initWithZoneID:(id)a3 options:(int64_t)a4;
- (NSData)transportScope;
- (id)description;
- (id)recordIDWithRecordName:(id)a3;
- (int64_t)databaseScope;
- (int64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLCloudKitScope

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForCloudKitScopeOptions:(int64_t)a3
{
  if (qword_1002961D0 != -1)
  {
    dispatch_once(&qword_1002961D0, &stru_100240748);
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    v9 = @"none";
    return v9;
  }

  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int64_t v18 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5 = (void *)qword_1002961C8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10005D618;
  v11[3] = &unk_100240770;
  v13 = &v15;
  int64_t v14 = a3;
  v6 = v4;
  v12 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];
  if (v16[3])
  {
    v7 = objc_alloc(&OBJC_CLASS___NSString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v6, "componentsJoinedByString:", @"|"));
    v9 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@|???(0x%lx)", v8, v16[3]);
  }

  else
  {
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v6, "componentsJoinedByString:", @"|"));
  }

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (CPLCloudKitScope)initWithZone:(id)a3 options:(int64_t)a4
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLCloudKitScope;
  v9 = -[CPLCloudKitScope init](&v12, "init");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);

    if (!v10) {
      sub_1001931D4((uint64_t)a2, (uint64_t)v9);
    }
    objc_storeStrong((id *)&v9->_zone, a3);
    v9->_options = a4;
  }

  return v9;
}

- (CPLCloudKitScope)initWithZoneID:(id)a3 options:(int64_t)a4
{
  id v7 = a3;
  if (!v7) {
    sub_100193288((uint64_t)a2, (uint64_t)self);
  }
  id v8 = v7;
  v9 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v7);
  v10 = -[CPLCloudKitScope initWithZone:options:](self, "initWithZone:options:", v9, a4);

  return v10;
}

- (CPLCloudKitScope)initWithZone:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 ownerName]);
  unsigned int v7 = [v6 isEqualToString:CKCurrentUserDefaultName];

  if (v7) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = 2LL;
  }
  v9 = -[CPLCloudKitScope initWithZone:options:](self, "initWithZone:options:", v4, v8);

  return v9;
}

- (CPLCloudKitScope)initWithZoneID:(id)a3
{
  id v5 = a3;
  if (!v5) {
    sub_10019333C((uint64_t)a2, (uint64_t)self);
  }
  v6 = v5;
  unsigned int v7 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v5);
  uint64_t v8 = -[CPLCloudKitScope initWithZone:](self, "initWithZone:", v7);

  return v8;
}

- (CPLCloudKitScope)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLCloudKitScope;
  id v5 = -[CPLCloudKitScope init](&v11, "init");
  if (v5
    && (id v6 = [v4 decodeObjectOfClass:objc_opt_class(CKRecordZone) forKey:@"z"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(v6),
        zone = v5->_zone,
        v5->_zone = (CKRecordZone *)v7,
        zone,
        v5->_options = (int64_t)[v4 decodeIntegerForKey:@"o"],
        !v5->_zone))
  {
    v9 = 0LL;
  }

  else
  {
    v9 = v5;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  zone = self->_zone;
  id v5 = a3;
  [v5 encodeObject:zone forKey:@"z"];
  [v5 encodeInteger:self->_options forKey:@"o"];
}

+ (id)scopeFromTransportScope:(id)a3
{
  id v3 = a3;
  if (qword_1002961E0 != -1) {
    dispatch_once(&qword_1002961E0, &stru_100240790);
  }
  id v4 = (CPLCloudKitScope *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:classes:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:classes:",  v3,  qword_1002961D8));
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKRecordZone);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](v6, "zoneID"));

      if (v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](v6, "zoneID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 ownerName]);
        unsigned int v11 = [v10 isEqualToString:CKCurrentUserDefaultName];

        if (v11) {
          uint64_t v12 = 0LL;
        }
        else {
          uint64_t v12 = 2LL;
        }
        id v4 = -[CPLCloudKitScope initWithZone:options:]( objc_alloc(&OBJC_CLASS___CPLCloudKitScope),  "initWithZone:options:",  v6,  v12);
      }

      else
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v13 = __CPLGenericOSLogDomain(v8);
          int64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v16 = 138543362;
            uint64_t v17 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CKRecordZone without a zone ID: %{public}@",  (uint8_t *)&v16,  0xCu);
          }
        }

        id v4 = 0LL;
      }
    }
  }

  return v4;
}

- (NSData)transportScope
{
  return (NSData *)+[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  self);
}

- (int64_t)databaseScope
{
  if ((-[CPLCloudKitScope options](self, "options") & 2) != 0) {
    return 3LL;
  }
  else {
    return 2LL;
  }
}

- (CKRecordZoneID)zoneID
{
  return -[CKRecordZone zoneID](self->_zone, "zoneID");
}

- (BOOL)isShared
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)isZoneish
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (id)recordIDWithRecordName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](self->_zone, "zoneID"));
  uint64_t v7 = -[CKRecordID initWithRecordName:zoneID:](v5, "initWithRecordName:zoneID:", v4, v6);

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self, "zoneID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cpl_zoneName"));
  id v7 = [(id)objc_opt_class(self) descriptionForCloudKitScopeOptions:self->_options];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@ %@ (%@)>", v4, v6, v8);

  return v9;
}

- (CPLCloudKitScope)fixedCloudKitScope
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self, "zoneID"));
  uint64_t v4 = v3;
  if (v3
    && [v3 databaseScope]
    && (id v5 = [v4 databaseScope], v5 != (id)-[CPLCloudKitScope databaseScope](self, "databaseScope")))
  {
    id v7 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 ownerName]);
    v10 = -[CKRecordZoneID initWithZoneName:ownerName:](v7, "initWithZoneName:ownerName:", v8, v9);

    id v6 = -[CPLCloudKitScope initWithZoneID:options:]( objc_alloc(&OBJC_CLASS___CPLCloudKitScope),  "initWithZoneID:options:",  v10,  -[CPLCloudKitScope options](self, "options"));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)isCoherent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self, "zoneID"));
  uint64_t v4 = v3;
  BOOL v6 = 1;
  if (v3)
  {
    if ([v3 databaseScope])
    {
      id v5 = [v4 databaseScope];
      if (v5 != (id)-[CPLCloudKitScope databaseScope](self, "databaseScope")) {
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end