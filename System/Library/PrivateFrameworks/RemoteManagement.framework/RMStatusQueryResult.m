@interface RMStatusQueryResult
- (BOOL)hasStatusToReport;
- (NSDictionary)errorByKeyPath;
- (NSDictionary)statusByKeyPath;
- (NSSet)statusKeyPaths;
- (RMStatusQueryResult)init;
- (RMStatusQueryResult)initWithStatusKeyPaths:(id)a3 statusByKeyPath:(id)a4 errorByKeyPath:(id)a5;
- (id)protocolStatusReportWithFullReport:(BOOL)a3;
@end

@implementation RMStatusQueryResult

- (RMStatusQueryResult)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  v4 = -[RMStatusQueryResult initWithStatusKeyPaths:statusByKeyPath:errorByKeyPath:]( self,  "initWithStatusKeyPaths:statusByKeyPath:errorByKeyPath:",  v3,  &__NSDictionary0__struct,  &__NSDictionary0__struct);

  return v4;
}

- (RMStatusQueryResult)initWithStatusKeyPaths:(id)a3 statusByKeyPath:(id)a4 errorByKeyPath:(id)a5
{
  id v8 = a3;
  id v56 = a4;
  id v55 = a5;
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___RMStatusQueryResult;
  v9 = -[RMStatusQueryResult init](&v70, "init");
  if (v9)
  {
    v10 = (NSSet *)[v8 copy];
    statusKeyPaths = v9->_statusKeyPaths;
    v49 = v9;
    v9->_statusKeyPaths = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v53 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v50 = v8;
    id obj = v8;
    id v57 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v57)
    {
      uint64_t v54 = *(void *)v67;
      v52 = v12;
      do
      {
        for (i = 0LL; i != v57; i = (char *)i + 1)
        {
          if (*(void *)v67 != v54) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(id *)(*((void *)&v66 + 1) + 8LL * (void)i);
          v15 = (char *)[v14 rangeOfString:@"/"];
          if (v16)
          {
            v17 = v15;
            uint64_t v18 = v16;
            id v19 = (id)objc_claimAutoreleasedReturnValue([v14 substringToIndex:v15]);
            id v20 = (id)objc_claimAutoreleasedReturnValue([v14 substringFromIndex:&v17[v18]]);
          }

          else
          {
            id v19 = 0LL;
            id v20 = 0LL;
          }

          id v21 = v19;
          id v22 = v20;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v14]);
          if (v21)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v56 valueForKeyPath:v21]);
            v58 = (void *)objc_claimAutoreleasedReturnValue([v24 allKeys]);
            v25 = v23;
            v26 = (void *)objc_claimAutoreleasedReturnValue([v24 allValues]);
            v59 = v22;
            v27 = (void *)objc_claimAutoreleasedReturnValue([v26 valueForKeyPath:v22]);

            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v27));
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v29));
            unsigned int v31 = [v28 isEqualToSet:v30];

            v23 = v25;
            if (v31 && v25)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v25, v14);
              v12 = v52;
              v32 = v58;
              id v22 = v59;
            }

            else
            {
              v12 = v52;
              sub_10002F938(v52, v21);
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKeyPath:](v52, "valueForKeyPath:", v21));
              v60[0] = _NSConcreteStackBlock;
              v60[1] = 3221225472LL;
              v60[2] = sub_10005E264;
              v60[3] = &unk_1000BA8B0;
              id v22 = v59;
              id v61 = v59;
              id v62 = v27;
              id v63 = v36;
              id v64 = v21;
              v65 = v53;
              id v37 = v36;
              v32 = v58;
              [v58 enumerateObjectsUsingBlock:v60];
            }
          }

          else
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v56 valueForKeyPath:v14]);
            if (v24) {
              BOOL v33 = 1;
            }
            else {
              BOOL v33 = v23 == 0LL;
            }
            if (v33)
            {
              uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSError);
              if ((objc_opt_isKindOfClass(v24, v34) & 1) != 0)
              {
                id v35 = [v24 copy];
                -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v35, v14);
              }

              else
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue( +[RMJSONSerialization serializeValue:]( &OBJC_CLASS___RMJSONSerialization,  "serializeValue:",  v24));
                if (v38)
                {
                  v39 = v23;
                  v40 = (void *)objc_claimAutoreleasedReturnValue([v14 pathExtension]);
                  id v41 = [v40 length];

                  if (v41)
                  {
                    v42 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByDeletingPathExtension]);
                    sub_10002F938(v12, v42);
                  }

                  -[NSMutableDictionary setValue:forKeyPath:](v12, "setValue:forKeyPath:", v38, v14, v49);
                  v23 = v39;
                }

                else if (v24)
                {
                  v43 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnsupportedStatusValueErrorWithKeyPath:]( &OBJC_CLASS___RMErrorUtilities,  "createUnsupportedStatusValueErrorWithKeyPath:",  v14));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v43, v14);
                }
              }
            }

            else
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v23, v14);
            }
          }
        }

        id v57 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
      }

      while (v57);
    }

    v44 = (NSDictionary *)-[NSMutableDictionary copy](v12, "copy");
    v9 = v49;
    statusByKeyPath = v49->_statusByKeyPath;
    v49->_statusByKeyPath = v44;

    v46 = (NSDictionary *)-[NSMutableDictionary copy](v53, "copy");
    errorByKeyPath = v49->_errorByKeyPath;
    v49->_errorByKeyPath = v46;

    id v8 = v50;
  }

  return v9;
}

- (BOOL)hasStatusToReport
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusQueryResult statusByKeyPath](self, "statusByKeyPath"));
  if ([v3 count])
  {
    BOOL v4 = 1;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusQueryResult errorByKeyPath](self, "errorByKeyPath"));
    BOOL v4 = [v5 count] != 0;
  }

  return v4;
}

- (NSSet)statusKeyPaths
{
  return self->_statusKeyPaths;
}

- (NSDictionary)statusByKeyPath
{
  return self->_statusByKeyPath;
}

- (NSDictionary)errorByKeyPath
{
  return self->_errorByKeyPath;
}

- (void).cxx_destruct
{
}

- (id)protocolStatusReportWithFullReport:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusQueryResult statusByKeyPath](self, "statusByKeyPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusQueryResult errorByKeyPath](self, "errorByKeyPath"));
  if ([v6 count])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10005E82C;
    v12[3] = &unk_1000BA8D8;
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v13 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
  }

  else
  {
    v7 = (NSMutableArray *)&__NSArray0__struct;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelAnyPayload buildFromDictionary:](&OBJC_CLASS___RMModelAnyPayload, "buildFromDictionary:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[RMProtocolStatusReport requestWithStatusItems:errors:fullReport:]( &OBJC_CLASS___RMProtocolStatusReport,  "requestWithStatusItems:errors:fullReport:",  v8,  v7,  v9));

  return v10;
}

@end