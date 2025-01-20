@interface ICCloudContentTasteUpdateItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICCloudContentTasteUpdateItem)initWithCoder:(id)a3;
- (ICCloudContentTasteUpdateItem)initWithGlobalPlaylistID:(id)a3 contentTaste:(int64_t)a4 configuration:(id)a5;
- (ICCloudContentTasteUpdateItem)initWithStoreItemID:(int64_t)a3 mediaContentTasteItem:(int64_t)a4 contentTaste:(int64_t)a5 configuration:(id)a6 timeStamp:(id)a7;
- (ICConnectionConfiguration)configuration;
- (NSDate)updateActionTimeStamp;
- (NSNumber)dsid;
- (NSString)globalPlaylistID;
- (id)description;
- (int64_t)contentTasteItem;
- (int64_t)contentTasteType;
- (int64_t)storeID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentTasteItem:(int64_t)a3;
- (void)setContentTasteType:(int64_t)a3;
- (void)setDsid:(id)a3;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setStoreID:(int64_t)a3;
- (void)setUpdateActionTimeStamp:(id)a3;
@end

@implementation ICCloudContentTasteUpdateItem

- (ICCloudContentTasteUpdateItem)initWithStoreItemID:(int64_t)a3 mediaContentTasteItem:(int64_t)a4 contentTaste:(int64_t)a5 configuration:(id)a6 timeStamp:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ICCloudContentTasteUpdateItem;
  v15 = -[ICCloudContentTasteUpdateItem init](&v22, "init");
  v16 = v15;
  if (v15)
  {
    v15->_storeID = a3;
    objc_storeStrong((id *)&v15->_configuration, a6);
    v16->_contentTasteType = a5;
    v16->_contentTasteItem = a4;
    objc_storeStrong((id *)&v16->_updateActionTimeStamp, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](v16->_configuration, "userIdentityStore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](v16->_configuration, "userIdentity"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 DSIDForUserIdentity:v18 outError:0]);
    dsid = v16->_dsid;
    v16->_dsid = (NSNumber *)v19;
  }

  return v16;
}

- (ICCloudContentTasteUpdateItem)initWithGlobalPlaylistID:(id)a3 contentTaste:(int64_t)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ICCloudContentTasteUpdateItem;
  v11 = -[ICCloudContentTasteUpdateItem init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a5);
    objc_storeStrong((id *)&v12->_globalPlaylistID, a3);
    v12->_contentTasteType = a4;
    v12->_contentTasteItem = 4LL;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    updateActionTimeStamp = v12->_updateActionTimeStamp;
    v12->_updateActionTimeStamp = (NSDate *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](v12->_configuration, "userIdentityStore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](v12->_configuration, "userIdentity"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 DSIDForUserIdentity:v16 outError:0]);
    dsid = v12->_dsid;
    v12->_dsid = (NSNumber *)v17;
  }

  return v12;
}

- (id)description
{
  int64_t storeID = self->_storeID;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  globalPlaylistID = self->_globalPlaylistID;
  uint64_t v6 = ICNSStringForICMediaContentTaste(self->_contentTasteType);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = ICNSStringForICMediaContentTasteItem(self->_contentTasteItem);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ICCloudContentTasteUpdateItem (%p) storeID=%lld, identity=%@, globalPlaylistID=%@, contentTasteType=%@, contentTasteItem=%@, updateTimeStamp=%@",  self,  storeID,  v4,  globalPlaylistID,  v7,  v9,  self->_updateActionTimeStamp));

  return v10;
}

- (ICCloudContentTasteUpdateItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ICCloudContentTasteUpdateItem;
  v5 = -[ICCloudContentTasteUpdateItem init](&v16, "init");
  if (v5)
  {
    v5->_int64_t storeID = (int64_t)[v4 decodeInt64ForKey:@"_ICCloudContentTasteUpdateItemCodingKeyStoreIDKey"];
    v5->_contentTasteItem = (int64_t)[v4 decodeIntegerForKey:@"_ICCloudContentTasteUpdateItemCodingKeyItemTypeKey"];
    v5->_contentTasteType = (int64_t)[v4 decodeIntegerForKey:@"_ICCloudContentTasteUpdateItemCodingKeyTasteTypeKey"];
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"_ICCloudContentTasteUpdateItemCodingKeyGlobalPlaylistIDKey"]);
    globalPlaylistID = v5->_globalPlaylistID;
    v5->_globalPlaylistID = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"_ICCloudContentTasteUpdateItemCodingKeyDSIDKey"]);
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v8;

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentity specificAccountWithDSID:]( &OBJC_CLASS___ICUserIdentity,  "specificAccountWithDSID:",  v5->_dsid));
    v11 = -[ICConnectionConfiguration initWithUserIdentity:]( objc_alloc(&OBJC_CLASS___ICConnectionConfiguration),  "initWithUserIdentity:",  v10);
    configuration = v5->_configuration;
    v5->_configuration = v11;

    [v4 decodeDoubleForKey:@"_ICCloudContentTasteUpdateItemCodingKeyTimeStampKey"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
    updateActionTimeStamp = v5->_updateActionTimeStamp;
    v5->_updateActionTimeStamp = (NSDate *)v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  globalPlaylistID = self->_globalPlaylistID;
  id v5 = a3;
  [v5 encodeObject:globalPlaylistID forKey:@"_ICCloudContentTasteUpdateItemCodingKeyGlobalPlaylistIDKey"];
  -[NSDate timeIntervalSince1970](self->_updateActionTimeStamp, "timeIntervalSince1970");
  objc_msgSend(v5, "encodeDouble:forKey:", @"_ICCloudContentTasteUpdateItemCodingKeyTimeStampKey");
  [v5 encodeObject:self->_dsid forKey:@"_ICCloudContentTasteUpdateItemCodingKeyDSIDKey"];
  [v5 encodeInt64:self->_storeID forKey:@"_ICCloudContentTasteUpdateItemCodingKeyStoreIDKey"];
  [v5 encodeInteger:self->_contentTasteType forKey:@"_ICCloudContentTasteUpdateItemCodingKeyTasteTypeKey"];
  [v5 encodeInteger:self->_contentTasteItem forKey:@"_ICCloudContentTasteUpdateItemCodingKeyItemTypeKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (ICCloudContentTasteUpdateItem *)a3;
  if (self == v5)
  {
    BOOL v13 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v25.receiver = self;
      v25.super_class = (Class)&OBJC_CLASS___ICCloudContentTasteUpdateItem;
      if (-[ICCloudContentTasteUpdateItem isEqual:](&v25, "isEqual:", v7))
      {
        updateActionTimeStamp = self->_updateActionTimeStamp;
        id v9 = v7->_updateActionTimeStamp;
        if (updateActionTimeStamp == v9)
        {
        }

        else
        {
          id v10 = v9;
          v11 = updateActionTimeStamp;
          unsigned int v12 = -[NSDate isEqual:](v11, "isEqual:", v10);

          if (!v12) {
            goto LABEL_20;
          }
        }

        globalPlaylistID = self->_globalPlaylistID;
        v15 = v7->_globalPlaylistID;
        if (globalPlaylistID == v15)
        {
        }

        else
        {
          objc_super v16 = v15;
          uint64_t v17 = globalPlaylistID;
          unsigned int v18 = -[NSString isEqual:](v17, "isEqual:", v16);

          if (!v18) {
            goto LABEL_20;
          }
        }

        dsid = self->_dsid;
        objc_super v20 = v7->_dsid;
        if (dsid == v20)
        {
        }

        else
        {
          v21 = v20;
          objc_super v22 = dsid;
          unsigned int v23 = -[NSNumber isEqual:](v22, "isEqual:", v21);

          if (!v23) {
            goto LABEL_20;
          }
        }

        if (self->_contentTasteType == v7->_contentTasteType)
        {
          BOOL v13 = self->_contentTasteItem == v7->_contentTasteItem;
LABEL_21:

          goto LABEL_22;
        }
      }

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed(self, a2);
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575LL;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261LL;
  id v9 = (objc_class *)objc_opt_class(self, v4);
  id v10 = NSStringFromClass(v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  unint64_t v12 = (unint64_t)[v11 hash];
  uint64_t v13 = v5 ^ 0x7465646279746573LL ^ v12;
  uint64_t v14 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v15 = v8 + v13;
  uint64_t v16 = (v8 + v13) ^ __ROR8__(v13, 48);
  uint64_t v17 = v16 + __ROR8__(v6 + v7, 32);
  uint64_t v105 = __ROR8__(v15 + v14, 32);
  uint64_t v109 = v17 ^ __ROR8__(v16, 43);
  unint64_t v18 = v17 ^ v12;
  uint64_t v98 = (v15 + v14) ^ __ROR8__(v14, 47);

  uint64_t v19 = self->_dsid;
  unint64_t v20 = (unint64_t)-[NSNumber hash](v19, "hash");
  unint64_t v21 = (v18 + v98) ^ __ROR8__(v98, 51);
  uint64_t v22 = v105 + (v109 ^ v20);
  uint64_t v23 = __ROR8__(v109 ^ v20, 48);
  uint64_t v24 = (v22 ^ v23) + __ROR8__(v18 + v98, 32);
  uint64_t v25 = v24 ^ __ROR8__(v22 ^ v23, 43);
  uint64_t v26 = v22 + v21;
  uint64_t v106 = __ROR8__(v26, 32);
  uint64_t v110 = v25;
  unint64_t v93 = v24 ^ v20;
  uint64_t v99 = v26 ^ __ROR8__(v21, 47);

  v27 = self->_globalPlaylistID;
  NSUInteger v28 = -[NSString hash](v27, "hash");
  unint64_t v29 = (v93 + v99) ^ __ROR8__(v99, 51);
  NSUInteger v30 = v106 + (v110 ^ v28);
  uint64_t v31 = __ROR8__(v110 ^ v28, 48);
  NSUInteger v32 = (v30 ^ v31) + __ROR8__(v93 + v99, 32);
  uint64_t v33 = v32 ^ __ROR8__(v30 ^ v31, 43);
  uint64_t v34 = v30 + v29;
  uint64_t v107 = __ROR8__(v34, 32);
  uint64_t v111 = v33;
  unint64_t v94 = v32 ^ v28;
  uint64_t v100 = v34 ^ __ROR8__(v29, 47);

  v35 = self->_updateActionTimeStamp;
  unint64_t v36 = (unint64_t)-[NSDate hash](v35, "hash");
  unint64_t v37 = (v94 + v100) ^ __ROR8__(v100, 51);
  uint64_t v38 = v107 + (v111 ^ v36);
  uint64_t v39 = __ROR8__(v111 ^ v36, 48);
  uint64_t v40 = (v38 ^ v39) + __ROR8__(v94 + v100, 32);
  uint64_t v41 = v40 ^ __ROR8__(v38 ^ v39, 43);
  uint64_t v42 = v38 + v37;
  uint64_t v108 = __ROR8__(v42, 32);
  uint64_t v112 = v41;
  unint64_t v95 = v40 ^ v36;
  uint64_t v101 = v42 ^ __ROR8__(v37, 47);

  int64_t contentTasteItem = self->_contentTasteItem;
  unint64_t v44 = (v95 + v101) ^ __ROR8__(v101, 51);
  uint64_t v45 = v108 + (v112 ^ contentTasteItem);
  uint64_t v46 = __ROR8__(v112 ^ contentTasteItem, 48);
  uint64_t v47 = (v45 ^ v46) + __ROR8__(v95 + v101, 32);
  uint64_t v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
  uint64_t v49 = v45 + v44;
  int64_t v96 = v47 ^ contentTasteItem;
  uint64_t v102 = v49 ^ __ROR8__(v44, 47);
  int64_t contentTasteType = self->_contentTasteType;
  int64_t v51 = (v96 + v102) ^ __ROR8__(v102, 51);
  int64_t v52 = __ROR8__(v49, 32) + (v48 ^ contentTasteType);
  uint64_t v53 = __ROR8__(v48 ^ contentTasteType, 48);
  int64_t v54 = (v52 ^ v53) + __ROR8__(v96 + v102, 32);
  int64_t v55 = v54 ^ __ROR8__(v52 ^ v53, 43);
  int64_t v56 = v52 + v51;
  int64_t v97 = v54 ^ contentTasteType;
  uint64_t v103 = v56 ^ __ROR8__(v51, 47);
  int64_t storeID = self->_storeID;
  int64_t v58 = (v97 + v103) ^ __ROR8__(v103, 51);
  int64_t v59 = __ROR8__(v56, 32) + (v55 ^ storeID);
  uint64_t v60 = __ROR8__(v55 ^ storeID, 48);
  int64_t v61 = (v59 ^ v60) + __ROR8__(v97 + v103, 32);
  int64_t v62 = v61 ^ __ROR8__(v59 ^ v60, 43);
  int64_t v63 = v59 + v58;
  uint64_t v104 = v63 ^ __ROR8__(v58, 47);
  int64_t v64 = ((v61 ^ storeID) + v104) ^ __ROR8__(v104, 51);
  uint64_t v65 = __ROR8__(v63, 32) + (v62 ^ 0x3800000000000000LL);
  uint64_t v66 = __ROR8__(v62 ^ 0x3800000000000000LL, 48);
  uint64_t v67 = (v65 ^ v66) + __ROR8__((v61 ^ storeID) + v104, 32);
  uint64_t v68 = v67 ^ __ROR8__(v65 ^ v66, 43);
  uint64_t v69 = v65 + v64;
  uint64_t v70 = v69 ^ __ROR8__(v64, 47);
  uint64_t v71 = (v67 ^ 0x3800000000000000LL) + v70;
  uint64_t v72 = v71 ^ __ROR8__(v70, 51);
  uint64_t v73 = (__ROR8__(v69, 32) ^ 0xFFLL) + v68;
  uint64_t v74 = __ROR8__(v68, 48);
  uint64_t v75 = __ROR8__(v71, 32) + (v73 ^ v74);
  uint64_t v76 = v75 ^ __ROR8__(v73 ^ v74, 43);
  uint64_t v77 = v72 + v73;
  uint64_t v78 = v77 ^ __ROR8__(v72, 47);
  uint64_t v79 = v78 + v75;
  uint64_t v80 = v79 ^ __ROR8__(v78, 51);
  uint64_t v81 = __ROR8__(v77, 32) + v76;
  uint64_t v82 = __ROR8__(v76, 48);
  uint64_t v83 = __ROR8__(v79, 32) + (v81 ^ v82);
  uint64_t v84 = v83 ^ __ROR8__(v81 ^ v82, 43);
  uint64_t v85 = v80 + v81;
  uint64_t v86 = v85 ^ __ROR8__(v80, 47);
  uint64_t v87 = v86 + v83;
  uint64_t v88 = v87 ^ __ROR8__(v86, 51);
  uint64_t v89 = __ROR8__(v85, 32) + v84;
  uint64_t v90 = __ROR8__(v84, 48);
  uint64_t v91 = __ROR8__(v87, 32) + (v89 ^ v90);
  return (v88 + v89) ^ __ROR8__(v88, 47) ^ v91 ^ __ROR8__(v88 + v89, 32) ^ v91 ^ __ROR8__(v89 ^ v90, 43);
}

- (int64_t)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(int64_t)a3
{
  self->_int64_t storeID = a3;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (int64_t)contentTasteType
{
  return self->_contentTasteType;
}

- (void)setContentTasteType:(int64_t)a3
{
  self->_int64_t contentTasteType = a3;
}

- (int64_t)contentTasteItem
{
  return self->_contentTasteItem;
}

- (void)setContentTasteItem:(int64_t)a3
{
  self->_int64_t contentTasteItem = a3;
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)setGlobalPlaylistID:(id)a3
{
}

- (NSDate)updateActionTimeStamp
{
  return self->_updateActionTimeStamp;
}

- (void)setUpdateActionTimeStamp:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end