LABEL_5:
    v8 = -10800LL;
LABEL_8:
    v2->_cutOffSeconds = v8;
  }

  return v2;
}

LABEL_21:
  v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v37 = v6;
  v21 = -[NSMutableArray mutableCopy](v6, "mutableCopy");
  [v21 sortUsingComparator:&stru_100004190];
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v21;
  v22 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v22)
  {
    v23 = v22;
    v24 = *(void *)v40;
    do
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 lastPathComponent]);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[DECrashLogsExtension shortname:](self, "shortname:", v28));

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v20, "objectForKey:", v29));
        if (!v30) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", &off_100004388, v29);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v29));
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v31 integerValue] + 1));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v32, v29);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v29));
        v34 = (uint64_t)[v33 integerValue];

        if (v34 >= 6) {
          -[NSMutableArray removeObject:](v37, "removeObject:", v26);
        }
      }

      v23 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }

    while (v23);
  }

  return v37;
}

int64_t sub_100002AF0(id a1, id a2, id a3)
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a2 path]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", NSURLCreationDateKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 resourceValuesForKeys:v6 error:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSURLCreationDateKey]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", NSURLCreationDateKey));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 resourceValuesForKeys:v10 error:0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:NSURLCreationDateKey]);

  id v13 = [v12 compare:v8];
  return (int64_t)v13;
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}