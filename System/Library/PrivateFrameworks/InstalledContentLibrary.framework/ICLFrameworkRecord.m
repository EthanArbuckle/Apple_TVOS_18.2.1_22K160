@interface ICLFrameworkRecord
- (id)legacyRecordDictionary;
@end

@implementation ICLFrameworkRecord

- (id)legacyRecordDictionary
{
  v3 = (void *)objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ICLFrameworkRecord;
  v4 = -[ICLBundleRecord legacyRecordDictionary](&v7, sel_legacyRecordDictionary);
  [v3 addEntriesFromDictionary:v4];

  [v3 setObject:@"Framework" forKeyedSubscript:@"ApplicationType"];
  v5 = (void *)[v3 copy];

  return v5;
}

@end