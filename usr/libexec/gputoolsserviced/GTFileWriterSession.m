@interface GTFileWriterSession
+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
@end

@implementation GTFileWriterSession

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 compressionAlgorithm];
  v13 = &off_100030158;
  if (v12) {
    v13 = off_100030150;
  }
  id v14 = [(id)objc_opt_class(*v13) sessionWithFileEntries:v11 relativeToURL:v10 options:v9 error:a6];
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

@end