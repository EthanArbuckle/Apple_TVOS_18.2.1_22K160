@interface NSXPCConnection
- (NSSet)conversationServiceEntitlements;
@end

@implementation NSXPCConnection

- (NSSet)conversationServiceEntitlements
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self,  "valueForEntitlement:",  @"com.apple.FaceTime.FTConversationService"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

    v3 = (void *)v6;
  }

  return (NSSet *)v3;
}

@end