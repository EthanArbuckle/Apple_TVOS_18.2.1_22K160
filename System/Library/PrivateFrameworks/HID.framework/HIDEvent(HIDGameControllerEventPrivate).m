@interface HIDEvent(HIDGameControllerEventPrivate)
- (uint64_t)gameControllerButtonL4;
- (uint64_t)gameControllerButtonM1;
- (uint64_t)gameControllerButtonM2;
- (uint64_t)gameControllerButtonM3;
- (uint64_t)gameControllerButtonM4;
- (uint64_t)gameControllerButtonR4;
- (uint64_t)gameControllerDirectionPadDown;
- (uint64_t)gameControllerDirectionPadLeft;
- (uint64_t)gameControllerDirectionPadRight;
- (uint64_t)gameControllerDirectionPadUp;
- (uint64_t)gameControllerFaceButtonA;
- (uint64_t)gameControllerFaceButtonB;
- (uint64_t)gameControllerFaceButtonX;
- (uint64_t)gameControllerFaceButtonY;
- (uint64_t)gameControllerJoyStickAxisRz;
- (uint64_t)gameControllerJoyStickAxisX;
- (uint64_t)gameControllerJoyStickAxisY;
- (uint64_t)gameControllerJoyStickAxisZ;
- (uint64_t)gameControllerShoulderButtonL1;
- (uint64_t)gameControllerShoulderButtonL2;
- (uint64_t)gameControllerShoulderButtonR1;
- (uint64_t)gameControllerShoulderButtonR2;
- (uint64_t)gameControllerThumbstickButtonLeft;
- (uint64_t)gameControllerThumbstickButtonRight;
- (uint64_t)gameControllerType;
- (uint64_t)setGameControllerButtonL4:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonM1:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonM2:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonM3:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonM4:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonR4:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerDirectionPadDown:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerDirectionPadLeft:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerDirectionPadRight:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerDirectionPadUp:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerFaceButtonA:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerFaceButtonB:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerFaceButtonX:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerFaceButtonY:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerJoyStickAxisRz:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerJoyStickAxisX:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerJoyStickAxisY:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerJoyStickAxisZ:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerShoulderButtonL1:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerShoulderButtonL2:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerShoulderButtonR1:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerShoulderButtonR2:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerThumbstickButtonLeft:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerThumbstickButtonRight:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerType:()HIDGameControllerEventPrivate;
@end

@implementation HIDEvent(HIDGameControllerEventPrivate)

- (uint64_t)gameControllerButtonL4
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerButtonL4:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerButtonM1
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerButtonM1:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerButtonM2
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerButtonM2:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerButtonM3
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerButtonM3:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerButtonM4
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerButtonM4:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerButtonR4
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerButtonR4:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerDirectionPadDown
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerDirectionPadDown:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerDirectionPadLeft
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerDirectionPadLeft:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerDirectionPadRight
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerDirectionPadRight:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerDirectionPadUp
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerDirectionPadUp:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerFaceButtonA
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerFaceButtonA:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerFaceButtonB
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerFaceButtonB:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerFaceButtonX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerFaceButtonX:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerFaceButtonY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerFaceButtonY:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerJoyStickAxisRz
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerJoyStickAxisRz:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerJoyStickAxisX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerJoyStickAxisX:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerJoyStickAxisY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerJoyStickAxisY:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerJoyStickAxisZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerJoyStickAxisZ:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerShoulderButtonL1
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerShoulderButtonL1:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerShoulderButtonL2
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerShoulderButtonL2:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerShoulderButtonR1
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerShoulderButtonR1:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerShoulderButtonR2
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setGameControllerShoulderButtonR2:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)gameControllerThumbstickButtonLeft
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGameControllerThumbstickButtonLeft:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)gameControllerThumbstickButtonRight
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGameControllerThumbstickButtonRight:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)gameControllerType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGameControllerType:()HIDGameControllerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end