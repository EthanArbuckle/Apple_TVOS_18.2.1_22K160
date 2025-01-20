@interface BatchQueryInfo
+ (id)descriptor;
- (id)diagnosticsJsonDictionary;
@end

@implementation BatchQueryInfo

- (id)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[BatchQueryInfo status](self, "status")));
  [v3 setObject:v4 forKeyedSubscript:@"status"];

  if (-[BatchQueryInfo hasUriWitness](self, "hasUriWitness"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryInfo uriWitness](self, "uriWitness"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 diagnosticsJsonDictionary]);
    [v3 setObject:v6 forKeyedSubscript:@"uriWitness"];
  }

  if (-[BatchQueryInfo hasMapEntry](self, "hasMapEntry"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryInfo mapEntry](self, "mapEntry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 diagnosticsJsonDictionary]);
    [v3 setObject:v8 forKeyedSubscript:@"mapEntry"];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryInfo pendingSmtsArray](self, "pendingSmtsArray", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[SignedMutationTimestamp signedTypeWithObject:]( &OBJC_CLASS___SignedMutationTimestamp,  "signedTypeWithObject:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v14)));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 diagnosticsJsonDictionary]);
        [v9 addObject:v16];

        v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  if ([v9 count]) {
    [v3 setObject:v9 forKeyedSubscript:@"pendingSmts"];
  }

  return v3;
}

+ (id)descriptor
{
  id v2 = (id)qword_1002EEA68;
  if (!qword_1002EEA68)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___BatchQueryInfo,  @"BatchQueryInfo",  &unk_1002E54D0,  &off_1002E5668,  4LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C4F7];
    qword_1002EEA68 = (uint64_t)v2;
  }

  return v2;
}

@end