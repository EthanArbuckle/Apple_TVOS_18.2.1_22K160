@interface RMConfigurationPayloadReference
- (id)reportDetails;
@end

@implementation RMConfigurationPayloadReference

- (id)reportDetails
{
  v15[0] = @"activation";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPayloadReference activation](self, "activation"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 identifier]);
  v5 = (void *)v4;
  if (v4) {
    v6 = (const __CFString *)v4;
  }
  else {
    v6 = @"(not present)";
  }
  v16[0] = v6;
  v15[1] = @"configuration";
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPayloadReference configuration](self, "configuration"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 identifier]);
  v9 = (void *)v8;
  if (v8) {
    v10 = (const __CFString *)v8;
  }
  else {
    v10 = @"(not present)";
  }
  v16[1] = v10;
  v15[2] = @"configurationIdentifier";
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationPayloadReference configurationIdentifier](self, "configurationIdentifier"));
  v16[2] = v11;
  v15[3] = @"required";
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[RMConfigurationPayloadReference required](self, "required")));
  v16[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  4LL));

  return v13;
}

@end