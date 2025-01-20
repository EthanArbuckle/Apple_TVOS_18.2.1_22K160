@interface ASCURLOffer
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCURLOffer)initWithCoder:(id)a3;
- (ASCURLOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 url:(id)a9 isSensitive:(BOOL)a10;
- (ASCURLOffer)offerWithMetrics:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSensitive;
- (NSArray)metrics;
- (NSDictionary)subtitles;
- (NSDictionary)titles;
- (NSNumber)ageRating;
- (NSString)description;
- (NSURL)url;
- (int64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCURLOffer

- (ASCURLOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 url:(id)a9 isSensitive:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___ASCURLOffer;
  v22 = -[ASCURLOffer init](&v34, "init");
  if (v22)
  {
    v23 = (ASCAdamID *)[v16 copy];
    id = v22->_id;
    v22->_id = v23;

    v25 = (NSDictionary *)[v17 copy];
    titles = v22->_titles;
    v22->_titles = v25;

    v27 = (NSDictionary *)[v18 copy];
    subtitles = v22->_subtitles;
    v22->_subtitles = v27;

    v22->_flags = a6;
    objc_storeStrong((id *)&v22->_ageRating, a7);
    v29 = (NSArray *)[v20 copy];
    metrics = v22->_metrics;
    v22->_metrics = v29;

    v31 = (NSURL *)[v21 copy];
    url = v22->_url;
    v22->_url = v31;

    v22->_isSensitive = a10;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCURLOffer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ASCAdamID) forKey:@"id"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = sub_10001AB28(v4, @"titles");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      id v9 = sub_10001AB28(v4, @"subtitles");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (v10)
      {
        id v11 = [v4 decodeIntegerForKey:@"flags"];
        id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ageRating"];
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v14 = sub_100019B2C(v4, @"metrics");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v15)
        {
          id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"url"];
          id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v17)
          {
            LOBYTE(v60) = [v4 decodeBoolForKey:@"isSensitive"];
            self =  -[ASCURLOffer initWithID:titles:subtitles:flags:ageRating:metrics:url:isSensitive:]( self,  "initWithID:titles:subtitles:flags:ageRating:metrics:url:isSensitive:",  v6,  v8,  v10,  v11,  v13,  v15,  v17,  v60);
            id v18 = self;
          }

          else
          {
            BOOL v51 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v51) {
              sub_1000E1D4C(v51, v52, v53, v54, v55, v56, v57, v58);
            }
            id v18 = 0LL;
          }
        }

        else
        {
          BOOL v43 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v43) {
            sub_1000E1D18(v43, v44, v45, v46, v47, v48, v49, v50);
          }
          id v18 = 0LL;
        }
      }

      else
      {
        BOOL v35 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v35) {
          sub_1000E1CE4(v35, v36, v37, v38, v39, v40, v41, v42);
        }
        id v18 = 0LL;
      }
    }

    else
    {
      BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v27) {
        sub_1000E1CB0(v27, v28, v29, v30, v31, v32, v33, v34);
      }
      id v18 = 0LL;
    }
  }

  else
  {
    BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19) {
      sub_1000E1C7C(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    id v18 = 0LL;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer id](self, "id"));
  [v10 encodeObject:v4 forKey:@"id"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer titles](self, "titles"));
  [v10 encodeObject:v5 forKey:@"titles"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer subtitles](self, "subtitles"));
  [v10 encodeObject:v6 forKey:@"subtitles"];

  objc_msgSend(v10, "encodeInteger:forKey:", -[ASCURLOffer flags](self, "flags"), @"flags");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer ageRating](self, "ageRating"));
  [v10 encodeObject:v7 forKey:@"ageRating"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer metrics](self, "metrics"));
  [v10 encodeObject:v8 forKey:@"metrics"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer url](self, "url"));
  [v10 encodeObject:v9 forKey:@"url"];

  objc_msgSend(v10, "encodeBool:forKey:", -[ASCURLOffer isSensitive](self, "isSensitive"), @"isSensitive");
}

- (ASCURLOffer)offerWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer id](self, "id"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer titles](self, "titles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer subtitles](self, "subtitles"));
  int64_t v9 = -[ASCURLOffer flags](self, "flags");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer ageRating](self, "ageRating"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer url](self, "url"));
  LOBYTE(v14) = -[ASCURLOffer isSensitive](self, "isSensitive");
  id v12 = [v5 initWithID:v6 titles:v7 subtitles:v8 flags:v9 ageRating:v10 metrics:v4 url:v11 isSensitive:v14];

  return (ASCURLOffer *)v12;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer titles](self, "titles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer subtitles](self, "subtitles"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCURLOffer flags](self, "flags"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer ageRating](self, "ageRating"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer metrics](self, "metrics"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer url](self, "url"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCURLOffer isSensitive](self, "isSensitive"));
  unint64_t v10 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCURLOffer);
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;

  if (v9)
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer id](self, "id"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 id]);
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      if ([v10 isEqual:v11])
      {
LABEL_10:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer titles](self, "titles"));
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 titles]);
        v15 = (void *)v14;
        if (v13 && v14)
        {
          if ([v13 isEqual:v14])
          {
LABEL_13:
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer subtitles](self, "subtitles"));
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 subtitles]);
            id v18 = (void *)v17;
            if (v16 && v17)
            {
            }

            else if (v16 != (void *)v17)
            {
              goto LABEL_34;
            }

            id v20 = -[ASCURLOffer flags](self, "flags");
            if (v20 == [v9 flags])
            {
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer ageRating](self, "ageRating"));
              uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 ageRating]);
              uint64_t v23 = (void *)v22;
              uint64_t v45 = v21;
              if (v21 && v22)
              {
                uint64_t v24 = v21;
                uint64_t v25 = v23;
                unsigned int v26 = [v24 isEqual:v23];
                uint64_t v23 = v25;
                uint64_t v21 = v45;
                if (v26)
                {
LABEL_27:
                  BOOL v43 = v23;
                  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[ASCURLOffer metrics](self, "metrics"));
                  uint64_t v28 = objc_claimAutoreleasedReturnValue([v9 metrics]);
                  uint64_t v29 = (void *)v28;
                  uint64_t v44 = (void *)v27;
                  if (v27 && v28)
                  {
                    uint64_t v30 = (void *)v28;
                    unsigned int v31 = [v44 isEqual:v28];
                    uint64_t v29 = v30;
                    if (v31)
                    {
LABEL_30:
                      uint64_t v41 = v29;
                      uint64_t v32 = objc_claimAutoreleasedReturnValue(-[ASCURLOffer url](self, "url"));
                      uint64_t v33 = objc_claimAutoreleasedReturnValue([v9 url]);
                      uint64_t v34 = (void *)v33;
                      uint64_t v42 = (void *)v32;
                      if (v32 && v33)
                      {
                        BOOL v35 = (void *)v33;
                        unsigned int v36 = [v42 isEqual:v33];
                        uint64_t v34 = v35;
                        if (v36)
                        {
LABEL_33:
                          uint64_t v37 = v34;
                          unsigned __int8 v38 = -[ASCURLOffer isSensitive](self, "isSensitive");
                          unsigned __int8 v39 = [v9 isSensitive];
                          uint64_t v34 = v37;
                          char v19 = v38 ^ v39 ^ 1;
LABEL_41:

                          uint64_t v29 = v41;
                          goto LABEL_42;
                        }
                      }

                      else if (v32 == v33)
                      {
                        goto LABEL_33;
                      }

                      char v19 = 0;
                      goto LABEL_41;
                    }
                  }

                  else if (v27 == v28)
                  {
                    goto LABEL_30;
                  }

                  char v19 = 0;
LABEL_42:

                  uint64_t v23 = v43;
                  uint64_t v21 = v45;
                  goto LABEL_43;
                }
              }

              else if (v21 == (void *)v22)
              {
                goto LABEL_27;
              }

              char v19 = 0;
LABEL_43:

              goto LABEL_44;
            }

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer titles](self, "titles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"titles");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer subtitles](self, "subtitles"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"subtitles");

  id Description = ASCOfferFlagsGetDescription((__int16)-[ASCURLOffer flags](self, "flags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(Description);
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, @"flags");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer ageRating](self, "ageRating"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, @"ageRating");

  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer metrics](self, "metrics"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v10, @"metrics");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCURLOffer url](self, "url"));
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v11, @"url");

  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCURLOffer isSensitive](self, "isSensitive"),  @"isSensitive");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));

  return (NSString *)v12;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSDictionary)titles
{
  return self->_titles;
}

- (NSDictionary)subtitles
{
  return self->_subtitles;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSNumber)ageRating
{
  return self->_ageRating;
}

- (NSArray)metrics
{
  return self->_metrics;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isSensitive
{
  return self->_isSensitive;
}

- (void).cxx_destruct
{
}

@end