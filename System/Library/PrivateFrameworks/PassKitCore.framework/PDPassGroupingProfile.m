@interface PDPassGroupingProfile
- (BOOL)isEqual:(id)a3;
- (BOOL)isNFCEnabled;
- (NSArray)relevantDates;
- (NSDate)ingestedDate;
- (NSString)groupingID;
- (NSString)passTypeID;
- (int64_t)passStyle;
- (unint64_t)passType;
- (void)setGroupingID:(id)a3;
- (void)setIngestedDate:(id)a3;
- (void)setNFCEnabled:(BOOL)a3;
- (void)setPassStyle:(int64_t)a3;
- (void)setPassTypeID:(id)a3;
- (void)setRelevantDates:(id)a3;
@end

@implementation PDPassGroupingProfile

- (void)setPassTypeID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  passTypeID = self->_passTypeID;
  self->_passTypeID = v4;

  self->_passType = PKPassTypeForPassTypeIdentifier(self->_passTypeID);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDPassGroupingProfile, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassGroupingProfile passTypeID](self, "passTypeID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 passTypeID]);
    id v10 = v8;
    id v11 = v9;
    v12 = v11;
    if (v10 == v11)
    {
    }

    else
    {
      BOOL v13 = 0;
      v14 = v11;
      id v15 = v10;
      if (!v10 || !v11) {
        goto LABEL_33;
      }
      unsigned int v16 = [v10 isEqualToString:v11];

      if (!v16)
      {
        BOOL v13 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassGroupingProfile groupingID](self, "groupingID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 groupingID]);
    id v15 = v17;
    id v19 = v18;
    v14 = v19;
    if (v15 == v19)
    {
    }

    else
    {
      BOOL v13 = 0;
      v20 = v19;
      v21 = v15;
      if (!v15 || !v19) {
        goto LABEL_32;
      }
      unsigned int v22 = [v15 isEqualToString:v19];

      if (!v22)
      {
        BOOL v13 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassGroupingProfile ingestedDate](self, "ingestedDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 ingestedDate]);
    if (!PKEqualObjects(v21, v20))
    {
      BOOL v13 = 0;
LABEL_32:

      goto LABEL_33;
    }

    uint64_t v32 = objc_claimAutoreleasedReturnValue(-[PDPassGroupingProfile relevantDates](self, "relevantDates"));
    if (v32 || (v28 = (void *)objc_claimAutoreleasedReturnValue([v7 relevantDates])) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassGroupingProfile relevantDates](self, "relevantDates"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v7 relevantDates]);
      v31 = v23;
      if (!objc_msgSend(v23, "isEqualToArray:"))
      {
        BOOL v13 = 0;
        goto LABEL_27;
      }

      int v29 = 1;
    }

    else
    {
      v28 = 0LL;
      int v29 = 0;
    }

    unsigned int v24 = -[PDPassGroupingProfile isNFCEnabled](self, "isNFCEnabled");
    if (v24 != [v7 isNFCEnabled])
    {
      BOOL v13 = 0;
      v25 = (void *)v32;
      if (!v29)
      {
LABEL_29:
        if (v25)
        {
LABEL_31:

          goto LABEL_32;
        }

- (NSString)passTypeID
{
  return self->_passTypeID;
}

- (NSString)groupingID
{
  return self->_groupingID;
}

- (void)setGroupingID:(id)a3
{
}

- (int64_t)passStyle
{
  return self->_passStyle;
}

- (void)setPassStyle:(int64_t)a3
{
  self->_passStyle = a3;
}

- (NSArray)relevantDates
{
  return self->_relevantDates;
}

- (void)setRelevantDates:(id)a3
{
}

- (NSDate)ingestedDate
{
  return self->_ingestedDate;
}

- (void)setIngestedDate:(id)a3
{
}

- (BOOL)isNFCEnabled
{
  return self->_nfcEnabled;
}

- (void)setNFCEnabled:(BOOL)a3
{
  self->_nfcEnabled = a3;
}

- (unint64_t)passType
{
  return self->_passType;
}

- (void).cxx_destruct
{
}

@end