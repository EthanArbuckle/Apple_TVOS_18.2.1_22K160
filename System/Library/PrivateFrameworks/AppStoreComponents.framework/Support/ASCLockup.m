@interface ASCLockup
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)id;
- (ASCArtwork)icon;
- (ASCLockup)initWithCoder:(id)a3;
- (ASCLockup)initWithID:(id)a3 kind:(id)a4 icon:(id)a5 heading:(id)a6 title:(id)a7 subtitle:(id)a8 ageRating:(id)a9 offer:(id)a10;
- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11;
- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11 features:(id)a12;
- (ASCLockup)lockupWithOffer:(id)a3;
- (ASCLockup)lockupWithSignpostTags:(id)a3;
- (ASCLockupDisplayContext)displayContext;
- (ASCOffer)offer;
- (ASCScreenshots)screenshots;
- (ASCTrailers)trailers;
- (ASCViewMetrics)metrics;
- (BOOL)hasMedia;
- (BOOL)isEditorsChoice;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresSSOEntitlement;
- (NSArray)features;
- (NSArray)subgenres;
- (NSSet)signpostTags;
- (NSString)ageRating;
- (NSString)bundleID;
- (NSString)contentProviderTeamID;
- (NSString)description;
- (NSString)developerName;
- (NSString)eula;
- (NSString)genreID;
- (NSString)genreName;
- (NSString)heading;
- (NSString)kind;
- (NSString)privacyPolicyUrl;
- (NSString)productDescription;
- (NSString)productPageDescription;
- (NSString)productPageMetadata;
- (NSString)productRatingBadge;
- (NSString)productVariantID;
- (NSString)shortName;
- (NSString)subtitle;
- (NSString)title;
- (float)productRating;
- (id)featureWithClass:(Class)a3;
- (id)lockupByAddingFeature:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockup

- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11 features:(id)a12
{
  id v17 = a3;
  id v49 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___ASCLockup;
  v26 = -[ASCLockup init](&v50, "init");
  if (v26)
  {
    v27 = (ASCAdamID *)[v17 copy];
    id = v26->_id;
    v26->_id = v27;

    v29 = (NSString *)[v49 copy];
    kind = v26->_kind;
    v26->_kind = v29;

    v31 = (ASCViewMetrics *)[v18 copy];
    metrics = v26->_metrics;
    v26->_metrics = v31;

    v33 = (ASCArtwork *)[v19 copy];
    icon = v26->_icon;
    v26->_icon = v33;

    v35 = (NSString *)[v20 copy];
    heading = v26->_heading;
    v26->_heading = v35;

    v37 = (NSString *)[v21 copy];
    title = v26->_title;
    v26->_title = v37;

    v39 = (NSString *)[v22 copy];
    subtitle = v26->_subtitle;
    v26->_subtitle = v39;

    v41 = (NSString *)[v23 copy];
    ageRating = v26->_ageRating;
    v26->_ageRating = v41;

    v43 = (ASCOffer *)[v24 copyWithZone:0];
    offer = v26->_offer;
    v26->_offer = v43;

    v45 = (NSArray *)[v25 copy];
    features = v26->_features;
    v26->_features = v45;
  }

  return v26;
}

- (ASCLockup)initWithID:(id)a3 kind:(id)a4 metrics:(id)a5 icon:(id)a6 heading:(id)a7 title:(id)a8 subtitle:(id)a9 ageRating:(id)a10 offer:(id)a11
{
  return -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:]( self,  "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  &__NSArray0__struct);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ASCAdamID) forKey:@"id"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"kind"];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      id v9 = [v4 decodeObjectOfClass:objc_opt_class(ASCViewMetrics) forKey:@"metrics"];
      v48 = (void *)objc_claimAutoreleasedReturnValue(v9);
      id v10 = [v4 decodeObjectOfClass:objc_opt_class(ASCArtwork) forKey:@"icon"];
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"heading"];
      id v49 = (void *)objc_claimAutoreleasedReturnValue(v12);
      id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"title"];
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"subtitle"];
      v47 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ageRating"];
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      id v18 = sub_10001ACFC(v4, @"offer");
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v20 = sub_100016F40(v4, @"features");
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      id v22 = v6;
      id v23 = v8;
      objc_super v50 = v8;
      id v24 = (void *)v11;
      uint64_t v25 = v11;
      v26 = v6;
      v27 = (void *)v14;
      v28 =  -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:]( self,  "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:",  v22,  v23,  v48,  v25,  v49,  v14,  v47,  v17,  v19,  v21);

      v6 = v26;
      self = v28;

      v8 = v50;
      v29 = v28;
    }

    else
    {
      BOOL v38 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v38) {
        sub_1000E10F8(v38, v39, v40, v41, v42, v43, v44, v45);
      }
      v29 = 0LL;
    }
  }

  else
  {
    BOOL v30 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v30) {
      sub_1000E10C0(v30, v31, v32, v33, v34, v35, v36, v37);
    }
    v29 = 0LL;
  }

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup id](self, "id"));
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup kind](self, "kind"));
  [v4 encodeObject:v6 forKey:@"kind"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup metrics](self, "metrics"));
  [v4 encodeObject:v7 forKey:@"metrics"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup icon](self, "icon"));
  [v4 encodeObject:v8 forKey:@"icon"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup heading](self, "heading"));
  [v4 encodeObject:v9 forKey:@"heading"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup title](self, "title"));
  [v4 encodeObject:v10 forKey:@"title"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup subtitle](self, "subtitle"));
  [v4 encodeObject:v11 forKey:@"subtitle"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup ageRating](self, "ageRating"));
  [v4 encodeObject:v12 forKey:@"ageRating"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup offer](self, "offer"));
  [v4 encodeObject:v13 forKey:@"offer"];

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockup features](self, "features"));
  [v4 encodeObject:v14 forKey:@"features"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup kind](self, "kind"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup metrics](self, "metrics"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup icon](self, "icon"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup heading](self, "heading"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup title](self, "title"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup subtitle](self, "subtitle"));
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup ageRating](self, "ageRating"));
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup offer](self, "offer"));
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup features](self, "features"));
  -[ASCHasher combineObject:](v3, "combineObject:", v13);

  unint64_t v14 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockup *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockup);
    v6 = v4;
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

    id v10 = v8;

    if (!v10)
    {
      BOOL v9 = 0;
LABEL_69:

      goto LABEL_70;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup id](self, "id"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockup id](v10, "id"));
    id v13 = (void *)v12;
    if (v11 && v12)
    {
      if ([v11 isEqual:v12])
      {
LABEL_12:
        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup kind](self, "kind"));
        uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ASCLockup kind](v10, "kind"));
        id v16 = (void *)v15;
        if (v14 && v15)
        {
          if ([v14 isEqual:v15])
          {
LABEL_15:
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup metrics](self, "metrics"));
            uint64_t v18 = objc_claimAutoreleasedReturnValue(-[ASCLockup metrics](v10, "metrics"));
            id v19 = (void *)v18;
            if (v17 && v18)
            {
              if ([v17 isEqual:v18])
              {
LABEL_18:
                id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup icon](self, "icon"));
                uint64_t v21 = objc_claimAutoreleasedReturnValue(-[ASCLockup icon](v10, "icon"));
                id v22 = (void *)v21;
                if (v20 && v21)
                {
                  id v23 = v20;
                  v68 = v17;
                  id v24 = v19;
                  uint64_t v25 = v20;
                  v26 = v22;
                  unsigned int v27 = [v23 isEqual:v22];
                  id v22 = v26;
                  id v20 = v25;
                  id v19 = v24;
                  id v17 = v68;
                  if (v27)
                  {
LABEL_21:
                    v66 = v22;
                    v67 = v20;
                    uint64_t v28 = objc_claimAutoreleasedReturnValue(-[ASCLockup heading](self, "heading"));
                    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[ASCLockup heading](v10, "heading"));
                    BOOL v30 = (void *)v29;
                    v69 = (void *)v28;
                    if (v28 && v29)
                    {
                      uint64_t v31 = (void *)v29;
                      unsigned int v32 = [v69 isEqual:v29];
                      BOOL v30 = v31;
                      if (v32)
                      {
LABEL_24:
                        v64 = v30;
                        uint64_t v33 = objc_claimAutoreleasedReturnValue(-[ASCLockup title](self, "title"));
                        uint64_t v34 = objc_claimAutoreleasedReturnValue(-[ASCLockup title](v10, "title"));
                        uint64_t v35 = (void *)v34;
                        v65 = (void *)v33;
                        if (v33 && v34)
                        {
                          uint64_t v36 = (void *)v34;
                          unsigned int v37 = [v65 isEqual:v34];
                          uint64_t v35 = v36;
                          if (v37)
                          {
LABEL_27:
                            v62 = v35;
                            uint64_t v38 = objc_claimAutoreleasedReturnValue(-[ASCLockup subtitle](self, "subtitle"));
                            uint64_t v39 = objc_claimAutoreleasedReturnValue(-[ASCLockup subtitle](v10, "subtitle"));
                            uint64_t v40 = (void *)v39;
                            v63 = (void *)v38;
                            if (v38 && v39)
                            {
                              uint64_t v41 = (void *)v39;
                              unsigned int v42 = [v63 isEqual:v39];
                              uint64_t v40 = v41;
                              if (v42)
                              {
LABEL_30:
                                v60 = v40;
                                uint64_t v43 = objc_claimAutoreleasedReturnValue(-[ASCLockup ageRating](self, "ageRating"));
                                uint64_t v44 = objc_claimAutoreleasedReturnValue(-[ASCLockup ageRating](v10, "ageRating"));
                                uint64_t v45 = (void *)v44;
                                v61 = (void *)v43;
                                if (v43 && v44)
                                {
                                  v46 = (void *)v44;
                                  unsigned int v47 = [v61 isEqual:v44];
                                  uint64_t v45 = v46;
                                  if (v47)
                                  {
LABEL_33:
                                    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup offer](self, "offer", v45));
                                    uint64_t v49 = objc_claimAutoreleasedReturnValue(-[ASCLockup offer](v10, "offer"));
                                    v58 = (void *)v49;
                                    v59 = v48;
                                    if (v48 && v49)
                                    {
                                    }

                                    else if (v48 == (void *)v49)
                                    {
LABEL_36:
                                      objc_super v50 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup features](self, "features"));
                                      uint64_t v51 = objc_claimAutoreleasedReturnValue(-[ASCLockup features](v10, "features"));
                                      v52 = (void *)v51;
                                      if (v50 && v51)
                                      {
                                        v53 = (void *)v51;
                                        unsigned __int8 v54 = [v50 isEqual:v51];
                                        v52 = v53;
                                        v55 = v50;
                                        BOOL v9 = v54;
                                      }

                                      else
                                      {
                                        v55 = v50;
                                        BOOL v9 = v50 == (void *)v51;
                                      }

                                      goto LABEL_60;
                                    }

                                    BOOL v9 = 0;
LABEL_60:

                                    uint64_t v45 = v57;
                                    goto LABEL_61;
                                  }
                                }

                                else if (v43 == v44)
                                {
                                  goto LABEL_33;
                                }

                                BOOL v9 = 0;
LABEL_61:

                                uint64_t v40 = v60;
                                goto LABEL_62;
                              }
                            }

                            else if (v38 == v39)
                            {
                              goto LABEL_30;
                            }

                            BOOL v9 = 0;
LABEL_62:

                            uint64_t v35 = v62;
                            goto LABEL_63;
                          }
                        }

                        else if (v33 == v34)
                        {
                          goto LABEL_27;
                        }

                        BOOL v9 = 0;
LABEL_63:

                        BOOL v30 = v64;
                        goto LABEL_64;
                      }
                    }

                    else if (v28 == v29)
                    {
                      goto LABEL_24;
                    }

                    BOOL v9 = 0;
LABEL_64:

                    id v22 = v66;
                    id v20 = v67;
                    goto LABEL_65;
                  }
                }

                else if (v20 == (void *)v21)
                {
                  goto LABEL_21;
                }

                BOOL v9 = 0;
LABEL_65:

                goto LABEL_66;
              }
            }

            else if (v17 == (void *)v18)
            {
              goto LABEL_18;
            }

            BOOL v9 = 0;
LABEL_66:

            goto LABEL_67;
          }
        }

        else if (v14 == (void *)v15)
        {
          goto LABEL_15;
        }

        BOOL v9 = 0;
LABEL_67:

        goto LABEL_68;
      }
    }

    else if (v11 == (void *)v12)
    {
      goto LABEL_12;
    }

    BOOL v9 = 0;
LABEL_68:

    goto LABEL_69;
  }

  BOOL v9 = 1;
LABEL_70:

  return v9;
}

- (NSString)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup kind](self, "kind"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"kind");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup metrics](self, "metrics"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"metrics");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup icon](self, "icon"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, @"icon");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup heading](self, "heading"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, @"heading");

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup title](self, "title"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, @"title");

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup subtitle](self, "subtitle"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, @"subtitle");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup ageRating](self, "ageRating"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, @"ageRating");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup offer](self, "offer"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, @"offer");

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup features](self, "features"));
  id v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup features](self, "features"));
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v15, @"features");
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));

  return (NSString *)v16;
}

- (id)featureWithClass:(Class)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup features](self, "features", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v9, a3) & 1) != 0)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (id)lockupByAddingFeature:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup features](self, "features"));
  id v6 = [v5 mutableCopy];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000114C8;
  v22[3] = &unk_10011F0F0;
  id v7 = v4;
  id v23 = v7;
  id v8 = [v6 indexOfObjectPassingTest:v22];
  uint64_t v21 = v7;
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    [v6 addObject:v7];
  }
  else {
    [v6 replaceObjectAtIndex:v8 withObject:v7];
  }
  id v19 = objc_alloc(&OBJC_CLASS___ASCLockup);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup id](self, "id"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup kind](self, "kind"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup metrics](self, "metrics"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup icon](self, "icon"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup heading](self, "heading"));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup title](self, "title"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup subtitle](self, "subtitle"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup ageRating](self, "ageRating"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup offer](self, "offer"));
  id v20 = -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:]( v19,  "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v6);

  return v20;
}

- (ASCLockup)lockupWithOffer:(id)a3
{
  id v4 = a3;
  id v16 = objc_alloc(&OBJC_CLASS___ASCLockup);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup id](self, "id"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup kind](self, "kind"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup metrics](self, "metrics"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup icon](self, "icon"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup heading](self, "heading"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup title](self, "title"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup subtitle](self, "subtitle"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup ageRating](self, "ageRating"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup features](self, "features"));
  __int128 v13 = -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:]( v16,  "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:",  v15,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v4,  v12);

  return v13;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSString)kind
{
  return self->_kind;
}

- (ASCViewMetrics)metrics
{
  return self->_metrics;
}

- (ASCArtwork)icon
{
  return self->_icon;
}

- (NSString)heading
{
  return self->_heading;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (ASCOffer)offer
{
  return self->_offer;
}

- (NSArray)features
{
  return self->_features;
}

- (void).cxx_destruct
{
}

- (ASCLockup)initWithID:(id)a3 kind:(id)a4 icon:(id)a5 heading:(id)a6 title:(id)a7 subtitle:(id)a8 ageRating:(id)a9 offer:(id)a10
{
  return -[ASCLockup initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:]( self,  "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:",  a3,  a4,  0LL,  a5,  a6,  a7,  a8,  a9,  a10);
}

- (BOOL)isEditorsChoice
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureAd));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 isEditorsChoice];

  return v4;
}

- (float)productRating
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureAd));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v3 productRating];
  float v5 = v4;

  return v5;
}

- (NSString)productRatingBadge
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureAd));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productRatingBadge]);

  return (NSString *)v4;
}

- (NSString)productDescription
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureAd));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productDescription]);

  return (NSString *)v4;
}

- (NSString)bundleID
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureBundleID));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleID]);

  return (NSString *)v4;
}

- (NSString)developerName
{
  id v2 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureDeveloperName));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 developerName]);

  return (NSString *)v4;
}

- (ASCLockupDisplayContext)displayContext
{
  id v2 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureDisplayContext));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayContext]);

  return (ASCLockupDisplayContext *)v4;
}

- (NSString)privacyPolicyUrl
{
  id v2 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureExtendedAttributes));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 privacyPolicyUrl]);

  return (NSString *)v4;
}

- (NSString)eula
{
  id v2 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureExtendedAttributes));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eula]);

  return (NSString *)v4;
}

- (NSString)genreName
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureGenre));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 genreName]);

  return (NSString *)v4;
}

- (NSString)genreID
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureGenre));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 genreID]);

  return (NSString *)v4;
}

- (NSArray)subgenres
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureGenre));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = v3;
  if (v3) {
    float v5 = (void *)objc_claimAutoreleasedReturnValue([v3 subgenres]);
  }
  else {
    float v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (ASCScreenshots)screenshots
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureMedia));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 screenshots]);

  return (ASCScreenshots *)v4;
}

- (ASCTrailers)trailers
{
  id v2 = -[ASCLockup featureWithClass:](self, "featureWithClass:", objc_opt_class(&OBJC_CLASS___ASCLockupFeatureMedia));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 trailers]);

  return (ASCTrailers *)v4;
}

- (BOOL)hasMedia
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup screenshots](self, "screenshots"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 artwork]);
  if ([v4 count])
  {
    BOOL v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup trailers](self, "trailers"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 videos]);
    BOOL v5 = [v7 count] != 0;
  }

  return v5;
}

- (NSString)productPageMetadata
{
  id v2 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureMiniProductPage));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productPageMetadata]);

  return (NSString *)v4;
}

- (NSString)productPageDescription
{
  id v2 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureMiniProductPage));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productPageDescription]);

  return (NSString *)v4;
}

- (NSString)productVariantID
{
  id v2 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureProductVariants));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productVariantID]);

  return (NSString *)v4;
}

- (NSString)contentProviderTeamID
{
  id v3 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureSafariExtension));
  float v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 contentProviderTeamID]);
LABEL_5:

    return (NSString *)v6;
  }

  if (!os_variant_has_internal_content("com.apple.appstorecomponentsd"))
  {
    id v6 = &stru_1001276D8;
    goto LABEL_5;
  }

  id v8 = objc_alloc(&OBJC_CLASS___NSString);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup id](self, "id"));
  id v10 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"Lockup for %@ Adam ID does not include Safari extension feature.",  v9);

  uint64_t v11 = objc_alloc(&OBJC_CLASS___NSException);
  v17[0] = NSLocalizedRecoverySuggestionErrorKey;
  v17[1] = NSLocalizedFailureReasonErrorKey;
  v18[0] = @"Set ASCLockupContextSafariExtension context on lockup request";
  v18[1] = @"Possibly a mismatching JS version for ASC";
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  __int128 v13 =  -[NSException initWithName:reason:userInfo:]( v11,  "initWithName:reason:userInfo:",  NSInternalInconsistencyException,  v10,  v12);

  objc_exception_throw(v13);
  return (NSString *)-[ASCLockupFeatureSafariExtension initWithContentProviderTeamID:](v14, v15, v16);
}

- (NSString)shortName
{
  id v2 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureShortName));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 shortName]);

  return (NSString *)v4;
}

- (NSSet)signpostTags
{
  id v2 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureSignpostTags));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 signpostTags]);

  return (NSSet *)v4;
}

- (ASCLockup)lockupWithSignpostTags:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[ASCLockupFeatureSignpostTags initWithSignpostTags:]( objc_alloc(&OBJC_CLASS___ASCLockupFeatureSignpostTags),  "initWithSignpostTags:",  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup lockupByAddingFeature:](self, "lockupByAddingFeature:", v5));
  return (ASCLockup *)v6;
}

- (BOOL)requiresSSOEntitlement
{
  id v3 = -[ASCLockup featureWithClass:]( self,  "featureWithClass:",  objc_opt_class(&OBJC_CLASS___ASCLockupFeatureSingleSignOn));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = [v4 requiresSSOEntitlement];
LABEL_5:

    return v6;
  }

  if (!os_variant_has_internal_content("com.apple.appstorecomponentsd"))
  {
    unsigned __int8 v6 = 0;
    goto LABEL_5;
  }

  id v8 = objc_alloc(&OBJC_CLASS___NSString);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockup id](self, "id"));
  id v10 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"Lockup for %@ Adam ID does not include Single Sign On feature.",  v9);

  uint64_t v11 = objc_alloc(&OBJC_CLASS___NSException);
  v17[0] = NSLocalizedRecoverySuggestionErrorKey;
  v17[1] = NSLocalizedFailureReasonErrorKey;
  v18[0] = @"Set ASCLockupContextSingleSignOn context on lockup request";
  v18[1] = @"Possibly a mismatching JS version for ASC";
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  __int128 v13 =  -[NSException initWithName:reason:userInfo:]( v11,  "initWithName:reason:userInfo:",  NSInternalInconsistencyException,  v10,  v12);

  objc_exception_throw(v13);
  return -[ASCLockupFeatureSingleSignOn initWithRequiresSSOEntitlement:](v14, v15, v16);
}

@end