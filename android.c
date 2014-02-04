/*
 * Android specific stuff
 */
#include "syshead.h"

#ifdef ANDROID

#include "misc.h"
#include "android.h"

void
env_set_add_android (struct env_set *es)
{
  const char *and_env_name[] = { "ANDROID_ASSETS",
                                 "ANDROID_BOOTLOGO",
                                 "ANDROID_CACHE",
                                 "ANDROID_DATA",
                                 "ANDROID_PROPERTY_WORKSPACE",
                                 "ANDROID_ROOT",
                                 "BOOTCLASSPATH",
                                 "EXTERNAL_STORAGE",
                                 "SD_EXT_DIRECTORY"
                               };
  const int and_env_count = sizeof(and_env_name) / sizeof(*and_env_name);
  char *and_env_value[and_env_count];

  int i;
  for (i = 0; i < and_env_count; i++) {
    char *name = and_env_name[i];
    char *value = getenv(name);
    if (value && *value)
        setenv_str (es, name, value);
  }
}

#endif // ANDROID
