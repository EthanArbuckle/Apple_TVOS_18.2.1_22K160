LABEL_20:
LABEL_21:
        v27 = SYDGetAccountsLog();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v13;
          _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "Notifying daemon about account change for AppleAccount %@",  buf,  0xCu);
        }

        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_34BC;
        v29[3] = &unk_40E0;
        v30 = v13;
        +[SYDClientToDaemonConnection processAccountChangesWithCompletionHandler:]( &OBJC_CLASS___SYDClientToDaemonConnection,  "processAccountChangesWithCompletionHandler:",  v29);

        break;
      case 3:
        v26 = SYDGetAccountsLog();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v8;
          v20 = "User signed out of account %@";
LABEL_19:
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
        }

        goto LABEL_20;
      case 5:
        goto LABEL_21;
      default:
        goto LABEL_24;
    }

    goto LABEL_24;
  }

  v15 = objc_msgSend(v12, "aa_isAccountClass:", AAAccountClassFull);

  if ((v15 & 1) != 0) {
    goto LABEL_9;
  }
LABEL_25:
}

void sub_34BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SYDGetAccountsLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_3638(a1, (uint64_t)v3, v6);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    sub_35C4(a1, v6);
  }
}

  ;
}

void sub_3544(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl( &dword_0,  log,  OS_LOG_TYPE_DEBUG,  "Processing account change type=%d for AppleAccount %@",  (uint8_t *)v3,  0x12u);
  sub_353C();
}

void sub_35C4(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl( &dword_0,  a2,  OS_LOG_TYPE_DEBUG,  "Finished notifying daemon about account change for %@",  (uint8_t *)&v3,  0xCu);
  sub_353C();
}

void sub_3638(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Error notifying daemon about account change for %@: %@",  (uint8_t *)&v4,  0x16u);
  sub_353C();
}

id objc_msgSend_processAccountChangesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAccountChangesWithCompletionHandler:");
}