@interface NSError(CoreBluetooth)
+ (id)errorWithInfo:()CoreBluetooth;
@end

@implementation NSError(CoreBluetooth)

+ (id)errorWithInfo:()CoreBluetooth
{
  id v3 = a3;
  [v3 objectForKeyedSubscript:@"kCBMsgArgResult"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = @"CBErrorDomain";
  [MEMORY[0x189603FC8] dictionary];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v4 integerValue];
  if (v7 > 901)
  {
    if (v7 > 1501)
    {
      if (v7 <= 1899)
      {
        switch(v7)
        {
          case 1800LL:
            v13 = @"CBInternalErrorDomain";

            v8 = @"Invalid PSM";
            uint64_t v10 = 21LL;
            v5 = v13;
            break;
          case 1801LL:
            v60 = @"CBInternalErrorDomain";

            v8 = @"PSM already registered";
            uint64_t v10 = 22LL;
            v5 = v60;
            break;
          case 1802LL:
            v61 = @"CBInternalErrorDomain";

            v8 = @"No resources available for L2CAP";
            uint64_t v10 = 23LL;
            v5 = v61;
            break;
          case 1803LL:
            v62 = @"CBInternalErrorDomain";

            v8 = @"L2CAP PSM already connected";
            uint64_t v10 = 24LL;
            v5 = v62;
            break;
          case 1804LL:
            v63 = @"CBInternalErrorDomain";

            v8 = @"No such L2CAP connection";
            uint64_t v10 = 25LL;
            v5 = v63;
            break;
          case 1805LL:
            v64 = @"CBInternalErrorDomain";

            v8 = @"L2CAP - failed to register socket pipe";
            uint64_t v10 = 26LL;
            v5 = v64;
            break;
          default:
            switch(v7)
            {
              case 1700LL:
                v15 = @"CBInternalErrorDomain";

                v8 = @"No remoteId/stableId";
                uint64_t v10 = 33LL;
                v5 = v15;
                break;
              case 1701LL:
                v68 = @"CBInternalErrorDomain";

                v8 = @"WHB Device not found";
                uint64_t v10 = 48LL;
                v5 = v68;
                break;
              case 1702LL:
                v69 = @"CBInternalErrorDomain";

                v8 = @"WHB Device is not enabled";
                uint64_t v10 = 49LL;
                v5 = v69;
                break;
              case 1703LL:
                v70 = @"CBInternalErrorDomain";

                v8 = @"WHB Connection is interuppted";
                uint64_t v10 = 51LL;
                v5 = v70;
                break;
              default:
                if (v7 == 1502)
                {
                  v18 = @"CBInternalErrorDomain";

                  v8 = @"Current client did not configure RSSI detection for this device. Client cannot change existing configuration from a different client";
                  uint64_t v10 = 20LL;
                  v5 = v18;
                }

                else
                {
LABEL_129:
                  if (objc_msgSend(v4, "integerValue", v8) < 1001 || objc_msgSend(v4, "integerValue") > 1255)
                  {
                    if (CBLogInitOnce != -1) {
                      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
                    }
                    v73 = (void *)CBLogComponent;
                    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
                      +[NSError(CoreBluetooth) errorWithInfo:].cold.1(v73, v4);
                    }
LABEL_136:
                    uint64_t v10 = 0LL;
                    v8 = @"Unknown error.";
                  }

                  else
                  {
                    v72 = @"CBATTErrorDomain";

                    uint64_t v10 = [v4 integerValue] - 1000;
                    v8 = @"Unknown ATT error.";
                    v5 = v72;
                  }
                }

                break;
            }

            break;
        }
      }

      else if (v7 <= 2499)
      {
        switch(v7)
        {
          case 1900LL:
            v14 = @"CBInternalErrorDomain";

            v8 = @"RFCOMM invalid channel ID";
            uint64_t v10 = 27LL;
            v5 = v14;
            break;
          case 1901LL:
            v65 = @"CBInternalErrorDomain";

            v8 = @"No such RFCOMM connection";
            uint64_t v10 = 28LL;
            v5 = v65;
            break;
          case 1902LL:
            v66 = @"CBInternalErrorDomain";

            v8 = @"RFCOMM channel already connected";
            uint64_t v10 = 29LL;
            v5 = v66;
            break;
          case 1903LL:
            v67 = @"CBInternalErrorDomain";

            v8 = @"RFCOMM - failed to register socket pipe";
            uint64_t v10 = 30LL;
            v5 = v67;
            break;
          default:
            if (v7 == 2000)
            {
              v34 = @"CBInternalErrorDomain";

              v8 = @"Peer LEA connection stalled";
LABEL_127:
              uint64_t v10 = 15LL;
              v5 = v34;
            }

            else
            {
              if (v7 != 2200) {
                goto LABEL_129;
              }
              v17 = @"CBInternalErrorDomain";

              v8 = @"Failed to resolve address with provided IRK";
              uint64_t v10 = 41LL;
              v5 = v17;
            }

            break;
        }
      }

      else
      {
        switch(v7)
        {
          case 2500LL:
            v12 = @"CBInternalErrorDomain";

            v8 = @"Peer removed pairing information for the pipe";
            uint64_t v10 = 52LL;
            v5 = v12;
            break;
          case 2501LL:
            v54 = @"CBInternalErrorDomain";

            v8 = @"The Pipe connection has timed out unexpectedly";
            uint64_t v10 = 53LL;
            v5 = v54;
            break;
          case 2502LL:
            v55 = @"CBInternalErrorDomain";

            v8 = @"The specified device has disconnected the pipe";
            uint64_t v10 = 54LL;
            v5 = v55;
            break;
          case 2503LL:
            v56 = @"CBInternalErrorDomain";

            v8 = @"Pipe MIC failure";
            uint64_t v10 = 55LL;
            v5 = v56;
            break;
          case 2504LL:
            v57 = @"CBInternalErrorDomain";

            v8 = @"The Pipe connection has failed unexpectedly";
            uint64_t v10 = 56LL;
            v5 = v57;
            break;
          case 2505LL:
            v58 = @"CBInternalErrorDomain";

            v8 = @"Peer removed service using the pipe";
            uint64_t v10 = 57LL;
            v5 = v58;
            break;
          case 2506LL:
            v59 = @"CBInternalErrorDomain";

            v8 = @"Local device unregistered service using the pipe";
            uint64_t v10 = 58LL;
            v5 = v59;
            break;
          default:
            goto LABEL_129;
        }
      }
    }

    else
    {
      switch(v7)
      {
        case 902LL:
        case 905LL:
          v8 = @"The specified UUID is not allowed for this operation.";
          uint64_t v10 = 8LL;
          break;
        case 903LL:
        case 904LL:
        case 906LL:
        case 907LL:
        case 908LL:
        case 909LL:
        case 910LL:
        case 911LL:
        case 912LL:
        case 913LL:
        case 916LL:
        case 917LL:
        case 918LL:
        case 919LL:
        case 920LL:
        case 921LL:
        case 922LL:
        case 923LL:
        case 924LL:
        case 925LL:
        case 926LL:
        case 927LL:
        case 928LL:
        case 929LL:
        case 930LL:
        case 931LL:
        case 932LL:
        case 933LL:
        case 934LL:
        case 935LL:
        case 936LL:
        case 937LL:
        case 938LL:
        case 939LL:
        case 940LL:
        case 941LL:
        case 942LL:
        case 943LL:
        case 944LL:
        case 945LL:
        case 946LL:
        case 947LL:
        case 948LL:
        case 949LL:
        case 950LL:
        case 951LL:
        case 952LL:
        case 953LL:
        case 954LL:
        case 955LL:
        case 956LL:
        case 957LL:
        case 958LL:
        case 959LL:
        case 960LL:
        case 961LL:
        case 962LL:
        case 963LL:
        case 964LL:
        case 965LL:
        case 966LL:
        case 967LL:
        case 968LL:
        case 969LL:
        case 970LL:
        case 971LL:
        case 972LL:
        case 973LL:
        case 974LL:
        case 975LL:
        case 976LL:
        case 977LL:
        case 978LL:
        case 979LL:
        case 980LL:
        case 981LL:
        case 982LL:
        case 983LL:
        case 984LL:
        case 985LL:
        case 986LL:
        case 987LL:
        case 988LL:
        case 989LL:
        case 990LL:
        case 991LL:
        case 992LL:
        case 993LL:
        case 994LL:
        case 995LL:
        case 996LL:
        case 997LL:
        case 998LL:
        case 999LL:
        case 1000LL:
        case 1018LL:
          goto LABEL_129;
        case 914LL:
          v19 = @"CBInternalErrorDomain";

          v8 = @"LE Connection update failed - same params";
          uint64_t v10 = 45LL;
          v5 = v19;
          break;
        case 915LL:
          v20 = @"CBInternalErrorDomain";

          v8 = @"Combined connection latency for device not as requested";
          uint64_t v10 = 46LL;
          v5 = v20;
          break;
        case 1001LL:
          v21 = @"CBATTErrorDomain";

          v8 = @"The handle is invalid.";
LABEL_75:
          uint64_t v10 = 1LL;
          v5 = v21;
          break;
        case 1002LL:
          v22 = @"CBATTErrorDomain";

          v8 = @"Reading is not permitted.";
LABEL_77:
          uint64_t v10 = 2LL;
          v5 = v22;
          break;
        case 1003LL:
          v23 = @"CBATTErrorDomain";

          v8 = @"Writing is not permitted.";
LABEL_79:
          uint64_t v10 = 3LL;
          v5 = v23;
          break;
        case 1004LL:
          v24 = @"CBATTErrorDomain";

          v8 = @"The command is invalid.";
LABEL_81:
          uint64_t v10 = 4LL;
          v5 = v24;
          break;
        case 1005LL:
          v25 = @"CBATTErrorDomain";

          v8 = @"Authentication is insufficient.";
LABEL_83:
          uint64_t v10 = 5LL;
          v5 = v25;
          break;
        case 1006LL:
          v26 = @"CBATTErrorDomain";

          v8 = @"The request is not supported.";
LABEL_85:
          uint64_t v10 = 6LL;
          v5 = v26;
          break;
        case 1007LL:
          v27 = @"CBATTErrorDomain";

          v8 = @"The offset is invalid.";
LABEL_87:
          uint64_t v10 = 7LL;
          v5 = v27;
          break;
        case 1008LL:
          v28 = @"CBATTErrorDomain";

          v8 = @"Authorization is insufficient.";
LABEL_61:
          uint64_t v10 = 8LL;
          v5 = v28;
          break;
        case 1009LL:
          v29 = @"CBATTErrorDomain";

          v8 = @"The prepare queue is full.";
LABEL_63:
          uint64_t v10 = 9LL;
          v5 = v29;
          break;
        case 1010LL:
          v11 = @"CBATTErrorDomain";

          v8 = @"The attribute could not be found.";
LABEL_37:
          uint64_t v10 = 10LL;
          v5 = v11;
          break;
        case 1011LL:
          v30 = @"CBATTErrorDomain";

          v8 = @"The attribute is not long.";
LABEL_68:
          uint64_t v10 = 11LL;
          v5 = v30;
          break;
        case 1012LL:
          v31 = @"CBATTErrorDomain";

          v8 = @"The encryption key size is insufficient.";
LABEL_57:
          uint64_t v10 = 12LL;
          v5 = v31;
          break;
        case 1013LL:
          v32 = @"CBATTErrorDomain";

          v8 = @"The value's length is invalid.";
          goto LABEL_46;
        case 1014LL:
          v33 = @"CBATTErrorDomain";

          v8 = @"Unlikely error.";
LABEL_100:
          uint64_t v10 = 14LL;
          v5 = v33;
          break;
        case 1015LL:
          v34 = @"CBATTErrorDomain";

          v8 = @"Encryption is insufficient.";
          goto LABEL_127;
        case 1016LL:
          v35 = @"CBATTErrorDomain";

          v8 = @"The group type is unsupported.";
LABEL_72:
          uint64_t v10 = 16LL;
          v5 = v35;
          break;
        case 1017LL:
          v36 = @"CBATTErrorDomain";

          v8 = @"Resources are insufficient.";
LABEL_70:
          uint64_t v10 = 17LL;
          v5 = v36;
          break;
        case 1019LL:
          v32 = @"CBInternalErrorDomain";

          v8 = @"Peer failed to respond to ATT value indication";
LABEL_46:
          uint64_t v10 = 13LL;
          v5 = v32;
          break;
        default:
          if (v7 == 1500)
          {
            v71 = @"CBInternalErrorDomain";

            v8 = @"RSSI Detection already configured for this device";
            uint64_t v10 = 18LL;
            v5 = v71;
          }

          else
          {
            if (v7 != 1501) {
              goto LABEL_129;
            }
            v16 = @"CBInternalErrorDomain";

            v8 = @"Cannot remove RSSI detection configuration. Not configured for this device.";
            uint64_t v10 = 19LL;
            v5 = v16;
          }

          break;
      }
    }

+ (void)errorWithInfo:()CoreBluetooth .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 integerValue];
  _os_log_error_impl(&dword_186F9B000, v3, OS_LOG_TYPE_ERROR, "WARNING: Unknown error: %ld", (uint8_t *)&v4, 0xCu);
}

+ (void)errorWithInfo:()CoreBluetooth .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_186F9B000, log, OS_LOG_TYPE_DEBUG, "Received lame BT_ERROR", v1, 2u);
}

@end