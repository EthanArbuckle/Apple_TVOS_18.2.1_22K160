@interface UMTestCommand
+ (BOOL)executeWithOutError:(id *)a3;
+ (NSArray)examples;
+ (NSArray)subcommands;
+ (NSString)description;
+ (NSString)name;
+ (id)_spaceForDepth:(unint64_t)a3;
+ (id)helpDetailsForDepth:(unint64_t)a3;
@end

@implementation UMTestCommand

+ (NSString)name
{
  return 0LL;
}

+ (NSString)description
{
  return 0LL;
}

+ (NSArray)examples
{
  return 0LL;
}

+ (id)_spaceForDepth:(unint64_t)a3
{
  return i;
}

+ (id)helpDetailsForDepth:(unint64_t)a3
{
  v5 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableString, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _spaceForDepth:a3]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _spaceForDepth:a3 + 1]);
    unint64_t v9 = a3 + 2;
    v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _spaceForDepth:a3 + 2]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 name]);
    [v5 appendFormat:@"%@%@%@", v7, v11, @"\n"];

    uint64_t v12 = objc_claimAutoreleasedReturnValue([a1 description]);
    v13 = (void *)v12;
    if (v12) {
      [v5 appendFormat:@"%@Description: %@%@", v8, v12, @"\n"];
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue([a1 examples]);
    v40 = v14;
    if (v14)
    {
      v15 = v14;
      if ([v14 count])
      {
        v32 = v13;
        v34 = v8;
        v36 = v7;
        v38 = v6;
        [v5 appendFormat:@"%@Examples:%@", v8, @"\n"];
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v46;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v46 != v19) {
                objc_enumerationMutation(v16);
              }
              [v5 appendFormat:@"%@%@%@", v10, *(void *)(*((void *)&v45 + 1) + 8 * (void)i), @"\n"];
            }

            id v18 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
          }

          while (v18);
        }

        v7 = v36;
        v6 = v38;
        v13 = v32;
        v8 = v34;
      }
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([a1 subcommands]);
    v22 = v21;
    if (v21 && [v21 count])
    {
      v33 = v13;
      v35 = v8;
      v37 = v7;
      v39 = v6;
      [v5 appendFormat:@"%@%@Subcommands:%@", @"\n", v8, @"\n"];
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      v31 = v22;
      id v23 = v22;
      id v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v42;
        do
        {
          for (j = 0LL; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v41 + 1) + 8 * (void)j) helpDetailsForDepth:v9]);
            [v5 appendFormat:@"%@%@", @"\n", v28];
          }

          id v25 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }

        while (v25);
      }

      v7 = v37;
      v6 = v39;
      v13 = v33;
      v8 = v35;
      v22 = v31;
    }

    id v29 = [v5 copy];
  }

  else
  {
    id v29 = 0LL;
  }

  return v29;
}

+ (NSArray)subcommands
{
  return 0LL;
}

+ (BOOL)executeWithOutError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](&OBJC_CLASS___UMTestArguments, "getNextArgument"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 subcommands]);
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
      unsigned __int8 v13 = [v12 isEqualToString:v5];

      if ((v13 & 1) != 0) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    unsigned __int8 v14 = [v11 executeWithOutError:a3];

    if ((v14 & 1) == 0) {
      goto LABEL_12;
    }
    BOOL v15 = 1;
  }

  else
  {
LABEL_9:

LABEL_12:
    +[UMTestArguments goToPreviousArgument](&OBJC_CLASS___UMTestArguments, "goToPreviousArgument");
    BOOL v15 = 0;
  }

  return v15;
}

@end