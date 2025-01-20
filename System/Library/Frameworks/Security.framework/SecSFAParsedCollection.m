@interface SecSFAParsedCollection
- (BOOL)excludedVersion;
- (NSMutableDictionary)allowedEvents;
- (NSMutableDictionary)matchingRules;
- (void)setAllowedEvents:(id)a3;
- (void)setExcludedVersion:(BOOL)a3;
- (void)setMatchingRules:(id)a3;
@end

@implementation SecSFAParsedCollection

- (NSMutableDictionary)matchingRules
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setMatchingRules:(id)a3
{
}

- (NSMutableDictionary)allowedEvents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAllowedEvents:(id)a3
{
}

- (BOOL)excludedVersion
{
  return self->_excludedVersion;
}

- (void)setExcludedVersion:(BOOL)a3
{
  self->_excludedVersion = a3;
}

- (void).cxx_destruct
{
}

@end