@interface BKAccessibility
+ (BOOL)_isDisplayBacklightOff;
+ (BOOL)_objectWithinProximity;
+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3;
+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4;
+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3;
+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4;
+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5;
+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5 secureName:(unsigned int)a6;
+ (void)_accessibilityProcessExternHIDEvent:(__IOHIDEvent *)a3;
+ (void)_accessibilitySetEventTapCallback:(void *)a3;
+ (void)_accessibilitySetHIDEventTapCallback:(void *)a3;
+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7;
+ (void)_setCapsLockLightOn:(BOOL)a3;
@end

@implementation BKAccessibility

+ (void)_accessibilityProcessExternHIDEvent:(__IOHIDEvent *)a3
{
  id v4 = [BKHIDSystemInterface sharedInstance];
  [v4 injectHIDEvent:a3];
}

+ (void)_accessibilitySetEventTapCallback:(void *)a3
{
}

+ (void)_accessibilitySetHIDEventTapCallback:(void *)a3
{
}

+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3
{
  result.y = v4;
  result.x = v3;
  return result;
}

+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3
{
  result.y = v4;
  result.x = v3;
  return result;
}

+ (CGPoint)_displayConvertFromCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v5 = [CAWindowServer server];
  v6 = [v5 displayWithDisplayId:v4];
  v7 = [v6 uniqueId];
  sub_10001A778(v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

+ (CGPoint)_displayConvertToCAScreen:(CGPoint)a3 withDisplayIntegerId:(unsigned int)a4
{
  uint64_t v4 = a4;
  v5 = [CAWindowServer server];
  v6 = (void *)[v5 displayWithDisplayId:v4];
  v7 = [v6 uniqueId];
  sub_10001A6E4(v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

+ (void)_applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  double y = a3.y;
  double x = a3.x;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  BKHIDEventProcessorRegistry *v15 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDDirectTouchEventProcessor *v17 = [v15 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
  id v18 = v17;

  [v18 applyExtendedHitTestInformationForCAScreenCoordinates:v14 displayUUID:v13 toPathAttributes:v7 secureName:v12 excludeContextIDs:x, y];
}

+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5
{
  return _objc_msgSend( a1,  "_authenticationMessageForLocationInCAScreenCoordinates:eventType:excludeContextIDsFromHitTest:secureName:",  *(void *)&a4,  a5,  0,  a3.x,  a3.y);
}

+ (id)_authenticationMessageForLocationInCAScreenCoordinates:(CGPoint)a3 eventType:(unsigned int)a4 excludeContextIDsFromHitTest:(id)a5 secureName:(unsigned int)a6
{
  uint64_t v6 = a6;
  double y = a3.y;
  double x = a3.x;
  id v10 = a5;
  BKSHIDEventDigitizerPathAttributes *v11 = [[BKSHIDEventDigitizerPathAttributes alloc] init];
  [a1 _applyExtendedHitTestInformationForCAScreenCoordinates:0 displayUUID:v11 toPathAttributes:v6 secureName:v10 excludeContextIDs:x, y];

  id v12 = [v11 authenticationMessage];
  return v12;
}

+ (BOOL)_objectWithinProximity
{
  v2 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDProximityEventProcessor *v4 = [v2 eventProcessorOfClass:[BKHIDProximityEventProcessor class]];
  v5 = [v4 autorelease];

  LOBYTE(v2) = [v5 isObjectWithinProximity];
  return (char)v2;
}

+ (BOOL)_isDisplayBacklightOff
{
  float v2 = *(float *)&dword_1000DBF94;
  os_unfair_lock_unlock(&stru_1000DBF90);
  return v2 == 0.0;
}

+ (void)_setCapsLockLightOn:(BOOL)a3
{
  BOOL v3 = a3;
  BKHIDEventProcessorRegistry *v4 = [BKHIDEventProcessorRegistry sharedInstance];
  BKKeyboardHIDEventProcessor *v6 = [v4 eventProcessorOfClass:[BKKeyboardHIDEventProcessor class]];
  id v7 = v6;

  [v7 setCapsLockLightOn:v3];
}

@end