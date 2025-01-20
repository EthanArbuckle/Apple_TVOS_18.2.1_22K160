@interface DEKeyboardExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEKeyboardExtension

- (id)attachmentsForParameters:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"]);
  if ([v4 BOOLValue])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @".*",  1LL,  0LL));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Keyboard"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[DEKeyboardExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v6,  v5,  0LL));

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Keyboard/Typology"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[DEKeyboardExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v8,  v5,  0LL));

    if ([v9 count])
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 arrayByAddingObjectsFromArray:v9]);

      v7 = (void *)v10;
    }
  }

  else
  {
    v7 = &__NSArray0__struct;
  }

  return v7;
}

@end