@interface WiFiUsageLQMTriggerCriteria
+ (NSArray)dataTriggeredTypes;
+ (id)parseCriteria:(id)a3 intoRequiredFields:(id)a4 andFeatures:(id)a5 forFields:(id)a6 withType:(id)a7 isFilter:(BOOL)a8;
+ (id)predicateNoQuotes:(id)a3;
+ (void)initialize;
- (BOOL)matched;
- (BOOL)valid;
- (NSDate)currentSample;
- (NSDate)firstTriggered;
- (NSDate)lastTriggered;
- (NSPredicate)predicate;
- (NSPredicate)requiredFieldsValid;
- (NSString)bssid;
- (NSString)filterCriteria;
- (WiFiUsageLQMTriggerCriteria)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (id)shortPredicate;
- (id)shortPredicateNoSpaces;
- (id)typeAsString;
- (unint64_t)type;
- (void)setBssid:(id)a3;
- (void)setCurrentSample:(id)a3;
- (void)setFilterCriteria:(id)a3;
- (void)setFirstTriggered:(id)a3;
- (void)setLastTriggered:(id)a3;
- (void)setMatched:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setRequiredFieldsValid:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation WiFiUsageLQMTriggerCriteria

+ (void)initialize
{
  id v2 = objc_alloc_init(MEMORY[0x189607848]);
  v3 = (void *)_dateFormatter;
  _dateFormatter = (uint64_t)v2;

  [(id)_dateFormatter setDateFormat:@"HH:mm:ss"];
}

+ (NSArray)dataTriggeredTypes
{
  return (NSArray *)&unk_18A1B57E0;
}

- (WiFiUsageLQMTriggerCriteria)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v51 = a4;
  id v52 = a5;
  v54 = v7;
  [v7 objectForKey:@"type"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes](&OBJC_CLASS___WiFiUsageLQMTriggerCriteria, "dataTriggeredTypes");
    [v7 objectForKey:@"type"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v9 indexOfObject:v10];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v50 = (void *)objc_opt_new();
      v13 = (void *)objc_opt_class();
      [v7 objectForKey:@"type"];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v49 = [v13 parseCriteria:v7 intoRequiredFields:v50 andFeatures:v52 forFields:v51 withType:v14 isFilter:0];

      v15 = (void *)v49;
      if (!v49)
      {
        v12 = 0LL;
LABEL_30:

        goto LABEL_31;
      }

      objc_msgSend(MEMORY[0x1896079C8], "predicateWithFormat:");
      v48 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
      [v50 anyObject];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v18 = (void *)objc_opt_new();
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        id v19 = v50;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v61;
          do
          {
            for (uint64_t i = 0LL; i != v20; ++i)
            {
              if (*(void *)v61 != v21) {
                objc_enumerationMutation(v19);
              }
              [MEMORY[0x1896079C8] predicateWithFormat:@"%@ != nil", *(void *)(*((void *)&v60 + 1) + 8 * i)];
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 addObject:v23];
            }

            uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
          }

          while (v20);
        }

        uint64_t v24 = [MEMORY[0x189607820] andPredicateWithSubpredicates:v18];
      }

      else
      {
        [v50 anyObject];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char v26 = objc_opt_isKindOfClass();

        if ((v26 & 1) == 0)
        {
          v35 = 0LL;
          goto LABEL_29;
        }

        v27 = (void *)objc_opt_new();
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        id v28 = v50;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v57;
          do
          {
            for (uint64_t j = 0LL; j != v29; ++j)
            {
              if (*(void *)v57 != v30) {
                objc_enumerationMutation(v28);
              }
              v32 = *(void **)(*((void *)&v56 + 1) + 8 * j);
              if ([v27 length]) {
                v33 = @" OR ";
              }
              else {
                v33 = &stru_18A170410;
              }
              [v32 fieldName];
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              [v27 appendFormat:@"%@$x.fieldName == \"%@\"", v33, v34];
            }

            uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v64 count:16];
          }

          while (v29);
        }

        [MEMORY[0x189607940] stringWithFormat:@"SUBQUERY(SELF, $x, $x.median != nil AND (%@)).@count == %lu", v27, objc_msgSend(v28, "count")];
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v24 = [MEMORY[0x1896079C8] predicateWithFormat:v18];
      }

      v35 = (NSPredicate *)v24;

LABEL_29:
      v55.receiver = self;
      v55.super_class = (Class)&OBJC_CLASS___WiFiUsageLQMTriggerCriteria;
      v36 = -[WiFiUsageLQMTriggerCriteria init](&v55, sel_init);
      v37 = +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes](&OBJC_CLASS___WiFiUsageLQMTriggerCriteria, "dataTriggeredTypes");
      [v54 objectForKey:@"type"];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v36->_type = [v37 indexOfObject:v38];

      predicate = v36->_predicate;
      v36->_predicate = v48;
      v40 = v48;

      requiredFieldsValid = v36->_requiredFieldsValid;
      v36->_requiredFieldsValid = v35;
      v42 = v35;

      v36->_matched = 0;
      firstTriggered = v36->_firstTriggered;
      v36->_firstTriggered = 0LL;

      lastTriggered = v36->_lastTriggered;
      v36->_lastTriggered = 0LL;

      currentSample = v36->_currentSample;
      v36->_currentSample = 0LL;

      bssid = v36->_bssid;
      v36->_bssid = 0LL;

      self = v36;
      v12 = self;
      v15 = (void *)v49;
      goto LABEL_30;
    }
  }

  NSLog( @"%s -  Failed to parse (Criteria does not contain key 'type' or 'type' is not supported): %@",  "-[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]",  v7);
  NSLog(@"%s -  Failed to parse: %@", "-[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]", v7);
  v12 = 0LL;
LABEL_31:

  return v12;
}

- (id)typeAsString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectAtIndexedSubscript:self->_type];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)shortPredicate
{
  id v2 = self;
  -[NSPredicate predicateFormat](self->_predicate, "predicateFormat");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x189607A00];
  objc_msgSend(MEMORY[0x189607A00], "escapedPatternForString:", @"SUBQUERY(SELF, $x, $x.fieldName == \"");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 regularExpressionWithPattern:v5 options:1 error:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v6,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v3,  0,  0,  objc_msgSend(v3, "length"),  &stru_18A170410);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x189607A00];
  [MEMORY[0x189607A00] escapedPatternForString:@" AND $x."];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 regularExpressionWithPattern:v9 options:1 error:0];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v10,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v7,  0,  0,  objc_msgSend(v7, "length"),  @"_");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x189607A00];
  [MEMORY[0x189607A00] escapedPatternForString:@".@count > 0"]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 regularExpressionWithPattern:v13 options:1 error:0];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v14,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v11,  0,  0,  objc_msgSend(v11, "length"),  &stru_18A170410);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607A00] regularExpressionWithPattern:@"(\\w+)_(\\w+)" options:1 error:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v16,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v15,  0,  0,  objc_msgSend(v15, "length"),  @"$2_$1");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)NSString;
  [v2 filterCriteria];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    uint64_t v20 = (void *)NSString;
    [v2 filterCriteria];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 stringWithFormat:@" (where %@)", v2];
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v21 = &stru_18A170410;
  }

  [v18 stringWithFormat:@"%@%@", v17, v21];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
  }

  return v22;
}

- (id)shortPredicateNoSpaces
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)MEMORY[0x189607A00];
  [MEMORY[0x189607A00] escapedPatternForString:@" "];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 regularExpressionWithPattern:v4 options:1 error:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v5,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v2,  0,  0,  objc_msgSend(v2, "length"),  &stru_18A170410);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateNoQuotes:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x189607A00];
  [MEMORY[0x189607A00] escapedPatternForString:@"\""];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 regularExpressionWithPattern:v5 options:1 error:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend( v6,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v3,  0,  0,  objc_msgSend(v3, "length"),  &stru_18A170410);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  id v3 = (void *)0x189607000LL;
  v4 = (void *)NSString;
  v5 = -[WiFiUsageLQMTriggerCriteria shortPredicate](self, "shortPredicate");
  uint64_t v21 = v4;
  if (self->_valid)
  {
    if (self->_matched) {
      v6 = @"True";
    }
    else {
      v6 = @"False";
    }
  }

  else
  {
    v6 = @"N/A";
  }

  bssid = self->_bssid;
  v8 = (void *)NSString;
  firstTriggered = self->_firstTriggered;
  if (firstTriggered)
  {
    BOOL v20 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      uint64_t v10 = [(id)_dateFormatter stringFromDate:firstTriggered];
    }

    else
    {
      uint64_t v10 = (uint64_t)self->_firstTriggered;
    }

    id v19 = (void *)v10;
    [v8 stringWithFormat:@"triggering since %@", v10];
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v20 = 0;
    uint64_t v11 = &stru_18A170410;
  }

  lastTriggered = self->_lastTriggered;
  if (lastTriggered)
  {
    v13 = (void *)NSString;
    BOOL v14 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      [(id)_dateFormatter stringFromDate:lastTriggered];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v3 = lastTriggered;
    }

    [v13 stringWithFormat:@"until %@", v3];
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v14 = 0;
    v15 = &stru_18A170410;
  }

  [v8 stringWithFormat:@"%@ %@", v11, v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 stringWithFormat:@"%@ on %@ matched:%@ %@", v5, bssid, v6, v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (lastTriggered) {
  if (v14)
  }

  if (firstTriggered) {
  if (v20)
  }

  return v17;
}

- (id)redactedDescription
{
  id v3 = (void *)0x189607000LL;
  v4 = (void *)NSString;
  v5 = -[WiFiUsageLQMTriggerCriteria shortPredicate](self, "shortPredicate");
  if (self->_valid)
  {
    if (self->_matched) {
      v6 = @"True";
    }
    else {
      v6 = @"False";
    }
  }

  else
  {
    v6 = @"N/A";
  }

  id v7 = (void *)NSString;
  firstTriggered = self->_firstTriggered;
  if (firstTriggered)
  {
    BOOL v19 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      uint64_t v9 = [(id)_dateFormatter stringFromDate:firstTriggered];
    }

    else
    {
      uint64_t v9 = (uint64_t)self->_firstTriggered;
    }

    v18 = (void *)v9;
    [v7 stringWithFormat:@"triggering since %@", v9];
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v19 = 0;
    uint64_t v10 = &stru_18A170410;
  }

  lastTriggered = self->_lastTriggered;
  if (lastTriggered)
  {
    v12 = (void *)NSString;
    BOOL v13 = _dateFormatter != 0;
    if (_dateFormatter)
    {
      [(id)_dateFormatter stringFromDate:lastTriggered];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v3 = lastTriggered;
    }

    [v12 stringWithFormat:@"until %@", v3];
    BOOL v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v13 = 0;
    BOOL v14 = &stru_18A170410;
  }

  [v7 stringWithFormat:@"%@ %@", v10, v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"%@ on <redacted> matched:%@ %@", v5, v6, v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (lastTriggered) {
  if (v13)
  }

  if (firstTriggered) {
  if (v19)
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_opt_new();
  [v4 setType:self->_type];
  [v4 setPredicate:self->_predicate];
  [v4 setRequiredFieldsValid:self->_requiredFieldsValid];
  [v4 setValid:self->_valid];
  [v4 setMatched:self->_matched];
  [v4 setFirstTriggered:self->_firstTriggered];
  [v4 setLastTriggered:self->_lastTriggered];
  [v4 setCurrentSample:self->_currentSample];
  [v4 setBssid:self->_bssid];
  [v4 setFilterCriteria:self->_filterCriteria];
  return v4;
}

+ (id)parseCriteria:(id)a3 intoRequiredFields:(id)a4 andFeatures:(id)a5 forFields:(id)a6 withType:(id)a7 isFilter:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v57 = a6;
  v16 = (__CFString *)a7;
  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", @"AND", @"&&", @"OR", @"||", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", @"NOT", @"!", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  @"=",  @"==",  @">=",  @"=>",  @"<=",  @"=<",  @">",  @"<",  @"!=",  @"<>",  @"contains",  0);
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKey:@"test"];
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    [v13 objectForKey:@"test"];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v54 = v8;
    if (([v18 containsObject:v21] & 1) == 0
      && ![v17 containsObject:v21])
    {
      uint64_t v30 = v14;
      if ([v19 containsObject:v21]
        && ([v13 objectForKey:@"field"],
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            v33,
            v33))
      {
        [v13 objectForKey:@"threshold"];
        id v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 objectForKey:@"field"];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v34 hasSuffix:@"PerSecond"])
        {
          uint64_t v35 = objc_msgSend( v34,  "substringToIndex:",  objc_msgSend(v34, "length") - objc_msgSend(@"PerSecond", "length"));

          v34 = (void *)v35;
        }

        if ([v57 containsObject:v34])
        {
          v53 = v15;
          uint64_t v49 = v34;
          if (v54)
          {

            v16 = @"value";
          }

          v22 = v17;
          v36 = +[WiFiUsageLQMTriggerCriteria dataTriggeredTypes]( &OBJC_CLASS___WiFiUsageLQMTriggerCriteria,  "dataTriggeredTypes");
          uint64_t v37 = [v36 indexOfObject:v16];

          v23 = v19;
          if (!v37)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              v47 = @"%@ %@ '%@'";
            }
            else {
              v47 = @"%@ %@ %@";
            }
            v39 = v49;
            objc_msgSend(NSString, "stringWithFormat:", v47, v49, v21, v51);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            id v15 = v53;
            if (v30) {
              [v30 addObject:v49];
            }
            goto LABEL_43;
          }

          id v15 = v53;
          if (v37 == 1)
          {
            [NSString stringWithFormat:@"SUBQUERY(SELF,$x,$x.fieldName == %@ AND $x.median %@ %@).@count > 0", v49, v21, v51];
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = -[WiFiUsageLQMFeature initWithField:andPerSecond:]( objc_alloc(&OBJC_CLASS___WiFiUsageLQMFeature),  "initWithField:andPerSecond:",  v49,  +[WiFiUsageLQMSample isPerSecond:](&OBJC_CLASS___WiFiUsageLQMSample, "isPerSecond:", v49));
            if (v53) {
              [v53 addObject:v38];
            }
            if (v30) {
              [v30 addObject:v38];
            }

            v39 = v49;
            goto LABEL_43;
          }

          NSLog( @"%s -  Failed to parse (Comparison criteria has wrong type): %@",  "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]",  v13);
          v45 = v49;
          v46 = v51;
        }

        else
        {
          v22 = v17;
          v23 = v19;
          NSLog( @"%s -  Failed to parse (Comparison criteria on non-existing field '%@'): %@",  "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]",  v34,  v13);
          v45 = v34;
          v46 = v51;
        }
      }

      else
      {
        v22 = v17;
        v23 = v19;
        NSLog( @"%s -  Failed to parse (Comparison criteria has wrong format): %@",  "+[WiFiUsageLQMTriggerCriteria parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:]",  v13);
      }

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSPredicate)requiredFieldsValid
{
  return self->_requiredFieldsValid;
}

- (void)setRequiredFieldsValid:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)matched
{
  return self->_matched;
}

- (void)setMatched:(BOOL)a3
{
  self->_matched = a3;
}

- (NSDate)firstTriggered
{
  return self->_firstTriggered;
}

- (void)setFirstTriggered:(id)a3
{
}

- (NSDate)lastTriggered
{
  return self->_lastTriggered;
}

- (void)setLastTriggered:(id)a3
{
}

- (NSDate)currentSample
{
  return self->_currentSample;
}

- (void)setCurrentSample:(id)a3
{
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void)setFilterCriteria:(id)a3
{
}

- (void).cxx_destruct
{
}

@end