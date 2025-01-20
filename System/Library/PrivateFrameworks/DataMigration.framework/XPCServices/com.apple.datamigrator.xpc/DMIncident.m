@interface DMIncident
+ (id)incidentWithKind:(unsigned int)a3 responsiblePluginRep:(id)a4 userDataDisposition:(id)a5 details:(id)a6;
- (DMPluginFileSystemRep)responsiblePluginRep;
- (NSDate)date;
- (NSString)details;
- (NSString)diagnosticMessage;
- (unsigned)kind;
@end

@implementation DMIncident

+ (id)incidentWithKind:(unsigned int)a3 responsiblePluginRep:(id)a4 userDataDisposition:(id)a5 details:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_alloc_init(&OBJC_CLASS___DMIncident);
  v13->_kind = a3;
  objc_storeStrong((id *)&v13->_responsiblePluginRep, a4);
  v14 = (NSString *)[v12 copy];
  details = v13->_details;
  v13->_details = v14;

  uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  date = v13->_date;
  v13->_date = (NSDate *)v16;

  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v19 = v18;
  if (v12) {
    -[NSMutableArray addObject:](v18, "addObject:", v12);
  }
  if (v11)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[DMUserDataDispositionManager descriptionFromDispositionFlags:]( &OBJC_CLASS___DMUserDataDispositionManager,  "descriptionFromDispositionFlags:",  +[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:]( &OBJC_CLASS___DMUserDataDispositionManager,  "dispositionFlagsFromDispositionDict:",  v11)));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)", v20));
      -[NSMutableArray addObject:](v19, "addObject:", v21);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"previousBuildVersion"]);
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(prev build %@)",  v22));
      -[NSMutableArray addObject:](v19, "addObject:", v23);
    }
  }

  uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v19, "componentsJoinedByString:", @" "));
  diagnosticMessage = v13->_diagnosticMessage;
  v13->_diagnosticMessage = (NSString *)v24;

  return v13;
}

- (unsigned)kind
{
  return self->_kind;
}

- (DMPluginFileSystemRep)responsiblePluginRep
{
  return self->_responsiblePluginRep;
}

- (NSString)details
{
  return self->_details;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)diagnosticMessage
{
  return self->_diagnosticMessage;
}

- (void).cxx_destruct
{
}

@end