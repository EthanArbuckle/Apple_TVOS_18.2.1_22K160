@interface AppMetadata
+ (Class)databaseEntityClass;
- (AppMetadata)init;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AppMetadata

- (AppMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppMetadata;
  return -[SQLiteMemoryEntity init](&v3, "init");
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = sub_1002C860C(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = sub_1002C8630(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_1002C8654(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = sub_1002C8678(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = sub_1002C8710(self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ { bundleID: %@ itemID: %@ evid: %@ timestamp: %@ cohort: %@ }",  v3,  v5,  v7,  v9,  v11,  v13));

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v8 = a3;
  if (!objc_msgSend(v8, "isMemberOfClass:", objc_opt_class(self, v9)))
  {
    unsigned __int8 v15 = 0;
    goto LABEL_63;
  }

  id v10 = sub_1002C860C(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (!v11)
  {
    id v12 = sub_1002C860C(v8);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (!v6)
    {
      int v72 = 0;
      goto LABEL_9;
    }
  }

  id v13 = sub_1002C860C(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v14 = sub_1002C860C(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if ([v4 isEqual:v5])
  {
    int v72 = 1;
LABEL_9:
    id v16 = sub_1002C8B88(self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (v17 || (id v18 = sub_1002C8B88(v8), (v69 = (void *)objc_claimAutoreleasedReturnValue(v18)) != 0LL))
    {
      id v19 = sub_1002C8B88(self);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      id v21 = sub_1002C8B88(v8);
      v71 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (!objc_msgSend(v20, "isEqual:"))
      {
        unsigned __int8 v15 = 0;
        goto LABEL_55;
      }

      v66 = v20;
      int v70 = 1;
    }

    else
    {
      v69 = 0LL;
      int v70 = 0;
    }

    id v22 = sub_1002C8630(self);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (v23 || (id v24 = sub_1002C8630(v8), (v61 = (void *)objc_claimAutoreleasedReturnValue(v24)) != 0LL))
    {
      id v25 = sub_1002C8630(self);
      uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
      id v27 = sub_1002C8630(v8);
      uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
      v68 = (void *)v26;
      v29 = (void *)v26;
      uint64_t v3 = (void *)v28;
      if (![v29 isEqual:v28])
      {
        unsigned __int8 v15 = 0;
LABEL_50:

LABEL_51:
        if (!v23) {

        }
        if (!v70) {
          goto LABEL_56;
        }
        v20 = v66;
LABEL_55:

LABEL_56:
        if (!v17) {

        }
        if (v72)
        {
        }

        goto LABEL_60;
      }

      int v65 = 1;
    }

    else
    {
      v61 = 0LL;
      int v65 = 0;
    }

    id v30 = sub_1002C8654(self);
    uint64_t v67 = objc_claimAutoreleasedReturnValue(v30);
    if (v67 || (id v31 = sub_1002C8654(v8), (v57 = (void *)objc_claimAutoreleasedReturnValue(v31)) != 0LL))
    {
      v32 = v6;
      id v33 = sub_1002C8654(self);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      id v35 = sub_1002C8654(v8);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v63 = v34;
      if (![v34 isEqual:v62])
      {
        unsigned __int8 v15 = 0;
        id v6 = v32;
        goto LABEL_46;
      }

      int v60 = 1;
      id v6 = v32;
    }

    else
    {
      v57 = 0LL;
      int v60 = 0;
    }

    id v36 = sub_1002C8710(self);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if (v64 || (id v37 = sub_1002C8710(v8), (v53 = (void *)objc_claimAutoreleasedReturnValue(v37)) != 0LL))
    {
      id v38 = sub_1002C8710(self);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      id v40 = sub_1002C8710(v8);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v59 = v39;
      if (![v39 isEqual:v58])
      {
        unsigned __int8 v15 = 0;
LABEL_42:

LABEL_43:
        if (!v64) {

        }
        if (!v60)
        {
LABEL_47:
          v50 = (void *)v67;
          if (!v67)
          {

            v50 = 0LL;
          }

          if (!v65) {
            goto LABEL_51;
          }
          goto LABEL_50;
        }

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppMetadata;
  return -[SQLiteMemoryEntity copyWithZone:](&v4, "copyWithZone:", a3);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppMetadataEntity, a2);
}

@end