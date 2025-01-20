@interface PathEntry
+ (id)bundlePathsWithinEntries:(id)a3;
+ (id)bundlePathsWithinEntries:(id)a3 withExtension:(id)a4;
+ (id)bundlePathsWithinEntries:(id)a3 withExtension:(id)a4 andNames:(id)a5;
+ (id)entryWithPath:(id)a3;
+ (id)entryWithPath:(id)a3 recursive:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPathEntry:(id)a3;
- (BOOL)recursive;
- (NSString)path;
- (PathEntry)initWithPath:(id)a3;
- (PathEntry)initWithPath:(id)a3 recursive:(BOOL)a4;
- (id)description;
- (void)setPath:(id)a3;
- (void)setRecursive:(BOOL)a3;
@end

@implementation PathEntry

- (PathEntry)initWithPath:(id)a3
{
  return -[PathEntry initWithPath:recursive:](self, "initWithPath:recursive:", a3, 0LL);
}

- (PathEntry)initWithPath:(id)a3 recursive:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PathEntry;
  v8 = -[PathEntry init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    v9->_recursive = a4;
  }

  return v9;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PathEntry path](self, "path"));
  unsigned int v7 = -[PathEntry recursive](self, "recursive");
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ <path: %@, recursive: %@>",  v5,  v6,  v8));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PathEntry *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }

  else if (v4 && (uint64_t v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    BOOL v7 = -[PathEntry isEqualToPathEntry:](self, "isEqualToPathEntry:", v5);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToPathEntry:(id)a3
{
  v4 = (PathEntry *)a3;
  if (self == v4) {
    goto LABEL_4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PathEntry path](self, "path"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PathEntry path](v4, "path"));
  if (![v5 isEqualToString:v6])
  {

    goto LABEL_6;
  }

  unsigned int v7 = -[PathEntry recursive](self, "recursive");
  unsigned int v8 = -[PathEntry recursive](v4, "recursive");

  if (v7 != v8)
  {
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }

+ (id)entryWithPath:(id)a3
{
  id v3 = a3;
  v4 = -[PathEntry initWithPath:](objc_alloc(&OBJC_CLASS___PathEntry), "initWithPath:", v3);

  return v4;
}

+ (id)entryWithPath:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = -[PathEntry initWithPath:recursive:](objc_alloc(&OBJC_CLASS___PathEntry), "initWithPath:recursive:", v5, v4);

  return v6;
}

+ (id)bundlePathsWithinEntries:(id)a3
{
  return [a1 bundlePathsWithinEntries:a3 withExtension:0 andNames:0];
}

+ (id)bundlePathsWithinEntries:(id)a3 withExtension:(id)a4
{
  return [a1 bundlePathsWithinEntries:a3 withExtension:a4 andNames:0];
}

+ (id)bundlePathsWithinEntries:(id)a3 withExtension:(id)a4 andNames:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v7 && [v7 count])
  {
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    id v62 = v7;
    id obj = v7;
    id v67 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
    if (!v67) {
      goto LABEL_71;
    }
    if (v8) {
      BOOL v11 = v9 == 0LL;
    }
    else {
      BOOL v11 = 1;
    }
    int v12 = !v11;
    int v69 = v12;
    id v65 = v9;
    uint64_t v66 = *(void *)v84;
    id v70 = v8;
    v64 = v10;
    while (1)
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v84 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v68 = v13;
        v14 = *(void **)(*((void *)&v83 + 1) + 8 * v13);
        unsigned int v15 = [v14 recursive];
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
        if (!v15)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v16 contentsOfDirectoryAtPath:v17 error:0]);

          if (v69)
          {
            if ([v8 length])
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
              __int128 v79 = 0u;
              __int128 v80 = 0u;
              __int128 v81 = 0u;
              __int128 v82 = 0u;
              id v34 = v9;
              id v35 = [v34 countByEnumeratingWithState:&v79 objects:v89 count:16];
              if (v35)
              {
                id v36 = v35;
                uint64_t v37 = *(void *)v80;
                do
                {
                  for (i = 0LL; i != v36; i = (char *)i + 1)
                  {
                    if (*(void *)v80 != v37) {
                      objc_enumerationMutation(v34);
                    }
                    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  *(void *)(*((void *)&v79 + 1) + 8LL * (void)i),  v8));
                    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF MATCHES %@",  v39));
                    v41 = (void *)objc_claimAutoreleasedReturnValue([v18 filteredArrayUsingPredicate:v40]);
                    [v33 addObjectsFromArray:v41];

                    id v8 = v70;
                  }

                  id v36 = [v34 countByEnumeratingWithState:&v79 objects:v89 count:16];
                }

                while (v36);
                goto LABEL_53;
              }

              goto LABEL_54;
            }
          }

          else if (!v9)
          {
            if (v8 && [v8 length])
            {
              id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @".%@", v8));
              v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF ENDSWITH %@",  v34));
              v33 = (void *)objc_claimAutoreleasedReturnValue([v18 filteredArrayUsingPredicate:v58]);
            }

            else
            {
              id v34 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"pathExtension.length > 0"));
              v33 = (void *)objc_claimAutoreleasedReturnValue([v18 filteredArrayUsingPredicate:v34]);
            }

            goto LABEL_54;
          }

          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          id v34 = v9;
          id v42 = [v34 countByEnumeratingWithState:&v75 objects:v88 count:16];
          if (v42)
          {
            id v43 = v42;
            uint64_t v44 = *(void *)v76;
            do
            {
              for (j = 0LL; j != v43; j = (char *)j + 1)
              {
                if (*(void *)v76 != v44) {
                  objc_enumerationMutation(v34);
                }
                v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.",  *(void *)(*((void *)&v75 + 1) + 8LL * (void)j)));
                v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF BEGINSWITH %@",  v46));
                v48 = (void *)objc_claimAutoreleasedReturnValue([v18 filteredArrayUsingPredicate:v47]);
                [v33 addObjectsFromArray:v48];
              }

              id v43 = [v34 countByEnumeratingWithState:&v75 objects:v88 count:16];
            }

            while (v43);
            id v8 = v70;
LABEL_53:
            v10 = v64;
            id v9 = v65;
          }

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (void).cxx_destruct
{
}

@end